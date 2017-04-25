USE malicsi;

delete from account;
/*
  create admin account
*/
  INSERT INTO account VALUES (
    NULL,                                           /*account_id*/
    'Admin',                                        /*firstname*/
    'MALicsI App',                                  /*middlename*/
    'Account',                                      /*lastname*/
    'admin@gmail.com',                              /*email*/
    'admin',                                        /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                      /*birthday*/
    'CAS',                                          /*college*/
    true,                                           /*is_approved*/
    true,                                           /*is_game_head*/
    'App admin',                                    /*position*/
    false,                                          /*is_player*/
    NULL,                                           /*player_jersey_num*/
    NULL,                                           /*player_role*/
    true                                            /*is_admin*/
  );
  /*
    create game_head accounts
  */
  CALL add_account(
    'Past Game Events',                             /*firstname*/
    'MALicsI App',                                  /*middlename*/
    'Game Head Account',                            /*lastname*/
    'past_game_events@gmail.com',                   /*email*/
    'past_game_events',                             /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                      /*birthday*/
    'CAS',                                          /*college*/
    true,                                           /*is_game_head*/
    'Game Head',                                    /*position*/
    true,                                           /*is_player*/
    '01',                                           /*player_jersey_num*/
    'Playing Coach'                                 /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Current Game Events',                          /*firstname*/
    'MALicsI App',                                  /*middlename*/
    'Game Head Account',                            /*lastname*/
    'current_game_events@gmail.com',                /*email*/
    'current_game_events',                          /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                      /*birthday*/
    'CAS',                                          /*college*/
    true,                                           /*is_game_head*/
    'Game Head',                                    /*position*/
    true,                                           /*is_player*/
    '02',                                           /*player_jersey_num*/
    'Playing Coach'                                 /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Upcoming Game Events',                         /*firstname*/
    'MALicsI App',                                  /*middlename*/
    'Game Head Account',                            /*lastname*/
    'upcoming_game_events@gmail.com',               /*email*/
    'upcoming_game_events',                         /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                      /*birthday*/
    'CAS',                                          /*college*/
    true,                                           /*is_game_head*/
    'Game Head',                                    /*position*/
    true,                                           /*is_player*/
    '03',                                           /*player_jersey_num*/
    'Playing Coach'                                 /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());


delete from game_event;
/*
  create game_events per game_head account:
    -one game_head for past_game_events
    -one game_head for current_game_events
    -one game_head for upcoming_game_events
*/
/*
  past_game_events
*/
    CALL add_game_event (
      'Game 1',                                                               /*game_name*/
      SUBDATE(NOW(), INTERVAL 10 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 8 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')    /*account_id*/
    );
    CALL add_game_event (
      'Game 2',                                                               /*game_name*/
      SUBDATE(NOW(), INTERVAL 9 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 7 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')    /*account_id*/
    );
    CALL add_game_event (
      'Game 3',                                                               /*game_name*/
      SUBDATE(NOW(), INTERVAL 8 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 6 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')    /*account_id*/
    );
    CALL add_game_event (
      'Game 4',                                                               /*game_name*/
      SUBDATE(NOW(), INTERVAL 7 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 5 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')    /*account_id*/
    );
    CALL add_game_event (
      'Game 5',                                                               /*game_name*/
      SUBDATE(NOW(), INTERVAL 6 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 4 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')    /*account_id*/
    );
    CALL add_game_event (
      'Game 6',                                                               /*game_name*/
      SUBDATE(NOW(), INTERVAL 5 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 3 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')    /*account_id*/
    );
    CALL add_game_event (
      'Game 7',                                                               /*game_name*/
      SUBDATE(NOW(), INTERVAL 4 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 2 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')    /*account_id*/
    );
    CALL add_game_event (
      'Game 8',                                                               /*game_name*/
      SUBDATE(NOW(), INTERVAL 3 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 1 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')    /*account_id*/
    );
/*
  current_game_events
*/
  CALL add_game_event (
    'Game 9',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 8 DAY),                                     /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 1 DAY),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 10',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 7 DAY),                                     /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 2 DAY),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 11',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 6 DAY),                                     /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 3 DAY),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 12',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 5 DAY),                                     /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 4 DAY),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 13',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 4 DAY),                                     /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 5 DAY),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 14',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 3 DAY),                                     /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 6 DAY),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 15',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 2 DAY),                                     /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 7 DAY),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 16',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 1 DAY),                                     /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 8 DAY),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
/*
  upcoming_game_events
*/
  CALL add_game_event (
    'Game 17',                                                              /*game_name*/
    ADDDATE(NOW(), INTERVAL 1 WEEK),                                    /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 3 WEEK),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 18',                                                              /*game_name*/
    ADDDATE(NOW(), INTERVAL 2 WEEK),                                    /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 4 WEEK),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 19',                                                              /*game_name*/
    ADDDATE(NOW(), INTERVAL 3 WEEK),                                    /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 5 WEEK),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 20',                                                              /*game_name*/
    ADDDATE(NOW(), INTERVAL 4 WEEK),                                    /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 6 WEEK),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 21',                                                              /*game_name*/
    ADDDATE(NOW(), INTERVAL 5 WEEK),                                    /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 7 WEEK),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 22',                                                              /*game_name*/
    ADDDATE(NOW(), INTERVAL 6 WEEK),                                    /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 8 WEEK),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 23',                                                              /*game_name*/
    ADDDATE(NOW(), INTERVAL 7 WEEK),                                    /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 9 WEEK),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 24',                                                              /*game_name*/
    ADDDATE(NOW(), INTERVAL 8 WEEK),                                    /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 10 WEEK),                                     /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );


delete from sponsor;
/*
  create sponsors of game_events
*/
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 1')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 1')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 1')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 1')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 2')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 2')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 2')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 2')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 3')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 3')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 3')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 3')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 4')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 4')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 4')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 4')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 5')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 5')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 5')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 5')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 6')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 6')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 6')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 6')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 7')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 7')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 7')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 7')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 8')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 8')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 8')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 8')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 9')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 9')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 9')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 9')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 10')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 10')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 10')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 10')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 11')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 11')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 11')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 11')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 12')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 12')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 12')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 12')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 13')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 13')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 13')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 13')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 14')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 14')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 14')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 14')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 15')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 15')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 15')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 15')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 16')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 16')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 16')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 16')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 17')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 17')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 17')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 17')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 18')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 18')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 18')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 18')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 19')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 19')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 19')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 19')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 20')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 20')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 20')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 20')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 21')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 21')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 21')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 21')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 22')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 22')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 22')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 22')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 23')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 23')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 23')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 23')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 24')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                      /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 24')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                      /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 24')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                      /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 24')   /*game_id*/
  );

delete from sport;
/*
  create sports of game_events
*/
INSERT INTO
  sport (sport_id, sport_type, division, game_id)
