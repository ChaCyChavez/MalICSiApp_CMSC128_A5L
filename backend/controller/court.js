// 'use strict';
//
// const db = require(__dirname + '/../lib/mysql');
// const winston = require('winston');
//
// exports.add_court = (req, res, next) => {
// 	const query_string = 'CALL add_court(?,?,?)';
//
// 	const payload = [
// 		req.body.court_name,
// 		req.body.court_location,
// 		req.body.court_type
// 	];
//
// 	const callback = (err, data) => {
// 		if (err) {
// 			winston.level = 'debug';
// 			winston.log('debug', 'err: ', err);
// 			res.status(500).send({ error_code:err.code });
// 		} else {
// 			winston.level = 'info';
// 			winston.log('info', 'Successfully added court!');
// 			res.status(200).send(data);
// 		}
// 	};
//
// 	db.query(query_string, payload, callback);
// };
//
// exports.get_court = (req, res, next) => {
// 	const query_string = 'CALL get_court(?)';
//
// 	const payload = [req.params.court_id];
//
// 	const callback = (err, data) => {
// 		if (err) {
// 			winston.level = 'debug';
// 			winston.log('debug', 'err: ', err);
// 			res.status(500).send({ error_code:err.code });
// 		} else if (data[0].length == 0) {
// 			winston.level = 'info';
// 			winston.log('info', 'Not found!');
// 			res.status(404).send(data);
// 		} else {
// 			winston.level = 'info';
// 			winston.log('info', 'Successfully retrieved court!');
// 			res.status(200).send(data);
// 		}
// 	};
//
// 	db.query(query_string, payload, callback);
// };
//
// exports.update_court = (req, res, next) => {
// 	const query_string = 'CALL update_court(?,?,?,?)';
//
// 	const payload = [
// 		req.body.court_name,
// 		req.body.court_location,
// 		req.body.court_type,
// 		req.body.court_id
// 	];
//
// 	const callback = (err, data) => {
// 		if (err) {
// 			winston.level = 'debug';
// 			winston.log('debug', 'err: ', err);
// 			res.status(500).send({ error_code:err.code });
// 		} else if (data.affectedRows == 0) {
// 			winston.level = 'info';
// 			winston.log('info', 'Not found! Update failed');
// 			res.status(404).send(data);
// 		} else {
// 			winston.level = 'info';
// 			winston.log('info', 'Successfully updated court!');
// 			res.status(200).send(data);
// 		}
// 	};
//
// 	db.query(query_string, payload, callback);
// };
//
// exports.delete_court = (req, res, next) => {
// 	const query_string ='CALL delete_court(?)';
//
// 	const payload = [req.body.court_id];
//
// 	const callback = (err, data) => {
// 		if (err) {
// 			winston.level = 'debug';
// 			winston.log('debug', 'err: ', err);
// 			res.status(500).send({ error_code:err.code });
// 		} else if (data.affectedRows == 0) {
// 			  winston.level = 'info';
// 			  winston.log('info', 'Not found! Delete failed');
// 			  res.status(404).send(data);
// 		} else {
// 			winston.level = 'info';
// 			winston.log('info', 'Successfully deleted court!');
// 			res.status(200).send(data);
// 		}
// 	};
//
// 	db.query(query_string, payload, callback);
// };
