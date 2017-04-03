'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

exports.add_sponsor = (req, res, next) => {
	const query_string = 'CALL add_sponsor(?,?,?,?,?,?)';

	const payload = [
		req.body.sponsor_name,
		req.body.sponsor_logo,
		req.body.sponsor_type,
		req.body.sponsor_desc,
		req.body.web_address,
		req.body.game_id
	];

	const callback = (err,data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully added sponsor!');
			res.status(200).send({message: 'Successfully added sponsor!'});
		}
	};

	db.query(query_string, payload, callback);
};

exports.get_sponsor_of_game = (req, res, next) => {
	const query_string = 'CALL get_sponsor_of_game(?)';

	const payload = [req.params.game_id];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', 'Not found!');
			res.status(404).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully retrieved sponsor!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.update_sponsor = (req, res, next) => {
	const query_string = 'CALL update_sponsor(?,?,?,?,?,?)';

	const payload = [
		req.body.sponsor_id,
		req.body.sponsor_name,
		req.body.sponsor_logo,
	    req.body.sponsor_type,
		req.body.sponsor_desc,
		req.body.web_address
	];

	const callback = (err, data) => {
		if (err) {
		  winston.level = 'debug';
		  winston.log('debug', 'err: ', err);
		  res.status(500).send({ error_code: err.code });
		} else {
		  winston.level = 'info';
		  winston.log('info', 'Successfully updated sponsor!');
		  res.status(200).send({message: 'Successfully updated sponsor!'});
		}
	};

	db.query(query_string, payload, callback);
};

//Controller to be used for deleting a sponsor given a sponsor_id
exports.delete_sponsor = (req, res, next) => {
	const query_string ='CALL delete_sponsor(?)';

	const payload = [req.body.sponsor_id];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully deleted sponsor!');
			res.status(200).send({message: 'Successfully deleted sponsor!'});
		}
	};

	db.query(query_string, payload, callback);
};
