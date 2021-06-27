

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



![image](https://user-images.githubusercontent.com/55041489/123532191-cba23100-d728-11eb-832d-71fe343819cb.png)

We can also serve javascript and css files accordingly. We just have to put the in the `public` folder.


### Creating An API


```js
const members = [
    {name : "Akshay"},
    {name : "Rahul"},
    {name : "Anubhav"},
    {name : "Abhi"},
]


// Set Routes
server.get('/api/members', (request, response) => response.json(members))

```

![image](https://user-images.githubusercontent.com/55041489/123532750-89c7b980-d72d-11eb-933a-970f1a6699a2.png)



**Putting our data in a seperate file**

```js
// Members.js
const members = [
    {name : "Akshay"},
    {name : "Rahul"},
    {name : "Anubhav"},
    {name : "Abhi"},
]

module.exports = members
```

Import it: `const members = require('./Members')`

**Creating a Middleware**

```js
// Middleware

const logger = (request, response, next) => {
    console.log(`${request.protocol}://${request.get('host')}${request.originalUrl}`)
    next()
}

// Init Middleware

server.use(logger)
```

Every time a request is sent, the middleware function will run.

![image](https://user-images.githubusercontent.com/55041489/123532917-145ce880-d72f-11eb-844a-3944efdbc8e7.png)


**GETTING A SINGLE MEMBER**

```js
// Single Member

server.get("/api/members/:id", (request, response) => {
    const id = request.params.id
    const [data] = members.filter(member => member.id === Number(id))
    if (data) {
        response.json(data)
    }
    else {
        response.status(400).json({msg : `No member with the id ${id}`})
    }
   
})
```

![image](https://user-images.githubusercontent.com/55041489/123533202-13c55180-d731-11eb-9972-1dedb62fba8c.png)

![image](https://user-images.githubusercontent.com/55041489/123533220-293a7b80-d731-11eb-94eb-86368273b960.png)


### Separate Folder for Routes

```js
// routes/api/memners.js

const express = require('express')
const router = express.Router()
// Import data
const members = require('../../Members')
// Get all members
router.get('/', (request, response) => {
    response.json(members)
})

// Single Member

router.get("/:id", (request, response) => {
    const id = request.params.id
    const [data] = members.filter(member => member.id === Number(id))
    if (data) {
        response.json(data)
    }
    else {
        response.status(400).json({msg : `No member with the id ${id}`})
    }
   
})

module.exports = router



```



```js
// index.js

// Set Routes
server.use('/api/members', require('./routes/api/members'))
```

Create a Member

```js
// routes/api/memners.js
// Create Member
router.post('/', (request, respond) => {
    response.send(request.body)
})
```

```js
// index.js
// Body Parser Middleware

server.use(express.json())
server.use(express.urlencoded({extended : false}))

```

Create id with uuid

`npm i uuid`


```js
// routes/api/memners.js
// Create Member
router.post('/', (request, response) => {
    const newMember = {
        id: uuid.v4(),
        name: request.body.name
    }

    if (!newMember.name) {
        response.status(400).json({msg : 'Please include a name'})
    }

    members.push(newMember)

    response.json(members)
})
})
```

![image](https://user-images.githubusercontent.com/55041489/123533610-62c0b600-d734-11eb-8e29-be5a7d1e8301.png)




