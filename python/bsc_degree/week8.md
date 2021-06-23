# Python Week 8

## Introduction to recursion

**The philosophy behind recursion:**

1. It is helpful in breaking the problem into smaller parts.
2. It is used when you have to perform the same operation on sub-problems.
3. A base operation stops the recursion from going into infinite loop.
4. Recursion is used when the outcome of an operation is required to perform the next operation.

![image](https://user-images.githubusercontent.com/55041489/123040885-1f9fd380-d412-11eb-8ab3-104f14615866.png)


### Print first n natural numbers:

```python
def naturals(n):
    if n < 1:
        print("Recursion stops here")
    else:
        naturals(n - 1)
        print(n)
    
```

`naturals(5)`:
```
1. naturals(5)
2.      naturals(4)
3.          naturals(3)
4.              naturals(2)
5.                  naturals(1)
6.                      naturals(0)
7.                      print('Recursion stops here')
8.                  print(1)
9.              print(2)
10.          print(3)
11.      print(4)
12. print(5)

```


### Check zero in a list recursively

```python
# Check Zero on a list

arr = [1,2 , 3, 4, 1, 9]

def checkZero(arr):
    if len(arr) < 1:
        return False
    if arr[0] == 0:
        return True
    else:
        return checkZero(arr[1:])

print(checkZero(arr))

'''This is not an effficient code'''

```

## Sorting Recursively


```python

arr = [5, 4, 3, 2, 1]

def sort(L):
    if not L:
        return L[:]
        
    mini = min(L)
    L.remove(mini)
    return [mini] + sort(L)
    
print(sort(arr))
```

![image](https://user-images.githubusercontent.com/55041489/123045026-10bc1f80-d418-11eb-9d86-52872b450f40.png)

## Binary Search



