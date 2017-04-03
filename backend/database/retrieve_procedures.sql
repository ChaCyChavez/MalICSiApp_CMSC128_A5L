use malicsi;


/* LOGGING IN AN ACCOUNT */
\d //
drop procedure if exists login_account//
  CREATE PROCEDURE login_account(IN username varchar(256), IN pw varchar(256))
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
    birthday, college FROM account where username = username and password = pw and is_approved = true;
  END;
//

/* RETRIEVING AN ACCOUNT */
drop procedure if exists get_game_head_account//
  CREATE PROCEDURE get_game_head_account(IN acctid int)
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
    birthday, college FROM account where account_id = acctid and is_game_head = true;
  END;
//

drop procedure if exists get_account//
  CREATE PROCEDURE get_account(IN acctid int)
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
    birthday, college, is_approved, is_game_head, position, is_player, player_jersey_num, player_role FROM account where account_id = acctid and is_approved = true;
  END;
//

drop procedure if exists get_all_account//
  CREATE PROCEDURE get_all_account()
  BEGIN
      SELECT account_id, firstname, middlename, lastname, email, username, course,
      birthday, college, is_approved, is_game_head, position, is_player, 
      player_jersey_num, player_role, is_approved FROM account;
  END;
//

drop procedure if exists get_all_game_head_account//
  CREATE PROCEDURE get_all_game_head_account()
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
    birthday, college FROM account where is_game_head = true;
  END;
//

drop procedure if exists get_player_account//
  CREATE PROCEDURE get_player_account(IN acctid int)
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
    birthday, college FROM account where account_id = acctid and is_player = true;
  END;
//

drop procedure if exists get_all_player_account//
  CREATE PROCEDURE get_all_player_account()
  BEGIN
    SELECT account_id, firstname, middlename, lastname, email, username, course,
    birthday, college FROM account where is_player = true;
  END;
//

drop procedure if exists get_court//
  CREATE PROCEDURE get_court(IN courtid int)
  BEGIN
    SELECT * from court where court_id = courtid;
  END;
//

drop procedure if exists get_all_court//
  CREATE PROCEDURE get_all_court()
  BEGIN
    SELECT * from court;
  END;
//

drop procedure if exists get_team//
  CREATE PROCEDURE get_team(IN teamid int)
  BEGIN
    SELECT * from team where team_id = teamid;
  END;
//

drop procedure if exists get_all_team//
  CREATE PROCEDURE get_all_team()
  BEGIN
    SELECT * from team;
  END;
//


drop procedure if exists get_game_event//
  CREATE PROCEDURE get_game_event(IN gameid int)
  BEGIN
    SELECT * from game_event where game_id = gameid;
  END;
//

drop procedure if exists get_all_game_event//
  CREATE PROCEDURE get_all_game_event()
  BEGIN
    SELECT * from game_event;
  END;
//

drop procedure if exists get_activity_log//
  CREATE PROCEDURE get_activity_log(IN logid int)
  BEGIN
    SELECT * from activity_log where log_id = logid;
  END;
//

drop procedure if exists get_all_activity_log//
  CREATE PROCEDURE get_all_activity_log()
  BEGIN
    SELECT * from activity_log;
  END;
//

drop procedure if exists get_sponsor//
  CREATE PROCEDURE get_sponsor(IN sponsorid int)
  BEGIN
    SELECT * from sponsor where sponsor_id = sponsorid;
  END;
//

drop procedure if exists get_all_sponsor//
  CREATE PROCEDURE get_all_sponsor()
  BEGIN
    SELECT * from sponsor;
  END;
//

drop procedure if exists get_sport//
  CREATE PROCEDURE get_sport(IN sportid int)
  BEGIN
    SELECT * from sport where sport_id = sportid;
  END;
//

drop procedure if exists get_all_sport//
  CREATE PROCEDURE get_all_sport()
  BEGIN
    SELECT * from sport;
  END;
//

drop procedure if exists get_match_event//
  CREATE PROCEDURE get_match_event(IN matchid int)
  BEGIN
    SELECT * from match_event where match_id = matchid;
  END;
//

drop procedure if exists get_all_match_event//
  CREATE PROCEDURE get_all_match_event()
  BEGIN
    SELECT * from match_event;
  END;
//

/*GETS THE SPONSORS FOR A GAME EVENT*/
drop procedure if exists get_game_event_sponsor//
  CREATE PROCEDURE get_game_event_sponsor(IN gameid int)
  BEGIN
    SELECT * from sponsor natural join game_event_sponsor where game_event_sponsor.game_id = gameid;
  END;
//

/*PROCEDURE TO GET THE TEAMS FOR A GAME EVENT*/
drop procedure if exists get_game_event_team//
  CREATE PROCEDURE get_game_event_team(IN gameid int)
  BEGIN
    select * from team, game_event_team where game_event_team.game_id = gameid
    and game_event_team.team_id = team.team_id;
  END;
//

/*PROCEDURE TO GET ACCOUNTS OF A TEAM*/
drop procedure if exists get_team_account//
  CREATE PROCEDURE get_team_account(IN teamid int)
  BEGIN
    SELECT account.account_id, firstname, middlename, lastname, email, username, course,
    birthday, college from account, team_account where team_account.team_id =
    teamid and account.account_id = team_account.account_id;
  END;
//

/*PROCEDURE TO GET TEAMS OF A MATCH EVENT*/
drop procedure if exists get_match_event_team//
  CREATE PROCEDURE get_match_event_team(IN matchid int)
  BEGIN
    SELECT * from team, match_event_team where match_event_team.match_id
    = matchid and team.team_id = match_event_team.team_id;
  END;
//

drop procedure if exists get_user_upcoming_events//
  CREATE PROCEDURE get_user_upcoming_events(IN _account_id int)
  BEGIN
    SELECT * from game_event where account_id = _account_id and game_starting_time_date > NOW();
  END;
//

drop procedure if exists get_user_past_events//
  CREATE PROCEDURE get_user_past_events(IN _account_id int)
  BEGIN
    SELECT * from game_event where account_id = _account_id and game_ending_time_date <= NOW();
  END;
//
\d ;