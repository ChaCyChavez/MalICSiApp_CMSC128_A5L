'use strict'

const db = require(__dirname + '/../../lib/mysql');

exports.add_account = (req,res,next) => {

  const query_string = 'INSERT into account VALUES (NULL,?,?,?,?,?,?,?,?,?,'
      +'?,?,?,?,?)'; 
  const payload = [req.body.email, req.body.is_regular_account, 
      req.body.is_admin, req.body.is_game_head, req.body.is_player,
      req.body.username, crypto.createHash('sha256').
      update(req.body.password).digest('base64'),req.body.firstname,
      req.body.middlename, req.body.lastname, req.body.course,
      req.body.birthday, req.body.college, req.body.status];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_court = (req,res,next) => {
  const query_string = 'INSERT into court VALUES (NULL,?,?,?)'; 
  const payload = [req.body.court_name, req.body.court_location, 
      req.body.court_type];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_game = (req,res,next) => {
  const query_string = 'INSERT into game VALUES (NULL,?,?,?,?,?)'; 
  const payload = [req.body.game_name, req.body.game_place, 
      req.body.game_starting_time_date, req.body.game_ending_time_date, 
      req.body.account_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_game_type = (req,res,next) => {
  const query_string = 'INSERT into game_game_type VALUES (?,?)'; 
  const payload = [req.body.game_id, req.body.game_type];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_game_sponsor = (req,res,next) => {
  const query_string = 'INSERT into game_sponsor VALUES (?,?)'; 
  const payload = [req.body.game_id, req.body.sponsor_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_log = (req,res,next) => {
  const query_string = 'INSERT into log VALUES (NULL,?,?)'; 
  const payload = [req.body.log_description, req.body.account_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_participates = (req,res,next) => {
  const query_string = 'INSERT into participates VALUES (?,?)'; 
  const payload = [req.body.player_id, req.body.sport_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_player = (req,res,next) => {
  const query_string = 'INSERT into player VALUES (NULL,?,?,?,?)'; 
  const payload = [req.body.account_id, req.body.player_jersey_number,
      req.body.is_coach, req.body.game_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_registers = (req,res,next) => {
  const query_string = 'INSERT into registers VALUES (?,?)'; 
  const payload = [req.body.player_id, req.body.game_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_score = (req,res,next) => {
  const query_string = 'INSERT into score VALUES (NULL,?,?,?,?)'; 
  const payload = [req.body.sport_id, req.body.winning_team, 
      req.body.losing_team, req.body.series];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_sponsor = (req,res,next) => {
  const query_string = 'INSERT into sponsor VALUES (NULL,?,?,?,?)'; 
  const payload = [req.body.sponsor_name, req.body.sponsor_affiliation,
      req.body.sponsor_logo, req.body.game_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_sport = (req,res,next) => {
  const query_string = 'INSERT into sport VALUES (NULL,?,?,?,?,?,?)'; 
  const payload = [req.body.sport_type, req.body.number_of_participants,
      req.body.date_time, req.body.division, req.body.game_id, 
      req.body.court_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_sport_player = (req,res,next) => {
  const query_string = 'INSERT into sport_player VALUES (?,?)'; 
  const payload = [req.body.sport_id, req.body.player_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_team = (req,res,next) => {
  const query_string = 'INSERT into team VALUES (NULL,?,?,?)'; 
  const payload = [req.body.team_name, req.body.team_color, 
      req.body.team_coach];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

exports.add_team_player = (req,res,next) => {
  const query_string = 'INSERT into team_player VALUES (?,?)'; 
  const payload = [req.body.team_id, req.body.player_id];
  const callback = (err,data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};