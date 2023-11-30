# HTTP Responses

```py
from fastapi import FastAPI
app = FastAPI()
@app.get("/hello")
def greet():
	return "Hello World"
```

By default, FastAPI converts whatever you return from your endpoint function to JSON; the HTTP response has a header line `Content-type: application/json`.

## Status Code
By default, FastAPI returns a 200 status code; exceptions raise 4xx codes.

In the path decorator, specify the HTTP status code that should be returned if all goes well (exceptions will generate their own codes and override it).

**Example 3-28. Specify the HTTP status code (add to hello.py)**

```py
from fastapi import FastAPI
app = FastAPI()
@app.get("/hello")
def greet(status_code=200):
	return "Hello World"
```


## Headers

You can inject HTTP response headers.
```py
from fastapi import FastAPI, Response
app = FastAPI()
@app.get("/hello")
def greet(response:Response):
	response.headers['Content-Type'] = 'application/json'
	return "Hello World"
```


