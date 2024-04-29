###################################################
### Lecture 4 code:
###################################################

save.pdf <- FALSE

#------------------------------
# Tug of war examples revisted
#------------------------------

avec <- c(26, 9, 76, 1)
bvec <- c(26, 9, 76, 1)

for (i in 1:length(avec)){
   y = 7; n=50       # number of success; number of Bernoulli trials
   a = avec[i]       # prior beta alpha parameter value (shape1)
   b = bvec[i]       # prior beta beta parameter value (shape2)
   aa = a +y         # posterior beta parameter value (shape1)
   bb = b + n -y     # posterior beta parameter values (shape2)
   
   name <- paste("tugofwar",i,"_ptEsts.pdf", sep="")
   if (save.pdf) pdf(name, height=4.5)
   
   # to determine a good y.lim for the plot
   post.mode <- (aa-1)/(aa + bb - 2)
   y.height <- 1.1*dbeta(post.mode, aa, bb)
   
   # plot the posterior:
   curve(dbeta(x, shape1 = aa, shape2 = bb), xlab=expression(theta),
         lwd=2, col="turquoise2", ylab="", xlim=c(0,1), ylim= c(0,y.height))
   # plot the prior:
   curve(dbeta(x, a, b), lwd=2, col="dodgerblue4",lty=2, add=TRUE)
   # plot the likelihood:
   curve(dbeta(x, y+1, n-y+1), lwd= 2, col=2, lty =2 , add=TRUE)
   
   prior.name <- paste("Beta(", a, ", ", b,") Prior",sep="")
   legend("topright", legend = c(prior.name, "Likelihood", "Posterior"), 
          lwd=c(2,2,3), lty=c(2,2,1), col=c("dodgerblue4", "red", "turquoise2"))
   
   
   # plot the point estimates
   #-------------------------
   
   # plot the MLE
   mle <- y/n
   y.height <- dbeta(mle, y+1, n-y+1)
   lines(x=c(mle,mle), y=c(0,y.height),  lwd=2, col="red")
   text(x=mle, y=y.height, labels = "MLE", pos = 2, col =2 )
   points(mle, y.height, pch=20, cex=1, col = 2)
   
   # plot the prior mean
   prior.mean <- (a)/(a+b)
   y.height <- dbeta(prior.mean, a, b)
   lines(x=c(prior.mean,prior.mean), y=c(0,y.height),  lwd=2, col="dodgerblue4")
   text(x=prior.mean, y=y.height, labels = "prior mean", pos = 4,col="dodgerblue4")
   points(prior.mean, y.height, pch=20, cex=1, col="dodgerblue4")
   
   
   # plot the posterior mean
   post.mean <- (aa)/(aa+bb)
   y.height <- dbeta(post.mean, aa, bb)
   lines(x=c(post.mean,post.mean), y=c(0,y.height),  lwd=2, col="turquoise2")
   text(x=post.mean, y=y.height, labels = "Posterior Mean", pos = 3, col="turquoise2")
   points(post.mean, y.height, pch=20, cex=1, col="turquoise2")
   
   
   # plot the approximate posterior median
   post.med <- (aa - 1/3)/(aa + bb - 2/3)
   y.height <- dbeta(post.med, aa, bb)
   lines(x=c(post.med,post.med), y=c(0,y.height),  lty=2, lwd=2, col="darkgreen")
   text(x=post.med, y=y.height, labels = "Posterior Median", pos = 1, col="darkgreen")
   points(post.med, y.height, pch=5, cex=1, col="darkgreen")
   
   
   # plot the posterior mode
   post.mode <- (aa-1)/(aa + bb - 2)
   y.height <- dbeta(post.mode, aa, bb)
   lines(x=c(post.mode,post.mode), y=c(0,y.height), lty=3,  lwd=2, col="darkorchid")
   text(x=post.mode, y=y.height, labels = "Posterior Mode", pos = 4,col="darkorchid")
   points(post.mode, y.height, pch=1, cex=1, col="darkorchid")
   
   print(name)
   cat("posterior mean =",round(post.mean,3), "\n")
   cat("posterior median =",round(post.med,3), "\n")
   cat("posterior mode =",round(post.mode,3), "\n")
   
   if (save.pdf) dev.off()
}

