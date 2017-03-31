'use strict';

const db = require(__dirname + '/../lib/mysql');
const winston = require('winston');
const crypto        = require('crypto');
const nodemailer    = require('nodemailer');
const fs            = require('fs');
const file = "../mailbody/body.txt";  //path to file of body message here
const transporter = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
        user: 'johndoecmsc128@gmail.com',
        pass: 'johndoe128'
    }
});

 
//Login
exports.login_account = (req, res, next) => {  
  const query_string = "CALL login_account(?,?)";
  const payload = [req.query.username, crypto.
    createHash('sha256').update(req.query.password).
    digest('base64')];
  const callback = (err, data) => {
    if (err) {
      winston.level = 'debug';
      winston.log('debug', 'err:', err);
    } else if (data[0].length == 0) {
      winston.level = 'info';
      winston.log('info', 'Login failed.');
      return res.status(404).send({message: 'Wrong username or password.'});
    } else if (data[0].length){
      winston.level = 'info';
      winston.log('info', 'Login Successful!');
      req.session.user = {
        id: data[0][0].account_id,
        fname: data[0][0].firstname,
        mname: data[0][0].middlename,
        lname: data[0][0].lastname,
        username: data[0][0].username,
        course: data[0][0].course,
        email: data[0][0].email,
        birthday: data[0][0].birthday,
        college: data[0][0].college
      }
      return res.status(200).send();
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used for adding an account
exports.add_account = (req,res,next) => {
  	const query_string = 'CALL add_account(?,?,?,?,?,?,?,?,?,?,?,?,?)';
  	const payload = [req.body.firstname, req.body.middlename,
      	req.body.lastname, req.body.email, req.body.username,
      	crypto.createHash('sha256').update(req.body.password)
      	.digest('base64'),req.body.course, req.body.birthday, req.body.college,
      	req.body.position, req.body.is_player,req.body.player_jersey_num,
        req.body.player_role];
  const callback = (err,data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully added account!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);



  fs.readFile(file, 'utf8', function (err,data) {
    if (err) {
        return console.log(err);
    } else{
        var body = data;
        var mailOptions = {
            from: 'johndoecmsc128@gmail.com',
            to: req.body.email,
            subject: 'MaliCSI App Registration',
            text: body,
        };
    }
  });

  transporter.sendMail(mailOptions, (err, info) =>{
    if (err) {
        return console.log(err);
    } else{
        console.log('Message %s send: %s', info.messageId, info.response);
    }
  });
};

exports.approve_account = (req,res,next) => {
    const query_string = 'CALL approve_account(?)';
    const payload = [req.body.account_id];
  const callback = (err,data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data.info.affectedRows == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found! Approval failed');
      return res.status(404).send();
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully approved account!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};


//Controller to be used to update an account given an account_id
exports.update_account = (req,res,next) => {
    const query_string = 'CALL update_account(?,?,?,?,?,?,?,?,?,?,?,?,?,?)';
    const payload = [req.body.firstname, req.body.middlename,
        req.body.lastname, req.body.email, crypto.createHash('sha256')
        .update(req.body.password).digest('base64'),req.body.course,
        req.body.birthday, req.body.college,req.body.position,
        req.body.is_player, req.body.player_jersey_num, req.body.player_role,
        req.body.account_id];
  const callback = (err,data) => {
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
      winston.log('info', 'Successfully updated account!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

//Controller to be used to retrieve an account given an account_id
exports.get_account = (req, res, next) => {
  const query_string = "CALL get_account(?)";
  const payload = [req.params.account_id];
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
      winston.log('info', 'Successfully retrieved account!');
      return res.status(200).send(data);
    }
 };

  db.query(query_string, payload, callback);
};

//Controller to be used to retrieve all account
exports.get_all_account = (req, res, next) => {
  const query_string = "CALL get_all_account()";
  const payload = [];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', 'err: ', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data[0].length == 0) {
	  console.log(data);
      winston.level = 'info';
      winston.log('info', 'Empty');
      return res.status(404).send({ message: 'Empty! Retrieve failed'});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully retrieved accounts!');
      return res.status(200).send(data);
    }
 };

  db.query(query_string, payload, callback);
};
//Controller to be used to delete an account given an account_id
exports.delete_account = (req, res, next) => {
  const query_string ='CALL delete_account(?)';
  const payload = [req.params.account_id];
  const callback = (err, data) => {
    if(err){
      winston.level = 'debug';
      winston.log('debug', '\n', err);
      return res.status(500).send({ error_code:err.code});
    } else if (data.affectedRows == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found! Delete failed');
      return res.status(404).send({ message: 'Not found! Delete failed'});
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully deleted account!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};
