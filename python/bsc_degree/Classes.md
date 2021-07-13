## Creating Python Classes

```python
# Creating a python class

class Student:
    pass

st1 = Student()
st2 = Student()

print(type(Student))
print(type(st1))
print(type(st2))

```

OUTPUT:

```
<class 'type'>
<class '__main__.Student'>
<class '__main__.Student'>
```

You can think of classes as empty database with the headers already defined.

```
    name    age     dob     lang
0
1
2
3

```

```python

class Student:
    # the __init__() method is similar to creating headers of a database
    def __init__(self, name, age, dob, lang):
        self.name = name 
        self.age = age
        self.dob = dob
        self.lang = lang

# Instantiation of classes are like rows of the database
s1 = Student("Akshay", 23, 1995, "English")
s2 = Student("Anubhav", 25, 1993, "French")

print(s1.name)
print(s2.name)
```
