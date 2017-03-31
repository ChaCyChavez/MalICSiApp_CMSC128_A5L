'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

//Controller to be used for adding a sport
exports.add_sport = (req,res,next) => {
  const query_string = 'CALL add_sport(?,?)'; 
  const payload = [req.body.sport_type, req.body.division];
  const callback = (err,data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully added sport!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used for retrieving a sport given a sport_id
exports.get_sport = (req, res, next) => {
  const query_string = 'CALL get_sport(?)';  
  const payload = [req.params.sport_id];
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
      winston.log('info', 'Successfully retrieved sport!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

exports.get_all_sport = (req, res, next) => {
  const query_string = 'CALL get_all_sport()';  

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
      winston.log('info', 'Successfully retrieved sport!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, callback);
};

//Controller to be used for updating a sport given a sport_id
exports.update_sport = (req, res, next) => {
  const query_string = 'CALL update_sport(?,?,?);';
  const payload = [req.body.sport_type,req.body.division,req.body.sport_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data.info.affectedRows == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found! Update failed');
      return res.status(404).send();
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully updated sport!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used for deleting a sport given a sport_id
exports.delete_sport = (req, res, next) => {
  const query_string ='CALL delete_sport(?)'; 
  const payload = [req.body.sport_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data.info.affectedRows == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found! Delete failed');
      return res.status(404).send();
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully deleted sport!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

exports.get_sport_team_match = (req, res, next) => {
  const query_string ='CALL get_sport_team_match(?)'; 
  const payload = [req.params.game_id];

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
      winston.log('info', 'Successfully retrieved sport details!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};



