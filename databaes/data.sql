use malicsi;

insert into account values (NULL, 'regular@gmail.com', true, false, false, false, 'ken', 'pass', 'regular', 'bravo', 'mercado', 'bscs', CURDATE(), 'CAS', true);
insert into account values (NULL, 'admin@gmail.com', false, true, false, false, 'admin', 'pass', 'admin', 'bravo', 'mercado', 'bscs', CURDATE(), 'CAS', true);
insert into account values (NULL, 'gamehead@gmail.com', false, false, true, false, 'gamehead', 'pass', 'gamehead', 'bravo', 'mercado', 'bscs', CURDATE(), 'CAS', true);
insert into account values (NULL, 'player@gmail.com', false, false, false, true, 'player', 'pass', 'player', 'bravo', 'mercado', 'bscs', CURDATE(), 'CAS', true);


insert into game values (NULL, 'Game 2', 'UPLB', CURDATE(), CURDATE(), 3);
insert into game values (NULL, 'Game 3', 'UPLB', CURDATE(), CURDATE(), 3);
insert into game values (NULL, 'Game 4', 'UPLB', CURDATE(), CURDATE(), 3);
insert into game values (NULL, 'Game 4', 'UPLB', CURDATE(), CURDATE(), 3);

insert into team values (NULL, 'Blue Job', 'Blue', 'Clinton');
insert into team values (NULL, 'Red Job', 'Red', 'Clinton');
insert into team values (NULL, 'Green Job', 'Green', 'Clinton');
insert into team values (NULL, 'White Job', 'White', 'Clinton');

insert into player values (NULL, 2, 31, false, 1);
insert into player values (NULL, 2, 32, false, 1);
insert into player values (NULL, 2, 33, false, 1);
insert into player values (NULL, 2, 34, false, 1);

insert into team_player values (1, 1);
insert into team_player values (1, 2);
insert into team_player values (1, 3);
insert into team_player values (1, 4);

insert into court values (NULL, 'Baker Hall', 'UPLB', 'Gym');
insert into court values (NULL, 'Copeland', 'UPLB', 'Gym');
insert into court values (NULL, 'Physci', 'UPLB', 'Building');
insert into court values (NULL, 'Freedom Park', 'UPLB', 'Park');

insert into sport values (NULL, 'Volleyball', 21, CURDATE(), 'men', 1, 1);
insert into sport values (NULL, 'Volleyball', 21, CURDATE(), 'men', 2, 2);
insert into sport values (NULL, 'Volleyball', 21, CURDATE(), 'men', 3, 3);
insert into sport values (NULL, 'Volleyball', 21, CURDATE(), 'men', 4, 4);

insert into sport_player values (1, 1);
insert into sport_player values (1, 2);
insert into sport_player values (1, 3);
insert into sport_player values (1, 4);

insert into sponsor values (NULL, 'Ian', 'Buklod', 'http://logos.com/logo2.png', 1);
insert into sponsor values (NULL, 'Miles', 'ACSS', 'http://logos.com/logo3.png', 1);
insert into sponsor values (NULL, 'Emy', 'YSES', 'http://logos.com/logo4.png', 1);
insert into sponsor values (NULL, 'Maria', 'COSS', 'http://logos.com/logo2.png', 1);

insert into game_sponsor values (1, 1);
insert into game_sponsor values (1, 2);
insert into game_sponsor values (1, 3);
insert into game_sponsor values (1, 4);

insert into score values (NULL, 1, 'Team 2', 'Team 3', 'elims');
insert into score values (NULL, 2, 'Team 3', 'Team 4', 'elims');
insert into score values (NULL, 3, 'Team 4', 'Team 4', 'finals');
insert into score values (NULL, 4, 'Team 4', 'Team 5', 'semi-finals');

insert into log values (NULL, 'Sample Log 2', 1);
insert into log values (NULL, 'Sample Log 3', 2);
insert into log values (NULL, 'Sample Log 4', 3);
insert into log values (NULL, 'Sample Log 4', 4);

insert into participates values (1, 1);
insert into participates values (2, 1);
insert into participates values (1, 3);
insert into participates values (4, 2);

insert into registers values (1, 1);
insert into registers values (2, 1);
insert into registers values (1, 3);
insert into registers values (4, 2);

insert into game_game_type values (1, 'Small');
insert into game_game_type values (1, 'Medium');
insert into game_game_type values (1, 'Large');
insert into game_game_type values (4, 'Test Type');