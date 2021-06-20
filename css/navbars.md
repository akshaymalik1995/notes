# CSS Navbar


## Simple

```html
<nav class="navbar">
    <a class="nav-brand" href="">CodeAcademy</a>
    <div class="nav-items">
        <a href="" class="nav-item">Home</a>
        <a href="" class="nav-item">Tutorials</a>
        <a href="" class="nav-item">Pricing</a>
        <a href="" class="nav-item">About</a>
    </div>
</nav>

```

```css
body {
    margin: 0;
    padding: 0;
}

.navbar {
    display: flex;
    font-size: 24px; 
    justify-content: space-around;
    align-items: center;
}



.nav-item , .nav-brand {
    letter-spacing: 3px;
    font-weight: 500;
    color: black;
    margin: 0 20px 0 20px;
    text-decoration: none;
    padding: 20px 10px;
}

.nav-item:hover {
    background-color: rgba(128, 128, 128, 0.39);
}

```

![image](https://user-images.githubusercontent.com/55041489/122664367-95136600-d1be-11eb-8da3-7ef7b0dad817.png)

