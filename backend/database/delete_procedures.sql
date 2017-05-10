use malicsi;

/* delete account */
drop procedure if exists delete_account;
DELIMITER //
  CREATE PROCEDURE delete_account(
      IN _account_id int
  )
  BEGIN
    DELETE
    FROM
        account
    WHERE
        account_id = _account_id;
  END;
//
DELIMITER ;

/* delete team */
drop procedure if exists delete_team;
DELIMITER //
  CREATE PROCEDURE delete_team(
      IN _team_id int
  )
  BEGIN
    DELETE
    FROM
        team
    WHERE
        team_id = _team_id;
  END;
//
DELIMITER ;

/* delete game event */
drop procedure if exists delete_game_event;
DELIMITER //
  CREATE PROCEDURE delete_game_event(
      IN _game_id int,
      IN _account_id int
  )
  BEGIN
    SET @account_type = (SELECT is_admin FROM account WHERE account_id = _account_id);
    IF @account_type = 1 THEN
        DELETE
        FROM
            game_event
        WHERE
            game_id = _game_id;
    ELSE
        DELETE
        FROM
            game_event
        WHERE
            game_id = _game_id
        AND
            account_id = _account_id;
    END IF;
  END;
//
DELIMITER ;

/* delete activity_log */
drop procedure if exists delete_activity_log;
DELIMITER //
  CREATE PROCEDURE delete_activity_log(
      IN _log_id int
  )
  BEGIN
    DELETE
    FROM
        activity_log
    WHERE
        log_id = _log_id;
  END;
//
DELIMITER ;

/* delete sponsor */
drop procedure if exists delete_sponsor;
DELIMITER //
  CREATE PROCEDURE delete_sponsor(
      IN _sponsor_id int
  )
  BEGIN
    DELETE
    FROM
        sponsor
    WHERE
        sponsor_id = _sponsor_id;
  END;
//
DELIMITER ;

/* delete sport */
drop procedure if exists delete_sport;
DELIMITER //
  CREATE PROCEDURE delete_sport(
      IN _sport_id int,
      IN _account_id int
  )
  BEGIN
    SET @account_type = (SELECT is_admin FROM account WHERE account_id = _account_id);
    IF @account_type = 1 THEN
      DELETE FROM
          sport
      WHERE
          sport_id = _sport_id;
    ELSE
      DELETE FROM
          sport
      WHERE
          sport_id = _sport_id
      AND
          game_id 
      IN 
          (SELECT game_id FROM game_event WHERE account_id = _account_id);
    END IF;
  END;
//
DELIMITER ;

/* delete match event */
drop procedure if exists delete_match_event;
DELIMITER //
    CREATE PROCEDURE delete_match_event(
        IN _match_id int
    )
    BEGIN
        DELETE
        FROM
            match_event
        WHERE
            match_id = _match_id;
    END;
//
DELIMITER ;
