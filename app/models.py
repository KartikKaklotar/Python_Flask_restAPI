from app import db
from marshmallow_sqlalchemy import ModelSchema
from marshmallow import fields

class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(1000))
    email = db.Column(db.String(64), unique=True, index=True)
    password = db.Column(db.String(128))

    def create(self):
        db.session.add(self)
        db.session.commit()
        return self
    
    def __init__(self, name, email, password):
        self.name = name
        self.email = email
        self.password = password
    
    def __repr__(self):
        return '' % self.id

class LoginSchema(ModelSchema):
    class Meta(ModelSchema.Meta):
        sqla_session = db.session

    email = fields.String(required=True)
    password = fields.String(required=True)

class UserSchema(LoginSchema):
    class Meta(ModelSchema.Meta):
        model = User
        sqla_session = db.session

    id = fields.Number(dump_only=True)
    name = fields.String(required=True)
    email = fields.String(required=True)
    password = fields.String(required=True)

class Games(db.Model):
    __tablename__ = 'games'
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(1000), nullable=False)
    platform = db.Column(db.String(1000), nullable=False, index=True)
    score = db.Column(db.Float, nullable=False)
    genre = db.Column(db.String(1000), nullable=False, index=True)
    editors_choice = db.Column(db.Enum('Y','N',name='editors_choice'), nullable=False, index=True)

    def create(self):
        db.session.add(self)
        db.session.commit()
        return self
    
    def __init__(self, title, platform, score, genre, editors_choice):
        self.title = title
        self.platform = platform
        self.score = score
        self.genre = genre
        self.editors_choice = editors_choice 
    
    def __repr__(self):
        return '' % self.id

class GamesSchema(ModelSchema):
    class Meta(ModelSchema.Meta):
        model = Games
        sqla_session = db.session

    id = fields.Number(dump_only=True)
    title = fields.String(required=True)
    platform = fields.String(required=True)
    score = fields.Number(required=True)
    genre = fields.String(required=True)
    editors_choice = fields.String(required=True)