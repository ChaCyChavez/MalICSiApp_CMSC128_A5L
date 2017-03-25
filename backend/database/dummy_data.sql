use malicsi;

insert into account values (NULL, 'Ken', 'Timothy', 'Mercado', 'admin@gmail.com', 'ken', 'pass', 'bscs', CURDATE(), 'CAS', true, true, NULL, true, 1, NULL);
insert into account values (NULL, 'Juan', 'Dela', 'Cruz', 'gamehead@gmail.com', 'juan', 'pass', 'bscs', CURDATE(), 'CEAT', true, true, NULL, false, NULL, NULL);
insert into account values (NULL, 'Christian', 'Timothy', 'Grey', 'player@gmail.com', 'christian', 'pass', 'bscs', CURDATE(), 'CAS', true, false, NULL, true, 2, NULL);
insert into account values (NULL, 'David', 'Nix', 'Main', 'regular@gmail.com', 'david', 'pass', 'bscs', CURDATE(), 'CAS', true, false, NULL, false, NULL, NULL);

insert into game_event values (NULL, 'Game 1', CURDATE(), CURDATE(), 1);
insert into game_event values (NULL, 'Game 2', CURDATE(), CURDATE(), 1);
insert into game_event values (NULL, 'Game 3', CURDATE(), CURDATE(), 2);
insert into game_event values (NULL, 'Game 4', CURDATE(), CURDATE(), 3);

insert into team values (NULL, 'Blue Job', 'Blue', 'Clinton');
insert into team values (NULL, 'Red Job', 'Red', 'Clinton');
insert into team values (NULL, 'Green Job', 'Green', 'Clinton');
insert into team values (NULL, 'White Job', 'White', 'Clinton');

insert into log values (NULL, 'Sample Log 2', 1, NULL);
insert into log values (NULL, 'Sample Log 3', 2, NULL);
insert into log values (NULL, 'Sample Log 4', 3, NULL);
insert into log values (NULL, 'Sample Log 4', 4, NULL);

insert into court values (NULL, 'Baker Hall', 'UPLB', 'Gym');
insert into court values (NULL, 'Copeland', 'UPLB', 'Gym');
insert into court values (NULL, 'Physci', 'UPLB', 'Building');
insert into court values (NULL, 'Freedom Park', 'UPLB', 'Park');

insert into sponsor values (NULL, 'Ian', 'http://logos.com/logo2.png', 'Intel');
insert into sponsor values (NULL, 'Miles', 'http://logos.com/logo3.png', 'ACSS');
insert into sponsor values (NULL, 'Emy', 'http://logos.com/logo4.png', 'YSES');
insert into sponsor values (NULL, 'Maria', 'http://logos.com/logo2.png', 'COSS');

insert into sport values (NULL, 'Volleyball', 'men', 1);
insert into sport values (NULL, 'Volleyball', 'men', 2);
insert into sport values (NULL, 'Volleyball', 'men', 3);
insert into sport values (NULL, 'Volleyball', 'men', 4);

insert into match_event values (NULL, true, CURDATE(), 'elimination', 1, 2);
insert into match_event values (NULL, true, CURDATE(), 'semi-finals', 1, 2);
insert into match_event values (NULL, true, CURDATE(), 'finals', 2, 1);
insert into match_event values (NULL, true, CURDATE(), 'finals', 2, 1);

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
