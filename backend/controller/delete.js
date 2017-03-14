'use strict';

const db = require(__dirname + '/../lib/mariasql');

//DELETE ACCOUNT
exports.delete_account = (req, res, next) => {
  const query_string ='DELETE FROM account WHERE account_id = ?'; 
  const payload = [req.params.account_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE PLAYER
exports.delete_player = (req, res, next) => {
  const query_string ='DELETE FROM player WHERE player_id = ?'; 
  const payload = [req.params.player_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE GAME
exports.delete_game = (req, res, next) => {
  const query_string ='DELETE FROM game WHERE game_id = ?'; 
  const payload = [req.params.game_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE SPORT
exports.delete_sport = (req, res, next) => {
  const query_string ='DELETE FROM sport WHERE sport_id = ?'; 
  const payload = [req.params.sport_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE SCORE
exports.delete_score = (req, res, next) => {
  const query_string ='DELETE FROM score WHERE score_id = ?'; 
  const payload = [req.params.score_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE COURT
exports.delete_court = (req, res, next) => {
  const query_string ='DELETE FROM court WHERE court_id = ?'; 
  const payload = [req.params.court_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE SPONSOR
exports.delete_sponsor = (req, res, next) => {
  const query_string ='DELETE FROM sponsor WHERE sponsor_id = ?'; 
  const payload = [req.params.sponsor_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE TEAM
exports.delete_team = (req, res, next) => {
  const query_string ='DELETE FROM team WHERE team_id = ?'; 
  const payload = [req.params.team_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE LOG
exports.delete_log = (req, res, next) => {
  const query_string ='DELETE FROM log WHERE log_id = ?'; 
  const payload = [req.params.log_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE TEAM_PLAYER
exports.delete_team_player = (req, res, next) => {
  const query_string ='DELETE FROM team_player WHERE player_id = ? and '
      +'player_id = ?'; 
  const payload = [req.params.team_id,req.params.player_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE SPORT_PLAYER
exports.delete_sport_player = (req, res, next) => {
  const query_string ='DELETE FROM game_player WHERE sport_id = ? and '
      +'player_id = ?'; 
  const payload = [req.params.sport_id,req.params.player_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE GAME_PLAYER
exports.delete_game_player = (req, res, next) => {
  const query_string ='DELETE FROM game_player WHERE game_id = ? and '
      +'player_id = ?'; 
  const payload = [req.params.game_id,req.params.player_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE GAME_SPONSOR
exports.delete_game_sponsor = (req, res, next) => {
  const query_string ='DELETE FROM game_sponsor WHERE game_id = ? and '
      +'sponsor_id = ?'; 
  const payload = [req.params.game_id,req.params.sponsor_id];
  const callback = (err, data) => {
   res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE PARTICIPATES
exports.delete_participates = (req, res, next) => {
  const query_string ='DELETE FROM participates WHERE player_id = ? and '
      +'sport_id = ?'; 
  const payload = [req.params.player_id,req.params.sport_id];
  const callback = (err, data) => {
  res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE REGISTERS
exports.delete_registers = (req, res, next) => {
  const query_string ='DELETE FROM registers WHERE player_id = ? and '
      +'game_id = ?'; 
  const payload = [req.params.player_id,req.params.game_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//DELETE GAME TYPE
exports.delete_game_game_type = (req, res, next) => {
  const query_string ='DELETE FROM game_game_type WHERE game_id = ? and '
      +'game_type = ?'; 
  const payload = [req.params.game_id,req.params.game_type];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};




