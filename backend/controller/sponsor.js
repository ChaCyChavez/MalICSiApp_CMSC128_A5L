'use strict';

const db = require(__dirname + '/../lib/mariasql');
const winston = require('winston');

exports.add_sponsor = (req, res, next) => {
  const query_string = 'INSERT into sponsor(sponsor_name,sponsor_logo' +
          ',sponsor_affiliation) VALUES (?,?,?)'; 
  const payload = [req.body.sponsor_name,req.body.sponsor_logo,
          req.body.sponsor_affiliation];
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
      winston.log('info', 'Successfully added sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

exports.get_sponsor = (req, res, next) => {
  const query_string = 'SELECT * from sponsor where sponsor_id = ?';  
  const payload = [req.params.sponsor_id];
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
      winston.log('info', 'Successfully retrieved sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

exports.update_sponsor = (req, res, next) => {
  const query_string = 'UPDATE sponsor SET sponsor_name = ?, ' + 
      'sponsor_logo = ?, sponsor_affiliation = ? WHERE sponsor_id = ?;';
  const payload = [req.body.sponsor_name, req.body.sponsor_logo, 
      req.body.sponsor_affiliation, req.body.sponsor_id];
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
      winston.log('info', 'Successfully updated sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

exports.delete_sponsor = (req, res, next) => {
  const query_string ='DELETE FROM sponsor WHERE sponsor_id = ?'; 
  const payload = [req.params.sponsor_id];
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
      winston.log('info', 'Successfully deleted sponsor!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};