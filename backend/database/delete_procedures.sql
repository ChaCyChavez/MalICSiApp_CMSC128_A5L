use malicsi;


/* delete account */
drop procedure if exists delete_account;
DELIMITER //
  CREATE PROCEDURE delete_account(IN del_id int)
  BEGIN
    DELETE FROM account WHERE account_id = del_id;
  END;
//
DELIMITER ;

drop procedure if exists delete_all_account;
DELIMITER //
  CREATE PROCEDURE delete_all_account()
  BEGIN
    DELETE FROM account;
  END;
//
DELIMITER ;

drop procedure if exists delete_team_account;
DELIMITER //
  CREATE PROCEDURE delete_team_account(IN del_id int)
  BEGIN
    DELETE FROM account WHERE account_id IN (SELECT account_id FROM team_account WHERE team_id = del_id);
  END;
//
DELIMITER ;

/* delete court */
drop procedure if exists delete_court;
DELIMITER //
  CREATE PROCEDURE delete_court(IN del_id int)
  BEGIN
    DELETE FROM court WHERE court_id = del_id;
  END;
//
DELIMITER ;

drop procedure if exists delete_all_court;
DELIMITER //
  CREATE PROCEDURE delete_all_court()
  BEGIN
    DELETE FROM court;
  END;
//
DELIMITER ;

/* delete team */
drop procedure if exists delete_team;
DELIMITER //
  CREATE PROCEDURE delete_team(IN del_id int)
  BEGIN
    DELETE FROM team WHERE team_id = del_id;
  END;
//
DELIMITER ;

drop procedure if exists delete_all_team;
DELIMITER //
  CREATE PROCEDURE delete_all_team()
  BEGIN
    Delete FROM team;
  END;
//
DELIMITER ;

drop procedure if exists delete_game_event_team;
DELIMITER //
  CREATE PROCEDURE delete_game_event_team(IN del_id int)
  BEGIN
    DELETE FROM team WHERE team_id IN (SELECT team_id FROM game_event_team WHERE game_id = del_id);
  END;
//
DELIMITER ;


drop procedure if exists delete_match_event_team;
DELIMITER //
  CREATE PROCEDURE delete_match_event_team(IN del_id int)
  BEGIN
    DELETE FROM team WHERE team_id IN (SELECT team_id FROM match_event_team WHERE match_id = del_id);
  END;
//
DELIMITER ;

/* delete game event */
drop procedure if exists delete_game_event;
DELIMITER //
  CREATE PROCEDURE delete_game_event(IN del_id int)
  BEGIN
    DELETE FROM game_event WHERE game_id = del_id;
  END;
//
DELIMITER ;

drop procedure if exists delete_all_game_event;
DELIMITER //
  CREATE PROCEDURE delete_all_game_event()
  BEGIN
    Delete FROM game_event;
  END;
//
DELIMITER ;


/* delete log */
drop procedure if exists delete_log;
DELIMITER //
  CREATE PROCEDURE delete_log(IN del_id int)
  BEGIN
    DELETE FROM log WHERE log_id = del_id;
  END;
//
DELIMITER ;


drop procedure if exists delete_all_log;
DELIMITER //
  CREATE PROCEDURE delete_all_log()
  BEGIN
    Delete FROM log;
  END;
//
DELIMITER ;


/* delete sponsor */
drop procedure if exists delete_sponsor;
DELIMITER //
  CREATE PROCEDURE delete_sponsor(IN del_id int)
  BEGIN
    DELETE FROM sponsor WHERE sponsor_id = del_id;
  END;
//
DELIMITER ;


drop procedure if exists delete_all_sponsor;
DELIMITER //
  CREATE PROCEDURE delete_all_sponsor()
  BEGIN
    Delete FROM sponsor;
  END;
//
DELIMITER ;


drop procedure if exists delete_game_event_sponsor;
DELIMITER //
  CREATE PROCEDURE delete_game_event_sponsor(IN del_id int)
  BEGIN
    DELETE FROM sponsor WHERE sponsor_id IN (SELECT sponsor_id FROM game_event_sponsor WHERE game_event_sponsor.game_id = del_id);
  END;
//
DELIMITER ;


/* delete sport */
drop procedure if exists delete_sport;
DELIMITER //
  CREATE PROCEDURE delete_sport(IN del_id int)
  BEGIN
    DELETE FROM sport WHERE sport_id = del_id;
  END;
//
DELIMITER ;


drop procedure if exists delete_all_sport;
DELIMITER //
  CREATE PROCEDURE delete_all_sport()
  BEGIN
    Delete FROM sport;
  END;
//
DELIMITER ;


/* delete match event */
drop procedure if exists delete_match_event;
DELIMITER //
  CREATE PROCEDURE delete_match_event(IN del_id int)
  BEGIN
    DELETE FROM match_event WHERE match_id = del_id;
  END;
//
DELIMITER ;


drop procedure if exists delete_all_match_event;
DELIMITER //
  CREATE PROCEDURE delete_all_match_event()
  BEGIN
    Delete FROM match_event;
  END;
//
DELIMITER ;

