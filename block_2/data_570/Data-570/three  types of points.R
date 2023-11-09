set.seed(1)
x=rnorm(100)
e=rnorm(100)
y=-1+x+e
fit1=lm(y~x)
summary(fit1)
x=c(x,0)
y=c(y,4)#outlier
fit2=lm(y~x)
par(mfrow=c(1,5), mai = c(1, .5, 0.2, 0.2))
plot(x,y)
text(x[101]+0.3,y[101], "101")
plot(fit2)
summary(fit2)

set.seed(1)
x=rnorm(100)
e=rnorm(100)
y=-1+x+e
fit1=lm(y~x)
summary(fit1)
x=c(x,-2)
y=c(y,50)#outlier and influential point
par(mfrow=c(1,5), mai = c(1, .5, 0.2, 0.2))
plot(x,y)
text(x[101]+0.3,y[101], "101")
fit2=lm(y~x)
plot(fit2)
summary(fit2)
cooks.distance(fit2)


set.seed(1)
x=rnorm(100)
e=rnorm(100)
y=-1+x+e
fit1=lm(y~x)
summary(fit1)
x=c(x,3)
y=c(y,4)#outlier and high leverage point
par(mfrow=c(1,5), mai = c(1, .5, 0.2, 0.2))
plot(x,y)
text(x[101]-0.3,y[101], "101")
fit2=lm(y~x)
plot(fit2)
summary(fit2)



set.seed(1)
x=rnorm(100)
e=rnorm(100)
y=-1+x+e
fit1=lm(y~x)
summary(fit1)
x=c(x,3)#outlier, high levarage point, and influential point
y=c(y,6) 
par(mfrow=c(1,5), mai = c(1, .5, 0.2, 0.2))
plot(x,y)
text(x[101]-0.3,y[101], "101")
fit2=lm(y~x)
plot(fit2)
summary(fit2)
cooks.distance(fit2)

set.seed(1)
x=rnorm(100)
e=rnorm(100)
y=-1+x+e
fit1=lm(y~x)
summary(fit1)
x=c(x,3)
y=c(y,0)#high levarage point
par(mfrow=c(1,5), mai = c(1, .5, 0.2, 0.2))
plot(x,y)
text(x[101]-0.3,y[101], "101")
fit2=lm(y~x)
plot(fit2)
summary(fit2)


set.seed(1)
x=rnorm(100)
e=rnorm(100)
y=-1+x+e
fit1=lm(y~x)
summary(fit1)
x=c(x,4)
y=c(y,0)#high levarage point and influential point
par(mfrow=c(1,5), mai = c(1, .5, 0.2, 0.2))
plot(x,y)
text(x[101]-0.3,y[101], "101")
fit2=lm(y~x)
plot(fit2)
summary(fit2)
cooks.distance(fit2)


set.seed(1)
x=rnorm(100)
e=rnorm(100,0,0.1)
y=-1+x+e
fit1=lm(y~x)
summary(fit1)
x=c(x,1.5)
y=c(y,-1)#influential point
par(mfrow=c(1,5), mai = c(1, .5, 0.2, 0.2))
plot(x,y)
text(x[101]-0.3,y[101], "101")
fit2=lm(y~x)
plot(fit2)
summary(fit2)
cooks.distance(fit2)


