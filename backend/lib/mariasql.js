'use strict'

const Client	 	= require('mariasql');
const config        = require(__dirname + '/../config/config');

module.exports = new Client({
	host: config.IP,	// same as 'localhost'
	user: config.DEVELOPMENT.user,
	password: config.DEVELOPMENT.password,
	db: config.DEVELOPMENT.database
});