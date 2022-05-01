# What's __proto__?

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
