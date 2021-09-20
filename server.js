const express = require('express');
const https = require('https');
const path = require('path');
const fs = require('fs');

const app = express();

app.use('/', (req, res, next) => {
    res.send('SECRET_WORD = SECRET_WORD!')
    });
    
const server = https.createServer({
    key: fs.readFileSync('key.pem'),
    cert: fs.readFileSync('cert.pem'),
    }, app);
    
    server.listen(3030, () => console.log('narenltk running on port 3030'));













