'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

exports.add_game_event = (req, res, next) => {
	const query_string = 'CALL add_game_event(?,?,?)';

	const payload = [
		req.body.game_name,
		req.body.game_starting_time_date,
		req.body.game_ending_time_date
	];

	const callback = (err,data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully added event!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.get_game_event = (req, res, next) => {
	const query_string = 'CALL get_game_event(?)';

	const payload = [req.params.game_name];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', 'Not found!');
			res.status(404).send();
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully retrieved event!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.get_user_upcoming_events = (req, res, next) => {
	const query_string = 'CALL get_user_upcoming_events(?)';

	const payload = [req.session.user.account_id];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', 'Empty response! Upcoming events of user: ', data[0].length);
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully retrieved event(s)! No. of event(s): ', data[0].length);
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.get_user_past_events = (req, res, next) => {
	const query_string = 'CALL get_user_past_events(?)';

	const payload = [req.session.user.account_id];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', 'Empty response! Past events of user: ', data[0].length);
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully retrieved event(s)! No. of event(s): ', data[0].length);
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.update_game_event = (req, res, next) => {
	const query_string = 'CALL update_game_event(?,?,?,?)';

	const payload = [
		req.body.game_id,
		req.body.name,
		req.body.game_starting_time_date,
		req.body.game_ending_time_date
	];

	const callback = (err, data) => {
		console.log(data);
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data.affectedRows == 0) {
			winston.level = 'info';
			winston.log('info', 'Not found! Update failed');
			res.status(404).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully updated event!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.delete_game_event = (req, res, next) => {
	const query_string ='CALL delete_game_event(?)';

	const payload = [req.body.game_id];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data.affectedRows == 0) {
			winston.level = 'info';
			winston.log('info', 'Not found! Delete failed');
			res.status(404).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully deleted event!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};
