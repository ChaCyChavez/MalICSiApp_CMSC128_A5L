exports.add_score = (req, res, next) => {
    const query_string = 'INSERT into score VALUES (NULL,?,?,?,?)'; 
    const payload = [req.body.score_value,
      req.body.series, req.body.match_id, req.body.team_id];
    const callback = (err,data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.get_score = (req, res, next) => {
    const query_string = 'SELECT * from score WHERE score_id = ?';  
    const payload = [req.params.score_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.update_score = (req, res, next) => {
    const query_string = 'UPDATE score SET score_value = ?, ' + 
        'series = ?, match_id = ?, team_id = ? WHERE score_id = ?;';
    const payload = [req.body.score_value, req.body.series, 
        req.body.match_id, req.body.team_id, req.body.score_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.delete_score = (req, res, next) => {
    const query_string ='DELETE FROM score WHERE score_id = ?'; 
    const payload = [req.params.score_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};