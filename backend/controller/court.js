'use strict';

const db = require(__dirname + '/../lib/mariasql');
const winston = require('winston');

//Controller to be used for adding a court
exports.add_court = (req, res, next) => {
  const query_string = 'INSERT into court(court_name,court_location,court_type)'+
      ' VALUES (?,?,?)'; 
  const payload = [req.body.court_name,
    req.body.court_location, req.body.court_type];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully added court!');
      return res.status(200).send(data);
    }
  };
  db.query(query_string, payload, callback);
};

//Controller to be used for retrieving a court given a court_id
exports.get_court = (req, res, next) => {
  const query_string = 'SELECT * from court WHERE court_id = ?';  
  const payload = [req.params.court_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data.length == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found!');
      return res.status(404).send(data);
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully retrieved court!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used for updating a court given a court_id
exports.update_court = (req, res, next) => {
  const query_string = 'UPDATE court SET court_name = ?, ' + 
      'court_location = ?, court_type = ? WHERE court_id = ?';
  const payload = [req.body.court_name, req.body.court_location, 
      req.body.court_type, req.body.court_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data.info.affectedRows == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found! Update failed');
      return res.status(404).send(data);
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully updated court!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used for deleting a court given a court_id
exports.delete_court = (req, res, next) => {
  const query_string ='DELETE FROM court WHERE court_id = ?'; 
  const payload = [req.body.court_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data.info.affectedRows == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found! Delete failed');
      return res.status(404).send(data);
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully deleted court!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};