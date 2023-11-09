library(tidyverse, quietly = TRUE)
library(docstring)

avglist <- function(lst, low=0, high=100){
  #' @title Calculates average of a list of values
  #'
  #' @description Calculates the average of a list of values given a list and the range (low, high). 
  #'The function will order the list first, and then calculate the average of all values between the lower and higher value, non-inclusive.
  #'
  #' @param lst an object of class list. List of values.
  #' @param low an object of class double. The lower value of the range, non-inclusive. 
  #' @param high an object of class double. The higher value of the range, non-inclusive. 
  #' @output returns either the mean of the list or an error message if list is empty, or not of type list, or lower/upper value not found in the list.
  #' @examples
    #' x <- list(2, 3, 10, 15, 6, 7, 7, 8, 22, 22, 23, 1)
    #' func_response <- avglist(x, 6, 22)
    #' function will return average of 9.4 
    #' list its calculating the average over is (7,7,8,10,15)
  if (is.list(lst)){
    if (length(lst)==0){
      return("List is of size 0")
    }else {
      # if (length(lst) > 1){
      #   lst <- lst[order(unlist(lst))]
      # }else {
      #   lst[[1]] <- sort(unlist(lst))
      # }
      lst <- sort(unlist(lst))
      low_index <- which(unlist(lst) == low)[length(which(unlist(lst) == low))] # length(which(unlist(lst) == low)) gives last low value
      high_index <- which(unlist(lst) == high)[1] # length(which(unlist(lst) == high)) give last high value but I want first high value
      if (identical(low_index, integer(0))) {
        return("Lower value not found in list")
      }else if (is.na(high_index)) {
        return("Upper value not found in list")
      }else {
        mean_lst <- mean(unlist(lst)[(low_index + 1):(high_index - 1)])
        return(mean_lst)
      }
    }
  }else {
    return("Didn't send a list")
  }
}

?avglist # printing documentation

test <- list(sample(seq(1,100,1),100))
results <- avglist(test,30,100)
print(results)

test2 <- list(sample(seq(1,100,1),100, replace = TRUE)) # with replace as true, there is a chance 1 or both range values may not be found in the list
results2 <- avglist(test2,30,100)
print(results2)
