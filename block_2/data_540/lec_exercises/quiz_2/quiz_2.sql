use tpch;

select s_suppkey, s_name, s_phone, s_acctbal
from supplier
where s_acctbal >= 2500 and s_phone like "%9%" and
s_suppkey in (select ps_suppkey from partsupp where ps_supplycost > 985)
order by s_suppkey desc limit 4;

select n_nationkey, n_name, count(distinct(c_custkey)) as totalCustomers, 
sum(o_totalprice) as totalOrderPrice
from nation join customer on customer.c_nationkey = n_nationkey 
join orders on orders.o_custkey = customer.c_custkey
where o_orderdate like "%2017%"
group by n_nationkey, n_name
having totalCustomers >= 40
order by totalOrderPrice desc limit 5;

select l_partkey, year(l_shipdate) as shippedYear, sum(l_quantity) as totalQuantity
from lineitem where l_shipdate like "%2018%" 
group by l_partkey, year(l_shipdate)
order by totalQuantity desc limit 5;

select l_partkey, year(l_shipdate) as shippedYear, sum(l_quantity) as totalQuantity
from lineitem where l_partkey = 1228 and year(l_shipdate) > 2014 and year(l_shipdate) < 2019
group by l_partkey, year(l_shipdate)
order by shippedYear;