# for reproducibility
set.seed(582)
see.plot <- FALSE

# out data:
x = 9
n = 10
dat <- list(x=x, size=n)

# hyper-parameters for our prior:
a.prior = 2
b.prior = 3
hparams <- list(alpha = a.prior, beta=b.prior)

# define a function for finding the mean of a beta:
betaStats <- function(alpha, beta){
  mean = alpha/(alpha + beta)
  variance = (alpha*beta)/((alpha + beta)^2*(alpha+beta+1))
  out <- list(mean=mean, var = variance)
  return(out)
}

# I will initialize the MCMC at the prior mean:
priorStats <- betaStats(alpha=a.prior, beta=b.prior)
priorStats

########################################
# Define functions for calculating the #
# prior and the likelihood #############
########################################

# unormalize posterior
upost <- function(x){
  # we will always use the hyperparmeters = a.prior and b.prior
  # we will always data of 10 x in 50 flips
  exp(logPosterior(x))
}


#################
#    MCMC      #   
#################



# set the number of desired iterations
nIter = 10000

# set up the starting value for theta:
theta.t = 0.5 # equal to prior mean priorStats$mean

# set the propsal width:
pwidth = 0.1

# initialize our chain that will store the values of theta at each iteration
chain <- NULL
chain[1] <- theta.t

for (i in 1:nIter){
  
  # propose a new value for theta
  theta.current <- chain[i]
  theta.new <- rnorm(1, theta.current, pwidth) 
  
  # If theta.new falls outside of [0,1], then reject it with prob 1
  if (theta.new>1 | theta.new<0){
    aprob <- 0
  } else {
    # Compute likelihood  of current and proposed theta        
    likelihood_current = dbinom(dat$x, size = dat$size, prob = theta.current)
    likelihood_proposal = dbinom(dat$x, size = dat$size, prob = theta.new)
    
    # Compute prior probability of current and proposed theta        
    prior_current = dbeta(theta.current, hparams$alpha, hparams$beta)
    prior_proposal = dbeta(theta.new, hparams$alpha, hparams$beta)
    
    # calculate the acceptance probability 
    p_current = likelihood_current * prior_current
    p_proposal = likelihood_proposal * prior_proposal
    r <- p_proposal/p_current
    aprob <- min(r,1)
  }
  
  # generate a random number from U(0,1)
  u <- runif(1)
  
  # If the u > aprob, accept theta.new. 
  # Otherwise, accept it with probability aprob
  if (u < aprob){ 
    chain[i+1] <- theta.new
  } else { 
    # If theta.new is rejected, we stay at
    # the current state theta.t
    chain[i+1] <- chain[i]
  }
}

# setwd("/Users/ivrbik/Library/CloudStorage/OneDrive-UBC/Teaching/Courses/BayesianInference_Data582/github2022/my_data585/data_582_instructor/labs/lab3/")
# save(chain, file = "BetaBinomialChain.RData")



#################
#    Plots      #   
#################

par(mfrow=c(2,2))

upost <- function(x) {
  dbinom(dat$x, size = dat$size, prob = x)*
    dbeta(x, hparams$alpha, hparams$beta)
}
curve(upost(x),  lwd=2, ylab = 'Unormalized Posterior', col=4)
curve(dbeta(x, hparams$alpha, hparams$beta),  lwd=2, ylab = 'Prior', col=2)
curve(dbinom(dat$x, size = dat$size, prob = x), lwd = 2, ylab = 'Likelihood', col="ForestGreen")
plot(chain, type="l", ylab=expression(theta^(t)), xlab="Iteration", main ="Trace plot")


par(mfrow=c(1,1))
burnin = 1:200
hist(chain[-burnin], freq = FALSE, main="Posterior Simulation")
aa = hparams$alpha+dat$x
bb = hparams$beta+dat$size - dat$x
curve(dbeta(x, aa, bb), add =TRUE, col = 2, lwd = 2)
legend("topleft", lty=1, col =2 , bty = "n", lwd = 2,
       legend = paste("Beta(", aa, ", ", bb,")"))
d <- density(chain[-burnin])
polygon(d, col=adjustcolor("#009e74", alpha.f=0.5), border='ForestGreen', lty = 2)

