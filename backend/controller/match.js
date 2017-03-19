exports.add_match_event = (req,res,next) => {
  const query_string = 'INSERT into match_event(status,' +
  		'match_date_time, score1, score2, series,sport_id,' +
  		' team1_id, team2_id, court_id) VALUES (?,?,?,?,?,?,?,?,?)'; 
  const payload = [req.body.status, req.body.match_date_time,
  		req.body.sport_id, req.body.score1, req.body.score2,
  		req.body.series, req.body.sport_id, req.body.team1_id,
  		req.body.team2_id, req.body.court_id];
  const callback = (err,data) => {
	if(err){
		res.status(500).send(err);
	}else{
		res.status(200).send(data);
	}
  };

  db.query(query_string, payload, callback);
};

exports.get_match_event = (req, res, next) => {
  const query_string = "SELECT * from match_event where match_id = ?";  
  const payload = [req.params.match_id];
  const callback = (err, data) => {
	if(err){
		res.status(500).send(err);
	}else{
		res.status(200).send(data);
	}
  };

  db.query(query_string, payload, callback);
};

exports.update_match_event = (req, res, next) => {
	const query_string = 'UPDATE match_event set status = ?,' +
		'match_date_time = ?, score1 = ?, score2 = ?, series = ?,' + 
		' sport_id = ?, team1_id = ?, team2_id = ?, court_id = ? ' +
		'WHERE match_id = ?';
	const payload = [req.body.status, req.body.match_date_time,
  		req.body.sport_id, req.body.score1, req.body.score2,
  		req.body.series, req.body.sport_id, req.body.team1_id,
  		req.body.team2_id, req.body.court_id, req.body.match_id];

    const callback = (err, data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.delete_match_event = (req, res, next) => {
  const query_string ='DELETE FROM match_event WHERE match_id = ?'; 
  const payload = [req.params.match_id];
  const callback = (err, data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
  };

  db.query(query_string, payload, callback);
};