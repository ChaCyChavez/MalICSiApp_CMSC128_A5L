'use strict';

const db = require(__dirname + '/../lib/mariasql');

//Login
exports.log_in_user = (req, res, next) => {
  const query_string = "SELECT account_id from account where "
      +"username = ? && password = ?;";
  const payload = [req.params.account_id, crypto.
    createHash('sha256').update(req.params.password).
    digest('base64')];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);

};

exports.add_account = (req,res,next) => {
  	const query_string = 'INSERT into account(firstname, middlename,'+
  		'lastname, email, username, password, course, birthday, college,'+
  		'status, is_game_head, position, is_player, player_jersey_num,' +
  		'player_role, team_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)'; 
  	const payload = [req.body.firstname, req.body.middlename, 
      	req.body.lastname, req.body.email, req.body.username,
      	crypto.createHash('sha256').update(req.body.password)
      	.digest('base64'),req.body.course, req.body.birthday, req.body.college, 
      	false, req.body.is_game_head, req.body.position, req.body.is_player,
      	req.body.player_jersey_num, req.body.player_role, req.body.team_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.update_account = (req,res,next) => {
    const query_string = 'UPDATE account set firstname = ?, middlename = ?,'+
      'lastname = ?, username = ?, password = ?, course = ?, birthday = ?, '+
      'college = ?, status = ?, is_game_head = ?, position = ?, is_player = ?'+
      ',player_jersey_num = ?,player_role = ?, team_id = ? where account_id = ?'; 
    const payload = [req.body.firstname, req.body.middlename, 
        req.body.lastname, req.body.username, crypto.createHash('sha256')
        .update(req.body.password).digest('base64'),req.body.course, 
        req.body.birthday, req.body.college, req.body.status, 
        req.body.is_game_head, req.body.position, req.body.is_player,
        req.body.player_jersey_num, req.body.player_role, req.body.team_id,
        req.body.account_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.get_account = (req, res, next) => {
  const query_string = "SELECT account_id, email, is_game_head,is_player "
      +"is_game_head, is_player,username, firstname, middlename, "
      +"lastname, course, birthday, college, status,player_jersey_num,"
      +"player_role, team_id from account where "
      +"account_id = ? ;";  
  const payload = [req.params.account_id];
  const callback = (err, data) => {
    res.send(data);
 };

  db.query(query_string, payload, callback);
};

exports.delete_account = (req, res, next) => {
  const query_string ='DELETE FROM account WHERE account_id = ?'; 
  const payload = [req.params.account_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};
