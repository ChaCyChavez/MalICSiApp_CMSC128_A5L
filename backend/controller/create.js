'use strict';

const db = require(__dirname + '/../lib/mariasql');
const winston = require('winston');

/* ROUTERS
router.post('/api/add-account', create.add_account);
router.post('/api/add-account', create.add_court);
router.post('/api/add-account', create.add_game_event);
router.post('/api/add-account', create.add_game_event_sponsor);
router.post('/api/add-account', create.add_log);
router.post('/api/add-account', create.add_match);
router.post('/api/add-account', create.add_sponsor);
router.post('/api/add-account', create.add_sport);
router.post('/api/add-account', create.add_team);
*/

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
      winston.log('info', 'Successfully added!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

exports.add_court = (req, res, next) => {
  const query_string = 'INSERT into court(court_name,court_location,court_type) VALUES (?,?,?)'; 
  const payload = [req.body.court_name,
    req.body.court_location, req.body.court_type];
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
      winston.log('info', 'Successfully added!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

exports.add_game_event = (req, res, next) => {
  const query_string = 'INSERT into game_event(game_name,' +
      'game_starting_time_date, game_ending_time_date) VALUES (?,?,?)'; 
  const payload = [req.body.game_name,
    req.body.game_starting_time_date, req.body.game_ending_time_date];
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
      winston.log('info', 'Successfully added!');
      return res.status(200).send(data);
    }
  };

    db.query(query_string, payload, callback);
};

exports.add_game_event_sponsor = (req, res, next) => {
  const query_string ='INSERT INTO game_event_sponsor VALUES (?,?,?)';
  const payload = [req.body.game_id,req.body.sponsor_id,req.body.sponsor_type];
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
      winston.log('info', 'Successfully added!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

exports.add_log = (req,res,next) => {
  const query_string = 'INSERT into log VALUES (?,?)'; 
  const payload = [req.body.log_description, req.body.account_id];
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
      winston.log('info', 'Successfully added!');
      return res.status(200).send(data);
    }
  };

    db.query(query_string, payload, callback);
};

exports.add_match = (req,res,next) => {
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
    } else if (data == 0) {
      winston.level = 'info';
      winston.log('info', 'Not found!');
      return res.status(404).send(data);
    } else {
      winston.level = 'info';
      winston.log('info', 'Successfully added!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

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
      winston.log('info', 'Successfully added!');
      return res.status(200).send(data);
    }
  };

    db.query(query_string, payload, callback);
};

exports.add_sport = (req,res,next) => {
  const query_string = 'INSERT into sport(sport_type,'+
      'division,game_id) VALUES (?,?,?)'; 
  const payload = [req.body.sport_type, req.body.division,req.body.game_id];
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
      winston.log('info', 'Successfully added!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};

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
      winston.log('info', 'Successfully added!');
      return res.status(200).send(data);
    }
  };

  db.query(query_string, payload, callback);
};