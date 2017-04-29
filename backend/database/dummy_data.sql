USE malicsi;

delete from account;
/*
  create admin account
*/
  INSERT INTO account VALUES (
    NULL,                                           /*account_id*/
    'Eddie Ron Adolph',                             /*firstname*/
    '',                                             /*middlename*/
    'Vallejos',                                     /*lastname*/
    'admin@gmail.com',                              /*email*/
    'admin',                                        /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                          /*birthday*/
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
    'Cyrez',                                        /*firstname*/
    '',                                             /*middlename*/
    'Ronquillo',                                    /*lastname*/
    'past_game_events@gmail.com',                   /*email*/
    'past_game_events',                             /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                          /*birthday*/
    'CAS',                                          /*college*/
    true,                                           /*is_game_head*/
    'Game Head',                                    /*position*/
    true,                                           /*is_player*/
    '01',                                           /*player_jersey_num*/
    'Playing Coach'                                 /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Charles Cyrus',                                /*firstname*/
    '',                                             /*middlename*/
    'Chavez',                                       /*lastname*/
    'current_game_events@gmail.com',                /*email*/
    'current_game_events',                          /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                          /*birthday*/
    'CAS',                                          /*college*/
    true,                                           /*is_game_head*/
    'Game Head',                                    /*position*/
    true,                                           /*is_player*/
    '02',                                           /*player_jersey_num*/
    'Playing Coach'                                 /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Charles Joe',                                  /*firstname*/
    '',                                             /*middlename*/
    'Marquez',                                      /*lastname*/
    'upcoming_game_events@gmail.com',               /*email*/
    'upcoming_game_events',                         /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                          /*birthday*/
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
      'Game 1',                                                           /*game_name*/
      SUBDATE(NOW(), INTERVAL 10 WEEK),                                   /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 8 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')/*account_id*/
    );
    CALL add_game_event (
      'Game 2',                                                           /*game_name*/
      SUBDATE(NOW(), INTERVAL 9 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 7 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')/*account_id*/
    );
    CALL add_game_event (
      'Game 3',                                                           /*game_name*/
      SUBDATE(NOW(), INTERVAL 8 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 6 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')/*account_id*/
    );
    CALL add_game_event (
      'Game 4',                                                           /*game_name*/
      SUBDATE(NOW(), INTERVAL 7 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 5 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')/*account_id*/
    );
    CALL add_game_event (
      'Game 5',                                                           /*game_name*/
      SUBDATE(NOW(), INTERVAL 6 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 4 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')/*account_id*/
    );
    CALL add_game_event (
      'Game 6',                                                           /*game_name*/
      SUBDATE(NOW(), INTERVAL 5 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 3 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')/*account_id*/
    );
    CALL add_game_event (
      'Game 7',                                                           /*game_name*/
      SUBDATE(NOW(), INTERVAL 4 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 2 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')/*account_id*/
    );
    CALL add_game_event (
      'Game 8',                                                           /*game_name*/
      SUBDATE(NOW(), INTERVAL 3 WEEK),                                    /*game_starting_time_date*/
      SUBDATE(NOW(), INTERVAL 1 WEEK),                                    /*game_ending_time_date*/
      (SELECT account_id FROM account WHERE username = 'past_game_events')/*account_id*/
    );
/*
  current_game_events
*/
  CALL add_game_event (
    'Game 9',                                                               /*game_name*/
    SUBDATE(NOW(), INTERVAL 8 DAY),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 1 DAY),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 10',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 7 DAY),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 2 DAY),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 11',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 6 DAY),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 3 DAY),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 12',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 5 DAY),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 4 DAY),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 13',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 4 DAY),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 5 DAY),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 14',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 3 DAY),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 6 DAY),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 15',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 2 DAY),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 7 DAY),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 16',                                                              /*game_name*/
    SUBDATE(NOW(), INTERVAL 1 DAY),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 8 DAY),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'current_game_events') /*account_id*/
  );
/*
  upcoming_game_events
*/
  CALL add_game_event (
    'Game 17',                                                               /*game_name*/
    ADDDATE(NOW(), INTERVAL 1 WEEK),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 3 WEEK),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 18',                                                               /*game_name*/
    ADDDATE(NOW(), INTERVAL 2 WEEK),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 4 WEEK),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 19',                                                               /*game_name*/
    ADDDATE(NOW(), INTERVAL 3 WEEK),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 5 WEEK),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 20',                                                               /*game_name*/
    ADDDATE(NOW(), INTERVAL 4 WEEK),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 6 WEEK),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 21',                                                               /*game_name*/
    ADDDATE(NOW(), INTERVAL 5 WEEK),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 7 WEEK),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 22',                                                               /*game_name*/
    ADDDATE(NOW(), INTERVAL 6 WEEK),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 8 WEEK),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 23',                                                               /*game_name*/
    ADDDATE(NOW(), INTERVAL 7 WEEK),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 9 WEEK),                                         /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );
  CALL add_game_event (
    'Game 24',                                                               /*game_name*/
    ADDDATE(NOW(), INTERVAL 8 WEEK),                                         /*game_starting_time_date*/
    ADDDATE(NOW(), INTERVAL 10 WEEK),                                        /*game_ending_time_date*/
    (SELECT account_id FROM account WHERE username = 'upcoming_game_events') /*account_id*/
  );


