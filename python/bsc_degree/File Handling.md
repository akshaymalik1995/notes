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
for line in file:
    print(line)

```
