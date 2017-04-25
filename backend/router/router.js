 'use strict';
/* old controllers
const update = require(__dirname + '/../controller/old-controllers/update');
const create = require(__dirname + '/../controller/old-controller/create');
const retrieve = require(__dirname + '/../controller/old-controller/retrieve');
const del = require(__dirname + '/../controller/old-controller/delete');
*/
const account = require(__dirname + '/../controller/account');
const game_event = require(__dirname + '/../controller/game_event');
const log = require(__dirname + '/../controller/log');
const match_event = require(__dirname + '/../controller/match_event');
const sponsor = require(__dirname + '/../controller/sponsor');
const sport = require(__dirname + '/../controller/sport');
const team = require(__dirname + '/../controller/team');
const result = require(__dirname +'/../controller/result');
const game_per_sport = require(__dirname + '/../controller/game_per_sport')
let path = require('path');

module.exports = (router) => {

//account routers
    //login_account
    router.post('/api/login-account/', account.login_account);
    //logou_account
    router.post('/api/logout-account/', account.logout);
    //create account
    router.post('/api/add-account', account.add_account);
    //retrieve account
    router.get('/api/get-account/:account_id?', account.get_account);
    //retrieve all accounts
    router.get('/api/get-all-account/', account.get_all_account);
    //retrieve pending
    router.get('/api/get-pending-account/', account.get_pending_account);
    //update account
    router.post('/api/update-account', account.update_account);
    //delete account
    router.post('/api/delete-account', account.delete_account);
    //approve
    router.post('/api/approve-account', account.approve_account);

//game_event routers
    //create game_event
    router.post('/api/add-game-event', game_event.add_game_event);
	router.get('/api/get-game-event/:game_id', game_event.get_game_event);
    //retrieve game_event
    router.get('/api/search-game-event/:game_name', game_event.search_game_event);
    //update game_event
    router.post('/api/update-game-event', game_event.update_game_event);
    //delete game_event
    router.post('/api/delete-game-event', game_event.delete_game_event);
    router.get('/api/get-user-upcoming-events/:account_id?', game_event.get_user_upcoming_events);
    router.get('/api/get-user-past-events/:account_id?', game_event.get_user_past_events);
	router.get('/api/get-upcoming-events/', game_event.get_upcoming_events);
    router.get('/api/get-current-events/', game_event.get_current_events);
    router.get('/api/get-events/', game_event.get_events);
    router.get('/api/get-game-teams/:game_id', game_event.get_game_teams);

    router.post('/api/join-account-to-team', game_event.join_account_to_team);
    router.get('/api/get-team-of-account/:account_id/:game_id', game_event.get_team_of_account);

//log routers
    //retrieve log
    router.get('/api/get-log/', log.get_log);
    //retrieve log
    router.get('/api/get-all-logs/', log.get_all_logs);
    //update log
    router.post('/api/update-log', log.update_log);
    //delete log
    router.post('/api/delete-log/:log_id', log.delete_log);

//match_event routers
    //create match_event
    router.post('/api/add-match-event', match_event.add_match_event);
    //retrieve match_event
    router.get('/api/get-match-event/:match_id', match_event.get_match_event);
    //update match_event
    router.post('/api/update-match-event', match_event.update_match_event);
    //delete match_event
    router.post('/api/delete-match-event', match_event.delete_match_event);
    // retrieve teams and their scores in match event
    router.get('/api/get-teams-N-scores-of-match/:match_id', match_event.get_teams_N_scores_of_match);
    router.post('/api/update-match-score', match_event.update_match_score);

// match_event_team router
    router.post('/api/add-match-event-team', match_event.add_match_event_team);

//sponsor routers
    //create sponsor
    router.post('/api/add-sponsor', sponsor.add_sponsor);
    //retrieve sponsor
    router.get('/api/get-sponsor/:game_id', sponsor.get_sponsor);
    //update sponsor
    router.post('/api/update-sponsor', sponsor.update_sponsor);
    //delete sponsor
    router.post('/api/delete-sponsor', sponsor.delete_sponsor);

//sport routers
    //create sport
    router.post('/api/add-sport', sport.add_sport);
    //retrieve sport
    router.get('/api/get-sport/:sport_id', sport.get_sport);
    //retrieve sport
    router.get('/api/get-all-sport/', sport.get_all_sport);
    //update sport
    router.post('/api/update-sport', sport.update_sport);
    //delete sport
    router.post('/api/delete-sport/', sport.delete_sport);
    //get sports in a game
    router.get('/api/get-sport-game/:game_id', sport.get_sport_game);
    //get teams in a sport
    router.get('/api/get-sport-team/:sport_id', sport.get_sport_team);
    //check for duplicate sport
    router.get('/api/get-a-sport/:game_id/:sport_type/:division', sport.get_a_sport);

//team routers
    //create team
    router.post('/api/add-team', team.add_team);
    //retrieve team
    router.get('/api/get-team-name/:team_id', team.get_team_name);
    //retrieve team_profile
    router.get('/api/get-team-profile/:team_id', team.get_team_profile);
    //retrieve team_match
    router.get('/api/get-team-match/:team_id', team.get_team_match);
    //update team
    router.post('/api/update-team', team.update_team);
    //delete team
    router.post('/api/delete-team/:team_id', team.delete_team);

// result router
    // get all elimination matches
    router.get('/api/get-elimination-matches/:sport_id', result.get_elimination_matches);
    router.get('/api/get-semis-matches/:sport_id', result.get_semis_matches);
    router.get('/api/get-finals-matches/:sport_id', result.get_finals_matches);

// game per sport router
    // get games per sport
    router.get('/api/get-game-per-sport/:game_id', game_per_sport.get_game_per_sport);
    router.all('*', (req, res, next) => {
        res.status(404).send({
            'message': 'Not Found!'
        });
    });

    return router;
};
