```js
const object = {
    number : 23
}


  
  
const incr = ({...object}) => {
    object.number += 1 // This will not change the original object
    console.log(object)
}

const incr1 = (object) => {
    object.number += 1 // This will change the original object
    console.log(object)
}

incr(object) // { number: 24 }
console.log(object) // { number: 23 }
incr1(object) // { number: 24 }
console.log(object) // { number: 24 }

```
