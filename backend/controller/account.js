
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

	const callback = (err, data) => {
		console.log(data);
		if (err) {
			winston.level = 'debug';
			winston.log('debug', 'err:', err);
		} else if (data[0].length == 0) {
			winston.level = 'info';
			winston.log('info', 'Login failed.');
<<<<<<< HEAD
			res.status(401).send({message: 'Wrong username or password!'});
		} else if (data[0][0]["is_approved"] == 0) {
			winston.level = 'info';
			winston.log('info', 'Account not yet approved.');
			res.status(403).send({message: 'Account is not yet approved by the admin.'});
=======
			res.status(404).send({message: 'Wrong username or password!'});
		} else if (data[0].length != 0 && data[0][0].is_approved == 0) {
			winston.level = 'info';
			winston.log('info', 'Account not yet approved.');
			res.status(404).send({message: 'Account not yet approved!'});
>>>>>>> e7bcf1787f2cf84b4352f90cf46af3df891af31f
		} else {
			winston.level = 'info';
			winston.log('info', 'Login Successful!');
			req.session.user = data[0][0];
			res.status(200).send({message: 'Successfully logged in!'});
		}
	};

	db.query(query_string, payload, callback);
};

exports.logout = function(req, res, next) {
	if (req.session.user) {
        req.session.destroy();
        res.send({message: 'Logged out successfully!'});
	} else {
		res.status(401).send({message: "You must be logged in."});
	}
}

exports.add_account = (req,res,next) => {
	const query_string = 'CALL add_account(?,?,?,?,?,?,?,?,?,?,?,?,?,?)';

	const payload = [
		req.body.firstname,
		req.body.middlename,
		req.body.lastname,
		req.body.email,
		req.body.username,
		crypto.createHash('sha256').update(req.body.password).digest('base64'),
		req.body.course,
		req.body.birthday,
		req.body.college,
		req.body.is_game_head,
		req.body.position,
		req.body.is_player,
		req.body.player_jersey_num,
		req.body.player_role
	];

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

/*
=======================>>>>>>>>>>>why is this commented out? is this still needed or not?
fs.readFile(config.FILE, 'utf8', function (err,data) {
  if (err) {
      return console.log(err);
  } else{
      var body = data;
      var mailOptions = {
          from: 'johndoecmsc128@gmail.com',
          to: req.body.email,
          subject: 'MaliCSI App Registration',
          text: body,
      };
  }
});

transporter.sendMail(mailOptions, (err, info) =>{
  if (err) {
      return console.log(err);
  } else{
      console.log('Message %s send: %s', info.messageId, info.response);
  }
});
*/
};

exports.approve_account = (req,res,next) => {
	if (req.session.user && req.session.user.is_admin == true) {
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
	} else {
		res.status(401).send({message: "You must be an admin."});
	}
};


exports.update_account = (req,res,next) => {
	if (req.session.user && req.session.user.account_id == req.body.account_id) {
		const query_string = 'CALL update_account(?,?,?,?,?,?,?,?,?,?,?,?,?,?)';

		const payload = [
			req.body.firstname,
			req.body.middlename,
		    req.body.lastname,
			req.body.username,
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
	} else {
		res.status(401).send({message: "You must be owner of account."});
	}
};

exports.get_account = (req, res, next) => {
	if (req.session.user) {
		const query_string = "CALL get_account(?)";

		const payload = [req.params.account_id != undefined ? req.params.account_id : req.session.user.account_id];

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
	} else {
		res.status(401).send({message: "You must be logged in."});
	}
};

exports.get_all_account = (req, res, next) => {
	if (req.session.user) {
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
	} else {
		res.status(401).send({message: "You must be admin."});
	}
};

exports.delete_account = (req, res, next) => {
	console.log(req.session.user);
	if (req.session.user && (req.session.user.account_id == req.body.account_id || req.session.user.is_admin)) {
		const query_string ='CALL delete_account(?)';

		const payload = [req.body.account_id];

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
				if (req.session.user.account_id == req.body.account_id) {
					req.session.destroy();
				}
			}
		};

		db.query(query_string, payload, callback);
	} else {
	 	res.status(401).send({message: "You must be an admin or the owner of the account."});
	}
};

exports.get_pending_account = (req, res, next) => {
	if (req.session.user && req.session.user.is_admin) {
		const query_string = "CALL get_pending_account()";

		const payload = [];

		const callback = (err, data) => {
		    if (err) {
				winston.level = 'debug';
				winston.log('debug', 'err: ', err);
				res.status(500).send({ error_code:err.code });
		    } else {
				winston.level = 'info';
				winston.log('info', 'Successfully retrieved accounts!');
				res.status(200).send(data);
		    }
		 };

		db.query(query_string, payload, callback);
	} else {
		res.status(401).send({message: "You must be admin."});
	}
};
