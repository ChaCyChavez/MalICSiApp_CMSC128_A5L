'use strict';

const db = require(__dirname + '/../lib/mariasql');

exports.add_sport = (req,res,next) => {
  const query_string = 'INSERT into sport(sport_type,division,game_id) VALUES (?,?,?)'; 
  const payload = [req.body.sport_type, req.body.division,req.body.game_id];
  const callback = (err,data) => {
	if(err){
		res.status(500).send(err);
	}else{
		res.status(200).send(data);
	}
  };

  db.query(query_string, payload, callback);
};

exports.get_sport = (req, res, next) => {
  const query_string = "SELECT * from sport where sport_id = ?";  
  const payload = [req.params.sport_id];
  const callback = (err, data) => {
	if(err){
		res.status(500).send(err);
	}else{
		res.status(200).send(data);
	}
  };

  db.query(query_string, payload, callback);
};

exports.update_sport = (req, res, next) => {
	const query_string = 'UPDATE sport set sport_type = ?,division = ? WHERE sport_id = ?;';
	const payload = [req.body.sport_type,req.body.division,req.body.sport_id];
    const callback = (err, data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.delete_sport = (req, res, next) => {
  const query_string ='DELETE FROM sport WHERE sport_id = ?'; 
  const payload = [req.params.sport_id];
  const callback = (err, data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
  };

  db.query(query_string, payload, callback);
};