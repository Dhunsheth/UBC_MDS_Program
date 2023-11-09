-- Q1
select n_nationkey as "id",n_name as "name" from tpch.nation
where n_regionkey = 1;

-- Q2
select distinct o_custkey from tpch.orders
where o_orderdate > "2018-11-25" and o_totalprice > 265000 and o_totalprice < 280000
order by o_custkey asc;

-- Q3
select c_custkey,c_name,c_acctbal from tpch.customer
where c_nationkey < 2 and c_acctbal < 0;

-- Q4
select part.p_name, supplier.s_name, nation.n_name from tpch.part
join tpch.partsupp on part.p_partkey = partsupp.ps_partkey
join tpch.supplier on partsupp.ps_suppkey = supplier.s_suppkey
join tpch.nation on supplier.s_nationkey = nation.n_nationkey
where p_name like '%ivory%' and n_name in ('CANADA','FRANCE')
order by s_name asc
limit 8;

-- Q5
select firsts.s_name, seconds.s_name, firsts.s_phone, seconds.s_phone, firsts.s_acctbal + seconds.s_acctbal as totalBalance
from tpch.supplier as firsts join tpch.supplier as seconds on firsts.s_nationkey = seconds.s_nationkey and firsts.s_name < seconds.s_name
where left(firsts.s_phone, 6) = left(seconds.s_phone, 6) and firsts.s_name != seconds.s_name;

-- Q6
select count(c_custkey) as numCustomer, count(distinct c_nationkey) as numCountry, sum(c_acctbal) as totalBalance, avg(length(c_address)) 
from tpch.customer 
where c_mktsegment in ('BUILDING','AUTOMOBILE','MACHINERY') and c_nationkey < 10;

-- Q7
select c_mktsegment, n_name, count(distinct c_custkey) as numCustomer, count(o_custkey) as numOrders, max(c_acctbal) as maxBalance, min(c_acctbal) as minBalance
from tpch.customer join tpch.nation on c_nationkey = n_nationkey
left join tpch.orders on o_custkey = c_custkey
where n_name like '%A%'
group by c_mktsegment, n_name
having numCustomer > 10 and numOrders > 180 and maxBalance >= 9000;

-- Q8
select distinct p_partkey, p_size 
from tpch.part join tpch.lineitem on p_partkey = l_partkey
where p_size between 10 and 12 and l_partkey not in (select l_partkey from tpch.lineitem where l_shipdate like '%-05-%') order by p_size desc, p_partkey desc;

-- Q9
select distinct c_name, c_acctbal from tpch.customer order by c_acctbal desc limit 1;

-- Q10
select concat(p_mfgr,' - ',p_brand) as manufacturerBrand, p_partkey, sum(l_quantity) as totalQty
from tpch.lineitem join tpch.part on l_partkey = p_partkey 
group by p_partkey
having totalQty > (1.6 * (select avg(temp.sum_quantity) from (select l_partkey, sum(l_quantity) as sum_quantity from tpch.lineitem group by l_partkey) as temp ))
order by totalQty desc;
