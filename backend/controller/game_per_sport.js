'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

exports.get_game_per_sport  = (req,res,next) => {
	if (req.session.user) {
		const query_string = 'CALL get_game_per_sport(?);';
		const payload = [req.params.sport_type];
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
				winston.log('info', 'Successfully retrieved games of one sport!');
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	} else {
		res.status(401).send({message:"You must be logged in."});
	}
};
