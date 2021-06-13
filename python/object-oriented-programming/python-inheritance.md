## Python Inheritance

Inheritance enables us to define a class that takes all the functionality from a parent class and allows us to add more.

#### Example of Inheritance in Pyton

```
class Polygon:
    def __init__(self, total_sides):
        self.n = total_sides
        self.sides = [0 for i in range(total_sides)]
    
    def input_sides(self):
        self.sides = [float(input("Enter side " + str( i + 1 ) + " : ")) for i in range(self.n)]
    
    def disp_sides(self):
        for i in range(self.n):
            print("Side", i + 1, "is", self.sides[i])

```

We can create a class called `Triangle` which inherits from `Polygon`. This makes all the attributes of `Polygon` class available to the `Triangle` class.

```
class Triangle(Polygon):
    def __init__(self):
        Polygon.__init__(self, 3)
        
    def find_area(self):
        a, b, c = self.sides
        s = (a + b + c ) / 2
        area = (s * (s - a)(s - b)(s - c) ** 0.5
        print('The area of the triangle is %0.2f' %area)

```
Even though we did not define mrthods like `input_side()` or `disp_sides` for class `Triangle` separately, we will be able to use them. Also, class `Triangle` has a new method `find_area()` to find and print the area of the triangle.

If an attribute is not found in the class itself, the search continues to the base class. This repeats recursively, if the base class is itself derived from other classes.


#### Method Overriding in Python
In the above example, notice that `__init__()` method was defined in both classes, `Triangle` as well `Polygon`. When this happens, the method in the derived class overrides that in the base class. This is to say, `__init__()` in Triangle gets preference over the `__init__` in `Polygon`.

Generally when overriding a base method, we tend to extend the definition rather than simply replace it. The same is being done by calling the method in base class from the one in derived class (calling `Polygon.__init__()` from  `__init__()` in `Triangle`).

A better option would be to use the built-in function `super()`. So, `super().__init__(3)` is equivalent to `Polygon.__init__(self,3)` and is preferred.

Two built-in functions `isinstance()` and `issubclass()` are used to check inheritances.

The function `isinstance()` returns `True` if the object is an **instance of the class or other classes derived from it**. Each and every class in Python inherits from the base class `object`.

```
>>> isInstance(t, Triangle)
True

>>> isInstance(t, Polygon)
True

>>> isInstance(t, int)
False

>>> isInstance(t, object)
True
```

Similarly, `issubclass()` is used to check for class inheritance.

```
>>> issubclass(Polygon, Triangle)
False

>>> issubclass(Triangle, Polygon)
True

>>> issubclass(bool, int)
True
```






