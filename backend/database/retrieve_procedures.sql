use malicsi;

\d //

/* ACCOUNT PROCEDURES */
DROP PROCEDURE IF EXISTS login_account//
  CREATE PROCEDURE login_account(
      IN _username varchar(256),
      IN _password varchar(256)
  )
  BEGIN
    SELECT
        account_id,
        firstname,
        middlename,
        lastname,
        email,
        username,
        course,
        birthday,
        college,
        is_game_head,
        position,
        is_player,
        player_jersey_num,
        player_role,
        is_approved,
        is_admin
    FROM
        account
    WHERE
        username = _username
    AND
        password = _password;
  END;
//

DROP PROCEDURE IF EXISTS get_account//
  CREATE PROCEDURE get_account(
      IN _account_id int
  )
  BEGIN
    SELECT
        account_id,
        firstname,
        middlename,
        lastname,
        email,
        username,
        course,
        birthday,
        college,
        is_game_head,
        position,
        is_player,
        player_jersey_num,
        player_role,
        is_approved,
        is_admin
    FROM
        account
    WHERE
        account_id = _account_id;
  END;
//

DROP PROCEDURE IF EXISTS get_all_account//
  CREATE PROCEDURE get_all_account()
  BEGIN
    SELECT
        account_id,
        firstname,
        middlename,
        lastname,
        email,
        username,
        course,
        birthday,
        college,
        is_game_head,
        position,
        is_player,
        player_jersey_num,
        player_role,
        is_approved,
        is_admin
    FROM
        account;
  END;
//

/* ACTIVITY LOG PROCEDURES */
DROP PROCEDURE IF EXISTS get_activity_log//
  CREATE PROCEDURE get_activity_log(
      IN _account_id int
  )
  BEGIN
    SELECT
        log_id,
        log_description,
        log_date,
        account_id
    FROM
        activity_log
    WHERE
        account_id = _account_id;
  END;
//

DROP PROCEDURE IF EXISTS get_all_activity_logs//
  CREATE PROCEDURE get_all_activity_logs()
  BEGIN
    SELECT
        log_id,
        log_description,
        log_date,
        account_id,
        CONCAT(firstname,CONCAT(CONCAT(" ", middlename), CONCAT(" ", lastname))) as name
    FROM
        activity_log
    NATURAL JOIN
        account;
  END;
//

/* TEAM PROCEDURES */
DROP PROCEDURE IF EXISTS get_team_profile//
  CREATE PROCEDURE get_team_profile(
      IN _team_id int
  )
  BEGIN
    SELECT
        account_id,
        firstname,
        middlename,
        lastname,
        course,
        college
    FROM
        account
    NATURAL JOIN
        team_account
    where
        team_id = _team_id;
  END;
//


DROP PROCEDURE IF EXISTS get_team_match//
  CREATE PROCEDURE get_team_match(
      IN _team_id int
  )
  BEGIN
    SELECT
        t.team_name,
        m.match_date_time,
        m.match_id
    FROM
        team t
    NATURAL JOIN
        match_event_team me
    NATURAL JOIN
        match_event m
    WHERE match_id in (
        SELECT
            m.match_id
        FROM
            team t
        NATURAL JOIN
            match_event_team me
        NATURAL JOIN
            match_event m
      WHERE m.match_id = me.match_id && t.team_id = _team_id) && t.team_id != _team_id;
  END;
//

DROP PROCEDURE IF EXISTS get_match_teams//
  CREATE PROCEDURE get_match_teams(
      IN _sport_id int
  )
  BEGIN
    SELECT
        *
    FROM
        team
    WHERE game_id = (
        SELECT
            game_id
        FROM
            sport
        WHERE
            sport_id = _sport_id
    );
  END;
//

DROP PROCEDURE IF EXISTS get_team_name//
  CREATE PROCEDURE get_team_name(
      IN _team_id int
  )
  BEGIN
    SELECT
        team_name
    FROM
        team
    WHERE
        team_id = _team_id;
  END;
//

/* SPONSOR PROCEDURES */
DROP PROCEDURE IF EXISTS get_sponsor_of_game//
  CREATE PROCEDURE get_sponsor_of_game(
      IN _game_id int
  )
  BEGIN
    SELECT
        sponsor_id,
        sponsor_name,
        sponsor_logo,
        sponsor_type,
        sponsor_desc,
        web_address,
        game_id
    FROM
        sponsor
    WHERE
        game_id = _game_id;
  END;
//

/* GAME_EVENT PROCEDURES */
DROP PROCEDURE IF EXISTS get_game_event//
  CREATE PROCEDURE get_game_event(
      IN _game_id int
  )
  BEGIN
    SELECT
        game_id,
        game_name,
        game_starting_time_date,
        game_ending_time_date,
        account_id
    FROM
        game_event
    WHERE
        game_id = _game_id;
  END;
//

