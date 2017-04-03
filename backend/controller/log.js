'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

//Controller to be used for adding a log
exports.add_log = (req,res,next) => {
	const query_string = 'CALL add_activity_log(?,?)';

	const payload = [
		req.body.log_description,
		req.session.user.account_id
	];

	const callback = (err,data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully added log!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

//Controller to be used for retrieving a log given a log_id
exports.get_log = (req, res, next) => {
  const query_string = "CALL get_activity_log(?)";

  const payload = [req.session.user.account_id];

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
			winston.log('info', 'Successfully retrieved log!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

//Controller to be used for updating a log given an log_id
exports.update_log = (req, res, next) => {
	const query_string = 'CALL update_activity_log(?, ?, ?)';

	const payload = [
		req.body.log_id,
		req.body.log_description,
		req.body.log_date
	];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data.affectedRows == 0) {
			winston.level = 'info';
			winston.log('info', 'Not found! Update failed');
			res.status(404).send();
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully updated log!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.delete_log = (req, res, next) => {
	const query_string ='CAll delete_activity_log(?)';

	const payload = [req.body.log_id];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data.affectedRows == 0) {
			winston.level = 'info';
			winston.log('info', 'Not found! Delete failed');
			res.status(404).send();
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully deleted log!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};
