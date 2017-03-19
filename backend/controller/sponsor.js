exports.add_sponsor = (req,res,next) => {
    const query_string = 'INSERT into sponsor VALUES (NULL,?,?,?)'; 
    const payload = [req.body.sponsor_name,
      req.body.sponsor_logo, req.body.sponsor_affiliation];
    const callback = (err,data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.get_sponsor = (req, res, next) => {
    const query_string = "SELECT * from sponsor where sponsor_id = ?";  
    const payload = [req.params.sponsor_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.update_sponsor = (req, res, next) => {
    const query_string = 'UPDATE sponsor SET sponsor_name = ?, sponsor_logo = ?, sponsor_affiliation = ? WHERE sponsor_id = ?;';
    const payload = [req.body.sponsor_name, req.body.sponsor_logo, req.body.sponsor_affiliation, req.body.sponsor_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.delete_sponsor = (req, res, next) => {
    const query_string ='DELETE FROM sponsor WHERE sponsor_id = ?'; 
    const payload = [req.params.sponsor_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};