rng.chisq <- function(x) {
  # x is output from a discreat uniform pseudorandom number
  n=length(x)
  x=as.vector(table(x))#Oi
  m=length(x)
  p <- rep(1,m)/m
  Ex <- n*p#Ei
  chisq <- sum((x-Ex)^2/Ex)
  pvalue <- 1-pchisq(chisq, m-1)
  list(test.statistic=chisq, p.value=pvalue, df=m-1)
}

# install.packages("purrr")

# library(purrr)
# x1=rdunif(150,b=80,a=55)
# x2=rdunif(150,b=110,a=90)
# x3=rdunif(150,b=85,a=55)
# data=cbind(c(1:450),c(x1,x2,x3))# 450 simulated discrete numbers
# rng.chisq(data[1:150,2])

# Question 1
bpm_data=readRDS(file = "BPM.rds")

# Question 1a
rng.chisq(bpm_data[1:150,2])[2]
# p-value: 0.6587231
# The p-value is greater than 0.05, and not very small, there is little evidence against the uniformity hypothesis
# and thus the BPM in the first phase follows a uniform distribution. 

# Question 1b
rng.chisq(bpm_data[,2])[2]
# p-value: 0.02756615
# The p-value is less than 0.05 and is very small, there is large evidence against the uniformity hypothesis
# and thus the entire sequence of BPM does not follow a uniform distribution.


# Question 2
exchange_data=readRDS(file = "Exchanges.rds")

# Question 2a
acf(exchange_data[,4],5)

# Question 2b
# Based on the plot, there are several spikes in the plot which exceed the blue line
# which indicates dependence 


# Question 3
dna_data=read.table("DNA.txt", header = FALSE)

# n=nchar(dna_data[1,2])
# i=1;
# x=rep(0,n)
# while(i<(n-1)){
#   if(substring(dna_data[1,2],i,i)=="A") x[i]=1
#   if(substring(dna_data[1,2],i+1,i+1)=="T") x[i+1]=1
#   i=i+2
# }
# sigma2=sum(x^2)/n-(mean(x))^2
# C1=(sum(x[1:(n-1)]*x[2:n])/(n-1)-mean(x[1:(n-1)])*mean(x[2:n]))/sigma2
# C1

# Question 3a
list_C1_AT = c()
for (k in dna_data[,2]){
  n=nchar(k)
  i=1
  x=rep(0,n)
  while(i<(n-1)){
    if(substring(k,i,i)=="A") x[i]=1
    if(substring(k,i+1,i+1)=="T") x[i+1]=1
    i=i+2
  }
  sigma2=sum(x^2)/n-(mean(x))^2
  C1=(sum(x[1:(n-1)]*x[2:n])/(n-1)-mean(x[1:(n-1)])*mean(x[2:n]))/sigma2
  list_C1_AT = append(list_C1_AT,C1)
}
list_C1_AT

# Question 3b
list_C1_AC = c()
for (k in dna_data[,2]){
  n=nchar(k)
  i=1
  x=rep(0,n)
  while(i<(n-1)){
    if(substring(k,i,i)=="A") x[i]=1
    if(substring(k,i+1,i+1)=="C") x[i+1]=1
    i=i+2
  }
  sigma2=sum(x^2)/n-(mean(x))^2
  C1=(sum(x[1:(n-1)]*x[2:n])/(n-1)-mean(x[1:(n-1)])*mean(x[2:n]))/sigma2
  list_C1_AC = append(list_C1_AC,C1)
}
list_C1_AC



