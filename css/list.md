![image](https://user-images.githubusercontent.com/55041489/123280829-c1b0e000-d526-11eb-8ef4-487bcec538f1.png)

```html
 <ul class="list-group action">
      <li class="list-group-item">Cras justo odio <span class="badge">14</span></li>
      <li class="list-group-item">Dapibus ac facilisis in</li>
      <li class="list-group-item">Morbi leo risus</li>
      <li class="list-group-item">Porta ac consectetur ac</li>
      <li class="list-group-item">Vestibulum at eros</li>
 </ul>
```

```css
.body {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


.list-group {
    margin: 0px;
    padding: 0px ;
    border-style: solid;
    border-width: 1px 1px 1px 1px;
    border-color: rgba(128, 128, 128, 0.2);
}


.list-group-item {
    display: flex;
    justify-content: space-between;
    padding: 0.8rem 1rem;
    list-style-type: none;
    border-style: solid;
    border-width: 0px 0px 1px 0px;
   
    border-color: rgba(128, 128, 128, 0.3);
}

.list-group .list-group-item:last-child {

    border-style: solid;
    border-width: 0px 0px 1px 0px;
  
}

.list-group-item.active {
    color: white;
    background-color: rgba(0, 81, 255, 0.8) !important;
}

.list-group-item .badge {
    background-color: rgba(42, 54, 165, 0.9);
    color: white;
    padding: 2px 3px;
    border-radius: 4px;
}
.list-group.action .list-group-item:hover {
    cursor: pointer;
    box-shadow: 0px 1px 4px 0px rgba(128, 128, 128, 0.8);
    
}




```
