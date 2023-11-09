## DATA 530 Lab 4 - Libraries, Debugging, and Getting Help

This lab practices using libraries, debugging code, and getting help.

### Objectives

  - Import and use libraries in R and Python.
  - Perform debugging on Python and R code.
  - Use the built-in help in R.
  - Use online resources such as Stack Overflow to find/request help.
  
### Question #1 - Python Imports (4 marks - 8 questions worth 0.5 marks each)

For each of these import statements, write a short description of what is imported. Examples: imports module X, imports module X and names it as Y, imports module Y of package X, imports function F of package X, etc.

1. ```import random```

2. ```import random as rnd```

3. ```from random import random```

4. ```from random import random as rnd```

5. ```import numpy.random```

6. ```import numpy```

7. ```import X.Y.Z as T```

8. ```from Bio.Blast import NCBIWWW```


### Question #2 - Python Library (3 marks)

Find a library that can read JSON data. Write a Python program that uses this library to read the [data JSON file](provdata.json) and print out the province with the largest population.


### Question #3 - R Library (3 marks)

Repeat question #2 for R. Find a library that can read JSON data. Write a Python program that uses this library to read the [data JSON file](provdata.json) and print out the province with the largest population.


### Question #4 - Debugging (3 marks)

Debugging involves finding errors in code that is not working properly. Three types of errors:

1. Syntax errors - are identified when the code is run and will cause an error due to incorrect commands
2. Logic errors - occur when code has correct syntax but does not function as expected
3. Exceptions - occur when a run-time event causing an error is not handled by the code (try-except)

Indicate how to fix the following code programs and indicate what kind of error(s) occurred.

#### Code Sample 1
```
# Prints the numbers from 1 to 10
for i in range(1,10)
  print(i)
 ```
 
#### Code Sample 2
```
# Allows user to enter a number until enters STOP. Multiplies number by 2. Handles incorrect user input.
num = int(input("Enter a number:"))
while num != "STOP":  
  print(num*2)  
  num = int(input("Enter a number:"))
 ```
 
#### Code Sample 3
```
# Prints out items in a list in between 4 and 8 inclusive
data = [6, 5, 3, 4, 7, 1, 8]
for i in range(0,len(data)+1):
  if data[i] >= 4 && data[i] < 8:
    print("Data: ")
  print(data[i])
 ```
 
 ### Question #5 - Getting Help in Python (2 marks)
 
Python documentation is available at [https://docs.pythong.org](https://docs.python.org/3/library/index.html). Use the Python documemtation to create a **Python set** of 5 numbers and print out the set of numbers. Submit your code and a screenshot of the documentation on sets.

### Question #6 - Getting Help in R (1 mark)

Help is available in R using the ```help()``` command. Submit a screenshot of using help command to get information on ***data.frame***.

### Question #7 - Help Online (2 mark bonus)

Create an account on [Stack Overflow](https://stackoverflow.com). Submit a screenshot of submitting a question, posting a comment, or submitting an answer to a question. It must be a real post/question to get the marks - even better if you really help someone!
