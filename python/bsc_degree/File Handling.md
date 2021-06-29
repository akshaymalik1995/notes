# File Handling in Python

Python alllow users to handle files i.e., to read and write files, along with many other file handling options, to operate on files.

Python treats file differently as text or binary. Each line of code include a sequence of characters and they form text file.

Each line is terminated with a special character, called the EOL or End of Line characters like comma, or newline character. It ends the current line and tell the interpreter a new line has begun.

## Working with open() function

We use `open()` function in python to open a file in read or write mode. `open()` will return a file object. To return a file object we use `open()` function along with two arguments, that accepts file name and the mode, whether to read or write.

So, the syntax being: `open(filename, mode)`. There are three kinds of mode, that python provides and how files can be opened:
- "r", for reading
- "w", for writing
- "a", for appending
-  "r+", for both reading and writing


If the mode argument is not passed, then python will assume it to be "r" by default.

```python
file = open('file.txt', r)
print(file)

OUTPUT:

<_io.TextIOWrapper name='file.txt' mode='r' encoding='cp1252'>
```

```python
# Open a text file in a read mode
f = open("file.txt")
# Print each line of the file
for line in f:
    print(line)

OUTPUT:

This is a text file.

The is the second line.
```

```python
# Open a text file in a read mode
# What happens when the file does not exist :
f = open("files.txt", "r")
# Print each line of the file
print(f)

OUTPUT:

Traceback (most recent call last):
  File "a:/code_snippets/Python File Handling/app.py", line 3, in <module>
    f = open("files.txt", "r")
FileNotFoundError: [Errno 2] No such file or directory: 'files.txt'
```


## Working with read() mode

There is more than one way to read a file in python.

If you need to extract a string that contains all characters in the file then we can use `file.read()`.

```python
# Open a text file in a read mode
f = open("file.txt", "r")
# Read file with file.read()
print(f.read())

```

Another way to read a file is to call a certain number of characters.

```python
# Open a text file in a read mode
f = open("file.txt", "r")
# Read file with file.read(). And have only 20 characters
print(f.read(20))
```

`f.readline()` will give us the first line. However, if you execute it again, it will give you the next line. It can be used in a while loop or a for loop.

## Create a file using write() mode

```python

# create a new file
f = open("file1.txt", "w")
f.write("First Line\n")
f.write("Second Line\n")
f.close()
```

The close() command terminates all the resources in use and frees the system of this particular program.

## Working of append mode

```python
# Open the file in the append mode
f = open("file1.txt", "a")
f.write("New added line\n")
f.close()

```

`rstrip()` : This function strips each line of a file off space from the right-hand side

`lstrip()` : This function strips each line of a file off space from the left-hand side

`splitlines()` :

```python
f = open("file.txt", "r+")
print(f.read().splitlines())
f.close()


OUTPUT:

['This is a text file.', 'The is the second line.']


```

`split()` :

```python
f = open("file.txt", "r+")
print(f.read().split("."))
f.close()

OUTPUT: 

['This is a text file', '\nThe is the second line', '']
```

## Working with `with()`

Using this method any files opened will be closed automatically after one is done, so auto-cleanup.

```python
with open("file.txt", 'r+') as f:
    print(f.read())
```

If you get the error `UnicodeDecodeError: 'charmap' codec can't decode byte 0x9d in position 1006: character maps to <undefined>`, then specify the encoding as utf-8

## Encrypt a Text File

```python

# Open the file
f = open("file.txt", "r+", encoding="utf-8")
# Create a list of lowercase and uppercase letters
lower_letters = "abcdefghijklmnopqrstuvwxyz"
upper_letters = lower_letters.upper()

# Set the encryption code
# This would mean by how many positions we want to shift a letter
encryption_code = 3

new_str = ""

# Loop through all the charcaters
for letter in f.read():
    # check for lowercase letters
    if letter in lower_letters:
        new_letter = lower_letters[(lower_letters.index(letter) + encryption_code) % 26]
        new_str = new_str + new_letter
    # check for uppercase letters
    elif letter in upper_letters:
        new_letter = upper_letters[(upper_letters.index(letter) + encryption_code) % 26]
        new_str = new_str + new_letter
    else:
        new_str = new_str + letter

# Create a new file
new_file = open("cryptd_file.txt", "w")
new_file.write(new_str)
new_file.close()  

```

## Decrypt a text file

```python

# Open the file
f = open("encrypted.txt", "r+", encoding="utf-8")
# Create a list of lowercase and uppercase letters
lower_letters = "abcdefghijklmnopqrstuvwxyz"
upper_letters = lower_letters.upper()
# Set the decryption code
# This would mean by how many positions we want to shift a letter
decryption_code = 3
new_str = ""

# Loop through all the charcaters
for letter in f.read():
    # check for lowercase letters
    if letter in lower_letters:
        new_letter = lower_letters[(lower_letters.index(letter) - decryption_code) % 26]
        new_str = new_str + new_letter
    # check for uppercase letters
    elif letter in upper_letters:
        new_letter = upper_letters[(upper_letters.index(letter) - decryption_code) % 26]
        new_str = new_str + new_letter
    else:
        new_str = new_str + letter

# Create a new file
new_file = open("decrypted.txt", "w")
new_file.write(new_str)
new_file.close()

        


```
