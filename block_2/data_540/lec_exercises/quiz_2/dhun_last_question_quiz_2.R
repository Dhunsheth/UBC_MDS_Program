library("DBI")


con <- dbConnect(RMySQL::MySQL(), user='dsheth', password='32376881',
                 dbname='tpch', host='cosc304.ok.ubc.ca')

part_1_query <- '
select l_partkey, year(l_shipdate) as shippedYear, sum(l_quantity) as totalQuantity
from lineitem where l_shipdate like "%2018%" 
group by l_partkey, year(l_shipdate)
order by totalQuantity desc limit 5
'
top_products_2018 <- dbGetQuery(con, part_1_query)
print(top_products_2018)

part_2_query <- '
select l_partkey, year(l_shipdate) as shippedYear, sum(l_quantity) as totalQuantity
from lineitem where l_partkey = 1228 and year(l_shipdate) > 2014 and year(l_shipdate) < 2019
group by l_partkey, year(l_shipdate)
order by shippedYear;
'
top_product_analysis <- dbGetQuery(con, part_2_query)
print(top_product_analysis)

part_3_regression <- lm(totalQuantity~shippedYear, data=top_product_analysis)

estimate_2019 <- part_3_regression$coefficients[1] + 2019*(part_3_regression$coefficients[2])
print(estimate_2019[[1]])

dbDisconnect(con)