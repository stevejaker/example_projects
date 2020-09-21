// Simple_HTTP_Server.js

const express = require('express')
const app = express()

app.set('views', __dirname + '/views');
app.engine('html', require('ejs').renderFile);

app.set('view engine', 'ejs');

app.get('/', function (req, res) {
    res.render('index.html');
});

app.get('/json', function (req, res) {
    res.setHeader('Content-Type', 'application/json');
    res.json({
      "ok": true,
      "status_code": 200,
      "message": "This is some json data returned from the python server"
      });
});

app.get('/denied', function (req, res) {
    res.status(403);
    res.render('denied.html');
});

app.get('/not_found', function (req, res) {
    res.status(404);
    res.render('not_found.html');
});

app.listen(8080);
