'use strict';

const db = require(__dirname + '/../lib/mariasql');
const winston = require('winston');

//ADD game_event_sponsor
exports.add_game_event_sponsor = (req, res, next) => {
  const query_string ='INSERT INTO game_event_sponsor VALUES (?,?,?)';
  const payload = [req.body.game_id,req.body.sponsor_id,req.body.sponsor_type];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully added game event sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//GET game_event_sponsor
exports.get_game_event_sponsor = (req, res, next) => {
  const query_string ='SELECT * FROM game_event_sponsor WHERE game_id = ?'
  +'AND sponsor_id = ?';
  const payload = [req.params.game_id,req.params.sponsor_id];
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
      winston.log('info', 'Successfully retrieved game event sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};


//UPDATE game_event_sponsor
exports.update_game_event_sponsor = (req, res, next) => {
  const query_string ='UPDATE game_event_sponsor SET game_id = ?,'
  +'sponsor_id = ?, sponsor_type = ? WHERE game_id = ? AND sponsor_id = ?';
  const payload = [req.body.game_id, req.body.sponsor_id, req.body.sponsor_type,
   req.params.game_id,req.params.sponsor_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully updated game event sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};


//DELETE game_event_sponsor
exports.delete_game_event_sponsor = (req, res, next) => {
  const query_string ='DELETE FROM game_event_sponsor WHERE game_id = ?'
  + 'AND sponsor_id = ?';
  const payload = [req.params.game_id,req.params.sponsor_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully deleted game event sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};


