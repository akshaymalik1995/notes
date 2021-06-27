

### Basic Server Syntax

Install express: `npm i express`

```js
// Import express
const express = require('express')

// Inititate express
const server = express()

// Create route handlers
server.get("/", (request, response) => {
    response.send("Hello from the server")
})

// Create a PORT constnat
// Either the port number is 3000 or look for the port in env config file
const PORT = process.env.PORT || 3000

// Listen on a port and adding a callback function that log that the server has started
server.listen(PORT, () => console.log(`Server started on port ${PORT}`))
```


**Install `nodemon` which will constantly watch our server and update without restarting the server**

`npm i -D nodemon`

To use nodemon, we need to create a script in the package.json file.

```
 "scripts": {
    "start": "node index",
    "dev" : "nodemon index"
  },
```

`npm run dev`

### Serving the HTML FIle

```js

// Import PATH
const path = require('path')
// Create route handlers
server.get("/", (request, response) => {
    // Serving the HTML file
    response.sendFile(path.join(__dirname, 'public', 'index.html'))
})
```


### Another way of serving HTML files

```js
// Import PATH
const path = require('path')

// set static folder
// Now we do not need to create routes
// All the files in the public folder will be served and routes will be create automatically
server.use(express.static(path.join(__dirname, 'public')))
```