VALUES
  (1, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (2, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (3, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (4, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (5, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (6, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (7, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (8, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (9, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (10, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (11, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (12, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (13, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (14, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (15, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (16, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (17, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (18, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (19, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (20, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (21, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (22, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (23, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (24, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (25, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (26, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (27, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (28, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (29, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (30, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (31, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (32, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (33, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (34, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (35, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (36, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (37, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (38, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (39, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (40, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (41, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (42, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (43, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (44, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (45, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (46, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (47, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (48, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (49, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (50, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (51, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (52, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (53, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (54, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (55, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (56, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (57, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (58, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (59, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (60, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (61, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (62, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (63, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (64, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (65, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (66, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (67, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (68, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (69, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (70, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (71, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (72, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (73, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (74, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (75, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (76, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (77, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (78, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (79, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (80, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (81, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (82, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (83, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (84, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (85, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (86, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (87, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (88, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (89, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (90, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (91, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (92, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (93, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (94, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (95, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (96, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (97, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (98, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (99, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (100, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (101, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (102, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (103, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (104, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (105, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (106, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (107, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (108, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (109, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (110, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (111, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (112, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (113, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (114, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (115, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (116, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (117, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (118, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (119, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (120, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (121, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (122, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (123, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (124, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (125, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (126, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (127, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (128, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (129, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (130, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (131, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (132, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (133, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (134, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (135, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (136, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (137, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (138, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (139, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (140, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (141, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (142, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (143, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (144, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (145, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (146, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (147, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (148, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (149, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (150, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (151, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (152, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (153, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (154, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (155, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (156, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (157, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (158, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (159, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (160, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (161, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (162, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (163, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (164, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (165, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (166, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (167, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (168, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 24'));


delete from match_event;
/*
  create match_events per sport
*/
INSERT INTO
  match_event 
VALUES 
  (1,true, NOW(), 'elimination', 1, 'Baker Hall', 'UPLB', 'Gym'),
  (2,true, NOW(), 'elimination', 1, 'Copeland Gym','UPLB', 'Gym'),
  (3,true, NOW(), 'elimination', 1, 'Physci Building', 'UPLB', 'Building'),
  (4,true, NOW(), 'elimination', 1, 'Freedom Park', 'UPLB', 'Park'),
  (5,true, NOW(), 'semi-finals', 1, 'Freedom Park', 'UPLB', 'Park'),
  (6,true, NOW(), 'semi-finals', 1, 'Freedom Park', 'UPLB', 'Park'),
  (7,true, NOW(), 'finals', 1,'Freedom Park', 'UPLB', 'Park'),
  (8,true, NOW(), 'elimination', 2, 'Baker Hall', 'UPLB', 'Gym'),
  (9,true, NOW(), 'elimination', 2, 'Copeland Gym','UPLB', 'Gym'),
  (10,true, NOW(), 'elimination', 2, 'Physci Building', 'UPLB', 'Building'),
  (11,true, NOW(), 'elimination', 2, 'Freedom Park', 'UPLB', 'Park'),
  (12,true, NOW(), 'semi-finals', 2, 'Freedom Park', 'UPLB', 'Park'),
  (13,true, NOW(), 'semi-finals', 2, 'Freedom Park', 'UPLB', 'Park'),
  (14,true, NOW(), 'finals', 2,'Freedom Park', 'UPLB', 'Park'),
  (15,true, NOW(), 'elimination', 3, 'Baker Hall', 'UPLB', 'Gym'),
  (16,true, NOW(), 'elimination', 3, 'Copeland Gym','UPLB', 'Gym'),
  (17,true, NOW(), 'elimination', 3, 'Physci Building', 'UPLB', 'Building'),
  (18,true, NOW(), 'elimination', 3, 'Freedom Park', 'UPLB', 'Park'),
  (19,true, NOW(), 'semi-finals', 3, 'Freedom Park', 'UPLB', 'Park'),
  (20,true, NOW(), 'semi-finals', 3, 'Freedom Park', 'UPLB', 'Park'),
  (21,true, NOW(), 'finals', 3,'Freedom Park', 'UPLB', 'Park'),
  (22,true, NOW(), 'elimination', 4, 'Baker Hall', 'UPLB', 'Gym'),
  (23,true, NOW(), 'elimination', 4, 'Copeland Gym','UPLB', 'Gym'),
  (24,true, NOW(), 'elimination', 4, 'Physci Building', 'UPLB', 'Building'),
  (25,true, NOW(), 'elimination', 4, 'Freedom Park', 'UPLB', 'Park'),
  (26,true, NOW(), 'semi-finals', 4, 'Freedom Park', 'UPLB', 'Park'),
  (27,true, NOW(), 'semi-finals', 4, 'Freedom Park', 'UPLB', 'Park'),
  (28,true, NOW(), 'finals', 4,'Freedom Park', 'UPLB', 'Park'),
  (29,true, NOW(), 'elimination', 5, 'Baker Hall', 'UPLB', 'Gym'),
  (30,true, NOW(), 'elimination', 5, 'Copeland Gym','UPLB', 'Gym'),
  (31,true, NOW(), 'elimination', 5, 'Physci Building', 'UPLB', 'Building'),
  (32,true, NOW(), 'elimination', 5, 'Freedom Park', 'UPLB', 'Park'),
  (33,true, NOW(), 'semi-finals', 5, 'Freedom Park', 'UPLB', 'Park'),
  (34,true, NOW(), 'semi-finals', 5, 'Freedom Park', 'UPLB', 'Park'),
  (35,true, NOW(), 'finals', 5,'Freedom Park', 'UPLB', 'Park'),
  (36,true, NOW(), 'elimination', 6, 'Baker Hall', 'UPLB', 'Gym'),
  (37,true, NOW(), 'elimination', 6, 'Copeland Gym','UPLB', 'Gym'),
  (38,true, NOW(), 'elimination', 6, 'Physci Building', 'UPLB', 'Building'),
  (39,true, NOW(), 'elimination', 6, 'Freedom Park', 'UPLB', 'Park'),
  (40,true, NOW(), 'semi-finals', 6, 'Freedom Park', 'UPLB', 'Park'),
  (41,true, NOW(), 'semi-finals', 6, 'Freedom Park', 'UPLB', 'Park'),
  (42,true, NOW(), 'finals', 6,'Freedom Park', 'UPLB', 'Park'),
  (43,true, NOW(), 'elimination', 7, 'Baker Hall', 'UPLB', 'Gym'),
  (44,true, NOW(), 'elimination', 7, 'Copeland Gym','UPLB', 'Gym'),
  (45,true, NOW(), 'elimination', 7, 'Physci Building', 'UPLB', 'Building'),
  (46,true, NOW(), 'elimination', 7, 'Freedom Park', 'UPLB', 'Park'),
  (47,true, NOW(), 'semi-finals', 7, 'Freedom Park', 'UPLB', 'Park'),
  (48,true, NOW(), 'semi-finals', 7, 'Freedom Park', 'UPLB', 'Park'),
  (49,true, NOW(), 'finals', 7,'Freedom Park', 'UPLB', 'Park'),
  (50,true, NOW(), 'elimination', 8, 'Baker Hall', 'UPLB', 'Gym'),
  (51,true, NOW(), 'elimination', 8, 'Copeland Gym','UPLB', 'Gym'),
  (52,true, NOW(), 'elimination', 8, 'Physci Building', 'UPLB', 'Building'),
  (53,true, NOW(), 'elimination', 8, 'Freedom Park', 'UPLB', 'Park'),
  (54,true, NOW(), 'semi-finals', 8, 'Freedom Park', 'UPLB', 'Park'),
  (55,true, NOW(), 'semi-finals', 8, 'Freedom Park', 'UPLB', 'Park'),
  (56,true, NOW(), 'finals', 8,'Freedom Park', 'UPLB', 'Park'),
  (57,true, NOW(), 'elimination', 9, 'Baker Hall', 'UPLB', 'Gym'),
  (58,true, NOW(), 'elimination', 9, 'Copeland Gym','UPLB', 'Gym'),
  (59,true, NOW(), 'elimination', 9, 'Physci Building', 'UPLB', 'Building'),
  (60,true, NOW(), 'elimination', 9, 'Freedom Park', 'UPLB', 'Park'),
  (61,true, NOW(), 'semi-finals', 9, 'Freedom Park', 'UPLB', 'Park'),
  (62,true, NOW(), 'semi-finals', 9, 'Freedom Park', 'UPLB', 'Park'),
  (63,true, NOW(), 'finals', 9,'Freedom Park', 'UPLB', 'Park'),
  (64,true, NOW(), 'elimination', 10, 'Baker Hall', 'UPLB', 'Gym'),
  (65,true, NOW(), 'elimination', 10, 'Copeland Gym','UPLB', 'Gym'),
  (66,true, NOW(), 'elimination', 10, 'Physci Building', 'UPLB', 'Building'),
  (67,true, NOW(), 'elimination', 10, 'Freedom Park', 'UPLB', 'Park'),
  (68,true, NOW(), 'semi-finals', 10, 'Freedom Park', 'UPLB', 'Park'),
  (69,true, NOW(), 'semi-finals', 10, 'Freedom Park', 'UPLB', 'Park'),
  (70,true, NOW(), 'finals', 10,'Freedom Park', 'UPLB', 'Park'),
  (71,true, NOW(), 'elimination', 11, 'Baker Hall', 'UPLB', 'Gym'),
  (72,true, NOW(), 'elimination', 11, 'Copeland Gym','UPLB', 'Gym'),
  (73,true, NOW(), 'elimination', 11, 'Physci Building', 'UPLB', 'Building'),
  (74,true, NOW(), 'elimination', 11, 'Freedom Park', 'UPLB', 'Park'),
  (75,true, NOW(), 'semi-finals', 11, 'Freedom Park', 'UPLB', 'Park'),
  (76,true, NOW(), 'semi-finals', 11, 'Freedom Park', 'UPLB', 'Park'),
  (77,true, NOW(), 'finals', 11,'Freedom Park', 'UPLB', 'Park'),
  (78,true, NOW(), 'elimination', 12, 'Baker Hall', 'UPLB', 'Gym'),
  (79,true, NOW(), 'elimination', 12, 'Copeland Gym','UPLB', 'Gym'),
  (80,true, NOW(), 'elimination', 12, 'Physci Building', 'UPLB', 'Building'),
  (81,true, NOW(), 'elimination', 12, 'Freedom Park', 'UPLB', 'Park'),
  (82,true, NOW(), 'semi-finals', 12, 'Freedom Park', 'UPLB', 'Park'),
  (83,true, NOW(), 'semi-finals', 12, 'Freedom Park', 'UPLB', 'Park'),
  (84,true, NOW(), 'finals', 12,'Freedom Park', 'UPLB', 'Park'),
  (85,true, NOW(), 'elimination', 13, 'Baker Hall', 'UPLB', 'Gym'),
  (86,true, NOW(), 'elimination', 13, 'Copeland Gym','UPLB', 'Gym'),
  (87,true, NOW(), 'elimination', 13, 'Physci Building', 'UPLB', 'Building'),
  (88,true, NOW(), 'elimination', 13, 'Freedom Park', 'UPLB', 'Park'),
  (89,true, NOW(), 'semi-finals', 13, 'Freedom Park', 'UPLB', 'Park'),
  (90,true, NOW(), 'semi-finals', 13, 'Freedom Park', 'UPLB', 'Park'),
  (91,true, NOW(), 'finals', 13,'Freedom Park', 'UPLB', 'Park'),
  (92,true, NOW(), 'elimination', 14, 'Baker Hall', 'UPLB', 'Gym'),
  (93,true, NOW(), 'elimination', 14, 'Copeland Gym','UPLB', 'Gym'),
  (94,true, NOW(), 'elimination', 14, 'Physci Building', 'UPLB', 'Building'),
  (95,true, NOW(), 'elimination', 14, 'Freedom Park', 'UPLB', 'Park'),
  (96,true, NOW(), 'semi-finals', 14, 'Freedom Park', 'UPLB', 'Park'),
  (97,true, NOW(), 'semi-finals', 14, 'Freedom Park', 'UPLB', 'Park'),
  (98,true, NOW(), 'finals', 14,'Freedom Park', 'UPLB', 'Park'),
  (99,true, NOW(), 'elimination', 15, 'Baker Hall', 'UPLB', 'Gym'),
  (100,true, NOW(), 'elimination', 15, 'Copeland Gym','UPLB', 'Gym'),
  (101,true, NOW(), 'elimination', 15, 'Physci Building', 'UPLB', 'Building'),
  (102,true, NOW(), 'elimination', 15, 'Freedom Park', 'UPLB', 'Park'),
  (103,true, NOW(), 'semi-finals', 15, 'Freedom Park', 'UPLB', 'Park'),
  (104,true, NOW(), 'semi-finals', 15, 'Freedom Park', 'UPLB', 'Park'),
  (105,true, NOW(), 'finals', 15,'Freedom Park', 'UPLB', 'Park'),
  (106,true, NOW(), 'elimination', 16, 'Baker Hall', 'UPLB', 'Gym'),
  (107,true, NOW(), 'elimination', 16, 'Copeland Gym','UPLB', 'Gym'),
  (108,true, NOW(), 'elimination', 16, 'Physci Building', 'UPLB', 'Building'),
  (109,true, NOW(), 'elimination', 16, 'Freedom Park', 'UPLB', 'Park'),
  (110,true, NOW(), 'semi-finals', 16, 'Freedom Park', 'UPLB', 'Park'),
  (111,true, NOW(), 'semi-finals', 16, 'Freedom Park', 'UPLB', 'Park'),
  (112,true, NOW(), 'finals', 16,'Freedom Park', 'UPLB', 'Park'),
  (113,true, NOW(), 'elimination', 17, 'Baker Hall', 'UPLB', 'Gym'),
  (114,true, NOW(), 'elimination', 17, 'Copeland Gym','UPLB', 'Gym'),
  (115,true, NOW(), 'elimination', 17, 'Physci Building', 'UPLB', 'Building'),
  (116,true, NOW(), 'elimination', 17, 'Freedom Park', 'UPLB', 'Park'),
  (117,true, NOW(), 'semi-finals', 17, 'Freedom Park', 'UPLB', 'Park'),
  (118,true, NOW(), 'semi-finals', 17, 'Freedom Park', 'UPLB', 'Park'),
  (119,true, NOW(), 'finals', 17,'Freedom Park', 'UPLB', 'Park'),
  (120,true, NOW(), 'elimination', 18, 'Baker Hall', 'UPLB', 'Gym'),
  (121,true, NOW(), 'elimination', 18, 'Copeland Gym','UPLB', 'Gym'),
  (122,true, NOW(), 'elimination', 18, 'Physci Building', 'UPLB', 'Building'),
  (123,true, NOW(), 'elimination', 18, 'Freedom Park', 'UPLB', 'Park'),
  (124,true, NOW(), 'semi-finals', 18, 'Freedom Park', 'UPLB', 'Park'),
  (125,true, NOW(), 'semi-finals', 18, 'Freedom Park', 'UPLB', 'Park'),
  (126,true, NOW(), 'finals', 18,'Freedom Park', 'UPLB', 'Park'),
  (127,true, NOW(), 'elimination', 19, 'Baker Hall', 'UPLB', 'Gym'),
  (128,true, NOW(), 'elimination', 19, 'Copeland Gym','UPLB', 'Gym'),
  (129,true, NOW(), 'elimination', 19, 'Physci Building', 'UPLB', 'Building'),
  (130,true, NOW(), 'elimination', 19, 'Freedom Park', 'UPLB', 'Park'),
  (131,true, NOW(), 'semi-finals', 19, 'Freedom Park', 'UPLB', 'Park'),
  (132,true, NOW(), 'semi-finals', 19, 'Freedom Park', 'UPLB', 'Park'),
  (133,true, NOW(), 'finals', 19,'Freedom Park', 'UPLB', 'Park'),
  (134,true, NOW(), 'elimination', 20, 'Baker Hall', 'UPLB', 'Gym'),
  (135,true, NOW(), 'elimination', 20, 'Copeland Gym','UPLB', 'Gym'),
  (136,true, NOW(), 'elimination', 20, 'Physci Building', 'UPLB', 'Building'),
  (137,true, NOW(), 'elimination', 20, 'Freedom Park', 'UPLB', 'Park'),
  (138,true, NOW(), 'semi-finals', 20, 'Freedom Park', 'UPLB', 'Park'),
  (139,true, NOW(), 'semi-finals', 20, 'Freedom Park', 'UPLB', 'Park'),
  (140,true, NOW(), 'finals', 20,'Freedom Park', 'UPLB', 'Park'),
  (141,true, NOW(), 'elimination', 21, 'Baker Hall', 'UPLB', 'Gym'),
  (142,true, NOW(), 'elimination', 21, 'Copeland Gym','UPLB', 'Gym'),
  (143,true, NOW(), 'elimination', 21, 'Physci Building', 'UPLB', 'Building'),
  (144,true, NOW(), 'elimination', 21, 'Freedom Park', 'UPLB', 'Park'),
  (145,true, NOW(), 'semi-finals', 21, 'Freedom Park', 'UPLB', 'Park'),
  (146,true, NOW(), 'semi-finals', 21, 'Freedom Park', 'UPLB', 'Park'),
  (147,true, NOW(), 'finals', 21,'Freedom Park', 'UPLB', 'Park'),
  (148,true, NOW(), 'elimination', 22, 'Baker Hall', 'UPLB', 'Gym'),
  (149,true, NOW(), 'elimination', 22, 'Copeland Gym','UPLB', 'Gym'),
  (150,true, NOW(), 'elimination', 22, 'Physci Building', 'UPLB', 'Building'),
  (151,true, NOW(), 'elimination', 22, 'Freedom Park', 'UPLB', 'Park'),
  (152,true, NOW(), 'semi-finals', 22, 'Freedom Park', 'UPLB', 'Park'),
  (153,true, NOW(), 'semi-finals', 22, 'Freedom Park', 'UPLB', 'Park'),
  (154,true, NOW(), 'finals', 22,'Freedom Park', 'UPLB', 'Park'),
  (155,true, NOW(), 'elimination', 23, 'Baker Hall', 'UPLB', 'Gym'),
  (156,true, NOW(), 'elimination', 23, 'Copeland Gym','UPLB', 'Gym'),
  (157,true, NOW(), 'elimination', 23, 'Physci Building', 'UPLB', 'Building'),
  (158,true, NOW(), 'elimination', 23, 'Freedom Park', 'UPLB', 'Park'),
  (159,true, NOW(), 'semi-finals', 23, 'Freedom Park', 'UPLB', 'Park'),
  (160,true, NOW(), 'semi-finals', 23, 'Freedom Park', 'UPLB', 'Park'),
  (161,true, NOW(), 'finals', 23,'Freedom Park', 'UPLB', 'Park'),
  (162,true, NOW(), 'elimination', 24, 'Baker Hall', 'UPLB', 'Gym'),
  (163,true, NOW(), 'elimination', 24, 'Copeland Gym','UPLB', 'Gym'),
  (164,true, NOW(), 'elimination', 24, 'Physci Building', 'UPLB', 'Building'),
  (165,true, NOW(), 'elimination', 24, 'Freedom Park', 'UPLB', 'Park'),
  (166,true, NOW(), 'semi-finals', 24, 'Freedom Park', 'UPLB', 'Park'),
  (167,true, NOW(), 'semi-finals', 24, 'Freedom Park', 'UPLB', 'Park'),
  (168,true, NOW(), 'finals', 24,'Freedom Park', 'UPLB', 'Park'),
  (169,true, NOW(), 'elimination', 25, 'Baker Hall', 'UPLB', 'Gym'),
  (170,true, NOW(), 'elimination', 25, 'Copeland Gym','UPLB', 'Gym'),
  (171,true, NOW(), 'elimination', 25, 'Physci Building', 'UPLB', 'Building'),
  (172,true, NOW(), 'elimination', 25, 'Freedom Park', 'UPLB', 'Park'),
  (173,true, NOW(), 'semi-finals', 25, 'Freedom Park', 'UPLB', 'Park'),
  (174,true, NOW(), 'semi-finals', 25, 'Freedom Park', 'UPLB', 'Park'),
  (175,true, NOW(), 'finals', 25,'Freedom Park', 'UPLB', 'Park'),
  (176,true, NOW(), 'elimination', 26, 'Baker Hall', 'UPLB', 'Gym'),
  (177,true, NOW(), 'elimination', 26, 'Copeland Gym','UPLB', 'Gym'),
  (178,true, NOW(), 'elimination', 26, 'Physci Building', 'UPLB', 'Building'),
  (179,true, NOW(), 'elimination', 26, 'Freedom Park', 'UPLB', 'Park'),
  (180,true, NOW(), 'semi-finals', 26, 'Freedom Park', 'UPLB', 'Park'),
  (181,true, NOW(), 'semi-finals', 26, 'Freedom Park', 'UPLB', 'Park'),
  (182,true, NOW(), 'finals', 26,'Freedom Park', 'UPLB', 'Park'),
  (183,true, NOW(), 'elimination', 27, 'Baker Hall', 'UPLB', 'Gym'),
  (184,true, NOW(), 'elimination', 27, 'Copeland Gym','UPLB', 'Gym'),
  (185,true, NOW(), 'elimination', 27, 'Physci Building', 'UPLB', 'Building'),
  (186,true, NOW(), 'elimination', 27, 'Freedom Park', 'UPLB', 'Park'),
  (187,true, NOW(), 'semi-finals', 27, 'Freedom Park', 'UPLB', 'Park'),
  (188,true, NOW(), 'semi-finals', 27, 'Freedom Park', 'UPLB', 'Park'),
  (189,true, NOW(), 'finals', 27,'Freedom Park', 'UPLB', 'Park'),
  (190,true, NOW(), 'elimination', 28, 'Baker Hall', 'UPLB', 'Gym'),
  (191,true, NOW(), 'elimination', 28, 'Copeland Gym','UPLB', 'Gym'),
  (192,true, NOW(), 'elimination', 28, 'Physci Building', 'UPLB', 'Building'),
  (193,true, NOW(), 'elimination', 28, 'Freedom Park', 'UPLB', 'Park'),
  (194,true, NOW(), 'semi-finals', 28, 'Freedom Park', 'UPLB', 'Park'),
  (195,true, NOW(), 'semi-finals', 28, 'Freedom Park', 'UPLB', 'Park'),
  (196,true, NOW(), 'finals', 28,'Freedom Park', 'UPLB', 'Park'),
  (197,true, NOW(), 'elimination', 29, 'Baker Hall', 'UPLB', 'Gym'),
  (198,true, NOW(), 'elimination', 29, 'Copeland Gym','UPLB', 'Gym'),
  (199,true, NOW(), 'elimination', 29, 'Physci Building', 'UPLB', 'Building'),
  (200,true, NOW(), 'elimination', 29, 'Freedom Park', 'UPLB', 'Park'),
  (201,true, NOW(), 'semi-finals', 29, 'Freedom Park', 'UPLB', 'Park'),
  (202,true, NOW(), 'semi-finals', 29, 'Freedom Park', 'UPLB', 'Park'),
  (203,true, NOW(), 'finals', 29,'Freedom Park', 'UPLB', 'Park'),
  (204,true, NOW(), 'elimination', 30, 'Baker Hall', 'UPLB', 'Gym'),
  (205,true, NOW(), 'elimination', 30, 'Copeland Gym','UPLB', 'Gym'),
  (206,true, NOW(), 'elimination', 30, 'Physci Building', 'UPLB', 'Building'),
  (207,true, NOW(), 'elimination', 30, 'Freedom Park', 'UPLB', 'Park'),
  (208,true, NOW(), 'semi-finals', 30, 'Freedom Park', 'UPLB', 'Park'),
  (209,true, NOW(), 'semi-finals', 30, 'Freedom Park', 'UPLB', 'Park'),
  (210,true, NOW(), 'finals', 30,'Freedom Park', 'UPLB', 'Park'),
  (211,true, NOW(), 'elimination', 31, 'Baker Hall', 'UPLB', 'Gym'),
  (212,true, NOW(), 'elimination', 31, 'Copeland Gym','UPLB', 'Gym'),
  (213,true, NOW(), 'elimination', 31, 'Physci Building', 'UPLB', 'Building'),
  (214,true, NOW(), 'elimination', 31, 'Freedom Park', 'UPLB', 'Park'),
  (215,true, NOW(), 'semi-finals', 31, 'Freedom Park', 'UPLB', 'Park'),
  (216,true, NOW(), 'semi-finals', 31, 'Freedom Park', 'UPLB', 'Park'),
  (217,true, NOW(), 'finals', 31,'Freedom Park', 'UPLB', 'Park'),
  (218,true, NOW(), 'elimination', 32, 'Baker Hall', 'UPLB', 'Gym'),
  (219,true, NOW(), 'elimination', 32, 'Copeland Gym','UPLB', 'Gym'),
  (220,true, NOW(), 'elimination', 32, 'Physci Building', 'UPLB', 'Building'),
  (221,true, NOW(), 'elimination', 32, 'Freedom Park', 'UPLB', 'Park'),
  (222,true, NOW(), 'semi-finals', 32, 'Freedom Park', 'UPLB', 'Park'),
  (223,true, NOW(), 'semi-finals', 32, 'Freedom Park', 'UPLB', 'Park'),
  (224,true, NOW(), 'finals', 32,'Freedom Park', 'UPLB', 'Park'),
  (225,true, NOW(), 'elimination', 33, 'Baker Hall', 'UPLB', 'Gym'),
  (226,true, NOW(), 'elimination', 33, 'Copeland Gym','UPLB', 'Gym'),
  (227,true, NOW(), 'elimination', 33, 'Physci Building', 'UPLB', 'Building'),
  (228,true, NOW(), 'elimination', 33, 'Freedom Park', 'UPLB', 'Park'),
  (229,true, NOW(), 'semi-finals', 33, 'Freedom Park', 'UPLB', 'Park'),
  (230,true, NOW(), 'semi-finals', 33, 'Freedom Park', 'UPLB', 'Park'),
  (231,true, NOW(), 'finals', 33,'Freedom Park', 'UPLB', 'Park'),
  (232,true, NOW(), 'elimination', 34, 'Baker Hall', 'UPLB', 'Gym'),
  (233,true, NOW(), 'elimination', 34, 'Copeland Gym','UPLB', 'Gym'),
  (234,true, NOW(), 'elimination', 34, 'Physci Building', 'UPLB', 'Building'),
  (235,true, NOW(), 'elimination', 34, 'Freedom Park', 'UPLB', 'Park'),
  (236,true, NOW(), 'semi-finals', 34, 'Freedom Park', 'UPLB', 'Park'),
  (237,true, NOW(), 'semi-finals', 34, 'Freedom Park', 'UPLB', 'Park'),
  (238,true, NOW(), 'finals', 34,'Freedom Park', 'UPLB', 'Park'),
  (239,true, NOW(), 'elimination', 35, 'Baker Hall', 'UPLB', 'Gym'),
  (240,true, NOW(), 'elimination', 35, 'Copeland Gym','UPLB', 'Gym'),
  (241,true, NOW(), 'elimination', 35, 'Physci Building', 'UPLB', 'Building'),
  (242,true, NOW(), 'elimination', 35, 'Freedom Park', 'UPLB', 'Park'),
  (243,true, NOW(), 'semi-finals', 35, 'Freedom Park', 'UPLB', 'Park'),
  (244,true, NOW(), 'semi-finals', 35, 'Freedom Park', 'UPLB', 'Park'),
  (245,true, NOW(), 'finals', 35,'Freedom Park', 'UPLB', 'Park'),
  (246,true, NOW(), 'elimination', 36, 'Baker Hall', 'UPLB', 'Gym'),
  (247,true, NOW(), 'elimination', 36, 'Copeland Gym','UPLB', 'Gym'),
  (248,true, NOW(), 'elimination', 36, 'Physci Building', 'UPLB', 'Building'),
  (249,true, NOW(), 'elimination', 36, 'Freedom Park', 'UPLB', 'Park'),
  (250,true, NOW(), 'semi-finals', 36, 'Freedom Park', 'UPLB', 'Park'),
  (251,true, NOW(), 'semi-finals', 36, 'Freedom Park', 'UPLB', 'Park'),
  (252,true, NOW(), 'finals', 36,'Freedom Park', 'UPLB', 'Park'),
  (253,true, NOW(), 'elimination', 37, 'Baker Hall', 'UPLB', 'Gym'),
  (254,true, NOW(), 'elimination', 37, 'Copeland Gym','UPLB', 'Gym'),
  (255,true, NOW(), 'elimination', 37, 'Physci Building', 'UPLB', 'Building'),
  (256,true, NOW(), 'elimination', 37, 'Freedom Park', 'UPLB', 'Park'),
  (257,true, NOW(), 'semi-finals', 37, 'Freedom Park', 'UPLB', 'Park'),
  (258,true, NOW(), 'semi-finals', 37, 'Freedom Park', 'UPLB', 'Park'),
  (259,true, NOW(), 'finals', 37,'Freedom Park', 'UPLB', 'Park'),
  (260,true, NOW(), 'elimination', 38, 'Baker Hall', 'UPLB', 'Gym'),
  (261,true, NOW(), 'elimination', 38, 'Copeland Gym','UPLB', 'Gym'),
  (262,true, NOW(), 'elimination', 38, 'Physci Building', 'UPLB', 'Building'),
  (263,true, NOW(), 'elimination', 38, 'Freedom Park', 'UPLB', 'Park'),
  (264,true, NOW(), 'semi-finals', 38, 'Freedom Park', 'UPLB', 'Park'),
  (265,true, NOW(), 'semi-finals', 38, 'Freedom Park', 'UPLB', 'Park'),
  (266,true, NOW(), 'finals', 38,'Freedom Park', 'UPLB', 'Park'),
  (267,true, NOW(), 'elimination', 39, 'Baker Hall', 'UPLB', 'Gym'),
  (268,true, NOW(), 'elimination', 39, 'Copeland Gym','UPLB', 'Gym'),
  (269,true, NOW(), 'elimination', 39, 'Physci Building', 'UPLB', 'Building'),
  (270,true, NOW(), 'elimination', 39, 'Freedom Park', 'UPLB', 'Park'),
  (271,true, NOW(), 'semi-finals', 39, 'Freedom Park', 'UPLB', 'Park'),
  (272,true, NOW(), 'semi-finals', 39, 'Freedom Park', 'UPLB', 'Park'),
  (273,true, NOW(), 'finals', 39,'Freedom Park', 'UPLB', 'Park'),
  (274,true, NOW(), 'elimination', 40, 'Baker Hall', 'UPLB', 'Gym'),
  (275,true, NOW(), 'elimination', 40, 'Copeland Gym','UPLB', 'Gym'),
  (276,true, NOW(), 'elimination', 40, 'Physci Building', 'UPLB', 'Building'),
  (277,true, NOW(), 'elimination', 40, 'Freedom Park', 'UPLB', 'Park'),
  (278,true, NOW(), 'semi-finals', 40, 'Freedom Park', 'UPLB', 'Park'),
  (279,true, NOW(), 'semi-finals', 40, 'Freedom Park', 'UPLB', 'Park'),
  (280,true, NOW(), 'finals', 40,'Freedom Park', 'UPLB', 'Park'),
  (281,true, NOW(), 'elimination', 41, 'Baker Hall', 'UPLB', 'Gym'),
  (282,true, NOW(), 'elimination', 41, 'Copeland Gym','UPLB', 'Gym'),
  (283,true, NOW(), 'elimination', 41, 'Physci Building', 'UPLB', 'Building'),
  (284,true, NOW(), 'elimination', 41, 'Freedom Park', 'UPLB', 'Park'),
  (285,true, NOW(), 'semi-finals', 41, 'Freedom Park', 'UPLB', 'Park'),
  (286,true, NOW(), 'semi-finals', 41, 'Freedom Park', 'UPLB', 'Park'),
  (287,true, NOW(), 'finals', 41,'Freedom Park', 'UPLB', 'Park'),
  (288,true, NOW(), 'elimination', 42, 'Baker Hall', 'UPLB', 'Gym'),
  (289,true, NOW(), 'elimination', 42, 'Copeland Gym','UPLB', 'Gym'),
  (290,true, NOW(), 'elimination', 42, 'Physci Building', 'UPLB', 'Building'),
  (291,true, NOW(), 'elimination', 42, 'Freedom Park', 'UPLB', 'Park'),
  (292,true, NOW(), 'semi-finals', 42, 'Freedom Park', 'UPLB', 'Park'),
  (293,true, NOW(), 'semi-finals', 42, 'Freedom Park', 'UPLB', 'Park'),
  (294,true, NOW(), 'finals', 42,'Freedom Park', 'UPLB', 'Park'),
  (295,true, NOW(), 'elimination', 43, 'Baker Hall', 'UPLB', 'Gym'),
  (296,true, NOW(), 'elimination', 43, 'Copeland Gym','UPLB', 'Gym'),
  (297,true, NOW(), 'elimination', 43, 'Physci Building', 'UPLB', 'Building'),
  (298,true, NOW(), 'elimination', 43, 'Freedom Park', 'UPLB', 'Park'),
  (299,true, NOW(), 'semi-finals', 43, 'Freedom Park', 'UPLB', 'Park'),
  (300,true, NOW(), 'semi-finals', 43, 'Freedom Park', 'UPLB', 'Park'),
  (301,true, NOW(), 'finals', 43,'Freedom Park', 'UPLB', 'Park'),
  (302,true, NOW(), 'elimination', 44, 'Baker Hall', 'UPLB', 'Gym'),
  (303,true, NOW(), 'elimination', 44, 'Copeland Gym','UPLB', 'Gym'),
  (304,true, NOW(), 'elimination', 44, 'Physci Building', 'UPLB', 'Building'),
  (305,true, NOW(), 'elimination', 44, 'Freedom Park', 'UPLB', 'Park'),
  (306,true, NOW(), 'semi-finals', 44, 'Freedom Park', 'UPLB', 'Park'),
  (307,true, NOW(), 'semi-finals', 44, 'Freedom Park', 'UPLB', 'Park'),
  (308,true, NOW(), 'finals', 44,'Freedom Park', 'UPLB', 'Park'),
  (309,true, NOW(), 'elimination', 45, 'Baker Hall', 'UPLB', 'Gym'),
  (310,true, NOW(), 'elimination', 45, 'Copeland Gym','UPLB', 'Gym'),
  (311,true, NOW(), 'elimination', 45, 'Physci Building', 'UPLB', 'Building'),
  (312,true, NOW(), 'elimination', 45, 'Freedom Park', 'UPLB', 'Park'),
  (313,true, NOW(), 'semi-finals', 45, 'Freedom Park', 'UPLB', 'Park'),
  (314,true, NOW(), 'semi-finals', 45, 'Freedom Park', 'UPLB', 'Park'),
  (315,true, NOW(), 'finals', 45,'Freedom Park', 'UPLB', 'Park'),
  (316,true, NOW(), 'elimination', 46, 'Baker Hall', 'UPLB', 'Gym'),
  (317,true, NOW(), 'elimination', 46, 'Copeland Gym','UPLB', 'Gym'),
  (318,true, NOW(), 'elimination', 46, 'Physci Building', 'UPLB', 'Building'),
  (319,true, NOW(), 'elimination', 46, 'Freedom Park', 'UPLB', 'Park'),
  (320,true, NOW(), 'semi-finals', 46, 'Freedom Park', 'UPLB', 'Park'),
  (321,true, NOW(), 'semi-finals', 46, 'Freedom Park', 'UPLB', 'Park'),
  (322,true, NOW(), 'finals', 46,'Freedom Park', 'UPLB', 'Park'),
  (323,true, NOW(), 'elimination', 47, 'Baker Hall', 'UPLB', 'Gym'),
  (324,true, NOW(), 'elimination', 47, 'Copeland Gym','UPLB', 'Gym'),
  (325,true, NOW(), 'elimination', 47, 'Physci Building', 'UPLB', 'Building'),
  (326,true, NOW(), 'elimination', 47, 'Freedom Park', 'UPLB', 'Park'),
  (327,true, NOW(), 'semi-finals', 47, 'Freedom Park', 'UPLB', 'Park'),
  (328,true, NOW(), 'semi-finals', 47, 'Freedom Park', 'UPLB', 'Park'),
  (329,true, NOW(), 'finals', 47,'Freedom Park', 'UPLB', 'Park'),
  (330,true, NOW(), 'elimination', 48, 'Baker Hall', 'UPLB', 'Gym'),
  (331,true, NOW(), 'elimination', 48, 'Copeland Gym','UPLB', 'Gym'),
  (332,true, NOW(), 'elimination', 48, 'Physci Building', 'UPLB', 'Building'),
  (333,true, NOW(), 'elimination', 48, 'Freedom Park', 'UPLB', 'Park'),
  (334,true, NOW(), 'semi-finals', 48, 'Freedom Park', 'UPLB', 'Park'),
  (335,true, NOW(), 'semi-finals', 48, 'Freedom Park', 'UPLB', 'Park'),
  (336,true, NOW(), 'finals', 48,'Freedom Park', 'UPLB', 'Park'),
  (337,true, NOW(), 'elimination', 49, 'Baker Hall', 'UPLB', 'Gym'),
  (338,true, NOW(), 'elimination', 49, 'Copeland Gym','UPLB', 'Gym'),
  (339,true, NOW(), 'elimination', 49, 'Physci Building', 'UPLB', 'Building'),
  (340,true, NOW(), 'elimination', 49, 'Freedom Park', 'UPLB', 'Park'),
  (341,true, NOW(), 'semi-finals', 49, 'Freedom Park', 'UPLB', 'Park'),
  (342,true, NOW(), 'semi-finals', 49, 'Freedom Park', 'UPLB', 'Park'),
  (343,true, NOW(), 'finals', 49,'Freedom Park', 'UPLB', 'Park'),
  (344,true, NOW(), 'elimination', 50, 'Baker Hall', 'UPLB', 'Gym'),
  (345,true, NOW(), 'elimination', 50, 'Copeland Gym','UPLB', 'Gym'),
  (346,true, NOW(), 'elimination', 50, 'Physci Building', 'UPLB', 'Building'),
  (347,true, NOW(), 'elimination', 50, 'Freedom Park', 'UPLB', 'Park'),
  (348,true, NOW(), 'semi-finals', 50, 'Freedom Park', 'UPLB', 'Park'),
  (349,true, NOW(), 'semi-finals', 50, 'Freedom Park', 'UPLB', 'Park'),
  (350,true, NOW(), 'finals', 50,'Freedom Park', 'UPLB', 'Park'),
  (351,true, NOW(), 'elimination', 51, 'Baker Hall', 'UPLB', 'Gym'),
  (352,true, NOW(), 'elimination', 51, 'Copeland Gym','UPLB', 'Gym'),
  (353,true, NOW(), 'elimination', 51, 'Physci Building', 'UPLB', 'Building'),
  (354,true, NOW(), 'elimination', 51, 'Freedom Park', 'UPLB', 'Park'),
  (355,true, NOW(), 'semi-finals', 51, 'Freedom Park', 'UPLB', 'Park'),
  (356,true, NOW(), 'semi-finals', 51, 'Freedom Park', 'UPLB', 'Park'),
  (357,true, NOW(), 'finals', 51,'Freedom Park', 'UPLB', 'Park'),
  (358,true, NOW(), 'elimination', 52, 'Baker Hall', 'UPLB', 'Gym'),
  (359,true, NOW(), 'elimination', 52, 'Copeland Gym','UPLB', 'Gym'),
  (360,true, NOW(), 'elimination', 52, 'Physci Building', 'UPLB', 'Building'),
  (361,true, NOW(), 'elimination', 52, 'Freedom Park', 'UPLB', 'Park'),
  (362,true, NOW(), 'semi-finals', 52, 'Freedom Park', 'UPLB', 'Park'),
  (363,true, NOW(), 'semi-finals', 52, 'Freedom Park', 'UPLB', 'Park'),
  (364,true, NOW(), 'finals', 52,'Freedom Park', 'UPLB', 'Park'),
  (365,true, NOW(), 'elimination', 53, 'Baker Hall', 'UPLB', 'Gym'),
  (366,true, NOW(), 'elimination', 53, 'Copeland Gym','UPLB', 'Gym'),
  (367,true, NOW(), 'elimination', 53, 'Physci Building', 'UPLB', 'Building'),
  (368,true, NOW(), 'elimination', 53, 'Freedom Park', 'UPLB', 'Park'),
  (369,true, NOW(), 'semi-finals', 53, 'Freedom Park', 'UPLB', 'Park'),
  (370,true, NOW(), 'semi-finals', 53, 'Freedom Park', 'UPLB', 'Park'),
  (371,true, NOW(), 'finals', 53,'Freedom Park', 'UPLB', 'Park'),
  (372,true, NOW(), 'elimination', 54, 'Baker Hall', 'UPLB', 'Gym'),
  (373,true, NOW(), 'elimination', 54, 'Copeland Gym','UPLB', 'Gym'),
  (374,true, NOW(), 'elimination', 54, 'Physci Building', 'UPLB', 'Building'),
  (375,true, NOW(), 'elimination', 54, 'Freedom Park', 'UPLB', 'Park'),
  (376,true, NOW(), 'semi-finals', 54, 'Freedom Park', 'UPLB', 'Park'),
  (377,true, NOW(), 'semi-finals', 54, 'Freedom Park', 'UPLB', 'Park'),
  (378,true, NOW(), 'finals', 54,'Freedom Park', 'UPLB', 'Park'),
  (379,true, NOW(), 'elimination', 55, 'Baker Hall', 'UPLB', 'Gym'),
  (380,true, NOW(), 'elimination', 55, 'Copeland Gym','UPLB', 'Gym'),
  (381,true, NOW(), 'elimination', 55, 'Physci Building', 'UPLB', 'Building'),
  (382,true, NOW(), 'elimination', 55, 'Freedom Park', 'UPLB', 'Park'),
  (383,true, NOW(), 'semi-finals', 55, 'Freedom Park', 'UPLB', 'Park'),
  (384,true, NOW(), 'semi-finals', 55, 'Freedom Park', 'UPLB', 'Park'),
  (385,true, NOW(), 'finals', 55,'Freedom Park', 'UPLB', 'Park'),
  (386,true, NOW(), 'elimination', 56, 'Baker Hall', 'UPLB', 'Gym'),
  (387,true, NOW(), 'elimination', 56, 'Copeland Gym','UPLB', 'Gym'),
  (388,true, NOW(), 'elimination', 56, 'Physci Building', 'UPLB', 'Building'),
  (389,true, NOW(), 'elimination', 56, 'Freedom Park', 'UPLB', 'Park'),
  (390,true, NOW(), 'semi-finals', 56, 'Freedom Park', 'UPLB', 'Park'),
  (391,true, NOW(), 'semi-finals', 56, 'Freedom Park', 'UPLB', 'Park'),
  (392,true, NOW(), 'finals', 56,'Freedom Park', 'UPLB', 'Park'),
  (393,true, NOW(), 'elimination', 57, 'Baker Hall', 'UPLB', 'Gym'),
  (394,true, NOW(), 'elimination', 57, 'Copeland Gym','UPLB', 'Gym'),
  (395,true, NOW(), 'elimination', 57, 'Physci Building', 'UPLB', 'Building'),
  (396,true, NOW(), 'elimination', 57, 'Freedom Park', 'UPLB', 'Park'),
  (397,true, NOW(), 'semi-finals', 57, 'Freedom Park', 'UPLB', 'Park'),
  (398,true, NOW(), 'semi-finals', 57, 'Freedom Park', 'UPLB', 'Park'),
  (399,true, NOW(), 'finals', 57,'Freedom Park', 'UPLB', 'Park'),
  (400,true, NOW(), 'elimination', 58, 'Baker Hall', 'UPLB', 'Gym'),
  (401,true, NOW(), 'elimination', 58, 'Copeland Gym','UPLB', 'Gym'),
  (402,true, NOW(), 'elimination', 58, 'Physci Building', 'UPLB', 'Building'),
  (403,true, NOW(), 'elimination', 58, 'Freedom Park', 'UPLB', 'Park'),
  (404,true, NOW(), 'semi-finals', 58, 'Freedom Park', 'UPLB', 'Park'),
  (405,true, NOW(), 'semi-finals', 58, 'Freedom Park', 'UPLB', 'Park'),
  (406,true, NOW(), 'finals', 58,'Freedom Park', 'UPLB', 'Park'),
  (407,true, NOW(), 'elimination', 59, 'Baker Hall', 'UPLB', 'Gym'),
  (408,true, NOW(), 'elimination', 59, 'Copeland Gym','UPLB', 'Gym'),
  (409,true, NOW(), 'elimination', 59, 'Physci Building', 'UPLB', 'Building'),
  (410,true, NOW(), 'elimination', 59, 'Freedom Park', 'UPLB', 'Park'),
  (411,true, NOW(), 'semi-finals', 59, 'Freedom Park', 'UPLB', 'Park'),
  (412,true, NOW(), 'semi-finals', 59, 'Freedom Park', 'UPLB', 'Park'),
  (413,true, NOW(), 'finals', 59,'Freedom Park', 'UPLB', 'Park'),
  (414,true, NOW(), 'elimination', 60, 'Baker Hall', 'UPLB', 'Gym'),
  (415,true, NOW(), 'elimination', 60, 'Copeland Gym','UPLB', 'Gym'),
  (416,true, NOW(), 'elimination', 60, 'Physci Building', 'UPLB', 'Building'),
  (417,true, NOW(), 'elimination', 60, 'Freedom Park', 'UPLB', 'Park'),
  (418,true, NOW(), 'semi-finals', 60, 'Freedom Park', 'UPLB', 'Park'),
  (419,true, NOW(), 'semi-finals', 60, 'Freedom Park', 'UPLB', 'Park'),
  (420,true, NOW(), 'finals', 60,'Freedom Park', 'UPLB', 'Park'),
  (421,true, NOW(), 'elimination', 61, 'Baker Hall', 'UPLB', 'Gym'),
  (422,true, NOW(), 'elimination', 61, 'Copeland Gym','UPLB', 'Gym'),
  (423,true, NOW(), 'elimination', 61, 'Physci Building', 'UPLB', 'Building'),
  (424,true, NOW(), 'elimination', 61, 'Freedom Park', 'UPLB', 'Park'),
  (425,true, NOW(), 'semi-finals', 61, 'Freedom Park', 'UPLB', 'Park'),
  (426,true, NOW(), 'semi-finals', 61, 'Freedom Park', 'UPLB', 'Park'),
  (427,true, NOW(), 'finals', 61,'Freedom Park', 'UPLB', 'Park'),
  (428,true, NOW(), 'elimination', 62, 'Baker Hall', 'UPLB', 'Gym'),
  (429,true, NOW(), 'elimination', 62, 'Copeland Gym','UPLB', 'Gym'),
  (430,true, NOW(), 'elimination', 62, 'Physci Building', 'UPLB', 'Building'),
  (431,true, NOW(), 'elimination', 62, 'Freedom Park', 'UPLB', 'Park'),
  (432,true, NOW(), 'semi-finals', 62, 'Freedom Park', 'UPLB', 'Park'),
  (433,true, NOW(), 'semi-finals', 62, 'Freedom Park', 'UPLB', 'Park'),
  (434,true, NOW(), 'finals', 62,'Freedom Park', 'UPLB', 'Park'),
  (435,true, NOW(), 'elimination', 63, 'Baker Hall', 'UPLB', 'Gym'),
  (436,true, NOW(), 'elimination', 63, 'Copeland Gym','UPLB', 'Gym'),
  (437,true, NOW(), 'elimination', 63, 'Physci Building', 'UPLB', 'Building'),
  (438,true, NOW(), 'elimination', 63, 'Freedom Park', 'UPLB', 'Park'),
  (439,true, NOW(), 'semi-finals', 63, 'Freedom Park', 'UPLB', 'Park'),
  (440,true, NOW(), 'semi-finals', 63, 'Freedom Park', 'UPLB', 'Park'),
  (441,true, NOW(), 'finals', 63,'Freedom Park', 'UPLB', 'Park'),
  (442,true, NOW(), 'elimination', 64, 'Baker Hall', 'UPLB', 'Gym'),
  (443,true, NOW(), 'elimination', 64, 'Copeland Gym','UPLB', 'Gym'),
  (444,true, NOW(), 'elimination', 64, 'Physci Building', 'UPLB', 'Building'),
  (445,true, NOW(), 'elimination', 64, 'Freedom Park', 'UPLB', 'Park'),
  (446,true, NOW(), 'semi-finals', 64, 'Freedom Park', 'UPLB', 'Park'),
  (447,true, NOW(), 'semi-finals', 64, 'Freedom Park', 'UPLB', 'Park'),
  (448,true, NOW(), 'finals', 64,'Freedom Park', 'UPLB', 'Park'),
  (449,true, NOW(), 'elimination', 65, 'Baker Hall', 'UPLB', 'Gym'),
  (450,true, NOW(), 'elimination', 65, 'Copeland Gym','UPLB', 'Gym'),
  (451,true, NOW(), 'elimination', 65, 'Physci Building', 'UPLB', 'Building'),
  (452,true, NOW(), 'elimination', 65, 'Freedom Park', 'UPLB', 'Park'),
  (453,true, NOW(), 'semi-finals', 65, 'Freedom Park', 'UPLB', 'Park'),
  (454,true, NOW(), 'semi-finals', 65, 'Freedom Park', 'UPLB', 'Park'),
  (455,true, NOW(), 'finals', 65,'Freedom Park', 'UPLB', 'Park'),
  (456,true, NOW(), 'elimination', 66, 'Baker Hall', 'UPLB', 'Gym'),
  (457,true, NOW(), 'elimination', 66, 'Copeland Gym','UPLB', 'Gym'),
  (458,true, NOW(), 'elimination', 66, 'Physci Building', 'UPLB', 'Building'),
  (459,true, NOW(), 'elimination', 66, 'Freedom Park', 'UPLB', 'Park'),
  (460,true, NOW(), 'semi-finals', 66, 'Freedom Park', 'UPLB', 'Park'),
  (461,true, NOW(), 'semi-finals', 66, 'Freedom Park', 'UPLB', 'Park'),
  (462,true, NOW(), 'finals', 66,'Freedom Park', 'UPLB', 'Park'),
  (463,true, NOW(), 'elimination', 67, 'Baker Hall', 'UPLB', 'Gym'),
  (464,true, NOW(), 'elimination', 67, 'Copeland Gym','UPLB', 'Gym'),
  (465,true, NOW(), 'elimination', 67, 'Physci Building', 'UPLB', 'Building'),
  (466,true, NOW(), 'elimination', 67, 'Freedom Park', 'UPLB', 'Park'),
  (467,true, NOW(), 'semi-finals', 67, 'Freedom Park', 'UPLB', 'Park'),
  (468,true, NOW(), 'semi-finals', 67, 'Freedom Park', 'UPLB', 'Park'),
  (469,true, NOW(), 'finals', 67,'Freedom Park', 'UPLB', 'Park'),
  (470,true, NOW(), 'elimination', 68, 'Baker Hall', 'UPLB', 'Gym'),
  (471,true, NOW(), 'elimination', 68, 'Copeland Gym','UPLB', 'Gym'),
  (472,true, NOW(), 'elimination', 68, 'Physci Building', 'UPLB', 'Building'),
  (473,true, NOW(), 'elimination', 68, 'Freedom Park', 'UPLB', 'Park'),
  (474,true, NOW(), 'semi-finals', 68, 'Freedom Park', 'UPLB', 'Park'),
  (475,true, NOW(), 'semi-finals', 68, 'Freedom Park', 'UPLB', 'Park'),
  (476,true, NOW(), 'finals', 68,'Freedom Park', 'UPLB', 'Park'),
  (477,true, NOW(), 'elimination', 69, 'Baker Hall', 'UPLB', 'Gym'),
  (478,true, NOW(), 'elimination', 69, 'Copeland Gym','UPLB', 'Gym'),
  (479,true, NOW(), 'elimination', 69, 'Physci Building', 'UPLB', 'Building'),
  (480,true, NOW(), 'elimination', 69, 'Freedom Park', 'UPLB', 'Park'),
  (481,true, NOW(), 'semi-finals', 69, 'Freedom Park', 'UPLB', 'Park'),
  (482,true, NOW(), 'semi-finals', 69, 'Freedom Park', 'UPLB', 'Park'),
  (483,true, NOW(), 'finals', 69,'Freedom Park', 'UPLB', 'Park'),
  (484,true, NOW(), 'elimination', 70, 'Baker Hall', 'UPLB', 'Gym'),
  (485,true, NOW(), 'elimination', 70, 'Copeland Gym','UPLB', 'Gym'),
  (486,true, NOW(), 'elimination', 70, 'Physci Building', 'UPLB', 'Building'),
  (487,true, NOW(), 'elimination', 70, 'Freedom Park', 'UPLB', 'Park'),
  (488,true, NOW(), 'semi-finals', 70, 'Freedom Park', 'UPLB', 'Park'),
  (489,true, NOW(), 'semi-finals', 70, 'Freedom Park', 'UPLB', 'Park'),
  (490,true, NOW(), 'finals', 70,'Freedom Park', 'UPLB', 'Park'),
  (491,true, NOW(), 'elimination', 71, 'Baker Hall', 'UPLB', 'Gym'),
  (492,true, NOW(), 'elimination', 71, 'Copeland Gym','UPLB', 'Gym'),
  (493,true, NOW(), 'elimination', 71, 'Physci Building', 'UPLB', 'Building'),
  (494,true, NOW(), 'elimination', 71, 'Freedom Park', 'UPLB', 'Park'),
  (495,true, NOW(), 'semi-finals', 71, 'Freedom Park', 'UPLB', 'Park'),
  (496,true, NOW(), 'semi-finals', 71, 'Freedom Park', 'UPLB', 'Park'),
  (497,true, NOW(), 'finals', 71,'Freedom Park', 'UPLB', 'Park'),
  (498,true, NOW(), 'elimination', 72, 'Baker Hall', 'UPLB', 'Gym'),
  (499,true, NOW(), 'elimination', 72, 'Copeland Gym','UPLB', 'Gym'),
  (500,true, NOW(), 'elimination', 72, 'Physci Building', 'UPLB', 'Building'),
  (501,true, NOW(), 'elimination', 72, 'Freedom Park', 'UPLB', 'Park'),
  (502,true, NOW(), 'semi-finals', 72, 'Freedom Park', 'UPLB', 'Park'),
  (503,true, NOW(), 'semi-finals', 72, 'Freedom Park', 'UPLB', 'Park'),
  (504,true, NOW(), 'finals', 72,'Freedom Park', 'UPLB', 'Park'),
  (505,true, NOW(), 'elimination', 73, 'Baker Hall', 'UPLB', 'Gym'),
  (506,true, NOW(), 'elimination', 73, 'Copeland Gym','UPLB', 'Gym'),
  (507,true, NOW(), 'elimination', 73, 'Physci Building', 'UPLB', 'Building'),
  (508,true, NOW(), 'elimination', 73, 'Freedom Park', 'UPLB', 'Park'),
  (509,true, NOW(), 'semi-finals', 73, 'Freedom Park', 'UPLB', 'Park'),
  (510,true, NOW(), 'semi-finals', 73, 'Freedom Park', 'UPLB', 'Park'),
  (511,true, NOW(), 'finals', 73,'Freedom Park', 'UPLB', 'Park'),
  (512,true, NOW(), 'elimination', 74, 'Baker Hall', 'UPLB', 'Gym'),
  (513,true, NOW(), 'elimination', 74, 'Copeland Gym','UPLB', 'Gym'),
  (514,true, NOW(), 'elimination', 74, 'Physci Building', 'UPLB', 'Building'),
  (515,true, NOW(), 'elimination', 74, 'Freedom Park', 'UPLB', 'Park'),
  (516,true, NOW(), 'semi-finals', 74, 'Freedom Park', 'UPLB', 'Park'),
  (517,true, NOW(), 'semi-finals', 74, 'Freedom Park', 'UPLB', 'Park'),
  (518,true, NOW(), 'finals', 74,'Freedom Park', 'UPLB', 'Park'),
  (519,true, NOW(), 'elimination', 75, 'Baker Hall', 'UPLB', 'Gym'),
  (520,true, NOW(), 'elimination', 75, 'Copeland Gym','UPLB', 'Gym'),
  (521,true, NOW(), 'elimination', 75, 'Physci Building', 'UPLB', 'Building'),
  (522,true, NOW(), 'elimination', 75, 'Freedom Park', 'UPLB', 'Park'),
  (523,true, NOW(), 'semi-finals', 75, 'Freedom Park', 'UPLB', 'Park'),
  (524,true, NOW(), 'semi-finals', 75, 'Freedom Park', 'UPLB', 'Park'),
  (525,true, NOW(), 'finals', 75,'Freedom Park', 'UPLB', 'Park'),
  (526,true, NOW(), 'elimination', 76, 'Baker Hall', 'UPLB', 'Gym'),
  (527,true, NOW(), 'elimination', 76, 'Copeland Gym','UPLB', 'Gym'),
  (528,true, NOW(), 'elimination', 76, 'Physci Building', 'UPLB', 'Building'),
  (529,true, NOW(), 'elimination', 76, 'Freedom Park', 'UPLB', 'Park'),
  (530,true, NOW(), 'semi-finals', 76, 'Freedom Park', 'UPLB', 'Park'),
  (531,true, NOW(), 'semi-finals', 76, 'Freedom Park', 'UPLB', 'Park'),
  (532,true, NOW(), 'finals', 76,'Freedom Park', 'UPLB', 'Park'),
  (533,true, NOW(), 'elimination', 77, 'Baker Hall', 'UPLB', 'Gym'),
  (534,true, NOW(), 'elimination', 77, 'Copeland Gym','UPLB', 'Gym'),
  (535,true, NOW(), 'elimination', 77, 'Physci Building', 'UPLB', 'Building'),
  (536,true, NOW(), 'elimination', 77, 'Freedom Park', 'UPLB', 'Park'),
  (537,true, NOW(), 'semi-finals', 77, 'Freedom Park', 'UPLB', 'Park'),
  (538,true, NOW(), 'semi-finals', 77, 'Freedom Park', 'UPLB', 'Park'),
  (539,true, NOW(), 'finals', 77,'Freedom Park', 'UPLB', 'Park'),
  (540,true, NOW(), 'elimination', 78, 'Baker Hall', 'UPLB', 'Gym'),
  (541,true, NOW(), 'elimination', 78, 'Copeland Gym','UPLB', 'Gym'),
  (542,true, NOW(), 'elimination', 78, 'Physci Building', 'UPLB', 'Building'),
  (543,true, NOW(), 'elimination', 78, 'Freedom Park', 'UPLB', 'Park'),
  (544,true, NOW(), 'semi-finals', 78, 'Freedom Park', 'UPLB', 'Park'),
  (545,true, NOW(), 'semi-finals', 78, 'Freedom Park', 'UPLB', 'Park'),
  (546,true, NOW(), 'finals', 78,'Freedom Park', 'UPLB', 'Park'),
  (547,true, NOW(), 'elimination', 79, 'Baker Hall', 'UPLB', 'Gym'),
  (548,true, NOW(), 'elimination', 79, 'Copeland Gym','UPLB', 'Gym'),
  (549,true, NOW(), 'elimination', 79, 'Physci Building', 'UPLB', 'Building'),
  (550,true, NOW(), 'elimination', 79, 'Freedom Park', 'UPLB', 'Park'),
  (551,true, NOW(), 'semi-finals', 79, 'Freedom Park', 'UPLB', 'Park'),
  (552,true, NOW(), 'semi-finals', 79, 'Freedom Park', 'UPLB', 'Park'),
  (553,true, NOW(), 'finals', 79,'Freedom Park', 'UPLB', 'Park'),
  (554,true, NOW(), 'elimination', 80, 'Baker Hall', 'UPLB', 'Gym'),
  (555,true, NOW(), 'elimination', 80, 'Copeland Gym','UPLB', 'Gym'),
  (556,true, NOW(), 'elimination', 80, 'Physci Building', 'UPLB', 'Building'),
  (557,true, NOW(), 'elimination', 80, 'Freedom Park', 'UPLB', 'Park'),
  (558,true, NOW(), 'semi-finals', 80, 'Freedom Park', 'UPLB', 'Park'),
  (559,true, NOW(), 'semi-finals', 80, 'Freedom Park', 'UPLB', 'Park'),
  (560,true, NOW(), 'finals', 80,'Freedom Park', 'UPLB', 'Park'),
  (561,true, NOW(), 'elimination', 81, 'Baker Hall', 'UPLB', 'Gym'),
  (562,true, NOW(), 'elimination', 81, 'Copeland Gym','UPLB', 'Gym'),
  (563,true, NOW(), 'elimination', 81, 'Physci Building', 'UPLB', 'Building'),
  (564,true, NOW(), 'elimination', 81, 'Freedom Park', 'UPLB', 'Park'),
  (565,true, NOW(), 'semi-finals', 81, 'Freedom Park', 'UPLB', 'Park'),
  (566,true, NOW(), 'semi-finals', 81, 'Freedom Park', 'UPLB', 'Park'),
  (567,true, NOW(), 'finals', 81,'Freedom Park', 'UPLB', 'Park'),
  (568,true, NOW(), 'elimination', 82, 'Baker Hall', 'UPLB', 'Gym'),
  (569,true, NOW(), 'elimination', 82, 'Copeland Gym','UPLB', 'Gym'),
  (570,true, NOW(), 'elimination', 82, 'Physci Building', 'UPLB', 'Building'),
  (571,true, NOW(), 'elimination', 82, 'Freedom Park', 'UPLB', 'Park'),
  (572,true, NOW(), 'semi-finals', 82, 'Freedom Park', 'UPLB', 'Park'),
  (573,true, NOW(), 'semi-finals', 82, 'Freedom Park', 'UPLB', 'Park'),
  (574,true, NOW(), 'finals', 82,'Freedom Park', 'UPLB', 'Park'),
  (575,true, NOW(), 'elimination', 83, 'Baker Hall', 'UPLB', 'Gym'),
  (576,true, NOW(), 'elimination', 83, 'Copeland Gym','UPLB', 'Gym'),
  (577,true, NOW(), 'elimination', 83, 'Physci Building', 'UPLB', 'Building'),
  (578,true, NOW(), 'elimination', 83, 'Freedom Park', 'UPLB', 'Park'),
  (579,true, NOW(), 'semi-finals', 83, 'Freedom Park', 'UPLB', 'Park'),
  (580,true, NOW(), 'semi-finals', 83, 'Freedom Park', 'UPLB', 'Park'),
  (581,true, NOW(), 'finals', 83,'Freedom Park', 'UPLB', 'Park'),
  (582,true, NOW(), 'elimination', 84, 'Baker Hall', 'UPLB', 'Gym'),
  (583,true, NOW(), 'elimination', 84, 'Copeland Gym','UPLB', 'Gym'),
  (584,true, NOW(), 'elimination', 84, 'Physci Building', 'UPLB', 'Building'),
  (585,true, NOW(), 'elimination', 84, 'Freedom Park', 'UPLB', 'Park'),
  (586,true, NOW(), 'semi-finals', 84, 'Freedom Park', 'UPLB', 'Park'),
  (587,true, NOW(), 'semi-finals', 84, 'Freedom Park', 'UPLB', 'Park'),
  (588,true, NOW(), 'finals', 84,'Freedom Park', 'UPLB', 'Park'),
  (589,true, NOW(), 'elimination', 85, 'Baker Hall', 'UPLB', 'Gym'),
  (590,true, NOW(), 'elimination', 85, 'Copeland Gym','UPLB', 'Gym'),
  (591,true, NOW(), 'elimination', 85, 'Physci Building', 'UPLB', 'Building'),
  (592,true, NOW(), 'elimination', 85, 'Freedom Park', 'UPLB', 'Park'),
  (593,true, NOW(), 'semi-finals', 85, 'Freedom Park', 'UPLB', 'Park'),
  (594,true, NOW(), 'semi-finals', 85, 'Freedom Park', 'UPLB', 'Park'),
  (595,true, NOW(), 'finals', 85,'Freedom Park', 'UPLB', 'Park'),
  (596,true, NOW(), 'elimination', 86, 'Baker Hall', 'UPLB', 'Gym'),
  (597,true, NOW(), 'elimination', 86, 'Copeland Gym','UPLB', 'Gym'),
  (598,true, NOW(), 'elimination', 86, 'Physci Building', 'UPLB', 'Building'),
  (599,true, NOW(), 'elimination', 86, 'Freedom Park', 'UPLB', 'Park'),
  (600,true, NOW(), 'semi-finals', 86, 'Freedom Park', 'UPLB', 'Park'),
  (601,true, NOW(), 'semi-finals', 86, 'Freedom Park', 'UPLB', 'Park'),
  (602,true, NOW(), 'finals', 86,'Freedom Park', 'UPLB', 'Park'),
  (603,true, NOW(), 'elimination', 87, 'Baker Hall', 'UPLB', 'Gym'),
  (604,true, NOW(), 'elimination', 87, 'Copeland Gym','UPLB', 'Gym'),
  (605,true, NOW(), 'elimination', 87, 'Physci Building', 'UPLB', 'Building'),
  (606,true, NOW(), 'elimination', 87, 'Freedom Park', 'UPLB', 'Park'),
  (607,true, NOW(), 'semi-finals', 87, 'Freedom Park', 'UPLB', 'Park'),
  (608,true, NOW(), 'semi-finals', 87, 'Freedom Park', 'UPLB', 'Park'),
  (609,true, NOW(), 'finals', 87,'Freedom Park', 'UPLB', 'Park'),
  (610,true, NOW(), 'elimination', 88, 'Baker Hall', 'UPLB', 'Gym'),
  (611,true, NOW(), 'elimination', 88, 'Copeland Gym','UPLB', 'Gym'),
  (612,true, NOW(), 'elimination', 88, 'Physci Building', 'UPLB', 'Building'),
  (613,true, NOW(), 'elimination', 88, 'Freedom Park', 'UPLB', 'Park'),
  (614,true, NOW(), 'semi-finals', 88, 'Freedom Park', 'UPLB', 'Park'),
  (615,true, NOW(), 'semi-finals', 88, 'Freedom Park', 'UPLB', 'Park'),
  (616,true, NOW(), 'finals', 88,'Freedom Park', 'UPLB', 'Park'),
  (617,true, NOW(), 'elimination', 89, 'Baker Hall', 'UPLB', 'Gym'),
  (618,true, NOW(), 'elimination', 89, 'Copeland Gym','UPLB', 'Gym'),
  (619,true, NOW(), 'elimination', 89, 'Physci Building', 'UPLB', 'Building'),
  (620,true, NOW(), 'elimination', 89, 'Freedom Park', 'UPLB', 'Park'),
  (621,true, NOW(), 'semi-finals', 89, 'Freedom Park', 'UPLB', 'Park'),
  (622,true, NOW(), 'semi-finals', 89, 'Freedom Park', 'UPLB', 'Park'),
  (623,true, NOW(), 'finals', 89,'Freedom Park', 'UPLB', 'Park'),
  (624,true, NOW(), 'elimination', 90, 'Baker Hall', 'UPLB', 'Gym'),
  (625,true, NOW(), 'elimination', 90, 'Copeland Gym','UPLB', 'Gym'),
  (626,true, NOW(), 'elimination', 90, 'Physci Building', 'UPLB', 'Building'),
  (627,true, NOW(), 'elimination', 90, 'Freedom Park', 'UPLB', 'Park'),
  (628,true, NOW(), 'semi-finals', 90, 'Freedom Park', 'UPLB', 'Park'),
  (629,true, NOW(), 'semi-finals', 90, 'Freedom Park', 'UPLB', 'Park'),
  (630,true, NOW(), 'finals', 90,'Freedom Park', 'UPLB', 'Park'),
  (631,true, NOW(), 'elimination', 91, 'Baker Hall', 'UPLB', 'Gym'),
  (632,true, NOW(), 'elimination', 91, 'Copeland Gym','UPLB', 'Gym'),
  (633,true, NOW(), 'elimination', 91, 'Physci Building', 'UPLB', 'Building'),
  (634,true, NOW(), 'elimination', 91, 'Freedom Park', 'UPLB', 'Park'),
  (635,true, NOW(), 'semi-finals', 91, 'Freedom Park', 'UPLB', 'Park'),
  (636,true, NOW(), 'semi-finals', 91, 'Freedom Park', 'UPLB', 'Park'),
  (637,true, NOW(), 'finals', 91,'Freedom Park', 'UPLB', 'Park'),
  (638,true, NOW(), 'elimination', 92, 'Baker Hall', 'UPLB', 'Gym'),
  (639,true, NOW(), 'elimination', 92, 'Copeland Gym','UPLB', 'Gym'),
  (640,true, NOW(), 'elimination', 92, 'Physci Building', 'UPLB', 'Building'),
  (641,true, NOW(), 'elimination', 92, 'Freedom Park', 'UPLB', 'Park'),
  (642,true, NOW(), 'semi-finals', 92, 'Freedom Park', 'UPLB', 'Park'),
  (643,true, NOW(), 'semi-finals', 92, 'Freedom Park', 'UPLB', 'Park'),
  (644,true, NOW(), 'finals', 92,'Freedom Park', 'UPLB', 'Park'),
  (645,true, NOW(), 'elimination', 93, 'Baker Hall', 'UPLB', 'Gym'),
  (646,true, NOW(), 'elimination', 93, 'Copeland Gym','UPLB', 'Gym'),
  (647,true, NOW(), 'elimination', 93, 'Physci Building', 'UPLB', 'Building'),
  (648,true, NOW(), 'elimination', 93, 'Freedom Park', 'UPLB', 'Park'),
  (649,true, NOW(), 'semi-finals', 93, 'Freedom Park', 'UPLB', 'Park'),
  (650,true, NOW(), 'semi-finals', 93, 'Freedom Park', 'UPLB', 'Park'),
  (651,true, NOW(), 'finals', 93,'Freedom Park', 'UPLB', 'Park'),
  (652,true, NOW(), 'elimination', 94, 'Baker Hall', 'UPLB', 'Gym'),
  (653,true, NOW(), 'elimination', 94, 'Copeland Gym','UPLB', 'Gym'),
  (654,true, NOW(), 'elimination', 94, 'Physci Building', 'UPLB', 'Building'),
  (655,true, NOW(), 'elimination', 94, 'Freedom Park', 'UPLB', 'Park'),
  (656,true, NOW(), 'semi-finals', 94, 'Freedom Park', 'UPLB', 'Park'),
  (657,true, NOW(), 'semi-finals', 94, 'Freedom Park', 'UPLB', 'Park'),
  (658,true, NOW(), 'finals', 94,'Freedom Park', 'UPLB', 'Park'),
  (659,true, NOW(), 'elimination', 95, 'Baker Hall', 'UPLB', 'Gym'),
  (660,true, NOW(), 'elimination', 95, 'Copeland Gym','UPLB', 'Gym'),
  (661,true, NOW(), 'elimination', 95, 'Physci Building', 'UPLB', 'Building'),
  (662,true, NOW(), 'elimination', 95, 'Freedom Park', 'UPLB', 'Park'),
  (663,true, NOW(), 'semi-finals', 95, 'Freedom Park', 'UPLB', 'Park'),
  (664,true, NOW(), 'semi-finals', 95, 'Freedom Park', 'UPLB', 'Park'),
  (665,true, NOW(), 'finals', 95,'Freedom Park', 'UPLB', 'Park'),
  (666,true, NOW(), 'elimination', 96, 'Baker Hall', 'UPLB', 'Gym'),
  (667,true, NOW(), 'elimination', 96, 'Copeland Gym','UPLB', 'Gym'),
  (668,true, NOW(), 'elimination', 96, 'Physci Building', 'UPLB', 'Building'),
  (669,true, NOW(), 'elimination', 96, 'Freedom Park', 'UPLB', 'Park'),
  (670,true, NOW(), 'semi-finals', 96, 'Freedom Park', 'UPLB', 'Park'),
  (671,true, NOW(), 'semi-finals', 96, 'Freedom Park', 'UPLB', 'Park'),
  (672,true, NOW(), 'finals', 96,'Freedom Park', 'UPLB', 'Park'),
  (673,true, NOW(), 'elimination', 97, 'Baker Hall', 'UPLB', 'Gym'),
  (674,true, NOW(), 'elimination', 97, 'Copeland Gym','UPLB', 'Gym'),
  (675,true, NOW(), 'elimination', 97, 'Physci Building', 'UPLB', 'Building'),
  (676,true, NOW(), 'elimination', 97, 'Freedom Park', 'UPLB', 'Park'),
  (677,true, NOW(), 'semi-finals', 97, 'Freedom Park', 'UPLB', 'Park'),
  (678,true, NOW(), 'semi-finals', 97, 'Freedom Park', 'UPLB', 'Park'),
  (679,true, NOW(), 'finals', 97,'Freedom Park', 'UPLB', 'Park'),
  (680,true, NOW(), 'elimination', 98, 'Baker Hall', 'UPLB', 'Gym'),
  (681,true, NOW(), 'elimination', 98, 'Copeland Gym','UPLB', 'Gym'),
  (682,true, NOW(), 'elimination', 98, 'Physci Building', 'UPLB', 'Building'),
  (683,true, NOW(), 'elimination', 98, 'Freedom Park', 'UPLB', 'Park'),
  (684,true, NOW(), 'semi-finals', 98, 'Freedom Park', 'UPLB', 'Park'),
  (685,true, NOW(), 'semi-finals', 98, 'Freedom Park', 'UPLB', 'Park'),
  (686,true, NOW(), 'finals', 98,'Freedom Park', 'UPLB', 'Park'),
  (687,true, NOW(), 'elimination', 99, 'Baker Hall', 'UPLB', 'Gym'),
  (688,true, NOW(), 'elimination', 99, 'Copeland Gym','UPLB', 'Gym'),
  (689,true, NOW(), 'elimination', 99, 'Physci Building', 'UPLB', 'Building'),
  (690,true, NOW(), 'elimination', 99, 'Freedom Park', 'UPLB', 'Park'),
  (691,true, NOW(), 'semi-finals', 99, 'Freedom Park', 'UPLB', 'Park'),
  (692,true, NOW(), 'semi-finals', 99, 'Freedom Park', 'UPLB', 'Park'),
  (693,true, NOW(), 'finals', 99,'Freedom Park', 'UPLB', 'Park'),
  (694,true, NOW(), 'elimination', 100, 'Baker Hall', 'UPLB', 'Gym'),
  (695,true, NOW(), 'elimination', 100, 'Copeland Gym','UPLB', 'Gym'),
  (696,true, NOW(), 'elimination', 100, 'Physci Building', 'UPLB', 'Building'),
  (697,true, NOW(), 'elimination', 100, 'Freedom Park', 'UPLB', 'Park'),
  (698,true, NOW(), 'semi-finals', 100, 'Freedom Park', 'UPLB', 'Park'),
  (699,true, NOW(), 'semi-finals', 100, 'Freedom Park', 'UPLB', 'Park'),
  (700,true, NOW(), 'finals', 100,'Freedom Park', 'UPLB', 'Park'),
  (701,true, NOW(), 'elimination', 101, 'Baker Hall', 'UPLB', 'Gym'),
  (702,true, NOW(), 'elimination', 101, 'Copeland Gym','UPLB', 'Gym'),
  (703,true, NOW(), 'elimination', 101, 'Physci Building', 'UPLB', 'Building'),
  (704,true, NOW(), 'elimination', 101, 'Freedom Park', 'UPLB', 'Park'),
  (705,true, NOW(), 'semi-finals', 101, 'Freedom Park', 'UPLB', 'Park'),
  (706,true, NOW(), 'semi-finals', 101, 'Freedom Park', 'UPLB', 'Park'),
  (707,true, NOW(), 'finals', 101,'Freedom Park', 'UPLB', 'Park'),
  (708,true, NOW(), 'elimination', 102, 'Baker Hall', 'UPLB', 'Gym'),
  (709,true, NOW(), 'elimination', 102, 'Copeland Gym','UPLB', 'Gym'),
  (710,true, NOW(), 'elimination', 102, 'Physci Building', 'UPLB', 'Building'),
  (711,true, NOW(), 'elimination', 102, 'Freedom Park', 'UPLB', 'Park'),
  (712,true, NOW(), 'semi-finals', 102, 'Freedom Park', 'UPLB', 'Park'),
  (713,true, NOW(), 'semi-finals', 102, 'Freedom Park', 'UPLB', 'Park'),
  (714,true, NOW(), 'finals', 102,'Freedom Park', 'UPLB', 'Park'),
  (715,true, NOW(), 'elimination', 103, 'Baker Hall', 'UPLB', 'Gym'),
  (716,true, NOW(), 'elimination', 103, 'Copeland Gym','UPLB', 'Gym'),
  (717,true, NOW(), 'elimination', 103, 'Physci Building', 'UPLB', 'Building'),
  (718,true, NOW(), 'elimination', 103, 'Freedom Park', 'UPLB', 'Park'),
  (719,true, NOW(), 'semi-finals', 103, 'Freedom Park', 'UPLB', 'Park'),
  (720,true, NOW(), 'semi-finals', 103, 'Freedom Park', 'UPLB', 'Park'),
  (721,true, NOW(), 'finals', 103,'Freedom Park', 'UPLB', 'Park'),
  (722,true, NOW(), 'elimination', 104, 'Baker Hall', 'UPLB', 'Gym'),
  (723,true, NOW(), 'elimination', 104, 'Copeland Gym','UPLB', 'Gym'),
  (724,true, NOW(), 'elimination', 104, 'Physci Building', 'UPLB', 'Building'),
  (725,true, NOW(), 'elimination', 104, 'Freedom Park', 'UPLB', 'Park'),
  (726,true, NOW(), 'semi-finals', 104, 'Freedom Park', 'UPLB', 'Park'),
  (727,true, NOW(), 'semi-finals', 104, 'Freedom Park', 'UPLB', 'Park'),
  (728,true, NOW(), 'finals', 104,'Freedom Park', 'UPLB', 'Park'),
  (729,true, NOW(), 'elimination', 105, 'Baker Hall', 'UPLB', 'Gym'),
  (730,true, NOW(), 'elimination', 105, 'Copeland Gym','UPLB', 'Gym'),
  (731,true, NOW(), 'elimination', 105, 'Physci Building', 'UPLB', 'Building'),
  (732,true, NOW(), 'elimination', 105, 'Freedom Park', 'UPLB', 'Park'),
  (733,true, NOW(), 'semi-finals', 105, 'Freedom Park', 'UPLB', 'Park'),
  (734,true, NOW(), 'semi-finals', 105, 'Freedom Park', 'UPLB', 'Park'),
  (735,true, NOW(), 'finals', 105,'Freedom Park', 'UPLB', 'Park'),
  (736,true, NOW(), 'elimination', 106, 'Baker Hall', 'UPLB', 'Gym'),
  (737,true, NOW(), 'elimination', 106, 'Copeland Gym','UPLB', 'Gym'),
  (738,true, NOW(), 'elimination', 106, 'Physci Building', 'UPLB', 'Building'),
  (739,true, NOW(), 'elimination', 106, 'Freedom Park', 'UPLB', 'Park'),
  (740,true, NOW(), 'semi-finals', 106, 'Freedom Park', 'UPLB', 'Park'),
  (741,true, NOW(), 'semi-finals', 106, 'Freedom Park', 'UPLB', 'Park'),
  (742,true, NOW(), 'finals', 106,'Freedom Park', 'UPLB', 'Park'),
  (743,true, NOW(), 'elimination', 107, 'Baker Hall', 'UPLB', 'Gym'),
  (744,true, NOW(), 'elimination', 107, 'Copeland Gym','UPLB', 'Gym'),
  (745,true, NOW(), 'elimination', 107, 'Physci Building', 'UPLB', 'Building'),
  (746,true, NOW(), 'elimination', 107, 'Freedom Park', 'UPLB', 'Park'),
  (747,true, NOW(), 'semi-finals', 107, 'Freedom Park', 'UPLB', 'Park'),
  (748,true, NOW(), 'semi-finals', 107, 'Freedom Park', 'UPLB', 'Park'),
  (749,true, NOW(), 'finals', 107,'Freedom Park', 'UPLB', 'Park'),
  (750,true, NOW(), 'elimination', 108, 'Baker Hall', 'UPLB', 'Gym'),
  (751,true, NOW(), 'elimination', 108, 'Copeland Gym','UPLB', 'Gym'),
  (752,true, NOW(), 'elimination', 108, 'Physci Building', 'UPLB', 'Building'),
  (753,true, NOW(), 'elimination', 108, 'Freedom Park', 'UPLB', 'Park'),
  (754,true, NOW(), 'semi-finals', 108, 'Freedom Park', 'UPLB', 'Park'),
  (755,true, NOW(), 'semi-finals', 108, 'Freedom Park', 'UPLB', 'Park'),
  (756,true, NOW(), 'finals', 108,'Freedom Park', 'UPLB', 'Park'),
  (757,true, NOW(), 'elimination', 109, 'Baker Hall', 'UPLB', 'Gym'),
  (758,true, NOW(), 'elimination', 109, 'Copeland Gym','UPLB', 'Gym'),
  (759,true, NOW(), 'elimination', 109, 'Physci Building', 'UPLB', 'Building'),
  (760,true, NOW(), 'elimination', 109, 'Freedom Park', 'UPLB', 'Park'),
  (761,true, NOW(), 'semi-finals', 109, 'Freedom Park', 'UPLB', 'Park'),
  (762,true, NOW(), 'semi-finals', 109, 'Freedom Park', 'UPLB', 'Park'),
  (763,true, NOW(), 'finals', 109,'Freedom Park', 'UPLB', 'Park'),
  (764,true, NOW(), 'elimination', 110, 'Baker Hall', 'UPLB', 'Gym'),
  (765,true, NOW(), 'elimination', 110, 'Copeland Gym','UPLB', 'Gym'),
  (766,true, NOW(), 'elimination', 110, 'Physci Building', 'UPLB', 'Building'),
  (767,true, NOW(), 'elimination', 110, 'Freedom Park', 'UPLB', 'Park'),
  (768,true, NOW(), 'semi-finals', 110, 'Freedom Park', 'UPLB', 'Park'),
  (769,true, NOW(), 'semi-finals', 110, 'Freedom Park', 'UPLB', 'Park'),
  (770,true, NOW(), 'finals', 110,'Freedom Park', 'UPLB', 'Park'),
  (771,true, NOW(), 'elimination', 111, 'Baker Hall', 'UPLB', 'Gym'),
  (772,true, NOW(), 'elimination', 111, 'Copeland Gym','UPLB', 'Gym'),
  (773,true, NOW(), 'elimination', 111, 'Physci Building', 'UPLB', 'Building'),
  (774,true, NOW(), 'elimination', 111, 'Freedom Park', 'UPLB', 'Park'),
  (775,true, NOW(), 'semi-finals', 111, 'Freedom Park', 'UPLB', 'Park'),
  (776,true, NOW(), 'semi-finals', 111, 'Freedom Park', 'UPLB', 'Park'),
  (777,true, NOW(), 'finals', 111,'Freedom Park', 'UPLB', 'Park'),
  (778,true, NOW(), 'elimination', 112, 'Baker Hall', 'UPLB', 'Gym'),
  (779,true, NOW(), 'elimination', 112, 'Copeland Gym','UPLB', 'Gym'),
  (780,true, NOW(), 'elimination', 112, 'Physci Building', 'UPLB', 'Building'),
  (781,true, NOW(), 'elimination', 112, 'Freedom Park', 'UPLB', 'Park'),
  (782,true, NOW(), 'semi-finals', 112, 'Freedom Park', 'UPLB', 'Park'),
  (783,true, NOW(), 'semi-finals', 112, 'Freedom Park', 'UPLB', 'Park'),
  (784,true, NOW(), 'finals', 112,'Freedom Park', 'UPLB', 'Park'),
  (785,true, NOW(), 'elimination', 113, 'Baker Hall', 'UPLB', 'Gym'),
  (786,true, NOW(), 'elimination', 113, 'Copeland Gym','UPLB', 'Gym'),
  (787,true, NOW(), 'elimination', 113, 'Physci Building', 'UPLB', 'Building'),
  (788,true, NOW(), 'elimination', 113, 'Freedom Park', 'UPLB', 'Park'),
  (789,true, NOW(), 'semi-finals', 113, 'Freedom Park', 'UPLB', 'Park'),
  (790,true, NOW(), 'semi-finals', 113, 'Freedom Park', 'UPLB', 'Park'),
  (791,true, NOW(), 'finals', 113,'Freedom Park', 'UPLB', 'Park'),
  (792,true, NOW(), 'elimination', 114, 'Baker Hall', 'UPLB', 'Gym'),
  (793,true, NOW(), 'elimination', 114, 'Copeland Gym','UPLB', 'Gym'),
  (794,true, NOW(), 'elimination', 114, 'Physci Building', 'UPLB', 'Building'),
  (795,true, NOW(), 'elimination', 114, 'Freedom Park', 'UPLB', 'Park'),
  (796,true, NOW(), 'semi-finals', 114, 'Freedom Park', 'UPLB', 'Park'),
  (797,true, NOW(), 'semi-finals', 114, 'Freedom Park', 'UPLB', 'Park'),
  (798,true, NOW(), 'finals', 114,'Freedom Park', 'UPLB', 'Park'),
  (799,true, NOW(), 'elimination', 115, 'Baker Hall', 'UPLB', 'Gym'),
  (800,true, NOW(), 'elimination', 115, 'Copeland Gym','UPLB', 'Gym'),
  (801,true, NOW(), 'elimination', 115, 'Physci Building', 'UPLB', 'Building'),
  (802,true, NOW(), 'elimination', 115, 'Freedom Park', 'UPLB', 'Park'),
  (803,true, NOW(), 'semi-finals', 115, 'Freedom Park', 'UPLB', 'Park'),
  (804,true, NOW(), 'semi-finals', 115, 'Freedom Park', 'UPLB', 'Park'),
  (805,true, NOW(), 'finals', 115,'Freedom Park', 'UPLB', 'Park'),
  (806,true, NOW(), 'elimination', 116, 'Baker Hall', 'UPLB', 'Gym'),
  (807,true, NOW(), 'elimination', 116, 'Copeland Gym','UPLB', 'Gym'),
  (808,true, NOW(), 'elimination', 116, 'Physci Building', 'UPLB', 'Building'),
  (809,true, NOW(), 'elimination', 116, 'Freedom Park', 'UPLB', 'Park'),
  (810,true, NOW(), 'semi-finals', 116, 'Freedom Park', 'UPLB', 'Park'),
  (811,true, NOW(), 'semi-finals', 116, 'Freedom Park', 'UPLB', 'Park'),
  (812,true, NOW(), 'finals', 116,'Freedom Park', 'UPLB', 'Park'),
  (813,true, NOW(), 'elimination', 117, 'Baker Hall', 'UPLB', 'Gym'),
  (814,true, NOW(), 'elimination', 117, 'Copeland Gym','UPLB', 'Gym'),
  (815,true, NOW(), 'elimination', 117, 'Physci Building', 'UPLB', 'Building'),
  (816,true, NOW(), 'elimination', 117, 'Freedom Park', 'UPLB', 'Park'),
  (817,true, NOW(), 'semi-finals', 117, 'Freedom Park', 'UPLB', 'Park'),
  (818,true, NOW(), 'semi-finals', 117, 'Freedom Park', 'UPLB', 'Park'),
  (819,true, NOW(), 'finals', 117,'Freedom Park', 'UPLB', 'Park'),
  (820,true, NOW(), 'elimination', 118, 'Baker Hall', 'UPLB', 'Gym'),
  (821,true, NOW(), 'elimination', 118, 'Copeland Gym','UPLB', 'Gym'),
  (822,true, NOW(), 'elimination', 118, 'Physci Building', 'UPLB', 'Building'),
  (823,true, NOW(), 'elimination', 118, 'Freedom Park', 'UPLB', 'Park'),
  (824,true, NOW(), 'semi-finals', 118, 'Freedom Park', 'UPLB', 'Park'),
  (825,true, NOW(), 'semi-finals', 118, 'Freedom Park', 'UPLB', 'Park'),
  (826,true, NOW(), 'finals', 118,'Freedom Park', 'UPLB', 'Park'),
  (827,true, NOW(), 'elimination', 119, 'Baker Hall', 'UPLB', 'Gym'),
  (828,true, NOW(), 'elimination', 119, 'Copeland Gym','UPLB', 'Gym'),
  (829,true, NOW(), 'elimination', 119, 'Physci Building', 'UPLB', 'Building'),
  (830,true, NOW(), 'elimination', 119, 'Freedom Park', 'UPLB', 'Park'),
  (831,true, NOW(), 'semi-finals', 119, 'Freedom Park', 'UPLB', 'Park'),
  (832,true, NOW(), 'semi-finals', 119, 'Freedom Park', 'UPLB', 'Park'),
  (833,true, NOW(), 'finals', 119,'Freedom Park', 'UPLB', 'Park'),
  (834,true, NOW(), 'elimination', 120, 'Baker Hall', 'UPLB', 'Gym'),
  (835,true, NOW(), 'elimination', 120, 'Copeland Gym','UPLB', 'Gym'),
  (836,true, NOW(), 'elimination', 120, 'Physci Building', 'UPLB', 'Building'),
  (837,true, NOW(), 'elimination', 120, 'Freedom Park', 'UPLB', 'Park'),
  (838,true, NOW(), 'semi-finals', 120, 'Freedom Park', 'UPLB', 'Park'),
  (839,true, NOW(), 'semi-finals', 120, 'Freedom Park', 'UPLB', 'Park'),
  (840,true, NOW(), 'finals', 120,'Freedom Park', 'UPLB', 'Park'),
  (841,true, NOW(), 'elimination', 121, 'Baker Hall', 'UPLB', 'Gym'),
  (842,true, NOW(), 'elimination', 121, 'Copeland Gym','UPLB', 'Gym'),
  (843,true, NOW(), 'elimination', 121, 'Physci Building', 'UPLB', 'Building'),
  (844,true, NOW(), 'elimination', 121, 'Freedom Park', 'UPLB', 'Park'),
  (845,true, NOW(), 'semi-finals', 121, 'Freedom Park', 'UPLB', 'Park'),
  (846,true, NOW(), 'semi-finals', 121, 'Freedom Park', 'UPLB', 'Park'),
  (847,true, NOW(), 'finals', 121,'Freedom Park', 'UPLB', 'Park'),
  (848,true, NOW(), 'elimination', 122, 'Baker Hall', 'UPLB', 'Gym'),
  (849,true, NOW(), 'elimination', 122, 'Copeland Gym','UPLB', 'Gym'),
  (850,true, NOW(), 'elimination', 122, 'Physci Building', 'UPLB', 'Building'),
  (851,true, NOW(), 'elimination', 122, 'Freedom Park', 'UPLB', 'Park'),
  (852,true, NOW(), 'semi-finals', 122, 'Freedom Park', 'UPLB', 'Park'),
  (853,true, NOW(), 'semi-finals', 122, 'Freedom Park', 'UPLB', 'Park'),
  (854,true, NOW(), 'finals', 122,'Freedom Park', 'UPLB', 'Park'),
  (855,true, NOW(), 'elimination', 123, 'Baker Hall', 'UPLB', 'Gym'),
  (856,true, NOW(), 'elimination', 123, 'Copeland Gym','UPLB', 'Gym'),
  (857,true, NOW(), 'elimination', 123, 'Physci Building', 'UPLB', 'Building'),
  (858,true, NOW(), 'elimination', 123, 'Freedom Park', 'UPLB', 'Park'),
  (859,true, NOW(), 'semi-finals', 123, 'Freedom Park', 'UPLB', 'Park'),
  (860,true, NOW(), 'semi-finals', 123, 'Freedom Park', 'UPLB', 'Park'),
  (861,true, NOW(), 'finals', 123,'Freedom Park', 'UPLB', 'Park'),
  (862,true, NOW(), 'elimination', 124, 'Baker Hall', 'UPLB', 'Gym'),
  (863,true, NOW(), 'elimination', 124, 'Copeland Gym','UPLB', 'Gym'),
  (864,true, NOW(), 'elimination', 124, 'Physci Building', 'UPLB', 'Building'),
  (865,true, NOW(), 'elimination', 124, 'Freedom Park', 'UPLB', 'Park'),
  (866,true, NOW(), 'semi-finals', 124, 'Freedom Park', 'UPLB', 'Park'),
  (867,true, NOW(), 'semi-finals', 124, 'Freedom Park', 'UPLB', 'Park'),
  (868,true, NOW(), 'finals', 124,'Freedom Park', 'UPLB', 'Park'),
  (869,true, NOW(), 'elimination', 125, 'Baker Hall', 'UPLB', 'Gym'),
  (870,true, NOW(), 'elimination', 125, 'Copeland Gym','UPLB', 'Gym'),
  (871,true, NOW(), 'elimination', 125, 'Physci Building', 'UPLB', 'Building'),
  (872,true, NOW(), 'elimination', 125, 'Freedom Park', 'UPLB', 'Park'),
  (873,true, NOW(), 'semi-finals', 125, 'Freedom Park', 'UPLB', 'Park'),
  (874,true, NOW(), 'semi-finals', 125, 'Freedom Park', 'UPLB', 'Park'),
  (875,true, NOW(), 'finals', 125,'Freedom Park', 'UPLB', 'Park'),
  (876,true, NOW(), 'elimination', 126, 'Baker Hall', 'UPLB', 'Gym'),
  (877,true, NOW(), 'elimination', 126, 'Copeland Gym','UPLB', 'Gym'),
  (878,true, NOW(), 'elimination', 126, 'Physci Building', 'UPLB', 'Building'),
  (879,true, NOW(), 'elimination', 126, 'Freedom Park', 'UPLB', 'Park'),
  (880,true, NOW(), 'semi-finals', 126, 'Freedom Park', 'UPLB', 'Park'),
  (881,true, NOW(), 'semi-finals', 126, 'Freedom Park', 'UPLB', 'Park'),
  (882,true, NOW(), 'finals', 126,'Freedom Park', 'UPLB', 'Park'),
  (883,true, NOW(), 'elimination', 127, 'Baker Hall', 'UPLB', 'Gym'),
  (884,true, NOW(), 'elimination', 127, 'Copeland Gym','UPLB', 'Gym'),
  (885,true, NOW(), 'elimination', 127, 'Physci Building', 'UPLB', 'Building'),
  (886,true, NOW(), 'elimination', 127, 'Freedom Park', 'UPLB', 'Park'),
  (887,true, NOW(), 'semi-finals', 127, 'Freedom Park', 'UPLB', 'Park'),
  (888,true, NOW(), 'semi-finals', 127, 'Freedom Park', 'UPLB', 'Park'),
  (889,true, NOW(), 'finals', 127,'Freedom Park', 'UPLB', 'Park'),
  (890,true, NOW(), 'elimination', 128, 'Baker Hall', 'UPLB', 'Gym'),
  (891,true, NOW(), 'elimination', 128, 'Copeland Gym','UPLB', 'Gym'),
  (892,true, NOW(), 'elimination', 128, 'Physci Building', 'UPLB', 'Building'),
  (893,true, NOW(), 'elimination', 128, 'Freedom Park', 'UPLB', 'Park'),
  (894,true, NOW(), 'semi-finals', 128, 'Freedom Park', 'UPLB', 'Park'),
  (895,true, NOW(), 'semi-finals', 128, 'Freedom Park', 'UPLB', 'Park'),
  (896,true, NOW(), 'finals', 128,'Freedom Park', 'UPLB', 'Park'),
  (897,true, NOW(), 'elimination', 129, 'Baker Hall', 'UPLB', 'Gym'),
  (898,true, NOW(), 'elimination', 129, 'Copeland Gym','UPLB', 'Gym'),
  (899,true, NOW(), 'elimination', 129, 'Physci Building', 'UPLB', 'Building'),
  (900,true, NOW(), 'elimination', 129, 'Freedom Park', 'UPLB', 'Park'),
  (901,true, NOW(), 'semi-finals', 129, 'Freedom Park', 'UPLB', 'Park'),
  (902,true, NOW(), 'semi-finals', 129, 'Freedom Park', 'UPLB', 'Park'),
  (903,true, NOW(), 'finals', 129,'Freedom Park', 'UPLB', 'Park'),
  (904,true, NOW(), 'elimination', 130, 'Baker Hall', 'UPLB', 'Gym'),
  (905,true, NOW(), 'elimination', 130, 'Copeland Gym','UPLB', 'Gym'),
  (906,true, NOW(), 'elimination', 130, 'Physci Building', 'UPLB', 'Building'),
  (907,true, NOW(), 'elimination', 130, 'Freedom Park', 'UPLB', 'Park'),
  (908,true, NOW(), 'semi-finals', 130, 'Freedom Park', 'UPLB', 'Park'),
  (909,true, NOW(), 'semi-finals', 130, 'Freedom Park', 'UPLB', 'Park'),
  (910,true, NOW(), 'finals', 130,'Freedom Park', 'UPLB', 'Park'),
  (911,true, NOW(), 'elimination', 131, 'Baker Hall', 'UPLB', 'Gym'),
  (912,true, NOW(), 'elimination', 131, 'Copeland Gym','UPLB', 'Gym'),
  (913,true, NOW(), 'elimination', 131, 'Physci Building', 'UPLB', 'Building'),
  (914,true, NOW(), 'elimination', 131, 'Freedom Park', 'UPLB', 'Park'),
  (915,true, NOW(), 'semi-finals', 131, 'Freedom Park', 'UPLB', 'Park'),
  (916,true, NOW(), 'semi-finals', 131, 'Freedom Park', 'UPLB', 'Park'),
  (917,true, NOW(), 'finals', 131,'Freedom Park', 'UPLB', 'Park'),
  (918,true, NOW(), 'elimination', 132, 'Baker Hall', 'UPLB', 'Gym'),
  (919,true, NOW(), 'elimination', 132, 'Copeland Gym','UPLB', 'Gym'),
  (920,true, NOW(), 'elimination', 132, 'Physci Building', 'UPLB', 'Building'),
  (921,true, NOW(), 'elimination', 132, 'Freedom Park', 'UPLB', 'Park'),
  (922,true, NOW(), 'semi-finals', 132, 'Freedom Park', 'UPLB', 'Park'),
  (923,true, NOW(), 'semi-finals', 132, 'Freedom Park', 'UPLB', 'Park'),
  (924,true, NOW(), 'finals', 132,'Freedom Park', 'UPLB', 'Park'),
  (925,true, NOW(), 'elimination', 133, 'Baker Hall', 'UPLB', 'Gym'),
  (926,true, NOW(), 'elimination', 133, 'Copeland Gym','UPLB', 'Gym'),
  (927,true, NOW(), 'elimination', 133, 'Physci Building', 'UPLB', 'Building'),
  (928,true, NOW(), 'elimination', 133, 'Freedom Park', 'UPLB', 'Park'),
  (929,true, NOW(), 'semi-finals', 133, 'Freedom Park', 'UPLB', 'Park'),
  (930,true, NOW(), 'semi-finals', 133, 'Freedom Park', 'UPLB', 'Park'),
  (931,true, NOW(), 'finals', 133,'Freedom Park', 'UPLB', 'Park'),
  (932,true, NOW(), 'elimination', 134, 'Baker Hall', 'UPLB', 'Gym'),
  (933,true, NOW(), 'elimination', 134, 'Copeland Gym','UPLB', 'Gym'),
  (934,true, NOW(), 'elimination', 134, 'Physci Building', 'UPLB', 'Building'),
  (935,true, NOW(), 'elimination', 134, 'Freedom Park', 'UPLB', 'Park'),
  (936,true, NOW(), 'semi-finals', 134, 'Freedom Park', 'UPLB', 'Park'),
  (937,true, NOW(), 'semi-finals', 134, 'Freedom Park', 'UPLB', 'Park'),
  (938,true, NOW(), 'finals', 134,'Freedom Park', 'UPLB', 'Park'),
  (939,true, NOW(), 'elimination', 135, 'Baker Hall', 'UPLB', 'Gym'),
  (940,true, NOW(), 'elimination', 135, 'Copeland Gym','UPLB', 'Gym'),
  (941,true, NOW(), 'elimination', 135, 'Physci Building', 'UPLB', 'Building'),
  (942,true, NOW(), 'elimination', 135, 'Freedom Park', 'UPLB', 'Park'),
  (943,true, NOW(), 'semi-finals', 135, 'Freedom Park', 'UPLB', 'Park'),
  (944,true, NOW(), 'semi-finals', 135, 'Freedom Park', 'UPLB', 'Park'),
  (945,true, NOW(), 'finals', 135,'Freedom Park', 'UPLB', 'Park'),
  (946,true, NOW(), 'elimination', 136, 'Baker Hall', 'UPLB', 'Gym'),
  (947,true, NOW(), 'elimination', 136, 'Copeland Gym','UPLB', 'Gym'),
  (948,true, NOW(), 'elimination', 136, 'Physci Building', 'UPLB', 'Building'),
  (949,true, NOW(), 'elimination', 136, 'Freedom Park', 'UPLB', 'Park'),
  (950,true, NOW(), 'semi-finals', 136, 'Freedom Park', 'UPLB', 'Park'),
  (951,true, NOW(), 'semi-finals', 136, 'Freedom Park', 'UPLB', 'Park'),
  (952,true, NOW(), 'finals', 136,'Freedom Park', 'UPLB', 'Park'),
  (953,true, NOW(), 'elimination', 137, 'Baker Hall', 'UPLB', 'Gym'),
  (954,true, NOW(), 'elimination', 137, 'Copeland Gym','UPLB', 'Gym'),
  (955,true, NOW(), 'elimination', 137, 'Physci Building', 'UPLB', 'Building'),
  (956,true, NOW(), 'elimination', 137, 'Freedom Park', 'UPLB', 'Park'),
  (957,true, NOW(), 'semi-finals', 137, 'Freedom Park', 'UPLB', 'Park'),
  (958,true, NOW(), 'semi-finals', 137, 'Freedom Park', 'UPLB', 'Park'),
  (959,true, NOW(), 'finals', 137,'Freedom Park', 'UPLB', 'Park'),
  (960,true, NOW(), 'elimination', 138, 'Baker Hall', 'UPLB', 'Gym'),
  (961,true, NOW(), 'elimination', 138, 'Copeland Gym','UPLB', 'Gym'),
  (962,true, NOW(), 'elimination', 138, 'Physci Building', 'UPLB', 'Building'),
  (963,true, NOW(), 'elimination', 138, 'Freedom Park', 'UPLB', 'Park'),
  (964,true, NOW(), 'semi-finals', 138, 'Freedom Park', 'UPLB', 'Park'),
  (965,true, NOW(), 'semi-finals', 138, 'Freedom Park', 'UPLB', 'Park'),
  (966,true, NOW(), 'finals', 138,'Freedom Park', 'UPLB', 'Park'),
  (967,true, NOW(), 'elimination', 139, 'Baker Hall', 'UPLB', 'Gym'),
  (968,true, NOW(), 'elimination', 139, 'Copeland Gym','UPLB', 'Gym'),
  (969,true, NOW(), 'elimination', 139, 'Physci Building', 'UPLB', 'Building'),
  (970,true, NOW(), 'elimination', 139, 'Freedom Park', 'UPLB', 'Park'),
  (971,true, NOW(), 'semi-finals', 139, 'Freedom Park', 'UPLB', 'Park'),
  (972,true, NOW(), 'semi-finals', 139, 'Freedom Park', 'UPLB', 'Park'),
  (973,true, NOW(), 'finals', 139,'Freedom Park', 'UPLB', 'Park'),
  (974,true, NOW(), 'elimination', 140, 'Baker Hall', 'UPLB', 'Gym'),
  (975,true, NOW(), 'elimination', 140, 'Copeland Gym','UPLB', 'Gym'),
  (976,true, NOW(), 'elimination', 140, 'Physci Building', 'UPLB', 'Building'),
  (977,true, NOW(), 'elimination', 140, 'Freedom Park', 'UPLB', 'Park'),
  (978,true, NOW(), 'semi-finals', 140, 'Freedom Park', 'UPLB', 'Park'),
  (979,true, NOW(), 'semi-finals', 140, 'Freedom Park', 'UPLB', 'Park'),
  (980,true, NOW(), 'finals', 140,'Freedom Park', 'UPLB', 'Park'),
  (981,true, NOW(), 'elimination', 141, 'Baker Hall', 'UPLB', 'Gym'),
  (982,true, NOW(), 'elimination', 141, 'Copeland Gym','UPLB', 'Gym'),
  (983,true, NOW(), 'elimination', 141, 'Physci Building', 'UPLB', 'Building'),
  (984,true, NOW(), 'elimination', 141, 'Freedom Park', 'UPLB', 'Park'),
  (985,true, NOW(), 'semi-finals', 141, 'Freedom Park', 'UPLB', 'Park'),
  (986,true, NOW(), 'semi-finals', 141, 'Freedom Park', 'UPLB', 'Park'),
  (987,true, NOW(), 'finals', 141,'Freedom Park', 'UPLB', 'Park'),
  (988,true, NOW(), 'elimination', 142, 'Baker Hall', 'UPLB', 'Gym'),
  (989,true, NOW(), 'elimination', 142, 'Copeland Gym','UPLB', 'Gym'),
  (990,true, NOW(), 'elimination', 142, 'Physci Building', 'UPLB', 'Building'),
  (991,true, NOW(), 'elimination', 142, 'Freedom Park', 'UPLB', 'Park'),
  (992,true, NOW(), 'semi-finals', 142, 'Freedom Park', 'UPLB', 'Park'),
  (993,true, NOW(), 'semi-finals', 142, 'Freedom Park', 'UPLB', 'Park'),
  (994,true, NOW(), 'finals', 142,'Freedom Park', 'UPLB', 'Park'),
  (995,true, NOW(), 'elimination', 143, 'Baker Hall', 'UPLB', 'Gym'),
  (996,true, NOW(), 'elimination', 143, 'Copeland Gym','UPLB', 'Gym'),
  (997,true, NOW(), 'elimination', 143, 'Physci Building', 'UPLB', 'Building'),
  (998,true, NOW(), 'elimination', 143, 'Freedom Park', 'UPLB', 'Park'),
  (999,true, NOW(), 'semi-finals', 143, 'Freedom Park', 'UPLB', 'Park'),
  (1000,true, NOW(), 'semi-finals', 143, 'Freedom Park', 'UPLB', 'Park'),
  (1001,true, NOW(), 'finals', 143,'Freedom Park', 'UPLB', 'Park'),
  (1002,true, NOW(), 'elimination', 144, 'Baker Hall', 'UPLB', 'Gym'),
  (1003,true, NOW(), 'elimination', 144, 'Copeland Gym','UPLB', 'Gym'),
  (1004,true, NOW(), 'elimination', 144, 'Physci Building', 'UPLB', 'Building'),
  (1005,true, NOW(), 'elimination', 144, 'Freedom Park', 'UPLB', 'Park'),
  (1006,true, NOW(), 'semi-finals', 144, 'Freedom Park', 'UPLB', 'Park'),
  (1007,true, NOW(), 'semi-finals', 144, 'Freedom Park', 'UPLB', 'Park'),
  (1008,true, NOW(), 'finals', 144,'Freedom Park', 'UPLB', 'Park'),
  (1009,true, NOW(), 'elimination', 145, 'Baker Hall', 'UPLB', 'Gym'),
  (1010,true, NOW(), 'elimination', 145, 'Copeland Gym','UPLB', 'Gym'),
  (1011,true, NOW(), 'elimination', 145, 'Physci Building', 'UPLB', 'Building'),
  (1012,true, NOW(), 'elimination', 145, 'Freedom Park', 'UPLB', 'Park'),
  (1013,true, NOW(), 'semi-finals', 145, 'Freedom Park', 'UPLB', 'Park'),
  (1014,true, NOW(), 'semi-finals', 145, 'Freedom Park', 'UPLB', 'Park'),
  (1015,true, NOW(), 'finals', 145,'Freedom Park', 'UPLB', 'Park'),
  (1016,true, NOW(), 'elimination', 146, 'Baker Hall', 'UPLB', 'Gym'),
  (1017,true, NOW(), 'elimination', 146, 'Copeland Gym','UPLB', 'Gym'),
  (1018,true, NOW(), 'elimination', 146, 'Physci Building', 'UPLB', 'Building'),
  (1019,true, NOW(), 'elimination', 146, 'Freedom Park', 'UPLB', 'Park'),
  (1020,true, NOW(), 'semi-finals', 146, 'Freedom Park', 'UPLB', 'Park'),
  (1021,true, NOW(), 'semi-finals', 146, 'Freedom Park', 'UPLB', 'Park'),
  (1022,true, NOW(), 'finals', 146,'Freedom Park', 'UPLB', 'Park'),
  (1023,true, NOW(), 'elimination', 147, 'Baker Hall', 'UPLB', 'Gym'),
  (1024,true, NOW(), 'elimination', 147, 'Copeland Gym','UPLB', 'Gym'),
  (1025,true, NOW(), 'elimination', 147, 'Physci Building', 'UPLB', 'Building'),
  (1026,true, NOW(), 'elimination', 147, 'Freedom Park', 'UPLB', 'Park'),
  (1027,true, NOW(), 'semi-finals', 147, 'Freedom Park', 'UPLB', 'Park'),
  (1028,true, NOW(), 'semi-finals', 147, 'Freedom Park', 'UPLB', 'Park'),
  (1029,true, NOW(), 'finals', 147,'Freedom Park', 'UPLB', 'Park'),
  (1030,true, NOW(), 'elimination', 148, 'Baker Hall', 'UPLB', 'Gym'),
  (1031,true, NOW(), 'elimination', 148, 'Copeland Gym','UPLB', 'Gym'),
  (1032,true, NOW(), 'elimination', 148, 'Physci Building', 'UPLB', 'Building'),
  (1033,true, NOW(), 'elimination', 148, 'Freedom Park', 'UPLB', 'Park'),
  (1034,true, NOW(), 'semi-finals', 148, 'Freedom Park', 'UPLB', 'Park'),
  (1035,true, NOW(), 'semi-finals', 148, 'Freedom Park', 'UPLB', 'Park'),
  (1036,true, NOW(), 'finals', 148,'Freedom Park', 'UPLB', 'Park'),
  (1037,true, NOW(), 'elimination', 149, 'Baker Hall', 'UPLB', 'Gym'),
  (1038,true, NOW(), 'elimination', 149, 'Copeland Gym','UPLB', 'Gym'),
  (1039,true, NOW(), 'elimination', 149, 'Physci Building', 'UPLB', 'Building'),
  (1040,true, NOW(), 'elimination', 149, 'Freedom Park', 'UPLB', 'Park'),
  (1041,true, NOW(), 'semi-finals', 149, 'Freedom Park', 'UPLB', 'Park'),
  (1042,true, NOW(), 'semi-finals', 149, 'Freedom Park', 'UPLB', 'Park'),
  (1043,true, NOW(), 'finals', 149,'Freedom Park', 'UPLB', 'Park'),
  (1044,true, NOW(), 'elimination', 150, 'Baker Hall', 'UPLB', 'Gym'),
  (1045,true, NOW(), 'elimination', 150, 'Copeland Gym','UPLB', 'Gym'),
  (1046,true, NOW(), 'elimination', 150, 'Physci Building', 'UPLB', 'Building'),
  (1047,true, NOW(), 'elimination', 150, 'Freedom Park', 'UPLB', 'Park'),
  (1048,true, NOW(), 'semi-finals', 150, 'Freedom Park', 'UPLB', 'Park'),
  (1049,true, NOW(), 'semi-finals', 150, 'Freedom Park', 'UPLB', 'Park'),
  (1050,true, NOW(), 'finals', 150,'Freedom Park', 'UPLB', 'Park'),
  (1051,true, NOW(), 'elimination', 151, 'Baker Hall', 'UPLB', 'Gym'),
  (1052,true, NOW(), 'elimination', 151, 'Copeland Gym','UPLB', 'Gym'),
  (1053,true, NOW(), 'elimination', 151, 'Physci Building', 'UPLB', 'Building'),
  (1054,true, NOW(), 'elimination', 151, 'Freedom Park', 'UPLB', 'Park'),
  (1055,true, NOW(), 'semi-finals', 151, 'Freedom Park', 'UPLB', 'Park'),
  (1056,true, NOW(), 'semi-finals', 151, 'Freedom Park', 'UPLB', 'Park'),
  (1057,true, NOW(), 'finals', 151,'Freedom Park', 'UPLB', 'Park'),
  (1058,true, NOW(), 'elimination', 152, 'Baker Hall', 'UPLB', 'Gym'),
  (1059,true, NOW(), 'elimination', 152, 'Copeland Gym','UPLB', 'Gym'),
  (1060,true, NOW(), 'elimination', 152, 'Physci Building', 'UPLB', 'Building'),
  (1061,true, NOW(), 'elimination', 152, 'Freedom Park', 'UPLB', 'Park'),
  (1062,true, NOW(), 'semi-finals', 152, 'Freedom Park', 'UPLB', 'Park'),
  (1063,true, NOW(), 'semi-finals', 152, 'Freedom Park', 'UPLB', 'Park'),
  (1064,true, NOW(), 'finals', 152,'Freedom Park', 'UPLB', 'Park'),
  (1065,true, NOW(), 'elimination', 153, 'Baker Hall', 'UPLB', 'Gym'),
  (1066,true, NOW(), 'elimination', 153, 'Copeland Gym','UPLB', 'Gym'),
  (1067,true, NOW(), 'elimination', 153, 'Physci Building', 'UPLB', 'Building'),
  (1068,true, NOW(), 'elimination', 153, 'Freedom Park', 'UPLB', 'Park'),
  (1069,true, NOW(), 'semi-finals', 153, 'Freedom Park', 'UPLB', 'Park'),
  (1070,true, NOW(), 'semi-finals', 153, 'Freedom Park', 'UPLB', 'Park'),
  (1071,true, NOW(), 'finals', 153,'Freedom Park', 'UPLB', 'Park'),
  (1072,true, NOW(), 'elimination', 154, 'Baker Hall', 'UPLB', 'Gym'),
  (1073,true, NOW(), 'elimination', 154, 'Copeland Gym','UPLB', 'Gym'),
  (1074,true, NOW(), 'elimination', 154, 'Physci Building', 'UPLB', 'Building'),
  (1075,true, NOW(), 'elimination', 154, 'Freedom Park', 'UPLB', 'Park'),
  (1076,true, NOW(), 'semi-finals', 154, 'Freedom Park', 'UPLB', 'Park'),
  (1077,true, NOW(), 'semi-finals', 154, 'Freedom Park', 'UPLB', 'Park'),
  (1078,true, NOW(), 'finals', 154,'Freedom Park', 'UPLB', 'Park'),
  (1079,true, NOW(), 'elimination', 155, 'Baker Hall', 'UPLB', 'Gym'),
  (1080,true, NOW(), 'elimination', 155, 'Copeland Gym','UPLB', 'Gym'),
  (1081,true, NOW(), 'elimination', 155, 'Physci Building', 'UPLB', 'Building'),
  (1082,true, NOW(), 'elimination', 155, 'Freedom Park', 'UPLB', 'Park'),
  (1083,true, NOW(), 'semi-finals', 155, 'Freedom Park', 'UPLB', 'Park'),
  (1084,true, NOW(), 'semi-finals', 155, 'Freedom Park', 'UPLB', 'Park'),
  (1085,true, NOW(), 'finals', 155,'Freedom Park', 'UPLB', 'Park'),
  (1086,true, NOW(), 'elimination', 156, 'Baker Hall', 'UPLB', 'Gym'),
  (1087,true, NOW(), 'elimination', 156, 'Copeland Gym','UPLB', 'Gym'),
  (1088,true, NOW(), 'elimination', 156, 'Physci Building', 'UPLB', 'Building'),
  (1089,true, NOW(), 'elimination', 156, 'Freedom Park', 'UPLB', 'Park'),
  (1090,true, NOW(), 'semi-finals', 156, 'Freedom Park', 'UPLB', 'Park'),
  (1091,true, NOW(), 'semi-finals', 156, 'Freedom Park', 'UPLB', 'Park'),
  (1092,true, NOW(), 'finals', 156,'Freedom Park', 'UPLB', 'Park'),
  (1093,true, NOW(), 'elimination', 157, 'Baker Hall', 'UPLB', 'Gym'),
  (1094,true, NOW(), 'elimination', 157, 'Copeland Gym','UPLB', 'Gym'),
  (1095,true, NOW(), 'elimination', 157, 'Physci Building', 'UPLB', 'Building'),
  (1096,true, NOW(), 'elimination', 157, 'Freedom Park', 'UPLB', 'Park'),
  (1097,true, NOW(), 'semi-finals', 157, 'Freedom Park', 'UPLB', 'Park'),
  (1098,true, NOW(), 'semi-finals', 157, 'Freedom Park', 'UPLB', 'Park'),
  (1099,true, NOW(), 'finals', 157,'Freedom Park', 'UPLB', 'Park'),
  (1100,true, NOW(), 'elimination', 158, 'Baker Hall', 'UPLB', 'Gym'),
  (1101,true, NOW(), 'elimination', 158, 'Copeland Gym','UPLB', 'Gym'),
  (1102,true, NOW(), 'elimination', 158, 'Physci Building', 'UPLB', 'Building'),
  (1103,true, NOW(), 'elimination', 158, 'Freedom Park', 'UPLB', 'Park'),
  (1104,true, NOW(), 'semi-finals', 158, 'Freedom Park', 'UPLB', 'Park'),
  (1105,true, NOW(), 'semi-finals', 158, 'Freedom Park', 'UPLB', 'Park'),
  (1106,true, NOW(), 'finals', 158,'Freedom Park', 'UPLB', 'Park'),
  (1107,true, NOW(), 'elimination', 159, 'Baker Hall', 'UPLB', 'Gym'),
  (1108,true, NOW(), 'elimination', 159, 'Copeland Gym','UPLB', 'Gym'),
  (1109,true, NOW(), 'elimination', 159, 'Physci Building', 'UPLB', 'Building'),
  (1110,true, NOW(), 'elimination', 159, 'Freedom Park', 'UPLB', 'Park'),
  (1111,true, NOW(), 'semi-finals', 159, 'Freedom Park', 'UPLB', 'Park'),
  (1112,true, NOW(), 'semi-finals', 159, 'Freedom Park', 'UPLB', 'Park'),
  (1113,true, NOW(), 'finals', 159,'Freedom Park', 'UPLB', 'Park'),
  (1114,true, NOW(), 'elimination', 160, 'Baker Hall', 'UPLB', 'Gym'),
  (1115,true, NOW(), 'elimination', 160, 'Copeland Gym','UPLB', 'Gym'),
  (1116,true, NOW(), 'elimination', 160, 'Physci Building', 'UPLB', 'Building'),
  (1117,true, NOW(), 'elimination', 160, 'Freedom Park', 'UPLB', 'Park'),
  (1118,true, NOW(), 'semi-finals', 160, 'Freedom Park', 'UPLB', 'Park'),
  (1119,true, NOW(), 'semi-finals', 160, 'Freedom Park', 'UPLB', 'Park'),
  (1120,true, NOW(), 'finals', 160,'Freedom Park', 'UPLB', 'Park'),
  (1121,true, NOW(), 'elimination', 161, 'Baker Hall', 'UPLB', 'Gym'),
  (1122,true, NOW(), 'elimination', 161, 'Copeland Gym','UPLB', 'Gym'),
  (1123,true, NOW(), 'elimination', 161, 'Physci Building', 'UPLB', 'Building'),
  (1124,true, NOW(), 'elimination', 161, 'Freedom Park', 'UPLB', 'Park'),
  (1125,true, NOW(), 'semi-finals', 161, 'Freedom Park', 'UPLB', 'Park'),
  (1126,true, NOW(), 'semi-finals', 161, 'Freedom Park', 'UPLB', 'Park'),
  (1127,true, NOW(), 'finals', 161,'Freedom Park', 'UPLB', 'Park'),
  (1128,true, NOW(), 'elimination', 162, 'Baker Hall', 'UPLB', 'Gym'),
  (1129,true, NOW(), 'elimination', 162, 'Copeland Gym','UPLB', 'Gym'),
  (1130,true, NOW(), 'elimination', 162, 'Physci Building', 'UPLB', 'Building'),
  (1131,true, NOW(), 'elimination', 162, 'Freedom Park', 'UPLB', 'Park'),
  (1132,true, NOW(), 'semi-finals', 162, 'Freedom Park', 'UPLB', 'Park'),
  (1133,true, NOW(), 'semi-finals', 162, 'Freedom Park', 'UPLB', 'Park'),
  (1134,true, NOW(), 'finals', 162,'Freedom Park', 'UPLB', 'Park'),
  (1135,true, NOW(), 'elimination', 163, 'Baker Hall', 'UPLB', 'Gym'),
  (1136,true, NOW(), 'elimination', 163, 'Copeland Gym','UPLB', 'Gym'),
  (1137,true, NOW(), 'elimination', 163, 'Physci Building', 'UPLB', 'Building'),
  (1138,true, NOW(), 'elimination', 163, 'Freedom Park', 'UPLB', 'Park'),
  (1139,true, NOW(), 'semi-finals', 163, 'Freedom Park', 'UPLB', 'Park'),
  (1140,true, NOW(), 'semi-finals', 163, 'Freedom Park', 'UPLB', 'Park'),
  (1141,true, NOW(), 'finals', 163,'Freedom Park', 'UPLB', 'Park'),
  (1142,true, NOW(), 'elimination', 164, 'Baker Hall', 'UPLB', 'Gym'),
  (1143,true, NOW(), 'elimination', 164, 'Copeland Gym','UPLB', 'Gym'),
  (1144,true, NOW(), 'elimination', 164, 'Physci Building', 'UPLB', 'Building'),
  (1145,true, NOW(), 'elimination', 164, 'Freedom Park', 'UPLB', 'Park'),
  (1146,true, NOW(), 'semi-finals', 164, 'Freedom Park', 'UPLB', 'Park'),
  (1147,true, NOW(), 'semi-finals', 164, 'Freedom Park', 'UPLB', 'Park'),
  (1148,true, NOW(), 'finals', 164,'Freedom Park', 'UPLB', 'Park'),
  (1149,true, NOW(), 'elimination', 165, 'Baker Hall', 'UPLB', 'Gym'),
  (1150,true, NOW(), 'elimination', 165, 'Copeland Gym','UPLB', 'Gym'),
  (1151,true, NOW(), 'elimination', 165, 'Physci Building', 'UPLB', 'Building'),
  (1152,true, NOW(), 'elimination', 165, 'Freedom Park', 'UPLB', 'Park'),
  (1153,true, NOW(), 'semi-finals', 165, 'Freedom Park', 'UPLB', 'Park'),
  (1154,true, NOW(), 'semi-finals', 165, 'Freedom Park', 'UPLB', 'Park'),
  (1155,true, NOW(), 'finals', 165,'Freedom Park', 'UPLB', 'Park'),
  (1156,true, NOW(), 'elimination', 166, 'Baker Hall', 'UPLB', 'Gym'),
  (1157,true, NOW(), 'elimination', 166, 'Copeland Gym','UPLB', 'Gym'),
  (1158,true, NOW(), 'elimination', 166, 'Physci Building', 'UPLB', 'Building'),
  (1159,true, NOW(), 'elimination', 166, 'Freedom Park', 'UPLB', 'Park'),
  (1160,true, NOW(), 'semi-finals', 166, 'Freedom Park', 'UPLB', 'Park'),
  (1161,true, NOW(), 'semi-finals', 166, 'Freedom Park', 'UPLB', 'Park'),
  (1162,true, NOW(), 'finals', 166,'Freedom Park', 'UPLB', 'Park'),
  (1163,true, NOW(), 'elimination', 167, 'Baker Hall', 'UPLB', 'Gym'),
  (1164,true, NOW(), 'elimination', 167, 'Copeland Gym','UPLB', 'Gym'),
  (1165,true, NOW(), 'elimination', 167, 'Physci Building', 'UPLB', 'Building'),
  (1166,true, NOW(), 'elimination', 167, 'Freedom Park', 'UPLB', 'Park'),
  (1167,true, NOW(), 'semi-finals', 167, 'Freedom Park', 'UPLB', 'Park'),
  (1168,true, NOW(), 'semi-finals', 167, 'Freedom Park', 'UPLB', 'Park'),
  (1169,true, NOW(), 'finals', 167,'Freedom Park', 'UPLB', 'Park'),
  (1170,true, NOW(), 'elimination', 168, 'Baker Hall', 'UPLB', 'Gym'),
  (1171,true, NOW(), 'elimination', 168, 'Copeland Gym','UPLB', 'Gym'),
  (1172,true, NOW(), 'elimination', 168, 'Physci Building', 'UPLB', 'Building'),
  (1173,true, NOW(), 'elimination', 168, 'Freedom Park', 'UPLB', 'Park'),
  (1174,true, NOW(), 'semi-finals', 168, 'Freedom Park', 'UPLB', 'Park'),
  (1175,true, NOW(), 'semi-finals', 168, 'Freedom Park', 'UPLB', 'Park'),
  (1176,true, NOW(), 'finals', 168,'Freedom Park', 'UPLB', 'Park');


delete from team;
/*
  create teams
*/
INSERT INTO 
  team 
VALUES 
  (1, 'Team 1', '#75e657', 1),
(2, 'Team 2', '#e8471c', 1),
(3, 'Team 3', '#54c74c', 1),
(4, 'Team 4', '#28a5df', 1),
(5, 'Team 5', '#d89b05', 1),
(6, 'Team 6', '#8048da', 1),
(7, 'Team 7', '#aef06c', 1),
(8, 'Team 8', '#e9e99c', 1),
(9, 'Team 9', '#d18e15', 2),
(10, 'Team 10', '#b7e6ef', 2),
(11, 'Team 11', '#414b3d', 2),
(12, 'Team 12', '#173ea1', 2),
(13, 'Team 13', '#dc8baa', 2),
(14, 'Team 14', '#e03826', 2),
(15, 'Team 15', '#b24e32', 2),
(16, 'Team 16', '#0d1844', 2),
(17, 'Team 17', '#b8a7be', 3),
(18, 'Team 18', '#c48fe5', 3),
(19, 'Team 19', '#bbbf58', 3),
(20, 'Team 20', '#0c8ea9', 3),
(21, 'Team 21', '#eac167', 3),
(22, 'Team 22', '#501be9', 3),
(23, 'Team 23', '#20e930', 3),
(24, 'Team 24', '#eac49a', 3),
(25, 'Team 25', '#25e5bb', 4),
(26, 'Team 26', '#34c1b6', 4),
(27, 'Team 27', '#6767e2', 4),
(28, 'Team 28', '#442e79', 4),
(29, 'Team 29', '#2e2937', 4),
(30, 'Team 30', '#1d02c3', 4),
(31, 'Team 31', '#3e9207', 4),
(32, 'Team 32', '#13cb46', 4),
(33, 'Team 33', '#0e0f7c', 5),
(34, 'Team 34', '#e69964', 5),
(35, 'Team 35', '#20fb45', 5),
(36, 'Team 36', '#55c75b', 5),
(37, 'Team 37', '#03ea26', 5),
(38, 'Team 38', '#733262', 5),
(39, 'Team 39', '#8b494a', 5),
(40, 'Team 40', '#75ad3a', 5),
(41, 'Team 41', '#782928', 6),
(42, 'Team 42', '#5bd5b9', 6),
(43, 'Team 43', '#3b5293', 6),
(44, 'Team 44', '#4fb6d6', 6),
(45, 'Team 45', '#476e0a', 6),
(46, 'Team 46', '#019524', 6),
(47, 'Team 47', '#9bdb32', 6),
(48, 'Team 48', '#7cfb75', 6),
(49, 'Team 49', '#4ec104', 7),
(50, 'Team 50', '#c98b00', 7),
(51, 'Team 51', '#b4c5fd', 7),
(52, 'Team 52', '#1c47b4', 7),
(53, 'Team 53', '#f4f70d', 7),
(54, 'Team 54', '#c71596', 7),
(55, 'Team 55', '#1653fc', 7),
(56, 'Team 56', '#6859dc', 7),
(57, 'Team 57', '#3f0285', 8),
(58, 'Team 58', '#87d9c5', 8),
(59, 'Team 59', '#bd29fc', 8),
(60, 'Team 60', '#5339a7', 8),
(61, 'Team 61', '#14eda1', 8),
(62, 'Team 62', '#26f57b', 8),
(63, 'Team 63', '#ee25c7', 8),
(64, 'Team 64', '#44a44c', 8),
(65, 'Team 65', '#38c456', 9),
(66, 'Team 66', '#e3bb03', 9),
(67, 'Team 67', '#f0a5ae', 9),
(68, 'Team 68', '#e57257', 9),
(69, 'Team 69', '#c8f249', 9),
(70, 'Team 70', '#bd201e', 9),
(71, 'Team 71', '#6a5071', 9),
(72, 'Team 72', '#67c977', 9),
(73, 'Team 73', '#904fe9', 10),
(74, 'Team 74', '#957a2d', 10),
(75, 'Team 75', '#a5b397', 10),
(76, 'Team 76', '#1cc835', 10),
(77, 'Team 77', '#25fb9b', 10),
(78, 'Team 78', '#256fe7', 10),
(79, 'Team 79', '#1319d6', 10),
(80, 'Team 80', '#af16c2', 10),
(81, 'Team 81', '#2b5e63', 11),
(82, 'Team 82', '#be4189', 11),
(83, 'Team 83', '#0dcef3', 11),
(84, 'Team 84', '#e479b8', 11),
(85, 'Team 85', '#c97491', 11),
(86, 'Team 86', '#1691e2', 11),
(87, 'Team 87', '#0048e0', 11),
(88, 'Team 88', '#32a3a8', 11),
(89, 'Team 89', '#0344fe', 12),
(90, 'Team 90', '#d26b20', 12),
(91, 'Team 91', '#d3d369', 12),
(92, 'Team 92', '#dace47', 12),
(93, 'Team 93', '#c4ab29', 12),
(94, 'Team 94', '#04edce', 12),
(95, 'Team 95', '#ed9d04', 12),
(96, 'Team 96', '#d6cf7f', 12),
(97, 'Team 97', '#2c3a3b', 13),
(98, 'Team 98', '#a5ac4d', 13),
(99, 'Team 99', '#e97f58', 13),
(100, 'Team 100', '#3aa759', 13),
(101, 'Team 101', '#a275d0', 13),
(102, 'Team 102', '#9be3e7', 13),
(103, 'Team 103', '#82ca59', 13),
(104, 'Team 104', '#cded1a', 13),
(105, 'Team 105', '#572465', 14),
(106, 'Team 106', '#a9228a', 14),
(107, 'Team 107', '#574f35', 14),
(108, 'Team 108', '#b562c7', 14),
(109, 'Team 109', '#7e0b26', 14),
(110, 'Team 110', '#553f7d', 14),
(111, 'Team 111', '#09b670', 14),
(112, 'Team 112', '#b626d6', 14),
(113, 'Team 113', '#726d65', 15),
(114, 'Team 114', '#0341ed', 15),
(115, 'Team 115', '#eadc34', 15),
(116, 'Team 116', '#34c893', 15),
(117, 'Team 117', '#694a79', 15),
(118, 'Team 118', '#43b390', 15),
(119, 'Team 119', '#0e3781', 15),
(120, 'Team 120', '#f9ceaa', 15),
(121, 'Team 121', '#1efa63', 16),
(122, 'Team 122', '#2c86ed', 16),
(123, 'Team 123', '#0c05e1', 16),
(124, 'Team 124', '#93f495', 16),
(125, 'Team 125', '#051a0e', 16),
(126, 'Team 126', '#c3c792', 16),
(127, 'Team 127', '#971092', 16),
(128, 'Team 128', '#a92bf7', 16),
(129, 'Team 129', '#8bd1f4', 17),
(130, 'Team 130', '#55302f', 17),
(131, 'Team 131', '#ca724b', 17),
(132, 'Team 132', '#ada098', 17),
(133, 'Team 133', '#a92633', 17),
(134, 'Team 134', '#a0a41c', 17),
(135, 'Team 135', '#486b3b', 17),
(136, 'Team 136', '#84ce4a', 17),
(137, 'Team 137', '#e41aa3', 18),
(138, 'Team 138', '#71cd2c', 18),
(139, 'Team 139', '#bf0ce7', 18),
(140, 'Team 140', '#ae255e', 18),
(141, 'Team 141', '#8e76f2', 18),
(142, 'Team 142', '#029ff9', 18),
(143, 'Team 143', '#57f302', 18),
(144, 'Team 144', '#aa2bb0', 18),
(145, 'Team 145', '#81504b', 19),
(146, 'Team 146', '#7f6d3f', 19),
(147, 'Team 147', '#6af8f6', 19),
(148, 'Team 148', '#354bf1', 19),
(149, 'Team 149', '#8e5196', 19),
(150, 'Team 150', '#337523', 19),
(151, 'Team 151', '#fe8862', 19),
(152, 'Team 152', '#394a90', 19),
(153, 'Team 153', '#845946', 20),
(154, 'Team 154', '#4bf7b4', 20),
(155, 'Team 155', '#88446e', 20),
(156, 'Team 156', '#e65540', 20),
(157, 'Team 157', '#e1ca45', 20),
(158, 'Team 158', '#931bfa', 20),
(159, 'Team 159', '#7324af', 20),
(160, 'Team 160', '#444e8f', 20),
(161, 'Team 161', '#7c03c3', 21),
(162, 'Team 162', '#1185f4', 21),
(163, 'Team 163', '#d877c9', 21),
(164, 'Team 164', '#3569ad', 21),
(165, 'Team 165', '#72643e', 21),
(166, 'Team 166', '#a63f84', 21),
(167, 'Team 167', '#23aa1a', 21),
(168, 'Team 168', '#f917f6', 21),
(169, 'Team 169', '#543f37', 22),
(170, 'Team 170', '#ccf90c', 22),
(171, 'Team 171', '#fcbccd', 22),
(172, 'Team 172', '#303e88', 22),
(173, 'Team 173', '#864f3e', 22),
(174, 'Team 174', '#7b0add', 22),
(175, 'Team 175', '#331662', 22),
(176, 'Team 176', '#2f78f3', 22),
(177, 'Team 177', '#f54369', 23),
(178, 'Team 178', '#d57d88', 23),
(179, 'Team 179', '#abf99b', 23),
(180, 'Team 180', '#eaee41', 23),
(181, 'Team 181', '#d10b14', 23),
(182, 'Team 182', '#65ec48', 23),
(183, 'Team 183', '#be16e4', 23),
(184, 'Team 184', '#83641e', 23),
(185, 'Team 185', '#8d7328', 24),
(186, 'Team 186', '#be172d', 24),
(187, 'Team 187', '#46fa9a', 24),
(188, 'Team 188', '#676b84', 24),
(189, 'Team 189', '#a73395', 24),
(190, 'Team 190', '#b9264e', 24),
(191, 'Team 191', '#ff797e', 24),
(192, 'Team 192', '#17ee2d', 24);
/*
  create players
*/
  CALL add_account(
    'Juan',                                         /*firstname*/
    'Player',                                       /*middlename*/
    'Dela Cruz',                                    /*lastname*/
    'playerJuan@gmail.com',                         /*email*/
    'playerJuan',                                   /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCE',                                         /*course*/
    NOW(),                                      /*birthday*/
    'CEAT',                                         /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '04',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Tuu',                                          /*firstname*/
    'Player',                                       /*middlename*/
    'Pak',                                          /*lastname*/
    'playerTuu@gmail.com',                          /*email*/
    'playerTuu',                                    /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSA',                                          /*course*/
    NOW(),                                      /*birthday*/
    'CA',                                           /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '05',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Tresa',                                        /*firstname*/
    'Player',                                       /*middlename*/
    'Syeta',                                          /*lastname*/
    'playerTresa@gmail.com',                        /*email*/
    'playerTresa',                                  /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSStat',                                       /*course*/
    NOW(),                                      /*birthday*/
    'CAS',                                          /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '06',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Por',                                          /*firstname*/
    'Player',                                       /*middlename*/
    'Tipayb',                                       /*lastname*/
    'playerPor@gmail.com',                          /*email*/
    'playerPor',                                    /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSBio',                                        /*course*/
    NOW(),                                      /*birthday*/
    'CAS',                                          /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '07',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Payb',                                         /*firstname*/
    'Player',                                       /*middlename*/
    'Ber',                                          /*lastname*/
    'playerPayb@gmail.com',                         /*email*/
    'playerPayb',                                   /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSF',                                          /*course*/
    NOW(),                                      /*birthday*/
    'CFNR',                                         /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '08',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Bert',                                         /*firstname*/
    'Tran',                                         /*middlename*/
    'Ting',                                         /*lastname*/
    'bert@gmail.com',                               /*email*/
    'Bert',                                         /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSChem',                                       /*course*/
    NOW(),                                      /*birthday*/
    'CAS',                                          /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '09',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL add_account(
    'David',                                        /*firstname*/
    'Delos Santos',                                 /*middlename*/
    'Dimaano',                                      /*lastname*/
    'david@gmail.com',                              /*email*/
    'David',                                        /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSChem',                                       /*course*/
    NOW(),                                      /*birthday*/
    'CAS',                                          /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    false,                                          /*is_player*/
    NULL,                                           /*player_jersey_num*/
    NULL                                            /*player_role*/
  );
/*
  create connections:
    -teams of game_events
    -players of teams
    -teams of match_events
*/

delete from team_account;
/*
  players of teams
*/
INSERT INTO 
  team_account 
VALUES
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 1),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 2),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 3),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 4),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 5),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 6),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 7),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 8),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 9),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 10),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 11),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 12),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 13),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 14),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 15),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 16),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 17),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 18),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 19),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 20),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 21),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 22),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 23),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 24),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 25),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 26),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 27),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 28),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 29),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 30),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 31),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 32),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 33),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 34),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 35),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 36),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 37),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 38),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 39),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 40),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 41),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 42),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 43),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 44),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 45),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 46),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 47),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 48),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 49),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 50),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 51),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 52),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 53),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 54),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 55),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 56),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 57),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 58),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 59),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 60),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 61),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 62),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 63),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 64),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 65),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 66),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 67),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 68),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 69),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 70),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 71),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 72),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 73),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 74),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 75),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 76),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 77),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 78),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 79),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 80),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 81),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 82),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 83),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 84),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 85),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 86),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 87),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 88),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 89),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 90),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 91),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 92),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 93),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 94),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 95),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 96),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 97),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 98),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 99),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 100),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 101),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 102),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 103),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 104),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 105),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 106),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 107),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 108),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 109),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 110),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 111),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 112),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 113),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 114),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 115),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 116),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 117),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 118),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 119),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 120),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 121),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 122),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 123),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 124),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 125),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 126),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 127),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 128),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 129),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 130),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 131),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 132),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 133),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 134),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 135),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 136),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 137),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 138),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 139),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 140),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 141),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 142),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 143),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 144),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 145),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 146),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 147),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 148),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 149),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 150),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 151),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 152),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 153),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 154),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 155),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 156),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 157),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 158),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 159),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 160),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 161),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 162),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 163),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 164),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 165),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 166),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 167),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 168),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 169),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 170),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 171),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 172),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 173),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 174),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 175),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 176),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 177),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 178),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 179),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 180),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 181),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 182),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 183),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 184),
  ((SELECT account_id FROM account WHERE player_jersey_num = '1'), 185),
  ((SELECT account_id FROM account WHERE player_jersey_num = '2'), 186),
  ((SELECT account_id FROM account WHERE player_jersey_num = '3'), 187),
  ((SELECT account_id FROM account WHERE player_jersey_num = '4'), 188),
  ((SELECT account_id FROM account WHERE player_jersey_num = '5'), 189),
  ((SELECT account_id FROM account WHERE player_jersey_num = '6'), 190),
  ((SELECT account_id FROM account WHERE player_jersey_num = '7'), 191),
  ((SELECT account_id FROM account WHERE player_jersey_num = '8'), 192);
