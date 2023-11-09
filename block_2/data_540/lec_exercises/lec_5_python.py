import mysql.connector
import pandas as pd

try:
    mydb = mysql.connector.connect(
        host = "cosc304.ok.ubc.ca",
        user = "dsheth",
        password = "32376881",
        database = 'workson'
    )

    print(mydb)
    cursor = mydb.cursor()

    # cursor = mydb.cursor()
    # cursor.execute("select * from tpch.nation limit 5")
    # data = cursor.fetchall()
    # df = pd.DataFrame(data)
    
    query = """
    select title, avg(salary) from workson.emp
    where ename > 'J'
    group by title;
    """
    
    df = pd.read_sql(query, mydb)
    
except:
    raise
    mydb.close()
