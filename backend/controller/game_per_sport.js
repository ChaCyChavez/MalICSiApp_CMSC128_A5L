'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

exports.get_game_per_sport  = (req,res,next) => {
	if (req.session.user) {
		const query_string = 'SELECT * FROM match_event natural join match_event_team natural join team natural join sport where sport_id = ?;';

		const payload = [req.params.sport_id];

		const callback = (err,data) => {

			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'err: ', err);
				res.status(500).send({ error_code:err.code });
			} else if (data.length == 0) {
				console.log(data);
				winston.level = 'info';
				winston.log('info', 'Not found!');
				res.status(404).send(data);
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
