Let's say we have a file `scores.csv`.

![image](https://user-images.githubusercontent.com/55041489/124078492-c250e700-d9fc-11eb-916e-073ccf920412.png)


**Which student got the maximum marks ?**

File Handling Approach

```python
f = open('scores.csv`, 'r')
scores = f.readlines()[1:]
max = 0
for record in scores:
    fields = record.split(',')
    if int(fields[-1]) > max:
        max = int(fields[-1])
 print(max)

```

Pandas Approach

```python
import pandas as pd
data = pd.read_csv('scores.csv')
print(scores['Total'].max())
```

**SOME OTHER COMMANDS**

1. `scores.shape`
2. `scores.count()`
3. `scores['Total'].max()`
4. `scores['Total'].min()`
5. `scores['Total'].sum()`
6. `scores['Total'].sort_values()`
7. `scores['Total'].sort_values(ascending = False)`

A DataFrame is nothing but a 2-D data structure to store tabular data.

A specific column in a DataFrame is referred to as Series

8. `type(scores)`
9. `type(scores['Total'])`
10. `pandas.head(10)`
11. `pandas.tail(10)`

**HOW TO ACCESS ENTIRE ROW BASED ON A COLUMN ENTRY**

12. `scores[scores['Name'] == 'Nisha']`

What happened here is that it will print all the rows which would return True on the given condition.

**FIND MARKS OF A TOPPER GIRL AND TOPPER BOY**

```python
boys  = scores[scores['Gender'] == 'F']
girls  = scores[scores['Gender'] == 'M']
print(boys['Total'].max())
print(girls['Total'].max())
```

**Categorize students into four groups based on their physics marks**

```python
A = scores[scores['Physics'] > 85]
B = scores[scores['Physics'].between(70 , 85)] #ends are inclusive
C = scores[scores['Physics'].between(60 , 70)] #ends are inclusive
D = scores[scores['Physics'] < 60]
```

**APPLYING TWO CONDITONS**

FINDING HOW MANY GIRLS HAVE SCORED MORE THAN 85 MARKS IN PHYSICS

```python

G85 = scores[scores['Physics'] > 85][scores['Gender'] == 'F'] 
G85 = scores[(scores['Physics'] > 85) & (scores['Gender'] == 'F')]

```

**COUNTING STUDENTS IN ALL THE THREE SUBJECTS WHO SCORED MORE THAN 85 BASED ON GENDER**

```python

subjects = ['Mathematics', 'Physics', 'Chemistry']
genders = ['F', 'M']
for sub in subjects:
    for gender in genders:
        count = scores[scores[sub] > 85][scores['Gender'] == gender].count()
        print(count)
    


```


**COUNTING IN ALL THREE SUBJECTS HOW MANY STUDENTS SCORED ABOVE AVERAGE** 


```python

subjects = ['Mathematics', 'Physics', 'Chemistry']
genders = ['F', 'M']
for sub in subjects:
    avg = scores[sub].mean()
    for gender in genders:
        count = scores[scores[sub] > avg][scores['Gender'] == gender].count()
        print({"Gender" : gender, "Subject" : sub, "Count" : count})


```

**GROUP BY**

FIND OUT WHO SCORED BETTER IN PHYSICS, BOYS OR GIRLS ? 

```python
df1 = scores.groupby('Gender')['Physics'].mean()
print(scores.groupby('Gender').groups) # it returns a dictionary 
```