DROP PROCEDURE IF EXISTS search_game_event//
  CREATE PROCEDURE search_game_event(
      IN _game_name varchar(256)
  )
  BEGIN
    SELECT
        game_id,
        game_name,
        game_starting_time_date
        game_ending_time_date,
        account_id
    FROM
        game_event
    WHERE
        game_name
    LIKE
        concat("%", game_name, "%");
  END;
//

DROP PROCEDURE IF EXISTS get_all_game_event//
  CREATE PROCEDURE get_all_game_event()
  BEGIN
    SELECT
        game_id,
        game_name,
        game_starting_time_date,
        game_ending_time_date,
        account_id
    FROM
        game_event;
  END;
//

/* SPORT PROCEDURES */
DROP PROCEDURE IF EXISTS get_sport//
  CREATE PROCEDURE get_sport(IN _sport_id int)
  BEGIN
    SELECT
            sport_id,
            sport_type,
            division,
            game_id,
            account_id,
            game_starting_time_date,
            game_ending_time_date
        FROM
            sport
        NATURAL JOIN
            game_event
        WHERE
            sport_id = _sport_id;
  END;
//

DROP PROCEDURE IF EXISTS get_a_sport//
  CREATE PROCEDURE get_a_sport(
        IN _game_id int,
        IN _sport_type varchar(128),
        IN _division  enum('men','women','mixed')
    )
  BEGIN
    SELECT
        sport_id,
        sport_type,
        division,
        game_id
    FROM
        sport
    WHERE
        game_id = _game_id and
        sport_type = _sport_type and
        division = _division;
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
  CREATE PROCEDURE get_sport_game(
      IN _game_id int
  )
  BEGIN
  SELECT
        sport_id,
        sport_type,
        division,
        game_id
  FROM
        sport s
    WHERE
        game_id = _game_id;
  END;
//

/*
    This will get the matches that a player played in a specific sport.
*/
drop procedure if exists get_sport_team;
//
  CREATE PROCEDURE get_sport_team(
      IN _sport_id int
  )
  BEGIN
    SELECT
        t.team_id,
        t.team_name,
        t.team_color,
        mt.match_id,
        m.match_date_time,
        m.court_name,
        m.court_location,
        m.court_type
    FROM
        team t
    NATURAL JOIN
        match_event_team mt
    NATURAL JOIN
        match_event m
    NATURAL JOIN
        sport s
    WHERE
        s.sport_id = _sport_id;
    END;
//

/* MATCH_EVENT PROCEDURES */
DROP PROCEDURE IF EXISTS get_match_event//
  CREATE PROCEDURE get_match_event(
      IN _match_id int
  )
  BEGIN
    SELECT
        match_id,
        status,
        match_date_time,
        sport_id,
        court_name,
        court_location,
        court_type,
        game_event.account_id
    FROM
        match_event
    NATURAL JOIN
        sport
    NATURAL JOIN
        game_event
    WHERE
        match_id = _match_id;
  END;
//

DROP PROCEDURE IF EXISTS get_all_match_event//
  CREATE PROCEDURE get_all_match_event()
  BEGIN
    SELECT
        match_id,
        status,
        match_date_time,
        series,
        sport_id,
        court_name,
        court_location,
        court_type
    FROM
        match_event;
  END;
//

/* PROCEDURE TO GET TEAMS THAT REGISTERED IN A GAME */
DROP PROCEDURE IF EXISTS get_teams_of_game//
  CREATE PROCEDURE get_teams_of_game(
      IN _game_id int
  )
  BEGIN
    SELECT
        team_id,
        team_name,
        team_color,
        game_id
    FROM
        team
    WHERE
        game_id = _game_id;
  END;
//

/*PROCEDURE TO GET PLAYERS THAT JOINED A TEAM*/
DROP PROCEDURE IF EXISTS get_players_of_team//
  CREATE PROCEDURE get_players_of_team(
      IN _team_id int
  )
  BEGIN
    SELECT
        account_id,
        firstname,
        middlename,
        lastname,
        email,
        username,
        course,
        birthday,
        college,
        is_game_head,
        position,
        is_player,
        player_jersey_num,
        player_role,
        team_id
    FROM
        account
    NATURAL JOIN
        team_account
    WHERE
        team_id = _team_id;
  END;
//

/*PROCEDURE TO GET TEAMS THAT PARTICIPATED IN A MATCH EVENT*/
DROP PROCEDURE IF EXISTS get_teams_of_match//
  CREATE PROCEDURE get_teams_of_match(
      IN _match_id int
  )
  BEGIN
    SELECT
        team_id,
        team_name,
        team_color,
        match_id,
        score
    FROM
        team
    NATURAL JOIN
        match_event_team
    WHERE
        match_event_team.match_id = _match_id;
  END;
//


DROP PROCEDURE IF EXISTS get_user_upcoming_events//
  CREATE PROCEDURE get_user_upcoming_events(
      IN _account_id int
  )
  BEGIN
    SELECT
        game_event.game_id,
        game_name,
        game_starting_time_date,
        game_ending_time_date,
        team_account.account_id
    FROM
        game_event
    JOIN
        team
    JOIN
        team_account
    WHERE
        game_event.game_id = team.game_id
    AND
        team.team_id = team_account.team_id
    AND
        team_account.account_id = _account_id
    AND
        game_starting_time_date > NOW();
  END;