delete from sponsor;
/*
  create sponsors of game_events
*/
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 1')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 1')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 1')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 1')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 2')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 2')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 2')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 2')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 3')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 3')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 3')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 3')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 4')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 4')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 4')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 4')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 5')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 5')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 5')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 5')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 6')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 6')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 6')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 6')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 7')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 7')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 7')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 7')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 8')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 8')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 8')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 8')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 9')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 9')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 9')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 9')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 10')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 10')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 10')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 10')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 11')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 11')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 11')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 11')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 12')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 12')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 12')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 12')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 13')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 13')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 13')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 13')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 14')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 14')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 14')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 14')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 15')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 15')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 15')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 15')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 16')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 16')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 16')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 16')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 17')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 17')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 17')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 17')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 18')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 18')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 18')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 18')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 19')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 19')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 19')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 19')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 20')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 20')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 20')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 20')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 21')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 21')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 21')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 21')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 22')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 22')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 22')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 22')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 23')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 23')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 23')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 23')   /*game_id*/
  );
  CALL add_sponsor (
    'Intel',                                                       /*sponsor_name*/
    'http://logos.com/logo2.png',                                 /*sponsor_logo*/
    'minor',                                                      /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 24')   /*game_id*/
  );
  CALL add_sponsor (
    'ACSS',                                                       /*sponsor_name*/
    'http://logos.com/logo3.png',                                 /*sponsor_logo*/
    'major',                                                      /*sponsor_type*/
    'desc2',                                                      /*sponsor_desc*/
    'web_add2',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 24')   /*game_id*/
  );
  CALL add_sponsor (
    'YSES',                                                       /*sponsor_name*/
    'http://logos.com/logo4.png',                                 /*sponsor_logo*/
    'official partner',                                           /*sponsor_type*/
    'desc1',                                                      /*sponsor_desc*/
    'web_add1',                                                   /*web_address*/
    (SELECT game_id FROM game_event WHERE game_name = 'Game 24')   /*game_id*/
  );
  CALL add_sponsor (
    'COSS',                                                       /*sponsor_name*/
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
  sport 
VALUES
  (1, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (2, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (3, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (4, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (5, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (6, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (7, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 1')),
  (8, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (9, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (10, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (11, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (12, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (13, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (14, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 2')),
  (15, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (16, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (17, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (18, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (19, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (20, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (21, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 3')),
  (22, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (23, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (24, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (25, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (26, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (27, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (28, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 4')),
  (29, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (30, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (31, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (32, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (33, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (34, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (35, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 5')),
  (36, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (37, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (38, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (39, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (40, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (41, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (42, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 6')),
  (43, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (44, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (45, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (46, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (47, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (48, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (49, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 7')),
  (50, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (51, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (52, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (53, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (54, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (55, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (56, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 8')),
  (57, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (58, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (59, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (60, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (61, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (62, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (63, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 9')),
  (64, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (65, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (66, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (67, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (68, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (69, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (70, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 10')),
  (71, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (72, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (73, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (74, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (75, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (76, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (77, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 11')),
  (78, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (79, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (80, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (81, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (82, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (83, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (84, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 12')),
  (85, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (86, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (87, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (88, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (89, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (90, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (91, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 13')),
  (92, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (93, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (94, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (95, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (96, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (97, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (98, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 14')),
  (99, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (100, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (101, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (102, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (103, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (104, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (105, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 15')),
  (106, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (107, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (108, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (109, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (110, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (111, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (112, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 16')),
  (113, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (114, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (115, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (116, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (117, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (118, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (119, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 17')),
  (120, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (121, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (122, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (123, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (124, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (125, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (126, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 18')),
  (127, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (128, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (129, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (130, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (131, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (132, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (133, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 19')),
  (134, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (135, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (136, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (137, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (138, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (139, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (140, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 20')),
  (141, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (142, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (143, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (144, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (145, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (146, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (147, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 21')),
  (148, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (149, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (150, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (151, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (152, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (153, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (154, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 22')),
  (155, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (156, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (157, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (158, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (159, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (160, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (161, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 23')),
  (162, 'Volleyball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (163, 'Volleyball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (164, 'Volleyball', 'mixed', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (165, 'Basketball', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (166, 'Basketball', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (167, 'Football', 'men', (SELECT game_id FROM game_event WHERE game_name = 'Game 24')),
  (168, 'Football', 'women', (SELECT game_id FROM game_event WHERE game_name = 'Game 24'));
  
delete from match_event;
/*
  create match_events per sport
*/
INSERT INTO
  match_event 
VALUES 
/*Matches of Game 1*/
  /*
    Matches of sport_id 1
  */
    (1,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 1, 'Baker Hall', 'UPLB', 'Gym'),
    (2,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 1, 'Copeland Gym','UPLB', 'Gym'),
    (3,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 1, 'Physci Building', 'UPLB', 'Building'),
    (4,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 1, 'Freedom Park', 'UPLB', 'Park'),
    (5,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 1, 'Freedom Park', 'UPLB', 'Park'),
    (6,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 1, 'Freedom Park', 'UPLB', 'Park'),
    (7,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'finals', 1,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 2
  */
    (8,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 2, 'Baker Hall', 'UPLB', 'Gym'),
    (9,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 2, 'Copeland Gym','UPLB', 'Gym'),
    (10,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 2, 'Physci Building', 'UPLB', 'Building'),
    (11,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 2, 'Freedom Park', 'UPLB', 'Park'),
    (12,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 2, 'Freedom Park', 'UPLB', 'Park'),
    (13,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 2, 'Freedom Park', 'UPLB', 'Park'),
    (14,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'finals', 2,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 3
  */
    (15,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 3, 'Baker Hall', 'UPLB', 'Gym'),
    (16,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 3, 'Copeland Gym','UPLB', 'Gym'),
    (17,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 3, 'Physci Building', 'UPLB', 'Building'),
    (18,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 3, 'Freedom Park', 'UPLB', 'Park'),
    (19,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 3, 'Freedom Park', 'UPLB', 'Park'),
    (20,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 3, 'Freedom Park', 'UPLB', 'Park'),
    (21,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'finals', 3,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 4
  */
    (22,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 4, 'Baker Hall', 'UPLB', 'Gym'),
    (23,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 4, 'Copeland Gym','UPLB', 'Gym'),
    (24,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 4, 'Physci Building', 'UPLB', 'Building'),
    (25,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 4, 'Freedom Park', 'UPLB', 'Park'),
    (26,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 4, 'Freedom Park', 'UPLB', 'Park'),
    (27,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 4, 'Freedom Park', 'UPLB', 'Park'),
    (28,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'finals', 4,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 5
  */
    (29,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 5, 'Baker Hall', 'UPLB', 'Gym'),
    (30,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 5, 'Copeland Gym','UPLB', 'Gym'),
    (31,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 5, 'Physci Building', 'UPLB', 'Building'),
    (32,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 5, 'Freedom Park', 'UPLB', 'Park'),
    (33,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 5, 'Freedom Park', 'UPLB', 'Park'),
    (34,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 5, 'Freedom Park', 'UPLB', 'Park'),
    (35,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'finals', 5,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 6
  */
    (36,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 6, 'Baker Hall', 'UPLB', 'Gym'),
    (37,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 6, 'Copeland Gym','UPLB', 'Gym'),
    (38,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 6, 'Physci Building', 'UPLB', 'Building'),
    (39,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 6, 'Freedom Park', 'UPLB', 'Park'),
    (40,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 6, 'Freedom Park', 'UPLB', 'Park'),
    (41,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 6, 'Freedom Park', 'UPLB', 'Park'),
    (42,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'finals', 6,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 7
  */
    (43,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 7, 'Baker Hall', 'UPLB', 'Gym'),
    (44,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 7, 'Copeland Gym','UPLB', 'Gym'),
    (45,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 7, 'Physci Building', 'UPLB', 'Building'),
    (46,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 7, 'Freedom Park', 'UPLB', 'Park'),
    (47,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 7, 'Freedom Park', 'UPLB', 'Park'),
    (48,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 7, 'Freedom Park', 'UPLB', 'Park'),
    (49,true, SUBDATE(NOW(), INTERVAL 9 WEEK), 'finals', 7,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 2*/
  /*
    Matches of sport_id 8
  */
    (50,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 8, 'Baker Hall', 'UPLB', 'Gym'),
    (51,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 8, 'Copeland Gym','UPLB', 'Gym'),
    (52,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 8, 'Physci Building', 'UPLB', 'Building'),
    (53,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 8, 'Freedom Park', 'UPLB', 'Park'),
    (54,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 8, 'Freedom Park', 'UPLB', 'Park'),
    (55,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 8, 'Freedom Park', 'UPLB', 'Park'),
    (56,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'finals', 8,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 9
  */
    (57,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 9, 'Baker Hall', 'UPLB', 'Gym'),
    (58,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 9, 'Copeland Gym','UPLB', 'Gym'),
    (59,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 9, 'Physci Building', 'UPLB', 'Building'),
    (60,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 9, 'Freedom Park', 'UPLB', 'Park'),
    (61,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 9, 'Freedom Park', 'UPLB', 'Park'),
    (62,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 9, 'Freedom Park', 'UPLB', 'Park'),
    (63,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'finals', 9,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 10
  */
    (64,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 10, 'Baker Hall', 'UPLB', 'Gym'),
    (65,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 10, 'Copeland Gym','UPLB', 'Gym'),
    (66,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 10, 'Physci Building', 'UPLB', 'Building'),
    (67,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 10, 'Freedom Park', 'UPLB', 'Park'),
    (68,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 10, 'Freedom Park', 'UPLB', 'Park'),
    (69,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 10, 'Freedom Park', 'UPLB', 'Park'),
    (70,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'finals', 10,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 11
  */
    (71,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 11, 'Baker Hall', 'UPLB', 'Gym'),
    (72,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 11, 'Copeland Gym','UPLB', 'Gym'),
    (73,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 11, 'Physci Building', 'UPLB', 'Building'),
    (74,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 11, 'Freedom Park', 'UPLB', 'Park'),
    (75,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 11, 'Freedom Park', 'UPLB', 'Park'),
    (76,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 11, 'Freedom Park', 'UPLB', 'Park'),
    (77,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'finals', 11,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 12
  */
    (78,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 12, 'Baker Hall', 'UPLB', 'Gym'),
    (79,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 12, 'Copeland Gym','UPLB', 'Gym'),
    (80,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 12, 'Physci Building', 'UPLB', 'Building'),
    (81,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 12, 'Freedom Park', 'UPLB', 'Park'),
    (82,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 12, 'Freedom Park', 'UPLB', 'Park'),
    (83,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 12, 'Freedom Park', 'UPLB', 'Park'),
    (84,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'finals', 12,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 13
  */
    (85,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 13, 'Baker Hall', 'UPLB', 'Gym'),
    (86,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 13, 'Copeland Gym','UPLB', 'Gym'),
    (87,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 13, 'Physci Building', 'UPLB', 'Building'),
    (88,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 13, 'Freedom Park', 'UPLB', 'Park'),
    (89,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 13, 'Freedom Park', 'UPLB', 'Park'),
    (90,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 13, 'Freedom Park', 'UPLB', 'Park'),
    (91,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'finals', 13,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 14
  */
    (92,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 14, 'Baker Hall', 'UPLB', 'Gym'),
    (93,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 14, 'Copeland Gym','UPLB', 'Gym'),
    (94,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 14, 'Physci Building', 'UPLB', 'Building'),
    (95,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 14, 'Freedom Park', 'UPLB', 'Park'),
    (96,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 14, 'Freedom Park', 'UPLB', 'Park'),
    (97,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 14, 'Freedom Park', 'UPLB', 'Park'),
    (98,true, SUBDATE(NOW(), INTERVAL 8 WEEK), 'finals', 14,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 3*/
  /*
    Matches of sport_id 15
  */
    (99,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 15, 'Baker Hall', 'UPLB', 'Gym'),
    (100,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 15, 'Copeland Gym','UPLB', 'Gym'),
    (101,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 15, 'Physci Building', 'UPLB', 'Building'),
    (102,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 15, 'Freedom Park', 'UPLB', 'Park'),
    (103,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 15, 'Freedom Park', 'UPLB', 'Park'),
    (104,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 15, 'Freedom Park', 'UPLB', 'Park'),
    (105,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'finals', 15,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 16
  */
    (106,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 16, 'Baker Hall', 'UPLB', 'Gym'),
    (107,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 16, 'Copeland Gym','UPLB', 'Gym'),
    (108,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 16, 'Physci Building', 'UPLB', 'Building'),
    (109,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 16, 'Freedom Park', 'UPLB', 'Park'),
    (110,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 16, 'Freedom Park', 'UPLB', 'Park'),
    (111,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 16, 'Freedom Park', 'UPLB', 'Park'),
    (112,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'finals', 16,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 17
  */
    (113,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 17, 'Baker Hall', 'UPLB', 'Gym'),
    (114,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 17, 'Copeland Gym','UPLB', 'Gym'),
    (115,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 17, 'Physci Building', 'UPLB', 'Building'),
    (116,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 17, 'Freedom Park', 'UPLB', 'Park'),
    (117,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 17, 'Freedom Park', 'UPLB', 'Park'),
    (118,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 17, 'Freedom Park', 'UPLB', 'Park'),
    (119,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'finals', 17,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 18
  */
    (120,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 18, 'Baker Hall', 'UPLB', 'Gym'),
    (121,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 18, 'Copeland Gym','UPLB', 'Gym'),
    (122,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 18, 'Physci Building', 'UPLB', 'Building'),
    (123,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 18, 'Freedom Park', 'UPLB', 'Park'),
    (124,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 18, 'Freedom Park', 'UPLB', 'Park'),
    (125,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 18, 'Freedom Park', 'UPLB', 'Park'),
    (126,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'finals', 18,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 19
  */
    (127,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 19, 'Baker Hall', 'UPLB', 'Gym'),
    (128,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 19, 'Copeland Gym','UPLB', 'Gym'),
    (129,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 19, 'Physci Building', 'UPLB', 'Building'),
    (130,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 19, 'Freedom Park', 'UPLB', 'Park'),
    (131,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 19, 'Freedom Park', 'UPLB', 'Park'),
    (132,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 19, 'Freedom Park', 'UPLB', 'Park'),
    (133,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'finals', 19,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 20
  */
    (134,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 20, 'Baker Hall', 'UPLB', 'Gym'),
    (135,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 20, 'Copeland Gym','UPLB', 'Gym'),
    (136,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 20, 'Physci Building', 'UPLB', 'Building'),
    (137,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 20, 'Freedom Park', 'UPLB', 'Park'),
    (138,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 20, 'Freedom Park', 'UPLB', 'Park'),
    (139,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 20, 'Freedom Park', 'UPLB', 'Park'),
    (140,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'finals', 20,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 21
  */
    (141,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 21, 'Baker Hall', 'UPLB', 'Gym'),
    (142,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 21, 'Copeland Gym','UPLB', 'Gym'),
    (143,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 21, 'Physci Building', 'UPLB', 'Building'),
    (144,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 21, 'Freedom Park', 'UPLB', 'Park'),
    (145,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 21, 'Freedom Park', 'UPLB', 'Park'),
    (146,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 21, 'Freedom Park', 'UPLB', 'Park'),
    (147,true, SUBDATE(NOW(), INTERVAL 7 WEEK), 'finals', 21,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 4*/
  /*
    Matches of sport_id 22
  */
    (148,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 22, 'Baker Hall', 'UPLB', 'Gym'),
    (149,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 22, 'Copeland Gym','UPLB', 'Gym'),
    (150,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 22, 'Physci Building', 'UPLB', 'Building'),
    (151,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 22, 'Freedom Park', 'UPLB', 'Park'),
    (152,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 22, 'Freedom Park', 'UPLB', 'Park'),
    (153,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 22, 'Freedom Park', 'UPLB', 'Park'),
    (154,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'finals', 22,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 23
  */
    (155,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 23, 'Baker Hall', 'UPLB', 'Gym'),
    (156,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 23, 'Copeland Gym','UPLB', 'Gym'),
    (157,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 23, 'Physci Building', 'UPLB', 'Building'),
    (158,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 23, 'Freedom Park', 'UPLB', 'Park'),
    (159,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 23, 'Freedom Park', 'UPLB', 'Park'),
    (160,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 23, 'Freedom Park', 'UPLB', 'Park'),
    (161,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'finals', 23,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 24
  */
    (162,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 24, 'Baker Hall', 'UPLB', 'Gym'),
    (163,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 24, 'Copeland Gym','UPLB', 'Gym'),
    (164,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 24, 'Physci Building', 'UPLB', 'Building'),
    (165,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 24, 'Freedom Park', 'UPLB', 'Park'),
    (166,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 24, 'Freedom Park', 'UPLB', 'Park'),
    (167,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 24, 'Freedom Park', 'UPLB', 'Park'),
    (168,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'finals', 24,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 25
  */
    (169,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 25, 'Baker Hall', 'UPLB', 'Gym'),
    (170,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 25, 'Copeland Gym','UPLB', 'Gym'),
    (171,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 25, 'Physci Building', 'UPLB', 'Building'),
    (172,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 25, 'Freedom Park', 'UPLB', 'Park'),
    (173,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 25, 'Freedom Park', 'UPLB', 'Park'),
    (174,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 25, 'Freedom Park', 'UPLB', 'Park'),
    (175,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'finals', 25,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 26
  */
    (176,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 26, 'Baker Hall', 'UPLB', 'Gym'),
    (177,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 26, 'Copeland Gym','UPLB', 'Gym'),
    (178,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 26, 'Physci Building', 'UPLB', 'Building'),
    (179,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 26, 'Freedom Park', 'UPLB', 'Park'),
    (180,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 26, 'Freedom Park', 'UPLB', 'Park'),
    (181,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 26, 'Freedom Park', 'UPLB', 'Park'),
    (182,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'finals', 26,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 27
  */
    (183,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 27, 'Baker Hall', 'UPLB', 'Gym'),
    (184,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 27, 'Copeland Gym','UPLB', 'Gym'),
    (185,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 27, 'Physci Building', 'UPLB', 'Building'),
    (186,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 27, 'Freedom Park', 'UPLB', 'Park'),
    (187,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 27, 'Freedom Park', 'UPLB', 'Park'),
    (188,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 27, 'Freedom Park', 'UPLB', 'Park'),
    (189,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'finals', 27,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 28
  */
    (190,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 28, 'Baker Hall', 'UPLB', 'Gym'),
    (191,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 28, 'Copeland Gym','UPLB', 'Gym'),
    (192,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 28, 'Physci Building', 'UPLB', 'Building'),
    (193,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 28, 'Freedom Park', 'UPLB', 'Park'),
    (194,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 28, 'Freedom Park', 'UPLB', 'Park'),
    (195,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 28, 'Freedom Park', 'UPLB', 'Park'),
    (196,true, SUBDATE(NOW(), INTERVAL 6 WEEK), 'finals', 28,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 5*/
  /*
    Matches of sport_id 29
  */
    (197,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 29, 'Baker Hall', 'UPLB', 'Gym'),
    (198,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 29, 'Copeland Gym','UPLB', 'Gym'),
    (199,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 29, 'Physci Building', 'UPLB', 'Building'),
    (200,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 29, 'Freedom Park', 'UPLB', 'Park'),
    (201,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 29, 'Freedom Park', 'UPLB', 'Park'),
    (202,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 29, 'Freedom Park', 'UPLB', 'Park'),
    (203,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'finals', 29,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 30
  */
    (204,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 30, 'Baker Hall', 'UPLB', 'Gym'),
    (205,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 30, 'Copeland Gym','UPLB', 'Gym'),
    (206,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 30, 'Physci Building', 'UPLB', 'Building'),
    (207,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 30, 'Freedom Park', 'UPLB', 'Park'),
    (208,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 30, 'Freedom Park', 'UPLB', 'Park'),
    (209,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 30, 'Freedom Park', 'UPLB', 'Park'),
    (210,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'finals', 30,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 31
  */
    (211,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 31, 'Baker Hall', 'UPLB', 'Gym'),
    (212,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 31, 'Copeland Gym','UPLB', 'Gym'),
    (213,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 31, 'Physci Building', 'UPLB', 'Building'),
    (214,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 31, 'Freedom Park', 'UPLB', 'Park'),
    (215,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 31, 'Freedom Park', 'UPLB', 'Park'),
    (216,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 31, 'Freedom Park', 'UPLB', 'Park'),
    (217,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'finals', 31,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 32
  */
    (218,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 32, 'Baker Hall', 'UPLB', 'Gym'),
    (219,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 32, 'Copeland Gym','UPLB', 'Gym'),
    (220,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 32, 'Physci Building', 'UPLB', 'Building'),
    (221,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 32, 'Freedom Park', 'UPLB', 'Park'),
    (222,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 32, 'Freedom Park', 'UPLB', 'Park'),
    (223,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 32, 'Freedom Park', 'UPLB', 'Park'),
    (224,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'finals', 32,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 33
  */
    (225,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 33, 'Baker Hall', 'UPLB', 'Gym'),
    (226,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 33, 'Copeland Gym','UPLB', 'Gym'),
    (227,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 33, 'Physci Building', 'UPLB', 'Building'),
    (228,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 33, 'Freedom Park', 'UPLB', 'Park'),
    (229,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 33, 'Freedom Park', 'UPLB', 'Park'),
    (230,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 33, 'Freedom Park', 'UPLB', 'Park'),
    (231,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'finals', 33,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 34
  */
    (232,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 34, 'Baker Hall', 'UPLB', 'Gym'),
    (233,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 34, 'Copeland Gym','UPLB', 'Gym'),
    (234,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 34, 'Physci Building', 'UPLB', 'Building'),
    (235,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 34, 'Freedom Park', 'UPLB', 'Park'),
    (236,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 34, 'Freedom Park', 'UPLB', 'Park'),
    (237,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 34, 'Freedom Park', 'UPLB', 'Park'),
    (238,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'finals', 34,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 35
  */
    (239,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 35, 'Baker Hall', 'UPLB', 'Gym'),
    (240,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 35, 'Copeland Gym','UPLB', 'Gym'),
    (241,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 35, 'Physci Building', 'UPLB', 'Building'),
    (242,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 35, 'Freedom Park', 'UPLB', 'Park'),
    (243,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 35, 'Freedom Park', 'UPLB', 'Park'),
    (244,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 35, 'Freedom Park', 'UPLB', 'Park'),
    (245,true, SUBDATE(NOW(), INTERVAL 5 WEEK), 'finals', 35,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 6*/
  /*
    Matches of sport_id 36
  */
    (246,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 36, 'Baker Hall', 'UPLB', 'Gym'),
    (247,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 36, 'Copeland Gym','UPLB', 'Gym'),
    (248,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 36, 'Physci Building', 'UPLB', 'Building'),
    (249,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 36, 'Freedom Park', 'UPLB', 'Park'),
    (250,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 36, 'Freedom Park', 'UPLB', 'Park'),
    (251,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 36, 'Freedom Park', 'UPLB', 'Park'),
    (252,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'finals', 36,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 37
  */
    (253,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 37, 'Baker Hall', 'UPLB', 'Gym'),
    (254,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 37, 'Copeland Gym','UPLB', 'Gym'),
    (255,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 37, 'Physci Building', 'UPLB', 'Building'),
    (256,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 37, 'Freedom Park', 'UPLB', 'Park'),
    (257,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 37, 'Freedom Park', 'UPLB', 'Park'),
    (258,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 37, 'Freedom Park', 'UPLB', 'Park'),
    (259,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'finals', 37,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 38
  */
    (260,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 38, 'Baker Hall', 'UPLB', 'Gym'),
    (261,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 38, 'Copeland Gym','UPLB', 'Gym'),
    (262,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 38, 'Physci Building', 'UPLB', 'Building'),
    (263,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 38, 'Freedom Park', 'UPLB', 'Park'),
    (264,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 38, 'Freedom Park', 'UPLB', 'Park'),
    (265,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 38, 'Freedom Park', 'UPLB', 'Park'),
    (266,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'finals', 38,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 39
  */
    (267,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 39, 'Baker Hall', 'UPLB', 'Gym'),
    (268,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 39, 'Copeland Gym','UPLB', 'Gym'),
    (269,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 39, 'Physci Building', 'UPLB', 'Building'),
    (270,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 39, 'Freedom Park', 'UPLB', 'Park'),
    (271,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 39, 'Freedom Park', 'UPLB', 'Park'),
    (272,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 39, 'Freedom Park', 'UPLB', 'Park'),
    (273,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'finals', 39,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 40
  */
    (274,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 40, 'Baker Hall', 'UPLB', 'Gym'),
    (275,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 40, 'Copeland Gym','UPLB', 'Gym'),
    (276,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 40, 'Physci Building', 'UPLB', 'Building'),
    (277,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 40, 'Freedom Park', 'UPLB', 'Park'),
    (278,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 40, 'Freedom Park', 'UPLB', 'Park'),
    (279,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 40, 'Freedom Park', 'UPLB', 'Park'),
    (280,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'finals', 40,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 41
  */
    (281,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 41, 'Baker Hall', 'UPLB', 'Gym'),
    (282,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 41, 'Copeland Gym','UPLB', 'Gym'),
    (283,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 41, 'Physci Building', 'UPLB', 'Building'),
    (284,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 41, 'Freedom Park', 'UPLB', 'Park'),
    (285,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 41, 'Freedom Park', 'UPLB', 'Park'),
    (286,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 41, 'Freedom Park', 'UPLB', 'Park'),
    (287,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'finals', 41,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 42
  */
    (288,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 42, 'Baker Hall', 'UPLB', 'Gym'),
    (289,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 42, 'Copeland Gym','UPLB', 'Gym'),
    (290,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 42, 'Physci Building', 'UPLB', 'Building'),
    (291,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 42, 'Freedom Park', 'UPLB', 'Park'),
    (292,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 42, 'Freedom Park', 'UPLB', 'Park'),
    (293,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 42, 'Freedom Park', 'UPLB', 'Park'),
    (294,true, SUBDATE(NOW(), INTERVAL 4 WEEK), 'finals', 42,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 7*/
  /*
    Matches of sport_id 43
  */
    (295,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 43, 'Baker Hall', 'UPLB', 'Gym'),
    (296,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 43, 'Copeland Gym','UPLB', 'Gym'),
    (297,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 43, 'Physci Building', 'UPLB', 'Building'),
    (298,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 43, 'Freedom Park', 'UPLB', 'Park'),
    (299,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 43, 'Freedom Park', 'UPLB', 'Park'),
    (300,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 43, 'Freedom Park', 'UPLB', 'Park'),
    (301,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'finals', 43,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 44
  */
    (302,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 44, 'Baker Hall', 'UPLB', 'Gym'),
    (303,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 44, 'Copeland Gym','UPLB', 'Gym'),
    (304,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 44, 'Physci Building', 'UPLB', 'Building'),
    (305,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 44, 'Freedom Park', 'UPLB', 'Park'),
    (306,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 44, 'Freedom Park', 'UPLB', 'Park'),
    (307,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 44, 'Freedom Park', 'UPLB', 'Park'),
    (308,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'finals', 44,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 45
  */
    (309,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 45, 'Baker Hall', 'UPLB', 'Gym'),
    (310,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 45, 'Copeland Gym','UPLB', 'Gym'),
    (311,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 45, 'Physci Building', 'UPLB', 'Building'),
    (312,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 45, 'Freedom Park', 'UPLB', 'Park'),
    (313,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 45, 'Freedom Park', 'UPLB', 'Park'),
    (314,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 45, 'Freedom Park', 'UPLB', 'Park'),
    (315,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'finals', 45,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 46
  */
    (316,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 46, 'Baker Hall', 'UPLB', 'Gym'),
    (317,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 46, 'Copeland Gym','UPLB', 'Gym'),
    (318,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 46, 'Physci Building', 'UPLB', 'Building'),
    (319,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 46, 'Freedom Park', 'UPLB', 'Park'),
    (320,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 46, 'Freedom Park', 'UPLB', 'Park'),
    (321,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 46, 'Freedom Park', 'UPLB', 'Park'),
    (322,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'finals', 46,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 47
  */
    (323,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 47, 'Baker Hall', 'UPLB', 'Gym'),
    (324,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 47, 'Copeland Gym','UPLB', 'Gym'),
    (325,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 47, 'Physci Building', 'UPLB', 'Building'),
    (326,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 47, 'Freedom Park', 'UPLB', 'Park'),
    (327,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 47, 'Freedom Park', 'UPLB', 'Park'),
    (328,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 47, 'Freedom Park', 'UPLB', 'Park'),
    (329,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'finals', 47,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 48
  */
    (330,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 48, 'Baker Hall', 'UPLB', 'Gym'),
    (331,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 48, 'Copeland Gym','UPLB', 'Gym'),
    (332,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 48, 'Physci Building', 'UPLB', 'Building'),
    (333,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 48, 'Freedom Park', 'UPLB', 'Park'),
    (334,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 48, 'Freedom Park', 'UPLB', 'Park'),
    (335,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 48, 'Freedom Park', 'UPLB', 'Park'),
    (336,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'finals', 48,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 49
  */
    (337,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 49, 'Baker Hall', 'UPLB', 'Gym'),
    (338,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 49, 'Copeland Gym','UPLB', 'Gym'),
    (339,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 49, 'Physci Building', 'UPLB', 'Building'),
    (340,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 49, 'Freedom Park', 'UPLB', 'Park'),
    (341,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 49, 'Freedom Park', 'UPLB', 'Park'),
    (342,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 49, 'Freedom Park', 'UPLB', 'Park'),
    (343,true, SUBDATE(NOW(), INTERVAL 3 WEEK), 'finals', 49,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 8*/
  /*
    Matches of sport_id 50
  */
    (344,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 50, 'Baker Hall', 'UPLB', 'Gym'),
    (345,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 50, 'Copeland Gym','UPLB', 'Gym'),
    (346,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 50, 'Physci Building', 'UPLB', 'Building'),
    (347,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 50, 'Freedom Park', 'UPLB', 'Park'),
    (348,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 50, 'Freedom Park', 'UPLB', 'Park'),
    (349,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 50, 'Freedom Park', 'UPLB', 'Park'),
    (350,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'finals', 50,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 51
  */
    (351,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 51, 'Baker Hall', 'UPLB', 'Gym'),
    (352,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 51, 'Copeland Gym','UPLB', 'Gym'),
    (353,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 51, 'Physci Building', 'UPLB', 'Building'),
    (354,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 51, 'Freedom Park', 'UPLB', 'Park'),
    (355,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 51, 'Freedom Park', 'UPLB', 'Park'),
    (356,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 51, 'Freedom Park', 'UPLB', 'Park'),
    (357,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'finals', 51,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 52
  */
    (358,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 52, 'Baker Hall', 'UPLB', 'Gym'),
    (359,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 52, 'Copeland Gym','UPLB', 'Gym'),
    (360,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 52, 'Physci Building', 'UPLB', 'Building'),
    (361,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 52, 'Freedom Park', 'UPLB', 'Park'),
    (362,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 52, 'Freedom Park', 'UPLB', 'Park'),
    (363,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 52, 'Freedom Park', 'UPLB', 'Park'),
    (364,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'finals', 52,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 53
  */
    (365,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 53, 'Baker Hall', 'UPLB', 'Gym'),
    (366,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 53, 'Copeland Gym','UPLB', 'Gym'),
    (367,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 53, 'Physci Building', 'UPLB', 'Building'),
    (368,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 53, 'Freedom Park', 'UPLB', 'Park'),
    (369,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 53, 'Freedom Park', 'UPLB', 'Park'),
    (370,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 53, 'Freedom Park', 'UPLB', 'Park'),
    (371,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'finals', 53,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 54
  */
    (372,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 54, 'Baker Hall', 'UPLB', 'Gym'),
    (373,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 54, 'Copeland Gym','UPLB', 'Gym'),
    (374,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 54, 'Physci Building', 'UPLB', 'Building'),
    (375,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 54, 'Freedom Park', 'UPLB', 'Park'),
    (376,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 54, 'Freedom Park', 'UPLB', 'Park'),
    (377,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 54, 'Freedom Park', 'UPLB', 'Park'),
    (378,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'finals', 54,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 55
  */
    (379,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 55, 'Baker Hall', 'UPLB', 'Gym'),
    (380,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 55, 'Copeland Gym','UPLB', 'Gym'),
    (381,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 55, 'Physci Building', 'UPLB', 'Building'),
    (382,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 55, 'Freedom Park', 'UPLB', 'Park'),
    (383,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 55, 'Freedom Park', 'UPLB', 'Park'),
    (384,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 55, 'Freedom Park', 'UPLB', 'Park'),
    (385,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'finals', 55,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 56
  */
    (386,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 56, 'Baker Hall', 'UPLB', 'Gym'),
    (387,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 56, 'Copeland Gym','UPLB', 'Gym'),
    (388,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 56, 'Physci Building', 'UPLB', 'Building'),
    (389,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 56, 'Freedom Park', 'UPLB', 'Park'),
    (390,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 56, 'Freedom Park', 'UPLB', 'Park'),
    (391,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 56, 'Freedom Park', 'UPLB', 'Park'),
    (392,true, SUBDATE(NOW(), INTERVAL 2 WEEK), 'finals', 56,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 9*/
  /*
    Matches of sport_id 57
  */
    (393,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 57, 'Baker Hall', 'UPLB', 'Gym'),
    (394,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 57, 'Copeland Gym','UPLB', 'Gym'),
    (395,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 57, 'Physci Building', 'UPLB', 'Building'),
    (396,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 57, 'Freedom Park', 'UPLB', 'Park'),
    (397,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 57, 'Freedom Park', 'UPLB', 'Park'),
    (398,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 57, 'Freedom Park', 'UPLB', 'Park'),
    (399,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'finals', 57,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 58
  */
    (400,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 58, 'Baker Hall', 'UPLB', 'Gym'),
    (401,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 58, 'Copeland Gym','UPLB', 'Gym'),
    (402,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 58, 'Physci Building', 'UPLB', 'Building'),
    (403,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 58, 'Freedom Park', 'UPLB', 'Park'),
    (404,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 58, 'Freedom Park', 'UPLB', 'Park'),
    (405,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 58, 'Freedom Park', 'UPLB', 'Park'),
    (406,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'finals', 58,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 59
  */
    (407,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 59, 'Baker Hall', 'UPLB', 'Gym'),
    (408,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 59, 'Copeland Gym','UPLB', 'Gym'),
    (409,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 59, 'Physci Building', 'UPLB', 'Building'),
    (410,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 59, 'Freedom Park', 'UPLB', 'Park'),
    (411,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 59, 'Freedom Park', 'UPLB', 'Park'),
    (412,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 59, 'Freedom Park', 'UPLB', 'Park'),
    (413,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'finals', 59,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 60
  */
    (414,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 60, 'Baker Hall', 'UPLB', 'Gym'),
    (415,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 60, 'Copeland Gym','UPLB', 'Gym'),
    (416,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 60, 'Physci Building', 'UPLB', 'Building'),
    (417,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 60, 'Freedom Park', 'UPLB', 'Park'),
    (418,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 60, 'Freedom Park', 'UPLB', 'Park'),
    (419,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 60, 'Freedom Park', 'UPLB', 'Park'),
    (420,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'finals', 60,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 61
  */
    (421,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 61, 'Baker Hall', 'UPLB', 'Gym'),
    (422,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 61, 'Copeland Gym','UPLB', 'Gym'),
    (423,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 61, 'Physci Building', 'UPLB', 'Building'),
    (424,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 61, 'Freedom Park', 'UPLB', 'Park'),
    (425,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 61, 'Freedom Park', 'UPLB', 'Park'),
    (426,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 61, 'Freedom Park', 'UPLB', 'Park'),
    (427,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'finals', 61,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 62
  */
    (428,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 62, 'Baker Hall', 'UPLB', 'Gym'),
    (429,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 62, 'Copeland Gym','UPLB', 'Gym'),
    (430,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 62, 'Physci Building', 'UPLB', 'Building'),
    (431,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 62, 'Freedom Park', 'UPLB', 'Park'),
    (432,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 62, 'Freedom Park', 'UPLB', 'Park'),
    (433,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 62, 'Freedom Park', 'UPLB', 'Park'),
    (434,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'finals', 62,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 63
  */
    (435,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 63, 'Baker Hall', 'UPLB', 'Gym'),
    (436,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 63, 'Copeland Gym','UPLB', 'Gym'),
    (437,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 63, 'Physci Building', 'UPLB', 'Building'),
    (438,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'elimination', 63, 'Freedom Park', 'UPLB', 'Park'),
    (439,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 63, 'Freedom Park', 'UPLB', 'Park'),
    (440,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'semi-finals', 63, 'Freedom Park', 'UPLB', 'Park'),
    (441,true, SUBDATE(NOW(), INTERVAL 7 DAY), 'finals', 63,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 10*/
  /*
    Matches of sport_id 64
  */
    (442,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 64, 'Baker Hall', 'UPLB', 'Gym'),
    (443,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 64, 'Copeland Gym','UPLB', 'Gym'),
    (444,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 64, 'Physci Building', 'UPLB', 'Building'),
    (445,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 64, 'Freedom Park', 'UPLB', 'Park'),
    (446,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 64, 'Freedom Park', 'UPLB', 'Park'),
    (447,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 64, 'Freedom Park', 'UPLB', 'Park'),
    (448,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'finals', 64,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 65
  */
    (449,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 65, 'Baker Hall', 'UPLB', 'Gym'),
    (450,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 65, 'Copeland Gym','UPLB', 'Gym'),
    (451,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 65, 'Physci Building', 'UPLB', 'Building'),
    (452,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 65, 'Freedom Park', 'UPLB', 'Park'),
    (453,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 65, 'Freedom Park', 'UPLB', 'Park'),
    (454,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 65, 'Freedom Park', 'UPLB', 'Park'),
    (455,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'finals', 65,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 66
  */
    (456,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 66, 'Baker Hall', 'UPLB', 'Gym'),
    (457,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 66, 'Copeland Gym','UPLB', 'Gym'),
    (458,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 66, 'Physci Building', 'UPLB', 'Building'),
    (459,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 66, 'Freedom Park', 'UPLB', 'Park'),
    (460,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 66, 'Freedom Park', 'UPLB', 'Park'),
    (461,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 66, 'Freedom Park', 'UPLB', 'Park'),
    (462,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'finals', 66,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 67
  */
    (463,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 67, 'Baker Hall', 'UPLB', 'Gym'),
    (464,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 67, 'Copeland Gym','UPLB', 'Gym'),
    (465,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 67, 'Physci Building', 'UPLB', 'Building'),
    (466,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 67, 'Freedom Park', 'UPLB', 'Park'),
    (467,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 67, 'Freedom Park', 'UPLB', 'Park'),
    (468,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 67, 'Freedom Park', 'UPLB', 'Park'),
    (469,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'finals', 67,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 68
  */
    (470,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 68, 'Baker Hall', 'UPLB', 'Gym'),
    (471,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 68, 'Copeland Gym','UPLB', 'Gym'),
    (472,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 68, 'Physci Building', 'UPLB', 'Building'),
    (473,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 68, 'Freedom Park', 'UPLB', 'Park'),
    (474,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 68, 'Freedom Park', 'UPLB', 'Park'),
    (475,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 68, 'Freedom Park', 'UPLB', 'Park'),
    (476,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'finals', 68,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 69
  */
    (477,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 69, 'Baker Hall', 'UPLB', 'Gym'),
    (478,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 69, 'Copeland Gym','UPLB', 'Gym'),
    (479,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 69, 'Physci Building', 'UPLB', 'Building'),
    (480,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 69, 'Freedom Park', 'UPLB', 'Park'),
    (481,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 69, 'Freedom Park', 'UPLB', 'Park'),
    (482,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 69, 'Freedom Park', 'UPLB', 'Park'),
    (483,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'finals', 69,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 70
  */
    (484,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 70, 'Baker Hall', 'UPLB', 'Gym'),
    (485,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 70, 'Copeland Gym','UPLB', 'Gym'),
    (486,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 70, 'Physci Building', 'UPLB', 'Building'),
    (487,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'elimination', 70, 'Freedom Park', 'UPLB', 'Park'),
    (488,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 70, 'Freedom Park', 'UPLB', 'Park'),
    (489,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'semi-finals', 70, 'Freedom Park', 'UPLB', 'Park'),
    (490,true, SUBDATE(NOW(), INTERVAL 6 DAY), 'finals', 70,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 11*/
  /*
    Matches of sport_id 71
  */
    (491,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 71, 'Baker Hall', 'UPLB', 'Gym'),
    (492,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 71, 'Copeland Gym','UPLB', 'Gym'),
    (493,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 71, 'Physci Building', 'UPLB', 'Building'),
    (494,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 71, 'Freedom Park', 'UPLB', 'Park'),
    (495,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 71, 'Freedom Park', 'UPLB', 'Park'),
    (496,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 71, 'Freedom Park', 'UPLB', 'Park'),
    (497,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'finals', 71,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 72
  */
    (498,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 72, 'Baker Hall', 'UPLB', 'Gym'),
    (499,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 72, 'Copeland Gym','UPLB', 'Gym'),
    (500,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 72, 'Physci Building', 'UPLB', 'Building'),
    (501,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 72, 'Freedom Park', 'UPLB', 'Park'),
    (502,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 72, 'Freedom Park', 'UPLB', 'Park'),
    (503,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 72, 'Freedom Park', 'UPLB', 'Park'),
    (504,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'finals', 72,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 73
  */
    (505,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 73, 'Baker Hall', 'UPLB', 'Gym'),
    (506,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 73, 'Copeland Gym','UPLB', 'Gym'),
    (507,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 73, 'Physci Building', 'UPLB', 'Building'),
    (508,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 73, 'Freedom Park', 'UPLB', 'Park'),
    (509,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 73, 'Freedom Park', 'UPLB', 'Park'),
    (510,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 73, 'Freedom Park', 'UPLB', 'Park'),
    (511,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'finals', 73,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 74
  */
    (512,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 74, 'Baker Hall', 'UPLB', 'Gym'),
    (513,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 74, 'Copeland Gym','UPLB', 'Gym'),
    (514,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 74, 'Physci Building', 'UPLB', 'Building'),
    (515,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 74, 'Freedom Park', 'UPLB', 'Park'),
    (516,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 74, 'Freedom Park', 'UPLB', 'Park'),
    (517,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 74, 'Freedom Park', 'UPLB', 'Park'),
    (518,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'finals', 74,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 75
  */
    (519,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 75, 'Baker Hall', 'UPLB', 'Gym'),
    (520,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 75, 'Copeland Gym','UPLB', 'Gym'),
    (521,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 75, 'Physci Building', 'UPLB', 'Building'),
    (522,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 75, 'Freedom Park', 'UPLB', 'Park'),
    (523,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 75, 'Freedom Park', 'UPLB', 'Park'),
    (524,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 75, 'Freedom Park', 'UPLB', 'Park'),
    (525,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'finals', 75,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 76
  */
    (526,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 76, 'Baker Hall', 'UPLB', 'Gym'),
    (527,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 76, 'Copeland Gym','UPLB', 'Gym'),
    (528,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 76, 'Physci Building', 'UPLB', 'Building'),
    (529,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 76, 'Freedom Park', 'UPLB', 'Park'),
    (530,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 76, 'Freedom Park', 'UPLB', 'Park'),
    (531,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 76, 'Freedom Park', 'UPLB', 'Park'),
    (532,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'finals', 76,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 77
  */
    (533,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 77, 'Baker Hall', 'UPLB', 'Gym'),
    (534,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 77, 'Copeland Gym','UPLB', 'Gym'),
    (535,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 77, 'Physci Building', 'UPLB', 'Building'),
    (536,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'elimination', 77, 'Freedom Park', 'UPLB', 'Park'),
    (537,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 77, 'Freedom Park', 'UPLB', 'Park'),
    (538,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'semi-finals', 77, 'Freedom Park', 'UPLB', 'Park'),
    (539,true, SUBDATE(NOW(), INTERVAL 5 DAY), 'finals', 77,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 12*/
  /*
    Matches of sport_id 78
  */
    (540,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 78, 'Baker Hall', 'UPLB', 'Gym'),
    (541,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 78, 'Copeland Gym','UPLB', 'Gym'),
    (542,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 78, 'Physci Building', 'UPLB', 'Building'),
    (543,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 78, 'Freedom Park', 'UPLB', 'Park'),
    (544,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 78, 'Freedom Park', 'UPLB', 'Park'),
    (545,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 78, 'Freedom Park', 'UPLB', 'Park'),
    (546,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'finals', 78,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 79
  */
    (547,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 79, 'Baker Hall', 'UPLB', 'Gym'),
    (548,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 79, 'Copeland Gym','UPLB', 'Gym'),
    (549,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 79, 'Physci Building', 'UPLB', 'Building'),
    (550,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 79, 'Freedom Park', 'UPLB', 'Park'),
    (551,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 79, 'Freedom Park', 'UPLB', 'Park'),
    (552,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 79, 'Freedom Park', 'UPLB', 'Park'),
    (553,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'finals', 79,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 80
  */
    (554,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 80, 'Baker Hall', 'UPLB', 'Gym'),
    (555,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 80, 'Copeland Gym','UPLB', 'Gym'),
    (556,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 80, 'Physci Building', 'UPLB', 'Building'),
    (557,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 80, 'Freedom Park', 'UPLB', 'Park'),
    (558,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 80, 'Freedom Park', 'UPLB', 'Park'),
    (559,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 80, 'Freedom Park', 'UPLB', 'Park'),
    (560,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'finals', 80,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 81
  */
    (561,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 81, 'Baker Hall', 'UPLB', 'Gym'),
    (562,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 81, 'Copeland Gym','UPLB', 'Gym'),
    (563,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 81, 'Physci Building', 'UPLB', 'Building'),
    (564,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 81, 'Freedom Park', 'UPLB', 'Park'),
    (565,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 81, 'Freedom Park', 'UPLB', 'Park'),
    (566,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 81, 'Freedom Park', 'UPLB', 'Park'),
    (567,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'finals', 81,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 82
  */
    (568,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 82, 'Baker Hall', 'UPLB', 'Gym'),
    (569,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 82, 'Copeland Gym','UPLB', 'Gym'),
    (570,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 82, 'Physci Building', 'UPLB', 'Building'),
    (571,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 82, 'Freedom Park', 'UPLB', 'Park'),
    (572,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 82, 'Freedom Park', 'UPLB', 'Park'),
    (573,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 82, 'Freedom Park', 'UPLB', 'Park'),
    (574,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'finals', 82,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 83
  */
    (575,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 83, 'Baker Hall', 'UPLB', 'Gym'),
    (576,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 83, 'Copeland Gym','UPLB', 'Gym'),
    (577,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 83, 'Physci Building', 'UPLB', 'Building'),
    (578,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 83, 'Freedom Park', 'UPLB', 'Park'),
    (579,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 83, 'Freedom Park', 'UPLB', 'Park'),
    (580,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 83, 'Freedom Park', 'UPLB', 'Park'),
    (581,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'finals', 83,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 84
  */
    (582,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 84, 'Baker Hall', 'UPLB', 'Gym'),
    (583,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 84, 'Copeland Gym','UPLB', 'Gym'),
    (584,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 84, 'Physci Building', 'UPLB', 'Building'),
    (585,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'elimination', 84, 'Freedom Park', 'UPLB', 'Park'),
    (586,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 84, 'Freedom Park', 'UPLB', 'Park'),
    (587,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'semi-finals', 84, 'Freedom Park', 'UPLB', 'Park'),
    (588,true, SUBDATE(NOW(), INTERVAL 4 DAY), 'finals', 84,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 13*/
  /*
    Matches of sport_id 85
  */
    (589,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 85, 'Baker Hall', 'UPLB', 'Gym'),
    (590,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 85, 'Copeland Gym','UPLB', 'Gym'),
    (591,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 85, 'Physci Building', 'UPLB', 'Building'),
    (592,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 85, 'Freedom Park', 'UPLB', 'Park'),
    (593,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 85, 'Freedom Park', 'UPLB', 'Park'),
    (594,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 85, 'Freedom Park', 'UPLB', 'Park'),
    (595,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'finals', 85,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 86
  */
    (596,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 86, 'Baker Hall', 'UPLB', 'Gym'),
    (597,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 86, 'Copeland Gym','UPLB', 'Gym'),
    (598,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 86, 'Physci Building', 'UPLB', 'Building'),
    (599,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 86, 'Freedom Park', 'UPLB', 'Park'),
    (600,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 86, 'Freedom Park', 'UPLB', 'Park'),
    (601,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 86, 'Freedom Park', 'UPLB', 'Park'),
    (602,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'finals', 86,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 87
  */
    (603,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 87, 'Baker Hall', 'UPLB', 'Gym'),
    (604,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 87, 'Copeland Gym','UPLB', 'Gym'),
    (605,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 87, 'Physci Building', 'UPLB', 'Building'),
    (606,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 87, 'Freedom Park', 'UPLB', 'Park'),
    (607,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 87, 'Freedom Park', 'UPLB', 'Park'),
    (608,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 87, 'Freedom Park', 'UPLB', 'Park'),
    (609,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'finals', 87,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 88
  */
    (610,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 88, 'Baker Hall', 'UPLB', 'Gym'),
    (611,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 88, 'Copeland Gym','UPLB', 'Gym'),
    (612,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 88, 'Physci Building', 'UPLB', 'Building'),
    (613,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 88, 'Freedom Park', 'UPLB', 'Park'),
    (614,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 88, 'Freedom Park', 'UPLB', 'Park'),
    (615,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 88, 'Freedom Park', 'UPLB', 'Park'),
    (616,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'finals', 88,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 89
  */
    (617,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 89, 'Baker Hall', 'UPLB', 'Gym'),
    (618,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 89, 'Copeland Gym','UPLB', 'Gym'),
    (619,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 89, 'Physci Building', 'UPLB', 'Building'),
    (620,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 89, 'Freedom Park', 'UPLB', 'Park'),
    (621,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 89, 'Freedom Park', 'UPLB', 'Park'),
    (622,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 89, 'Freedom Park', 'UPLB', 'Park'),
    (623,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'finals', 89,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 90
  */
    (624,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 90, 'Baker Hall', 'UPLB', 'Gym'),
    (625,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 90, 'Copeland Gym','UPLB', 'Gym'),
    (626,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 90, 'Physci Building', 'UPLB', 'Building'),
    (627,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 90, 'Freedom Park', 'UPLB', 'Park'),
    (628,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 90, 'Freedom Park', 'UPLB', 'Park'),
    (629,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 90, 'Freedom Park', 'UPLB', 'Park'),
    (630,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'finals', 90,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 91
  */
    (631,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 91, 'Baker Hall', 'UPLB', 'Gym'),
    (632,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 91, 'Copeland Gym','UPLB', 'Gym'),
    (633,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 91, 'Physci Building', 'UPLB', 'Building'),
    (634,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'elimination', 91, 'Freedom Park', 'UPLB', 'Park'),
    (635,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 91, 'Freedom Park', 'UPLB', 'Park'),
    (636,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'semi-finals', 91, 'Freedom Park', 'UPLB', 'Park'),
    (637,true, SUBDATE(NOW(), INTERVAL 3 DAY), 'finals', 91,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 14*/
  /*
    Matches of sport_id 92
  */
    (638,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 92, 'Baker Hall', 'UPLB', 'Gym'),
    (639,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 92, 'Copeland Gym','UPLB', 'Gym'),
    (640,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 92, 'Physci Building', 'UPLB', 'Building'),
    (641,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 92, 'Freedom Park', 'UPLB', 'Park'),
    (642,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 92, 'Freedom Park', 'UPLB', 'Park'),
    (643,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 92, 'Freedom Park', 'UPLB', 'Park'),
    (644,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'finals', 92,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 93
  */
    (645,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 93, 'Baker Hall', 'UPLB', 'Gym'),
    (646,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 93, 'Copeland Gym','UPLB', 'Gym'),
    (647,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 93, 'Physci Building', 'UPLB', 'Building'),
    (648,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 93, 'Freedom Park', 'UPLB', 'Park'),
    (649,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 93, 'Freedom Park', 'UPLB', 'Park'),
    (650,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 93, 'Freedom Park', 'UPLB', 'Park'),
    (651,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'finals', 93,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 94
  */
    (652,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 94, 'Baker Hall', 'UPLB', 'Gym'),
    (653,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 94, 'Copeland Gym','UPLB', 'Gym'),
    (654,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 94, 'Physci Building', 'UPLB', 'Building'),
    (655,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 94, 'Freedom Park', 'UPLB', 'Park'),
    (656,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 94, 'Freedom Park', 'UPLB', 'Park'),
    (657,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 94, 'Freedom Park', 'UPLB', 'Park'),
    (658,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'finals', 94,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 95
  */
    (659,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 95, 'Baker Hall', 'UPLB', 'Gym'),
    (660,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 95, 'Copeland Gym','UPLB', 'Gym'),
    (661,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 95, 'Physci Building', 'UPLB', 'Building'),
    (662,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 95, 'Freedom Park', 'UPLB', 'Park'),
    (663,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 95, 'Freedom Park', 'UPLB', 'Park'),
    (664,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 95, 'Freedom Park', 'UPLB', 'Park'),
    (665,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'finals', 95,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 96
  */
    (666,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 96, 'Baker Hall', 'UPLB', 'Gym'),
    (667,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 96, 'Copeland Gym','UPLB', 'Gym'),
    (668,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 96, 'Physci Building', 'UPLB', 'Building'),
    (669,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 96, 'Freedom Park', 'UPLB', 'Park'),
    (670,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 96, 'Freedom Park', 'UPLB', 'Park'),
    (671,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 96, 'Freedom Park', 'UPLB', 'Park'),
    (672,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'finals', 96,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 97
  */
    (673,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 97, 'Baker Hall', 'UPLB', 'Gym'),
    (674,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 97, 'Copeland Gym','UPLB', 'Gym'),
    (675,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 97, 'Physci Building', 'UPLB', 'Building'),
    (676,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 97, 'Freedom Park', 'UPLB', 'Park'),
    (677,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 97, 'Freedom Park', 'UPLB', 'Park'),
    (678,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 97, 'Freedom Park', 'UPLB', 'Park'),
    (679,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'finals', 97,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 98
  */
    (680,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 98, 'Baker Hall', 'UPLB', 'Gym'),
    (681,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 98, 'Copeland Gym','UPLB', 'Gym'),
    (682,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 98, 'Physci Building', 'UPLB', 'Building'),
    (683,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'elimination', 98, 'Freedom Park', 'UPLB', 'Park'),
    (684,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 98, 'Freedom Park', 'UPLB', 'Park'),
    (685,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'semi-finals', 98, 'Freedom Park', 'UPLB', 'Park'),
    (686,true, SUBDATE(NOW(), INTERVAL 2 DAY), 'finals', 98,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 15*/
  /*
    Matches of sport_id 99
  */
    (687,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 99, 'Baker Hall', 'UPLB', 'Gym'),
    (688,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 99, 'Copeland Gym','UPLB', 'Gym'),
    (689,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 99, 'Physci Building', 'UPLB', 'Building'),
    (690,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 99, 'Freedom Park', 'UPLB', 'Park'),
    (691,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 99, 'Freedom Park', 'UPLB', 'Park'),
    (692,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 99, 'Freedom Park', 'UPLB', 'Park'),
    (693,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'finals', 99,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 100
  */
    (694,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 100, 'Baker Hall', 'UPLB', 'Gym'),
    (695,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 100, 'Copeland Gym','UPLB', 'Gym'),
    (696,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 100, 'Physci Building', 'UPLB', 'Building'),
    (697,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 100, 'Freedom Park', 'UPLB', 'Park'),
    (698,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 100, 'Freedom Park', 'UPLB', 'Park'),
    (699,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 100, 'Freedom Park', 'UPLB', 'Park'),
    (700,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'finals', 100,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 101
  */
    (701,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 101, 'Baker Hall', 'UPLB', 'Gym'),
    (702,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 101, 'Copeland Gym','UPLB', 'Gym'),
    (703,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 101, 'Physci Building', 'UPLB', 'Building'),
    (704,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 101, 'Freedom Park', 'UPLB', 'Park'),
    (705,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 101, 'Freedom Park', 'UPLB', 'Park'),
    (706,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 101, 'Freedom Park', 'UPLB', 'Park'),
    (707,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'finals', 101,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 102
  */
    (708,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 102, 'Baker Hall', 'UPLB', 'Gym'),
    (709,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 102, 'Copeland Gym','UPLB', 'Gym'),
    (710,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 102, 'Physci Building', 'UPLB', 'Building'),
    (711,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 102, 'Freedom Park', 'UPLB', 'Park'),
    (712,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 102, 'Freedom Park', 'UPLB', 'Park'),
    (713,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 102, 'Freedom Park', 'UPLB', 'Park'),
    (714,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'finals', 102,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 103
  */
    (715,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 103, 'Baker Hall', 'UPLB', 'Gym'),
    (716,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 103, 'Copeland Gym','UPLB', 'Gym'),
    (717,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 103, 'Physci Building', 'UPLB', 'Building'),
    (718,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 103, 'Freedom Park', 'UPLB', 'Park'),
    (719,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 103, 'Freedom Park', 'UPLB', 'Park'),
    (720,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 103, 'Freedom Park', 'UPLB', 'Park'),
    (721,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'finals', 103,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 104
  */
    (722,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 104, 'Baker Hall', 'UPLB', 'Gym'),
    (723,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 104, 'Copeland Gym','UPLB', 'Gym'),
    (724,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 104, 'Physci Building', 'UPLB', 'Building'),
    (725,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 104, 'Freedom Park', 'UPLB', 'Park'),
    (726,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 104, 'Freedom Park', 'UPLB', 'Park'),
    (727,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 104, 'Freedom Park', 'UPLB', 'Park'),
    (728,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'finals', 104,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 105
  */
    (729,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 105, 'Baker Hall', 'UPLB', 'Gym'),
    (730,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 105, 'Copeland Gym','UPLB', 'Gym'),
    (731,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 105, 'Physci Building', 'UPLB', 'Building'),
    (732,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'elimination', 105, 'Freedom Park', 'UPLB', 'Park'),
    (733,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 105, 'Freedom Park', 'UPLB', 'Park'),
    (734,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'semi-finals', 105, 'Freedom Park', 'UPLB', 'Park'),
    (735,true, SUBDATE(NOW(), INTERVAL 1 DAY), 'finals', 105,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 16*/
  /*
    Matches of sport_id 106
  */
    (736,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 106, 'Baker Hall', 'UPLB', 'Gym'),
    (737,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 106, 'Copeland Gym','UPLB', 'Gym'),
    (738,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 106, 'Physci Building', 'UPLB', 'Building'),
    (739,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 106, 'Freedom Park', 'UPLB', 'Park'),
    (740,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 106, 'Freedom Park', 'UPLB', 'Park'),
    (741,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 106, 'Freedom Park', 'UPLB', 'Park'),
    (742,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'finals', 106,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 107
  */
    (743,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 107, 'Baker Hall', 'UPLB', 'Gym'),
    (744,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 107, 'Copeland Gym','UPLB', 'Gym'),
    (745,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 107, 'Physci Building', 'UPLB', 'Building'),
    (746,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 107, 'Freedom Park', 'UPLB', 'Park'),
    (747,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 107, 'Freedom Park', 'UPLB', 'Park'),
    (748,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 107, 'Freedom Park', 'UPLB', 'Park'),
    (749,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'finals', 107,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 108
  */
    (750,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 108, 'Baker Hall', 'UPLB', 'Gym'),
    (751,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 108, 'Copeland Gym','UPLB', 'Gym'),
    (752,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 108, 'Physci Building', 'UPLB', 'Building'),
    (753,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 108, 'Freedom Park', 'UPLB', 'Park'),
    (754,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 108, 'Freedom Park', 'UPLB', 'Park'),
    (755,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 108, 'Freedom Park', 'UPLB', 'Park'),
    (756,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'finals', 108,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 109
  */
    (757,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 109, 'Baker Hall', 'UPLB', 'Gym'),
    (758,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 109, 'Copeland Gym','UPLB', 'Gym'),
    (759,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 109, 'Physci Building', 'UPLB', 'Building'),
    (760,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 109, 'Freedom Park', 'UPLB', 'Park'),
    (761,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 109, 'Freedom Park', 'UPLB', 'Park'),
    (762,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 109, 'Freedom Park', 'UPLB', 'Park'),
    (763,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'finals', 109,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 110
  */
    (764,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 110, 'Baker Hall', 'UPLB', 'Gym'),
    (765,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 110, 'Copeland Gym','UPLB', 'Gym'),
    (766,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 110, 'Physci Building', 'UPLB', 'Building'),
    (767,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 110, 'Freedom Park', 'UPLB', 'Park'),
    (768,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 110, 'Freedom Park', 'UPLB', 'Park'),
    (769,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 110, 'Freedom Park', 'UPLB', 'Park'),
    (770,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'finals', 110,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 111
  */
    (771,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 111, 'Baker Hall', 'UPLB', 'Gym'),
    (772,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 111, 'Copeland Gym','UPLB', 'Gym'),
    (773,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 111, 'Physci Building', 'UPLB', 'Building'),
    (774,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 111, 'Freedom Park', 'UPLB', 'Park'),
    (775,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 111, 'Freedom Park', 'UPLB', 'Park'),
    (776,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 111, 'Freedom Park', 'UPLB', 'Park'),
    (777,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'finals', 111,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 112
  */
    (778,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 112, 'Baker Hall', 'UPLB', 'Gym'),
    (779,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 112, 'Copeland Gym','UPLB', 'Gym'),
    (780,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 112, 'Physci Building', 'UPLB', 'Building'),
    (781,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'elimination', 112, 'Freedom Park', 'UPLB', 'Park'),
    (782,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 112, 'Freedom Park', 'UPLB', 'Park'),
    (783,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'semi-finals', 112, 'Freedom Park', 'UPLB', 'Park'),
    (784,true, SUBDATE(NOW(), INTERVAL 0 DAY), 'finals', 112,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 17*/
  /*
    Matches of sport_id 113
  */
    (785,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 113, 'Baker Hall', 'UPLB', 'Gym'),
    (786,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 113, 'Copeland Gym','UPLB', 'Gym'),
    (787,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 113, 'Physci Building', 'UPLB', 'Building'),
    (788,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 113, 'Freedom Park', 'UPLB', 'Park'),
    (789,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 113, 'Freedom Park', 'UPLB', 'Park'),
    (790,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 113, 'Freedom Park', 'UPLB', 'Park'),
    (791,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'finals', 113,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 114
  */
    (792,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 114, 'Baker Hall', 'UPLB', 'Gym'),
    (793,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 114, 'Copeland Gym','UPLB', 'Gym'),
    (794,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 114, 'Physci Building', 'UPLB', 'Building'),
    (795,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 114, 'Freedom Park', 'UPLB', 'Park'),
    (796,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 114, 'Freedom Park', 'UPLB', 'Park'),
    (797,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 114, 'Freedom Park', 'UPLB', 'Park'),
    (798,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'finals', 114,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 115
  */
    (799,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 115, 'Baker Hall', 'UPLB', 'Gym'),
    (800,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 115, 'Copeland Gym','UPLB', 'Gym'),
    (801,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 115, 'Physci Building', 'UPLB', 'Building'),
    (802,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 115, 'Freedom Park', 'UPLB', 'Park'),
    (803,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 115, 'Freedom Park', 'UPLB', 'Park'),
    (804,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 115, 'Freedom Park', 'UPLB', 'Park'),
    (805,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'finals', 115,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 116
  */
    (806,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 116, 'Baker Hall', 'UPLB', 'Gym'),
    (807,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 116, 'Copeland Gym','UPLB', 'Gym'),
    (808,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 116, 'Physci Building', 'UPLB', 'Building'),
    (809,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 116, 'Freedom Park', 'UPLB', 'Park'),
    (810,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 116, 'Freedom Park', 'UPLB', 'Park'),
    (811,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 116, 'Freedom Park', 'UPLB', 'Park'),
    (812,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'finals', 116,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 117
  */
    (813,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 117, 'Baker Hall', 'UPLB', 'Gym'),
    (814,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 117, 'Copeland Gym','UPLB', 'Gym'),
    (815,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 117, 'Physci Building', 'UPLB', 'Building'),
    (816,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 117, 'Freedom Park', 'UPLB', 'Park'),
    (817,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 117, 'Freedom Park', 'UPLB', 'Park'),
    (818,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 117, 'Freedom Park', 'UPLB', 'Park'),
    (819,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'finals', 117,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 118
  */
    (820,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 118, 'Baker Hall', 'UPLB', 'Gym'),
    (821,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 118, 'Copeland Gym','UPLB', 'Gym'),
    (822,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 118, 'Physci Building', 'UPLB', 'Building'),
    (823,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 118, 'Freedom Park', 'UPLB', 'Park'),
    (824,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 118, 'Freedom Park', 'UPLB', 'Park'),
    (825,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 118, 'Freedom Park', 'UPLB', 'Park'),
    (826,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'finals', 118,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 119
  */
    (827,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 119, 'Baker Hall', 'UPLB', 'Gym'),
    (828,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 119, 'Copeland Gym','UPLB', 'Gym'),
    (829,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 119, 'Physci Building', 'UPLB', 'Building'),
    (830,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'elimination', 119, 'Freedom Park', 'UPLB', 'Park'),
    (831,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 119, 'Freedom Park', 'UPLB', 'Park'),
    (832,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'semi-finals', 119, 'Freedom Park', 'UPLB', 'Park'),
    (833,true, ADDDATE(NOW(), INTERVAL 2 WEEK), 'finals', 119,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 18*/
  /*
    Matches of sport_id 120
  */
    (834,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 120, 'Baker Hall', 'UPLB', 'Gym'),
    (835,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 120, 'Copeland Gym','UPLB', 'Gym'),
    (836,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 120, 'Physci Building', 'UPLB', 'Building'),
    (837,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 120, 'Freedom Park', 'UPLB', 'Park'),
    (838,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 120, 'Freedom Park', 'UPLB', 'Park'),
    (839,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 120, 'Freedom Park', 'UPLB', 'Park'),
    (840,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'finals', 120,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 121
  */
    (841,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 121, 'Baker Hall', 'UPLB', 'Gym'),
    (842,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 121, 'Copeland Gym','UPLB', 'Gym'),
    (843,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 121, 'Physci Building', 'UPLB', 'Building'),
    (844,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 121, 'Freedom Park', 'UPLB', 'Park'),
    (845,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 121, 'Freedom Park', 'UPLB', 'Park'),
    (846,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 121, 'Freedom Park', 'UPLB', 'Park'),
    (847,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'finals', 121,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 122
  */
    (848,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 122, 'Baker Hall', 'UPLB', 'Gym'),
    (849,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 122, 'Copeland Gym','UPLB', 'Gym'),
    (850,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 122, 'Physci Building', 'UPLB', 'Building'),
    (851,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 122, 'Freedom Park', 'UPLB', 'Park'),
    (852,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 122, 'Freedom Park', 'UPLB', 'Park'),
    (853,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 122, 'Freedom Park', 'UPLB', 'Park'),
    (854,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'finals', 122,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 123
  */
    (855,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 123, 'Baker Hall', 'UPLB', 'Gym'),
    (856,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 123, 'Copeland Gym','UPLB', 'Gym'),
    (857,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 123, 'Physci Building', 'UPLB', 'Building'),
    (858,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 123, 'Freedom Park', 'UPLB', 'Park'),
    (859,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 123, 'Freedom Park', 'UPLB', 'Park'),
    (860,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 123, 'Freedom Park', 'UPLB', 'Park'),
    (861,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'finals', 123,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 124
  */
    (862,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 124, 'Baker Hall', 'UPLB', 'Gym'),
    (863,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 124, 'Copeland Gym','UPLB', 'Gym'),
    (864,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 124, 'Physci Building', 'UPLB', 'Building'),
    (865,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 124, 'Freedom Park', 'UPLB', 'Park'),
    (866,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 124, 'Freedom Park', 'UPLB', 'Park'),
    (867,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 124, 'Freedom Park', 'UPLB', 'Park'),
    (868,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'finals', 124,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 125
  */
    (869,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 125, 'Baker Hall', 'UPLB', 'Gym'),
    (870,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 125, 'Copeland Gym','UPLB', 'Gym'),
    (871,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 125, 'Physci Building', 'UPLB', 'Building'),
    (872,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 125, 'Freedom Park', 'UPLB', 'Park'),
    (873,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 125, 'Freedom Park', 'UPLB', 'Park'),
    (874,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 125, 'Freedom Park', 'UPLB', 'Park'),
    (875,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'finals', 125,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 126
  */
    (876,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 126, 'Baker Hall', 'UPLB', 'Gym'),
    (877,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 126, 'Copeland Gym','UPLB', 'Gym'),
    (878,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 126, 'Physci Building', 'UPLB', 'Building'),
    (879,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'elimination', 126, 'Freedom Park', 'UPLB', 'Park'),
    (880,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 126, 'Freedom Park', 'UPLB', 'Park'),
    (881,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'semi-finals', 126, 'Freedom Park', 'UPLB', 'Park'),
    (882,true, ADDDATE(NOW(), INTERVAL 3 WEEK), 'finals', 126,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 19*/
  /*
    Matches of sport_id 127
  */
    (883,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 127, 'Baker Hall', 'UPLB', 'Gym'),
    (884,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 127, 'Copeland Gym','UPLB', 'Gym'),
    (885,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 127, 'Physci Building', 'UPLB', 'Building'),
    (886,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 127, 'Freedom Park', 'UPLB', 'Park'),
    (887,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 127, 'Freedom Park', 'UPLB', 'Park'),
    (888,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 127, 'Freedom Park', 'UPLB', 'Park'),
    (889,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'finals', 127,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 128
  */
    (890,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 128, 'Baker Hall', 'UPLB', 'Gym'),
    (891,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 128, 'Copeland Gym','UPLB', 'Gym'),
    (892,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 128, 'Physci Building', 'UPLB', 'Building'),
    (893,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 128, 'Freedom Park', 'UPLB', 'Park'),
    (894,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 128, 'Freedom Park', 'UPLB', 'Park'),
    (895,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 128, 'Freedom Park', 'UPLB', 'Park'),
    (896,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'finals', 128,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 129
  */
    (897,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 129, 'Baker Hall', 'UPLB', 'Gym'),
    (898,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 129, 'Copeland Gym','UPLB', 'Gym'),
    (899,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 129, 'Physci Building', 'UPLB', 'Building'),
    (900,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 129, 'Freedom Park', 'UPLB', 'Park'),
    (901,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 129, 'Freedom Park', 'UPLB', 'Park'),
    (902,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 129, 'Freedom Park', 'UPLB', 'Park'),
    (903,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'finals', 129,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 130
  */
    (904,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 130, 'Baker Hall', 'UPLB', 'Gym'),
    (905,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 130, 'Copeland Gym','UPLB', 'Gym'),
    (906,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 130, 'Physci Building', 'UPLB', 'Building'),
    (907,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 130, 'Freedom Park', 'UPLB', 'Park'),
    (908,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 130, 'Freedom Park', 'UPLB', 'Park'),
    (909,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 130, 'Freedom Park', 'UPLB', 'Park'),
    (910,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'finals', 130,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 131
  */
    (911,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 131, 'Baker Hall', 'UPLB', 'Gym'),
    (912,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 131, 'Copeland Gym','UPLB', 'Gym'),
    (913,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 131, 'Physci Building', 'UPLB', 'Building'),
    (914,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 131, 'Freedom Park', 'UPLB', 'Park'),
    (915,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 131, 'Freedom Park', 'UPLB', 'Park'),
    (916,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 131, 'Freedom Park', 'UPLB', 'Park'),
    (917,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'finals', 131,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 132
  */
    (918,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 132, 'Baker Hall', 'UPLB', 'Gym'),
    (919,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 132, 'Copeland Gym','UPLB', 'Gym'),
    (920,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 132, 'Physci Building', 'UPLB', 'Building'),
    (921,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 132, 'Freedom Park', 'UPLB', 'Park'),
    (922,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 132, 'Freedom Park', 'UPLB', 'Park'),
    (923,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 132, 'Freedom Park', 'UPLB', 'Park'),
    (924,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'finals', 132,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 133
  */
    (925,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 133, 'Baker Hall', 'UPLB', 'Gym'),
    (926,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 133, 'Copeland Gym','UPLB', 'Gym'),
    (927,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 133, 'Physci Building', 'UPLB', 'Building'),
    (928,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'elimination', 133, 'Freedom Park', 'UPLB', 'Park'),
    (929,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 133, 'Freedom Park', 'UPLB', 'Park'),
    (930,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'semi-finals', 133, 'Freedom Park', 'UPLB', 'Park'),
    (931,true, ADDDATE(NOW(), INTERVAL 4 WEEK), 'finals', 133,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 20*/
  /*
    Matches of sport_id 134
  */
    (932,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 134, 'Baker Hall', 'UPLB', 'Gym'),
    (933,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 134, 'Copeland Gym','UPLB', 'Gym'),
    (934,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 134, 'Physci Building', 'UPLB', 'Building'),
    (935,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 134, 'Freedom Park', 'UPLB', 'Park'),
    (936,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 134, 'Freedom Park', 'UPLB', 'Park'),
    (937,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 134, 'Freedom Park', 'UPLB', 'Park'),
    (938,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'finals', 134,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 135
  */
    (939,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 135, 'Baker Hall', 'UPLB', 'Gym'),
    (940,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 135, 'Copeland Gym','UPLB', 'Gym'),
    (941,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 135, 'Physci Building', 'UPLB', 'Building'),
    (942,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 135, 'Freedom Park', 'UPLB', 'Park'),
    (943,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 135, 'Freedom Park', 'UPLB', 'Park'),
    (944,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 135, 'Freedom Park', 'UPLB', 'Park'),
    (945,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'finals', 135,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 136
  */
    (946,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 136, 'Baker Hall', 'UPLB', 'Gym'),
    (947,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 136, 'Copeland Gym','UPLB', 'Gym'),
    (948,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 136, 'Physci Building', 'UPLB', 'Building'),
    (949,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 136, 'Freedom Park', 'UPLB', 'Park'),
    (950,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 136, 'Freedom Park', 'UPLB', 'Park'),
    (951,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 136, 'Freedom Park', 'UPLB', 'Park'),
    (952,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'finals', 136,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 137
  */
    (953,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 137, 'Baker Hall', 'UPLB', 'Gym'),
    (954,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 137, 'Copeland Gym','UPLB', 'Gym'),
    (955,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 137, 'Physci Building', 'UPLB', 'Building'),
    (956,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 137, 'Freedom Park', 'UPLB', 'Park'),
    (957,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 137, 'Freedom Park', 'UPLB', 'Park'),
    (958,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 137, 'Freedom Park', 'UPLB', 'Park'),
    (959,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'finals', 137,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 138
  */
    (960,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 138, 'Baker Hall', 'UPLB', 'Gym'),
    (961,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 138, 'Copeland Gym','UPLB', 'Gym'),
    (962,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 138, 'Physci Building', 'UPLB', 'Building'),
    (963,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 138, 'Freedom Park', 'UPLB', 'Park'),
    (964,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 138, 'Freedom Park', 'UPLB', 'Park'),
    (965,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 138, 'Freedom Park', 'UPLB', 'Park'),
    (966,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'finals', 138,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 139
  */
    (967,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 139, 'Baker Hall', 'UPLB', 'Gym'),
    (968,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 139, 'Copeland Gym','UPLB', 'Gym'),
    (969,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 139, 'Physci Building', 'UPLB', 'Building'),
    (970,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 139, 'Freedom Park', 'UPLB', 'Park'),
    (971,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 139, 'Freedom Park', 'UPLB', 'Park'),
    (972,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 139, 'Freedom Park', 'UPLB', 'Park'),
    (973,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'finals', 139,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 140
  */
    (974,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 140, 'Baker Hall', 'UPLB', 'Gym'),
    (975,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 140, 'Copeland Gym','UPLB', 'Gym'),
    (976,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 140, 'Physci Building', 'UPLB', 'Building'),
    (977,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'elimination', 140, 'Freedom Park', 'UPLB', 'Park'),
    (978,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 140, 'Freedom Park', 'UPLB', 'Park'),
    (979,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'semi-finals', 140, 'Freedom Park', 'UPLB', 'Park'),
    (980,true, ADDDATE(NOW(), INTERVAL 5 WEEK), 'finals', 140,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 21*/
  /*
    Matches of sport_id 141
  */
    (981,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 141, 'Baker Hall', 'UPLB', 'Gym'),
    (982,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 141, 'Copeland Gym','UPLB', 'Gym'),
    (983,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 141, 'Physci Building', 'UPLB', 'Building'),
    (984,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 141, 'Freedom Park', 'UPLB', 'Park'),
    (985,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 141, 'Freedom Park', 'UPLB', 'Park'),
    (986,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 141, 'Freedom Park', 'UPLB', 'Park'),
    (987,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'finals', 141,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 142
  */
    (988,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 142, 'Baker Hall', 'UPLB', 'Gym'),
    (989,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 142, 'Copeland Gym','UPLB', 'Gym'),
    (990,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 142, 'Physci Building', 'UPLB', 'Building'),
    (991,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 142, 'Freedom Park', 'UPLB', 'Park'),
    (992,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 142, 'Freedom Park', 'UPLB', 'Park'),
    (993,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 142, 'Freedom Park', 'UPLB', 'Park'),
    (994,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'finals', 142,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 143
  */
    (995,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 143, 'Baker Hall', 'UPLB', 'Gym'),
    (996,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 143, 'Copeland Gym','UPLB', 'Gym'),
    (997,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 143, 'Physci Building', 'UPLB', 'Building'),
    (998,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 143, 'Freedom Park', 'UPLB', 'Park'),
    (999,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 143, 'Freedom Park', 'UPLB', 'Park'),
    (1000,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 143, 'Freedom Park', 'UPLB', 'Park'),
    (1001,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'finals', 143,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 144
  */
    (1002,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 144, 'Baker Hall', 'UPLB', 'Gym'),
    (1003,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 144, 'Copeland Gym','UPLB', 'Gym'),
    (1004,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 144, 'Physci Building', 'UPLB', 'Building'),
    (1005,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 144, 'Freedom Park', 'UPLB', 'Park'),
    (1006,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 144, 'Freedom Park', 'UPLB', 'Park'),
    (1007,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 144, 'Freedom Park', 'UPLB', 'Park'),
    (1008,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'finals', 144,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 145
  */
    (1009,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 145, 'Baker Hall', 'UPLB', 'Gym'),
    (1010,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 145, 'Copeland Gym','UPLB', 'Gym'),
    (1011,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 145, 'Physci Building', 'UPLB', 'Building'),
    (1012,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 145, 'Freedom Park', 'UPLB', 'Park'),
    (1013,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 145, 'Freedom Park', 'UPLB', 'Park'),
    (1014,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 145, 'Freedom Park', 'UPLB', 'Park'),
    (1015,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'finals', 145,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 146
  */
    (1016,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 146, 'Baker Hall', 'UPLB', 'Gym'),
    (1017,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 146, 'Copeland Gym','UPLB', 'Gym'),
    (1018,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 146, 'Physci Building', 'UPLB', 'Building'),
    (1019,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 146, 'Freedom Park', 'UPLB', 'Park'),
    (1020,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 146, 'Freedom Park', 'UPLB', 'Park'),
    (1021,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 146, 'Freedom Park', 'UPLB', 'Park'),
    (1022,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'finals', 146,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 147
  */
    (1023,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 147, 'Baker Hall', 'UPLB', 'Gym'),
    (1024,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 147, 'Copeland Gym','UPLB', 'Gym'),
    (1025,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 147, 'Physci Building', 'UPLB', 'Building'),
    (1026,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'elimination', 147, 'Freedom Park', 'UPLB', 'Park'),
    (1027,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 147, 'Freedom Park', 'UPLB', 'Park'),
    (1028,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'semi-finals', 147, 'Freedom Park', 'UPLB', 'Park'),
    (1029,true, ADDDATE(NOW(), INTERVAL 6 WEEK), 'finals', 147,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 22*/
  /*
    Matches of sport_id 148
  */
    (1030,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 148, 'Baker Hall', 'UPLB', 'Gym'),
    (1031,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 148, 'Copeland Gym','UPLB', 'Gym'),
    (1032,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 148, 'Physci Building', 'UPLB', 'Building'),
    (1033,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 148, 'Freedom Park', 'UPLB', 'Park'),
    (1034,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 148, 'Freedom Park', 'UPLB', 'Park'),
    (1035,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 148, 'Freedom Park', 'UPLB', 'Park'),
    (1036,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'finals', 148,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 149
  */
    (1037,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 149, 'Baker Hall', 'UPLB', 'Gym'),
    (1038,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 149, 'Copeland Gym','UPLB', 'Gym'),
    (1039,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 149, 'Physci Building', 'UPLB', 'Building'),
    (1040,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 149, 'Freedom Park', 'UPLB', 'Park'),
    (1041,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 149, 'Freedom Park', 'UPLB', 'Park'),
    (1042,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 149, 'Freedom Park', 'UPLB', 'Park'),
    (1043,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'finals', 149,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 150
  */
    (1044,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 150, 'Baker Hall', 'UPLB', 'Gym'),
    (1045,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 150, 'Copeland Gym','UPLB', 'Gym'),
    (1046,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 150, 'Physci Building', 'UPLB', 'Building'),
    (1047,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 150, 'Freedom Park', 'UPLB', 'Park'),
    (1048,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 150, 'Freedom Park', 'UPLB', 'Park'),
    (1049,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 150, 'Freedom Park', 'UPLB', 'Park'),
    (1050,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'finals', 150,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 151
  */
    (1051,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 151, 'Baker Hall', 'UPLB', 'Gym'),
    (1052,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 151, 'Copeland Gym','UPLB', 'Gym'),
    (1053,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 151, 'Physci Building', 'UPLB', 'Building'),
    (1054,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 151, 'Freedom Park', 'UPLB', 'Park'),
    (1055,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 151, 'Freedom Park', 'UPLB', 'Park'),
    (1056,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 151, 'Freedom Park', 'UPLB', 'Park'),
    (1057,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'finals', 151,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 152
  */
    (1058,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 152, 'Baker Hall', 'UPLB', 'Gym'),
    (1059,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 152, 'Copeland Gym','UPLB', 'Gym'),
    (1060,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 152, 'Physci Building', 'UPLB', 'Building'),
    (1061,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 152, 'Freedom Park', 'UPLB', 'Park'),
    (1062,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 152, 'Freedom Park', 'UPLB', 'Park'),
    (1063,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 152, 'Freedom Park', 'UPLB', 'Park'),
    (1064,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'finals', 152,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 153
  */
    (1065,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 153, 'Baker Hall', 'UPLB', 'Gym'),
    (1066,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 153, 'Copeland Gym','UPLB', 'Gym'),
    (1067,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 153, 'Physci Building', 'UPLB', 'Building'),
    (1068,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 153, 'Freedom Park', 'UPLB', 'Park'),
    (1069,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 153, 'Freedom Park', 'UPLB', 'Park'),
    (1070,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 153, 'Freedom Park', 'UPLB', 'Park'),
    (1071,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'finals', 153,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 154
  */
    (1072,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 154, 'Baker Hall', 'UPLB', 'Gym'),
    (1073,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 154, 'Copeland Gym','UPLB', 'Gym'),
    (1074,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 154, 'Physci Building', 'UPLB', 'Building'),
    (1075,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'elimination', 154, 'Freedom Park', 'UPLB', 'Park'),
    (1076,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 154, 'Freedom Park', 'UPLB', 'Park'),
    (1077,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'semi-finals', 154, 'Freedom Park', 'UPLB', 'Park'),
    (1078,true, ADDDATE(NOW(), INTERVAL 7 WEEK), 'finals', 154,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 23*/
  /*
    Matches of sport_id 155
  */
    (1079,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 155, 'Baker Hall', 'UPLB', 'Gym'),
    (1080,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 155, 'Copeland Gym','UPLB', 'Gym'),
    (1081,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 155, 'Physci Building', 'UPLB', 'Building'),
    (1082,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 155, 'Freedom Park', 'UPLB', 'Park'),
    (1083,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 155, 'Freedom Park', 'UPLB', 'Park'),
    (1084,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 155, 'Freedom Park', 'UPLB', 'Park'),
    (1085,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'finals', 155,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 156
  */
    (1086,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 156, 'Baker Hall', 'UPLB', 'Gym'),
    (1087,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 156, 'Copeland Gym','UPLB', 'Gym'),
    (1088,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 156, 'Physci Building', 'UPLB', 'Building'),
    (1089,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 156, 'Freedom Park', 'UPLB', 'Park'),
    (1090,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 156, 'Freedom Park', 'UPLB', 'Park'),
    (1091,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 156, 'Freedom Park', 'UPLB', 'Park'),
    (1092,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'finals', 156,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 157
  */
    (1093,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 157, 'Baker Hall', 'UPLB', 'Gym'),
    (1094,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 157, 'Copeland Gym','UPLB', 'Gym'),
    (1095,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 157, 'Physci Building', 'UPLB', 'Building'),
    (1096,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 157, 'Freedom Park', 'UPLB', 'Park'),
    (1097,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 157, 'Freedom Park', 'UPLB', 'Park'),
    (1098,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 157, 'Freedom Park', 'UPLB', 'Park'),
    (1099,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'finals', 157,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 158
  */
    (1100,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 158, 'Baker Hall', 'UPLB', 'Gym'),
    (1101,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 158, 'Copeland Gym','UPLB', 'Gym'),
    (1102,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 158, 'Physci Building', 'UPLB', 'Building'),
    (1103,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 158, 'Freedom Park', 'UPLB', 'Park'),
    (1104,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 158, 'Freedom Park', 'UPLB', 'Park'),
    (1105,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 158, 'Freedom Park', 'UPLB', 'Park'),
    (1106,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'finals', 158,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 159
  */
    (1107,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 159, 'Baker Hall', 'UPLB', 'Gym'),
    (1108,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 159, 'Copeland Gym','UPLB', 'Gym'),
    (1109,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 159, 'Physci Building', 'UPLB', 'Building'),
    (1110,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 159, 'Freedom Park', 'UPLB', 'Park'),
    (1111,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 159, 'Freedom Park', 'UPLB', 'Park'),
    (1112,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 159, 'Freedom Park', 'UPLB', 'Park'),
    (1113,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'finals', 159,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 160
  */
    (1114,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 160, 'Baker Hall', 'UPLB', 'Gym'),
    (1115,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 160, 'Copeland Gym','UPLB', 'Gym'),
    (1116,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 160, 'Physci Building', 'UPLB', 'Building'),
    (1117,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 160, 'Freedom Park', 'UPLB', 'Park'),
    (1118,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 160, 'Freedom Park', 'UPLB', 'Park'),
    (1119,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 160, 'Freedom Park', 'UPLB', 'Park'),
    (1120,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'finals', 160,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 161
  */
    (1121,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 161, 'Baker Hall', 'UPLB', 'Gym'),
    (1122,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 161, 'Copeland Gym','UPLB', 'Gym'),
    (1123,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 161, 'Physci Building', 'UPLB', 'Building'),
    (1124,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'elimination', 161, 'Freedom Park', 'UPLB', 'Park'),
    (1125,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 161, 'Freedom Park', 'UPLB', 'Park'),
    (1126,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'semi-finals', 161, 'Freedom Park', 'UPLB', 'Park'),
    (1127,true, ADDDATE(NOW(), INTERVAL 8 WEEK), 'finals', 161,'Freedom Park', 'UPLB', 'Park'),
/*Matches of Game 24*/
  /*
    Matches of sport_id 162
  */
    (1128,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 162, 'Baker Hall', 'UPLB', 'Gym'),
    (1129,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 162, 'Copeland Gym','UPLB', 'Gym'),
    (1130,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 162, 'Physci Building', 'UPLB', 'Building'),
    (1131,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 162, 'Freedom Park', 'UPLB', 'Park'),
    (1132,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 162, 'Freedom Park', 'UPLB', 'Park'),
    (1133,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 162, 'Freedom Park', 'UPLB', 'Park'),
    (1134,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'finals', 162,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 163
  */
    (1135,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 163, 'Baker Hall', 'UPLB', 'Gym'),
    (1136,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 163, 'Copeland Gym','UPLB', 'Gym'),
    (1137,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 163, 'Physci Building', 'UPLB', 'Building'),
    (1138,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 163, 'Freedom Park', 'UPLB', 'Park'),
    (1139,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 163, 'Freedom Park', 'UPLB', 'Park'),
    (1140,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 163, 'Freedom Park', 'UPLB', 'Park'),
    (1141,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'finals', 163,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 164
  */
    (1142,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 164, 'Baker Hall', 'UPLB', 'Gym'),
    (1143,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 164, 'Copeland Gym','UPLB', 'Gym'),
    (1144,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 164, 'Physci Building', 'UPLB', 'Building'),
    (1145,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 164, 'Freedom Park', 'UPLB', 'Park'),
    (1146,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 164, 'Freedom Park', 'UPLB', 'Park'),
    (1147,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 164, 'Freedom Park', 'UPLB', 'Park'),
    (1148,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'finals', 164,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 165
  */
    (1149,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 165, 'Baker Hall', 'UPLB', 'Gym'),
    (1150,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 165, 'Copeland Gym','UPLB', 'Gym'),
    (1151,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 165, 'Physci Building', 'UPLB', 'Building'),
    (1152,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 165, 'Freedom Park', 'UPLB', 'Park'),
    (1153,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 165, 'Freedom Park', 'UPLB', 'Park'),
    (1154,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 165, 'Freedom Park', 'UPLB', 'Park'),
    (1155,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'finals', 165,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 166
  */
    (1156,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 166, 'Baker Hall', 'UPLB', 'Gym'),
    (1157,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 166, 'Copeland Gym','UPLB', 'Gym'),
    (1158,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 166, 'Physci Building', 'UPLB', 'Building'),
    (1159,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 166, 'Freedom Park', 'UPLB', 'Park'),
    (1160,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 166, 'Freedom Park', 'UPLB', 'Park'),
    (1161,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 166, 'Freedom Park', 'UPLB', 'Park'),
    (1162,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'finals', 166,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 167
  */
    (1163,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 167, 'Baker Hall', 'UPLB', 'Gym'),
    (1164,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 167, 'Copeland Gym','UPLB', 'Gym'),
    (1165,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 167, 'Physci Building', 'UPLB', 'Building'),
    (1166,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 167, 'Freedom Park', 'UPLB', 'Park'),
    (1167,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 167, 'Freedom Park', 'UPLB', 'Park'),
    (1168,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 167, 'Freedom Park', 'UPLB', 'Park'),
    (1169,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'finals', 167,'Freedom Park', 'UPLB', 'Park'),
  /*
    Matches of sport_id 168
  */
    (1170,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 168, 'Baker Hall', 'UPLB', 'Gym'),
    (1171,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 168, 'Copeland Gym','UPLB', 'Gym'),
    (1172,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 168, 'Physci Building', 'UPLB', 'Building'),
    (1173,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'elimination', 168, 'Freedom Park', 'UPLB', 'Park'),
    (1174,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 168, 'Freedom Park', 'UPLB', 'Park'),
    (1175,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'semi-finals', 168, 'Freedom Park', 'UPLB', 'Park'),
    (1176,true, ADDDATE(NOW(), INTERVAL 9 WEEK), 'finals', 168,'Freedom Park', 'UPLB', 'Park');



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
    'Carl',                                         /*firstname*/
    'Recto',                                        /*middlename*/
    'Janoras',                                      /*lastname*/
    'playerJuan@gmail.com',                         /*email*/
    'playerJuan',                                   /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    '1997-07-29',                                   /*birthday*/
    'CAS',                                          /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '04',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Carlo Anthony',                                /*firstname*/
    '',                                             /*middlename*/
    'Serrano',                                      /*lastname*/
    'playerTuu@gmail.com',                          /*email*/
    'playerTuu',                                    /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                          /*birthday*/
    'CAS',                                          /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '05',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Shirlene',                                     /*firstname*/
    '',                                             /*middlename*/
    'Garcia',                                       /*lastname*/
    'playerTri@gmail.com',                        /*email*/
    'playerTri',                                  /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                          /*birthday*/
    'CAS',                                          /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '06',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Justine Paul',                                 /*firstname*/
    '',                                             /*middlename*/
    'Guaio',                                        /*lastname*/
    'playerPor@gmail.com',                          /*email*/
    'playerPor',                                    /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                          /*birthday*/
    'CAS',                                          /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '07',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Pearl Antonette',                              /*firstname*/
    '',                                             /*middlename*/
    'Pamfilo',                                      /*lastname*/
    'playerPayb@gmail.com',                         /*email*/
    'playerPayb',                                   /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                          /*birthday*/
    'CAS',                                          /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '08',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL approve_account(LAST_INSERT_ID());
  CALL add_account(
    'Honey Grace',                                  /*firstname*/
    '',                                             /*middlename*/
    'Garay',                                        /*lastname*/
    'hgaray@gmail.com',                             /*email*/
    'hgaray',                                       /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                          /*birthday*/
    'CAS',                                          /*college*/
    false,                                          /*is_game_head*/
    NULL,                                           /*position*/
    true,                                           /*is_player*/
    '09',                                           /*player_jersey_num*/
    'Member'                                        /*player_role*/
  );
  CALL add_account(
    'Kendrick Timothy',                             /*firstname*/
    '',                                             /*middlename*/
    'Mercado',                                      /*lastname*/
    'kmercado@gmail.com',                           /*email*/
    'kmercado',                                     /*username*/
    '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=', /*password*/
    'BSCS',                                         /*course*/
    NOW(),                                          /*birthday*/
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
/*Matches of Game 1*/
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
    (1, 8, 25),
    (2, 8, 3),
    (3, 9, 25),
    (4, 9, 5),
    (5, 10, 25),
    (6, 10, 1),
    (7, 11, 25),
    (8, 11, 3),
  /*semis for sport with sport_id 2*/
    (1, 12, 25),
    (3, 12, 1),
    (5, 13, 25),
    (7, 13, 3),
  /*finals for sport with sport_id 2*/
    (1, 14, 25),
    (5, 14, 3),
  /*eliminations for sport with sport_id 3*/
    (1, 15, 25),
    (2, 15, 3),
    (3, 16, 25),
    (4, 16, 5),
    (5, 17, 25),
    (6, 17, 1),
    (7, 18, 25),
    (8, 18, 3),
  /*semis for sport with sport_id 3*/
    (1, 19, 25),
    (3, 19, 1),
    (5, 20, 25),
    (7, 20, 3),
  /*finals for sport with sport_id 3*/
    (1, 21, 25),
    (5, 21, 3),
  /*eliminations for sport with sport_id 4*/
    (1, 22, 25),
    (2, 22, 3),
    (3, 23, 25),
    (4, 23, 5),
    (5, 24, 25),
    (6, 24, 1),
    (7, 25, 25),
    (8, 25, 3),
  /*semis for sport with sport_id 4*/
    (1, 26, 25),
    (3, 26, 1),
    (5, 27, 25),
    (7, 27, 3),
  /*finals for sport with sport_id 4*/
    (1, 28, 25),
    (5, 28, 3),
  /*eliminations for sport with sport_id 5*/
    (1, 29, 25),
    (2, 29, 3),
    (3, 30, 25),
    (4, 30, 5),
    (5, 31, 25),
    (6, 31, 1),
    (7, 32, 25),
    (8, 32, 3),
  /*semis for sport with sport_id 5*/
    (1, 33, 25),
    (3, 33, 1),
    (5, 34, 25),
    (7, 34, 3),
  /*finals for sport with sport_id 5*/
    (1, 35, 25),
    (5, 35, 3),
  /*eliminations for sport with sport_id 6*/
    (1, 36, 25),
    (2, 36, 3),
    (3, 37, 25),
    (4, 37, 5),
    (5, 38, 25),
    (6, 38, 1),
    (7, 39, 25),
    (8, 39, 3),
  /*semis for sport with sport_id 6*/
    (1, 40, 25),
    (3, 40, 1),
    (5, 41, 25),
    (7, 41, 3),
  /*finals for sport with sport_id 6*/
    (1, 42, 25),
    (5, 42, 3),
  /*eliminations for sport with sport_id 7*/
    (1, 43, 25),
    (2, 43, 3),
    (3, 44, 25),
    (4, 44, 5),
    (5, 45, 25),
    (6, 45, 1),
    (7, 46, 25),
    (8, 46, 3),
  /*semis for sport with sport_id 7*/
    (1, 47, 25),
    (3, 47, 1),
    (5, 48, 25),
    (7, 48, 3),
  /*finals for sport with sport_id 7*/
    (1, 49, 25),
    (5, 49, 3),
/*Matches of Game 2*/
  /*eliminations for sport with sport_id 8*/
    (9, 50, 25),
    (10, 50, 3),
    (11, 51, 25),
    (12, 51, 5),
    (13, 52, 25),
    (14, 52, 1),
    (15, 53, 25),
    (16, 53, 3),
  /*semis for sport with sport_id 8*/
    (9, 54, 25),
    (11, 54, 1),
    (13, 55, 25),
    (15, 55, 3),
  /*finals for sport with sport_id 8*/
    (9, 56, 25),
    (13, 56, 3),
  /*eliminations for sport with sport_id 9*/
    (9, 57, 25),
    (10, 57, 3),
    (11, 58, 25),
    (12, 58, 5),
    (13, 59, 25),
    (14, 59, 1),
    (15, 60, 25),
    (16, 60, 3),
  /*semis for sport with sport_id 9*/
    (9, 61, 25),
    (11, 61, 1),
    (13, 62, 25),
    (15, 62, 3),
  /*finals for sport with sport_id 9*/
    (9, 63, 25),
    (13, 63, 3),
  /*eliminations for sport with sport_id 10*/
    (9, 64, 25),
    (10, 64, 3),
    (11, 65, 25),
    (12, 65, 5),
    (13, 66, 25),
    (14, 66, 1),
    (15, 67, 25),
    (16, 67, 3),
  /*semis for sport with sport_id 10*/
    (9, 68, 25),
    (11, 68, 1),
    (13, 69, 25),
    (15, 69, 3),
  /*finals for sport with sport_id 10*/
    (9, 70, 25),
    (13, 70, 3),
  /*eliminations for sport with sport_id 11*/
    (9, 71, 25),
    (10, 71, 3),
    (11, 72, 25),
    (12, 72, 5),
    (13, 73, 25),
    (14, 73, 1),
    (15, 74, 25),
    (16, 74, 3),
  /*semis for sport with sport_id 11*/
    (9, 75, 25),
    (11, 75, 1),
    (13, 76, 25),
    (15, 76, 3),
  /*finals for sport with sport_id 11*/
    (9, 77, 25),
    (13, 77, 3),
  /*eliminations for sport with sport_id 12*/
    (9, 78, 25),
    (10, 78, 3),
    (11, 79, 25),
    (12, 79, 5),
    (13, 80, 25),
    (14, 80, 1),
    (15, 81, 25),
    (16, 81, 3),
  /*semis for sport with sport_id 12*/
    (9, 82, 25),
    (11, 82, 1),
    (13, 83, 25),
    (15, 83, 3),
  /*finals for sport with sport_id 12*/
    (9, 84, 25),
    (13, 84, 3),
  /*eliminations for sport with sport_id 13*/
    (9, 85, 25),
    (10, 85, 3),
    (11, 86, 25),
    (12, 86, 5),
    (13, 87, 25),
    (14, 87, 1),
    (15, 88, 25),
    (16, 88, 3),
  /*semis for sport with sport_id 13*/
    (9, 89, 25),
    (11, 89, 1),
    (13, 90, 25),
    (15, 90, 3),
  /*finals for sport with sport_id 13*/
    (9, 91, 25),
    (13, 91, 3),
  /*eliminations for sport with sport_id 14*/
    (9, 92, 25),
    (10, 92, 3),
    (11, 93, 25),
    (12, 93, 5),
    (13, 94, 25),
    (14, 94, 1),
    (15, 95, 25),
    (16, 95, 3),
  /*semis for sport with sport_id 14*/
    (9, 96, 25),
    (11, 96, 1),
    (13, 97, 25),
    (15, 97, 3),
  /*finals for sport with sport_id 14*/
    (9, 98, 25),
    (13, 98, 3),
/*Matches of Game 3*/
  /*eliminations for sport with sport_id 15*/
    (17, 99, 25),
    (18, 99, 3),
    (19, 100, 25),
    (20, 100, 5),
    (21, 101, 25),
    (22, 101, 1),
    (23, 102, 25),
    (24, 102, 3),
  /*semis for sport with sport_id 15*/
    (17, 103, 25),
    (19, 103, 1),
    (21, 104, 25),
    (23, 104, 3),
  /*finals for sport with sport_id 15*/
    (17, 105, 25),
    (21, 105, 3),
  /*eliminations for sport with sport_id 16*/
    (17, 106, 25),
    (18, 106, 3),
    (19, 107, 25),
    (20, 107, 5),
    (21, 108, 25),
    (22, 108, 1),
    (23, 109, 25),
    (24, 109, 3),
  /*semis for sport with sport_id 16*/
    (17, 110, 25),
    (19, 110, 1),
    (21, 111, 25),
    (23, 111, 3),
  /*finals for sport with sport_id 16*/
    (17, 112, 25),
    (21, 112, 3),
  /*eliminations for sport with sport_id 17*/
    (17, 113, 25),
    (18, 113, 3),
    (19, 114, 25),
    (20, 114, 5),
    (21, 115, 25),
    (22, 115, 1),
    (23, 116, 25),
    (24, 116, 3),
  /*semis for sport with sport_id 17*/
    (17, 117, 25),
    (19, 117, 1),
    (21, 118, 25),
    (23, 118, 3),
  /*finals for sport with sport_id 17*/
    (17, 119, 25),
    (21, 119, 3),
  /*eliminations for sport with sport_id 18*/
    (17, 120, 25),
    (18, 120, 3),
    (19, 121, 25),
    (20, 121, 5),
    (21, 122, 25),
    (22, 122, 1),
    (23, 123, 25),
    (24, 123, 3),
  /*semis for sport with sport_id 18*/
    (17, 124, 25),
    (19, 124, 1),
    (21, 125, 25),
    (23, 125, 3),
  /*finals for sport with sport_id 18*/
    (17, 126, 25),
    (21, 126, 3),
  /*eliminations for sport with sport_id 19*/
    (17, 127, 25),
    (18, 127, 3),
    (19, 128, 25),
    (20, 128, 5),
    (21, 129, 25),
    (22, 129, 1),
    (23, 130, 25),
    (24, 130, 3),
  /*semis for sport with sport_id 19*/
    (17, 131, 25),
    (19, 131, 1),
    (21, 132, 25),
    (23, 132, 3),
  /*finals for sport with sport_id 19*/
    (17, 133, 25),
    (21, 133, 3),
  /*eliminations for sport with sport_id 20*/
    (17, 134, 25),
    (18, 134, 3),
    (19, 135, 25),
    (20, 135, 5),
    (21, 136, 25),
    (22, 136, 1),
    (23, 137, 25),
    (24, 137, 3),
  /*semis for sport with sport_id 20*/
    (17, 138, 25),
    (19, 138, 1),
    (21, 139, 25),
    (23, 139, 3),
  /*finals for sport with sport_id 20*/
    (17, 140, 25),
    (21, 140, 3),
  /*eliminations for sport with sport_id 21*/
    (17, 141, 25),
    (18, 141, 3),
    (19, 142, 25),
    (20, 142, 5),
    (21, 143, 25),
    (22, 143, 1),
    (23, 144, 25),
    (24, 144, 3),
  /*semis for sport with sport_id 21*/
    (17, 145, 25),
    (19, 145, 1),
    (21, 146, 25),
    (23, 146, 3),
  /*finals for sport with sport_id 21*/
    (17, 147, 25),
    (21, 147, 3),
/*Matches of Game 4*/
  /*eliminations for sport with sport_id 22*/
    (25, 148, 25),
    (26, 148, 3),
    (27, 149, 25),
    (28, 149, 5),
    (29, 150, 25),
    (30, 150, 1),
    (31, 151, 25),
    (32, 151, 3),
  /*semis for sport with sport_id 22*/
    (25, 152, 25),
    (27, 152, 1),
    (29, 153, 25),
    (31, 153, 3),
  /*finals for sport with sport_id 22*/
    (25, 154, 25),
    (29, 154, 3),
  /*eliminations for sport with sport_id 23*/
    (25, 155, 25),
    (26, 155, 3),
    (27, 156, 25),
    (28, 156, 5),
    (29, 157, 25),
    (30, 157, 1),
    (31, 158, 25),
    (32, 158, 3),
  /*semis for sport with sport_id 23*/
    (25, 159, 25),
    (27, 159, 1),
    (29, 160, 25),
    (31, 160, 3),
  /*finals for sport with sport_id 23*/
    (25, 161, 25),
    (29, 161, 3),
  /*eliminations for sport with sport_id 24*/
    (25, 162, 25),
    (26, 162, 3),
    (27, 163, 25),
    (28, 163, 5),
    (29, 164, 25),
    (30, 164, 1),
    (31, 165, 25),
    (32, 165, 3),
  /*semis for sport with sport_id 24*/
    (25, 166, 25),
    (27, 166, 1),
    (29, 167, 25),
    (31, 167, 3),
  /*finals for sport with sport_id 24*/
    (25, 168, 25),
    (29, 168, 3),
  /*eliminations for sport with sport_id 25*/
    (25, 169, 25),
    (26, 169, 3),
    (27, 170, 25),
    (28, 170, 5),
    (29, 171, 25),
    (30, 171, 1),
    (31, 172, 25),
    (32, 172, 3),
  /*semis for sport with sport_id 25*/
    (25, 173, 25),
    (27, 173, 1),
    (29, 174, 25),
    (31, 174, 3),
  /*finals for sport with sport_id 25*/
    (25, 175, 25),
    (29, 175, 3),
  /*eliminations for sport with sport_id 26*/
    (25, 176, 25),
    (26, 176, 3),
    (27, 177, 25),
    (28, 177, 5),
    (29, 178, 25),
    (30, 178, 1),
    (31, 179, 25),
    (32, 179, 3),
  /*semis for sport with sport_id 26*/
    (25, 180, 25),
    (27, 180, 1),
    (29, 181, 25),
    (31, 181, 3),
  /*finals for sport with sport_id 26*/
    (25, 182, 25),
    (29, 182, 3),
  /*eliminations for sport with sport_id 27*/
    (25, 183, 25),
    (26, 183, 3),
    (27, 184, 25),
    (28, 184, 5),
    (29, 185, 25),
    (30, 185, 1),
    (31, 186, 25),
    (32, 186, 3),
  /*semis for sport with sport_id 27*/
    (25, 187, 25),
    (27, 187, 1),
    (29, 188, 25),
    (31, 188, 3),
  /*finals for sport with sport_id 27*/
    (25, 189, 25),
    (29, 189, 3),
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
/*Matches of Game 5*/
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
    (33, 204, 25),
    (34, 204, 3),
    (35, 205, 25),
    (36, 205, 5),
    (37, 206, 25),
    (38, 206, 1),
    (39, 207, 25),
    (40, 207, 3),
  /*semis for sport with sport_id 30*/
    (33, 208, 25),
    (35, 208, 1),
    (37, 209, 25),
    (39, 209, 3),
  /*finals for sport with sport_id 30*/
    (33, 210, 25),
    (37, 210, 3),
  /*eliminations for sport with sport_id 31*/
    (33, 211, 25),
    (34, 211, 3),
    (35, 212, 25),
    (36, 212, 5),
    (37, 213, 25),
    (38, 213, 1),
    (39, 214, 25),
    (40, 214, 3),
  /*semis for sport with sport_id 31*/
    (33, 215, 25),
    (35, 215, 1),
    (37, 216, 25),
    (39, 216, 3),
  /*finals for sport with sport_id 31*/
    (33, 217, 25),
    (37, 217, 3),
  /*eliminations for sport with sport_id 32*/
    (33, 218, 25),
    (34, 218, 3),
    (35, 219, 25),
    (36, 219, 5),
    (37, 220, 25),
    (38, 220, 1),
    (39, 221, 25),
    (40, 221, 3),
  /*semis for sport with sport_id 32*/
    (33, 222, 25),
    (35, 222, 1),
    (37, 223, 25),
    (39, 223, 3),
  /*finals for sport with sport_id 32*/
    (33, 224, 25),
    (37, 224, 3),
  /*eliminations for sport with sport_id 33*/
    (33, 225, 25),
    (34, 225, 3),
    (35, 226, 25),
    (36, 226, 5),
    (37, 227, 25),
    (38, 227, 1),
    (39, 228, 25),
    (40, 228, 3),
  /*semis for sport with sport_id 33*/
    (33, 229, 25),
    (35, 229, 1),
    (37, 230, 25),
    (39, 230, 3),
  /*finals for sport with sport_id 33*/
    (33, 231, 25),
    (37, 231, 3),
  /*eliminations for sport with sport_id 34*/
    (33, 232, 25),
    (34, 232, 3),
    (35, 233, 25),
    (36, 233, 5),
    (37, 234, 25),
    (38, 234, 1),
    (39, 235, 25),
    (40, 235, 3),
  /*semis for sport with sport_id 34*/
    (33, 236, 25),
    (35, 236, 1),
    (37, 237, 25),
    (39, 237, 3),
  /*finals for sport with sport_id 34*/
    (33, 238, 25),
    (37, 238, 3),
  /*eliminations for sport with sport_id 35*/
    (33, 239, 25),
    (34, 239, 3),
    (35, 240, 25),
    (36, 240, 5),
    (37, 241, 25),
    (38, 241, 1),
    (39, 242, 25),
    (40, 242, 3),
  /*semis for sport with sport_id 35*/
    (33, 243, 25),
    (35, 243, 1),
    (37, 244, 25),
    (39, 244, 3),
  /*finals for sport with sport_id 35*/
    (33, 245, 25),
    (37, 245, 3),
/*Matches of Game 6*/
  /*eliminations for sport with sport_id 36*/
    (41, 246, 25),
    (42, 246, 3),
    (43, 247, 25),
    (44, 247, 5),
    (45, 248, 25),
    (46, 248, 1),
    (47, 249, 25),
    (48, 249, 3),
  /*semis for sport with sport_id 36*/
    (41, 250, 25),
    (43, 250, 1),
    (45, 251, 25),
    (47, 251, 3),
  /*finals for sport with sport_id 36*/
    (41, 252, 25),
    (45, 252, 3),
  /*eliminations for sport with sport_id 37*/
    (41, 253, 25),
    (42, 253, 3),
    (43, 254, 25),
    (44, 254, 5),
    (45, 255, 25),
    (46, 255, 1),
    (47, 256, 25),
    (48, 256, 3),
  /*semis for sport with sport_id 37*/
    (41, 257, 25),
    (43, 257, 1),
    (45, 258, 25),
    (47, 258, 3),
  /*finals for sport with sport_id 37*/
    (41, 259, 25),
    (45, 259, 3),
  /*eliminations for sport with sport_id 38*/
    (41, 260, 25),
    (42, 260, 3),
    (43, 261, 25),
    (44, 261, 5),
    (45, 262, 25),
    (46, 262, 1),
    (47, 263, 25),
    (48, 263, 3),
  /*semis for sport with sport_id 38*/
    (41, 264, 25),
    (43, 264, 1),
    (45, 265, 25),
    (47, 265, 3),
  /*finals for sport with sport_id 38*/
    (41, 266, 25),
    (45, 266, 3),
  /*eliminations for sport with sport_id 39*/
    (41, 267, 25),
    (42, 267, 3),
    (43, 268, 25),
    (44, 268, 5),
    (45, 269, 25),
    (46, 269, 1),
    (47, 270, 25),
    (48, 270, 3),
  /*semis for sport with sport_id 39*/
    (41, 271, 25),
    (43, 271, 1),
    (45, 272, 25),
    (47, 272, 3),
  /*finals for sport with sport_id 39*/
    (41, 273, 25),
    (45, 273, 3),
  /*eliminations for sport with sport_id 40*/
    (41, 274, 25),
    (42, 274, 3),
    (43, 275, 25),
    (44, 275, 5),
    (45, 276, 25),
    (46, 276, 1),
    (47, 277, 25),
    (48, 277, 3),
  /*semis for sport with sport_id 40*/
    (41, 278, 25),
    (43, 278, 1),
    (45, 279, 25),
    (47, 279, 3),
  /*finals for sport with sport_id 40*/
    (41, 280, 25),
    (45, 280, 3),
  /*eliminations for sport with sport_id 41*/
    (41, 281, 25),
    (42, 281, 3),
    (43, 282, 25),
    (44, 282, 5),
    (45, 283, 25),
    (46, 283, 1),
    (47, 284, 25),
    (48, 284, 3),
  /*semis for sport with sport_id 41*/
    (41, 285, 25),
    (43, 285, 1),
    (45, 286, 25),
    (47, 286, 3),
  /*finals for sport with sport_id 41*/
    (41, 287, 25),
    (45, 287, 3),
  /*eliminations for sport with sport_id 42*/
    (41, 288, 25),
    (42, 288, 3),
    (43, 289, 25),
    (44, 289, 5),
    (45, 290, 25),
    (46, 290, 1),
    (47, 291, 25),
    (48, 291, 3),
  /*semis for sport with sport_id 42*/
    (41, 292, 25),
    (43, 292, 1),
    (45, 293, 25),
    (47, 293, 3),
  /*finals for sport with sport_id 42*/
    (41, 294, 25),
    (45, 294, 3),
/*Matches of Game 7*/
  /*eliminations for sport with sport_id 43*/
    (49, 295, 25),
    (50, 295, 3),
    (51, 296, 25),
    (52, 296, 5),
    (53, 297, 25),
    (54, 297, 1),
    (55, 298, 25),
    (56, 298, 3),
  /*semis for sport with sport_id 43*/
    (49, 299, 25),
    (51, 299, 1),
    (53, 300, 25),
    (55, 300, 3),
  /*finals for sport with sport_id 43*/
    (49, 301, 25),
    (53, 301, 3),
  /*eliminations for sport with sport_id 44*/
    (49, 302, 25),
    (50, 302, 3),
    (51, 303, 25),
    (52, 303, 5),
    (53, 304, 25),
    (54, 304, 1),
    (55, 305, 25),
    (56, 305, 3),
  /*semis for sport with sport_id 44*/
    (49, 306, 25),
    (51, 306, 1),
    (53, 307, 25),
    (55, 307, 3),
  /*finals for sport with sport_id 44*/
    (49, 308, 25),
    (53, 308, 3),
  /*eliminations for sport with sport_id 45*/
    (49, 309, 25),
    (50, 309, 3),
    (51, 310, 25),
    (52, 310, 5),
    (53, 311, 25),
    (54, 311, 1),
    (55, 312, 25),
    (56, 312, 3),
  /*semis for sport with sport_id 45*/
    (49, 313, 25),
    (51, 313, 1),
    (53, 314, 25),
    (55, 314, 3),
  /*finals for sport with sport_id 45*/
    (49, 315, 25),
    (53, 315, 3),
  /*eliminations for sport with sport_id 46*/
    (49, 316, 25),
    (50, 316, 3),
    (51, 317, 25),
    (52, 317, 5),
    (53, 318, 25),
    (54, 318, 1),
    (55, 319, 25),
    (56, 319, 3),
  /*semis for sport with sport_id 46*/
    (49, 320, 25),
    (51, 320, 1),
    (53, 321, 25),
    (55, 321, 3),
  /*finals for sport with sport_id 46*/
    (49, 322, 25),
    (53, 322, 3),
  /*eliminations for sport with sport_id 47*/
    (49, 323, 25),
    (50, 323, 3),
    (51, 324, 25),
    (52, 324, 5),
    (53, 325, 25),
    (54, 325, 1),
    (55, 326, 25),
    (56, 326, 3),
  /*semis for sport with sport_id 47*/
    (49, 327, 25),
    (51, 327, 1),
    (53, 328, 25),
    (55, 328, 3),
  /*finals for sport with sport_id 47*/
    (49, 329, 25),
    (53, 329, 3),
  /*eliminations for sport with sport_id 48*/
    (49, 330, 25),
    (50, 330, 3),
    (51, 331, 25),
    (52, 331, 5),
    (53, 332, 25),
    (54, 332, 1),
    (55, 333, 25),
    (56, 333, 3),
  /*semis for sport with sport_id 48*/
    (49, 334, 25),
    (51, 334, 1),
    (53, 335, 25),
    (55, 335, 3),
  /*finals for sport with sport_id 48*/
    (49, 336, 25),
    (53, 336, 3),
  /*eliminations for sport with sport_id 49*/
    (49, 337, 25),
    (50, 337, 3),
    (51, 338, 25),
    (52, 338, 5),
    (53, 339, 25),
    (54, 339, 1),
    (55, 340, 25),
    (56, 340, 3),
  /*semis for sport with sport_id 49*/
    (49, 341, 25),
    (51, 341, 1),
    (53, 342, 25),
    (55, 342, 3),
  /*finals for sport with sport_id 49*/
    (49, 343, 25),
    (53, 343, 3),
/*Matches of Game 8*/
  /*eliminations for sport with sport_id 50*/
    (57, 344, 25),
    (58, 344, 3),
    (59, 345, 25),
    (60, 345, 5),
    (61, 346, 25),
    (62, 346, 1),
    (63, 347, 25),
    (64, 347, 3),
  /*semis for sport with sport_id 50*/
    (57, 348, 25),
    (59, 348, 1),
    (61, 349, 25),
    (63, 349, 3),
  /*finals for sport with sport_id 50*/
    (57, 350, 25),
    (61, 350, 3),
  /*eliminations for sport with sport_id 51*/
    (57, 351, 25),
    (58, 351, 3),
    (59, 352, 25),
    (60, 352, 5),
    (61, 353, 25),
    (62, 353, 1),
    (63, 354, 25),
    (64, 354, 3),
  /*semis for sport with sport_id 51*/
    (57, 355, 25),
    (59, 355, 1),
    (61, 356, 25),
    (63, 356, 3),
  /*finals for sport with sport_id 51*/
    (57, 357, 25),
    (61, 357, 3),
  /*eliminations for sport with sport_id 52*/
    (57, 358, 25),
    (58, 358, 3),
    (59, 359, 25),
    (60, 359, 5),
    (61, 360, 25),
    (62, 360, 1),
    (63, 361, 25),
    (64, 361, 3),
  /*semis for sport with sport_id 52*/
    (57, 362, 25),
    (59, 362, 1),
    (61, 363, 25),
    (63, 363, 3),
  /*finals for sport with sport_id 52*/
    (57, 364, 25),
    (61, 364, 3),
  /*eliminations for sport with sport_id 53*/
    (57, 365, 25),
    (58, 365, 3),
    (59, 366, 25),
    (60, 366, 5),
    (61, 367, 25),
    (62, 367, 1),
    (63, 368, 25),
    (64, 368, 3),
  /*semis for sport with sport_id 53*/
    (57, 369, 25),
    (59, 369, 1),
    (61, 370, 25),
    (63, 370, 3),
  /*finals for sport with sport_id 53*/
    (57, 371, 25),
    (61, 371, 3),
  /*eliminations for sport with sport_id 54*/
    (57, 372, 25),
    (58, 372, 3),
    (59, 373, 25),
    (60, 373, 5),
    (61, 374, 25),
    (62, 374, 1),
    (63, 375, 25),
    (64, 375, 3),
  /*semis for sport with sport_id 54*/
    (57, 376, 25),
    (59, 376, 1),
    (61, 377, 25),
    (63, 377, 3),
  /*finals for sport with sport_id 54*/
    (57, 378, 25),
    (61, 378, 3),
  /*eliminations for sport with sport_id 55*/
    (57, 379, 25),
    (58, 379, 3),
    (59, 380, 25),
    (60, 380, 5),
    (61, 381, 25),
    (62, 381, 1),
    (63, 382, 25),
    (64, 382, 3),
  /*semis for sport with sport_id 55*/
    (57, 383, 25),
    (59, 383, 1),
    (61, 384, 25),
    (63, 384, 3),
  /*finals for sport with sport_id 55*/
    (57, 385, 25),
    (61, 385, 3),
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
/*Matches of Game 9*/
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
    (65, 400, 25),
    (66, 400, 3),
    (67, 401, 25),
    (68, 401, 5),
    (69, 402, 25),
    (70, 402, 1),
    (71, 403, 25),
    (72, 403, 3),
  /*semis for sport with sport_id 58*/
    (65, 404, 25),
    (67, 404, 1),
    (69, 405, 25),
    (71, 405, 3),
  /*finals for sport with sport_id 58*/
    (65, 406, 25),
    (69, 406, 3),
  /*eliminations for sport with sport_id 59*/
    (65, 407, 25),
    (66, 407, 3),
    (67, 408, 25),
    (68, 408, 5),
    (69, 409, 25),
    (70, 409, 1),
    (71, 410, 25),
    (72, 410, 3),
  /*semis for sport with sport_id 59*/
    (65, 411, 25),
    (67, 411, 1),
    (69, 412, 25),
    (71, 412, 3),
  /*finals for sport with sport_id 59*/
    (65, 413, 25),
    (69, 413, 3),
  /*eliminations for sport with sport_id 60*/
    (65, 414, 25),
    (66, 414, 3),
    (67, 415, 25),
    (68, 415, 5),
    (69, 416, 25),
    (70, 416, 1),
    (71, 417, 25),
    (72, 417, 3),
  /*semis for sport with sport_id 60*/
    (65, 418, 25),
    (67, 418, 1),
    (69, 419, 25),
    (71, 419, 3),
  /*finals for sport with sport_id 60*/
    (65, 420, 25),
    (69, 420, 3),
  /*eliminations for sport with sport_id 61*/
    (65, 421, 25),
    (66, 421, 3),
    (67, 422, 25),
    (68, 422, 5),
    (69, 423, 25),
    (70, 423, 1),
    (71, 424, 25),
    (72, 424, 3),
  /*semis for sport with sport_id 61*/
    (65, 425, 25),
    (67, 425, 1),
    (69, 426, 25),
    (71, 426, 3),
  /*finals for sport with sport_id 61*/
    (65, 427, 25),
    (69, 427, 3),
  /*eliminations for sport with sport_id 62*/
    (65, 428, 25),
    (66, 428, 3),
    (67, 429, 25),
    (68, 429, 5),
    (69, 430, 25),
    (70, 430, 1),
    (71, 431, 25),
    (72, 431, 3),
  /*semis for sport with sport_id 62*/
    (65, 432, 25),
    (67, 432, 1),
    (69, 433, 25),
    (71, 433, 3),
  /*finals for sport with sport_id 62*/
    (65, 434, 25),
    (69, 434, 3),
  /*eliminations for sport with sport_id 63*/
    (65, 435, 25),
    (66, 435, 3),
    (67, 436, 25),
    (68, 436, 5),
    (69, 437, 25),
    (70, 437, 1),
    (71, 438, 25),
    (72, 438, 3),
  /*semis for sport with sport_id 63*/
    (65, 439, 25),
    (67, 439, 1),
    (69, 440, 25),
    (71, 440, 3),
  /*finals for sport with sport_id 63*/
    (65, 441, 25),
    (69, 441, 3),
/*Matches of Game 10*/
  /*eliminations for sport with sport_id 64*/
    (73, 442, 25),
    (74, 442, 3),
    (75, 443, 25),
    (76, 443, 5),
    (77, 444, 25),
    (78, 444, 1),
    (79, 445, 25),
    (80, 445, 3),
  /*semis for sport with sport_id 64*/
    (73, 446, 25),
    (75, 446, 1),
    (77, 447, 25),
    (79, 447, 3),
  /*finals for sport with sport_id 64*/
    (73, 448, 25),
    (77, 448, 3),
  /*eliminations for sport with sport_id 65*/
    (73, 449, 25),
    (74, 449, 3),
    (75, 450, 25),
    (76, 450, 5),
    (77, 451, 25),
    (78, 451, 1),
    (79, 452, 25),
    (80, 452, 3),
  /*semis for sport with sport_id 65*/
    (73, 453, 25),
    (75, 453, 1),
    (77, 454, 25),
    (79, 454, 3),
  /*finals for sport with sport_id 65*/
    (73, 455, 25),
    (77, 455, 3),
  /*eliminations for sport with sport_id 66*/
    (73, 456, 25),
    (74, 456, 3),
    (75, 457, 25),
    (76, 457, 5),
    (77, 458, 25),
    (78, 458, 1),
    (79, 459, 25),
    (80, 459, 3),
  /*semis for sport with sport_id 66*/
    (73, 460, 25),
    (75, 460, 1),
    (77, 461, 25),
    (79, 461, 3),
  /*finals for sport with sport_id 66*/
    (73, 462, 25),
    (77, 462, 3),
  /*eliminations for sport with sport_id 67*/
    (73, 463, 25),
    (74, 463, 3),
    (75, 464, 25),
    (76, 464, 5),
    (77, 465, 25),
    (78, 465, 1),
    (79, 466, 25),
    (80, 466, 3),
  /*semis for sport with sport_id 67*/
    (73, 467, 25),
    (75, 467, 1),
    (77, 468, 25),
    (79, 468, 3),
  /*finals for sport with sport_id 67*/
    (73, 469, 25),
    (77, 469, 3),
  /*eliminations for sport with sport_id 68*/
    (73, 470, 25),
    (74, 470, 3),
    (75, 471, 25),
    (76, 471, 5),
    (77, 472, 25),
    (78, 472, 1),
    (79, 473, 25),
    (80, 473, 3),
  /*semis for sport with sport_id 68*/
    (73, 474, 25),
    (75, 474, 1),
    (77, 475, 25),
    (79, 475, 3),
  /*finals for sport with sport_id 68*/
    (73, 476, 25),
    (77, 476, 3),
  /*eliminations for sport with sport_id 69*/
    (73, 477, 25),
    (74, 477, 3),
    (75, 478, 25),
    (76, 478, 5),
    (77, 479, 25),
    (78, 479, 1),
    (79, 480, 25),
    (80, 480, 3),
  /*semis for sport with sport_id 69*/
    (73, 481, 25),
    (75, 481, 1),
    (77, 482, 25),
    (79, 482, 3),
  /*finals for sport with sport_id 69*/
    (73, 483, 25),
    (77, 483, 3),
  /*eliminations for sport with sport_id 70*/
    (73, 484, 25),
    (74, 484, 3),
    (75, 485, 25),
    (76, 485, 5),
    (77, 486, 25),
    (78, 486, 1),
    (79, 487, 25),
    (80, 487, 3),
  /*semis for sport with sport_id 70*/
    (73, 488, 25),
    (75, 488, 1),
    (77, 489, 25),
    (79, 489, 3),
  /*finals for sport with sport_id 70*/
    (73, 490, 25),
    (77, 490, 3),
/*Matches of Game 11*/
  /*eliminations for sport with sport_id 71*/
    (81, 491, 25),
    (82, 491, 3),
    (83, 492, 25),
    (84, 492, 5),
    (85, 493, 25),
    (86, 493, 1),
    (87, 494, 25),
    (88, 494, 3),
  /*semis for sport with sport_id 71*/
    (81, 495, 25),
    (83, 495, 1),
    (85, 496, 25),
    (87, 496, 3),
  /*finals for sport with sport_id 71*/
    (81, 497, 25),
    (85, 497, 3),
  /*eliminations for sport with sport_id 72*/
    (81, 498, 25),
    (82, 498, 3),
    (83, 499, 25),
    (84, 499, 5),
    (85, 500, 25),
    (86, 500, 1),
    (87, 501, 25),
    (88, 501, 3),
  /*semis for sport with sport_id 72*/
    (81, 502, 25),
    (83, 502, 1),
    (85, 503, 25),
    (87, 503, 3),
  /*finals for sport with sport_id 72*/
    (81, 504, 25),
    (85, 504, 3),
  /*eliminations for sport with sport_id 73*/
    (81, 505, 25),
    (82, 505, 3),
    (83, 506, 25),
    (84, 506, 5),
    (85, 507, 25),
    (86, 507, 1),
    (87, 508, 25),
    (88, 508, 3),
  /*semis for sport with sport_id 73*/
    (81, 509, 25),
    (83, 509, 1),
    (85, 510, 25),
    (87, 510, 3),
  /*finals for sport with sport_id 73*/
    (81, 511, 25),
    (85, 511, 3),
  /*eliminations for sport with sport_id 74*/
    (81, 512, 25),
    (82, 512, 3),
    (83, 513, 25),
    (84, 513, 5),
    (85, 514, 25),
    (86, 514, 1),
    (87, 515, 25),
    (88, 515, 3),
  /*semis for sport with sport_id 74*/
    (81, 516, 25),
    (83, 516, 1),
    (85, 517, 25),
    (87, 517, 3),
  /*finals for sport with sport_id 74*/
    (81, 518, 25),
    (85, 518, 3),
  /*eliminations for sport with sport_id 75*/
    (81, 519, 25),
    (82, 519, 3),
    (83, 520, 25),
    (84, 520, 5),
    (85, 521, 25),
    (86, 521, 1),
    (87, 522, 25),
    (88, 522, 3),
  /*semis for sport with sport_id 75*/
    (81, 523, 25),
    (83, 523, 1),
    (85, 524, 25),
    (87, 524, 3),
  /*finals for sport with sport_id 75*/
    (81, 525, 25),
    (85, 525, 3),
  /*eliminations for sport with sport_id 76*/
    (81, 526, 25),
    (82, 526, 3),
    (83, 527, 25),
    (84, 527, 5),
    (85, 528, 25),
    (86, 528, 1),
    (87, 529, 25),
    (88, 529, 3),
  /*semis for sport with sport_id 76*/
    (81, 530, 25),
    (83, 530, 1),
    (85, 531, 25),
    (87, 531, 3),
  /*finals for sport with sport_id 76*/
    (81, 532, 25),
    (85, 532, 3),
  /*eliminations for sport with sport_id 77*/
    (81, 533, 25),
    (82, 533, 3),
    (83, 534, 25),
    (84, 534, 5),
    (85, 535, 25),
    (86, 535, 1),
    (87, 536, 25),
    (88, 536, 3),
  /*semis for sport with sport_id 77*/
    (81, 537, 25),
    (83, 537, 1),
    (85, 538, 25),
    (87, 538, 3),
  /*finals for sport with sport_id 77*/
    (81, 539, 25),
    (85, 539, 3),
/*Matches of Game 12*/
  /*eliminations for sport with sport_id 78*/
    (89, 540, 25),
    (90, 540, 3),
    (91, 541, 25),
    (92, 541, 5),
    (93, 542, 25),
    (94, 542, 1),
    (95, 543, 25),
    (96, 543, 3),
  /*semis for sport with sport_id 78*/
    (89, 544, 25),
    (91, 544, 1),
    (93, 545, 25),
    (95, 545, 3),
  /*finals for sport with sport_id 78*/
    (89, 546, 25),
    (93, 546, 3),
  /*eliminations for sport with sport_id 79*/
    (89, 547, 25),
    (90, 547, 3),
    (91, 548, 25),
    (92, 548, 5),
    (93, 549, 25),
    (94, 549, 1),
    (95, 550, 25),
    (96, 550, 3),
  /*semis for sport with sport_id 79*/
    (89, 551, 25),
    (91, 551, 1),
    (93, 552, 25),
    (95, 552, 3),
  /*finals for sport with sport_id 79*/
    (89, 553, 25),
    (93, 553, 3),
  /*eliminations for sport with sport_id 80*/
    (89, 554, 25),
    (90, 554, 3),
    (91, 555, 25),
    (92, 555, 5),
    (93, 556, 25),
    (94, 556, 1),
    (95, 557, 25),
    (96, 557, 3),
  /*semis for sport with sport_id 80*/
    (89, 558, 25),
    (91, 558, 1),
    (93, 559, 25),
    (95, 559, 3),
  /*finals for sport with sport_id 80*/
    (89, 560, 25),
    (93, 560, 3),
  /*eliminations for sport with sport_id 81*/
    (89, 561, 25),
    (90, 561, 3),
    (91, 562, 25),
    (92, 562, 5),
    (93, 563, 25),
    (94, 563, 1),
    (95, 564, 25),
    (96, 564, 3),
  /*semis for sport with sport_id 81*/
    (89, 565, 25),
    (91, 565, 1),
    (93, 566, 25),
    (95, 566, 3),
  /*finals for sport with sport_id 81*/
    (89, 567, 25),
    (93, 567, 3),
  /*eliminations for sport with sport_id 82*/
    (89, 568, 25),
    (90, 568, 3),
    (91, 569, 25),
    (92, 569, 5),
    (93, 570, 25),
    (94, 570, 1),
    (95, 571, 25),
    (96, 571, 3),
  /*semis for sport with sport_id 82*/
    (89, 572, 25),
    (91, 572, 1),
    (93, 573, 25),
    (95, 573, 3),
  /*finals for sport with sport_id 82*/
    (89, 574, 25),
    (93, 574, 3),
  /*eliminations for sport with sport_id 83*/
    (89, 575, 25),
    (90, 575, 3),
    (91, 576, 25),
    (92, 576, 5),
    (93, 577, 25),
    (94, 577, 1),
    (95, 578, 25),
    (96, 578, 3),
  /*semis for sport with sport_id 83*/
    (89, 579, 25),
    (91, 579, 1),
    (93, 580, 25),
    (95, 580, 3),
  /*finals for sport with sport_id 83*/
    (89, 581, 25),
    (93, 581, 3),
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
/*Matches of Game 13*/
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
    (97, 596, 25),
    (98, 596, 3),
    (99, 597, 25),
    (100, 597, 5),
    (101, 598, 25),
    (102, 598, 1),
    (103, 599, 25),
    (104, 599, 3),
  /*semis for sport with sport_id 86*/
    (97, 600, 25),
    (99, 600, 1),
    (101, 601, 25),
    (103, 601, 3),
  /*finals for sport with sport_id 86*/
    (97, 602, 25),
    (101, 602, 3),
  /*eliminations for sport with sport_id 87*/
    (97, 603, 25),
    (98, 603, 3),
    (99, 604, 25),
    (100, 604, 5),
    (101, 605, 25),
    (102, 605, 1),
    (103, 606, 25),
    (104, 606, 3),
  /*semis for sport with sport_id 87*/
    (97, 607, 25),
    (99, 607, 1),
    (101, 608, 25),
    (103, 608, 3),
  /*finals for sport with sport_id 87*/
    (97, 609, 25),
    (101, 609, 3),
  /*eliminations for sport with sport_id 88*/
    (97, 610, 25),
    (98, 610, 3),
    (99, 611, 25),
    (100, 611, 5),
    (101, 612, 25),
    (102, 612, 1),
    (103, 613, 25),
    (104, 613, 3),
  /*semis for sport with sport_id 88*/
    (97, 614, 25),
    (99, 614, 1),
    (101, 615, 25),
    (103, 615, 3),
  /*finals for sport with sport_id 88*/
    (97, 616, 25),
    (101, 616, 3),
  /*eliminations for sport with sport_id 89*/
    (97, 617, 25),
    (98, 617, 3),
    (99, 618, 25),
    (100, 618, 5),
    (101, 619, 25),
    (102, 619, 1),
    (103, 620, 25),
    (104, 620, 3),
  /*semis for sport with sport_id 89*/
    (97, 621, 25),
    (99, 621, 1),
    (101, 622, 25),
    (103, 622, 3),
  /*finals for sport with sport_id 89*/
    (97, 623, 25),
    (101, 623, 3),
  /*eliminations for sport with sport_id 90*/
    (97, 624, 25),
    (98, 624, 3),
    (99, 625, 25),
    (100, 625, 5),
    (101, 626, 25),
    (102, 626, 1),
    (103, 627, 25),
    (104, 627, 3),
  /*semis for sport with sport_id 90*/
    (97, 628, 25),
    (99, 628, 1),
    (101, 629, 25),
    (103, 629, 3),
  /*finals for sport with sport_id 90*/
    (97, 630, 25),
    (101, 630, 3),
  /*eliminations for sport with sport_id 91*/
    (97, 631, 25),
    (98, 631, 3),
    (99, 632, 25),
    (100, 632, 5),
    (101, 633, 25),
    (102, 633, 1),
    (103, 634, 25),
    (104, 634, 3),
  /*semis for sport with sport_id 91*/
    (97, 635, 25),
    (99, 635, 1),
    (101, 636, 25),
    (103, 636, 3),
  /*finals for sport with sport_id 91*/
    (97, 637, 25),
    (101, 637, 3),
/*Matches of Game 14*/
  /*eliminations for sport with sport_id 92*/
    (105, 638, 25),
    (106, 638, 3),
    (107, 639, 25),
    (108, 639, 5),
    (109, 640, 25),
    (110, 640, 1),
    (111, 641, 25),
    (112, 641, 3),
  /*semis for sport with sport_id 92*/
    (105, 642, 25),
    (107, 642, 1),
    (109, 643, 25),
    (111, 643, 3),
  /*finals for sport with sport_id 92*/
    (105, 644, 25),
    (109, 644, 3),
  /*eliminations for sport with sport_id 93*/
    (105, 645, 25),
    (106, 645, 3),
    (107, 646, 25),
    (108, 646, 5),
    (109, 647, 25),
    (110, 647, 1),
    (111, 648, 25),
    (112, 648, 3),
  /*semis for sport with sport_id 93*/
    (105, 649, 25),
    (107, 649, 1),
    (109, 650, 25),
    (111, 650, 3),
  /*finals for sport with sport_id 93*/
    (105, 651, 25),
    (109, 651, 3),
  /*eliminations for sport with sport_id 94*/
    (105, 652, 25),
    (106, 652, 3),
    (107, 653, 25),
    (108, 653, 5),
    (109, 654, 25),
    (110, 654, 1),
    (111, 655, 25),
    (112, 655, 3),
  /*semis for sport with sport_id 94*/
    (105, 656, 25),
    (107, 656, 1),
    (109, 657, 25),
    (111, 657, 3),
  /*finals for sport with sport_id 94*/
    (105, 658, 25),
    (109, 658, 3),
  /*eliminations for sport with sport_id 95*/
    (105, 659, 25),
    (106, 659, 3),
    (107, 660, 25),
    (108, 660, 5),
    (109, 661, 25),
    (110, 661, 1),
    (111, 662, 25),
    (112, 662, 3),
  /*semis for sport with sport_id 95*/
    (105, 663, 25),
    (107, 663, 1),
    (109, 664, 25),
    (111, 664, 3),
  /*finals for sport with sport_id 95*/
    (105, 665, 25),
    (109, 665, 3),
  /*eliminations for sport with sport_id 96*/
    (105, 666, 25),
    (106, 666, 3),
    (107, 667, 25),
    (108, 667, 5),
    (109, 668, 25),
    (110, 668, 1),
    (111, 669, 25),
    (112, 669, 3),
  /*semis for sport with sport_id 96*/
    (105, 670, 25),
    (107, 670, 1),
    (109, 671, 25),
    (111, 671, 3),
  /*finals for sport with sport_id 96*/
    (105, 672, 25),
    (109, 672, 3),
  /*eliminations for sport with sport_id 97*/
    (105, 673, 25),
    (106, 673, 3),
    (107, 674, 25),
    (108, 674, 5),
    (109, 675, 25),
    (110, 675, 1),
    (111, 676, 25),
    (112, 676, 3),
  /*semis for sport with sport_id 97*/
    (105, 677, 25),
    (107, 677, 1),
    (109, 678, 25),
    (111, 678, 3),
  /*finals for sport with sport_id 97*/
    (105, 679, 25),
    (109, 679, 3),
  /*eliminations for sport with sport_id 98*/
    (105, 680, 25),
    (106, 680, 3),
    (107, 681, 25),
    (108, 681, 5),
    (109, 682, 25),
    (110, 682, 1),
    (111, 683, 25),
    (112, 683, 3),
  /*semis for sport with sport_id 98*/
    (105, 684, 25),
    (107, 684, 1),
    (109, 685, 25),
    (111, 685, 3),
  /*finals for sport with sport_id 98*/
    (105, 686, 25),
    (109, 686, 3),
/*Matches of Game 15*/
  /*eliminations for sport with sport_id 99*/
    (113, 687, 25),
    (114, 687, 3),
    (115, 688, 25),
    (116, 688, 5),
    (117, 689, 25),
    (118, 689, 1),
    (119, 690, 25),
    (120, 690, 3),
  /*semis for sport with sport_id 99*/
    (113, 691, 25),
    (115, 691, 1),
    (117, 692, 25),
    (119, 692, 3),
  /*finals for sport with sport_id 99*/
    (113, 693, 25),
    (117, 693, 3),
  /*eliminations for sport with sport_id 100*/
    (113, 694, 25),
    (114, 694, 3),
    (115, 695, 25),
    (116, 695, 5),
    (117, 696, 25),
    (118, 696, 1),
    (119, 697, 25),
    (120, 697, 3),
  /*semis for sport with sport_id 100*/
    (113, 698, 25),
    (115, 698, 1),
    (117, 699, 25),
    (119, 699, 3),
  /*finals for sport with sport_id 100*/
    (113, 700, 25),
    (117, 700, 3),
  /*eliminations for sport with sport_id 101*/
    (113, 701, 25),
    (114, 701, 3),
    (115, 702, 25),
    (116, 702, 5),
    (117, 703, 25),
    (118, 703, 1),
    (119, 704, 25),
    (120, 704, 3),
  /*semis for sport with sport_id 101*/
    (113, 705, 25),
    (115, 705, 1),
    (117, 706, 25),
    (119, 706, 3),
  /*finals for sport with sport_id 101*/
    (113, 707, 25),
    (117, 707, 3),
  /*eliminations for sport with sport_id 102*/
    (113, 708, 25),
    (114, 708, 3),
    (115, 709, 25),
    (116, 709, 5),
    (117, 710, 25),
    (118, 710, 1),
    (119, 711, 25),
    (120, 711, 3),
  /*semis for sport with sport_id 102*/
    (113, 712, 25),
    (115, 712, 1),
    (117, 713, 25),
    (119, 713, 3),
  /*finals for sport with sport_id 102*/
    (113, 714, 25),
    (117, 714, 3),
  /*eliminations for sport with sport_id 103*/
    (113, 715, 25),
    (114, 715, 3),
    (115, 716, 25),
    (116, 716, 5),
    (117, 717, 25),
    (118, 717, 1),
    (119, 718, 25),
    (120, 718, 3),
  /*semis for sport with sport_id 103*/
    (113, 719, 25),
    (115, 719, 1),
    (117, 720, 25),
    (119, 720, 3),
  /*finals for sport with sport_id 103*/
    (113, 721, 25),
    (117, 721, 3),
  /*eliminations for sport with sport_id 104*/
    (113, 722, 25),
    (114, 722, 3),
    (115, 723, 25),
    (116, 723, 5),
    (117, 724, 25),
    (118, 724, 1),
    (119, 725, 25),
    (120, 725, 3),
  /*semis for sport with sport_id 104*/
    (113, 726, 25),
    (115, 726, 1),
    (117, 727, 25),
    (119, 727, 3),
  /*finals for sport with sport_id 104*/
    (113, 728, 25),
    (117, 728, 3),
  /*eliminations for sport with sport_id 105*/
    (113, 729, 25),
    (114, 729, 3),
    (115, 730, 25),
    (116, 730, 5),
    (117, 731, 25),
    (118, 731, 1),
    (119, 732, 25),
    (120, 732, 3),
  /*semis for sport with sport_id 105*/
    (113, 733, 25),
    (115, 733, 1),
    (117, 734, 25),
    (119, 734, 3),
  /*finals for sport with sport_id 105*/
    (113, 735, 25),
    (117, 735, 3),
/*Matches of Game 16*/
  /*eliminations for sport with sport_id 106*/
    (121, 736, 25),
    (122, 736, 3),
    (123, 737, 25),
    (124, 737, 5),
    (125, 738, 25),
    (126, 738, 1),
    (127, 739, 25),
    (128, 739, 3),
  /*semis for sport with sport_id 106*/
    (121, 740, 25),
    (123, 740, 1),
    (125, 741, 25),
    (127, 741, 3),
  /*finals for sport with sport_id 106*/
    (121, 742, 25),
    (125, 742, 3),
  /*eliminations for sport with sport_id 107*/
    (121, 743, 25),
    (122, 743, 3),
    (123, 744, 25),
    (124, 744, 5),
    (125, 745, 25),
    (126, 745, 1),
    (127, 746, 25),
    (128, 746, 3),
  /*semis for sport with sport_id 107*/
    (121, 747, 25),
    (123, 747, 1),
    (125, 748, 25),
    (127, 748, 3),
  /*finals for sport with sport_id 107*/
    (121, 749, 25),
    (125, 749, 3),
  /*eliminations for sport with sport_id 108*/
    (121, 750, 25),
    (122, 750, 3),
    (123, 751, 25),
    (124, 751, 5),
    (125, 752, 25),
    (126, 752, 1),
    (127, 753, 25),
    (128, 753, 3),
  /*semis for sport with sport_id 108*/
    (121, 754, 25),
    (123, 754, 1),
    (125, 755, 25),
    (127, 755, 3),
  /*finals for sport with sport_id 108*/
    (121, 756, 25),
    (125, 756, 3),
  /*eliminations for sport with sport_id 109*/
    (121, 757, 25),
    (122, 757, 3),
    (123, 758, 25),
    (124, 758, 5),
    (125, 759, 25),
    (126, 759, 1),
    (127, 760, 25),
    (128, 760, 3),
  /*semis for sport with sport_id 109*/
    (121, 761, 25),
    (123, 761, 1),
    (125, 762, 25),
    (127, 762, 3),
  /*finals for sport with sport_id 109*/
    (121, 763, 25),
    (125, 763, 3),
  /*eliminations for sport with sport_id 110*/
    (121, 764, 25),
    (122, 764, 3),
    (123, 765, 25),
    (124, 765, 5),
    (125, 766, 25),
    (126, 766, 1),
    (127, 767, 25),
    (128, 767, 3),
  /*semis for sport with sport_id 110*/
    (121, 768, 25),
    (123, 768, 1),
    (125, 769, 25),
    (127, 769, 3),
  /*finals for sport with sport_id 110*/
    (121, 770, 25),
    (125, 770, 3),
  /*eliminations for sport with sport_id 111*/
    (121, 771, 25),
    (122, 771, 3),
    (123, 772, 25),
    (124, 772, 5),
    (125, 773, 25),
    (126, 773, 1),
    (127, 774, 25),
    (128, 774, 3),
  /*semis for sport with sport_id 111*/
    (121, 775, 25),
    (123, 775, 1),
    (125, 776, 25),
    (127, 776, 3),
  /*finals for sport with sport_id 111*/
    (121, 777, 25),
    (125, 777, 3),
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
    (125, 784, 3);