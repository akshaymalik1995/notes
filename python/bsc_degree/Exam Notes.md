## Week 1

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