delete from match_event_team;
/*
  teams of match_events
*/
INSERT INTO 
  match_event_team 
VALUES 
/*eliminations for sport with sport_id 1*/
(1, 1, 25),
(2, 1, 3),
(3, 2, 25),
(4, 2, 5),
(5, 3, 25),
(6, 3, 1),
(7, 4, 25),
(8, 4, 3),
/*semis for sport with sport_id 1*/
(1, 5, 25),
(3, 5, 1),
(5, 6, 25),
(7, 6, 3),
/*finals for sport with sport_id 1*/
(1, 7, 25),
(5, 7, 3),
/*eliminations for sport with sport_id 2*/
(9, 8, 25),
(10, 8, 3),
(11, 9, 25),
(12, 9, 5),
(13, 10, 25),
(14, 10, 1),
(15, 11, 25),
(16, 11, 3),
/*semis for sport with sport_id 2*/
(9, 12, 25),
(11, 12, 1),
(13, 13, 25),
(15, 13, 3),
/*finals for sport with sport_id 2*/
(9, 14, 25),
(13, 14, 3),
/*eliminations for sport with sport_id 3*/
(17, 15, 25),
(18, 15, 3),
(19, 16, 25),
(20, 16, 5),
(21, 17, 25),
(22, 17, 1),
(23, 18, 25),
(24, 18, 3),
/*semis for sport with sport_id 3*/
(17, 19, 25),
(19, 19, 1),
(21, 20, 25),
(23, 20, 3),
/*finals for sport with sport_id 3*/
(17, 21, 25),
(21, 21, 3),
/*eliminations for sport with sport_id 4*/
(25, 22, 25),
(26, 22, 3),
(27, 23, 25),
(28, 23, 5),
(29, 24, 25),
(30, 24, 1),
(31, 25, 25),
(32, 25, 3),
/*semis for sport with sport_id 4*/
(25, 26, 25),
(27, 26, 1),
(29, 27, 25),
(31, 27, 3),
/*finals for sport with sport_id 4*/
(25, 28, 25),
(29, 28, 3),
/*eliminations for sport with sport_id 5*/
(33, 29, 25),
(34, 29, 3),
(35, 30, 25),
(36, 30, 5),
(37, 31, 25),
(38, 31, 1),
(39, 32, 25),
(40, 32, 3),
/*semis for sport with sport_id 5*/
(33, 33, 25),
(35, 33, 1),
(37, 34, 25),
(39, 34, 3),
/*finals for sport with sport_id 5*/
(33, 35, 25),
(37, 35, 3),
/*eliminations for sport with sport_id 6*/
(41, 36, 25),
(42, 36, 3),
(43, 37, 25),
(44, 37, 5),
(45, 38, 25),
(46, 38, 1),
(47, 39, 25),
(48, 39, 3),
/*semis for sport with sport_id 6*/
(41, 40, 25),
(43, 40, 1),
(45, 41, 25),
(47, 41, 3),
/*finals for sport with sport_id 6*/
(41, 42, 25),
(45, 42, 3),
/*eliminations for sport with sport_id 7*/
(49, 43, 25),
(50, 43, 3),
(51, 44, 25),
(52, 44, 5),
(53, 45, 25),
(54, 45, 1),
(55, 46, 25),
(56, 46, 3),
/*semis for sport with sport_id 7*/
(49, 47, 25),
(51, 47, 1),
(53, 48, 25),
(55, 48, 3),
/*finals for sport with sport_id 7*/
(49, 49, 25),
(53, 49, 3),
/*eliminations for sport with sport_id 8*/
(57, 50, 25),
(58, 50, 3),
(59, 51, 25),
(60, 51, 5),
(61, 52, 25),
(62, 52, 1),
(63, 53, 25),
(64, 53, 3),
/*semis for sport with sport_id 8*/
(57, 54, 25),
(59, 54, 1),
(61, 55, 25),
(63, 55, 3),
/*finals for sport with sport_id 8*/
(57, 56, 25),
(61, 56, 3),
/*eliminations for sport with sport_id 9*/
(65, 57, 25),
(66, 57, 3),
(67, 58, 25),
(68, 58, 5),
(69, 59, 25),
(70, 59, 1),
(71, 60, 25),
(72, 60, 3),
/*semis for sport with sport_id 9*/
(65, 61, 25),
(67, 61, 1),
(69, 62, 25),
(71, 62, 3),
/*finals for sport with sport_id 9*/
(65, 63, 25),
(69, 63, 3),
/*eliminations for sport with sport_id 10*/
(73, 64, 25),
(74, 64, 3),
(75, 65, 25),
(76, 65, 5),
(77, 66, 25),
(78, 66, 1),
(79, 67, 25),
(80, 67, 3),
/*semis for sport with sport_id 10*/
(73, 68, 25),
(75, 68, 1),
(77, 69, 25),
(79, 69, 3),
/*finals for sport with sport_id 10*/
(73, 70, 25),
(77, 70, 3),
/*eliminations for sport with sport_id 11*/
(81, 71, 25),
(82, 71, 3),
(83, 72, 25),
(84, 72, 5),
(85, 73, 25),
(86, 73, 1),
(87, 74, 25),
(88, 74, 3),
/*semis for sport with sport_id 11*/
(81, 75, 25),
(83, 75, 1),
(85, 76, 25),
(87, 76, 3),
/*finals for sport with sport_id 11*/
(81, 77, 25),
(85, 77, 3),
/*eliminations for sport with sport_id 12*/
(89, 78, 25),
(90, 78, 3),
(91, 79, 25),
(92, 79, 5),
(93, 80, 25),
(94, 80, 1),
(95, 81, 25),
(96, 81, 3),
/*semis for sport with sport_id 12*/
(89, 82, 25),
(91, 82, 1),
(93, 83, 25),
(95, 83, 3),
/*finals for sport with sport_id 12*/
(89, 84, 25),
(93, 84, 3),
/*eliminations for sport with sport_id 13*/
(97, 85, 25),
(98, 85, 3),
(99, 86, 25),
(100, 86, 5),
(101, 87, 25),
(102, 87, 1),
(103, 88, 25),
(104, 88, 3),
/*semis for sport with sport_id 13*/
(97, 89, 25),
(99, 89, 1),
(101, 90, 25),
(103, 90, 3),
/*finals for sport with sport_id 13*/
(97, 91, 25),
(101, 91, 3),
/*eliminations for sport with sport_id 14*/
(105, 92, 25),
(106, 92, 3),
(107, 93, 25),
(108, 93, 5),
(109, 94, 25),
(110, 94, 1),
(111, 95, 25),
(112, 95, 3),
/*semis for sport with sport_id 14*/
(105, 96, 25),
(107, 96, 1),
(109, 97, 25),
(111, 97, 3),
/*finals for sport with sport_id 14*/
(105, 98, 25),
(109, 98, 3),
/*eliminations for sport with sport_id 15*/
(113, 99, 25),
(114, 99, 3),
(115, 100, 25),
(116, 100, 5),
(117, 101, 25),
(118, 101, 1),
(119, 102, 25),
(120, 102, 3),
/*semis for sport with sport_id 15*/
(113, 103, 25),
(115, 103, 1),
(117, 104, 25),
(119, 104, 3),
/*finals for sport with sport_id 15*/
(113, 105, 25),
(117, 105, 3),
/*eliminations for sport with sport_id 16*/
(121, 106, 25),
(122, 106, 3),
(123, 107, 25),
(124, 107, 5),
(125, 108, 25),
(126, 108, 1),
(127, 109, 25),
(128, 109, 3),
/*semis for sport with sport_id 16*/
(121, 110, 25),
(123, 110, 1),
(125, 111, 25),
(127, 111, 3),
/*finals for sport with sport_id 16*/
(121, 112, 25),
(125, 112, 3),
/*eliminations for sport with sport_id 17*/
(129, 113, 25),
(130, 113, 3),
(131, 114, 25),
(132, 114, 5),
(133, 115, 25),
(134, 115, 1),
(135, 116, 25),
(136, 116, 3),
/*semis for sport with sport_id 17*/
(129, 117, 25),
(131, 117, 1),
(133, 118, 25),
(135, 118, 3),
/*finals for sport with sport_id 17*/
(129, 119, 25),
(133, 119, 3),
/*eliminations for sport with sport_id 18*/
(137, 120, 25),
(138, 120, 3),
(139, 121, 25),
(140, 121, 5),
(141, 122, 25),
(142, 122, 1),
(143, 123, 25),
(144, 123, 3),
/*semis for sport with sport_id 18*/
(137, 124, 25),
(139, 124, 1),
(141, 125, 25),
(143, 125, 3),
/*finals for sport with sport_id 18*/
(137, 126, 25),
(141, 126, 3),
/*eliminations for sport with sport_id 19*/
(145, 127, 25),
(146, 127, 3),
(147, 128, 25),
(148, 128, 5),
(149, 129, 25),
(150, 129, 1),
(151, 130, 25),
(152, 130, 3),
/*semis for sport with sport_id 19*/
(145, 131, 25),
(147, 131, 1),
(149, 132, 25),
(151, 132, 3),
/*finals for sport with sport_id 19*/
(145, 133, 25),
(149, 133, 3),
/*eliminations for sport with sport_id 20*/
(153, 134, 25),
(154, 134, 3),
(155, 135, 25),
(156, 135, 5),
(157, 136, 25),
(158, 136, 1),
(159, 137, 25),
(160, 137, 3),
/*semis for sport with sport_id 20*/
(153, 138, 25),
(155, 138, 1),
(157, 139, 25),
(159, 139, 3),
/*finals for sport with sport_id 20*/
(153, 140, 25),
(157, 140, 3),
/*eliminations for sport with sport_id 21*/
(161, 141, 25),
(162, 141, 3),
(163, 142, 25),
(164, 142, 5),
(165, 143, 25),
(166, 143, 1),
(167, 144, 25),
(168, 144, 3),
/*semis for sport with sport_id 21*/
(161, 145, 25),
(163, 145, 1),
(165, 146, 25),
(167, 146, 3),
/*finals for sport with sport_id 21*/
(161, 147, 25),
(165, 147, 3),
/*eliminations for sport with sport_id 22*/
(169, 148, 25),
(170, 148, 3),
(171, 149, 25),
(172, 149, 5),
(173, 150, 25),
(174, 150, 1),
(175, 151, 25),
(176, 151, 3),
/*semis for sport with sport_id 22*/
(169, 152, 25),
(171, 152, 1),
(173, 153, 25),
(175, 153, 3),
/*finals for sport with sport_id 22*/
(169, 154, 25),
(173, 154, 3),
/*eliminations for sport with sport_id 23*/
(177, 155, 25),
(178, 155, 3),
(179, 156, 25),
(180, 156, 5),
(181, 157, 25),
(182, 157, 1),
(183, 158, 25),
(184, 158, 3),
/*semis for sport with sport_id 23*/
(177, 159, 25),
(179, 159, 1),
(181, 160, 25),
(183, 160, 3),
/*finals for sport with sport_id 23*/
(177, 161, 25),
(181, 161, 3),
/*eliminations for sport with sport_id 24*/
(185, 162, 25),
(186, 162, 3),
(187, 163, 25),
(188, 163, 5),
(189, 164, 25),
(190, 164, 1),
(191, 165, 25),
(192, 165, 3),
/*semis for sport with sport_id 24*/
(185, 166, 25),
(187, 166, 1),
(189, 167, 25),
(191, 167, 3),
/*finals for sport with sport_id 24*/
(185, 168, 25),
(189, 168, 3),
/*eliminations for sport with sport_id 25*/
(1, 169, 25),
(2, 169, 3),
(3, 170, 25),
(4, 170, 5),
(5, 171, 25),
(6, 171, 1),
(7, 172, 25),
(8, 172, 3),
/*semis for sport with sport_id 25*/
(1, 173, 25),
(3, 173, 1),
(5, 174, 25),
(7, 174, 3),
/*finals for sport with sport_id 25*/
(1, 175, 25),
(5, 175, 3),
/*eliminations for sport with sport_id 26*/
(9, 176, 25),
(10, 176, 3),
(11, 177, 25),
(12, 177, 5),
(13, 178, 25),
(14, 178, 1),
(15, 179, 25),
(16, 179, 3),
/*semis for sport with sport_id 26*/
(9, 180, 25),
(11, 180, 1),
(13, 181, 25),
(15, 181, 3),
/*finals for sport with sport_id 26*/
(9, 182, 25),
(13, 182, 3),
/*eliminations for sport with sport_id 27*/
(17, 183, 25),
(18, 183, 3),
(19, 184, 25),
(20, 184, 5),
(21, 185, 25),
(22, 185, 1),
(23, 186, 25),
(24, 186, 3),
/*semis for sport with sport_id 27*/
(17, 187, 25),
(19, 187, 1),
(21, 188, 25),
(23, 188, 3),
/*finals for sport with sport_id 27*/
(17, 189, 25),
(21, 189, 3),
/*eliminations for sport with sport_id 28*/
(25, 190, 25),
(26, 190, 3),
(27, 191, 25),
(28, 191, 5),
(29, 192, 25),
(30, 192, 1),
(31, 193, 25),
(32, 193, 3),
/*semis for sport with sport_id 28*/
(25, 194, 25),
(27, 194, 1),
(29, 195, 25),
(31, 195, 3),
/*finals for sport with sport_id 28*/
(25, 196, 25),
(29, 196, 3),
/*eliminations for sport with sport_id 29*/
(33, 197, 25),
(34, 197, 3),
(35, 198, 25),
(36, 198, 5),
(37, 199, 25),
(38, 199, 1),
(39, 200, 25),
(40, 200, 3),
/*semis for sport with sport_id 29*/
(33, 201, 25),
(35, 201, 1),
(37, 202, 25),
(39, 202, 3),
/*finals for sport with sport_id 29*/
(33, 203, 25),
(37, 203, 3),
/*eliminations for sport with sport_id 30*/
(41, 204, 25),
(42, 204, 3),
(43, 205, 25),
(44, 205, 5),
(45, 206, 25),
(46, 206, 1),
(47, 207, 25),
(48, 207, 3),
/*semis for sport with sport_id 30*/
(41, 208, 25),
(43, 208, 1),
(45, 209, 25),
(47, 209, 3),
/*finals for sport with sport_id 30*/
(41, 210, 25),
(45, 210, 3),
/*eliminations for sport with sport_id 31*/
(49, 211, 25),
(50, 211, 3),
(51, 212, 25),
(52, 212, 5),
(53, 213, 25),
(54, 213, 1),
(55, 214, 25),
(56, 214, 3),
/*semis for sport with sport_id 31*/
(49, 215, 25),
(51, 215, 1),
(53, 216, 25),
(55, 216, 3),
/*finals for sport with sport_id 31*/
(49, 217, 25),
(53, 217, 3),
/*eliminations for sport with sport_id 32*/
(57, 218, 25),
(58, 218, 3),
(59, 219, 25),
(60, 219, 5),
(61, 220, 25),
(62, 220, 1),
(63, 221, 25),
(64, 221, 3),
/*semis for sport with sport_id 32*/
(57, 222, 25),
(59, 222, 1),
(61, 223, 25),
(63, 223, 3),
/*finals for sport with sport_id 32*/
(57, 224, 25),
(61, 224, 3),
/*eliminations for sport with sport_id 33*/
(65, 225, 25),
(66, 225, 3),
(67, 226, 25),
(68, 226, 5),
(69, 227, 25),
(70, 227, 1),
(71, 228, 25),
(72, 228, 3),
/*semis for sport with sport_id 33*/
(65, 229, 25),
(67, 229, 1),
(69, 230, 25),
(71, 230, 3),
/*finals for sport with sport_id 33*/
(65, 231, 25),
(69, 231, 3),
/*eliminations for sport with sport_id 34*/
(73, 232, 25),
(74, 232, 3),
(75, 233, 25),
(76, 233, 5),
(77, 234, 25),
(78, 234, 1),
(79, 235, 25),
(80, 235, 3),
/*semis for sport with sport_id 34*/
(73, 236, 25),
(75, 236, 1),
(77, 237, 25),
(79, 237, 3),
/*finals for sport with sport_id 34*/
(73, 238, 25),
(77, 238, 3),
/*eliminations for sport with sport_id 35*/
(81, 239, 25),
(82, 239, 3),
(83, 240, 25),
(84, 240, 5),
(85, 241, 25),
(86, 241, 1),
(87, 242, 25),
(88, 242, 3),
/*semis for sport with sport_id 35*/
(81, 243, 25),
(83, 243, 1),
(85, 244, 25),
(87, 244, 3),
/*finals for sport with sport_id 35*/
(81, 245, 25),
(85, 245, 3),
/*eliminations for sport with sport_id 36*/
(89, 246, 25),
(90, 246, 3),
(91, 247, 25),
(92, 247, 5),
(93, 248, 25),
(94, 248, 1),
(95, 249, 25),
(96, 249, 3),
/*semis for sport with sport_id 36*/
(89, 250, 25),
(91, 250, 1),
(93, 251, 25),
(95, 251, 3),
/*finals for sport with sport_id 36*/
(89, 252, 25),
(93, 252, 3),
/*eliminations for sport with sport_id 37*/
(97, 253, 25),
(98, 253, 3),
(99, 254, 25),
(100, 254, 5),
(101, 255, 25),
(102, 255, 1),
(103, 256, 25),
(104, 256, 3),
/*semis for sport with sport_id 37*/
(97, 257, 25),
(99, 257, 1),
(101, 258, 25),
(103, 258, 3),
/*finals for sport with sport_id 37*/
(97, 259, 25),
(101, 259, 3),
/*eliminations for sport with sport_id 38*/
(105, 260, 25),
(106, 260, 3),
(107, 261, 25),
(108, 261, 5),
(109, 262, 25),
(110, 262, 1),
(111, 263, 25),
(112, 263, 3),
/*semis for sport with sport_id 38*/
(105, 264, 25),
(107, 264, 1),
(109, 265, 25),
(111, 265, 3),
/*finals for sport with sport_id 38*/
(105, 266, 25),
(109, 266, 3),
/*eliminations for sport with sport_id 39*/
(113, 267, 25),
(114, 267, 3),
(115, 268, 25),
(116, 268, 5),
(117, 269, 25),
(118, 269, 1),
(119, 270, 25),
(120, 270, 3),
/*semis for sport with sport_id 39*/
(113, 271, 25),
(115, 271, 1),
(117, 272, 25),
(119, 272, 3),
/*finals for sport with sport_id 39*/
(113, 273, 25),
(117, 273, 3),
/*eliminations for sport with sport_id 40*/
(121, 274, 25),
(122, 274, 3),
(123, 275, 25),
(124, 275, 5),
(125, 276, 25),
(126, 276, 1),
(127, 277, 25),
(128, 277, 3),
/*semis for sport with sport_id 40*/
(121, 278, 25),
(123, 278, 1),
(125, 279, 25),
(127, 279, 3),
/*finals for sport with sport_id 40*/
(121, 280, 25),
(125, 280, 3),
/*eliminations for sport with sport_id 41*/
(129, 281, 25),
(130, 281, 3),
(131, 282, 25),
(132, 282, 5),
(133, 283, 25),
(134, 283, 1),
(135, 284, 25),
(136, 284, 3),
/*semis for sport with sport_id 41*/
(129, 285, 25),
(131, 285, 1),
(133, 286, 25),
(135, 286, 3),
/*finals for sport with sport_id 41*/
(129, 287, 25),
(133, 287, 3),
/*eliminations for sport with sport_id 42*/
(137, 288, 25),
(138, 288, 3),
(139, 289, 25),
(140, 289, 5),
(141, 290, 25),
(142, 290, 1),
(143, 291, 25),
(144, 291, 3),
/*semis for sport with sport_id 42*/
(137, 292, 25),
(139, 292, 1),
(141, 293, 25),
(143, 293, 3),
/*finals for sport with sport_id 42*/
(137, 294, 25),
(141, 294, 3),
/*eliminations for sport with sport_id 43*/
(145, 295, 25),
(146, 295, 3),
(147, 296, 25),
(148, 296, 5),
(149, 297, 25),
(150, 297, 1),
(151, 298, 25),
(152, 298, 3),
/*semis for sport with sport_id 43*/
(145, 299, 25),
(147, 299, 1),
(149, 300, 25),
(151, 300, 3),
/*finals for sport with sport_id 43*/
(145, 301, 25),
(149, 301, 3),
/*eliminations for sport with sport_id 44*/
(153, 302, 25),
(154, 302, 3),
(155, 303, 25),
(156, 303, 5),
(157, 304, 25),
(158, 304, 1),
(159, 305, 25),
(160, 305, 3),
/*semis for sport with sport_id 44*/
(153, 306, 25),
(155, 306, 1),
(157, 307, 25),
(159, 307, 3),
/*finals for sport with sport_id 44*/
(153, 308, 25),
(157, 308, 3),
/*eliminations for sport with sport_id 45*/
(161, 309, 25),
(162, 309, 3),
(163, 310, 25),
(164, 310, 5),
(165, 311, 25),
(166, 311, 1),
(167, 312, 25),
(168, 312, 3),
/*semis for sport with sport_id 45*/
(161, 313, 25),
(163, 313, 1),
(165, 314, 25),
(167, 314, 3),
/*finals for sport with sport_id 45*/
(161, 315, 25),
(165, 315, 3),
/*eliminations for sport with sport_id 46*/
(169, 316, 25),
(170, 316, 3),
(171, 317, 25),
(172, 317, 5),
(173, 318, 25),
(174, 318, 1),
(175, 319, 25),
(176, 319, 3),
/*semis for sport with sport_id 46*/
(169, 320, 25),
(171, 320, 1),
(173, 321, 25),
(175, 321, 3),
/*finals for sport with sport_id 46*/
(169, 322, 25),
(173, 322, 3),
/*eliminations for sport with sport_id 47*/
(177, 323, 25),
(178, 323, 3),
(179, 324, 25),
(180, 324, 5),
(181, 325, 25),
(182, 325, 1),
(183, 326, 25),
(184, 326, 3),
/*semis for sport with sport_id 47*/
(177, 327, 25),
(179, 327, 1),
(181, 328, 25),
(183, 328, 3),
/*finals for sport with sport_id 47*/
(177, 329, 25),
(181, 329, 3),
/*eliminations for sport with sport_id 48*/
(185, 330, 25),
(186, 330, 3),
(187, 331, 25),
(188, 331, 5),
(189, 332, 25),
(190, 332, 1),
(191, 333, 25),
(192, 333, 3),
/*semis for sport with sport_id 48*/
(185, 334, 25),
(187, 334, 1),
(189, 335, 25),
(191, 335, 3),
/*finals for sport with sport_id 48*/
(185, 336, 25),
(189, 336, 3),
/*eliminations for sport with sport_id 49*/
(1, 337, 25),
(2, 337, 3),
(3, 338, 25),
(4, 338, 5),
(5, 339, 25),
(6, 339, 1),
(7, 340, 25),
(8, 340, 3),
/*semis for sport with sport_id 49*/
(1, 341, 25),
(3, 341, 1),
(5, 342, 25),
(7, 342, 3),
/*finals for sport with sport_id 49*/
(1, 343, 25),
(5, 343, 3),
/*eliminations for sport with sport_id 50*/
(9, 344, 25),
(10, 344, 3),
(11, 345, 25),
(12, 345, 5),
(13, 346, 25),
(14, 346, 1),
(15, 347, 25),
(16, 347, 3),
/*semis for sport with sport_id 50*/
(9, 348, 25),
(11, 348, 1),
(13, 349, 25),
(15, 349, 3),
/*finals for sport with sport_id 50*/
(9, 350, 25),
(13, 350, 3),
/*eliminations for sport with sport_id 51*/
(17, 351, 25),
(18, 351, 3),
(19, 352, 25),
(20, 352, 5),
(21, 353, 25),
(22, 353, 1),
(23, 354, 25),
(24, 354, 3),
/*semis for sport with sport_id 51*/
(17, 355, 25),
(19, 355, 1),
(21, 356, 25),
(23, 356, 3),
/*finals for sport with sport_id 51*/
(17, 357, 25),
(21, 357, 3),
/*eliminations for sport with sport_id 52*/
(25, 358, 25),
(26, 358, 3),
(27, 359, 25),
(28, 359, 5),
(29, 360, 25),
(30, 360, 1),
(31, 361, 25),
(32, 361, 3),
/*semis for sport with sport_id 52*/
(25, 362, 25),
(27, 362, 1),
(29, 363, 25),
(31, 363, 3),
/*finals for sport with sport_id 52*/
(25, 364, 25),
(29, 364, 3),
/*eliminations for sport with sport_id 53*/
(33, 365, 25),
(34, 365, 3),
(35, 366, 25),
(36, 366, 5),
(37, 367, 25),
(38, 367, 1),
(39, 368, 25),
(40, 368, 3),
/*semis for sport with sport_id 53*/
(33, 369, 25),
(35, 369, 1),
(37, 370, 25),
(39, 370, 3),
/*finals for sport with sport_id 53*/
(33, 371, 25),
(37, 371, 3),
/*eliminations for sport with sport_id 54*/
(41, 372, 25),
(42, 372, 3),
(43, 373, 25),
(44, 373, 5),
(45, 374, 25),
(46, 374, 1),
(47, 375, 25),
(48, 375, 3),
/*semis for sport with sport_id 54*/
(41, 376, 25),
(43, 376, 1),
(45, 377, 25),
(47, 377, 3),
/*finals for sport with sport_id 54*/
(41, 378, 25),
(45, 378, 3),
/*eliminations for sport with sport_id 55*/
(49, 379, 25),
(50, 379, 3),
(51, 380, 25),
(52, 380, 5),
(53, 381, 25),
(54, 381, 1),
(55, 382, 25),
(56, 382, 3),
/*semis for sport with sport_id 55*/
(49, 383, 25),
(51, 383, 1),
(53, 384, 25),
(55, 384, 3),
/*finals for sport with sport_id 55*/
(49, 385, 25),
(53, 385, 3),
/*eliminations for sport with sport_id 56*/
(57, 386, 25),
(58, 386, 3),
(59, 387, 25),
(60, 387, 5),
(61, 388, 25),
(62, 388, 1),
(63, 389, 25),
(64, 389, 3),
/*semis for sport with sport_id 56*/
(57, 390, 25),
(59, 390, 1),
(61, 391, 25),
(63, 391, 3),
/*finals for sport with sport_id 56*/
(57, 392, 25),
(61, 392, 3),
/*eliminations for sport with sport_id 57*/
(65, 393, 25),
(66, 393, 3),
(67, 394, 25),
(68, 394, 5),
(69, 395, 25),
(70, 395, 1),
(71, 396, 25),
(72, 396, 3),
/*semis for sport with sport_id 57*/
(65, 397, 25),
(67, 397, 1),
(69, 398, 25),
(71, 398, 3),
/*finals for sport with sport_id 57*/
(65, 399, 25),
(69, 399, 3),
/*eliminations for sport with sport_id 58*/
(73, 400, 25),
(74, 400, 3),
(75, 401, 25),
(76, 401, 5),
(77, 402, 25),
(78, 402, 1),
(79, 403, 25),
(80, 403, 3),
/*semis for sport with sport_id 58*/
(73, 404, 25),
(75, 404, 1),
(77, 405, 25),
(79, 405, 3),
/*finals for sport with sport_id 58*/
(73, 406, 25),
(77, 406, 3),
/*eliminations for sport with sport_id 59*/
(81, 407, 25),
(82, 407, 3),
(83, 408, 25),
(84, 408, 5),
(85, 409, 25),
(86, 409, 1),
(87, 410, 25),
(88, 410, 3),
/*semis for sport with sport_id 59*/
(81, 411, 25),
(83, 411, 1),
(85, 412, 25),
(87, 412, 3),
/*finals for sport with sport_id 59*/
(81, 413, 25),
(85, 413, 3),
/*eliminations for sport with sport_id 60*/
(89, 414, 25),
(90, 414, 3),
(91, 415, 25),
(92, 415, 5),
(93, 416, 25),
(94, 416, 1),
(95, 417, 25),
(96, 417, 3),
/*semis for sport with sport_id 60*/
(89, 418, 25),
(91, 418, 1),
(93, 419, 25),
(95, 419, 3),
/*finals for sport with sport_id 60*/
(89, 420, 25),
(93, 420, 3),
/*eliminations for sport with sport_id 61*/
(97, 421, 25),
(98, 421, 3),
(99, 422, 25),
(100, 422, 5),
(101, 423, 25),
(102, 423, 1),
(103, 424, 25),
(104, 424, 3),
/*semis for sport with sport_id 61*/
(97, 425, 25),
(99, 425, 1),
(101, 426, 25),
(103, 426, 3),
/*finals for sport with sport_id 61*/
(97, 427, 25),
(101, 427, 3),
/*eliminations for sport with sport_id 62*/
(105, 428, 25),
(106, 428, 3),
(107, 429, 25),
(108, 429, 5),
(109, 430, 25),
(110, 430, 1),
(111, 431, 25),
(112, 431, 3),
/*semis for sport with sport_id 62*/
(105, 432, 25),
(107, 432, 1),
(109, 433, 25),
(111, 433, 3),
/*finals for sport with sport_id 62*/
(105, 434, 25),
(109, 434, 3),
/*eliminations for sport with sport_id 63*/
(113, 435, 25),
(114, 435, 3),
(115, 436, 25),
(116, 436, 5),
(117, 437, 25),
(118, 437, 1),
(119, 438, 25),
(120, 438, 3),
/*semis for sport with sport_id 63*/
(113, 439, 25),
(115, 439, 1),
(117, 440, 25),
(119, 440, 3),
/*finals for sport with sport_id 63*/
(113, 441, 25),
(117, 441, 3),
/*eliminations for sport with sport_id 64*/
(121, 442, 25),
(122, 442, 3),
(123, 443, 25),
(124, 443, 5),
(125, 444, 25),
(126, 444, 1),
(127, 445, 25),
(128, 445, 3),
/*semis for sport with sport_id 64*/
(121, 446, 25),
(123, 446, 1),
(125, 447, 25),
(127, 447, 3),
/*finals for sport with sport_id 64*/
(121, 448, 25),
(125, 448, 3),
/*eliminations for sport with sport_id 65*/
(129, 449, 25),
(130, 449, 3),
(131, 450, 25),
(132, 450, 5),
(133, 451, 25),
(134, 451, 1),
(135, 452, 25),
(136, 452, 3),
/*semis for sport with sport_id 65*/
(129, 453, 25),
(131, 453, 1),
(133, 454, 25),
(135, 454, 3),
/*finals for sport with sport_id 65*/
(129, 455, 25),
(133, 455, 3),
/*eliminations for sport with sport_id 66*/
(137, 456, 25),
(138, 456, 3),
(139, 457, 25),
(140, 457, 5),
(141, 458, 25),
(142, 458, 1),
(143, 459, 25),
(144, 459, 3),
/*semis for sport with sport_id 66*/
(137, 460, 25),
(139, 460, 1),
(141, 461, 25),
(143, 461, 3),
/*finals for sport with sport_id 66*/
(137, 462, 25),
(141, 462, 3),
/*eliminations for sport with sport_id 67*/
(145, 463, 25),
(146, 463, 3),
(147, 464, 25),
(148, 464, 5),
(149, 465, 25),
(150, 465, 1),
(151, 466, 25),
(152, 466, 3),
/*semis for sport with sport_id 67*/
(145, 467, 25),
(147, 467, 1),
(149, 468, 25),
(151, 468, 3),
/*finals for sport with sport_id 67*/
(145, 469, 25),
(149, 469, 3),
/*eliminations for sport with sport_id 68*/
(153, 470, 25),
(154, 470, 3),
(155, 471, 25),
(156, 471, 5),
(157, 472, 25),
(158, 472, 1),
(159, 473, 25),
(160, 473, 3),
/*semis for sport with sport_id 68*/
(153, 474, 25),
(155, 474, 1),
(157, 475, 25),
(159, 475, 3),
/*finals for sport with sport_id 68*/
(153, 476, 25),
(157, 476, 3),
/*eliminations for sport with sport_id 69*/
(161, 477, 25),
(162, 477, 3),
(163, 478, 25),
(164, 478, 5),
(165, 479, 25),
(166, 479, 1),
(167, 480, 25),
(168, 480, 3),
/*semis for sport with sport_id 69*/
(161, 481, 25),
(163, 481, 1),
(165, 482, 25),
(167, 482, 3),
/*finals for sport with sport_id 69*/
(161, 483, 25),
(165, 483, 3),
/*eliminations for sport with sport_id 70*/
(169, 484, 25),
(170, 484, 3),
(171, 485, 25),
(172, 485, 5),
(173, 486, 25),
(174, 486, 1),
(175, 487, 25),
(176, 487, 3),
/*semis for sport with sport_id 70*/
(169, 488, 25),
(171, 488, 1),
(173, 489, 25),
(175, 489, 3),
/*finals for sport with sport_id 70*/
(169, 490, 25),
(173, 490, 3),
/*eliminations for sport with sport_id 71*/
(177, 491, 25),
(178, 491, 3),
(179, 492, 25),
(180, 492, 5),
(181, 493, 25),
(182, 493, 1),
(183, 494, 25),
(184, 494, 3),
/*semis for sport with sport_id 71*/
(177, 495, 25),
(179, 495, 1),
(181, 496, 25),
(183, 496, 3),
/*finals for sport with sport_id 71*/
(177, 497, 25),
(181, 497, 3),
/*eliminations for sport with sport_id 72*/
(185, 498, 25),
(186, 498, 3),
(187, 499, 25),
(188, 499, 5),
(189, 500, 25),
(190, 500, 1),
(191, 501, 25),
(192, 501, 3),
/*semis for sport with sport_id 72*/
(185, 502, 25),
(187, 502, 1),
(189, 503, 25),
(191, 503, 3),
/*finals for sport with sport_id 72*/
(185, 504, 25),
(189, 504, 3),
/*eliminations for sport with sport_id 73*/
(1, 505, 25),
(2, 505, 3),
(3, 506, 25),
(4, 506, 5),
(5, 507, 25),
(6, 507, 1),
(7, 508, 25),
(8, 508, 3),
/*semis for sport with sport_id 73*/
(1, 509, 25),
(3, 509, 1),
(5, 510, 25),
(7, 510, 3),
/*finals for sport with sport_id 73*/
(1, 511, 25),
(5, 511, 3),
/*eliminations for sport with sport_id 74*/
(9, 512, 25),
(10, 512, 3),
(11, 513, 25),
(12, 513, 5),
(13, 514, 25),
(14, 514, 1),
(15, 515, 25),
(16, 515, 3),
/*semis for sport with sport_id 74*/
(9, 516, 25),
(11, 516, 1),
(13, 517, 25),
(15, 517, 3),
/*finals for sport with sport_id 74*/
(9, 518, 25),
(13, 518, 3),
/*eliminations for sport with sport_id 75*/
(17, 519, 25),
(18, 519, 3),
(19, 520, 25),
(20, 520, 5),
(21, 521, 25),
(22, 521, 1),
(23, 522, 25),
(24, 522, 3),
/*semis for sport with sport_id 75*/
(17, 523, 25),
(19, 523, 1),
(21, 524, 25),
(23, 524, 3),
/*finals for sport with sport_id 75*/
(17, 525, 25),
(21, 525, 3),
/*eliminations for sport with sport_id 76*/
(25, 526, 25),
(26, 526, 3),
(27, 527, 25),
(28, 527, 5),
(29, 528, 25),
(30, 528, 1),
(31, 529, 25),
(32, 529, 3),
/*semis for sport with sport_id 76*/
(25, 530, 25),
(27, 530, 1),
(29, 531, 25),
(31, 531, 3),
/*finals for sport with sport_id 76*/
(25, 532, 25),
(29, 532, 3),
/*eliminations for sport with sport_id 77*/
(33, 533, 25),
(34, 533, 3),
(35, 534, 25),
(36, 534, 5),
(37, 535, 25),
(38, 535, 1),
(39, 536, 25),
(40, 536, 3),
/*semis for sport with sport_id 77*/
(33, 537, 25),
(35, 537, 1),
(37, 538, 25),
(39, 538, 3),
/*finals for sport with sport_id 77*/
(33, 539, 25),
(37, 539, 3),
/*eliminations for sport with sport_id 78*/
(41, 540, 25),
(42, 540, 3),
(43, 541, 25),
(44, 541, 5),
(45, 542, 25),
(46, 542, 1),
(47, 543, 25),
(48, 543, 3),
/*semis for sport with sport_id 78*/
(41, 544, 25),
(43, 544, 1),
(45, 545, 25),
(47, 545, 3),
/*finals for sport with sport_id 78*/
(41, 546, 25),
(45, 546, 3),
/*eliminations for sport with sport_id 79*/
(49, 547, 25),
(50, 547, 3),
(51, 548, 25),
(52, 548, 5),
(53, 549, 25),
(54, 549, 1),
(55, 550, 25),
(56, 550, 3),
/*semis for sport with sport_id 79*/
(49, 551, 25),
(51, 551, 1),
(53, 552, 25),
(55, 552, 3),
/*finals for sport with sport_id 79*/
(49, 553, 25),
(53, 553, 3),
/*eliminations for sport with sport_id 80*/
(57, 554, 25),
(58, 554, 3),
(59, 555, 25),
(60, 555, 5),
(61, 556, 25),
(62, 556, 1),
(63, 557, 25),
(64, 557, 3),
/*semis for sport with sport_id 80*/
(57, 558, 25),
(59, 558, 1),
(61, 559, 25),
(63, 559, 3),
/*finals for sport with sport_id 80*/
(57, 560, 25),
(61, 560, 3),
/*eliminations for sport with sport_id 81*/
(65, 561, 25),
(66, 561, 3),
(67, 562, 25),
(68, 562, 5),
(69, 563, 25),
(70, 563, 1),
(71, 564, 25),
(72, 564, 3),
/*semis for sport with sport_id 81*/
(65, 565, 25),
(67, 565, 1),
(69, 566, 25),
(71, 566, 3),
/*finals for sport with sport_id 81*/
(65, 567, 25),
(69, 567, 3),
/*eliminations for sport with sport_id 82*/
(73, 568, 25),
(74, 568, 3),
(75, 569, 25),
(76, 569, 5),
(77, 570, 25),
(78, 570, 1),
(79, 571, 25),
(80, 571, 3),
/*semis for sport with sport_id 82*/
(73, 572, 25),
(75, 572, 1),
(77, 573, 25),
(79, 573, 3),
/*finals for sport with sport_id 82*/
(73, 574, 25),
(77, 574, 3),
/*eliminations for sport with sport_id 83*/
(81, 575, 25),
(82, 575, 3),
(83, 576, 25),
(84, 576, 5),
(85, 577, 25),
(86, 577, 1),
(87, 578, 25),
(88, 578, 3),
/*semis for sport with sport_id 83*/
(81, 579, 25),
(83, 579, 1),
(85, 580, 25),
(87, 580, 3),
/*finals for sport with sport_id 83*/
(81, 581, 25),
(85, 581, 3),
/*eliminations for sport with sport_id 84*/
(89, 582, 25),
(90, 582, 3),
(91, 583, 25),
(92, 583, 5),
(93, 584, 25),
(94, 584, 1),
(95, 585, 25),
(96, 585, 3),
/*semis for sport with sport_id 84*/
(89, 586, 25),
(91, 586, 1),
(93, 587, 25),
(95, 587, 3),
/*finals for sport with sport_id 84*/
(89, 588, 25),
(93, 588, 3),
/*eliminations for sport with sport_id 85*/
(97, 589, 25),
(98, 589, 3),
(99, 590, 25),
(100, 590, 5),
(101, 591, 25),
(102, 591, 1),
(103, 592, 25),
(104, 592, 3),
/*semis for sport with sport_id 85*/
(97, 593, 25),
(99, 593, 1),
(101, 594, 25),
(103, 594, 3),
/*finals for sport with sport_id 85*/
(97, 595, 25),
(101, 595, 3),
/*eliminations for sport with sport_id 86*/
(105, 596, 25),
(106, 596, 3),
(107, 597, 25),
(108, 597, 5),
(109, 598, 25),
(110, 598, 1),
(111, 599, 25),
(112, 599, 3),
/*semis for sport with sport_id 86*/
(105, 600, 25),
(107, 600, 1),
(109, 601, 25),
(111, 601, 3),
/*finals for sport with sport_id 86*/
(105, 602, 25),
(109, 602, 3),
/*eliminations for sport with sport_id 87*/
(113, 603, 25),
(114, 603, 3),
(115, 604, 25),
(116, 604, 5),
(117, 605, 25),
(118, 605, 1),
(119, 606, 25),
(120, 606, 3),
/*semis for sport with sport_id 87*/
(113, 607, 25),
(115, 607, 1),
(117, 608, 25),
(119, 608, 3),
/*finals for sport with sport_id 87*/
(113, 609, 25),
(117, 609, 3),
/*eliminations for sport with sport_id 88*/
(121, 610, 25),
(122, 610, 3),
(123, 611, 25),
(124, 611, 5),
(125, 612, 25),
(126, 612, 1),
(127, 613, 25),
(128, 613, 3),
/*semis for sport with sport_id 88*/
(121, 614, 25),
(123, 614, 1),
(125, 615, 25),
(127, 615, 3),
/*finals for sport with sport_id 88*/
(121, 616, 25),
(125, 616, 3),
/*eliminations for sport with sport_id 89*/
(129, 617, 25),
(130, 617, 3),
(131, 618, 25),
(132, 618, 5),
(133, 619, 25),
(134, 619, 1),
(135, 620, 25),
(136, 620, 3),
/*semis for sport with sport_id 89*/
(129, 621, 25),
(131, 621, 1),
(133, 622, 25),
(135, 622, 3),
/*finals for sport with sport_id 89*/
(129, 623, 25),
(133, 623, 3),
/*eliminations for sport with sport_id 90*/
(137, 624, 25),
(138, 624, 3),
(139, 625, 25),
(140, 625, 5),
(141, 626, 25),
(142, 626, 1),
(143, 627, 25),
(144, 627, 3),
/*semis for sport with sport_id 90*/
(137, 628, 25),
(139, 628, 1),
(141, 629, 25),
(143, 629, 3),
/*finals for sport with sport_id 90*/
(137, 630, 25),
(141, 630, 3),
/*eliminations for sport with sport_id 91*/
(145, 631, 25),
(146, 631, 3),
(147, 632, 25),
(148, 632, 5),
(149, 633, 25),
(150, 633, 1),
(151, 634, 25),
(152, 634, 3),
/*semis for sport with sport_id 91*/
(145, 635, 25),
(147, 635, 1),
(149, 636, 25),
(151, 636, 3),
/*finals for sport with sport_id 91*/
(145, 637, 25),
(149, 637, 3),
/*eliminations for sport with sport_id 92*/
(153, 638, 25),
(154, 638, 3),
(155, 639, 25),
(156, 639, 5),
(157, 640, 25),
(158, 640, 1),
(159, 641, 25),
(160, 641, 3),
/*semis for sport with sport_id 92*/
(153, 642, 25),
(155, 642, 1),
(157, 643, 25),
(159, 643, 3),
/*finals for sport with sport_id 92*/
(153, 644, 25),
(157, 644, 3),
/*eliminations for sport with sport_id 93*/
(161, 645, 25),
(162, 645, 3),
(163, 646, 25),
(164, 646, 5),
(165, 647, 25),
(166, 647, 1),
(167, 648, 25),
(168, 648, 3),
/*semis for sport with sport_id 93*/
(161, 649, 25),
(163, 649, 1),
(165, 650, 25),
(167, 650, 3),
/*finals for sport with sport_id 93*/
(161, 651, 25),
(165, 651, 3),
/*eliminations for sport with sport_id 94*/
(169, 652, 25),
(170, 652, 3),
(171, 653, 25),
(172, 653, 5),
(173, 654, 25),
(174, 654, 1),
(175, 655, 25),
(176, 655, 3),
/*semis for sport with sport_id 94*/
(169, 656, 25),
(171, 656, 1),
(173, 657, 25),
(175, 657, 3),
/*finals for sport with sport_id 94*/
(169, 658, 25),
(173, 658, 3),
/*eliminations for sport with sport_id 95*/
(177, 659, 25),
(178, 659, 3),
(179, 660, 25),
(180, 660, 5),
(181, 661, 25),
(182, 661, 1),
(183, 662, 25),
(184, 662, 3),
/*semis for sport with sport_id 95*/
(177, 663, 25),
(179, 663, 1),
(181, 664, 25),
(183, 664, 3),
/*finals for sport with sport_id 95*/
(177, 665, 25),
(181, 665, 3),
/*eliminations for sport with sport_id 96*/
(185, 666, 25),
(186, 666, 3),
(187, 667, 25),
(188, 667, 5),
(189, 668, 25),
(190, 668, 1),
(191, 669, 25),
(192, 669, 3),
/*semis for sport with sport_id 96*/
(185, 670, 25),
(187, 670, 1),
(189, 671, 25),
(191, 671, 3),
/*finals for sport with sport_id 96*/
(185, 672, 25),
(189, 672, 3),
/*eliminations for sport with sport_id 97*/
(1, 673, 25),
(2, 673, 3),
(3, 674, 25),
(4, 674, 5),
(5, 675, 25),
(6, 675, 1),
(7, 676, 25),
(8, 676, 3),
/*semis for sport with sport_id 97*/
(1, 677, 25),
(3, 677, 1),
(5, 678, 25),
(7, 678, 3),
/*finals for sport with sport_id 97*/
(1, 679, 25),
(5, 679, 3),
/*eliminations for sport with sport_id 98*/
(9, 680, 25),
(10, 680, 3),
(11, 681, 25),
(12, 681, 5),
(13, 682, 25),
(14, 682, 1),
(15, 683, 25),
(16, 683, 3),
/*semis for sport with sport_id 98*/
(9, 684, 25),
(11, 684, 1),
(13, 685, 25),
(15, 685, 3),
/*finals for sport with sport_id 98*/
(9, 686, 25),
(13, 686, 3),
/*eliminations for sport with sport_id 99*/
(17, 687, 25),
(18, 687, 3),
(19, 688, 25),
(20, 688, 5),
(21, 689, 25),
(22, 689, 1),
(23, 690, 25),
(24, 690, 3),
/*semis for sport with sport_id 99*/
(17, 691, 25),
(19, 691, 1),
(21, 692, 25),
(23, 692, 3),
/*finals for sport with sport_id 99*/
(17, 693, 25),
(21, 693, 3),
/*eliminations for sport with sport_id 100*/
(25, 694, 25),
(26, 694, 3),
(27, 695, 25),
(28, 695, 5),
(29, 696, 25),
(30, 696, 1),
(31, 697, 25),
(32, 697, 3),
/*semis for sport with sport_id 100*/
(25, 698, 25),
(27, 698, 1),
(29, 699, 25),
(31, 699, 3),
/*finals for sport with sport_id 100*/
(25, 700, 25),
(29, 700, 3),
/*eliminations for sport with sport_id 101*/
(33, 701, 25),
(34, 701, 3),
(35, 702, 25),
(36, 702, 5),
(37, 703, 25),
(38, 703, 1),
(39, 704, 25),
(40, 704, 3),
/*semis for sport with sport_id 101*/
(33, 705, 25),
(35, 705, 1),
(37, 706, 25),
(39, 706, 3),
/*finals for sport with sport_id 101*/
(33, 707, 25),
(37, 707, 3),
/*eliminations for sport with sport_id 102*/
(41, 708, 25),
(42, 708, 3),
(43, 709, 25),
(44, 709, 5),
(45, 710, 25),
(46, 710, 1),
(47, 711, 25),
(48, 711, 3),
/*semis for sport with sport_id 102*/
(41, 712, 25),
(43, 712, 1),
(45, 713, 25),
(47, 713, 3),
/*finals for sport with sport_id 102*/
(41, 714, 25),
(45, 714, 3),
/*eliminations for sport with sport_id 103*/
(49, 715, 25),
(50, 715, 3),
(51, 716, 25),
(52, 716, 5),
(53, 717, 25),
(54, 717, 1),
(55, 718, 25),
(56, 718, 3),
/*semis for sport with sport_id 103*/
(49, 719, 25),
(51, 719, 1),
(53, 720, 25),
(55, 720, 3),
/*finals for sport with sport_id 103*/
(49, 721, 25),
(53, 721, 3),
/*eliminations for sport with sport_id 104*/
(57, 722, 25),
(58, 722, 3),
(59, 723, 25),
(60, 723, 5),
(61, 724, 25),
(62, 724, 1),
(63, 725, 25),
(64, 725, 3),
/*semis for sport with sport_id 104*/
(57, 726, 25),
(59, 726, 1),
(61, 727, 25),
(63, 727, 3),
/*finals for sport with sport_id 104*/
(57, 728, 25),
(61, 728, 3),
/*eliminations for sport with sport_id 105*/
(65, 729, 25),
(66, 729, 3),
(67, 730, 25),
(68, 730, 5),
(69, 731, 25),
(70, 731, 1),
(71, 732, 25),
(72, 732, 3),
/*semis for sport with sport_id 105*/
(65, 733, 25),
(67, 733, 1),
(69, 734, 25),
(71, 734, 3),
/*finals for sport with sport_id 105*/
(65, 735, 25),
(69, 735, 3),
/*eliminations for sport with sport_id 106*/
(73, 736, 25),
(74, 736, 3),
(75, 737, 25),
(76, 737, 5),
(77, 738, 25),
(78, 738, 1),
(79, 739, 25),
(80, 739, 3),
/*semis for sport with sport_id 106*/
(73, 740, 25),
(75, 740, 1),
(77, 741, 25),
(79, 741, 3),
/*finals for sport with sport_id 106*/
(73, 742, 25),
(77, 742, 3),
/*eliminations for sport with sport_id 107*/
(81, 743, 25),
(82, 743, 3),
(83, 744, 25),
(84, 744, 5),
(85, 745, 25),
(86, 745, 1),
(87, 746, 25),
(88, 746, 3),
/*semis for sport with sport_id 107*/
(81, 747, 25),
(83, 747, 1),
(85, 748, 25),
(87, 748, 3),
/*finals for sport with sport_id 107*/
(81, 749, 25),
(85, 749, 3),
/*eliminations for sport with sport_id 108*/
(89, 750, 25),
(90, 750, 3),
(91, 751, 25),
(92, 751, 5),
(93, 752, 25),
(94, 752, 1),
(95, 753, 25),
(96, 753, 3),
/*semis for sport with sport_id 108*/
(89, 754, 25),
(91, 754, 1),
(93, 755, 25),
(95, 755, 3),
/*finals for sport with sport_id 108*/
(89, 756, 25),
(93, 756, 3),
/*eliminations for sport with sport_id 109*/
(97, 757, 25),
(98, 757, 3),
(99, 758, 25),
(100, 758, 5),
(101, 759, 25),
(102, 759, 1),
(103, 760, 25),
(104, 760, 3),
/*semis for sport with sport_id 109*/
(97, 761, 25),
(99, 761, 1),
(101, 762, 25),
(103, 762, 3),
/*finals for sport with sport_id 109*/
(97, 763, 25),
(101, 763, 3),
/*eliminations for sport with sport_id 110*/
(105, 764, 25),
(106, 764, 3),
(107, 765, 25),
(108, 765, 5),
(109, 766, 25),
(110, 766, 1),
(111, 767, 25),
(112, 767, 3),
/*semis for sport with sport_id 110*/
(105, 768, 25),
(107, 768, 1),
(109, 769, 25),
(111, 769, 3),
/*finals for sport with sport_id 110*/
(105, 770, 25),
(109, 770, 3),
/*eliminations for sport with sport_id 111*/
(113, 771, 25),
(114, 771, 3),
(115, 772, 25),
(116, 772, 5),
(117, 773, 25),
(118, 773, 1),
(119, 774, 25),
(120, 774, 3),
/*semis for sport with sport_id 111*/
(113, 775, 25),
(115, 775, 1),
(117, 776, 25),
(119, 776, 3),
/*finals for sport with sport_id 111*/
(113, 777, 25),
(117, 777, 3),
/*eliminations for sport with sport_id 112*/
(121, 778, 25),
(122, 778, 3),
(123, 779, 25),
(124, 779, 5),
(125, 780, 25),
(126, 780, 1),
(127, 781, 25),
(128, 781, 3),
/*semis for sport with sport_id 112*/
(121, 782, 25),
(123, 782, 1),
(125, 783, 25),
(127, 783, 3),
/*finals for sport with sport_id 112*/
(121, 784, 25),
(125, 784, 3),
/*eliminations for sport with sport_id 113*/
(129, 785, 25),
(130, 785, 3),
(131, 786, 25),
(132, 786, 5),
(133, 787, 25),
(134, 787, 1),
(135, 788, 25),
(136, 788, 3),
/*semis for sport with sport_id 113*/
(129, 789, 25),
(131, 789, 1),
(133, 790, 25),
(135, 790, 3),
/*finals for sport with sport_id 113*/
(129, 791, 25),
(133, 791, 3),
/*eliminations for sport with sport_id 114*/
(137, 792, 25),
(138, 792, 3),
(139, 793, 25),
(140, 793, 5),
(141, 794, 25),
(142, 794, 1),
(143, 795, 25),
(144, 795, 3),
/*semis for sport with sport_id 114*/
(137, 796, 25),
(139, 796, 1),
(141, 797, 25),
(143, 797, 3),
/*finals for sport with sport_id 114*/
(137, 798, 25),
(141, 798, 3),
/*eliminations for sport with sport_id 115*/
(145, 799, 25),
(146, 799, 3),
(147, 800, 25),
(148, 800, 5),
(149, 801, 25),
(150, 801, 1),
(151, 802, 25),
(152, 802, 3),
/*semis for sport with sport_id 115*/
(145, 803, 25),
(147, 803, 1),
(149, 804, 25),
(151, 804, 3),
/*finals for sport with sport_id 115*/
(145, 805, 25),
(149, 805, 3),
/*eliminations for sport with sport_id 116*/
(153, 806, 25),
(154, 806, 3),
(155, 807, 25),
(156, 807, 5),
(157, 808, 25),
(158, 808, 1),
(159, 809, 25),
(160, 809, 3),
/*semis for sport with sport_id 116*/
(153, 810, 25),
(155, 810, 1),
(157, 811, 25),
(159, 811, 3),
/*finals for sport with sport_id 116*/
(153, 812, 25),
(157, 812, 3),
/*eliminations for sport with sport_id 117*/
(161, 813, 25),
(162, 813, 3),
(163, 814, 25),
(164, 814, 5),
(165, 815, 25),
(166, 815, 1),
(167, 816, 25),
(168, 816, 3),
/*semis for sport with sport_id 117*/
(161, 817, 25),
(163, 817, 1),
(165, 818, 25),
(167, 818, 3),
/*finals for sport with sport_id 117*/
(161, 819, 25),
(165, 819, 3),
/*eliminations for sport with sport_id 118*/
(169, 820, 25),
(170, 820, 3),
(171, 821, 25),
(172, 821, 5),
(173, 822, 25),
(174, 822, 1),
(175, 823, 25),
(176, 823, 3),
/*semis for sport with sport_id 118*/
(169, 824, 25),
(171, 824, 1),
(173, 825, 25),
(175, 825, 3),
/*finals for sport with sport_id 118*/
(169, 826, 25),
(173, 826, 3),
/*eliminations for sport with sport_id 119*/
(177, 827, 25),
(178, 827, 3),
(179, 828, 25),
(180, 828, 5),
(181, 829, 25),
(182, 829, 1),
(183, 830, 25),
(184, 830, 3),
/*semis for sport with sport_id 119*/
(177, 831, 25),
(179, 831, 1),
(181, 832, 25),
(183, 832, 3),
/*finals for sport with sport_id 119*/
(177, 833, 25),
(181, 833, 3),
/*eliminations for sport with sport_id 120*/
(185, 834, 25),
(186, 834, 3),
(187, 835, 25),
(188, 835, 5),
(189, 836, 25),
(190, 836, 1),
(191, 837, 25),
(192, 837, 3),
/*semis for sport with sport_id 120*/
(185, 838, 25),
(187, 838, 1),
(189, 839, 25),
(191, 839, 3),
/*finals for sport with sport_id 120*/
(185, 840, 25),
(189, 840, 3),
/*eliminations for sport with sport_id 121*/
(1, 841, 25),
(2, 841, 3),
(3, 842, 25),
(4, 842, 5),
(5, 843, 25),
(6, 843, 1),
(7, 844, 25),
(8, 844, 3),
/*semis for sport with sport_id 121*/
(1, 845, 25),
(3, 845, 1),
(5, 846, 25),
(7, 846, 3),
/*finals for sport with sport_id 121*/
(1, 847, 25),
(5, 847, 3),
/*eliminations for sport with sport_id 122*/
(9, 848, 25),
(10, 848, 3),
(11, 849, 25),
(12, 849, 5),
(13, 850, 25),
(14, 850, 1),
(15, 851, 25),
(16, 851, 3),
/*semis for sport with sport_id 122*/
(9, 852, 25),
(11, 852, 1),
(13, 853, 25),
(15, 853, 3),
/*finals for sport with sport_id 122*/
(9, 854, 25),
(13, 854, 3),
/*eliminations for sport with sport_id 123*/
(17, 855, 25),
(18, 855, 3),
(19, 856, 25),
(20, 856, 5),
(21, 857, 25),
(22, 857, 1),
(23, 858, 25),
(24, 858, 3),
/*semis for sport with sport_id 123*/
(17, 859, 25),
(19, 859, 1),
(21, 860, 25),
(23, 860, 3),
/*finals for sport with sport_id 123*/
(17, 861, 25),
(21, 861, 3),
/*eliminations for sport with sport_id 124*/
(25, 862, 25),
(26, 862, 3),
(27, 863, 25),
(28, 863, 5),
(29, 864, 25),
(30, 864, 1),
(31, 865, 25),
(32, 865, 3),
/*semis for sport with sport_id 124*/
(25, 866, 25),
(27, 866, 1),
(29, 867, 25),
(31, 867, 3),
/*finals for sport with sport_id 124*/
(25, 868, 25),
(29, 868, 3),
/*eliminations for sport with sport_id 125*/
(33, 869, 25),
(34, 869, 3),
(35, 870, 25),
(36, 870, 5),
(37, 871, 25),
(38, 871, 1),
(39, 872, 25),
(40, 872, 3),
/*semis for sport with sport_id 125*/
(33, 873, 25),
(35, 873, 1),
(37, 874, 25),
(39, 874, 3),
/*finals for sport with sport_id 125*/
(33, 875, 25),
(37, 875, 3),
/*eliminations for sport with sport_id 126*/
(41, 876, 25),
(42, 876, 3),
(43, 877, 25),
(44, 877, 5),
(45, 878, 25),
(46, 878, 1),
(47, 879, 25),
(48, 879, 3),
/*semis for sport with sport_id 126*/
(41, 880, 25),
(43, 880, 1),
(45, 881, 25),
(47, 881, 3),
/*finals for sport with sport_id 126*/
(41, 882, 25),
(45, 882, 3),
/*eliminations for sport with sport_id 127*/
(49, 883, 25),
(50, 883, 3),
(51, 884, 25),
(52, 884, 5),
(53, 885, 25),
(54, 885, 1),
(55, 886, 25),
(56, 886, 3),
/*semis for sport with sport_id 127*/
(49, 887, 25),
(51, 887, 1),
(53, 888, 25),
(55, 888, 3),
/*finals for sport with sport_id 127*/
(49, 889, 25),
(53, 889, 3),
/*eliminations for sport with sport_id 128*/
(57, 890, 25),
(58, 890, 3),
(59, 891, 25),
(60, 891, 5),
(61, 892, 25),
(62, 892, 1),
(63, 893, 25),
(64, 893, 3),
/*semis for sport with sport_id 128*/
(57, 894, 25),
(59, 894, 1),
(61, 895, 25),
(63, 895, 3),
/*finals for sport with sport_id 128*/
(57, 896, 25),
(61, 896, 3),
/*eliminations for sport with sport_id 129*/
(65, 897, 25),
(66, 897, 3),
(67, 898, 25),
(68, 898, 5),
(69, 899, 25),
(70, 899, 1),
(71, 900, 25),
(72, 900, 3),
/*semis for sport with sport_id 129*/
(65, 901, 25),
(67, 901, 1),
(69, 902, 25),
(71, 902, 3),
/*finals for sport with sport_id 129*/
(65, 903, 25),
(69, 903, 3),
/*eliminations for sport with sport_id 130*/
(73, 904, 25),
(74, 904, 3),
(75, 905, 25),
(76, 905, 5),
(77, 906, 25),
(78, 906, 1),
(79, 907, 25),
(80, 907, 3),
/*semis for sport with sport_id 130*/
(73, 908, 25),
(75, 908, 1),
(77, 909, 25),
(79, 909, 3),
/*finals for sport with sport_id 130*/
(73, 910, 25),
(77, 910, 3),
/*eliminations for sport with sport_id 131*/
(81, 911, 25),
(82, 911, 3),
(83, 912, 25),
(84, 912, 5),
(85, 913, 25),
(86, 913, 1),
(87, 914, 25),
(88, 914, 3),
/*semis for sport with sport_id 131*/
(81, 915, 25),
(83, 915, 1),
(85, 916, 25),
(87, 916, 3),
/*finals for sport with sport_id 131*/
(81, 917, 25),
(85, 917, 3),
/*eliminations for sport with sport_id 132*/
(89, 918, 25),
(90, 918, 3),
(91, 919, 25),
(92, 919, 5),
(93, 920, 25),
(94, 920, 1),
(95, 921, 25),
(96, 921, 3),
/*semis for sport with sport_id 132*/
(89, 922, 25),
(91, 922, 1),
(93, 923, 25),
(95, 923, 3),
/*finals for sport with sport_id 132*/
(89, 924, 25),
(93, 924, 3),
/*eliminations for sport with sport_id 133*/
(97, 925, 25),
(98, 925, 3),
(99, 926, 25),
(100, 926, 5),
(101, 927, 25),
(102, 927, 1),
(103, 928, 25),
(104, 928, 3),
/*semis for sport with sport_id 133*/
(97, 929, 25),
(99, 929, 1),
(101, 930, 25),
(103, 930, 3),
/*finals for sport with sport_id 133*/
(97, 931, 25),
(101, 931, 3),
/*eliminations for sport with sport_id 134*/
(105, 932, 25),
(106, 932, 3),
(107, 933, 25),
(108, 933, 5),
(109, 934, 25),
(110, 934, 1),
(111, 935, 25),
(112, 935, 3),
/*semis for sport with sport_id 134*/
(105, 936, 25),
(107, 936, 1),
(109, 937, 25),
(111, 937, 3),
/*finals for sport with sport_id 134*/
(105, 938, 25),
(109, 938, 3),
/*eliminations for sport with sport_id 135*/
(113, 939, 25),
(114, 939, 3),
(115, 940, 25),
(116, 940, 5),
(117, 941, 25),
(118, 941, 1),
(119, 942, 25),
(120, 942, 3),
/*semis for sport with sport_id 135*/
(113, 943, 25),
(115, 943, 1),
(117, 944, 25),
(119, 944, 3),
/*finals for sport with sport_id 135*/
(113, 945, 25),
(117, 945, 3),
/*eliminations for sport with sport_id 136*/
(121, 946, 25),
(122, 946, 3),
(123, 947, 25),
(124, 947, 5),
(125, 948, 25),
(126, 948, 1),
(127, 949, 25),
(128, 949, 3),
/*semis for sport with sport_id 136*/
(121, 950, 25),
(123, 950, 1),
(125, 951, 25),
(127, 951, 3),
/*finals for sport with sport_id 136*/
(121, 952, 25),
(125, 952, 3),
/*eliminations for sport with sport_id 137*/
(129, 953, 25),
(130, 953, 3),
(131, 954, 25),
(132, 954, 5),
(133, 955, 25),
(134, 955, 1),
(135, 956, 25),
(136, 956, 3),
/*semis for sport with sport_id 137*/
(129, 957, 25),
(131, 957, 1),
(133, 958, 25),
(135, 958, 3),
/*finals for sport with sport_id 137*/
(129, 959, 25),
(133, 959, 3),
/*eliminations for sport with sport_id 138*/
(137, 960, 25),
(138, 960, 3),
(139, 961, 25),
(140, 961, 5),
(141, 962, 25),
(142, 962, 1),
(143, 963, 25),
(144, 963, 3),
/*semis for sport with sport_id 138*/
(137, 964, 25),
(139, 964, 1),
(141, 965, 25),
(143, 965, 3),
/*finals for sport with sport_id 138*/
(137, 966, 25),
(141, 966, 3),
/*eliminations for sport with sport_id 139*/
(145, 967, 25),
(146, 967, 3),
(147, 968, 25),
(148, 968, 5),
(149, 969, 25),
(150, 969, 1),
(151, 970, 25),
(152, 970, 3),
/*semis for sport with sport_id 139*/
(145, 971, 25),
(147, 971, 1),
(149, 972, 25),
(151, 972, 3),
/*finals for sport with sport_id 139*/
(145, 973, 25),
(149, 973, 3),
/*eliminations for sport with sport_id 140*/
(153, 974, 25),
(154, 974, 3),
(155, 975, 25),
(156, 975, 5),
(157, 976, 25),
(158, 976, 1),
(159, 977, 25),
(160, 977, 3),
/*semis for sport with sport_id 140*/
(153, 978, 25),
(155, 978, 1),
(157, 979, 25),
(159, 979, 3),
/*finals for sport with sport_id 140*/
(153, 980, 25),
(157, 980, 3),
/*eliminations for sport with sport_id 141*/
(161, 981, 25),
(162, 981, 3),
(163, 982, 25),
(164, 982, 5),
(165, 983, 25),
(166, 983, 1),
(167, 984, 25),
(168, 984, 3),
/*semis for sport with sport_id 141*/
(161, 985, 25),
(163, 985, 1),
(165, 986, 25),
(167, 986, 3),
/*finals for sport with sport_id 141*/
(161, 987, 25),
(165, 987, 3),
/*eliminations for sport with sport_id 142*/
(169, 988, 25),
(170, 988, 3),
(171, 989, 25),
(172, 989, 5),
(173, 990, 25),
(174, 990, 1),
(175, 991, 25),
(176, 991, 3),
/*semis for sport with sport_id 142*/
(169, 992, 25),
(171, 992, 1),
(173, 993, 25),
(175, 993, 3),
/*finals for sport with sport_id 142*/
(169, 994, 25),
(173, 994, 3),
/*eliminations for sport with sport_id 143*/
(177, 995, 25),
(178, 995, 3),
(179, 996, 25),
(180, 996, 5),
(181, 997, 25),
(182, 997, 1),
(183, 998, 25),
(184, 998, 3),
/*semis for sport with sport_id 143*/
(177, 999, 25),
(179, 999, 1),
(181, 1000, 25),
(183, 1000, 3),
/*finals for sport with sport_id 143*/
(177, 1001, 25),
(181, 1001, 3),
/*eliminations for sport with sport_id 144*/
(185, 1002, 25),
(186, 1002, 3),
(187, 1003, 25),
(188, 1003, 5),
(189, 1004, 25),
(190, 1004, 1),
(191, 1005, 25),
(192, 1005, 3),
/*semis for sport with sport_id 144*/
(185, 1006, 25),
(187, 1006, 1),
(189, 1007, 25),
(191, 1007, 3),
/*finals for sport with sport_id 144*/
(185, 1008, 25),
(189, 1008, 3),
/*eliminations for sport with sport_id 145*/
(1, 1009, 25),
(2, 1009, 3),
(3, 1010, 25),
(4, 1010, 5),
(5, 1011, 25),
(6, 1011, 1),
(7, 1012, 25),
(8, 1012, 3),
/*semis for sport with sport_id 145*/
(1, 1013, 25),
(3, 1013, 1),
(5, 1014, 25),
(7, 1014, 3),
/*finals for sport with sport_id 145*/
(1, 1015, 25),
(5, 1015, 3),
/*eliminations for sport with sport_id 146*/
(9, 1016, 25),
(10, 1016, 3),
(11, 1017, 25),
(12, 1017, 5),
(13, 1018, 25),
(14, 1018, 1),
(15, 1019, 25),
(16, 1019, 3),
/*semis for sport with sport_id 146*/
(9, 1020, 25),
(11, 1020, 1),
(13, 1021, 25),
(15, 1021, 3),
/*finals for sport with sport_id 146*/
(9, 1022, 25),
(13, 1022, 3),
/*eliminations for sport with sport_id 147*/
(17, 1023, 25),
(18, 1023, 3),
(19, 1024, 25),
(20, 1024, 5),
(21, 1025, 25),
(22, 1025, 1),
(23, 1026, 25),
(24, 1026, 3),
/*semis for sport with sport_id 147*/
(17, 1027, 25),
(19, 1027, 1),
(21, 1028, 25),
(23, 1028, 3),
/*finals for sport with sport_id 147*/
(17, 1029, 25),
(21, 1029, 3),
/*eliminations for sport with sport_id 148*/
(25, 1030, 25),
(26, 1030, 3),
(27, 1031, 25),
(28, 1031, 5),
(29, 1032, 25),
(30, 1032, 1),
(31, 1033, 25),
(32, 1033, 3),
/*semis for sport with sport_id 148*/
(25, 1034, 25),
(27, 1034, 1),
(29, 1035, 25),
(31, 1035, 3),
/*finals for sport with sport_id 148*/
(25, 1036, 25),
(29, 1036, 3),
/*eliminations for sport with sport_id 149*/
(33, 1037, 25),
(34, 1037, 3),
(35, 1038, 25),
(36, 1038, 5),
(37, 1039, 25),
(38, 1039, 1),
(39, 1040, 25),
(40, 1040, 3),
/*semis for sport with sport_id 149*/
(33, 1041, 25),
(35, 1041, 1),
(37, 1042, 25),
(39, 1042, 3),
/*finals for sport with sport_id 149*/
(33, 1043, 25),
(37, 1043, 3),
/*eliminations for sport with sport_id 150*/
(41, 1044, 25),
(42, 1044, 3),
(43, 1045, 25),
(44, 1045, 5),
(45, 1046, 25),
(46, 1046, 1),
(47, 1047, 25),
(48, 1047, 3),
/*semis for sport with sport_id 150*/
(41, 1048, 25),
(43, 1048, 1),
(45, 1049, 25),
(47, 1049, 3),
/*finals for sport with sport_id 150*/
(41, 1050, 25),
(45, 1050, 3),
/*eliminations for sport with sport_id 151*/
(49, 1051, 25),
(50, 1051, 3),
(51, 1052, 25),
(52, 1052, 5),
(53, 1053, 25),
(54, 1053, 1),
(55, 1054, 25),
(56, 1054, 3),
/*semis for sport with sport_id 151*/
(49, 1055, 25),
(51, 1055, 1),
(53, 1056, 25),
(55, 1056, 3),
/*finals for sport with sport_id 151*/
(49, 1057, 25),
(53, 1057, 3),
/*eliminations for sport with sport_id 152*/
(57, 1058, 25),
(58, 1058, 3),
(59, 1059, 25),
(60, 1059, 5),
(61, 1060, 25),
(62, 1060, 1),
(63, 1061, 25),
(64, 1061, 3),
/*semis for sport with sport_id 152*/
(57, 1062, 25),
(59, 1062, 1),
(61, 1063, 25),
(63, 1063, 3),
/*finals for sport with sport_id 152*/
(57, 1064, 25),
(61, 1064, 3),
/*eliminations for sport with sport_id 153*/
(65, 1065, 25),
(66, 1065, 3),
(67, 1066, 25),
(68, 1066, 5),
(69, 1067, 25),
(70, 1067, 1),
(71, 1068, 25),
(72, 1068, 3),
/*semis for sport with sport_id 153*/
(65, 1069, 25),
(67, 1069, 1),
(69, 1070, 25),
(71, 1070, 3),
/*finals for sport with sport_id 153*/
(65, 1071, 25),
(69, 1071, 3),
/*eliminations for sport with sport_id 154*/
(73, 1072, 25),
(74, 1072, 3),
(75, 1073, 25),
(76, 1073, 5),
(77, 1074, 25),
(78, 1074, 1),
(79, 1075, 25),
(80, 1075, 3),
/*semis for sport with sport_id 154*/
(73, 1076, 25),
(75, 1076, 1),
(77, 1077, 25),
(79, 1077, 3),
/*finals for sport with sport_id 154*/
(73, 1078, 25),
(77, 1078, 3),
/*eliminations for sport with sport_id 155*/
(81, 1079, 25),
(82, 1079, 3),
(83, 1080, 25),
(84, 1080, 5),
(85, 1081, 25),
(86, 1081, 1),
(87, 1082, 25),
(88, 1082, 3),
/*semis for sport with sport_id 155*/
(81, 1083, 25),
(83, 1083, 1),
(85, 1084, 25),
(87, 1084, 3),
/*finals for sport with sport_id 155*/
(81, 1085, 25),
(85, 1085, 3),
/*eliminations for sport with sport_id 156*/
(89, 1086, 25),
(90, 1086, 3),
(91, 1087, 25),
(92, 1087, 5),
(93, 1088, 25),
(94, 1088, 1),
(95, 1089, 25),
(96, 1089, 3),
/*semis for sport with sport_id 156*/
(89, 1090, 25),
(91, 1090, 1),
(93, 1091, 25),
(95, 1091, 3),
/*finals for sport with sport_id 156*/
(89, 1092, 25),
(93, 1092, 3),
/*eliminations for sport with sport_id 157*/
(97, 1093, 25),
(98, 1093, 3),
(99, 1094, 25),
(100, 1094, 5),
(101, 1095, 25),
(102, 1095, 1),
(103, 1096, 25),
(104, 1096, 3),
/*semis for sport with sport_id 157*/
(97, 1097, 25),
(99, 1097, 1),
(101, 1098, 25),
(103, 1098, 3),
/*finals for sport with sport_id 157*/
(97, 1099, 25),
(101, 1099, 3),
/*eliminations for sport with sport_id 158*/
(105, 1100, 25),
(106, 1100, 3),
(107, 1101, 25),
(108, 1101, 5),
(109, 1102, 25),
(110, 1102, 1),
(111, 1103, 25),
(112, 1103, 3),
/*semis for sport with sport_id 158*/
(105, 1104, 25),
(107, 1104, 1),
(109, 1105, 25),
(111, 1105, 3),
/*finals for sport with sport_id 158*/
(105, 1106, 25),
(109, 1106, 3),
/*eliminations for sport with sport_id 159*/
(113, 1107, 25),
(114, 1107, 3),
(115, 1108, 25),
(116, 1108, 5),
(117, 1109, 25),
(118, 1109, 1),
(119, 1110, 25),
(120, 1110, 3),
/*semis for sport with sport_id 159*/
(113, 1111, 25),
(115, 1111, 1),
(117, 1112, 25),
(119, 1112, 3),
/*finals for sport with sport_id 159*/
(113, 1113, 25),
(117, 1113, 3),
/*eliminations for sport with sport_id 160*/
(121, 1114, 25),
(122, 1114, 3),
(123, 1115, 25),
(124, 1115, 5),
(125, 1116, 25),
(126, 1116, 1),
(127, 1117, 25),
(128, 1117, 3),
/*semis for sport with sport_id 160*/
(121, 1118, 25),
(123, 1118, 1),
(125, 1119, 25),
(127, 1119, 3),
/*finals for sport with sport_id 160*/
(121, 1120, 25),
(125, 1120, 3),
/*eliminations for sport with sport_id 161*/
(129, 1121, 25),
(130, 1121, 3),
(131, 1122, 25),
(132, 1122, 5),
(133, 1123, 25),
(134, 1123, 1),
(135, 1124, 25),
(136, 1124, 3),
/*semis for sport with sport_id 161*/
(129, 1125, 25),
(131, 1125, 1),
(133, 1126, 25),
(135, 1126, 3),
/*finals for sport with sport_id 161*/
(129, 1127, 25),
(133, 1127, 3),
/*eliminations for sport with sport_id 162*/
(137, 1128, 25),
(138, 1128, 3),
(139, 1129, 25),
(140, 1129, 5),
(141, 1130, 25),
(142, 1130, 1),
(143, 1131, 25),
(144, 1131, 3),
/*semis for sport with sport_id 162*/
(137, 1132, 25),
(139, 1132, 1),
(141, 1133, 25),
(143, 1133, 3),
/*finals for sport with sport_id 162*/
(137, 1134, 25),
(141, 1134, 3);