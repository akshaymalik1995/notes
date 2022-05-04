## Can we do better?

- We scanned from 1 to `m` to compute `fm` and again from 1 to `n` to compute `fn`
- Why not a single scan from 1 to `max(m, n)`?
    - For each `i` in 1 to `max(m, n)`, add `i` to `fm` if `i` divides `m` and `i` to `fn` if `i` divides `n`

## Even better?
- Why compute two lists and then compare them to compute common factors `cf`? Do it in one shot.
    - For each `i` to 1 to `max(m, n)`, if `i` divides `m` and `i` also divides `n`, then `i` to `cf`
-  Actually, any common factor must be less than `min(m, n)`
    - For each `i` to 1 to `min(m, n)`, if `i` divides `m` and `i` also divides `n`, then `i` to `cf`

## A shorter python program

```py
def gcd(m, n):
    cf = []
    for i in range(1, min(m , n) + 1):
        if (m % i ) == 0 and (n % i ) == 0;
            cf.append(i)
    return cf[-1]

```

## Do we need lists at all?

- We only need the largest common factor
- 1 will always be a common factor
- Each time we find a larger common factor, discard the previous one
- Remember the largest common factor seen so far and return it
    - `mrcf` - most recent common factor

## No lists!

```py
def gcd(m, n):
    mrcf = 1
    for i in range(1, min(m , n) + 1):
        if (m % i ) == 0 and (n % i ) == 0;
            mrcf = i
    return mrcf
```

## Scan backwards?

- To find the largest common factors,  start at the end and work backwards
- Let `i` run from `min(m, n)` to `1`

```py
def gcd(m, n):
    i = min(m , n)
    while i > 0:
        if (m % i ) == 0 and (n % i ) == 0;
            return i
        else:
            i = i - 1
```

## A new kind of repition

```
while condition:
    step 1
    step 2
    ...
    step k
```

-  This is useful when we do not know how many times we will repeat the steps
-  One should be careful to ensure that the loop terminates - eventually, the condition should become false.

## Summary

- With a little thought, we have dramatically simplified our naive algorithm
- Though the newer versions are simpler, they all take time proportional to the values `m` and `n`
- A much more efficient approach is possible


