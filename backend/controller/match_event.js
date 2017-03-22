'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

//Controller to be used for adding a match_event
exports.add_match_event = (req,res,next) => {
  const query_string = 'INSERT into match_event(status,' +
      'match_date_time, score1, score2, series,sport_id,' +
      ' team1_id, team2_id, court_id) VALUES (?,?,?,?,?,?,?,?,?)'; 
  const payload = [req.body.status, req.body.match_date_time,
      req.body.sport_id, req.body.score1, req.body.score2,
      req.body.series, req.body.sport_id, req.body.team1_id,
      req.body.team2_id, req.body.court_id];
  const callback = (err,data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully added match!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used for retrieving a match_event given a match_id
exports.get_match_event = (req, res, next) => {
  const query_string = "SELECT * from match_event where match_id = ?";  
  const payload = [req.params.match_id];
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
      winston.log('info', 'Successfully retrieved match!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used for updating a match_event given a match_id
exports.update_match_event = (req, res, next) => {
  const query_string = 'UPDATE match_event set status = ?,' +
    'match_date_time = ?, score1 = ?, score2 = ?, series = ?,' + 
    ' sport_id = ?, team1_id = ?, team2_id = ?, court_id = ? ' +
    'WHERE match_id = ?';
  const payload = [req.body.status, req.body.match_date_time,
      req.body.sport_id, req.body.score1, req.body.score2,
      req.body.series, req.body.sport_id, req.body.team1_id,
      req.body.team2_id, req.body.court_id, req.body.match_id];

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
      winston.log('info', 'Successfully updated match!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used for deleting a match_event given a match_id
exports.delete_match_event = (req, res, next) => {
  const query_string ='DELETE FROM match_event WHERE match_id = ?'; 
  const payload = [req.body.match_id];
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
      winston.log('info', 'Successfully deleted match!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};