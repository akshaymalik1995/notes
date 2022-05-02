# Introduction to Iterators

```js
// Introduction to Iterators

const friends = ['Akshay', 'Shubham', 'Anubhav']
// We will create a custom iterator to loop in reverse order

// Every iterable object has a Symbol.iterator property.
// To create a custom iterator, we can access that property...
// and set it to a function which will return an object.
// That object will have a next method which will return an object with...
// two properties.
// Those two properties will be value and done.

friends[Symbol.iterator] = () => {

    let len = friends.length
    return {
        // It is this next method which will get executed with every iteration
        
        next : () => {
            len = len - 1
            return {
            value: friends[len], // This will be our next value
            done : len < 0 // Iteration will stop when this is false
            }
            
        }
    }
}

for (const friend of friends) {
    console.log(friend)
}

```
