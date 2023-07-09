# This consist of Two Parts: 
* HTML SAVED IN /templates/index.html
```html
<!DOCTYPE html>
<html>
<head>
    <title>Input Processing</title>
</head>
<body>
    <h1>Enter some text:</h1>
    <form method="POST" action="/">
        <input type="text" name="input_text" required>
        <button type="submit">Submit</button>
    </form>
    {% if message %}
    <h2>Processed Message:</h2>
    <p>{{ message }}</p>
    {% endif %}
</body>
</html>
```

************************************************************************************************
* Python SAVED AT THE ROOT
```py
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        user_input = request.form['input_text']
        processed_text = process_input(user_input)
        return render_template('index.html', message=processed_text)
    return render_template('index.html')

def process_input(input_text):
    # Perform any desired processing on the input text
    processed_text = input_text.upper()
    return processed_text

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080)
```
