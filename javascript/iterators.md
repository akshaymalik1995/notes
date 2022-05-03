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

# Create range() with iterator

```js
// We will create a range() function using iterator object


const range = (start, end, step=1) => {
    start -= step
    // range would become iterable if it returs an object...
    // which has [Symbol.iterator] method
    return {
        [Symbol.iterator] : () => {
            // [Symbol.iterator] must return an object with the next method
            return {
                // next must return an object with the value and done properties
                next : () => {
                    start += step
                    return {
                        value : start,
                        done : start > end
                    }
                }
            }
        }
        
    }
}


// You can destructure only an iterable object
let result = [...range(1, 9, 3)]
console.log(result)
```









