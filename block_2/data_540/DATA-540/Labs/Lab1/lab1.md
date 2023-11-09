# DATA 540: Databases and Data Retrieval
# Lab 1: SQL DDL

## Objectives

1. Connect to a MySQL database.
2. Write SQL DDL commands for CREATE TABLE, INSERT, UPDATE, and DELETE.

**[Details on how to connect to MySQL](usemysql.md)**

### Question 1 (10 marks)

Write the SQL DDL to create the following database about music consisting of 5 tables: ``Artist``, ``RecordLabel``, ``Song``, ``Person``, and ``PlaySong``:

1. A **RecordLabel** table where each record label has a **labelName** (string up to 20 characters), **countryCode** (exactly 3 characters), and a **revenue** capable of storing value up to $999,999,999.99. 

2. An **Artist** table where each musical artist is identified by a field called **artistId** that is an integer. Other attributes include **artistName** (string up to 30 characters), **age** (integer), and **labelName** (string up to 20 characters). Create a foreign key as appropriate for **labelName**. Make foreign key set to null on delete and cascade on update.

3. A **Person** table with **personId** as key (integer), **firstname** (up to 15 characters), **lastname** (up to 20 characters), **totalPlays** (integer), and **balance** (capable of storing up to $99,999.99).

4. A **Song** table with two fields as the primary key: **artistId** (integer) and **songName** (up to 20 characters). Other fields include: **duration** (integer), **releaseDate** (should store date info), and **cost** (capable of storing up to $99.99).  Create an appropriate foreign key. Make foreign key cascade on delete and cascade on update.

5. A **PlaySong** table that tracks whenever a person plays a song. Key fields: **personId** (integer), **artistId** (integer), **songName** (up to 20 characters), **playDate** (datetime). Other field: **cost** (capable of storing up to $99.99).  Create appropriate foreign keys. Make foreign keys cascade on delete and cascade on update.


### Question 2 (10 marks)

Write the SQL DDL to perform the following modifications to the database created in Question 1.

#### Insert (6 marks)
Insert the following records into the appropriate tables.

##### RecordLabel
```
("Republic Records", "USA", '250456123.55')
("Island Records", "CDN", '100000000.00')
```

##### Artist
```
(1, "Ariana Grande", 25, "Republic Records")
(2, "Justin Bieber", 24, "Island Records")
(3, "Amy Grant", 48, "Island Records")
```

##### Person
```
(1, "Sarah", "Smith", 25, '254.00')
(2, "Fred", "Funk", 62, '22.22')
```

##### Song
```
(1, 'No Tears Left to Cry', 206, '2018-04-20', '1.99')
(2, 'Despacito', 227, '2017-01-12', '0.99')
```

##### PlaySong
```
(1, 1, 'No Tears Left to Cry', '2018-10-01 10:00:00', '1.99')
(1, 1, 'No Tears Left to Cry', '2018-10-01 10:13:30', '0.99')
(2, 2, 'Despacito', '2018-10-05 23:15:00', '0.79')
```

#### Update (2 marks)
1. Add $50 to Fred Funk's balance.

2. Modify all play times for **Sarah Smith** (**personId=1**) to be 1 hour later. Note: To add an hour to a date use the syntax DATE_ADD(*yourDateField*, INTERVAL 1 HOUR).

#### Delete (2 marks)
1. Delete any artist over 30.

2. Delete all PlaySong records for **Justin Bieber**. Note: You do not have to use a subquery for this question but try if you can!

### What to submit
1.  Describe each table using the ```describe (or desc) table_name``` command. For each table, submit a screenshot of the table description. <br>
2.  Select all records from each table using the command ```select * from table_name```. For each table, submit a screenshot of the table's records.

