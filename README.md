# Flask RestAPI


## Technologies used
* [Flask](https://palletsprojects.com/p/flask/): Flask is a micro web framework written in Python.

# Task Description
Develop an API using Python and the Flask framework which would let users add, search for,
browse, and delete games from a database.

The API will have the ability to do following things:

- Sign up as a user / Add a new user.
- Log in / Log in.
- Add new games to the database.
- Search for a specific game by ‘title’
- Games filter by 'platform', 'genre', and 'editors_choice'. Also include the ability to sort the order of returned games by 'score' (ascending and descending)
- Update game’s properties (i.e. ‘score’, ‘platform’, etc...)
- Delete a game from the database.

## Http Methods:

    - Add a game – Handle POST request
    - Read a game – Handle GET request
    - Update a game – Handle PATCH request
    - Delete a game – Handle DELETE request
    - Read games by filter - Handle POST request

## Installation
* If you wish to run your own build, first ensure you have python globally installed in your computer. If not, you can get python [here](https://www.python.org").

* After check that mysql installed in your system. If not, you can refer this, [here](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04)

* After doing this, confirm that you have installed virtualenv globally as well. If not, run this:
    ```bash
        $ pip install virtualenv
    ```
* Git clone this repo to your PC 
    ```bash
        $ git clone https://github.com/KartikKaklotar/flask-rest-api.git
    ```

* #### Dependencies

    1. cd into your the cloned repo as such:
        ```bash
            $ cd flask-rest-api
        ```
    2. Create and fire up your virtual environment:
        ```bash
            $ virtualenv venv -p python3
            $ source venv/bin/activate
        ```
    3. Install the dependencies needed to run the app:
        ```bash
            $ pip install -r requirements.txt
        ```
    4. Configure your mysql credentials in config.py
	[ update username:password@host:port/databaseName]
        ```bash
            $ vim configure.py
        ```
* #### Run It
    Fire up the server using this one simple command:
    ```bash
        $ python run.py
    ```
    You can now access the file api service on your browser by using
    ```
        http://http://127.0.0.1:5000/
    ```

* #### End Point List
	- /singup - POST
	- /login - POST
	- /games - GET
	- /game - POST
	- /game/id - GET
	- /game/id - PATCH
	- /game/id - DELETE
	- /games/filter/<filterName> - POST
	- /logout - POST/GET

* #### Filter Names List
	- title
	- platform
	- genre
  - editors_choice
	
