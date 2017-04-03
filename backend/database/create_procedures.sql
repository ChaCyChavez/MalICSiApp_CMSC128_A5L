USE malicsi;

\d //

DROP PROCEDURE IF EXISTS add_account//
    CREATE PROCEDURE add_account (
        IN _firstname           varchar(256),
        IN _middlename          varchar(256),
        IN _lastname            varchar(256),
        IN _email               varchar(256),
        IN _username            varchar(256),
        IN _password            varchar(256),
        IN _course              varchar(256),
        IN _birthday            date,
        IN _college             enum('CA','CAS','CDC','CEAT','CEM','CFNR','CHE','CPAf','CVM','SESAM','GS'),
        IN _is_game_head        boolean,
        IN _position            varchar(256),
        IN _is_player           boolean,
        IN _player_jersey_num   int,
        IN _player_role         varchar(256)
    )
    BEGIN
        INSERT INTO account(
            firstname,
            middlename,
            lastname,
            email,
            username,
            password,
            course,
            birthday,
            college,
            is_game_head,
            position, 
            is_player, 
            player_jersey_num, 
            player_role
        )VALUES(
            _firstname,
            _middlename,
            _lastname,
            _email,
            _username,
            _password,
            _course,
            _birthday,
            _college,
            _is_game_head,
            _position,
            _is_player,
            _player_jersey_num,
            _player_role
        );
    END;
// 

DROP PROCEDURE IF EXISTS add_activity_log//
    CREATE PROCEDURE add_activity_log (
        IN _log_description     varchar(256),
        IN _account_id          int
    )
    BEGIN
        INSERT INTO activity_log(
            log_description,
            account_id
        )VALUES(
            _log_description,
            _account_id
        );
    END;
//

DROP PROCEDURE IF EXISTS add_team//
    CREATE PROCEDURE add_team (
        IN _team_name           varchar(256),
        IN _team_color          varchar(256)
    )
    BEGIN
        INSERT INTO team(
            team_name,
            team_color
        )
        VALUES(
            _team_name,
            _team_color
        );
    END;
//

DROP PROCEDURE IF EXISTS add_sponsor//
    CREATE PROCEDURE add_sponsor (
        IN _sponsor_name        varchar(256),
        IN _sponsor_logo        varchar(256),
        IN _sponsor_type        enum('minor','major','official partner'),
        IN _sponsor_desc        varchar(256),
        IN _web_address         varchar(256),
        IN _game_id             int
    )
    BEGIN
        INSERT INTO sponsor(
            sponsor_name,
            sponsor_logo,
            sponsor_type,
            sponsor_desc,
            web_address,
            game_id
        )VALUES(
            _sponsor_name,
            _sponsor_logo,
            _sponsor_type,
            _sponsor_desc,
            _web_address,
            _game_id
            );
    END;
//

DROP PROCEDURE IF EXISTS add_game_event//
    CREATE PROCEDURE add_game_event (
        IN _game_name                   varchar(256),
        IN _game_starting_time_date     datetime,
        IN _game_ending_time_date       datetime,
        IN _account_id                  int
    )
    BEGIN
        INSERT INTO game_event(
            game_name,
            game_starting_time_date,
            game_ending_time_date,
            account_id
        )VALUES(
            _game_name,
            _game_starting_time_date,
            _game_ending_time_date,
            _account_id
        );
    END;
// 

DROP PROCEDURE IF EXISTS add_sport//
    CREATE PROCEDURE add_sport (
        IN _sport_type          varchar(256),
        IN _division            enum('men','women','mixed'),
        IN _game_id             int
    )
    BEGIN
        INSERT INTO sport(
            sport_type,
            division,
            game_id
        )
        VALUES(
            _sport_type,
            _division,
            _game_id
        );
    END;
//

DROP PROCEDURE IF EXISTS add_match_event//
    CREATE PROCEDURE add_match_event (
        IN _status             boolean,
        IN _match_date_time    datetime,
        IN _series             enum('elimination','semi-finals','finals'),
        IN _sport_id           int,
        IN _court_id           int
    )
    BEGIN
        INSERT INTO match_event(
            status,
            match_date_time,
            series,
            sport_id,
            court_id
        )VALUES(
            _status,
            _match_date_time,
            _series,
            _sport_id,
            _court_id
        );
    END;
// 

DROP PROCEDURE IF EXISTS add_court//
    CREATE PROCEDURE add_court (
        IN _court_name          varchar(256),
        IN _court_location      varchar(256),
        IN _court_type          varchar(256)
    )
    BEGIN
        INSERT INTO court(
            court_name,
            court_location,
            court_type
        )VALUES(
            _court_name,
            _court_location,
            _court_type
        );
    END;
// 

DROP PROCEDURE IF EXISTS register_team_to_game//
    CREATE PROCEDURE register_team_to_team(
        IN _team_id             int,
        IN _game_id             int
    )
    BEGIN
        INSERT INTO game_event_team(
            team_id,
            game_id
        )VALUES(
            _team_id,
            _game_id
        );
    END;
//

DROP PROCEDURE IF EXISTS join_account_to_team//
    CREATE PROCEDURE join_account_to_team(
        IN _account_id          int,
        IN _team_id             int
    )
    BEGIN
        INSERT INTO team_account(
            account_id,
            team_id
        )VALUES(
            _account_id,
            _team_id
        );
    END;
//

DROP PROCEDURE IF EXISTS add_score//
    CREATE PROCEDURE add_score(
        IN _team_id             int,
        IN _match_id            int,
        IN _score               int
    )
    BEGIN
        INSERT INTO match_event_team(
            team_id,
            match_id,
            score
        )VALUES(
            _team_id,
            _match_id,
            _score
        );
    END;
//

\d ;
