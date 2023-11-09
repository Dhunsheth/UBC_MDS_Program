library(RMySQL)
con <- dbConnect(RMySQL::MySQL(), user='dsheth', password='32376881',
dbname='workson', host='cosc304.ok.ubc.ca')

salary <- 45000
ename <- "L"
query <- sprintf( "SELECT pno, count(*) FROM emp JOIN workson on emp.eno =
workson.eno WHERE salary < '%s' and ename > '%s' GROUP BY pno", salary, ename)
res <- dbGetQuery(con, query)
res

### SQLite
library("RSQLite")
library("DBI")

con <- dbConnect(RSQLite::SQLite(), ":memory:")
# Write data frame to table
testData <- data.frame(id = 1:5,
                       name=c("Abe", "Ben", "Cindy", "Dana", "Emma"))
dbWriteTable(con, "test", testData)
data <- dbGetQuery(con,"SELECT * FROM test")
data
# Disconnect
dbDisconnect(con)