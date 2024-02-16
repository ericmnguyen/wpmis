const express = require('express');
var cors = require('cors');
const app = express();

app.use(cors());
app.use('/api/students', require('./routes/students'));

module.exports = app;
