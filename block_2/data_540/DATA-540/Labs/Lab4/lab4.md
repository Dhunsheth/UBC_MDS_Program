# DATA 540: Databases and Data Retrieval
# Lab 4: ER Diagrams, XML, JSON, NoSQL

## Objectives

1. Read an ER/UML diagram in order to convert it to the relational model and write SQL queries.
2. Find errors that cause an XML document to not be well-formed or valid.
3. Write simple XPath expressions on an XML document.
4. Validate JSON documents and resolve syntax errors.
5. Understand GRANT privileges required to execute SQL statements.
6. Use R to connect to a NoSQL database and read JSON documents.

### Question 1 (5 marks)

Given the following ER/UML diagram, answer these questions:

![img/Student.jpg](img/Student.jpg)

1. How many strong entity types? (0.5 marks)
2. How many one-to-many relationship types? (0.5 marks)
3. Given an instance of entity type **Section** how many entity instances of type **Student** can it be related to? (0.5 marks)
4. How many foreign keys? (0.5 marks)
5. Convert the ER diagram to the relational model. Note primary keys (by bold or underline) and foreign keys (remember: directional!). (3 marks)


### Question 2 (6 marks)

Given the following XML Schema and XML document, answer these questions:

#### XML Document
```
<?xml version="1.0" standalone="no"?>
<Orders>
   <Order orderId = "1" customerId = "C1">
      <LineItem productId = "P1"><price>25.00</price><quantity>11</quantity></LineItem>
      <LineItem productId = "P2"><quantity>10</quantity><price>2.00</price></LineItem>
      <totalAmount>27.00</totalAmount>
   </Order>
   <Order orderId = "2">
      <LineItem productId = "P1"><quantity>1</quantity><price>25.00</price></LineItem>
      <totalAmount>A LOT</totalAmount>
   </Order>
   <Order orderId = "3" customerId = "C1>
      <LineItem productId = "P4"><quantity>2</quantity><price50.00</price></LineItem>
   </Order>
   <Customer customerId = "C1">
      <cname>Aditya Bian</cname>
   </Customer>
   <Customer customerId = "C1">
      <cname>Francisco Pena
      <address>11 Nowhere Street</address>
      <numOrders>4</numOrders>
   </Customer>
   <Product productId = "P1">
      <pname>Soap</pname>
      <category>Personal Hygiene</category>
      <price>3.00</price>
   </Product>
   <Product productId = "P2">
      <pname>Pillow</pname>		
      <price>25.00</price>
   </Product>
   <Product>
      <pname>Towel</pname>
	  <category>Bathroom</category>
      <price>5.00</price>
   </Product>
```
#### XML Schema
```
<?xml version = "1.0"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
<xsd:element name = "Orders">
	<xsd:complexType>
		<xsd:sequence>
			<xsd:element name="Order" minOccurs="0" maxOccurs="unbounded">
				<xsd:complexType>					
					<xsd:sequence>					
						<xsd:element name="LineItem" minOccurs="1" maxOccurs="unbounded">
							<xsd:complexType>								
								<xsd:sequence>									
									<xsd:element name = "quantity" type = "xsd:integer" minOccurs="1" />
									<xsd:element name = "price" type = "xsd:decimal" minOccurs="1" />									
								</xsd:sequence>
								<xsd:attribute name="productId" type="xsd:string" use="required" />
							</xsd:complexType>
						</xsd:element>							
						<xsd:element name = "totalAmount" type = "xsd:decimal" minOccurs="0" />
					</xsd:sequence>
					<xsd:attribute name="orderId" type="xsd:string" use="required" />
					<xsd:attribute name="customerId" type="xsd:string"  />
				</xsd:complexType>
			</xsd:element>							
			<xsd:element name="Customer" minOccurs="1" maxOccurs="unbounded">
				<xsd:complexType>					
					<xsd:sequence>					
						<xsd:element name = "cname" type = "xsd:string" minOccurs="1" />
						<xsd:element name = "address" type = "xsd:string" minOccurs="0"/>									
					</xsd:sequence>
					<xsd:attribute name="customerId" type="xsd:string" use="required" />
				</xsd:complexType>
			</xsd:element>									
			<xsd:element name="Product" minOccurs="1" maxOccurs="unbounded">
				<xsd:complexType>					
					<xsd:sequence>					
						<xsd:element name = "pname" type = "xsd:string" minOccurs="1" />
						<xsd:element name = "category" type = "xsd:string" minOccurs="1" />	
						<xsd:element name = "price" type = "xsd:decimal" minOccurs="1" />								
					</xsd:sequence>
					<xsd:attribute name="productId" type="xsd:string" use="required" />
				</xsd:complexType>
			</xsd:element>										
		</xsd:sequence>
    </xsd:complexType>
	<xsd:key name = "OrderKey">
		<xsd:selector xpath = "Order" />
		<xsd:field xpath = "@orderId" />
	</xsd:key>
	<xsd:key name = "CustomerKey">
		<xsd:selector xpath = "Customer" />
		<xsd:field xpath = "@customerId" />
	</xsd:key>
	<xsd:key name = "ProductKey">
		<xsd:selector xpath = "Product" />
		<xsd:field xpath = "@productId" />
	</xsd:key>
	<xsd:keyref name = "OrderCustomerFK" refer = "CustomerKey">
		<xsd:selector xpath = "Order" />
		<xsd:field xpath = "@customerId" />
	</xsd:keyref>
	<xsd:keyref name = "LineitemProductFK" refer = "ProductKey">
		<xsd:selector xpath = "Order/LineItem" />
		<xsd:field xpath = "@productId" />
	</xsd:keyref>
</xsd:element>
</xsd:schema>
```

