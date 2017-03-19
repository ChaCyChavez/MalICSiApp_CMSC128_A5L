'use strict';

const db = require(__dirname + '/../lib/mariasql');
const winston = require('winston');

//Controller to be used to add a team
exports.add_team = (req,res,next) => {
  const query_string = 'INSERT into team VALUES (?,?,?,?)'; 
  const payload = [req.body.team_name, req.body.team_color, 
  req.body.team_coach, req.body.game_id];
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
      winston.log('info', 'Successfully added team!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used to get a team given a team_id
exports.get_team = (req, res, next) => {
  const query_string = "SELECT * from team where team_id = ?";  
  const payload = [req.params.team_id];
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
      winston.log('info', 'Successfully retrieved team!');
      return res.status(200).send(data);
    }

    db.query(query_string, payload, callback);
};

//Controller to be used to update a team given a team_id
exports.update_team = (req, res, next) => {
  const query_string = 'UPDATE team set team_name = ?, team_color = ?, ' + 
              'team_coach = ?, game_id = ? WHERE team_id = ?;';
  const payload = [req.body.team_name, req.body.team_color, req.body.team_coach, 
          req.body.game_id, req.body.team_id];
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
      winston.log('info', 'Successfully updated team!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used to delete a team given a team_id
exports.delete_team = (req, res, next) => {
  const query_string ='DELETE FROM team WHERE team_id = ?'; 
  const payload = [req.params.team_id];
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
      winston.log('info', 'Successfully deleted team!');
      return res.status(200).send(data);
    }
  };

    db.query(query_string, payload, callback);
};