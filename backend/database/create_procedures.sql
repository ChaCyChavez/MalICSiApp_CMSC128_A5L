use malicsi;

drop procedure if exists add_account;
delimiter //
    create procedure add_account (
        IN _firstname           varchar(256),
        IN _middlename          varchar(256),
        IN _lastname            varchar(256),
        IN _email               varchar(256),
        IN _username            varchar(256),
        IN _password            varchar(256),
        IN _course              varchar(256),
        IN _birthday            date,
        IN _college             enum('CA','CAS','CDC','CEAT','CEM','CFNR','CHE','CPAf','CVM','SESAM','GS'),
        IN _position            varchar(256),
        IN _is_player           boolean,
        IN _player_jersey_num   int(11),
        IN _player_role         varchar(256)
    )
    BEGIN
        INSERT into account(
            firstname,
            middlename, 
            lastname, 
            email, 
            username, 
            password, 
            course, 
            birthday, 
            college,
            position, 
            is_player, 
            player_jersey_num, 
            player_role
            ) 
        values(
            _firstname,
            _middlename,
            _lastname,
            _email,
            _username,
            _password,
            _course,
            _birthday,
            _college,
            _position,
            _is_player,
            _player_jersey_num,
            _player_role
        );
    END;
// 
delimiter ;

drop procedure if exists add_court;
delimiter //
    create procedure add_court (
        IN _court_name          varchar(256),
        IN _court_location      varchar(256),
        IN _court_type          varchar(256)
    )
    BEGIN
        INSERT into court(
            court_name,
            court_location,
            court_type
            ) 
        values(
            _court_name,
            _court_location,
            _court_type
        );
    END;
// 
delimiter ;

drop procedure if exists add_game_event;
delimiter //
    create procedure add_game_event (
        IN _game_name                   varchar(256),
        IN _game_starting_time_date     datetime,
        IN _game_ending_time_date       datetime,
        IN _account_id                  int
    )
    BEGIN
        INSERT into game_event(
            game_name,
            game_starting_time_date,
            game_ending_time_date,
            account_id
            )
        values(
            _game_name,
            _game_starting_time_date,
            _game_ending_time_date,
            _account_id
            );
    END;
// 
delimiter ;

drop procedure if exists add_match_event;
delimiter //
    create procedure add_match_event (
        IN _match_date_time    datetime,
        IN _status             boolean,
        IN _sport_id           int,
        IN _court_id           int(11)
    )
    BEGIN
        INSERT into match_event(
            match_date_time,
            status,
            sport_id,
            court_id
            )
        values(
            _match_date_time,
            _status,
            _sport_id,
            _court_id
            );
    END;
// 
delimiter ;

drop procedure if exists add_sponsor;
delimiter //
    create procedure add_sponsor (
        IN _sponsor_name        varchar(256),
        IN _sponsor_logo        varchar(256),
        IN _sponsor_type        enum('minor','major','official partner'),
        IN _game_id             int
    )
    BEGIN
        INSERT into sponsor(
            sponsor_name,
            sponsor_logo,
            game_id
            )
        values(
            _sponsor_name,
            _sponsor_logo,
            _game_id
            );
    END;
//
delimiter ;

drop procedure if exists add_sport;
delimiter //
    create procedure add_sport (
        IN _sport_type          varchar(256),
        IN _division            enum('men','women','mixed')
    )
    BEGIN
        INSERT into sport(
            sport_type,
            division
            )
        values(
            _sport_type,
            _division
            );
    END;
//
delimiter ;

drop procedure if exists add_team;
delimiter //
    create procedure add_team (
        IN _team_name           varchar(256),
        IN _team_color          varchar(256),
        IN _game_id             int
    )
    BEGIN
        INSERT into sport(
            team_name,
            team_color,
            game_id
            )
        values(
            _team_name,
            _team_color,
            _game_id
            );
    END;
//
delimiter ;

drop procedure if exists add_player;
delimiter //
    create procedure add_player (
        IN _account_id                  int,
        IN _player_jersey_number        int,
        IN _is_coach                    boolean,
        IN _game_id                     int
    )
    BEGIN
        INSERT into player(
            account_id,
            player_jersey_num,
            is_coach,
            game_id
            )
        values(
            _account_id,
            _player_jersey_number,
            _is_coach,
            _game_id
            );
    END;
//
delimiter ;

drop procedure if exists add_team_player;
delimiter //
    create procedure add_team_player (
        IN _team_id         int,
        IN _player_id       int
    )
    BEGIN
        INSERT into team_player(
            team_id,
            player_id
            )
        values(
            _team_id,
            _player_id
            );
    END;
//
delimiter ;

drop procedure if exists add_sport_player;
delimiter //
    create procedure add_sport_player (
        IN _sport_id        int,
        IN _player_id       int
    )
    BEGIN
        INSERT into sport_player(
            sport_id,
            player_id
            )
        values(
            _sport_id,
            _player_id
            );
    END;
//
delimiter ;

-- drop procedure if exists add_game_sponsor;
-- delimiter //
--     create procedure add_game_sponsor (
--         IN _game_id         int,
--         IN _sponsor_id      int
--     )
--     BEGIN
--         INSERT into game_sponsor(
--             game_id,
--             sponsor_id
--             )
--         values(
--             _game_id,
--             _sponsor_id
--             );
--     END;
-- //
-- delimiter ;


drop procedure if exists add_score;
delimiter //
    create procedure add_score (
        IN _score_value     int,
        IN _series          enum('elims', 'semi-finals', 'finals'),
        IN _match_id        int,
        IN _account_id      int
    )
    BEGIN
        INSERT into score(
            score_value,
            series,
            match_id,
            account_id
            )
        values(
            _score_value,
            _series,
            _match_id,
            _account_id
            );
    END;
//
delimiter ;


drop procedure if exists add_activity_log;
delimiter //
    create procedure add_activity_log (
        IN _log_description     varchar(256),
        IN _account_id          int
    )
    BEGIN
        INSERT into activity_log(
            log_description,
            account_id
            )
        values(
            _log_description,
            _account_id
            );
    END;
//
delimiter ;

drop procedure if exists add_player_match;
delimiter //
    create procedure add_player_match(
        IN _account_id     int,
        IN _match_id       int
    )
    BEGIN
        INSERT into player_match(
            account_id,
            match_id
            )
        values(
            _account_id,
            _match_id
            );
    END;
//
delimiter ;

drop procedure if exists add_court_match;
delimiter //
    create procedure add_court_match(
        IN _court_id       int,
        IN _match_id       int
    )
    BEGIN
        INSERT into player_match(
            court_id,
            match_id
            )
        values(
            _court_id,
            _match_id
            );
    END;
//
delimiter ;