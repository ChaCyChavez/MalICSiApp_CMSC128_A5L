'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');
//Controller to be used to add a team
exports.add_team = (req,res,next) => {
  const query_string = 'CALL add_team(?, ?, ?)'; 
  const payload = [req.body.team_name, req.body.team_color, 
  		 req.body.game_id];
  const callback = (err,data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully added team!');
      return res.status(200).send(data);
    }
  };
  db.query(query_string, payload, callback);
};

//Controller to be used to get a team given a team_id
exports.get_team = (req, res, next) => {
  const query_string = "CALL get_team(?)";  
  const payload = [req.params.team_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data.length == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found!');
      res.status(404).send({ message: 'Not Found!'});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully retrieved team!');
      return res.status(200).send(data);
    }
  };
    db.query(query_string, payload, callback);
};

//Controller to be used to update a team given a team_id
exports.update_team = (req, res, next) => {
  const query_string = 'CALL update_team(?, ?, ?)';
  const payload = [req.body.team_name, req.body.team_color, 
                  req.body.team_id];
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
      winston.log('info', 'Successfully updated team!');
      return res.status(200).send(data);
    }
  };
  db.query(query_string, payload, callback);
};

//Controller to be used to delete a team given a team_id
exports.delete_team = (req, res, next) => {
  const query_string ='CALL delete_team(?)'; 
  const payload = [req.body.team_id];
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
      winston.log('info', 'Successfully deleted team!');
      return res.status(200).send(data);
    }
  };
    db.query(query_string, payload, callback);
};