library("rjson")

# QUESTION 3

data <- as.data.frame(fromJSON(file="provdata.json"))

highest_prov <- ''
highest_pop <- 0

for (i in seq(2,length(data),2)){
  if (as.double(data[[i]]) > highest_pop){
    highest_pop <- as.double(data[[i]])
    highest_prov <- data[[i-1]]
  }
}
print(highest_prov)
print(highest_pop)