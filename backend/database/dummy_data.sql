use malicsi;

insert into account values (NULL, 'Ken', 'Timothy', 'Mercado', 'admin@gmail.com', 'ken', '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', 'BSCS', CURDATE(), 'CAS', true, true, NULL, true, 1, NULL, true);
insert into account values (NULL, 'Juan', 'Dela', 'Cruz', 'gamehead@gmail.com', 'juan', '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', 'BSCS', CURDATE(), 'CEAT', true, true, NULL, false, NULL, NULL, false);
insert into account values (NULL, 'Christian', 'Timothy', 'Grey', 'player@gmail.com', 'christian', '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', 'BSCS', CURDATE(), 'CAS', true, false, NULL, true, 2, NULL, false);
insert into account values (NULL, 'David', 'Nix', 'Main', 'regular@gmail.com', 'david', '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', 'BSCS', CURDATE(), 'CAS', true, false, NULL, false, NULL, NULL, false);

CALL add_game_event ('Game 1', CURDATE(), '2020-09-09', 1);
CALL add_game_event ('Game 2', CURDATE(), '2020-09-09', 2);
CALL add_game_event ('Game 3', CURDATE(), '2020-09-09', 1);
CALL add_game_event ('Game 4', CURDATE(), '2020-09-09', 3);

insert into team values (NULL, 'Blue Job', 'Blue');
insert into team values (NULL, 'Red Job',   'Red');
insert into team values (NULL, 'Green Job', 'Green');
insert into team values (NULL, 'White Job', 'White');
insert into team values (NULL, 'Purple Job', 'Purple');
insert into team values (NULL, 'Yellow Job', 'Yellow');
insert into team values (NULL, 'Orange Job', 'Orange');
insert into team values (NULL, 'Indigo Job', 'Indigo');

CALL add_sponsor ('Intel', 'http://logos.com/logo2.png', 'minor', 'desc1', 'web_add1',1);
CALL add_sponsor ('ACSS', 'http://logos.com/logo3.png',  'major', 'desc2', 'web_add2',2);
CALL add_sponsor ('YSES', 'http://logos.com/logo4.png', 'official partner', 'desc1', 'web_add1', 3);
CALL add_sponsor ('COSS', 'http://logos.com/logo2.png', 'major', 'desc1', 'web_add1',4);

insert into sport values (1, 'Volleyball', 'men',1,'osBCMnZ2XhiVU88yHrcMLn4pWIZxWob2qhuEmbuHIQQ=');
insert into sport values (2, 'Volleyball', 'women',1,'t5CwEVDwtUVt8h2oWfd1CGRAdBQP7ZYxFwK18g5LGFc=');
insert into sport values (3, 'Volleyball', 'mixed',1, 'YHeNIz/YO+UEK53LbE16T1MFAYHlkCwJ5KuiYdHa4rk=');
insert into sport values (4, 'Volleyball', 'men', 4,'DcbMRhh4wpKCZBpTaIIn4g98KMvd3yTbOvrdmpthCPY=');


insert into match_event values (1,true, CURDATE(), 'elimination', 1, 'Baker Hall', 'UPLB', 'Gym');
insert into match_event values (2,true, CURDATE(), 'elimination', 1, 'Copeland Gym','UPLB', 'Gym');
insert into match_event values (3,true, CURDATE(), 'elimination', 1, 'Physci Building', 'UPLB', 'Building');
insert into match_event values (4,true, CURDATE(), 'elimination', 1, 'Freedom Park', 'UPLB', 'Park');

insert into match_event values (5,true, CURDATE(), 'semi-finals', 1, 'Freedom Park', 'UPLB', 'Park');
insert into match_event values (6,true, CURDATE(), 'semi-finals', 1, 'Freedom Park', 'UPLB', 'Park');

insert into match_event values (7,true, CURDATE(), 'finals', 1,'Freedom Park', 'UPLB', 'Park');

-- matches for sport 2

insert into match_event values (8,true, CURDATE(), 'elimination', 2, 'Baker Hall', 'UPLB', 'Gym');
insert into match_event values (9,true, CURDATE(), 'elimination', 2, 'Baker Hall', 'UPLB', 'Gym');
insert into match_event values (10,true, CURDATE(), 'elimination', 2, 'Baker Hall', 'UPLB', 'Gym');
insert into match_event values (11,true, CURDATE(), 'elimination', 2, 'Baker Hall', 'UPLB', 'Gym');

insert into match_event values (12,true, CURDATE(), 'semi-finals', 2, 'Baker Hall', 'UPLB', 'Gym');
insert into match_event values (13,true, CURDATE(), 'semi-finals', 2, 'Baker Hall', 'UPLB', 'Gym');

insert into match_event values (14,true, CURDATE(), 'finals', 2, 'Baker Hall', 'UPLB', 'Gym');


-- matches for sport 2

insert into game_event_team values (1, 1);
insert into game_event_team values (2, 1);
insert into game_event_team values (3, 1);
insert into game_event_team values (4, 1);
insert into game_event_team values (5, 1);
insert into game_event_team values (6, 1);
insert into game_event_team values (7, 1);
insert into game_event_team values (8, 1);

insert into team_account values (1, 4);
insert into team_account values (2, 2);
insert into team_account values (3, 2);
insert into team_account values (4, 4);

-- insert into match_event_team values (2, 1, 12);
-- insert into match_event_team values (2, 2, 52);
-- insert into match_event_team values (3, 1, 44);
-- insert into match_event_team values (3, 3, 43);
-- insert into match_event_team values (4, 3, 12);

--  eliminations for sport 1
insert into match_event_team values (1, 1, 12);
insert into match_event_team values (2, 1, 3);
insert into match_event_team values (3, 2, 43);
insert into match_event_team values (4, 2, 12);
insert into match_event_team values (5, 3, 12);
insert into match_event_team values (6, 3, 1);
insert into match_event_team values (7, 4, 11);
insert into match_event_team values (8, 4, 3);

--  semis for sport 1
insert into match_event_team values (1, 5, 12);
insert into match_event_team values (3, 5, 1);
insert into match_event_team values (5, 6, 11);
insert into match_event_team values (7, 6, 3);

--  finals for sport 1
insert into match_event_team values (1, 7, 11);
insert into match_event_team values (5, 7, 3);



--  eliminations for sport 2
insert into match_event_team values (1, 8, 4);
insert into match_event_team values (2, 8, 5);
insert into match_event_team values (3, 9, 44);
insert into match_event_team values (4, 9, 8);
insert into match_event_team values (5, 10, 10);
insert into match_event_team values (6, 10, 11);
insert into match_event_team values (7, 11, 9);
insert into match_event_team values (8, 11, 13);

--  semis for sport 2
insert into match_event_team values (2, 12, 19);
insert into match_event_team values (3, 12, 3);
insert into match_event_team values (6, 13, 11);
insert into match_event_team values (8, 13, 13);

--  finals for sport 2
insert into match_event_team values (2, 14, 11);
insert into match_event_team values (8, 14, 3);
