# flask_web/app.py
from flask import Flask, render_template, request
import os

app = Flask(__name__)


@app.route('/')
def hello_world():
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def uploadFile():
    file = request.files['inputFile']
    filename = file.filename
    file.save(os.path.join('/app', filename))
    return file.filename



if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
