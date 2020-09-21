#!/usr/bin/env python3
# Simple_HTTP_Server.py

from flask import Flask, make_response, render_template

app = Flask(__name__)


@app.route('/', methods=['GET'])
def index():
    # msg = """
    # <html lang="en">
    #   <head>
    #     <title>Home</title>
    #   </head>
    #   <body>
    #       <h1 style="text-align:center;">Welcome to the python server's home page!</h1>
    #       <h3>Try going to these pages:</h3>
    #       <p>
    #       <a href="http://localhost:8080/">http://localhost:8080/</a> --> Returns this page<br>
    #       <a href="http://localhost:8080/json">http://localhost:8080/json</a> --> Returns json data<br>
    #       <a href="http://localhost:8080/denied">http://localhost:8080/denied</a> --> Returns 403 denied response<br>
    #       <a href="http://localhost:8080/not_found">http://localhost:8080/not_found</a> --> Returns 404 not found response<br>
    #       </p>
    #   </body>
    # </html>"""
    # return make_response(msg, 200)
    return make_response(render_template('index.html'), 200)

@app.route('/json', methods=['GET'])
def getJsonResponse():
    status_code = 200
    data = {
        "ok": True,
        "status_code": status_code,
        "message": "This is some json data returned from the python server"
    }
    return make_response(data, status_code)

@app.route('/denied', methods=['GET'])
def denied():
    status_code = 403
    # msg = """<html lang="en">
    #   <head>
    #     <title>DENIED</title>
    #   </head>
    #   <body>
    #     <h1 style="color:red; text-align:center;">ACCESS DENIED</h1>
    #   </body>
    # </html>"""
    # return make_response(msg, status_code)
    return make_response(render_template('denied.html'), status_code)

@app.route('/not_found', methods=['GET'])
def notFound():
    status_code = 404
    # msg = """<html lang="en">
    #   <head>
    #     <title>Page Not Found</title>
    #   </head>
    #   <body>
    #     <h1 style="text-align:center;">404 Page not Found</h1>
    #   </body>
    # </html>"""
    # return make_response(msg, status_code)
    return make_response(render_template('not_found.html'), status_code)
