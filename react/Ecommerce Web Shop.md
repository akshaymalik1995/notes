# Ecommerce Web Shop - React.js | Commerce.js | Stripe

## Setting Up

Create a folder `e_commerce` and open it in the vscode.

`npx create-react-app ./` to create the react project.

Install the following dependencies:

`npm install @chec/commerce.js @stripe/react-stripe-js @stripe/stripe-js react-router-dom react-hook-form`

Delete all the files from the `src` folder and keep only the following:
- `index.js`
- `App.js`

```Jsx
//index.js
import React from 'react';
import ReactDOM from 'react-dom';
import {App} from './App';


ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);

```

Cleanup the `public/index.html` file.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />

    <title>Ecommerce Shop</title>
  </head>
  <body>
    <div id="root"></div>
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  </body>
</html>
```

In the `src/App.js`, create a functional component using the `rafc` shortcut.

```Jsx
// src/App.js
import React from 'react'

export const App = () => {
  return (
    <div>
      E-commerce
    </div>
  )
}
```
Run the app using `npm start`.


## Mock Products
Create a folder `components`. Inside it create a folder `Products`. Create a file `Products.jsx`

```Jsx
// Products.jsx
import React from 'react'

import { Product } from './Product/Product'
const products = [
    { id: 1, name: 'Shoes', description: 'Running Shoes', price: "$5" },
    { id: 2, name: 'Macbook', description: 'Apple Macbook', price: "$5" }

]

export const Products = () => {
    return (
        <main>
            <div className="d-flex">
                {products.map(product => (
                    <Product product={product} />
                ))}
            </div>
        </main>

    )
}

```
Create a folder `Product` inside the `Products` folder. Inside it, create a file `Product.jsx`

```jsx
//Product.jsx
import React from 'react'


export const Product = ({ product }) => {
    return (
        
            <div className="card">
                <img className="card-img-top" src="" alt="Card image cap" />
                    <div className="card-body">
                    <h5 className="card-title">{product.name}</h5>
                    <p className="card-text">{product.description}</p>
                    <p>{product.price}</p>
                        <a href="#" className="btn btn-primary">Go somewhere</a>
                    </div>
            </div>
    
    )
}
```


## Navbar

Create a folder `Navbar` in the components. Inside it create a file `Navbar.jsx`.

Now create a navbar using Bootstrap and import the `Navbar` component inside the `App.js`

Static files can be stored inside the `public/assets` folder and then we can import it in any of the components.


** Better way to import components inside the `App.js`

Create a file `index.js` inside the `components` folder.

```jsx
export {Navbar } from "./Navbar/Navbar"
export {Products} from "./Products/Products"
```

Them, inside the `App.js` import them like this:

`import { Products, Navbar } from './components'`




## Commerce Products

Create a foler `lib` inside the `src` folder. Inside it create a file `commerce.js`.

```jsx
import Commerce from '@chec/commerce.js'

export const commerce = new Commerce('')
```
Now go to the website of commercejs and get the `PublicKey`.

Ofcourse we will create a file `.env` in the root directory and store our public key there.

```
REACT_APP_CHEC_PUBLIC_KEY=pk_test_289677a1aaf1afc69b055e421b82373001daca77ef362
```

Now we will access this key in the `commerce.js` file

```jsx
import Commerce from '@chec/commerce.js'

export const commerce = new Commerce(process.env.REACT_APP_CHEC_PUBLIC_KEY, true)
```

