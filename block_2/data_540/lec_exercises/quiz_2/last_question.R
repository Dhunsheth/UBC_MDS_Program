library("DBI")
library("RMySQL")
library("RSQLite")


con <- dbConnect(RMySQL::MySQL(), user='dsheth', password='32376881',
                 dbname='tpch', host='cosc304.ok.ubc.ca')

part_1_query <- "
select ps_partkey, ps_suppkey, ps_availqty, year(l_shipdate) as year, 
sum(l_quantity) as shippedQuantity 
from partsupp join lineitem on l_partkey = ps_partkey and l_suppkey = ps_suppkey
group by ps_partkey, ps_suppkey, ps_availqty, year(l_shipdate)
order by ps_partkey, ps_suppkey, year(l_shipdate)
"
part_2_res <- dbGetQuery(con, part_2_query)




dbDisconnect(con)