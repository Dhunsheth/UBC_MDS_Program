# for reproducibility
set.seed(582)
see.plot <- TRUE

# out data:
x = 10
n = 50
dat <- list(heads=x, size=n)

# hyper-parameters for our prior:
a.prior = 12
b.prior = 12
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

# To avoid numerical problems, we'll calculate them on the log-scale
logPrior <- function(theta, params = hparams) {
  dbeta(theta, shape1=params$alpha, shape2=params$beta, log = TRUE)
}

logLike <- function(theta, D = dat){
  dbinom(D$heads, size = D$size, prob = theta, log = TRUE)
  #same as log(choose(n,x)*theta^x*(1-theta)^(n-x))
}

# calculates the log(unormalized posterior)
logPosterior <- function(theta, params=hparams, D=dat){
  logPrior(theta, params = params) + logLike(theta, D = dat)
}

# On the non-log scale:
prior <- function(x){
  # we will always use the hyperparmeters = a.prior and b.prior
  exp(logPrior(x)) 
}

likelihood <- function(x){
  # we will always data of 10 heads in 50 flips
  exp(logLike(x)) 
}

# unormalize posterior
upost <- function(x){
  # we will always use the hyperparmeters = a.prior and b.prior
  # we will always data of 10 heads in 50 flips
  exp(logPosterior(x))
}

#################
#    Plots      #   
#################

if (see.plot){
  par(mfrow=c(1,3))
  curve(upost(x),  lwd=2, ylab = 'Unormalized Posterior', col=4)
  curve(prior(x),  lwd=2, ylab = 'Prior', col=2)
  curve(likelihood(x), lwd = 2, ylab = 'Likelihood', col="ForestGreen")
}

# save(chain, file="MetropolisChain.RData")

#################
#    MCMC      #   
#################



# set the number of desired iterations
iterations = 10000

# set up the starting value for theta:
theta.t = 0.5 # equal to prior mean priorStats$mean
  
# set the propsal width:
pwidth = 0.1
  
# initialize our chain that will store the values of theta at each iteration
chain <- NULL
chain[1] <- theta.t

for (i in 1:iterations){
  
  # propose a new value for theta
  theta.new <- rnorm(1, chain[i], pwidth) 
  
  # If theta.new falls outside of [0,1], then reject it with prob 1
  if (theta.new>1 | theta.new<0){
    aprob <- 0
  } else {
    # calculate the acceptance probability 
    aprob <- min(upost(theta.new)/upost(chain[i]),1)
  }
  
  # generate a random number from U(0,1)
  u <- runif(1)
  
  # If the u > aprob, accept theta.new. 
  # Otherwise, accept it with probability aprob
  if (runif(1) < aprob){ 
    chain[i+1] <- theta.new
  } else { 
    # If theta.new is rejected, we stay at
    # the current state theta.t
    chain[i+1] <- chain[i]
  }
}

# pdf(file="TracePlot10000.pdf", height = 4)
if (FALSE){
  plot(chain, type="l", ylab=expression(theta^(t)), xlab="Iteration", main ="Trace plot")
}
# dev.off()

# save(chain, "MetropolisChain.RData")

