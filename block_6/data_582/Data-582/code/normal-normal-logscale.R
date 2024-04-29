# for reproducibility
set.seed(582)

sigma2 = 1                    # known population variance
sig = sqrt(sigma2)            # known population SD

# our data:
ys = c(3.2, 2.2, 3.6, 4.1)    # individual obs
ybar <- mean(ys)              # sufficient statistics
n <- length(ys)               # sample size
dat <- list(mean = ybar, nobs = n)

# hyper-parameters for our prior:
m = 0                   # prior mean
s = .5                  # prior sd
var.prior = s^2         # prior variance
hparams <- list(m = m, s = s)


#################
#    MCMC      #   
#################

# set the number of desired iterations
nIter = 10000

# set up the starting value for theta:
theta.t = 100

# set the proposal width:
pwidth = 0.5

# initialize our chain that will store the values of theta at each iteration
chain <- NULL
chain[1] <- theta.t

for (i in 1:nIter){
  
  # propose a new value for theta
  theta.current <- chain[i]
  theta.new <- rnorm(1, theta.current, pwidth) 
  
  # Compute likelihood  of current and proposed theta        
  loglikelihood_current = dnorm(theta.current, mean = dat$mean, sd = sig/sqrt(n)
                             , log = TRUE)
  loglikelihood_proposal = dnorm(theta.new, mean = dat$mean, sd = sig/sqrt(n)
                              ,log = TRUE)
  
  # Compute prior probability of current and proposed theta        
  logprior_current = dnorm(theta.current, hparams$m, hparams$s
                        , log = TRUE)
  logprior_proposal = dnorm(theta.new, hparams$m, hparams$s
                         , log = TRUE)
  
  # calculate the acceptance probability 
  logp_current = loglikelihood_current + logprior_current
  logp_proposal = loglikelihood_proposal + logprior_proposal
  
  # calculate the acceptance probability 
  logr <- logp_proposal - logp_current
  logaprob <- min(logr,log(1))
  
  # generate a random number from U(0,1)
  u <- runif(1)
  
  # If the u > aprob, accept theta.new. 
  # Otherwise, accept it with probability aprob
  if (log(u) < logaprob){ 
    chain[i+1] <- theta.new
  } else { 
    # If theta.new is rejected, we stay at
    # the current state theta.t
    chain[i+1] <- chain[i]
  }
}

# setwd("/Users/ivrbik/Library/CloudStorage/OneDrive-UBC/Teaching/Courses/BayesianInference_Data582/github2022/my_data585/data_582_instructor/labs/lab3/")
# save(chain, file = "NormalNormalChainlog.RData")



#################
#    Plots      #   
#################

par(mfrow=c(2,2))
# create a function for the unnormalized posterior for ease of plotting:
upost <- function(x){
  dnorm(x, mean = dat$mean, sd = sig/sqrt(n))*
    dnorm(x, hparams$m, hparams$s)
}

curve(upost(x),  lwd=2, ylab = 'Unormalized Posterior', col=4, from = -2, to = 5)
curve(dnorm(x, hparams$m, hparams$s),  lwd=2, ylab = 'Prior', col=2, from = -2, to = 5)
curve(dnorm(x, mean = dat$mean, sd = sig/sqrt(n)), lwd = 2, ylab = 'Likelihood', col="ForestGreen",from = -2, to = 5)
plot(chain, type="l", ylab=expression(theta^(t)), xlab="Iteration", main ="Trace plot")


par(mfrow=c(1,1))
burnin = 1:600
hist(chain[-burnin], freq = FALSE, main="Posterior Simulation")
mupost = m*sig^2/(n*s^2 + sig^2) + ybar*n*s^2/(n*s^2 + sig^2)
sigpost = sqrt(s^2*sig^2/(n*s^2 + sig^2))
varpost = sigpost^2
curve(dnorm(x, mupost, sigpost), add =TRUE, col = 2, lwd = 2)
legend("topleft", lty=1, col =2 , bty = "n",
       legend = paste("N(", round(mupost,3), ", ", round(sigpost,3),")"))
d <- density(chain[-burnin])
polygon(d, col=adjustcolor("#009e74", alpha.f=0.5), border='ForestGreen', lty = 2)

