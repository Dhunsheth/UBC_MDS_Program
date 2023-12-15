#Q2
set.seed(2023)
norm_var_ci <- boot_var_ci <- matrix(NA, nrow=1000, ncol=2)
for(i in 1:1000){
  dumx <- runif(25)
  norm_var_ci[i, 1] <- (25-1)*var(dumx)/qchisq(0.975, 25-1)
  norm_var_ci[i, 2] <- (25-1)*var(dumx)/qchisq(0.025, 25-1)
  dumboot <- bootstrap(dumx, 1000, var)
  boot_var_ci[i, 1] <- quantile(dumboot$thetastar, 0.025)
  boot_var_ci[i, 2] <- quantile(dumboot$thetastar, 0.975)
}
contain_var_norm <- contain_var_boot <- rep(NA, 1000)
for(i in 1:1000){
  contain_var_norm[i] <- norm_var_ci[i, 1] <= 1/12 & 1/12 <= norm_var_ci[i, 2]
  contain_var_boot[i] <- boot_var_ci[i, 1] <= 1/12 & 1/12 <= boot_var_ci[i, 2]
}
sum(contain_var_norm)
sum(contain_var_boot)


#Q4
set.seed(32531)
X <- matrix(rnorm(100000), nrow=50, ncol=2000)
Y <- rnorm(50)


top10 <- which(rank(cor(cbind(Y, X))[-1,1]) %in% 1:10)
cvlm <- list()
msecvW <- NA
Xtop <- data.frame(X[, top10])
for(i in 1:nrow(X)){
  cvY <- Y[-i]
  cvlm[[i]] <- lm(cvY ~., data=Xtop[-i,])
  msecvW[i] <- (predict(cvlm[[i]], newdata=Xtop[i,]) - Y[i])^2
}
mean(msecvW)


cvlm <- list()
msecvR <- NA
for(i in 1:nrow(X)){
  cvtop10 <- which(rank(cor(cbind(Y[-i], X[-i,]))[-1,1]) %in% 1:10)
  cvXtop10 <- data.frame(X[, cvtop10])
  cvY <- Y[-i]
  cvlm[[i]] <- lm(cvY ~., data=cvXtop10[-i,])
  msecvR[i] <- (predict(cvlm[[i]], newdata=cvXtop10[i,]) - Y[i])^2
}
mean(msecvR)