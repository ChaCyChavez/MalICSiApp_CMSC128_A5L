drop database if exists malicsi;
create database malicsi;
use malicsi;


create table game_event (
    game_id                 int auto_increment not null,
    game_name               varchar(256) not null,
    game_starting_time_date datetime not null,
    game_ending_time_date   datetime not null,
    account_id              int not null,
    PRIMARY KEY             (game_id),
    Constraint      `fk_game_account`
        foreign key (account_id) references account (account_id)
);

create table team (
    team_id             int auto_increment not null,
    team_name           varchar(256) not null,
    team_color          varchar(256) not null,
    team_coach          varchar(256) not null,
    game_id             int,
    PRIMARY KEY         (team_id)
    Constraint          `fk_team_game`
        foreign key (game_id) references game_event (game_id)
);

create table account(
    account_id          int auto_increment not null,
    firstname           varchar(256) not null,
    middlename          varchar(256) not null,
    lastname            varchar(256) not null,
    email               varchar(256) not null,
    username            varchar(256) not null,
    password            varchar(256) not null,
    course              varchar(256) not null,
    birthday            date not null,
    college             enum('CA', 'CAS', 'CDC', 'CEAT', 'CEM', 'CFNR', 'CHE', 'CPAf', 'CVM', 'SESAM', 'GS') not null,
    status              boolean,
    is_game_head        boolean,
    position            varchar(256),
    is_player           boolean
    player_jersey_number int,
    PRIMARY KEY (account_id),
    Constraint      `fk_account_team`
        foreign key (team_id) references team (team_id)
);





create table player (
    player_id                   int auto_increment not null,
    account_id                  int not null,
    player_jersey_number        int not null,
    is_coach                    boolean,
    game_id                     int not null,
    PRIMARY KEY                 (player_id),
    Constraint      `fk_player_account`
        foreign key (account_id) references account (account_id),
    Constraint      `fk_player_game`
        foreign key (game_id) references game_event (game_id)
);

create table team_player (
    team_id         int not null,
    player_id       int not null,
    PRIMARY KEY     (team_id, player_id),
    Constraint      `fk_team_player_team`
        foreign key (team_id) references team (team_id),
    Constraint      `fk_team_player_player`
        foreign key (player_id) references player (player_id)
);

create table court (
    court_id        int auto_increment not null,
    court_name      varchar(256) not null,
    court_location  varchar(256) not null,
    court_type      varchar(256) not null,
    PRIMARY KEY     (court_id)
);

create table sport (
    sport_id                int auto_increment not null,
    sport_type              varchar(256) not null,
    division                enum('men','women','mixed') not null,
    game_id                 int not null,
    PRIMARY KEY             (sport_id),
    Constraint      `fk_sport_game`
        foreign key (game_id) references game_event (game_id)
);

create table match (
    match_id                int auto_increment not null,
    status                  boolean,
    match_date_time         datetime,
    sport_id                int,
    PRIMARY KEY             (match_id),
    Constraint      `fk_match_sport`
        foreign key (sport_id) references sport (sport_id)
);

create table sport_player (
    sport_id        int not null,
    player_id       int not null,
    PRIMARY KEY     (sport_id, player_id),
    Constraint      `fk_sport_player_sport`
        foreign key (sport_id) references sport (sport_id),
    Constraint      `fk_sport_player_player`
        foreign key (player_id) references player (player_id)
);

create table sponsor (
    sponsor_id      int auto_increment not null,
    sponsor_name    varchar(256) not null,
    sponsor_logo        varchar(256),
    sponsor_affiliation varchar(256),
    PRIMARY KEY (sponsor_id)
);

create table game_sponsor (
    game_id     int not null,
    sponsor_id      int not null,
    PRIMARY KEY (game_id, sponsor_id),
    Constraint      `fk_game_sponsor_game`
        foreign key (game_id) references game_event (game_id),
    Constraint      `fk_game_sponsor_sponsor`
        foreign key (sponsor_id) references sponsor (sponsor_id)
);

create table score (
    score_id        int auto_increment not null,
    score_value     int,
    series          enum('elims', 'semi-finals', 'finals') not null,
    match_id        int,
    account_id      int,
    PRIMARY KEY     (score_id),
    Constraint      `fk_score_match`
        foreign key (match_id) references match (match_id)
    Constraint      `fk_score_account`
        foreign key (account_id) references account (account_id)
);



create table log ( 
    log_id        int auto_increment not null,
    log_description     varchar(256) not null,
    account_id      int not null,
    PRIMARY KEY (log_id),
    Constraint      `fk_log_account`
        foreign key (account_id) references account (account_id)
);

create table sponsor_game_event (
    sponsor_id          int not null, 
    game_id             int not null,
    sponsorship_type    varchar(128),
    PRIMARY KEY     (sponsor_id, sport_id, sponsorship_type),
    Constraint      `fk_sponsor_game_event_sponsor`
        foreign key (sponsor_id) references sponsor (sponsor_id),
    Constraint      `fk_sponsor_game_event_game`
        foreign key (game_id) references game_event (game_id)
);


create table player_team (
    sport_id        int not null,
    team_id         int not null, 
    PRIMARY KEY     (sport_id, team_id),
    Constraint      `fk_player_team_sport`
        foreign key (sport_id) references sport (sport_id),
    Constraint      `fk_player_team_team`
        foreign key (team_id) references team (team_id)
);

create table player_match (
    account_id        int not null,
    match_id          int not null, 
    PRIMARY KEY     (account_id, match_id),
    Constraint      `fk_player_match_account`
        foreign key (account_id) references account (account_id),
    Constraint      `fk_player_match_match`
        foreign key (match_id) references match (match_id)
);

create table court_match (
    court_id        int not null,
    match_id        int not null, 
    PRIMARY KEY     (court_id, match_id),
    Constraint      `fk_court_match_court`
        foreign key (court_id) references court (court_id),
    Constraint      `fk_court_match_match`
        foreign key (match_id) references match (match_id)
);
