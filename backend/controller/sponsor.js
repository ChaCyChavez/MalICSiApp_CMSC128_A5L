'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');

//Controller to be used for adding a sponsor given a court_id
exports.add_sponsor = (req, res, next) => {
  const query_string = 'CALL add_sponsor(?,?,?,?,?,?)';
  const payload = [req.query.sponsor_name,
                    req.query.sponsor_logo,
                    req.query.sponsor_type,
                    req.query.sponsor_desc,
                    req.query.web_address,
                    req.query.game_id];
  const callback = (err,data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully added sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used for retrieving a sponsor given a sponsor_id
exports.get_sponsor = (req, res, next) => {
  console.log(req.params);
  const query_string = 'CALL get_sponsor(?)';  
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
      winston.log('info', 'Successfully retrieved sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};



//Controller to be used for updating a sponsor given a sponsor_id
exports.update_sponsor = (req, res, next) => {
  const query_string = 'CALL update_sponsor(?,?,?,?,?,?,?)';
  const payload = [req.body.sponsor_id, req.body.sponsor_name, req.body.sponsor_logo, 
      req.body.sponsor_affiliation, req.body.sponsor_type,req.body.sponsor_desc, req.body.web_address];
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
      winston.log('info', 'Successfully updated sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used for deleting a sponsor given a sponsor_id
exports.delete_sponsor = (req, res, next) => {
  const query_string ='CALL delete_sponsor(?)'; 
  const payload = [req.body.sponsor_id];
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
      winston.log('info', 'Successfully deleted sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};