# DATA 533: Collaborative Software Development

# Lab 1

## Objective

1. Learning the fundamental concepts of Object Oriented Programming (OOP)
2. Understanding how to use classes, objects, attributes, and methods in Python
3. Understanding how to create and use parent and child classes in Python 

## Question 1: Basic Classes (5 marks)

- Create a class called `Queue` to represent a fundamental data structure you learned in DATA 532. Add an `__init__()` method to initialize your Queue. The Queue can store data in a list (1 mark).
- Create a method named `enqueue`. It should take `self` and `item` as arguments. A user can call the method to add an `item` to the queue (1 mark). 
- Create a method named `dequeue` which should remove and return an item at the front of the list (see the sample text code below) (1 mark). 
- Create a method named `size` to return the size of the queue (1 mark). 
- Overrise `__str__()` method to return all the items on the queue (1 mark).

Sample test code:
```
queue = Queue()
queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)
print(queue)
queue.dequeue()
print(queue)
queue.enqueue(40)
print(queue)
queue.dequeue()
print(queue)
```
Sample output:
```
[30, 20, 10]
[30, 20]
[40, 30, 20]
[40, 30]
```

## Question 2: Classes and Private Attributes (5 marks)

- Create a class called `Contact` that takes `self`, `name`, `phoneNo`, and `email` as arguments in its `__init__()` method. Set these values (i.e., `name`, `phoneNo`, and `email`) to three private attributes in the `__init__()` method (1 mark).
- Create property decorators to access the private attributes (2 marks). 
- Use a class attribute to count the number of instances of the `Contact` class that have been instantiated. Create a method `displayCount` to display the number of instances (i.e., number of contacts) (2 marks).

Sample test code:
```
c1 = Contact('Ale', '123-456-0123', 'alex@test.ca')
c1.name = 'Alex'
print(c1.name)
c1.displayCount()
c2 = Contact('David', '123-456-0124', 'dave@test.ca')
print(c2.name)
c2.displayCount()
print(Contact.count)
```

Sample output:
```
Alex
Total contact: 1
David
Total contact: 2
2
```

## Question 3: Inheritance (5 marks)

- Create a class called `Vehicle` that takes `self`, `make`, `model`, and `year` as arguments in its `__init__()` method. Add a method `display` in the class to show the Car's member variables (sample format: "Make: [make] Model: [model] Year: [year]") (1 mark).
- Create a class called `Truck` that inherits from `Vehicle`.  Add an `__init__()` method that includes a `tonnage` variable in addition to the `make`, `model`, and `year`. Add another method, `display()`, that calls the `display` method in the `Vehicle` class and shows a `tonnage` value (2 marks).
- Create another class, `ElectricCar`, that inherits from `Vehicle`.  Add an `__init__()` method that includes a `battery` variable in addition to the `make`, `model` and `year`. Write another method, `display()`, to call the `display` method in the `Vehicle` class. This method will also include a line to show information on the battery (2 marks).

Sample test code:
```
v1 = Truck('Ford', 'F150', 2018, 0.5);
v2 = ElectricCar('Tesla', 'Model S', 2008, '60 kWh');
vehicles = [v1, v2]
for vehicle in vehicles:
    vehicle.display()
```

Sample output:
```
Make: Ford Model: F150 Year: 2018 
Tonnage: 0.5 
Make: Tesla Model: Model S Year: 2008 
Battery: 60 kWh
```

## Question 4: Operator overloading (5 marks)

Write a Python program to add two distances that are presented in imperial/standard and metric units. You only need to consider conversions between the following units: millimeters (mm), centimeters (cm), meters (m), kilometers (km), inches (in), feet (ft), yards (yd), and miles (mi). Let’s say we want to add two distances: 10 in and 10 cm. The program will process the data and convert the distances into the first parameter’s unit (i.e., inches for this example) and show the output with two decimal places (i.e., 13.94). 

- Create a class called ` Conversion` that takes `self`, ` value`, and ` unit` as arguments in its `__init__()` method. Note that if a user does not provide any input for a unit, it will use meter (m) as the default unit (1 mark). 
- Add two methods `__add__` and `__sub__` which correspond to the `+` and `–` operators, respectively. These operators are used to add or subtract two distances represented in the same or different units. Note that after performing the corresponding operations, the methods should return a new instance of the class instead of modifying the calling instance itself (3 mark).
- Add a ` __str__` method to return a string representation of an object in the following format `Total converted distance is <value unit>` (1 mark)
- Feel free to add additional methods if needed.


Sample test code:
```
print(Conversion(3.3, "km") + Conversion(10))
print(Conversion(10, "in") + Conversion(10, "cm"))
print(Conversion(1, "km") - Conversion(1,"mi"))
print(Conversion(1, "ft") - Conversion(1,"yd"))
```
Sample output:
```
Total converted distance is 3.31 km
Total converted distance is 13.94 in
Total converted distance is -0.61 km
Total converted distance is -2.00 ft
```

### Submission instructions: 

If you use Jupyter Notebook, save the file with your `student number` and submit the file. If you use a Python editor, save the files as `<StudentNumber>_Q<QuestionNumber>.py` and submit the files.