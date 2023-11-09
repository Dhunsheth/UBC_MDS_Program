use tpch;

select * from lineitem limit 5;

select ps_partkey, ps_suppkey, ps_availqty, year(l_shipdate) as "year", 
sum(l_quantity) as shippedQuantity
from partsupp join lineitem on l_partkey = ps_partkey
group by ps_partkey, ps_suppkey, ps_availqty, year(l_shipdate)
order by ps_partkey, ps_suppkey, ps_availqty, year(l_shipdate)
limit 10;

select ps_partkey, ps_suppkey, ps_availqty, year(l_shipdate), sum(l_quantity) as shippedQuantity 
from partsupp join lineitem on l_partkey = ps_partkey
where year(l_shipdate) = 2018 and l_extendedprice is not null
group by ps_partkey, ps_suppkey, ps_availqty, year(l_shipdate)
having ps_availqty < sum(l_quantity)
limit 5;

select ps_partkey, ps_suppkey, ps_availqty, year(l_shipdate), sum(l_quantity) as shippedQuantity, ps_availqty/sum(l_quantity) as percent
from partsupp join lineitem on l_partkey = ps_partkey
where year(l_shipdate) = 2018
group by ps_partkey, ps_suppkey, ps_availqty, year(l_shipdate)
having sum(l_quantity) >= 6
order by percent desc
limit 10;

select ps_partkey, ps_suppkey, l_quantity
from lineitem join partsupp on  l_partkey = ps_partkey
where ps_partkey = 1 and ps_suppkey = 2 and year(l_shipdate) = 2018;

