> data.json

```json
{"users": [

{"username": "akshaymalik1995", 
"first_name": "Akshay", 
"last_name": "Malik", 
"age": 25, 
"country": "India", 
"language": "English"}, 

{"username": "anubhavnain", 
"first_name": "Anubhav", 
"last_name": "Nain", 
"age": 25, 
"country": "India", 
"language": "English"}, 

{"age": 25, 
"country": "India", 
"first_name": "Akshay", 
"language": "English", 
"last_name": "Malik", 
"username": "akshaymalik1995"}
]
}

```


> app.py

```py

from flask import Flask, jsonify, request
import json
app = Flask(__name__)

@app.route('/users/')
def get_users():
    file = open('data.json')
    data = json.load(file)
    file.close()
    return data

@app.route('/users/<string:username>')
def get_user(username):
    file = open('data.json')
    data = json.load(file)
    file.close()
    for user in data['users']:
        if user['username'] == username:
            return user
    return jsonify({"error" : "This user is not found"})

@app.route('/users/add', methods=['POST'])
def add_user():
    request_data = request.get_json()
    
    file = open('data.json', 'r')
    data = json.load(file)
    data['users'].append(request_data)
    file.close()

    file = open('data.json', 'w')
    json.dump(data, file)
    file.close()
    
    return jsonify({"success" : "Request Successfully Entertained"})


app.run(port=5500, debug=True)
```

