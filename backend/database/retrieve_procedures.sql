/* RETRIEVING AN ACCOUNT */
drop procedure if exists get_account;
DELIMITER //
  CREATE PROCEDURE get_account(IN acctid int)
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
    birthday, college FROM account where account_id = acctid;
  END;
//
DELIMITER ;

drop procedure if exists get_all_account;
DELIMITER //
  CREATE PROCEDURE get_all_account()
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
    birthday, college FROM account;
  END;
//
DELIMITER ;

drop procedure if exists get_court;
DELIMITER //
  CREATE PROCEDURE get_court(IN courtid int)
  BEGIN
    SELECT * from court where court_id = courtid;
  END;
//
DELIMITER ;

drop procedure if exists get_all_account;
DELIMITER //
  CREATE PROCEDURE get_all_court()
  BEGIN
    SELECT * from court;
  END;
//
DELIMITER ;

drop procedure if exists get_team;
DELIMITER //
  CREATE PROCEDURE get_team(IN teamid int)
  BEGIN
    SELECT * from team where team_id = teamid;
  END;
//
DELIMITER ;

drop procedure if exists get_all_team;
DELIMITER //
  CREATE PROCEDURE get_all_team()
  BEGIN
    SELECT * from team;
  END;
//
DELIMITER ;

drop procedure if exists get_game_event;
DELIMITER //
  CREATE PROCEDURE get_game_event(IN gameid int)
  BEGIN
    SELECT * from game_event where game_id = gameid;
  END;
//

drop procedure if exists get_all_game_event;
DELIMITER //
  CREATE PROCEDURE get_all_game_event()
  BEGIN
    SELECT * from game_event;
  END;
//

DELIMITER ;

drop procedure if exists get_log;
DELIMITER //
  CREATE PROCEDURE get_log(IN logid int)
  BEGIN
    SELECT * from log where log_id = logid;
  END;
//

DELIMITER ;

drop procedure if exists get_all_log;
DELIMITER //
  CREATE PROCEDURE get_all_log()
  BEGIN
    SELECT * from log;
  END;
//

DELIMITER ;

drop procedure if exists get_sponsor;
DELIMITER //
  CREATE PROCEDURE get_sponsor(IN sponsorid int)
  BEGIN
    SELECT * from sponsor where sponsor_id = sponsorid;
  END;
//

DELIMITER ;

drop procedure if exists get_all_sport;
DELIMITER //
  CREATE PROCEDURE get_all_sponsor()
  BEGIN
    SELECT * from sponsor;
  END;
//

DELIMITER ;

drop procedure if exists get_sport;
DELIMITER //
  CREATE PROCEDURE get_sport(IN sportid int)
  BEGIN
    SELECT * from sport where sport_id = sportid;
  END;
//

DELIMITER ;

drop procedure if exists get_all_sport;
DELIMITER //
  CREATE PROCEDURE get_all_sport()
  BEGIN
    SELECT * from sport;
  END;
//

DELIMITER ;

drop procedure if exists get_match_event;
DELIMITER //
  CREATE PROCEDURE get_match_event(IN matchid int)
  BEGIN
    SELECT * from match_event where match_id = matchid;
  END;
//

DELIMITER ;

drop procedure if exists get_all_match_event;
DELIMITER //
  CREATE PROCEDURE get_all_match_event()
  BEGIN
    SELECT * from match_event;
  END;
//

DELIMITER ;

/*GETS THE SPONSORS FOR A GAME EVENT*/
drop procedure if exists get_game_event_sponsor;
DELIMITER //
  CREATE PROCEDURE get_game_event_sponsor(IN gameid int)
  BEGIN
    SELECT * from sponsor natural join game_event_sponsor where game_event_sponsor.game_id = gameid;
  END;
//

DELIMITER ;

/*PROCEDURE TO GET THE TEAMS FOR A GAME EVENT*/
drop procedure if exists get_game_event_team;
DELIMITER //
  CREATE PROCEDURE get_game_event_team(IN gameid int)
  BEGIN
    select * from team, game_event_team where game_event_team.game_id = gameid 
    and game_event_team.team_id = team.team_id;
  END;
//

DELIMITER ;

/*PROCEDURE TO GET ACCOUNTS OF A TEAM*/
drop procedure if exists get_team_account;
DELIMITER //
  CREATE PROCEDURE get_team_account(IN teamid int)
  BEGIN
    SELECT account.account_id, firstname, middlename, lastname, email, username, course,
    birthday, college from account, team_account where team_account.team_id = 
    teamid and account.account_id = team_account.account_id;
  END;
//

DELIMITER ;

/*PROCEDURE TO GET TEAMS OF A MATCH EVENT*/
drop procedure if exists get_match_event_team;
DELIMITER //
  CREATE PROCEDURE get_match_event_team(IN matchid int)
  BEGIN
    SELECT * from team, match_event_team where match_event_team.match_id
    = matchid and team.team_id = match_event_team.team_id;
  END;
//

DELIMITER ;