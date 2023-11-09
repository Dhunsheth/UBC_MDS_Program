# DATA 540: Databases and Data Retrieval
# Lab 2: SQL

## Objectives

1. Connect to a MySQL database.
2. Write SQL queries of varying complexity on a MySQL database using SELECT. Queries will involve DISTINCT, joins, expressions/functions, GROUP BY, ORDER BY, HAVING, and subqueries.

**[Details on how to connect to MySQL](../lab1/usemysql.md)**

### Question 1 (20 marks)

The sample database is [TPC-H](http://www.tpc.org/tpch/) which is a standard database used to benchmark database systems. It is designed to be a data warehouse of information on customers, orders, and products. The database is available as **tpch** on the MySQL server. There is also [SQL DDL available](data/) if you want to create your own version.

The queries are generally of increasing complexity with easier queries at the start. Each question is worth 2 marks. Submit a single text file containing all the SQL SELECT statements for the queries. You do not have to provide the output but may if you wish.

1. Return the nations (**n_nationkey** and **n_name**) in region **1**. Rename fields to **id** and **name**. Note: Do not worry if SQuirreL does not rename fields in displaying table output.

**Output:**

| id          | name          |
| ----------- | ------------- |
| 1           | ARGENTINA     |
| 2           | BRAZIL        |
| 3           | CANADA        |
| 17          | PERU          |
| 24          | UNITED STATES |

---

2. Return the customer keys (no duplicates) that have placed at least one order after **November 25, 2018** and the total order price was between **$265,000** and **$280,000** inclusive. Sort by customer key ascending.

**Output:**

| o_custkey |
| --------- |
| 227       |
| 973       |
| 988       |
| 1019      |
| 1045      |
| 1124      |
| 1187      |
| 1277      |

---

3. Return the customer key, name, and account balance for customers with nation key less than **2** and account balance less than **0**.

**Output:**

| c_custkey | c_name             | c_acctbal |
| --------- | ------------------ | --------- |
| 337       | Customer#000000337 | -270.59   |
| 618       | Customer#000000618 | -932.38   |
| 754       | Customer#000000754 | -566.86   |
| 1430      | Customer#000001430 | -920.40   |
| 478       | Customer#000000478 | -210.40   |
| 647       | Customer#000000647 | -132.97   |
| 1234      | Customer#000001234 | -982.32   |
| 1492      | Customer#000001492 | -875.17   |

---

4. List the part name, supplier name, and nation name of the supplier for all parts where the part name contains **ivory** and the nation is either **'CANADA'** or **'FRANCE'**. Order ascending by supplier name and show first **8** rows.

**Output:**

| p_name                                   | s_name             | n_name |
| ---------------------------------------- | ------------------ | ------ |
| ivory grey tomato lawn                   | Supplier#000000013 | CANADA |
| ivory burlywood almond lavender blue     | Supplier#000000013 | CANADA |
| floral bisque grey ivory lawn            | Supplier#000000013 | CANADA |
| tan azure lime ivory linen               | Supplier#000000020 | CANADA |
| olive ivory plum medium navajo           | Supplier#000000020 | CANADA |
| salmon linen ivory orange dim            | Supplier#000000020 | CANADA |
| saddle snow red chartreuse ivory         | Supplier#000000070 | FRANCE |
| turquoise seashell ivory wheat chocolate | Supplier#000000070 | FRANCE |

---

5. List pairs of suppliers where the suppilers have the same nation and the first 5 digits of their phone numbers are the same. Show the supplier names, phone numbers, and total account balance (total of two balances). Only show each pair once. Hint: Examine string functions in MySQL, specifically [LEFT](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html#function_left).

**Output:**

| s_name             | s_name             | s_phone         | s_phone         | totalBalance |
| ------------------ | ------------------ | --------------- | --------------- | ------------ |
| Supplier#000000019 | Supplier#000000064 | 34-278-310-2731 | 34-278-790-7004 | 7460.08      |

---

6. Determine the number of customers, number of unique countries, total customer account balance, and average length of customer address for all customers in any of these three segments: **'BUILDING', 'AUTOMOBILE', 'MACHINERY'** and with a nation key less than **10**.

**Output:**

| numCustomer | numCountries | totalBalance | avgLength |
| ----------- | ------------ | ------------ | --------- |
| 376         | 10           | 1581637.82   | 24.8883   |

---

7. For each nation name and market segment, display its number of customers, number of orders, and minimum and maximum customer account balances. Make sure to rename fields as in output. Only process customers in a nation that has a **A** in its name. Only show rows where the number of customers is greater than **10**, the number of orders is greater than **180**, and the maximum balance is **>= 9000**. Include customers even if they do not have any orders.

**Output:**

| c_mktsegment | n_name       | numCustomer | numOrders | maxBalance | minBalance |
| ------------ | ------------ | ----------- | --------- | ---------- | ---------- |
| AUTOMOBILE   | CANADA       | 19          | 213       | 9339.57    | -556.05    |
| AUTOMOBILE   | CHINA        | 18          | 184       | 9750.71    | 737.40     |
| AUTOMOBILE   | IRAN         | 20          | 268       | 9180.50    | -932.96    |
| BUILDING     | ARGENTINA    | 18          | 197       | 9768.21    | -210.40    |
| BUILDING     | SAUDI ARABIA | 15          | 200       | 9680.51    | -574.39    |
| FURNITURE    | IRAN         | 17          | 199       | 9834.19    | -588.38    |
| HOUSEHOLD    | SAUDI ARABIA | 17          | 187       | 9777.19    | -395.89    |


8. Return the part key and size for all parts never shipped in a lineitem (**l_shipdate**) during the month of **May**. The part size must also be between **10** and **12** inclusive. Order the output by **size descending** then **key descending**. Hint: You will need [MONTH](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_month) function.

**Output:**

| p_partkey | p_size |
| --------- | ------ |
| 1347      | 12     |
| 1541      | 11     |
| 1388      | 11     |
| 586       | 11     |
| 1931      | 10     |
| 1837      | 10     |
| 668       | 10     |

9. Return the customer with the largest account balance.

**Output**:

| c_name             | c_acctbal |
| ------------------ | --------- |
| Customer#000000213 | 9987.71   |

---

10. Determine the total amount each product is in a lineitem using the **l_quantity** field. For example, part key 1 has total lineitem quantity of 628. Now calculate the average of these total quantities for all parts (average is about 767). Use this calculated average to return the part manufacturer and brand (as a single concatenated field) for parts that are ordered 60% more than the average quantity parts are ordered. Order by total quantity descending. Hint: Use [CONCAT](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html#function_concat) function and will need several subqueries. Goal is to do this in one SQL query (with subqueries) but part marks if do it as a series of SQL queries.

**Output**:

| manufacturerBrand         | p_partkey | totalQty |
| ------------------------- | --------- | -------- |
| Manufacturer#3 - Brand#32 | 1749      | 1374.00  |
| Manufacturer#3 - Brand#34 | 1228      | 1353.00  |
| Manufacturer#5 - Brand#51 | 1397      | 1318.00  |
| Manufacturer#3 - Brand#34 | 1393      | 1278.00  |
| Manufacturer#2 - Brand#21 | 609       | 1257.00  |
| Manufacturer#3 - Brand#33 | 1060      | 1244.00  |
| Manufacturer#5 - Brand#52 | 272       | 1242.00  |
| Manufacturer#4 - Brand#44 | 1235      | 1239.00  |

