'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

//get all matches in elimination round
exports.get_elimination_matches = (req, res, next) => {
	const query_string = 'CALL get_elimination_matches();';

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', 'No match(es) retrieved!');
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully retrieved matches!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, callback);
};

//get all matches in semi-finals round
exports.get_semis_matches = (req, res, next) => {
	const query_string = 'CALL get_semis_matches();';

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', 'No match(es) retrieved!');
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully retrieved matches!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, callback);
};


//get all matches in finals round 
exports.get_finals_matches = (req, res, next) => {
	const query_string = 'CALL get_finals_matches();';

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', 'No match(es) retrieved!');
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully retrieved matches!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, callback);
};
