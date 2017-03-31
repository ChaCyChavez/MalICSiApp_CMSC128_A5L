
-- DROP USER 'CMSC128'@'localhost';
-- CREATE USER 'CMSC128'@'localhost' IDENTIFIED BY 'project128';
DROP DATABASE IF EXISTS malicsi;
CREATE DATABASE malicsi;
GRANT ALL PRIVILEGES ON malicsi.* TO 'CMSC128'@'localhost' WITH GRANT OPTION;
USE malicsi;

CREATE TABLE account (
    account_id          int(11) NOT NULL AUTO_INCREMENT,
    firstname           varchar(256) NOT NULL,
    middlename          varchar(256) NOT NULL,
    lastname            varchar(256) NOT NULL,
    email               varchar(256) NOT NULL,
    username            varchar(100) NOT NULL,
    password            varchar(256) NOT NULL,
    course              varchar(256) NOT NULL,
    birthday            date NOT NULL,
    college             enum('CA','CAS','CDC','CEAT','CEM','CFNR','CHE','CPAf','CVM','SESAM','GS') NOT NULL,
    is_approved         boolean DEFAULT false, 
    is_game_head        boolean DEFAULT false,
    position            varchar(256) DEFAULT NULL,
    is_player           boolean DEFAULT false,
    player_jersey_num   int(11) DEFAULT NULL,
    player_role         varchar(256) DEFAULT NULL,

    UNIQUE              (username),
    PRIMARY KEY         (account_id)
);

CREATE TABLE game_event (
    game_id                     int(11) NOT NULL AUTO_INCREMENT,
    game_name                   varchar(256) NOT NULL,
    game_starting_time_date     datetime NOT NULL,
    game_ending_time_date       datetime NOT NULL,
    account_id                  int(11) NOT NULL,
    PRIMARY KEY                 (game_id),
    CONSTRAINT                  `fk_game_account`
        FOREIGN KEY (account_id) REFERENCES account (account_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE team (
    team_id             int(11) NOT NULL AUTO_INCREMENT,
    team_name           varchar(256) NOT NULL,
    team_color          varchar(256) NOT NULL,
    PRIMARY KEY         (team_id)
);

CREATE TABLE court (
    court_id            int(11) NOT NULL AUTO_INCREMENT,
    court_name          varchar(256) NOT NULL,
    court_location      varchar(256) NOT NULL,
    court_type          varchar(256) NOT NULL,
    PRIMARY KEY         (court_id)
);

CREATE TABLE sponsor (
    sponsor_id          int(11) NOT NULL AUTO_INCREMENT,
    sponsor_name        varchar(256) NOT NULL,
    sponsor_logo        varchar(256) DEFAULT NULL,
    sponsor_type        enum('minor','major','official partner') NOT NULL,
    sponsor_desc        varchar(256) NOT NULL,
    web_address         varchar(256) NOT NULL,
    game_id             int(11) NOT NULL,
    PRIMARY KEY         (sponsor_id),
    CONSTRAINT          `fk_sponsor_game` 
        FOREIGN KEY (game_id) REFERENCES game_event (game_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE sport (
    sport_id            int(11) NOT NULL AUTO_INCREMENT,
    sport_type          varchar(256) NOT NULL,
    division            enum('men','women','mixed') NOT NULL,
    game_id             int(11) NOT NULL,
    PRIMARY KEY         (sport_id),
    CONSTRAINT          `fk_sport_game`
        FOREIGN KEY (game_id) REFERENCES game_event (game_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE match_event (
    match_id            int(11) NOT NULL AUTO_INCREMENT,
    status              boolean NOT NULL,
    match_date_time     datetime NOT NULL,
    series              enum('elimination','semi-finals','finals') NOT NULL,
    sport_id            int(11) NOT NULL,
    court_id            int(11) NOT NULL,
    PRIMARY KEY         (match_id),
    CONSTRAINT          `fk_match_event_sport`
        FOREIGN KEY (sport_id) REFERENCES sport (sport_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT          `fk_match_event_court` 
        FOREIGN KEY (court_id) REFERENCES court (court_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- N-M relationship tables
CREATE TABLE game_event_team (
    team_id             int(11) NOT NULL,
    game_id             int(11) NOT NULL,
    PRIMARY KEY         (team_id, game_id),
    CONSTRAINT          `fk_game_team_game` 
        FOREIGN KEY (game_id) REFERENCES game_event (game_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT          `fk_game_team_team` 
        FOREIGN KEY (team_id) REFERENCES team (team_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE team_account (
    account_id          int(11) NOT NULL,
    team_id             int(11) NOT NULL,
    PRIMARY KEY         (account_id, team_id),
    CONSTRAINT          `fk_account_team_account`
        FOREIGN KEY (account_id) REFERENCES account (account_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT          `fk_account_team_team`
        FOREIGN KEY (team_id) REFERENCES team (team_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE match_event_team(
    team_id             int(11) NOT NULL,
    match_id            int(11) NOT NULL,
    score               int(11) NOT NULL,
    PRIMARY KEY         (team_id, match_id, score),
    CONSTRAINT          `fk_team_match_team`
        FOREIGN KEY (team_id) REFERENCES team (team_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT          `fk_team_match_match`
        FOREIGN KEY (match_id) REFERENCES match_event (match_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE activity_log (
    log_id              int(11) NOT NULL AUTO_INCREMENT,
    log_description     text NOT NULL,
    log_date            timestamp DEFAULT now(),
    account_id          int(11),
    PRIMARY KEY         (log_id)
);