//


DROP PROCEDURE IF EXISTS get_user_ongoing_events//
  CREATE PROCEDURE get_user_ongoing_events(
      IN _account_id int
  )
  BEGIN
    SELECT
        game_event.game_id,
        game_name,
        game_starting_time_date,
        game_ending_time_date,
        team_account.account_id
    FROM
        game_event
    JOIN
        team
    JOIN
        team_account
    WHERE
        game_event.game_id = team.game_id
    AND
        team.team_id = team_account.team_id
    AND
        team_account.account_id = _account_id
    AND
        game_starting_time_date <= NOW()
    AND
        game_ending_time_date >= NOW();
  END;
//


DROP PROCEDURE IF EXISTS get_user_past_events//
  CREATE PROCEDURE get_user_past_events(
      IN _account_id int
  )
  BEGIN
    SELECT
        game_event.game_id,
        game_name,
        game_starting_time_date,
        game_ending_time_date,
        team_account.account_id
    FROM
        game_event
    JOIN
        team
    JOIN
        team_account
    WHERE
        game_event.game_id = team.game_id
    AND
        team.team_id = team_account.team_id
    AND
        team_account.account_id = _account_id
    AND
        game_ending_time_date <= NOW();
  END;
//

DROP PROCEDURE IF EXISTS get_current_events//
  CREATE PROCEDURE get_current_events()
  BEGIN
    SELECT
        game_id,
        game_name,
        game_starting_time_date,
        game_ending_time_date,
        account_id
    FROM
        game_event
    WHERE
        game_ending_time_date >= NOW()
    AND
        game_starting_time_date <= NOW();
  END;
//

DROP PROCEDURE IF EXISTS get_events//
  CREATE PROCEDURE get_events()
  BEGIN
    SELECT
        game_id,
        game_name,
        game_starting_time_date,
        game_ending_time_date,
        account_id
    FROM
        game_event;
  END;
//

DROP PROCEDURE IF EXISTS get_upcoming_events//
  CREATE PROCEDURE get_upcoming_events()
  BEGIN
    SELECT
        game_id,
        game_name,
        game_starting_time_date,
        game_ending_time_date,
        account_id
    FROM
        game_event
    WHERE
        game_starting_time_date > NOW();
  END;
//

DROP PROCEDURE IF EXISTS get_past_events//
  CREATE PROCEDURE get_past_events()
  BEGIN
    SELECT
        game_id,
        game_name,
        game_starting_time_date,
        game_ending_time_date,
        account_id
    FROM
        game_event
    WHERE
        game_ending_time_date < NOW();
  END;
//

DROP PROCEDURE IF EXISTS get_teams_N_scores_of_match//
  CREATE PROCEDURE get_teams_N_scores_of_match(
      IN _match_id int
  )
  BEGIN
    SELECT
        team_id,
        team_name,
        team_color,
        score
    FROM
        team
    NATURAL JOIN
        match_event_team
    WHERE
        match_id = _match_id;
  END;
//

DROP PROCEDURE IF EXISTS get_pending_account//
  CREATE PROCEDURE get_pending_account()
  BEGIN
    SELECT * FROM account WHERE is_approved = 0;
  END;
//

DROP PROCEDURE IF EXISTS get_game_per_sport//
  CREATE PROCEDURE get_game_per_sport(IN _game_id int)
    BEGIN
      SELECT match_id, game_id, game_name, division, match_date_time, court_name, team_name,
      sport_type FROM match_event NATURAL JOIN sport NATURAL JOIN game_event
      NATURAL JOIN match_event_team NATURAL JOIN team WHERE game_id = _game_id order by match_id asc;
    END;
//

DROP PROCEDURE IF EXISTS get_sport_matches//
  CREATE PROCEDURE get_sport_matches(IN _sport_id int)
    BEGIN
      SELECT * FROM match_event_team, match_event, team WHERE
          match_event_team.match_id = match_event.match_id
          && match_event_team.team_id = team.team_id
          && match_event.sport_id = _sport_id
          ORDER BY match_event.match_id;
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
  CREATE PROCEDURE get_team_of_account (IN _account_id int, IN _game_id int)
    BEGIN
      SELECT * FROM team_account NATURAL JOIN team
      WHERE team.game_id = _game_id && team_account.account_id = _account_id;
    END;
//

DROP PROCEDURE IF EXISTS get_participants//
  CREATE PROCEDURE get_participants (IN _game_id int)
    BEGIN
      SELECT 
        account_id,
        firstname, 
        middlename, 
        lastname
      FROM 
        team_account 
      NATURAL JOIN 
        account
      WHERE team_id 
      IN (
          SELECT
            team_id 
          FROM
            game_event
          NATURAL JOIN
            sport
          NATURAL JOIN
            match_event
          NATURAL JOIN
            match_event_team
          WHERE game_id = _game_id
      );
    END;
//

\d ;
