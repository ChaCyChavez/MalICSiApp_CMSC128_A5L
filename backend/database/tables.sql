DROP DATABASE IF EXISTS malicsi;
CREATE DATABASE malicsi;
USE malicsi;

CREATE TABLE game_event (
    game_id             int(11) NOT NULL AUTO_INCREMENT,
    game_name           varchar(256) NOT NULL,
    game_starting_time_date     datetime NOT NULL,
    game_ending_time_date       datetime NOT NULL,
    PRIMARY KEY         (game_id)
);

CREATE TABLE team (
    team_id             int(11) NOT NULL AUTO_INCREMENT,
    team_name           varchar(256) NOT NULL,
    team_color          varchar(256) NOT NULL,
    team_coach          varchar(256) NOT NULL,
    game_id             int(11),
    PRIMARY KEY         (team_id),
    CONSTRAINT          `fk_team_game`
        FOREIGN KEY (game_id) REFERENCES game_event (game_id)
);

CREATE TABLE account (
    account_id          int(11) NOT NULL AUTO_INCREMENT,
    firstname           varchar(256) NOT NULL,
    middlename          varchar(256) NOT NULL,
    lastname            varchar(256) NOT NULL,
    email               varchar(256) NOT NULL,
    username            varchar(256) NOT NULL,
    password            varchar(256) NOT NULL,
    course              varchar(256) NOT NULL,
    birthday            date NOT NULL,
    college             enum('CA','CAS','CDC','CEAT','CEM','CFNR','CHE','CPAf','CVM','SESAM','GS') NOT NULL,
    status              boolean,
    is_game_head        boolean,
    position            varchar(256),
    is_player           boolean,
    player_jersey_num   int(11),
    player_role         varchar(256),
    team_id             int(11),
    PRIMARY KEY                     (account_id),
    CONSTRAINT         `fk_account_team`
        FOREIGN KEY (team_id) REFERENCES team (team_id)
);

CREATE TABLE log (
    log_id              int(11) NOT NULL AUTO_INCREMENT,
    log_description     varchar(256) NOT NULL,
    account_id          int(11) NOT NULL,
    PRIMARY KEY         (log_id),
    CONSTRAINT          `fk_log_account`
        FOREIGN KEY (account_id) REFERENCES account (account_id)
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
    sponsor_logo        varchar(256),
    sponsor_affiliation varchar(256),
    PRIMARY KEY         (sponsor_id)
);

CREATE TABLE sport (
    sport_id            int(11) NOT NULL AUTO_INCREMENT,
    sport_type          varchar(256) NOT NULL,
    division            enum('men','women','mixed') NOT NULL,
    game_id             int(11) NOT NULL,
    PRIMARY KEY         (sport_id),
    CONSTRAINT          `fk_sport_game`
        FOREIGN KEY (game_id) REFERENCES game_event (game_id)
);

CREATE TABLE match_event (
    match_id            int(11) NOT NULL AUTO_INCREMENT,
    status              boolean,
    match_date_time     datetime,
    score1              int(11),
    score2              int(11),
    series              enum('elimination','semi-finals','finals') NOT NULL,
    sport_id            int(11),
    team1_id            int(11),
    team2_id            int(11),
    court_id            int(11),
    PRIMARY KEY         (match_id),
    CONSTRAINT          `fk_match_sport`
        FOREIGN KEY (sport_id) REFERENCES sport (sport_id),
    CONSTRAINT          `fk_score_team1` 
        FOREIGN KEY (team1_id) REFERENCES team (team_id),
    CONSTRAINT          `fk_score_team2` 
        FOREIGN KEY (team1_id) REFERENCES team (team_id),
    CONSTRAINT          `fk_match_event_court` 
        FOREIGN KEY (court_id) REFERENCES court (court_id)
);

CREATE TABLE game_event_sponsor (
    game_id             int(11) NOT NULL,
    sponsor_id          int(11) NOT NULL,
    PRIMARY KEY         (game_id,sponsor_id),
    CONSTRAINT          `fk_game_sponsor_game` 
        FOREIGN KEY (game_id) REFERENCES game_event (game_id),
    CONSTRAINT          `fk_game_sponsor_sponsor`
        FOREIGN KEY (sponsor_id) REFERENCES sponsor (sponsor_id)
);