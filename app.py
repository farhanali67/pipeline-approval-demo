from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    return f"""
Application deployed via Self-Service Portal

Message: {os.getenv('MESSAGE','No Message')}
Environment: {os.getenv('ENVIRONMENT','dev')}
App Name: {os.getenv('APP_NAME','demo-app')}
"""

@app.route("/health")
def health():
    return "OK", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