######################################
# Measures of spread
######################################
aa <- 33
bb <- 69

# the median of a beta distribution
qbeta(0.5, aa, bb) 

# IQR = Q3 - Q1
# 75th percentile - 25th percentile
qbeta(0.75, aa, bb) - qbeta(0.25, aa, bb)

# the variance of a Beta(aa, bb)
(aa*bb)/((aa+bb)^2*(aa+bb+1))


########################################
# construct the central credible interval 
########################################

if (save.pdf) pdf("tugofwar1_central.pdf", height=4.5)

# central posterior 95% interval:
cc <- 0.025
central.interval <- qbeta(c(cc, 1-cc), aa, bb)

# width of central interval
wci <- diff(central.interval) 

ll <- central.interval[1]
uu <- central.interval[2]

sub.title <- paste("95% central interval (", 
                   round(ll,3), ", ", 
                   round(uu, 3), ")", sep="")

curve(dbeta(x, shape1 = aa, shape2 = bb), xlab=expression(theta),
      lwd=2, col="turquoise2", ylab="", xlim=c(0,0.6), sub=sub.title,
      main = paste("Beta(", a,", ", b, ") Prior", sep=""))
xx <- seq(0,1,length=100)
yy <- dbeta(seq(0,1,length=100), aa, bb)
polygon(c(uu, uu, xx[xx>=uu]), c(0, dbeta(uu, aa, bb), yy[xx>=uu]), col="gray")
polygon(c(xx[xx<=ll], ll, ll), c(yy[xx<=ll], dbeta(ll, aa, bb), 0), col="gray")
abline(v = central.interval, col = "dimgrey", lwd = 2, lty = 3)


post.mean <- (aa)/(aa+bb)
arrows(x0 = post.mean, y0=2, x1=uu, y1=2)
arrows(x0 = post.mean, y0=2, x1=ll, y1=2)
points(post.mean, 2, pch=20, cex=2, col = "turquoise2")
text(post.mean, 2, labels=paste("Width =", round(diff(central.interval),3)), pos=3)
legend("topright", "posterior mean", pch=20 , col = "turquoise2")



if (save.pdf) dev.off()



if (save.pdf) pdf("tugofwar1_noncentral.pdf", height=4.5)

# non-central posterior 95% interval:

cc <- 0.95  # probability level
ttp <- 1-cc # total tail probability 
(left.prob <- ttp/10)
(right.prob <- ttp - left.prob)


BIC <- qbeta(c(left.prob, 1-right.prob), aa, bb)
wci <- diff(BIC) # width of central interval

ll <- BIC[1]
uu <- BIC[2]

sub.title <- paste("95% credible interval (", 
                   round(ll,3), ", ", 
                   round(uu, 3), ")", sep="")

curve(dbeta(x, shape1 = aa, shape2 = bb), xlab=expression(theta),
      lwd=2, col="turquoise2", ylab="", xlim=c(0,0.6), sub=sub.title,
      main = paste("Beta(", a,", ", b, ") Prior", sep=""))
xx <- seq(0,1,length=100)
yy <- dbeta(seq(0,1,length=100), aa, bb)
polygon(c(uu, uu, xx[xx>=uu]), c(0, dbeta(uu, aa, bb), yy[xx>=uu]), col="gray")
polygon(c(xx[xx<=ll], ll, ll), c(yy[xx<=ll], dbeta(ll, aa, bb), 0), col="gray")
abline(v = BIC, col = "dimgrey", lwd = 2, lty = 3)


post.mean <- (aa)/(aa+bb)
arrows(x0 = post.mean, y0=2, x1=uu, y1=2)
arrows(x0 = post.mean, y0=2, x1=ll, y1=2)
points(post.mean, 2, pch=20, cex=2, col = "turquoise2")
text(post.mean, 2, labels=paste("Width =", round(diff(BIC),3)), pos=3)
legend("topright", "posterior mean", pch=20 , col = "turquoise2")


if (save.pdf) dev.off()




