'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

exports.add_match_event = (req, res, next) => {
	const query_string = 'CALL add_match_event(?,?,?,?)';

	const payload = [
		req.body.match_date_time,
		req.body.status,
		req.body.sport_id,
		req.body.court_id
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
};

exports.get_match_event = (req, res, next) => {
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
};

exports.update_match_event = (req, res, next) => {
	const query_string = 'CALL update_match_event(?,?,?,?)';

	const payload = [
		req.body.match_date_time,
		req.body.sport_id,
		req.body.court_id,
		req.body.match_id
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
};

exports.delete_match_event = (req, res, next) => {
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
};


exports.get_court_of_match = (req, res, next) => {
	const query_string ='CALL get_court_of_match(?)';

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
			winston.log('info', 'Successfully deleted match!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
}; 

exports.get_teams_N_scores_of_match = (req, res, next) => {
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
			winston.log('info', 'Successfully deleted match!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
} ;