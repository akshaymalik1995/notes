# __proto__

`__proto__` is a way to inherit properties from an object in Javascript. `__proto__` a property of `Object.prototype` is an ancestor property that exposes the [[Prototype]] of the object through which it is accessed.

```js
const obj = {
    method: function() {
        console.log("method in obj")
    }
}
const obj2 = {}
obj2.__proto__ = obj
obj2.method() // method in obj
```

We access the `__proto__` of `obj2` and set it to `obj`. This will copy all the properties of the `obj` accessible via `Object.prototype` to `obj2`.

`obj2` has inherited the properties of `obj`, so the `method` method property will be available in its properties.

proto is used on Objects e.g object literal, Object, Array, Function, Date, RegEx, Number, Boolean, String.

Using proto is the same thing as using the `extends` keyword in OOP languages.

# Object.create() and Object.getPrototypeOf()


```js
const obj1 = {
    name : "Akshay",
    age: 26
}

// Create a new object with obj1 as its prototype
const obj2 = Object.create(obj1)
console.log(obj2.name) // Akshay

// You can know the prototype of an object using Object.getPrototypeOf()
console.log(Object.getPrototypeOf(obj2)) // { name: 'Akshay', age: 26 }

```

# Functional Prototype Chain

```js

function Car(wheels, fuel, speed) {
    this.wheels = wheels,
    this.fuel =  fuel, 
    this.speed = speed
}

const car1 = new Car(4, 95, 120)
const car2 = new Car(4, 60, 100)
console.log(car1) //  Car { wheels: 4, fuel: 95, speed: 120 }
console.log(car2) // Car { wheels: 4, fuel: 60, speed: 100 }

// If we want to create a property or method that will be shared by every object,
//// we can attach that property or method to the prototype property of parent prototype.
Car.prototype.fuelBurnt = function () {
    console.log(100 - this.fuel)
}



car1.fuelBurnt() // 5
car2.fuelBurnt() // 40

console.log(car1.fuelBurnt === car2.fuelBurnt) // true

// The method shared by these objects is one and same, as they are 
//// inheriting this from the prototype property
```
**Creating a Car**
```js
function Car(fuel) {
    this.fuel = fuel
}

Car.prototype.weather = 0

Car.prototype.getDistanceCarCanTravel = function() {
    switch(this.weather) {
        case 1 : 
            return this.fuel * 5
        case 2 : 
            return this.fuel * 2
        default : 
            return this.fuel * 10
    }

}


const car1 = new Car(50)
console.log(car1.getDistanceCarCanTravel()) // 1000

```

# hasOwnProperty()

```js
// hasOwnProperty()

const a = {
    prop1 : 10,
    prop2 : 16,
}

const b = Object.create(a)

console.log(b.prop1) // 10
console.log(Object.getPrototypeOf(b).prop1) // 10
console.log(b.hasOwnProperty('prop1')) // false
delete b.prop1 // This only delete own property, if any.
console.log(b.prop1) // 10

```

