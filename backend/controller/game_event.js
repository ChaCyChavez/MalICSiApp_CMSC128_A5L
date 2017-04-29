'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');
const prettyjson = require('prettyjson');
const errors = require(__dirname + '/../errors');

exports.add_game_event = (req, res, next) => {
	if (req.session.user && (req.session.user.is_game_head || req.session.user.is_admin)) {
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
					details: errors.QUERY_FAILED.response.message,
					origin: "add_game_event() in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response);
			} else {
				winston.level = 'info';
				winston.log('info', 'Success', prettyjson.render({
					details: data,
					origin: "add_game_event() in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	} else {
		winston.level = 'debug';
		winston.log('debug', 'Error', prettyjson.render({
			details: errors.NOT_GAME_HEAD_OR_ADMIN.response.message,
			origin: "add_game_event() in game_event.js"
		}));
		res.status(errors.NOT_GAME_HEAD_OR_ADMIN.code).send(errors.NOT_GAME_HEAD_OR_ADMIN.response);
	}
};

exports.get_game_event = (req, res, next) => {
	const query_string = 'CALL get_game_event(?)';

	const payload = [
		req.params.game_id
	];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: errors.QUERY_FAILED.response.message,
				origin: "get_game_event() controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response);
		} else if (data[0].length == 0) {
			winston.log('info', 'Not found.', prettyjson.render({
				details: errors.NOT_FOUND.response.message,
				origin: "get_game_event() controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(errors.NOT_FOUND.code).send(errors.NOT_FOUND.response);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_game_event() controller in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.get_user_upcoming_events = (req, res, next) => {
	if (req.session.user || req.params.account_id != undefined) {
		const query_string = 'CALL get_user_upcoming_events(?)';

		const payload = [req.params.account_id != undefined ? req.params.account_id : req.session.user.account_id];

		const callback = (err, data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'Error', prettyjson.render({
					details: errors.QUERY_FAILED.response.message,
					origin: "get_user_upcoming_events() in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response);
			} else {
				winston.level = 'info';
				winston.log('info', 'Success', prettyjson.render({
					details: data,
					origin: "get_user_upcoming_events() in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	} else {
		winston.level = 'debug';
		winston.log('debug', 'Error', prettyjson.render({
			details: errors.NOT_LOGGED_IN.response.message,
			origin: "get_user_upcoming_events() in game_event.js"
		}));
		res.status(errors.NOT_LOGGED_IN.code).send(errors.NOT_LOGGED_IN.response);
	}
};

exports.get_user_past_events = (req, res, next) => {
	if (req.session.user || req.params.account_id != undefined) {
		const query_string = 'CALL get_user_past_events(?)';

		const payload = [
			req.params.account_id != undefined ? req.params.account_id : req.session.user.account_id
		];

		const callback = (err, data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'Error', prettyjson.render({
					details: errors.QUERY_FAILED.response.message,
					origin: "get_user_past_events() in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response);
			} else {
				winston.level = 'info';
				winston.log('info', 'Success', prettyjson.render({
					details: data,
					origin: "get_user_past_events() controller in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	} else {
		winston.level = 'debug';
		winston.log('debug', 'Error', prettyjson.render({
			details: errors.NOT_LOGGED_IN.response.message,
			origin: "get_user_past_events() in game_event.js",
		}));
		res.status(errors.NOT_LOGGED_IN.code).send(errors.NOT_LOGGED_IN.response);
	}
}

exports.get_current_events = (req, res, next) => {
	const query_string = 'CALL get_current_events()';

	const payload = [];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: errors.QUERY_FAILED.response.message,
				origin: "get_current_events() in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_current_events() in game_event.js",
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
				details: errors.QUERY_FAILED.response.message,
				origin: "get_upcoming_events() in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_upcoming_events() in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.get_events = (req, res, next) => {
	const query_string = 'CALL get_events()';

	const payload = [];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: errors.QUERY_FAILED.response.message,
				origin: "get_events() in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_events() in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};


exports.update_game_event = (req, res, next) => {
	if (req.session.user && (req.session.user.is_game_head || req.session.user.is_admin)) {
		const query_string = 'CALL update_game_event(?,?,?,?,?)';
		
		const payload = [
			req.body.game_id,
			req.body.game_name,
			req.body.game_starting_time_date,
			req.body.game_ending_time_date,
			req.session.user.account_id
		];

		const callback = (err, data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'Error', prettyjson.render({
					details: errors.QUERY_FAILED.response.message,
					origin: "update_game_event() in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response);
			} else if (data.affectedRows == 0) {
				winston.level = 'debug';
				winston.log('debug', 'Not found', prettyjson.render({
					details: errors.NOT_FOUND.response.message,
					origin: "update_game_event() in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(errors.NOT_FOUND.code).send(errors.NOT_FOUND.response);
			} else {
				winston.level = 'info';
				winston.log('info', 'Success', prettyjson.render({
					details: data,
					origin: "update_game_event() in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	} else {
		winston.level = 'debug';
		winston.log('debug', 'Error', prettyjson.render({
			details: errors.NOT_GAME_HEAD_OR_ADMIN.response.message,
			origin: "update_game_event() in game_event.js"
		}));
		res.status(errors.NOT_GAME_HEAD_OR_ADMIN.code).send(errors.NOT_GAME_HEAD_OR_ADMIN.response);
	}
};

exports.delete_game_event = (req, res, next) => {
	if (req.session.user && (req.session.user.is_game_head || req.session.user.is_admin)) {
		const query_string ='CALL delete_game_event(?, ?)';

		const payload = [
			req.body.game_id,
			req.session.user.account_id
		];

		const callback = (err, data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'Error', prettyjson.render({
					details: errors.QUERY_FAILED.response.message,
					origin: "delete_game_event() in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response);
			} else if (data.affectedRows == 0) {
				winston.level = 'debug';
				winston.log('debug', 'Not found', prettyjson.render({
					details: errors.NOT_FOUND.response.message,
					origin: "delete_game_event() in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(errors.NOT_FOUND.code).send(errors.NOT_FOUND.response);
			} else {
				winston.level = 'info';
				winston.log('info', 'Success', prettyjson.render({
					details: data,
					origin: "delete_game_event() in game_event.js",
					payload: payload,
					query_string: query_string
				}));
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	} else {
		winston.level = 'debug';
		winston.log('debug', 'Error', prettyjson.render({
			details: errors.NOT_GAME_HEAD_OR_ADMIN.response.message,
			origin: "delete_game_event() in game_event.js"
		}));
		res.status(errors.NOT_GAME_HEAD_OR_ADMIN.code).send(errors.NOT_GAME_HEAD_OR_ADMIN.response);
	}
};


exports.get_game_teams = (req, res, next) => {
	const query_string = 'CALL get_teams_of_game(?)';

	const payload = [
		req.params.game_id
	];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: errors.QUERY_FAILED.response.message,
				origin: "get_game_teams() in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_game_teams() in game_event.js",
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
				details: errors.QUERY_FAILED.response.message,
				origin: "join_account_to_team() in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "join_account_to_team() in game_event.js",
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

	const payload = [
		req.params.account_id,
		req.params.game_id
	];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'Error', prettyjson.render({
				details: errors.QUERY_FAILED.response.message,
				origin: "get_team_of_account() in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(errors.QUERY_FAILED.code).send(errors.QUERY_FAILED.response.message);
		} else {
			winston.level = 'info';
			winston.log('info', 'Success', prettyjson.render({
				details: data,
				origin: "get_team_of_account() in game_event.js",
				payload: payload,
				query_string: query_string
			}));
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};