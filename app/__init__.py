from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config.from_object('config')

# init SQLAlchemy so we can use it later in our models
db = SQLAlchemy(app)

from app import models, api