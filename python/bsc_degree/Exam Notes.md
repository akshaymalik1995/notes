## Week 1



1. Find the last digit of `7 ** 35`?

```python
num = 7 ** 35
## Using the string
num_str = str(num)
last_digit = int(num_str[-1])
print(last_digit)

## Using the remainder option
last_digit = num % 10
print(last_digit)
```

2. 
```python
# What is the output of the following ?
print(5 - 3)
print(5 - - 3)
print(5 - - - 3)
print(5 - - - - 3)
print(5 - - - - - 3)

OUTPUT:
2
8
2
8
2
```

**3. Parenthesize this expression so that the result is zero.**

> `2 ** 2 - 2 - 2 / 2`

Answer - `(2 ** (2 - 2)) - (2 / 2)`


**4. Operator Precedence in Python**

1. `()`
2. `**`
3. `*`, `/`, `//`, `%`
4. `+`, `-`
5. `==`, `>`, `!=`, `not in`, `is`, `is in`
6. `not`
7. `and`
8. `or`

![image](https://user-images.githubusercontent.com/55041489/124216304-cd625080-daaa-11eb-856a-319f720059ad.png)


**5. Predict the outcome of the following expression:**
  
> `0 == 0 < 1 < 2 < 3 > 2 > 1 > 0 == 0`
  
Because it is executed from left to right, the parenthesis should be like:
  
`0 == ( 0 < ( 1 < ( 2 < ( 3 > ( 2 > ( 1 > ( 0 == 0 )))))))`
  
It is important to note that `1 > True` returns `False` because the value of `True` is   see as 1 and value of `False` is 0.
  
The outcome is `True`
  
**6. `"Akshay" * 3` returns `"AkshayAkshayAkshay"`. So if `some_string` is a string of length `n`, then the string `some_string * n` will have length (n * n).**

**7. If x and y are two strings or two lists, then `len(x) + len(y) == len(x + y)`.**


**8. What does the following code do? `print(input())`.**

It takes the user input and display the input to the console.
  
**8. How do you find out the square root of the number `1234567`**

`1234567 ** 0.5`

  
**9. Find the number of digits in `7 ** 100` ?**

  `len(str(7 ** 100))`
  

**10. How to know if a number is a perfect square ?**

  First Case:
  
  ```python
  num = int(input())
  sq_num = int(num ** 0.5)
  print( num == sq_num ** 2)
  ```
  
  Second Case:
  
  ```python
  num = int(input())
  sq_num = int(num ** 0.5)
  if sq_num % 1 == 0:
    print(True)
   elseL
   print(False)
  ```
  
  

 
**1. What snipped of code will give the following output: `1 2 3 4 5 6` ?**

- print('1 2 3 4 5 6')
- - print(1, end=" ") 
  - print(2, end=" ")
  - print(3, end=" ")
  - print(4, end=" ")
  - print(5, end=" ")
- print(1, 2, 3, 4, 5)

Interestingly, `print(1, 2)` will give a space while printing.

**2. What will be datatype of following expressions:**

> `13 % 5 // 2 * 30 ** 5`
As you notice here, there is no division sign, hence it will not be a float anyway.

> `20 ** 10 / 2 + 25 - 70`

You can see a division sign, hence, it will always be a float.

> `20 * 100.0 // 11 % 5`

There is already a float here, so it will stay float.

**3. How does the Python interpretor parenthesize the following expression?**

> `0 ** 1 ** 2 ** 3 ** 2`

Because, they have equal precedence, it will execute from left to right.

And it will parenthesize the expression as : 
`0 ** ( 1 ** ( 2 ** ( 3 ** 2))`

> `8.2 * 10 ** 4 + 9`

(8. 2 * (10 ** 4)) + 9

First parenthize the Power expression. Then , multiplication expression.

> `not False or True and False`

The order of precedence is :

1. not
2. and
3. or

(not False) or (True and False)

(not False) or True and False >> True or (True and False) >> True or False >> True

**4. What will be the output of the following statement?**
> not 0 and 10 // 5 == 2

Order of precedence:
- `//`
- `==`
- `not`
- `and`

`not 0 and 10 // 5 == 2` >> `not 0 and 2 == 2` >> `not 0 and True` >> `True and True` >> `True`









**1. `False and False` returns `False`**

**2. `False or False` returns `False`**

**3. If `E = False`, then `not not E` also returns `False` because the two `not` gets cancelled.**

**4. `A` and `B` are two boolean values. Consider the following code**

```python
A and B and 1 / 0
```

**What are the possible outputs?**

If A is `False`, then the rest of the line is not executed and we do not get the error from `1/0`. And the second line returns True or False depending on the value of B.

If A is `True` and B is `False`, then also the `1/0` is not executed.

If both A and B are `True`, then `1/0` is executed and it throws an error.

So, the three possible outputs are:
1. `True`
2. `False`
3. `Error`


## Week 2



**1. Rules for Python Variables :**

- It must start with a letter or the underscore character
- It cannot start with a number
- It can contain only alpha-numeric characters and underscores
- Variable names are case sensitive


**2. What will be the output?**

```python

x, y, z = "a" , "b" , "c"
x = y = z
print(x)

OUTPUT:

c
```

**3. Match the operators:**

1. `+` : Concatenates two string
2. `*` : Replicates same string multiples times
3. `[]` : Character of the string using indexing
4. `[:]` : Range slice
5. `in` : Membership check
6. `\` : Escape Characters


**4. String Slicing**

```python
s = "abcdefghijklnopqrstuvwxyz"
# The output in all cases will be : 'zwtqnkheb'

print(s[-a : -len(s) : -3)
# The step is -3, hence we will start from end
# The value of a is 1 because we want z

print(s[::-b])
# The value of b is 3

print(s[c:0:-3])
# The value of c will either -1 , 25 or any number above it.

print(s[len(s) : -d : -3])
# The value of d will be 0 or -26 


```



**1. String or List Unpacking**

```python

a, b, c, d = "ABCD"
a, b, c, d = ["A", "B", "C", "D"]
print(a) # A
print(b) # B
print(c) # C
print(d) # D
```
**2. bool()**

```python

print(bool(" ")) # True
print(bool("")) # False
print(bool(0)) # False
print(bool(1)) # True
print(bool([])) # False
print(bool(False)) # False
print(bool("False")) # True
```


**3. The `and` operator***

```python

if int(input()) > 0 and int(input()) < 0:
  print("OK")
  
# Does the code always accepts two inputs?
# No. If the condition before the 'and' returns False, the rest of the code is not evaluated.

if a and b or c:
  print("OK")
  
# "OK" will be printed if a is True and  one of b and c is True.

```

## Week 3


**1. String Formatting**

ROUND FORMAT SPECIFIER

```python
x = 22/7
print(f"{x:.2f}") # 3.14
print("{0:.2f}".format(x)) # 3.14
print("%.2f" % (x))
```
INDENT FORMAT SPECIFIER

```python

print('{:5d}'.format(1))   #     1
print('{:5d}'.format(11))  #    11
print('{:5d}'.format(111)) #   111
# Here we are stating that we want minimum 5 characters
# We cannot use {:5s}
# However while using modulo operator, we can use both %5s and %5d

```

SPACES BEFORE AND AFTER THE STRING

```python
str = "T"
# Include 3 spaces after the string
print("%-4s"%str, str) # T   T
# For any string T, print("%ns"%str) format method adds (n - len(str)) blank space to the right of T if n is a negative number and adds (n - len(str)) to the left of T if n is a positive integer.
# n - len(str) should be greater than zero


name = "Akshay"
# Add five spaces before variable name
print("%11s"%name) #     Akshay
# It means that we want minimum 11 characters
```

ADD PADDING TO NUMBERS

```python
date = 7
print(f"{date:02}") # 07
print(f"{date:03}") # 007
date = 11
print(f"{date:03}") # 011
```

THE `SEP` ARGUMENT

```python
d = 10
m = 5
y = 2021

print(d, m, y) # 10 5 2021
print(d, m, y, sep="/") # 10/5/2021

```

PRINT USING STRING MODULO OPERATOR

```python
num = 6
for i in range(1, 11):
print("%d x %d = %d" % (num , i , num * i)) # 6 x 1 = 6 ...
print(num, 'x', i, '=', num * i) # 6 x 1 = 6 ...
print("{0} x {1} = {2}".format(num, i , num * i)) # 6 x 1 = 6 ...

# For integer, we used %d
# For float, we will use %f
# The modulo %f prints decimal values upto 5
```


**2. TIPS**

1. Write the code.
2. Do not hurry.
3. Run the test cases.
4. Mark the options only when you are very sure.

**3. CONTINUE KEYWORD**

```python
# What does the following code block print?
for i in "we are in question one":
  if i == 'a' or i == 'e' or i == 'i' or i == 'o' or i == 'u':
    continue # skip the rest of the code
  print(i , end='')
  
# OUTPUT:
# w r n qstn n

```

**4. PRINT "HELLO WORLD" 10 TIMES WITHOUT USING LOOP**

`print("Hello Python!\n" * 10)`

**5. What is the output of : **

`print(-104 % 10)` >> 6

`print(-123 % 100)` >> 77

`print(-123 % -100)` >> -23

**6. THE BREAK STATEMENT**

```python
# How many times do the break statement get executed?

for i in range(10):
  for j in range(10):
    break
  break
  
# The break statement ends the loop
# Since there are only two loops
# It will be executed only two times

```

**7. INCOMPATIBLE INCREMENT SIZE**

```python

for i range(10, 0, 1):
  print(i)
# The print statement will not be executed due to incompatible step size


# How many times will the print statment gets executed?
for i in range(1231, -12420, -7):
  print(i)
  
# It is an Arithmetic Progression

-12420 = 1231 + (n - 1)-7
-13551 / -7 = n - 1
n = 1951
```

## Week 9

**1. READLINE() AND READLINES()**

```
# test.txt
111
222
333
444
555
666
```


```python
# CODE - 1
file = open("test.txt", 'r')
a = file.readline() # Read the first line
b = file.readlines() # Rest the rest of the lines and put them in a list
c = b[2] # c == 444 because b[0] == 222
file.close()

```

> f.readline() gives `\n` for empty lines.

```python
# CODE - 1
file = open("test.txt", 'r')
d = file.readlines() # Read all the lines and put them in a list
e = file.readline() # Since all the lines have been read,
# it is an empty string
f = d[0] # f == 111
file.close()

```


**2. f.closed**

```python
# What will this function return?
def isFileClosed():
  f = None
  f = open("test.txt", 'r')
  return f.closed

# f.closed checks whether the file is closed or not.
# In the above function, the file is not closed so it returns False
```

**3. Append File**

```python
# What will the function appendFile() return ?
def appendFile():
  f = open("test.txt", "a")
  f.writelines('777')
  f.close()
  f = open("test.txt", "r")
  c = f.readlines()
  f.close()
  return c[6]
# It will throw an error
# It will append 777 in the last line of the file which is 666
# The file still has six lines, the 6th line being 666777

# f.write() would have worked in the same way
```

**4. FILE MODES AND ERRORS**

1. For `f = open('test.txt', "r")`, if the file does not exist, an error occurs.
2. For `f = open('test.txt', "w")`, if the file does not exist, a new file is created.
3. For `f = open('test.txt', "w")`, if the file already exists, the existing file is overwritten with the new file.
4. For `f = open('test.txt', "a)`, if the file does not exist, a new file is created.


**5. QUESTION**

```python
# file1.txt is a file having some text and file2.txt does not exist before.
f1 = open('file1.txt', 'r')
f2 = open('file2.txt', 'w')
line = ' '
for line in f1.readlines():
  f2.write(line.replace('\t', ' '*4).rstrip()+'\n')
f1.close()
f2.close()

# All the tabs are not removed because replace() method only replaces the first tab.
# All spaces at the end of the lines are removed in files2.txt
# The number of lines in file1.txt and file2.txt are the same.
```

**6. OPEN A CSV FILE USING PANDAS**

`pd.read_csv('file.csv')`

**7. Pandas Commands**

1. `data_df.sort_values(by = ['Total'])` : Arrange dataset data_df on the column Total in asc / desc order.
2. `data_df['DateOfBirth'].count()` : Count non empty (non missing) values in column 'DateOfBirth'
3. `data_df.groupby('Gender').groups` : Group score dataset on a 'Gender' column.
4. `data_df['Total'].sum()` : 


**8. WAYS OF GETTING THE SHAPE OF THE DATAFRAME**

1. data_df.shape[0], data_df.shape[1]
2. data_df.count().max(), len(data_df.columns)
3. len(data_df), len(list(data_df))


**9. Also Revise Week 8 from the notes you have created for it specifically**
