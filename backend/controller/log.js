'use strict';

const db = require(__dirname + '/../lib/mariasql');
const winston = require('winston');

//Controller to be used for adding a log
exports.add_log = (req,res,next) => {
  const query_string = 'INSERT into log VALUES (?,?)'; 
  const payload = [req.body.log_description, req.body.account_id];
  const callback = (err,data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found!');
      return res.status(404).send(data);
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully added log!');
      return res.status(200).send(data);
    }
  };

    db.query(query_string, payload, callback);
};

//Controller to be used for retrieving a log given a account_id
exports.get_log = (req, res, next) => {
  const query_string = "SELECT * from log where account_id = ?";  
  const payload = [req.params.account_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found!');
      return res.status(404).send(data);
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully retrieved log!');
      return res.status(200).send(data);
    }
  };

    db.query(query_string, payload, callback);
};

//Controller to be used for updating a log given an account_id
exports.update_log = (req, res, next) => {
  const query_string = 'UPDATE log set log_description = ?, account_id = ?' +
            'WHERE log_id = ?;';
  const payload = [req.body.team_name, req.body.log_description, 
      req.body.account_id, req.log_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found!');
      return res.status(404).send(data);
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully updated log!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used for deleting a log given an account_id
exports.delete_log = (req, res, next) => {
  const query_string ='DELETE FROM log WHERE log_id = ?'; 
  const payload = [req.params.log_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found!');
      return res.status(404).send(data);
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully deleted log!');
      return res.status(200).send(data);
    }
  };

    db.query(query_string, payload, callback);
};