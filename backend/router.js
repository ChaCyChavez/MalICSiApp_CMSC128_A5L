'use strict';

const update = require(__dirname + '/controller/update');
const create = require(__dirname + '/controller/create');
const retrieve = require(__dirname + '/controller/retrieve');
var path = require('path');

module.exports = (router) => {
    //update routers
    router.post('/api/update-account', update.update_account);
    router.post('/api/update-game', update.update_game);
    router.post('/api/update-team', update.update_team);
    router.post('/api/update-player', update.update_player);
    router.post('/api/update-court', update.update_court);
    router.post('/api/update-sport', update.update_sport);
    router.post('/api/update-sponsor', update.update_sponsor);
    router.post('/api/update-score', update.update_score);
    router.post('/api/update-game-type', update.update_game_type);
    //create routers
    router.post('/api/add-account', create.add_account);
    router.post('/api/add-court', create.add_court);
    router.post('/api/add-game', create.add_game);
    router.post('/api/add-game-type', create.add_game_type);
    router.post('/api/add-log', create.add_log);
    router.post('/api/add-participates', create.add_participates);
    router.post('/api/add-player', create.add_player);
    router.post('/api/add-registers', create.add_registers);
    router.post('/api/add-score', create.add_score);
    router.post('/api/add-sponsor', create.add_sponsor);
    router.post('/api/add-sport', create.add_sport);
    router.post('/api/add-sport-player', create.add_sport_player);
    router.post('/api/add-team', create.add_team);
    router.post('/api/add-team-player', create.add_team_player);
    //retrieve routers
    router.get('/api/get-account', retrieve.get_account);
    router.get('/api/get-all-game', retrieve.get_all_game);
    router.get('/api/get-current-game', retrieve.get_current_game);
    router.get('/api/get-player/:player_id', retrieve.get_player);
    router.get('/api/get-winner/:game_id', retrieve.get_winner);
    router.get('/api/get-sponsor/:game_id', retrieve.get_sponsor);
    router.get('/api/get-log', retrieve.get_log);
    router.get('/api/get-bracket/:sport_type', retrieve.get_bracket);
    

    router.all('*', (req, res, next) => {
        res.status(404).send({
            message: 'Not Found!'
        });
    });

    return router;
};