use malicsi;

insert into account values (NULL, 'Ken', 'Timothy', 'Mercado', 'admin@gmail.com', 'ken', 'pass', 'bscs', CURDATE(), 'CAS', true, true, NULL, true, 1, NULL);
insert into account values (NULL, 'Juan', 'Dela', 'Cruz', 'gamehead@gmail.com', 'juan', 'pass', 'bscs', CURDATE(), 'CEAT', true, true, NULL, false, NULL, NULL);
insert into account values (NULL, 'Christian', 'Timothy', 'Grey', 'player@gmail.com', 'christian', 'pass', 'bscs', CURDATE(), 'CAS', true, false, NULL, true, 2, NULL);
insert into account values (NULL, 'David', 'Nix', 'Main', 'regular@gmail.com', 'david', 'pass', 'bscs', CURDATE(), 'CAS', true, false, NULL, false, NULL, NULL);

CALL add_game_event ('Game 1', CURDATE(), CURDATE(), 1);
CALL add_game_event ('Game 2', CURDATE(), CURDATE(), 2);
CALL add_game_event ('Game 3', CURDATE(), CURDATE(), 1);
CALL add_game_event ('Game 4', CURDATE(), CURDATE(), 3);

insert into team values (NULL, 'Blue Job', 'Blue');
insert into team values (NULL, 'Red Job', 'Red');
insert into team values (NULL, 'Green Job', 'Green');
insert into team values (NULL, 'White Job', 'White');

insert into activity_log values (NULL, 'Sample Log 1', 1, NULL);
insert into activity_log values (NULL, 'Sample Log 2', 2, NULL);
insert into activity_log values (NULL, 'Sample Log 3', 3, NULL);
insert into activity_log values (NULL, 'Sample Log 4', 4, NULL);

insert into court values (NULL, 'Baker Hall', 'UPLB', 'Gym');
insert into court values (NULL, 'Copeland', 'UPLB', 'Gym');
insert into court values (NULL, 'Physci', 'UPLB', 'Building');
insert into court values (NULL, 'Freedom Park', 'UPLB', 'Park');

CALL add_sponsor ('Ian', 'http://logos.com/logo2.png', 'Intel');
CALL add_sponsor ('Miles', 'http://logos.com/logo3.png', 'ACSS');
CALL add_sponsor ('Emy', 'http://logos.com/logo4.png', 'YSES');
CALL add_sponsor ('Maria', 'http://logos.com/logo2.png', 'COSS');

insert into sport values (1, 'Volleyball', 'men', 1);
insert into sport values (2, 'Volleyball', 'men', 2);
insert into sport values (3, 'Volleyball', 'men', 3);
insert into sport values (4, 'Volleyball', 'men', 4);

insert into match_event values (1,true, CURDATE(), 'elimination', 1, 2);
insert into match_event values (2,true, CURDATE(), 'semi-finals', 1, 2);
insert into match_event values (3,true, CURDATE(), 'finals', 2, 1);
insert into match_event values (4,true, CURDATE(), 'finals', 2, 1);

insert into game_event_sponsor values (1, 1, "Type 1");
insert into game_event_sponsor values (1, 2, "Type 2");
insert into game_event_sponsor values (3, 2, "Type 3");
insert into game_event_sponsor values (4, 2, "Type 2");
insert into game_event_sponsor values (2, 4, "Type 3");
insert into game_event_sponsor values (3, 3, "Type 2");
insert into game_event_sponsor values (2, 3, "Type 1");

insert into game_event_team values (1, 3);
insert into game_event_team values (2, 3);
insert into game_event_team values (1, 4);
insert into game_event_team values (3, 4);

insert into team_account values (1, 4);
insert into team_account values (2, 2);
insert into team_account values (3, 2);
insert into team_account values (4, 4);

insert into match_event_team values (2, 1, 12);
insert into match_event_team values (2, 2, 52);
insert into match_event_team values (3, 1, 44);
insert into match_event_team values (3, 3, 43);
insert into match_event_team values (4, 3, 12);
