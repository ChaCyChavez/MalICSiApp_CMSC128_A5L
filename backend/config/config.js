'use strict'

const path  = require('path');

const config = {
    APP_NAME: 'MalICSi App: A PalICSihan Sport Scheduling App',
    APP_URL: 'http://localhost:8000',

    PORT: 8000,
    STATIC_PORT: 8080,
    IP: '127.0.0.1',

    DEVELOPMENT: {
        host: 'localhost',
        user: 'CMSC128',
        password: 'project128',
        database: 'malicsi'
    },

    ASSETS_DIR: path.normalize(__dirname + '/../front-end'),

    COOKIE_SECRET: 'm4L1cSi_a5L',
    COOKIE_NAME: '__t0p_S3cR3T',
    COOKIE_DOMAIN: '.malICSi.io'

};

module.exports = config;
