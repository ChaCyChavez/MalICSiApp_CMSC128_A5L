use malicsi;

\d //

/* ACCOUNT PROCEDURES */
DROP PROCEDURE IF EXISTS login_account//
  CREATE PROCEDURE login_account(IN _username varchar(256), IN _password varchar(256))
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
        birthday, college, is_game_head, position, is_player, player_jersey_num,
        player_role, is_approved FROM account WHERE username = _username && password = _password;
  END;
//

DROP PROCEDURE IF EXISTS get_account//
  CREATE PROCEDURE get_account(IN _account_id int)
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
        birthday, college, is_game_head, position, is_player, player_jersey_num,
        player_role, is_approved FROM account WHERE account_id = _account_id 
        && is_approved = true;
  END;
//

DROP PROCEDURE IF EXISTS get_all_account//
  CREATE PROCEDURE get_all_account()
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
        birthday, college, is_game_head, position, is_player, player_jersey_num,
        player_role, is_approved FROM account ;
  END;
//

/* ACTIVITY LOG PROCEDURES */
DROP PROCEDURE IF EXISTS get_activity_log//
  CREATE PROCEDURE get_activity_log(IN _account_id int)
  BEGIN
    SELECT * FROM activity_log WHERE account_id = _account_id;
  END;
//

DROP PROCEDURE IF EXISTS get_all_activity_logs//
  CREATE PROCEDURE get_all_activity_logs()
  BEGIN
    SELECT * FROM activity_log;
  END;
//

/* TEAM PROCEDURES */
DROP PROCEDURE IF EXISTS get_team//
  CREATE PROCEDURE get_team(IN _team_id int)
  BEGIN
    SELECT * FROM team WHERE team_id = _team_id;
  END;
//

DROP PROCEDURE IF EXISTS get_team_profile//
  CREATE PROCEDURE get_team_profile(IN teamid int)
  BEGIN
    SELECT * FROM account NATURAL JOIN team_account WHERE team_id = teamid;
  END;
//

DROP PROCEDURE IF EXISTS get_team_match//
  CREATE PROCEDURE get_team_match(IN teamid int)
  BEGIN
    SELECT t.team_name, m.match_date_time, m.series, m.match_id
    FROM team t NATURAL JOIN match_event_team me NATURAL JOIN match_event m
    WHERE match_id in (SELECT m.match_id
      FROM team t NATURAL JOIN match_event_team me NATURAL JOIN match_event m
      WHERE m.match_id = me.match_id && t.team_id = teamid) && t.team_id != teamid;
  END;
//

DROP PROCEDURE IF EXISTS get_all_team//
  CREATE PROCEDURE get_all_team()
  BEGIN
    SELECT * FROM team;
  END;
//

/* SPONSOR PROCEDURES */
DROP PROCEDURE IF EXISTS get_sponsor_of_game//
  CREATE PROCEDURE get_sponsor_of_game(IN _game_id int)
  BEGIN
    SELECT * FROM sponsor WHERE game_id = _game_id;
  END;
//

DROP PROCEDURE IF EXISTS get_all_sponsor//
  CREATE PROCEDURE get_all_sponsor()
  BEGIN
    SELECT * FROM sponsor;
  END;
//

/* GAME_EVENT PROCEDURES */
DROP PROCEDURE IF EXISTS get_game_event//
  CREATE PROCEDURE get_game_event(IN _game_name varchar(256))
  BEGIN
    SELECT * FROM game_event WHERE game_name = _game_name;
  END;
//

DROP PROCEDURE IF EXISTS get_all_game_event//
  CREATE PROCEDURE get_all_game_event()
  BEGIN
    SELECT * FROM game_event;
  END;
//

/* SPORT PROCEDURES */
DROP PROCEDURE IF EXISTS get_sport//
  CREATE PROCEDURE get_sport(IN _game_id int)
  BEGIN
    SELECT * FROM sport WHERE game_id = _game_id;
  END;
//

DROP PROCEDURE IF EXISTS get_all_sport//
  CREATE PROCEDURE get_all_sport()
  BEGIN
    SELECT * FROM sport;
  END;
//


DROP PROCEDURE IF EXISTS get_sport_game;
\d //
  CREATE PROCEDURE get_sport_game(IN gameid int)
  BEGIN
    SELECT sport_id, sport_type, division
    FROM sport s WHERE game_id = gameid;
  END;
//

DROP PROCEDURE IF EXISTS get_sport_team;
//
  CREATE PROCEDURE get_sport_team(IN sportid int)
  BEGIN
    SELECT t.team_id, t.team_name, mt.match_id, m.match_date_time, c.court_name
    FROM team t NATURAL JOIN match_event_team mt
    NATURAL JOIN match_event m
    NATURAL JOIN court c
    NATURAL JOIN sport s
    WHERE s.sport_id = sportid;
  END;
//

/* MATCH_EVENT PROCEDURES */
DROP PROCEDURE IF EXISTS get_match_event//
  CREATE PROCEDURE get_match_event(IN matchid int)
  BEGIN
    SELECT * FROM match_event WHERE match_id = matchid;
  END;
//

DROP PROCEDURE IF EXISTS get_all_match_event//
  CREATE PROCEDURE get_all_match_event()
  BEGIN
    SELECT * FROM match_event;
  END;
//

/* COURT PROCEDURES */
DROP PROCEDURE IF EXISTS get_court//
  CREATE PROCEDURE get_court(IN _court_id int)
  BEGIN
    SELECT * FROM court WHERE court_id = _court_id;
  END;
//

DROP PROCEDURE IF EXISTS get_all_court//
  CREATE PROCEDURE get_all_court()
  BEGIN
    SELECT * FROM court;
  END;
