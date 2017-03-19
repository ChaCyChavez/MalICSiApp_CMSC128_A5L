'use strict';

const db = require(__dirname + '/../lib/mariasql');

exports.add_game_event = (req, res, next) => {
    const query_string = 'INSERT into game_event(game_name,' +
        'game_starting_time_date, game_ending_time_date) VALUES (?,?,?)'; 
    const payload = [req.body.game_name,
      req.body.game_starting_time_date, req.body.game_ending_time_date];
    const callback = (err,data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.get_game_event = (req, res, next) => {
    const query_string = 'SELECT * from game_event WHERE game_id = ?';  
    const payload = [req.params.game_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.update_game_event = (req, res, next) => {
    const query_string = 'UPDATE game_event SET game_name = ?, ' + 
            'game_starting_time_date = ?, game_ending_time_date = ?' +
            ' WHERE game_id = ?';
    const payload = [req.body.game_name, req.body.game_starting_time_date, 
        req.body.game_ending_time_date, req.body.game_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};

exports.delete_game_event = (req, res, next) => {
    const query_string ='DELETE FROM game_event WHERE game_id = ?'; 
    const payload = [req.params.game_id];
    const callback = (err, data) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send(data);
        }
    };

    db.query(query_string, payload, callback);
};