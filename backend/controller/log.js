exports.add_log = (req,res,next) => {
	const query_string = 'INSERT into log VALUES (?,?)'; 
	const payload = [req.body.log_description, req.body.account_id];
	const callback = (err,data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
	};

  	db.query(query_string, payload, callback);
};

exports.get_log = (req, res, next) => {
	const query_string = "SELECT * from log where account_id = ?";  
	const payload = [req.params.account_id];
	const callback = (err, data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
	};

  	db.query(query_string, payload, callback);
};

exports.update_log = (req, res, next) => {
	const query_string = 'UPDATE log set log_description = ?, account_id = ?' +
						'WHERE log_id = ?;';
	const payload = [req.body.team_name, req.body.log_description, 
			req.body.account_id, req.log_id];
    const callback = (err, data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
	};

	db.query(query_string, payload, callback);
};

exports.delete_log = (req, res, next) => {
	const query_string ='DELETE FROM log WHERE log_id = ?'; 
	const payload = [req.params.log_id];
	const callback = (err, data) => {
		if(err){
			res.status(500).send(err);
		}else{
			res.status(200).send(data);
		}
	}

  	db.query(query_string, payload, callback);
};
