'use strict'

const path  = require('path');

module.exports = {
    APP_NAME: 'MalICSi App: A PalICSihan Sport Scheduling App',
    APP_URL: 'http://localhost:800',

    PORT: 8000,
    STATIC_PORT: 8080,
    IP: '127.0.0.1',

    DEVELOPMENT: {
        host: 'jlg7sfncbhyvga14.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
        user: 'go0d6ii51ptlohgt',
        password: 'hpvsd33ryxza9fzg',
        database: 'qwr752n6nujvmxpe'
    },

    ASSETS_DIR: path.normalize(__dirname + '/../front-end'),

    COOKIE_SECRET: 'm4L1cSi_a5L',
    COOKIE_NAME: '__t0p_S3cR3T',
    COOKIE_DOMAIN: '.malICSi.io',

	TRANSPORTER: {
	    service: 'Gmail',
	    auth: {
	        user: 'johndoecmsc128@gmail.com',
	        pass: 'johndoe128'
		}
	},

	FILE: "../mailbody/body.txt"
};