//

/* PROCEDURE TO GET TEAMS THAT REGISTERED IN A GAME */
DROP PROCEDURE IF EXISTS get_teams_of_game//
  CREATE PROCEDURE get_teams_of_game(IN _game_id int)
  BEGIN
    SELECT * FROM team NATURAL JOIN game_event_team
        WHERE game_event_team.game_id = _game_id
        && game_event_team.team_id = team.team_id;
  END;
//

/*PROCEDURE TO GET PLAYERS THAT JOINED A TEAM*/
DROP PROCEDURE IF EXISTS get_players_of_team//
  CREATE PROCEDURE get_players_of_team(IN _team_id int)
  BEGIN
    SELECT account.account_id, firstname, middlename, lastname, email, username, course,
        birthday, college, is_game_head, position, is_player, player_jersey_num,
        player_role, team_id FROM account NATURAL JOIN team_account WHERE team_id =
        _team_id && account.account_id = team_account.account_id;
  END;
//

/*PROCEDURE TO GET TEAMS THAT PARTICIPATED IN A MATCH EVENT*/
DROP PROCEDURE IF EXISTS get_teams_of_match//
  CREATE PROCEDURE get_teams_of_match(IN _match_id int)
  BEGIN
    SELECT * FROM team NATURAL JOIN match_event_team
        WHERE match_event_team.match_id = _match_id
        && team.team_id = match_event_team.team_id;
  END;
//


DROP PROCEDURE IF EXISTS get_user_upcoming_events//
  CREATE PROCEDURE get_user_upcoming_events(IN _account_id int)
  BEGIN
    SELECT * FROM game_event NATURAL JOIN team_account NATURAL JOIN
        game_event_team WHERE team_account.account_id = _account_id
        && team_account.team_id=game_event_team.team_id &&
        game_event_team.game_id=game_event.game_id &&
        game_starting_time_date > NOW();
  END;
//

DROP PROCEDURE IF EXISTS get_user_past_events//
  CREATE PROCEDURE get_user_past_events(IN _account_id int)
  BEGIN
    SELECT * FROM game_event NATURAL JOIN team_account NATURAL JOIN
        game_event_team WHERE team_account.account_id = _account_id
        && team_account.team_id=game_event_team.team_id &&
        game_event_team.game_id=game_event.game_id &&
        game_ending_time_date <= NOW();
  END;
//

DROP PROCEDURE IF EXISTS get_current_events//
  CREATE PROCEDURE get_current_events()
  BEGIN
    SELECT * FROM game_event WHERE game_ending_time_date >= NOW() && 
        game_starting_time_date <= NOW();
  END;
//

DROP PROCEDURE IF EXISTS get_upcoming_events//
  CREATE PROCEDURE get_upcoming_events()
  BEGIN
    SELECT * FROM game_event WHERE game_starting_time_date > NOW();
  END;
//

DROP PROCEDURE IF EXISTS get_court_of_match//
  CREATE PROCEDURE get_court_of_match(IN _match_id int)
  BEGIN
    SELECT court_location, court_name FROM match_event NATURAL JOIN court 
        WHERE match_id = _match_id;
  END;
//

DROP PROCEDURE IF EXISTS get_teams_N_scores_of_match//
  CREATE PROCEDURE get_teams_N_scores_of_match(IN _match_id int)
  BEGIN
    SELECT team_name, score FROM team NATURAL JOIN match_event_team 
        WHERE match_id = _match_id;
  END;
//

DROP PROCEDURE IF EXISTS get_pending_account//
  CREATE PROCEDURE get_pending_account()
  BEGIN
  	SELECT * FROM account WHERE is_approved = 0;
  END;
//

DROP PROCEDURE IF EXISTS get_game_per_sport//
  CREATE PROCEDURE get_game_per_sport(IN _sport_id int)
    BEGIN
      SELECT * FROM match_event NATURAL JOIN match_event_team NATURAL JOIN team
         NATURAL JOIN sport WHERE sport_id = _sport_id;
    END;
//

DROP PROCEDURE IF EXISTS get_elimination_matches//
  CREATE PROCEDURE get_elimination_matches(IN _sport_id int)
    BEGIN
      SELECT * FROM match_event_team, match_event, team WHERE 
          match_event_team.match_id = match_event.match_id 
          && match_event_team.team_id = team.team_id && series = "elimination"
          && match_event.sport_id = _sport_id 
          ORDER BY match_event.match_id;
    END;
//

DROP PROCEDURE IF EXISTS get_semis_matches//
  CREATE PROCEDURE get_semis_matches(IN _sport_id int)
    BEGIN
      SELECT * FROM match_event_team, match_event, team WHERE 
          match_event_team.match_id = match_event.match_id 
          && match_event_team.team_id = team.team_id 
          && series = "semi-finals" 
          && match_event.sport_id = _sport_id 
          ORDER BY match_event.match_id;
    END;
//

DROP PROCEDURE IF EXISTS get_finals_matches//
  CREATE PROCEDURE get_finals_matches(IN _sport_id int)
    BEGIN
      SELECT * FROM match_event_team, match_event, team WHERE 
          match_event_team.match_id = match_event.match_id 
          && match_event_team.team_id = team.team_id 
          && series = "finals" 
          && match_event.sport_id = _sport_id 
          ORDER BY match_event.match_id;
    END;
//

DROP PROCEDURE IF EXISTS get_team_of_account//
  CREATE PROCEDURE get_team_of_account (IN _account_id int)
    BEGIN
      SELECT * FROM team_account WHERE account_id = _account_id;
    END;
//


\d ;
