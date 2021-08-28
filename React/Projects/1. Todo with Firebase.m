## Setting Up React Project
1. Set up the react project with `npx create-react-app todoapp`

## Setting Up Firebase Project

1. Open firebase.com
2. Click on `Go to Console`
3. Create a project
4. Create a web app within the project inside the project settings.
5. Also enable the firebase hosting.
6. Copy `npm install -g firebase-tools` and paste it in your terminal. Here we are installing firebase tools globally in our computer. In the next project, we will not have to install it again
7. Use the command `firebase login` to connect with the firebase.
8. Now in the firebase console, click on 'continue`
9. In the `SDK setup and configuration` click on `config`and copy the configuration key.

```js
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAbE2lQLT84OupLX3FgYRH2FiPsG2sz4MA",
  authDomain: "todoapp1995.firebaseapp.com",
  projectId: "todoapp1995",
  storageBucket: "todoapp1995.appspot.com",
  messagingSenderId: "250283721161",
  appId: "1:250283721161:web:c5b69ff10ec283777d2818",
  measurementId: "G-S2NE88BX33"
};

```

## Start The React App And Clean The Project

1. Get into the react app folder `cd todoapp`
2. Use the command `npm start` to get the up and running.
3. In the `src` folder, delete the following files:
  - reportWebVitals.js
  - setupTests.js
  - logo.svg
  - App.test.js
  - App.css
  - index.css

4. `App.js`

```js
function App() {
  return (
    <div className="App">
      
    </div>
  );
}

export default App;
```

5. `index.js`

```js
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';


ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);

```



## Determine The Structure of the Components of The App

1. Input
  - Input Field
  - Button
2. Todos
  - Todo
    - Task
    - Finish
    - Delete
  
 




