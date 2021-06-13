## Python Multiple Inheritance

A class can be derived from more than one base class in Python, similar to C++. This is called multiple inheritance.
In multiple inheritance, the features of all the base classes are inherited into the derived class. The syntax for multiple inheritance is similar to single inheritance.

```
class Base1:
    pass

class Base2:
	pass
	
class MultiDerived(Base1, Base2):
	pass
```

#### Python Multilevel Inheritance

We can also inherit from a derived class. This is called multilevel inheritance. It can be of any depth in Python.
n multilevel inheritance, features of the base class and the derived class are inherited into the new derived class.

```class Base:
    pass

class Derived1(Base):
    pass

class Derived2(Derived1):
    pass
```
  
#### Method Resolution Order in Python
Every class in Python is derived from the `object` class. It is the most base type in Python.
So technically, all other classes, either built-in or user-defined, are derived classes and all objects are instances of the `object` class.

```
# Output: True
print(issubclass(list,object))

# Output: True
print(isinstance(5.5,object))

# Output: True
print(isinstance("Hello",object))
```
