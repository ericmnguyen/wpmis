const express = require('express');
var cors = require('cors');
const bodyParser = require('body-parser')
const app = express();

app.use(cors());

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.use('/api/student', require('./routes/students'));

module.exports = app;
