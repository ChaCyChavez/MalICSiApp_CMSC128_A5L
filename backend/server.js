'use strict'

const config        = require(__dirname + '/config/config');
const router        = require(__dirname + '/router/router');
const express       = require('express');
const session       = require('express-session');
const body_parser   = require('body-parser');
const redis         = require('redis');
const redis_store   = require('connect-redis')(session);
const client        = redis.createClient();
const winston       = require('winston');
const helmet        = require('helmet');

let start;
let handler;
let app;

start = () => {

    if (handler) {
        handler.close();
    }

    // create an express app
    app = express();

    winston.cli();
    winston.level = config.LOG_LEVEL || 'silly';

    winston.log('info', 'Starting', config.APP_NAME);
    // setting the environment for express
    app.set('case sensitive routing', true);
    app.set('x-powered-by', false);
    app.set('view engine', 'ejs');
    // incorporating the session to the app for usage
    app.use(session({
        secret: config.COOKIE_SECRET,
        resave: false,
        saveUninitialized: true,
        cookie: {maxAge: 60 * 1000 * 60 * 2, secure : true},
        proxy : true,
        store: new redis_store({
            host: 'redis-12382.c9.us-east-1-4.ec2.cloud.redislabs.com',
            port: '12382',
            client: client
        })
    }))
    // other packages that is needed to make the app secured and stable
    winston.log('verbose', 'Binding 3rd-party middlewares');
    app.use(express.static(__dirname + '/../frontend/'));
    app.use(require('method-override')());
    app.use(body_parser.urlencoded({extended: true}));
    app.use(body_parser.json());
    app.use(require('compression')());
    app.use(router(express.Router()));
    app.use(helmet);
    // this will start app
    winston.log('info', 'Server listening on port', (process.env.PORT || config.PORT));
    return app.listen(process.env.PORT || config.PORT);

}

handler = start();

module.exports = {
    app,
    start,
    handler
}
