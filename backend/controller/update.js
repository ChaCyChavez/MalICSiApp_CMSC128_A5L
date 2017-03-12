'use strict';

const db = require(__dirname + '/../lib/mariasql');

exports.update_account = (req, res, next) => {
	const query_string = 'UPDATE account set email = ?, username = ?, password = ?, firstname = ?, middlename = ?, lastname = ?, course = ?, birthday = ?, college = ?, status = ? WHERE account id = ?;';
	const payload = [req.body.email, req.body.username, req.body.password, req.body.firstname, req.body.middlename, req.body.lastname, req.body.course, req.body.birthday, req.body.college, req.body.status, req.body.account_id];
    const callback = (err, data) => {
		res.send(data);
	};

	db.query(query_string, payload, callback);
};

exports.update_game = (req, res, next) => {
	const query_string = 'UPDATE game set game_name = ?, game_place = ?, game_starting_time_date = ?, game_ending_time_date = ? WHERE game_id = ?;';
	const payload = [req.body.game_name, req.body.game_place, req.body.game_starting_time_date, req.body.game_ending_time_date, req.body.account_id];
    const callback = (err, data) => {
		res.send(data);
	};

	db.query(query_string, payload, callback);
};


exports.update_team = (req, res, next) => {
	const query_string = 'UPDATE team set team_name = ?, team_color = ?, team_coach = ? WHERE team_id = ?;';
	const payload = [req.body.team_name, req.body.team_color, req.body.team_coach, req.body.team_id];
    const callback = (err, data) => {
		res.send(data);
	};

	db.query(query_string, payload, callback);
};



exports.update_player = (req, res, next) => {
	const query_string = 'UPDATE player set player_jersey_number = ?, is_coach = ?, game_id = ? WHERE player_id = ?;';
	const payload = [req.body.player_jersey_number, req.body.is_coach, req.body.game_id, req.body.player_id];
    const callback = (err, data) => {
		res.send(data);
	};

	db.query(query_string, payload, callback);
};

exports.update_court = (req, res, next) => {
	const query_string = 'UPDATE court set court_name = ?, court_location = ?, court_type = ? WHERE court_id = ?;';
	const payload = [req.body.court_name, req.body.court_location, req.body.court_type, req.body.court_id];
    const callback = (err, data) => {
		res.send(data);
	};

	db.query(query_string, payload, callback);
};

exports.update_sport = (req, res, next) => {
	const query_string = 'UPDATE sport set sport_type_name = ?, number_of_participants = ?, date_time = ?, division = ?, court_id = ? WHERE sport_id = ?;';
	const payload = [req.body.sport_type_name, req.body_number_of_participants, req.body.date_time, req.body.division, req.body.court_id, req.body.sport_id];
    const callback = (err, data) => {
		res.send(data);
	};

	db.query(query_string, payload, callback);
};

exports.update_sponsor = (req, res, next) => {
	const query_string = 'UPDATE sponsor set sponsor_name = ?, sponsor_affiliation = ?, sponsor_logo = ? WHERE sponsor_id = ?;';
	const payload = [req.body.sponsor_name, req.body.sponsor_affiliation, req.body.sponsor_logo, req.body.sponsor_id];
    const callback = (err, data) => {
		res.send(data);
	};

	db.query(query_string, payload, callback);
};

exports.update_score = (req, res, next) => {
	const query_string = 'UPDATE score set series = ?, winning_team = ?, losing_team = ? WHERE score_id = ?;';
	const payload = [req.body.series, req.body.winning_team, req.body.losing_team, req.body.score_id];
    const callback = (err, data) => {
		res.send(data);
	};

	db.query(query_string, payload, callback);
};

exports.update_game_type = (req, res, next) => {
	const query_string = 'UPDATE game_game_typeset game_type = ? WHERE game_id = ? AND game_type = ?;';
	const payload = [req.body.game_type, req.body.game_id, req.body.game_type];
    const callback = (err, data) => {
		res.send(data);
	};

	db.query(query_string, payload, callback);
};