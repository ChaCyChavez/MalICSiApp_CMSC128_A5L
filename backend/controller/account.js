'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');
const crypto = require('crypto');
const nodemailer = require('nodemailer');
const fs = require('fs');
const config = require('../config/config');

const transporter = nodemailer.createTransport(config.TRANSPORTER);

exports.login_account = (req, res, next) => {
	const query_string = "CALL login_account(?,?)";

	const payload = [
		req.body.username,
		crypto.createHash('sha256').update(req.body.password).digest('base64')
	];
	console.log(payload);

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err:', err);
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', 'Login failed.');
			res.status(404).send({message: 'Wrong username or password!'});
		} else {
			winston.level = 'info';
			winston.log('info', 'Login Successful!');
			req.session.user = data[0][0];
			res.status(200).send();
		}
	};

	db.query(query_string, payload, callback);
};

exports.add_account = (req,res,next) => {
	const query_string = 'CALL add_account(?,?,?,?,?,?,?,?,?,?,?,?,?)';

	const payload = [
		req.body.first_name,
		req.body.middle_name,
		req.body.last_name,
		req.body.email,
		req.body.username,
		crypto.createHash('sha256').update(req.body.password).digest('base64'),
		req.body.course,
		req.body.birthday,
		req.body.college,
		req.body.position,
		req.body.is_player,
		req.body.player_jersey_num,
		req.body.player_role
	];

	console.log(payload);

	const callback = (err,data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully added account!');
			res.status(200).send(data);
		}
	  };

	  db.query(query_string, payload, callback);

// fs.readFile(config.FILE, 'utf8', function (err,data) {
//   if (err) {
//       return console.log(err);
//   } else{
//       var body = data;
//       var mailOptions = {
//           from: 'johndoecmsc128@gmail.com',
//           to: req.body.email,
//           subject: 'MaliCSI App Registration',
//           text: body,
//       };
//   }
// });
//
// transporter.sendMail(mailOptions, (err, info) =>{
//   if (err) {
//       return console.log(err);
//   } else{
//       console.log('Message %s send: %s', info.messageId, info.response);
//   }
// });
};

exports.approve_account = (req,res,next) => {
	const query_string = 'CALL approve_account(?)';

	const payload = [req.body.account_id];

	const callback = (err,data) => {
			if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data.affectedRows == 0) {
			winston.level = 'info';
			winston.log('info', 'Not found! Approval failed');
			res.status(404).send();
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully approved account!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};


exports.update_account = (req,res,next) => {
	const query_string = 'CALL update_account(?,?,?,?,?,?,?,?,?,?,?,?,?,?)';

	const payload = [
		req.body.firstname,
		req.body.middlename,
	    req.body.lastname,
		req.body.email,
		crypto.createHash('sha256').update(req.body.password).digest('base64'),
		req.body.course,
	    req.body.birthday,
		req.body.college,
		req.body.position,
	    req.body.is_player,
		req.body.player_jersey_num,
		req.body.player_role,
	    req.body.account_id
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
			winston.log('info', 'Successfully updated account!');
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.get_account = (req, res, next) => {
	const query_string = "CALL get_account(?)";

	const payload = [req.params.account_id != undefined ? req.params.account_id : (req.session.user != undefined ? req.session.user.account_id : undefined)];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
		} else if (data[0].length == 0 || payload[0] == undefined) {
			winston.level = 'info';
			winston.log('info', 'No account retrieved with account_id:', payload[0]);
			res.status(200).send(data);
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully retrieved with account_id:', payload[0]);
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.get_all_account = (req, res, next) => {
	const query_string = "CALL get_all_account()";

	const payload = [];

	const callback = (err, data) => {
	    if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err: ', err);
			res.status(500).send({ error_code:err.code });
	    } else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', 'Empty');
			res.status(404).send({ message: 'Empty! Retrieve failed'});
	    } else {
			winston.level = 'info';
			winston.log('info', 'Successfully retrieved accounts!');
			res.status(200).send(data);
	    }
	 };

  db.query(query_string, payload, callback);
};

exports.delete_account = (req, res, next) => {
	const query_string ='CALL delete_account(?)';

	const payload = [req.params.account_id];

	const callback = (err, data) => {
		if (err) {
			winston.level = 'debug';
			winston.log('debug', '\n', err);
			res.status(500).send({ error_code:err.code });
		} else if (data.affectedRows == 0) {
			winston.level = 'info';
			winston.log('info', 'Not found! Delete failed');
			res.status(404).send({ message: 'Not found! Delete failed'});
		} else {
			winston.level = 'info';
			winston.log('info', 'Successfully deleted account!');
			res.status(200).send(data);
		}
	};

  db.query(query_string, payload, callback);
};
