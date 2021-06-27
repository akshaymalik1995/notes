- Redux is a predictable state container for Javascript apps.
- Redux manages application's state with a single global object called Store.

## Overview

**Principles of Redux**

Predictability of Redux is determined by three most important principles as given below:

1. Single Source of Truth - The state of your whole application is stored in an object tree within a single store. As whole application state is stored in a single tree, it makes debugging easy, and development faster.
2. State is Read-only - The only way to change the state is to emit an action, an object describing what happened. This means nobody can directly change the state of your application.
3. Changes are made with pure functions - To specify how the state tree is transformed by actions, you write pure reducers. 

> A reducer is a central place where state modification takes place. Reducer is a function which takes state and action in arguments, and returns a newly updated state.

## Installation

Before installing redux, we have to install nodejs and npm.

To install redux : `npm i redux --save`

To use Redux with react application, you need to install an additional dependency: `npm i --save react-redux`

## Core Concepts

Let us assume our application's state is decribed by a plain object called `initialState` :

```js
const initialState = {
    isLoading : false,
    items : [],
    hasError : false
};
```
Every piece of code in your app cannot change this state. To change this state, you need to dispatch an action.

**What is an action?**
An `action` is a plain object that describes the intention to cause change with a `type` property. It must have a `type` property which tells what type of action is being performed.

```js
return {
    type: 'ITEMS_REQUEST`, //action type
    isLoading: true //payload information
}
```

Actions and states are held together by a function called Reducer. An action is dispatched with an intention to cause change. This change is performed by the reducer. Reducer is only way to change states in Redux, making it more predictable, centralised and debuggable.

A reducer function that handles the `ITEMS_REQUEST` action is as follows:

```js
const reducer = (state = initialState, action) => {
    switch (action.type) {
     case 'ITEMS_REQUEST' :
        return Object.assign({}, state, {
            isLoading : action.isLoading
        })
     default:
        return state;
    }
}

// Object.assign combines the objects and returns a new object
```

**Redux components**

![image](https://user-images.githubusercontent.com/55041489/123537084-5d229a80-d74b-11eb-8ffa-1ff87ab23d34.png)

## Data Flow

Redux follows the unidirectional data flow. It means that your application data will follow in one-way binding data flow.

![image](https://user-images.githubusercontent.com/55041489/123537149-a4109000-d74b-11eb-8889-ea5325650b49.png)

- An action is dispatched when a user interacts with the application.
- The root reducer function is called with the current state and the dispatched action. The root reducer may divide the task among smaller reducer functions, which ultimately returns a new state.
- The store notifies the view by executing their callback functions.
- The view can retrieve updated state and re-render again.


## Store

A store is an immutable object tree in Redux. A store is a state container which holds the application's state. Redux can have only a single store in your application. Whenever a store is created in redux, you need to specify the reducer.

We can create a store using `createStore` method from Redux. One need to import `createStore` package from the Redux library.

```js
import {createStore} from 'redux`;
import reducer from './reducers/reducer'
const store = createStore(reducer)


```
A `createStore` function can have three arguments.

`createStore(reducer, [preloadedState], [enhancer])`

A reducer is a function that returns the next state of app. A preloadedState is an optional argument and is the initial state of your app. An enhancer is also an optional argument. It will help you enhance store with third-party capabilities.

A store has three important methods as given below :

**getState**

It helps you retrieve the current state of your redux store.

`store.getState()`

**dispatch**

It allows you to dispatch an action to change a state in your application.

store.dispatch({type: 'ITEMS_REQUEST'})


**subscribe**

It helps you register a callback that redux store will call when an action has been dispatched. As soon as the Redux state has been updated, the view will re-render automatically.

`store.subscribe(()=> console.log(store.getState()))`

Note that subscribe function returns a function for unsubscribing the listener.
```js
const unsubscribe = store.subscibe( () => console.log(store.getState()))

unsubscribe()
```


## Actions

Actions are the only source of information for the store. it carries a payload of information from your application to store.

Actions are plain javascript object that must have a type attribute to indicate the type of action performed. 

Types should be defined as string constants in your app.

`const ITEMS_REQUEST = 'ITEMS_REQUEST`

