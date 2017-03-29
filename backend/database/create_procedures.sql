use malicsi;


/* Adding into main tables */
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
        IN _college             enum('CA','CAS','CDC','CEAT','CEM','CFNR','CHE','CPAf','CVM','SESAM','GS')
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
            college
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
            _college
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
        IN _account_id                  int(11)
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

drop procedure if exists add_team;
delimiter //
    create procedure add_team (
        IN _team_name           varchar(256),
        IN _team_color          varchar(256)
    )
    BEGIN
        INSERT into sport(
            team_name,
            team_color
            )
        values(
            _team_name,
            _team_color
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

drop procedure if exists add_sponsor;
delimiter //
    create procedure add_sponsor (
        IN _sponsor_name        varchar(256),
        IN _sponsor_logo        varchar(256),
        IN _sponsor_affiliation varchar(256),
        IN _game_id             int(11)
    )
    BEGIN
        INSERT into sponsor(
            sponsor_name,
            sponsor_logo,
            sponsor_affiliation,
            game_id
            )
        values(
            _sponsor_name,
            _sponsor_logo,
            _sponsor_affiliation,
            _game_id
            );
    END;
//
delimiter ;

drop procedure if exists add_sport;
delimiter //
    create procedure add_sport (
        IN _sport_type          varchar(256),
        IN _division            enum('men','women','mixed'), 
        IN _game_id             int(11)
    )
    BEGIN
        INSERT into sport(
            sport_type,
            division,
            game_id
            )
        values(
            _sport_type,
            _division,
            _game_id
            );
    END;
//
delimiter ;

drop procedure if exists add_match_event;
delimiter //
    create procedure add_match_event (
        IN _status             boolean,
        IN _match_date_time    datetime,
        IN _series             enum('elimination','semi-finals','finals'),
        IN _sport_id           int(11),
        IN _court_id           int(11)
    )
    BEGIN
        INSERT into match_event(
            status,
            match_date_time,
            series,
            sport_id,
            court_id
            )
        values(
            _status,
            _match_date_time,
            _series,
            _sport_id,
            _court_id
            );
    END;
// 
delimiter ;

/* Adding into "multivalued attribute" tables */

-- drop procedure if exists add_game_event_sponsor;
-- delimiter //
--     create procedure add_game_event_sponsor (
--         IN _sponsor_id      int(11),
--         IN _game_id         int(11),
--         IN _sponsor_type    enum('minor','major','official partner')
--     )
--     BEGIN
--         INSERT into game_sponsor(
--             sponsor_id,
--             game_id,
--             sponsor_type
--             )
--         values(
--             _sponsor_id,
--             _game_id,
--             _sponsor_type
--             );
--     END;
-- //
-- delimiter ;

drop procedure if exists add_game_event_team;
delimiter //
    create procedure add_game_event_team (
        IN _team_id       int(11),
        IN _game_id       int(11)
    )
    BEGIN
        INSERT into game_sponsor(
            team_id,
            game_id
            )
        values(
            _team_id,
            _game_id
            );
    END;
//
delimiter ;

drop procedure if exists add_team_account;
delimiter //
    create procedure add_team_account (
        IN _account_id        int(,
        IN _team_id           int
    )
    BEGIN
        INSERT into sport_player(
            account_id,
            team_id
            )
        values(
            _account_id,
            _team_id
            );
    END;
//
delimiter ;

drop procedure if exists add_match_event_team;
delimiter //
    create procedure add_match_event_team(
        IN _team_id        int(11),
        IN _match_id       int(11)
    )
    BEGIN
        INSERT into player_match(
            team_id,
            match_id
            )
        values(
            _team_id,
            _match_id
            );
    END;
//
delimiter ;


drop procedure if exists add_activity_log;
delimiter //
    create procedure add_activity_log (
        IN _log_description     varchar(256),
        IN _account_id          int(11)
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
