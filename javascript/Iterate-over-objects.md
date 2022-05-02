# How to iterate over objects in Javascript
```js
const obj = {
    name : "Akshay",
    details : {
        age : 27,
        country : "India"
    }
}

// We want to iterate over this object

// We will create a function
function iterOverObject(object) {
    for (const key of Object.keys(object)){
        
        const value = object[key]
        if (typeof(value) == 'object') {
            iterOverObject(value)
        } else {
            console.log(`${key} : ${value}`)
        }
    }
}

iterOverObject(obj)
```
