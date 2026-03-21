from flask import Flask

app = Flask(__name__)

@app.get("/")
def home():
    return "Hello Aniket! Your Secure DevSecOps Pipeline is Working."

if __name__ == "__main__":
    app.run(host='127.0.0.1', port=5000)
