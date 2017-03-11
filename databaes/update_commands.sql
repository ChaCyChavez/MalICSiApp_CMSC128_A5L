update account set
    email = ?,
    username = ?,
    password = ?,
    firstname = ?,
    middlename = ?,
    lastname = ?,
    course = ?,
    birthday = ?,
    college = ?,
    status = ?
where account id = ?;


update game set 
    game_name = ?,
    game_place = ?,
    game_starting_time_date = ?,
    game_ending_time_date = ?
where game_id = ?;

update team set
    team_name = ?,
    team_color = ?,
    team_coach = ?
where team_id = ?;

update player set
    player_jersey_number = ?,
    is_coach = ?,
    game_id = ?
where player_id = ?;

update court set
    court_name = ?,
    court_location = ?,
    court_type = ?
where court_id = ?;

update sport set
    sport_type_name = ?,
    number_of_participants = ?,
    date_time = ?,
    division = ?,
    court_id = ?
where sport_id = ?;

update sponsor set
    sponsor_name = ?,
    sponsor_affiliation = ?,
    sponsor_logo = ?
where sponsor_id = ?;

update score set
    winning_team = ?,
    series = ?,
    winning_team = ?,
    losing_team = ?
where sponsor_id = ?;

update game_game_type set
    game_type = ?
where game_id = ? and game_type = ?;