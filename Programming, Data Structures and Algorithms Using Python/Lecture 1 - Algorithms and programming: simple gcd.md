## What is an algorithm?

- Algorithm: how to systematicall perform a task
- Write down a sequence of tasks
  - "Recipe", or program
- Programming language describes the steps
  - What is a step? Degrees of detail
  - "Arrange the chairs" vs "Make 8 rows with 10 chairs in each row"
  - Different level of details are required to be given in different problems.
  - $`f(x, y) = x^y`$


## Our Focus
- ALgorithm that manipulate information
  - Compute numerical functions - $`f(x, y) = x^y`$
  - Reorganize data - arrange in ascending order
  - Optimization - find the shortest route
  - And more:
    - Solve Sudoku, play chess, correct spelling...

## Greatest Common Divisor

- gcd(m , n)
  - Largest `k` such that `k` divides `m` and `k` divides `n`
- 1 divides every number'
- Atleast one common divisor for every `m` and `n`

## Computing gcd(m , n)
- List out factors of m
- List out factors of n
- Report the largest number that appear on both lists
- Is this a valid algorithm?
  - Finite represenation of the "recipe"
  - Terminates after a finite number of steps
-  Factors of `m` must be betweeb 1 and `m`
  - Test each number in the range
  - If it divides `m` without a remainder, add it to the list of factors

## Example gcd(16, 63)
- Factors of 14 : `1, 2, 7, 14`
- Factors of 63: `1, 3, 7, 9, 21, 63`
- Construct list of common factors
  - For each factor of 14, check if it is a factor of 63 :  `1, 7`
- Return largest factor in this list: `7`




## An algorithm for gcd(m , n)

- Use `fm`, `fn` for list of factors of `m`, `n`, respectively
- For each `i` from 1 to `m`, add `i` to `fm` if `i` divides `m`
- For each `j` from 1 to `n`, add `j` to `fn` if `j` divides `n`
- Use `cf` for list of common factors
- Return largest (rightmost) value in `cf`

## Our first Python program
```py
def gcd(m , n):
  fm = []
  for i in range(1, m + 1):
    if m % i == 0:
      fm.append(i)
  fn = []
  for j in range(1, n + 1):
    if n % j == 0:
      fn.append(j)
  
  cf = []
  for f in fm:
    if f in fn:
      cd.append(f)
  
  return cd[-1]
```
