'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

exports.add_match_event = (req, res, next) => {
	if (req.session.user && req.session.user.is_game_head) {
		// to do, check if game_head is owner of match_event
		const query_string = 'CALL add_match_event(?,?,?,?,?,?)';

		const payload = [
			req.body.status,
			req.body.match_date_time,
			req.body.sport_id,
			req.body.court_name,
			req.body.court_location,
			req.body.court_type

		];

		const callback = (err,data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'err: ', err);
				res.status(500).send({ error_code:err.code });
			} else {
				winston.level = 'info';
				winston.log('info', 'Successfully added match!');
				res.status(200).send(data);
			}
		};
		db.query(query_string, payload, callback);
	} else {
		res.status(401).send({message:"You must be a game head."});
	}
};

exports.add_match_event_team = (req, res, next) => {
	if (req.session.user && req.session.user.is_game_head) {
		// to do, check if game_head is owner of match_event
		const query_string = 'CALL add_match_event_team(?,?)';

		const payload = [
			req.body.team_id,
			req.body.score
		];

		const callback = (err,data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'err: ', err);
				res.status(500).send({ error_code:err.code });
			} else {
				winston.level = 'info';
				winston.log('info', 'Successfully added team to a match event!');
				res.status(200).send(data);
			}
		};
		// console.log(payload);
		db.query(query_string, payload, callback);
	} else {
		res.status(401).send({message:"You must be a game head."});
	}
};

exports.get_match_event = (req, res, next) => {
	if (req.session.user) {
		const query_string = 'CALL get_match_event(?)';

		const payload = [req.params.match_id];

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
				winston.log('info', 'Successfully retrieved match!');
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	} else {
		res.status(401).send({message:"You must be logged in."});
	}
};

exports.update_match_event = (req, res, next) => {
	if (req.session.user && req.session.user.is_game_head) {
		// to do , check if match is owned by game_head
		const query_string = 'CALL update_match_event(?,?,?,?)';

		const payload = [
			req.body.match_id,
			req.body.match_date_time,
			req.body.court_name,
			req.body.court_type
		];

		const callback = (err, data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'err: ', err);
				res.status(500).send({ error_code:err.code });
			} else if (data.affectedRows == 0) {
				winston.level = 'info';
				winston.log('info', 'Not found! Update failed');
				res.status(200).send();
			} else {
				winston.level = 'info';
				winston.log('info', 'Successfully updated match!');
				res.status(200).send(data);
			}
		};
		db.query(query_string, payload, callback);
	} else {
		res.status(401).send({message:"You must be logged in."});
	}
};

exports.delete_match_event = (req, res, next) => {
	if (req.session.user && req.session.user.is_game_head) {
		// to do check if owned by game_head
		const query_string ='CALL delete_match_event(?)';

		const payload = [req.body.match_id];

		const callback = (err, data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'err: ', err);
				res.status(500).send({ error_code:err.code });
			} else if (data.affectedRows == 0) {
				winston.level = 'info';
				winston.log('info', 'Not found! Delete failed');
				res.status(200).send();
			} else {
				winston.level = 'info';
				winston.log('info', 'Successfully deleted match!');
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	} else {
		res.status(401).send({message:"You must be game head."});
	}
};

exports.get_all_match_event = (req, res, next) => {
	if (req.session.user) {
		const query_string ='CALL get_all_match_event(?)';

		const payload = [req.body.match_id];

		const callback = (err, data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'err: ', err);
				res.status(500).send({ error_code:err.code });
			} else if (data.affectedRows == 0) {
				winston.level = 'info';
				winston.log('info', 'Not found! Delete failed');
				res.status(200).send();
			} else {
				winston.level = 'info';
				winston.log('info', 'Successfully deleted match!');
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	} else {
		res.status(401).send({message:"You must be logged in."});
	}
};


exports.get_teams_N_scores_of_match = (req, res, next) => {
	// if (req.session.user) {
		const query_string ='CALL get_teams_N_scores_of_match(?)';

		const payload = [req.params.match_id];

		const callback = (err, data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'err: ', err);
				res.status(500).send({ error_code:err.code });
			} else if (data[0].length == 0) {
				winston.level = 'info';
				winston.log('info', 'Not found! Retrieve failed!');
				res.status(200).send(data);
			} else {
				winston.level = 'info';
				winston.log('info', 'Successfully retrieved teams and scores in a match!');
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	// } else {
	// 	// res.status(401).send({message:"You must be logged in."});
	// }
};

exports.update_match_score = (req, res, next) => {
	if (req.session.user) {
		const query_string ='CALL update_match_score(?,?,?)';

		const payload = [
			req.body.team_id,
			req.body.match_id,
			req.body.score
		];

		const callback = (err, data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'err: ', err);
				res.status(500).send({ error_code:err.code });
			} else if (data.affectedRows == 0) {
				winston.level = 'info';
				winston.log('info', 'Not found! Update failed');
				res.status(200).send();
			} else {
				winston.level = 'info';
				winston.log('info', 'Successfully updated scores!');
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	} else {
		res.status(401).send({message:"You must be logged in."});
	}
} ;

exports.update_match_court = (req, res, next) => {
	if (req.session.user) {
		const query_string ='CALL update_match_court(?,?,?,?)';

		const payload = [
			req.body.match_id,
			req.body.court_name,
			req.body.court_type,
			req.body.court_location
		];

		const callback = (err, data) => {
			if (err) {
				winston.level = 'debug';
				winston.log('debug', 'err: ', err);
				res.status(500).send({ error_code:err.code });
			} else if (data.affectedRows == 0) {
				winston.level = 'info';
				winston.log('info', 'Not found! Update failed');
				res.status(200).send();
			} else {
				winston.level = 'info';
				winston.log('info', 'Successfully updated court details!');
				res.status(200).send(data);
			}
		};

		db.query(query_string, payload, callback);
	} else {
		res.status(401).send({message:"You must be logged in."});
	}
} ;
