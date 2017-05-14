-- DROP USER IF EXISTS 'CMSC128'@'localhost';
-- CREATE USER 'CMSC128'@'localhost' IDENTIFIED BY 'project128';
-- DROP DATABASE IF EXISTS malicsi;
-- CREATE DATABASE malicsi;
-- GRANT SUPER ON *.* TO 'CMSC128'@'localhost';
-- GRANT ALL PRIVILEGES ON malicsi.* TO 'CMSC128'@'localhost' WITH GRANT OPTION;

-- USE malicsi;

DROP TABLE IF EXISTS account;
CREATE TABLE account (
    account_id          int NOT NULL AUTO_INCREMENT,
    firstname           varchar(256) NOT NULL,
    middlename          varchar(256) NOT NULL,
    lastname            varchar(256) NOT NULL,
    email               varchar(256) NOT NULL,
    username            varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    password            varchar(256) NOT NULL,
    course              varchar(256) NOT NULL,
    birthday            date NOT NULL,
    college             enum('CA','CAS','CDC','CEAT','CEM','CFNR','CHE','CPAf','CVM','SESAM','GS') NOT NULL,
    is_approved         boolean DEFAULT false,              /*for membership registration of account*/
    is_game_head        boolean DEFAULT false,              /*game_head flag*/
    position            varchar(256) DEFAULT NULL,          /*game_head attribute*/
    is_player           boolean DEFAULT false,              /*player flag*/
    player_jersey_num   int DEFAULT NULL,                   /*player attribute*/
    player_role         varchar(256) DEFAULT NULL,          /*player attribute*/
	is_admin			boolean DEFAULT false,
    UNIQUE              (username),
    PRIMARY KEY         (account_id)
);

DROP TABLE IF EXISTS activity_log;
CREATE TABLE activity_log (
    log_id              int NOT NULL AUTO_INCREMENT,
    log_description     varchar(256),
    log_date            timestamp DEFAULT NOW(),
    account_id          int NOT NULL,
    PRIMARY KEY         (log_id)
);

DROP TABLE IF EXISTS game_event;
CREATE TABLE game_event (
    game_id                     int NOT NULL AUTO_INCREMENT,
    game_name                   varchar(256) NOT NULL,
    game_starting_time_date     datetime NOT NULL,
    game_ending_time_date       datetime NOT NULL,
    account_id                  int NOT NULL,
    PRIMARY KEY                 (game_id),
    CONSTRAINT                  `fk_game_account`
        FOREIGN KEY (account_id) REFERENCES account (account_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS team;
CREATE TABLE team (
    team_id             int NOT NULL AUTO_INCREMENT,
    team_name           varchar(256) NOT NULL,
    team_color          varchar(256) NOT NULL,
    PRIMARY KEY         (team_id),
    game_id             int NOT NULL,
    CONSTRAINT          `fk_team_game`
        FOREIGN KEY (game_id) REFERENCES game_event (game_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS sponsor;
CREATE TABLE sponsor (
    sponsor_id          int NOT NULL AUTO_INCREMENT,
    sponsor_name        varchar(256) NOT NULL,
    sponsor_logo        varchar(256) DEFAULT NULL,
    sponsor_type        enum('minor','major','official partner') NOT NULL,
    sponsor_desc        varchar(256) NOT NULL,
    web_address         varchar(256) DEFAULT NULL,
    game_id             int NOT NULL,
    PRIMARY KEY         (sponsor_id),
    CONSTRAINT          `fk_game_sponsored`
        FOREIGN KEY (game_id) REFERENCES game_event (game_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS sport;
CREATE TABLE sport (
    sport_id            int NOT NULL AUTO_INCREMENT,
    sport_type          varchar(128) NOT NULL,
    division            enum('men','women','mixed') NOT NULL,
    game_id             int NOT NULL,
    UNIQUE              (sport_type, division, game_id),
    PRIMARY KEY         (sport_id),
    CONSTRAINT          `fk_game_sport`
        FOREIGN KEY (game_id) REFERENCES game_event (game_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS match_event;
CREATE TABLE match_event (
    match_id            int NOT NULL AUTO_INCREMENT,
    status              boolean NOT NULL,
    match_date_time     datetime NOT NULL,
    sport_id            int NOT NULL,
	court_name          varchar(256) NOT NULL,
    court_location      varchar(256) NOT NULL,
    court_type          varchar(256) NOT NULL,
    PRIMARY KEY         (match_id),
    CONSTRAINT          `fk_sport_match`
        FOREIGN KEY (sport_id) REFERENCES sport (sport_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS team_account;
CREATE TABLE team_account (             /*table for players that joined in a team*/
    account_id          int NOT NULL,
    team_id             int NOT NULL,
    PRIMARY KEY         (account_id, team_id),
    CONSTRAINT          `fk_account_of_player`
        FOREIGN KEY (account_id) REFERENCES account (account_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT          `fk_team_of_account`
        FOREIGN KEY (team_id) REFERENCES team (team_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS match_event_team;
CREATE TABLE match_event_team(          /*table for scores of team that participated in a match_event*/
    team_id             int NOT NULL,
    match_id            int NOT NULL,
    score               int NOT NULL,
    PRIMARY KEY         (team_id, match_id, score),
    CONSTRAINT          `fk_team_scored`
        FOREIGN KEY (team_id) REFERENCES team (team_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT          `fk_match_of_team`
        FOREIGN KEY (match_id) REFERENCES match_event (match_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);
