# A FastAPI Application

Let’s write a teeny FastAPI application—a web service with a single endpoint. 
For now, we’re in what I’ve called the Web layer, handling only web requests and responses. First, install the basic Python packages that we’ll be using:

- The FastAPI framework: `pip install fastapi`
- The Uvicorn web server: `pip install uvicorn`

We can also install all the packages associated with the development of a FastAPI application using the following command:
```py
pip install fastapi[all]
 ```

**Example 3-1 (hello.py)**
```py
from fastapi import FastAPI
app = FastAPI()
@app.get("/hello")
def greet():
    return "Hello World"
```

Here are some points to notice:
- `app` is the top-level FastAPI object that represents the whole web application.
- `@app.get("/hello")` is a path decorator. It tells FastAPI the following:
    - A request for the URL "/hello" on this server should be directed to the following function
    - This decorator applies only to the HTTP GET verb. You can also respond to a "/hello" URL sent with the other HTTP verbs (PUT, POST, etc.), each with a sepa rate function
- `def greet()` is a path function—the main point of contact with HTTP requests and responses. In this example, it has no arguments, but the following sections show that there’s much more under the FastAPI hood.

The next step is to run this web application in a web server. FastAPI itself does not include a web server but recommends Uvicorn. You can start Uvicorn and the FastAPI web application in two ways: externally or internally.

**Example 3-2. Start Uvicorn with the command line**
```
$ uvicorn hello:app --reload
```
The `hello` refers to the `hello.py` file, and `app` is the FastAPI variable name within it.

**Example 3-3. Start Uvicorn internally**
```py
from fastapi import FastAPI
app = FastAPI()
@app.get("/hello")
def greet():
    return "Hello? World?"
if __name__ == "__main__":
     import uvicorn
     uvicorn.run("hello:app", reload=True)
```

In either case, that `reload` tells Uvicorn to restart the web server if `hello.py` changes.

Either case will use port 8000 on your machine (named localhost) by default. Both the external and internal methods have `host` and `port` arguments if you’d prefer something else.

Now the server has a single endpoint `/hello` and is ready for requests.
