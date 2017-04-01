use malicsi;

 
/* LOGGING IN AN ACCOUNT */
drop procedure if exists login_account;
\d //
  CREATE PROCEDURE login_account(IN acctid varchar(100), IN pw varchar(256))
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
    birthday, college FROM account where username = acctid and password = pw and is_approved = true;
  END;
//
\d ;

/* RETRIEVING AN ACCOUNT */
drop procedure if exists get_account;
\d //
  CREATE PROCEDURE get_account(IN usrnme varchar(100))
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
    birthday, college FROM account where username = usrnme;
  END;
//
\d ;

drop procedure if exists get_all_account;
\d //
  CREATE PROCEDURE get_all_account()
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
    birthday, college FROM account;
  END;
//
\d ;

drop procedure if exists get_court;
\d //
  CREATE PROCEDURE get_court(IN courtid int)
  BEGIN
    SELECT * from court where court_id = courtid;
  END;
//
\d ;

drop procedure if exists get_all_court;
\d //
  CREATE PROCEDURE get_all_court()
  BEGIN
    SELECT * from court;
  END;
//
\d ;

drop procedure if exists get_team;
\d //
  CREATE PROCEDURE get_team(IN teamid int)
  BEGIN
    SELECT * from team where team_id = teamid;
  END;
//
\d ;

drop procedure if exists get_all_team;
\d //
  CREATE PROCEDURE get_all_team()
  BEGIN
    SELECT * from team;
  END;
//
\d ;

drop procedure if exists get_game_event;
\d //
  CREATE PROCEDURE get_game_event(IN gameid int)
  BEGIN
    SELECT * from game_event where game_id = gameid;
  END;
//
\d ;

drop procedure if exists get_all_game_event;
\d //
  CREATE PROCEDURE get_all_game_event()
  BEGIN
    SELECT * from game_event;
  END;
//

\d ;

drop procedure if exists get_activity_log;
\d //
  CREATE PROCEDURE get_activity_log(IN _account_id int)
  BEGIN
    SELECT * from activity_log where account_id = _account_id;
  END;
//

\d ;

drop procedure if exists get_all_activity_log;
\d //
  CREATE PROCEDURE get_all_activity_log()
  BEGIN
    SELECT * from activity_log;
  END;
//

\d ;

drop procedure if exists get_sponsor;
\d //
  CREATE PROCEDURE get_sponsor(IN sponsorid int)
  BEGIN
    SELECT * from sponsor where sponsor_id = sponsorid;
  END;
//

\d ;

drop procedure if exists get_all_sponsor;
\d //
  CREATE PROCEDURE get_all_sponsor()
  BEGIN
    SELECT * from sponsor;
  END;
//

\d ;

drop procedure if exists get_sport;
\d //
  CREATE PROCEDURE get_sport(IN sportid int)
  BEGIN
    SELECT * from sport where sport_id = sportid;
  END;
//

\d ;

drop procedure if exists get_all_sport;
\d //
  CREATE PROCEDURE get_all_sport()
  BEGIN
    SELECT * from sport;
  END;
//

\d ;

drop procedure if exists get_sport_game;
\d //
  CREATE PROCEDURE get_sport_game(IN gameid int)
  BEGIN
    select sport_id, sport_type, division
    from sport s where game_id = gameid;
  END;
//

\d ;

drop procedure if exists get_sport_team;
\d //
  CREATE PROCEDURE get_sport_team(IN sportid int)
  BEGIN
    select t.team_name, mt.match_id 
    from team t natural join match_event_team mt
    natural join match_event m
    natural join sport s
    where s.sport_id = sportid;
  END;
//

\d ;

drop procedure if exists get_match_event;
\d //
  CREATE PROCEDURE get_match_event(IN matchid int)
  BEGIN
    SELECT * from match_event where match_id = matchid;
  END;
//

\d ;

drop procedure if exists get_all_match_event;
\d //
  CREATE PROCEDURE get_all_match_event()
  BEGIN
    SELECT * from match_event;
  END;
//

\d ;

/*GETS THE SPONSORS FOR A GAME EVENT*/
-- drop procedure if exists get_game_event_sponsor;
-- \d //
--   CREATE PROCEDURE get_game_event_sponsor(IN gameid int)
--   BEGIN
--     SELECT * from sponsor natural join game_event_sponsor where game_event_sponsor.game_id = gameid;
--   END;
-- //

-- \d ;

/*PROCEDURE TO GET THE TEAMS FOR A GAME EVENT*/
drop procedure if exists get_game_event_team;
\d //
  CREATE PROCEDURE get_game_event_team(IN gameid int)
  BEGIN
    select * from team, game_event_team where game_event_team.game_id = gameid 
    and game_event_team.team_id = team.team_id;
  END;
//

\d ;

/*PROCEDURE TO GET ACCOUNTS OF A TEAM*/
drop procedure if exists get_team_account;
\d //
  CREATE PROCEDURE get_team_account(IN teamid int)
  BEGIN
    SELECT account.account_id, firstname, middlename, lastname, email, username, course,
    birthday, college from account, team_account where team_account.team_id = 
    teamid and account.account_id = team_account.account_id;
  END;
//

\d ;

/*PROCEDURE TO GET TEAMS OF A MATCH EVENT*/
drop procedure if exists get_match_event_team;
\d //
  CREATE PROCEDURE get_match_event_team(IN matchid int)
  BEGIN
    SELECT * from team, match_event_team where match_event_team.match_id
    = matchid and team.team_id = match_event_team.team_id;
  END;
//

\d ;