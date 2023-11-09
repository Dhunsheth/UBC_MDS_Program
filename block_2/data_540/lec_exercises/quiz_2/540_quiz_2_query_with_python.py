# -*- coding: utf-8 -*-
"""
Created on Wed Nov  8 13:06:27 2023

@author: Dhuns
"""

import mysql.connector
import pandas as pd

mydb = mysql.connector.connect(
    host = "cosc304.ok.ubc.ca",
    user = "dsheth",
    password = "32376881"
)

print(mydb)
cursor = mydb.cursor()

# cursor = mydb.cursor()
# cursor.execute("select * from tpch.nation limit 5")
# data = cursor.fetchall()
# df = pd.DataFrame(data)

query = """
select * from tpch.customer;
"""

df = pd.read_sql(query, mydb)


mydb.close()