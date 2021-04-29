from app import app, db
from flask import request, jsonify, make_response, session
from .models import Games, GamesSchema, User, UserSchema, LoginSchema
from marshmallow import ValidationError
from functools import wraps
from werkzeug.security import generate_password_hash, check_password_hash
import re

def login_in(f):
    @wraps(f)
    def decorator(*args, **kwargs):
        if 'username' not in session:
            return make_response(jsonify({'error' : 'Unauthorized'}), 401)
        return f(*args, **kwargs)
    return decorator

@app.route('/singup', methods=['POST'])
def singup():
    data = request.get_json()
    user_schema = UserSchema()
    try:
        user = user_schema.load(data)
    except ValidationError as err:
        return make_response(jsonify({"error":err.messages}), 400)

    email = data.get('email')
    name = data.get('name')
    password = data.get('password')

    user = User.query.filter_by(email=email).first()

    if user:
        return make_response(jsonify({"error": "Email address already exists"}), 404)
    elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
        return make_response(jsonify({"error": "Invalid email address!"}), 400)
    elif not re.match(r'[A-Za-z]+', name):
        return make_response(jsonify({"error": "name must contain only characters"}), 400)

    new_user = User(email=email, name=name, password=generate_password_hash(password, method='sha256'))

    db.session.add(new_user)
    db.session.commit()
    return make_response(jsonify({"message": "Successfully registered"}), 201)

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    user_schema = LoginSchema()
    try:
        user = user_schema.validate(data)
    except ValidationError as err:
        return make_response(jsonify({"error":err.messages}), 400)

    email = data.get('email')
    password = data.get('password')

    if 'username' in session:
        if email == session['username']:
            return make_response(jsonify({'message':'You are already logged In'}),400)

    user = User.query.filter_by(email=email).first()

    if not user or not check_password_hash(user.password, password):
        return make_response(jsonify({'message':'Please check your login details and try again.'}),400)
    
    session['username'] = email
    return make_response(jsonify({'message':'You are logged in successfully'}),200)

@app.route('/logout',methods=['POST','GET'])
@login_in
def logout():
    print("asfas",session)
    if 'username' in session:
        session.pop('username', None)
    return make_response(jsonify({"message": "You successfully logged out"}), 404)

def validate_id(f):
    @wraps(f)
    def decorator(*args, **kwargs):
        get_game = Games.query.get(kwargs['id'])
        if get_game is None:
            return make_response(jsonify({"error": "Game id not present in the system"}), 404)
        return f(*args, **kwargs)
    return decorator

@app.route('/')
@app.route('/games', methods = ['GET'])
@login_in
def get_games():
    get_games = Games.query.all()
    games_schema = GamesSchema(many=True)
    games = games_schema.dump(get_games)
    return make_response(jsonify({"games": games}))

@app.route('/game/<id>', methods = ['GET'])
@login_in
@validate_id
def get_games_by_id(id):
    get_game = Games.query.get(id)
    games_schema = GamesSchema()
    game = games_schema.dump(get_game)
    return make_response(jsonify({"game": game}))

@app.route('/game/<id>', methods = ['PATCH'])
@login_in
@validate_id
def update_games_by_id(id):
    data = request.get_json()
    get_game = Games.query.get(id)

    for key in data.keys():
        if key not in ['title', 'platform','score','genre', 'editors_choice']:
            return make_response(jsonify({"error": {key:["Invalid field passed"]}}), 400)

    if data.get('title'):
        get_game.title = data['title']
    if data.get('platform'):
        get_game.platform = data['platform']
    if data.get('score'):
        get_game.score = data['score']
    if data.get('genre'):
        get_game.genre= data['genre'] 
    if data.get('editors_choice'):
        get_game.editors_choice= data['editors_choice']

    db.session.add(get_game)
    db.session.commit()

    games_schema = GamesSchema(only=['id', 'title', 'platform','score','genre', 'editors_choice'])
    game = games_schema.dump(get_game)
    return make_response(jsonify({"game": game}))

@app.route('/game/<id>', methods = ['DELETE'])
@login_in
@validate_id
def delete_games_by_id(id):
    get_game = Games.query.get(id)
    db.session.delete(get_game)
    db.session.commit()
    return make_response("",204)

@app.route('/game', methods = ['POST'])
@login_in
def add_games():
    data = request.get_json()
    games_schema = GamesSchema()
    try:
        game = games_schema.load(data)
    except ValidationError as err:
        return make_response(jsonify({"error":err.messages}), 400)

    get_game = Games.query.filter_by(title=data.get('title'), platform=data.get('platform')).first()
    check_game = games_schema.dump(get_game)
    if check_game:
        return make_response(jsonify({"error": "This game is already present in the system"}),409)

    result = games_schema.dump(game.create())
    return make_response(jsonify({"game": result}), 201)

@app.route('/games/filter/<string:fname>', methods=['POST'])
@login_in
def filter(fname):
    data = request.get_json()
    for key in data.keys():
        if key not in ['name', 'score_sort']:
            return make_response(jsonify({"error": {key:["Invalid field passed"]}}), 400)

    if fname == 'title':
        get_games = Games.query.filter_by(title=data.get('name'))
    elif fname == 'platform':
        get_games = Games.query.filter_by(platform=data.get('name'))
    elif fname == 'genre':
        get_games = Games.query.filter_by(genre=data.get('name'))
    elif fname == 'editors_choice':
        get_games = Games.query.filter_by(editors_choice=data.get('name'))
    else:
        return make_response(jsonify({"error": {fname:["Invalid filter passed"]}}), 400)
    
    if ('score_sort' in  data.keys()):
        get_games = get_games.order_by(Games.score) if data.get('score') else get_games.order_by(Games.score.desc())

    games_schema = GamesSchema(many=True)
    games = games_schema.dump(get_games)

    if not games:
        return make_response(jsonify({"error": "Games not present in the system"}), 404)
    
    return make_response(jsonify({"games": games}))