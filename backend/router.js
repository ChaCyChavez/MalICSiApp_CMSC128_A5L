'use strict';

const update = require(__dirname + '/controller/update');
var path = require('path');

module.exports = (router) => {
    router.post('/api/update-account', update.update_account);
    router.post('/api/update-game', update.update_game);
    router.post('/api/update-team', update.update_team);
    router.post('/api/update-player', update.update_player);
    router.post('/api/update-court', update.update_court);
    router.post('/api/update-sport', update.update_sport);
    router.post('/api/update-sponsor', update.update_sponsor);
    router.post('/api/update-score', update.update_score);
    router.post('/api/update-game-type', update.update_game_type);

    router.all('*', (req, res, next) => {
        res.status(404).send({
            message: 'Not Found!'
        });
    });

    return router;
};