Apart from this type attribute, the structure of an action object is totally up to the developer. It is recommended to keep your action object as light as possible and pass only the necessary information.

To cause any change in the store, you need to dispatch an action first by using `store.dispatch()` function.

```js
{ type: GET_ORDER_STATUS, payload : {orderID, userId}}
{ type: GET_WISHLIST_ITEMS, payload: userID }
```


**Actions Creators**

Action creators are the functions that encapsulate the process of creation action object. These functions simply return a plain JS object which is an action.

```js
const ITEMS_REQUEST = 'ITEMS_REQUEST`
const ITEMS_REQUEST_SUCCESS = 'ITEMS_REQUEST_SUCCESS`

export function itemsRequest(bool, startIndex, endIndex) {
    let payload = {
        isLoading : bool,
        startIndex,
        endIndex,
    }
    
    return {
        type : ITEMS_REQUEST,
        payload,
    }
}

export function itemsRequestSuccess(bool){
    return {
        type : ITEMS_REQUEST_SUCCESS,
        isLoading : bool,
    }
}

```


To invoke a dispatch function, you need to pass action as an argument to dispatch function:

```js
dispatch(itemsRequest(true, 1, 20))
dispatch(itemsRequestSuccess(false))
```

You can dispatch an action by directly using `store.dispatch()`. However, it is more likely that you access it with `react_redux` helper method called `connect()`. You can also use bindActionCreators() method to bind many actions creators with dispatch function.

## Pure Functions

A function which takes inputs called arguments, and produces some output known as return value. A function is called pure if it abides by the following rules:
- A function results the same result for same arguments
- Its evaluation as no side effects, i.e., it does not alter the input data.
- No mutation of local and global variables
- It does not depend on the external state like global variables

**Why a reducer must be a pure function?**

Suppose, you want to dispatch an action whose type is `ADD_TO_CART_SUCCESS` to add an item to your shopping cart application by clicking add to cart button.


```js
const initialState = {
    isAddedToCart = false
}

const addToCartReducer = (state = initialState, action) => {
    switch(action.type) {
    case 'ADD_TO_CART_SUCCESS' :
        state.isAddedToCart = !state.isAddedToCart
        // Here we are mutating the state instead of returning a new state
        return state
    default:
         return state
    }
}

export default addtoCartReducer

```

Redux compares old and new objects by the memory location of both the objects. It expects a new object from reducer if any change has happened. And it also expects to get the old object back if no change occurs. In this example, it is the same. Due to this reason, redux assumes that nothing has happened.

So, it is necessary for a reducer to be a pure function in Redux. The following is a way to write without mutation: 

```js
const initialState = {
    isAddedToCart = false
}

const addToCartReducer = (state = initialState, action) => {
    switch(action.type) {
    case 'ADD_TO_CART_SUCCESS' :
        return {
        ...state,
        isAddedToCart : !state.isAddedToCart
        }
    default:
         return state
    }
}

export default addtoCartReducer

```

## Reducers

Reducers are a pure function in Redux. Pure functions are predictable. Reducers are the only way to change states in Redux. It is the only place where you can write logic and calculations.

Reducer function will accept the previous state of app and action being dispatched, calculate the next state and returns the new object

The following few things should never be performed inside the reducer:
- Mutation of function arguments
- API calls and routing logic
- Calling non-pure function e.g. Math.random()

The following is the syntax of a reducer:

`(state, action) => newState`


If you do not set state to 'initialState', redux calls reducer with the undefined state.


**How to combine multiple reducers?**

```js

/reducer/index.js
import { combineReducers } from ‘redux’;
import OrderStatusReducer from ‘./orderStatusReducer’;
import GetWishlistDataReducer from ‘./getWishlistDataReducer’;

const rootReducer = combineReducers ({
   orderStatusReducer: OrderStatusReducer,
   getWishlistDataReducer: GetWishlistDataReducer
});
export default rootReducer;
```

Now, you can pass this `rootReducer` to the createStore method:

`const store = createStore(rootReducer)`
