exports.add_court = (req, res, next) => {
    const query_string = 'INSERT into court VALUES (NULL,?,?,?)'; 
    const payload = [req.body.court_name,
      req.body.court_location, req.body.court_type];
    const callback = (err,data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.get_court = (req, res, next) => {
    const query_string = 'SELECT * from court WHERE court_id = ?';  
    const payload = [req.params.court_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.update_court = (req, res, next) => {
    const query_string = 'UPDATE court SET court_name = ?, ' + 
        'court_location = ?, court_type = ? WHERE court_id = ?;';
    const payload = [req.body.court_name, req.body.court_location, 
        req.body.court_type, req.body.court_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.delete_court = (req, res, next) => {
    const query_string ='DELETE FROM court WHERE court_id = ?'; 
    const payload = [req.params.court_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};