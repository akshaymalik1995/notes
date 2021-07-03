## Week 1

### Activity Questions

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
  
  
 ### Practice Assignment
 
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






### Graded Assignment


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