1. Find at least **8** errors. Indicate if the error violates the document being valid or well-formed. (2 marks)
2. Write an XPath expression that returns all **LineItems** where **quantity > 5**. (2 marks)
3. Write an XPath expression that returns all **orders** that contain product **"P1"** and have **quantity > 1**.  (2 marks)


### Question 3 (2 marks)

Fix these two JSON documents so they have correct syntax. [JSONLint](http://www.jsonlint.com) may be useful.

1. ```{"id: 5, "name": Jenny, "age": "18", "marks": {54, 76, 99, 72}}   ```

2. ```{"obj1": { "a": 5 "c": {"arr": [3, 4 5], "d": "e"}, "prop2": { "a": 4, "b": 10}}```


### Question 4 (2 marks)

What privileges need to be GRANTed to execute the following two SQL statements:

1. ```DELETE FROM emp WHERE eno NOT IN (SELECT eno FROM workson)```
    
2. ```UPDATE workson SET eno='E1', pno='P2' WHERE eno IN (SELECT eno FROM emp WHERE salary < 50000)```


### Question 5 (5 marks)

Write a program in R that connects to the MongoDB NoSQL database and executes a query. Database connection info:

```
mongo(collection = "region", db = "data540", url = "mongodb+srv://data540:data540@cluster0.kevs3bk.mongodb.net/data540")
```

The library to use is [Mongolite](https://jeroen.github.io/mongolite/) and here is an [example usage](https://www.kenwalger.com/blog/nosql/mongodb/new-r-driver-option-mongodb-3-6/).

1. Make a connection to the MongoDB tpch database and the **region** collection. (1 mark)
2. Return the count of the number of records in the collection. (1 mark)
3. Use **find()** to retrieve all records then print them out. (1 mark)
4. Reconnect but this time to **nation** collection. (1 mark)
5. Retrieve and print all nations (only **n_nationkey** and **n_name**) with **n_nationkey < 10**. (1 mark)

#### Output
```
# of region records
5

# All region records
 r_regionkey      r_name                                                                                                   r_comment
1           0      AFRICA                                                 xSx31zz31Cl1z4OAnmm05AjiOxC3AMMNOgC0kACgwngg3glP7LLLywlQy7R
2           1     AMERICA kgyh3LSnC72k6zlAz0LP3k2L4QB1QL1O673OjO1SPj0ngQ7CO100SBgmgRQ4lgPCMk21A425iklyAR4yBRAwR4Cm5miNw 4jl13mMnxw17B
3           2        ASIA NSg6xlMlA1lzm6mOR0Ajx nhRA77NgRxBwL1M6Py RjySB3RLwkyPkwMM2R1BQ xAzkOgkjmll0gAghinP5inmNmR76MlijMS3S2zxONR15
4           3      EUROPE  zlSL7Qwg12hMBL5lhlz0M45QkjShwSyiO04MLOh7wn1ARLQPyPAyAiil576l1Li7AlnR1S RQ4SLny7B2Ryj5P66MLhn NxhwB4C3ig0SO
5           4 MIDDLE EAST                                                                     RllxmhPLz3Cy2mNlg4QMBnNASM ACki MPki7Oi

# Nations with key < 10
                        _id n_nationkey    n_name
1  51b11848e4b0b89528766ce2           0   ALGERIA
2  51b11848e4b0b89528766ce3           1 ARGENTINA
3  51b11848e4b0b89528766ce4           2    BRAZIL
4  51b11848e4b0b89528766ce5           3    CANADA
5  51b11849e4b0b89528766ce6           4     EGYPT
6  51b11849e4b0b89528766ce7           5  ETHIOPIA
7  51b11849e4b0b89528766ce8           6    FRANCE
8  51b11849e4b0b89528766ce9           7   GERMANY
9  51b11849e4b0b89528766cea           8     INDIA
10 51b11849e4b0b89528766ceb           9 INDONESIA
```
