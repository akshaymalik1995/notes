# HTTP Requests

Web requests squirrel data in different parts of an HTTP request, and FastAPI lets you access them smoothly.

**Example 3-10. An HTTP request**

```
 GET /hello HTTP/1.1
 Accept: /
 Accept-Encoding: gzip, deflate
 Connection: keep-alive
 Host: localhost:8000
 User-Agent: HTTPie/3.2.1
```

 This request contains the following:
 - The verb `GET` and path `/hello`
 - Any query parameters (text after any `?` in this case, none)
 - Other HTTP headers
 - No request body content

FastAPI unsquirrels these into handy definitions:
- **Header**: The HTTP headers
- **Path** : The URL
- **Query**: The query parameters (after the `?` at the end of the URL)
- **Body**: The HTTP body

The way that FastAPI provides data from various parts of the HTTP requests is one of its best features and an improvement on how most Python web frameworks do it. All the arguments that you need can be declared and provided directly inside the path function, using the definitions in the preceding list (Path, Query, etc.), and by functions that you write. This uses a technique called dependency injection.

Let’s make our earlier application a little more personal by adding a parameter called `who` that addresses that plaintive Hello? to someone. We’ll try different ways to pass this new parameter:
 - In the URL path
 - As a query parameter, after the ? in the URL
 - In the HTTP body
 - As an HTTP header

## URL Path

**Example 3-11. Return the greeting path**

```py
from fastapi import FastAPI
app = FastAPI()
@app.get("/hello/{who}")
def greet(who):
	return f"Hello? {who}?"
```

Adding that `{who}` in the URL (after `@app.get`) tells FastAPI to expect a variable named `who` at that position in the URL. FastAPI then assigns it to the `who` argument in the following `greet()` function. This shows coordination between the path decorator and the path function.

## Query Parameters
 Query parameters are the `name=value` strings after the `?` in a URL, separated by & characters.

**Example 3-15. Return the greeting query parameter**
```py
from fastapi import FastAPI
app = FastAPI()
@app.get("/hello")
def greet(who):
	return f"Hello? {who}?"
```

The endpoint function is defined as `greet(who)` again, but `{who}` isn’t in the URL on the previous decorator line this time, so FastAPI now assumes that who is a query parameter.

## Body
We can provide path or query parameters to a GET endpoint, but not values from the request body. In HTTP, GET is supposed to be idempotent—a computery term for ask the same question, get the same answer. HTTP GET is supposed to only return stuff. The request body is used to send stuff to the server when creating (POST) or updating (PUT or PATCH).

**Example 3-21. Return the greeting body**

```py
from fastapi import FastAPI
app = FastAPI()
@app.get("/hello")
def greet(who:str = Body(embed=True)):
	return f"Hello? {who}?"
```

That `Body(embed=True)` is needed to tell FastAPI that, this time, we get the value of who from the JSON-formatted request body. The embed part means that it should look like `{"who": "Mom"}` rather than just "Mom".

## HTTP Header

**Example 3-24. Return the greeting header**


```py
from fastapi import FastAPI
app = FastAPI()
@app.get("/hello")
def greet(who:str = Header()):
	return f"Hello? {who}?"
```

FastAPI converts HTTP header keys to lowercase, and converts a hyphen `(-)` to an underscore `(_)`

So you could print the value of the HTTP User-Agent header like this:
```py
from fastapi import FastAPI
app = FastAPI()
@app.get("/hello")
def greet(user_agent:str = Header()):
	return user_agent
```


 
