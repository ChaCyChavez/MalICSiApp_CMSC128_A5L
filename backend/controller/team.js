'use strict';

const db = require(__dirname + '/../lib/mariasql');

exports.add_team = (req,res,next) => {
	const query_string = 'INSERT into team VALUES (?,?,?,?)'; 
	const payload = [req.body.team_name, req.body.team_color, 
	req.body.team_coach, req.body.game_id];
	const callback = (err,data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
	};

  db.query(query_string, payload, callback);
};

exports.get_team = (req, res, next) => {
	const query_string = "SELECT * from team where team_id = ?";  
	const payload = [req.params.team_id];
	const callback = (err, data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
	};

  	db.query(query_string, payload, callback);
};

exports.update_team = (req, res, next) => {
	const query_string = 'UPDATE team set team_name = ?, team_color = ?, ' + 
							'team_coach = ?, game_id = ? WHERE team_id = ?;';
	const payload = [req.body.team_name, req.body.team_color, req.body.team_coach, 
					req.body.game_id, req.body.team_id];
    const callback = (err, data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.delete_team = (req, res, next) => {
	const query_string ='DELETE FROM team WHERE team_id = ?'; 
	const payload = [req.params.team_id];
	const callback = (err, data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
	};

  	db.query(query_string, payload, callback);
};
