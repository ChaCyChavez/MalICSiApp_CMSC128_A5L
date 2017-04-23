'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

exports.get_game_per_sport  = (req,res,next) => {
	const query_string = 'CALL get_game_per_sport(?);';
	const payload = [req.params.game_id];
	const callback = (err,data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', 'Not found!');
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully retrieved all matches in one game event!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};
