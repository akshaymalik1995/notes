# CSS Flexbox Layout Module
The Flexible Box Layout Module, makes it easier to design flexible responsive layout structure without using float or positioning.

## Flexbox Elements

To start using the Flexbox model, you need to first define a flex container.

```html
<!--index.html--->
<div class="flex">
    <div>Box 1</div>
    <div>Box 2</div>
    <div>Box 3</div>
</div>
```
![image](https://user-images.githubusercontent.com/55041489/122661733-16f99400-d1ab-11eb-938a-7c6ec70aecd5.png)


```css
/* style.css */
.flex {
    display: flex;
}

.flex div {
    padding: 50px;
    background-color: aquamarine;
    margin: 10px;
}
```

![image](https://user-images.githubusercontent.com/55041489/122661747-5aec9900-d1ab-11eb-8182-37160a585cd2.png)

## Flex Direction

### Column

```css
/* style.css */
.flex {
    display: flex;
    flex-direction: column;
}

```

![image](https://user-images.githubusercontent.com/55041489/122661767-925b4580-d1ab-11eb-8b62-a04cd2fd9b24.png)

### Column Reverse

```css
/* style.css */
.flex {
    display: flex;
    flex-direction: column-reverse;
}

```

![image](https://user-images.githubusercontent.com/55041489/122661793-bf0f5d00-d1ab-11eb-9f3b-9b5c67cf96ac.png)

### Row

```css
/* style.css */
.flex {
    display: flex;
    flex-direction: row;
}

```

![image](https://user-images.githubusercontent.com/55041489/122661804-dd755880-d1ab-11eb-8587-9d4c5ca03556.png)

### Row Reverse

```css
/* style.css */
.flex {
    display: flex;
    flex-direction: row-reverse;
}

```

![image](https://user-images.githubusercontent.com/55041489/122661816-fda51780-d1ab-11eb-8c41-641524193a33.png)


## Flex Wrap

### No Wrap

```html
<div class="flex">
    <div>Box 1</div>
    <div>Box 2</div>
    <div>Box 3</div>
    <div>Box 4</div>
    <div>Box 5</div>
    <div>Box 6</div>
</div>

```

```css
/* style.css */
.flex {
    display: flex;
}

.flex div {
    padding: 50px;
    background-color: aquamarine;
    margin: 10px;
}
```

![image](https://user-images.githubusercontent.com/55041489/122661881-6ee4ca80-d1ac-11eb-843c-cd914ec436fb.png)

### Wrap

```css
/* style.css */
.flex {
    display: flex;
    flex-wrap: wrap;
}


```

![image](https://user-images.githubusercontent.com/55041489/122661901-a05d9600-d1ac-11eb-9abe-323b5c8f1345.png)

### Wrap Reverse

```css
/* style.css */
.flex {
    display: flex;
    flex-wrap: wrap-reverse;
}

```

![image](https://user-images.githubusercontent.com/55041489/122661923-d3078e80-d1ac-11eb-9cd7-719b701b6386.png)

## Justify Content

### Flex Start

```css
/* style.css */
.flex {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
}

```

![image](https://user-images.githubusercontent.com/55041489/122661977-2843a000-d1ad-11eb-80bb-3f8b76faf6a6.png)

### Flex End

```css
/* style.css */
.flex {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-end;
}

```

![image](https://user-images.githubusercontent.com/55041489/122662007-59bc6b80-d1ad-11eb-83df-a0437639b439.png)

### Space Around

```css
/* style.css */
.flex {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}

```

![image](https://user-images.githubusercontent.com/55041489/122662389-2f1fe200-d1b0-11eb-9397-96eefe9afc4f.png)


### Space Between


```css
/* style.css */
.flex {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

```

![image](https://user-images.githubusercontent.com/55041489/122662404-4f4fa100-d1b0-11eb-8a83-6f2b5b60a366.png)


## Align Items

### Stretch (default)

```css
.flex {
    display: flex;
    flex-wrap: wrap;
    background-color: black;
    height: 500px;
    justify-content: space-evenly;
    align-items: stretch;
    
}

```

![image](https://user-images.githubusercontent.com/55041489/122662591-c76a9680-d1b1-11eb-9fe5-5e543569ddfb.png)

### Baseline

The baseline value aligns the flex items such as their baselines aligns.

```css
.flex {
    display: flex;
    flex-wrap: wrap;
    background-color: black;
    height: 500px;
    justify-content: space-evenly;
    align-items: basline;
    
}

```

![image](https://user-images.githubusercontent.com/55041489/122662597-d8b3a300-d1b1-11eb-8988-a3272f55bf25.png)

### Center

```css
.flex {
    display: flex;
    flex-wrap: wrap;
    background-color: black;
    height: 500px;
    justify-content: space-evenly;
    align-items: center;
    
}

```

![image](https://user-images.githubusercontent.com/55041489/122662603-e9641900-d1b1-11eb-975b-a00e6808575a.png)

### Flex Start

```css
.flex {
    display: flex;
    flex-wrap: wrap;
    background-color: black;
    height: 500px;
    justify-content: space-evenly;
    align-items: flex-start;
    
}

```

![image](https://user-images.githubusercontent.com/55041489/122662640-23351f80-d1b2-11eb-9fd6-a0ed132382c0.png)


### Flex End

```css
.flex {
    display: flex;
    flex-wrap: wrap;
    background-color: black;
    height: 500px;
    justify-content: space-evenly;
    align-items: flex-end;
    
}

```
![image](https://user-images.githubusercontent.com/55041489/122662644-334cff00-d1b2-11eb-8ac4-f4b1e8a52e0f.png)



