  'use strict';

const db = require(__dirname +'/../lib/mariasql');

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
//View the User Profile
exports.get_account = (req, res, next) => {
  const query_string = "SELECT account_id, email, is_regular_account, "
      +"is_admin, is_game_head, is_player, username, firstname, middlename, "
      +"lastname, course, birthday, college, status from account where "
      +"account_id = ? ;";  
  const payload = [req.params.account_id];
  const callback = (err, data) => {
    res.send(data);
 };

  db.query(query_string, payload, callback);
};

//View All of the Scheduled Games
exports.get_all_game = (req, res, next) => {
  const query_string = "SELECT * from game, team;"; 
  const payload = [];
  const callback = (err, data) => {
    res.send(data);
 };

  db.query(query_string, payload, callback);
};


//View All of the Current/Live Games
exports.get_current_game = (req, res, next) => {
  const query_string = "SELECT * from game where datediff(now(), "
      +"game_ending_time_date) > 0;";  
  const payload = [];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//View the Competitor Profile
exports.get_player = (req, res, next) => {
  const query_string = "SELECT * from player, account where player_id = ?;";  
  const payload = [req.params.player_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//View winners in a game
exports.get_winner = (req, res, next) => {
  const query_string = "SELECT * from game, score where game_id = ?;";  
  const payload = [req.params.player_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//View Sponsoring institution for a game
exports.get_sponsor = (req, res, next) => {
  const query_string = "SELECT * from sponsor where sponsor_id in (SELECT " 
      +"sponsor_id from game_sponsor where game_id = ?);";  
  const payload = [req.params.game_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//View logs of the user
exports.get_log = (req, res, next) => {
  const query_string = "SELECT * from log where account_id = ?";  
  const payload = [req.params.account_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//View the bracket of games given a sport
exports.get_bracket = (req, res, next) => {
  const query_string = "SELECT * from sport, score where sport_type = ? order "
      +"by field('elims', 'semi-finals', 'finals'), series;"; 
  const payload = [req.params.sport_type];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//Search for a specified court
exports.get_court = (req, res, next) => {
  const query_string = "SELECT * from court where court_id = ?";  
  const payload = [req.params.court_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//Search for a specified score
exports.get_score = (req, res, next) => {
  const query_string = "SELECT * from score where score_id = ?";  
  const payload = [req.params.score_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//Search for a specified sponsor using sponsor_id
exports.get_sponsor = (req, res, next) => {
  const query_string = "SELECT * from sponsor where sponsor_id = ?";  
  const payload = [req.params.sponsor_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//Search for a specified sport using sport_id
exports.get_sport = (req, res, next) => {
  const query_string = "SELECT * from sport where sport_id = ?";  
  const payload = [req.params.sport_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};

//Search for a specified team using team_id
exports.get_team = (req, res, next) => {
  const query_string = "SELECT * from team where team_id = ?";  
  const payload = [req.params.team_id];
  const callback = (err, data) => {
    res.send(data);
  };

  db.query(query_string, payload, callback);
};