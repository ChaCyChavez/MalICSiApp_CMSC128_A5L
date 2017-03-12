'use strict';

const controller = require(__dirname + '/controller/update');
var path = require('path');

module.exports = (router) => {
    router.post('/api/update-account', controller.update_account);
    router.post('/api/update-game', controller.update_game);
    router.post('/api/update-team', controller.update_team);
    router.post('/api/update-player', controller.update_player);
    router.post('/api/update-court', controller.update_court);
    router.post('/api/update-sport', controller.update_sport);
    router.post('/api/update-sponsor', controller.update_sponsor);
    router.post('/api/update-score', controller.update_score);
    router.post('/api/update-game-type', controller.update_game_type);

    router.all('*', (req, res, next) => {
        res.status(404).send({
            message: 'Not Found!'
        });
    });

    return router;
};