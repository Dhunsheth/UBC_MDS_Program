# x0 = 14
# m =7
# b = 17
# x1 = (17*14) %% (2^m -1)
# 
# x2 = 17*x1 %% (2^m -1)

# a <- 4   # Replace with your desired value for 'a'
# b <- 17    # Replace with your desired value for 'b'
# m <- 6   # Replace with your desired value for 'm'
# n <- 2   # The number of terms in the sequence you want to calculate

funct <- function(n, a, b, m, x0){
  # Initialize the sequence with x0
  x <- numeric(n+1)
  x[1] <- x0   # Replace with your desired initial value for 'x0'
  
  # Calculate the sequence using the recurrence relation
  for (k in 2:(1+n)) {
    # print(k)
    # print(x[k])
    # print(x[k-1])
    x[k] <- ( (a + b * x[k-1]) %% (m) )
  }
  u <- x/(m)
  print(x)
  print(u)
  return (u)
}

ans <- funct(2,1, 361, 131072, 118)



