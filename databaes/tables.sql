drop database if exists malicsi;
create database malicsi;
use malicsi;

create table account(
    account_id          int auto_increment not null,
    email               varchar(256) not null,
    is_regular_account  boolean,
    Is_admin            boolean,
    Is_game_head        boolean,
    Is_player           boolean,
    username            varchar(256) not null,
    password            varchar(256) not null,
    firstname           varchar(256) not null,
    middlename          varchar(256) not null,
    lastname            varchar(256) not null,
    course              varchar(256) not null,
    birthday            date not null,
    college             enum('CA', 'CAS', 'CDC', 'CEAT', 'CEM', 'CFNR', 'CHE', 'CPAf', 'CVM', 'SESAM', 'GS') not null,
    status              boolean,
    PRIMARY KEY (account_id)
);

create table game (
    game_id                 int auto_increment not null,
    game_name               varchar(256) not null,
    game_place              varchar(256) not null,
    game_starting_time_date date not null,
    game_ending_time_date   date not null,
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
    PRIMARY KEY         (team_id)
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
        foreign key (game_id) references game (game_id)
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
    number_of_participant   int not null,
    date_time               date not null,
    division                enum('men','women','mixed') not null,
    game_id                 int not null,
    court_id                int not null,
    PRIMARY KEY             (sport_id),
    Constraint      `fk_sport_game`
        foreign key (game_id) references game (game_id),
    Constraint      `fk_sport_court`
        foreign key (court_id) references court (court_id)
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
    sponsor_affiliation varchar(256),
    sponsor_logo        varchar(256),
    game_id     int not null,
    PRIMARY KEY (sponsor_id),
    Constraint      `fk_sponsor_game`
        foreign key (game_id) references game (game_id)
);


create table game_sponsor (
    game_id     int not null,
    sponsor_id      int not null,
    PRIMARY KEY (game_id, sponsor_id),
    Constraint      `fk_game_sponsor_game`
        foreign key (game_id) references game (game_id),
    Constraint      `fk_game_sponsor_sponsor`
        foreign key (sponsor_id) references sponsor (sponsor_id)
);

create table score (
    score_id        int auto_increment not null,
    sport_id        int not null,
    winning_team    varchar(256) not null,
    losing_team     varchar(256) not null,
    series          enum('elims', 'semi-finals', 'finals') not null,
    PRIMARY KEY     (score_id),
    Constraint      `fk_score_sport`
        foreign key (sport_id) references sport (sport_id)
);

create table log ( 
    log_id        int auto_increment not null,
    log_description     varchar(256) not null,
    account_id      int not null,
    PRIMARY KEY (log_id),
    Constraint      `fk_log_account`
        foreign key (account_id) references account (account_id)
);

create table participates (
    player_id       int not null, 
    sport_id        int not null,
    PRIMARY KEY     (player_id, sport_id),
    Constraint      `fk_participates_player`
        foreign key (player_id) references player (player_id),
    Constraint      `fk_participates_sport`
        foreign key (sport_id) references sport (sport_id)
);

create table registers (
    player_id       int not null, 
    game_id         int not null,
    PRIMARY KEY     (player_id, game_id),
    Constraint      `fk_registers_player`
        foreign key (player_id) references player (player_id),
    Constraint      `fk_registers_game`
        foreign key (game_id) references game (game_id)
);

create table game_game_type (
    game_id         int not null, 
    game_type       varchar(128) not null,
    PRIMARY KEY     (game_id, game_type),
    Constraint      `fk_game_game_type_game`
        foreign key (game_id) references game (game_id)
);