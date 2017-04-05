'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');
const prettyjson = require('prettyjson');

exports.add_game_event = (req, res, next) => {
	const query_string = 'CALL add_game_event(?,?,?,?)';

	const payload = [
		req.body.game_name,
		req.body.game_starting_time_date,
		req.body.game_ending_time_date,
		req.body.account_id
	];

	const callback = (err,data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: err,
				origin: "add_game_event controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send({ error_code:err.code });
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "add_game_event controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
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
			winston.log('debug', 'Error', prettyjson.render({
				details: err,
				origin: "get_game_event controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.log('info', 'Not found.', prettyjson.render({
				origin: "get_game_event controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send();
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_game_event controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
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
			winston.log('debug', 'Error', prettyjson.render({
				details: err,
				origin: "get_user_upcoming_events in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', '0 rows returned', prettyjson.render({
				details: data,
				origin: "get_user_upcoming_events controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_user_upcoming_events controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
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
			winston.log('debug', 'Error', prettyjson.render({
				details: err,
				origin: "get_user_past_events in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', '0 rows returned', prettyjson.render({
				details: data,
				origin: "get_user_past_events controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_user_past_events controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.get_current_events = (req, res, next) => {
	const query_string = 'CALL get_current_events()';

	const payload = [];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: err,
				origin: "get_current_events in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', '0 rows returned', prettyjson.render({
				details: data,
				origin: "get_current_events controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_current_events controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.get_upcoming_events = (req, res, next) => {
	const query_string = 'CALL get_upcoming_events()';

	const payload = [];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: err,
				origin: "get_upcoming_events in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', '0 rows returned', prettyjson.render({
				details: data,
				origin: "get_upcoming_events controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_upcoming_events controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.update_game_event = (req, res, next) => {
	const query_string = 'CALL update_game_event(?,?,?,?)';
	const payload = [
		req.body.game_id,
		req.body.game_name,
		req.body.game_starting_time_date,
		req.body.game_ending_time_date
	];
	console.log(payload);

	const callback = (err, data) => {
		console.log(data);
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: err,
				origin: "update_game_event in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send({ error_code:err.code });
		} else if (data.affectedRows == 0) {
			winston.level = 'debug';
			winston.log('debug', 'Not found', prettyjson.render({
				details: err,
				origin: "update_game_event in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(404).send();
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "update_game_event controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.delete_game_event = (req, res, next) => {
	const query_string ='CALL delete_game_event(?)';

	const payload = [req.body.game_id];

	const callback = (err, data) => {
		console.log("x",err,data,payload,"x");
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: err,
				origin: "delete_game_event in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send({ error_code:err.code });
		} else if (data.affectedRows == 0) {
			winston.level = 'debug';
			winston.log('debug', 'Not found', prettyjson.render({
				details: data,
				origin: "delete_game_event in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(404).send();
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "delete_game_event controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};


exports.get_game_teams = (req, res, next) => {
	const query_string = 'CALL get_teams_of_game(?)';

	const payload = [req.params.game_id];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: err,
				origin: "get_upcoming_events in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', '0 rows returned', prettyjson.render({
				details: data,
				origin: "get_upcoming_events controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_upcoming_events controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.join_account_to_team = (req, res, next) => {
	const query_string = 'CALL join_account_to_team(?,?)';

	const payload = [
		req.body.account_id,
		req.body.team_id
	];

	const callback = (err,data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: err,
				origin: "join_account_to_team in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send({ error_code:err.code });
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "join_account_to_team in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.get_team_of_account = (req, res, next) => {
	const query_string = 'CALL get_team_of_account(?,?)';

	const payload = [req.params.account_id, req.params.game_id];
	console.log(req.params.account_id);

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: err,
				origin: "get_team_of_account in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', '0 rows returned', prettyjson.render({
				details: data,
				origin: "get_team_of_account controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_team_of_account controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};