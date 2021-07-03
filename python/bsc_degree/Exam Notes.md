## Week 1

### Activity Questions

1. Find the last digit of `7 ** 35`?

```
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


3. Parenthesize this expression so that the result is zero.

  `2 ** 2 - 2 - 2 / 2`

  Answer - `(2 ** (2 - 2)) - (2 / 2)`


**Operator Precedence in Python**

![image](https://user-images.githubusercontent.com/55041489/124216304-cd625080-daaa-11eb-856a-319f720059ad.png)


4. Predict the outcome of the following expression:
  
  `0 == 0 < 1 < 2 < 3 > 2 > 1 > 0 == 0`
  
  Because it is executed from left to right, the parenthesis should be like:
  
  `0 == ( 0 < ( 1 < ( 2 < ( 3 > ( 2 > ( 1 > ( 0 == 0 )))))))`
  
  It is important to note that `1 > True` returns `False` because the value of `True` is   see as 1 and value of `False` is 0.
  
  The outcome is `True`
  

5. `"Akshay" * 3` returns `"AkshayAkshayAkshay"`. So if `some_string` is a string of length `n`, then the string `some_string * n` will have length (n * n).

6. If x and y are two strings or two lists, then `len(x) + len(y) == len(x + y)`.


7. What does the following code do? `print(input())`.

  It takes the user input and display the input to the console.
  
8. How do you find out the square root of the number `1234567`

  `1234567 ** 0.5`
  
9. Find the number of digits in `7 ** 100` ?

  `len(str(7 ** 100))`

10. How to know if a number is a perfect square ?

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
 
**What snipped of code will give the following output: `1 2 3 4 5 6` ?**

- print('1 2 3 4 5 6')
- print(1, end=" ") 
  print(2, end=" ")
  print(3, end=" ")
  print(4, end=" ")
  print(5, end=" ")
- print(1, 2, 3, 4, 5)

Interestingly, `print(1, 2)` will give a space while printing.

**What will be datatype of following expressions:**

- `13 % 5 // 2 * 30 ** 5`

As you notice here, there is no division sign, hence it will not be a float anyway.

- `20 ** 10 / 2 + 25 - 70`

You can see a division sign, hence, it will always be a float.

- `20 * 100.0 // 11 % 5`

There is already a float here, so it will stay float.

How does the Python interpretor parenthesize the following expression?

`0 ** 1 ** 2 ** 3 ** 2`

Because, they have equal precedence, it will

