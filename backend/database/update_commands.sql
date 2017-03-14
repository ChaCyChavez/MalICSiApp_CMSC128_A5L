UPDATE accountset email = ?, username = ?, password = ?, firstname = ?, middlename = ?, lastname = ?, course = ?, birthday = ?, college = ?, status = ? WHERE account id = ?;
UPDATE gameset game_name = ?, game_place = ?, game_starting_time_date = ?, game_ending_time_date = ? WHERE game_id = ?;
UPDATE teamset team_name = ?, team_color = ?, team_coach = ? WHERE team_id = ?;
UPDATE playerset player_jersey_number = ?, is_coach = ?, game_id = ? WHERE player_id = ?;
UPDATE courtset court_name = ?, court_location = ?, court_type = ? WHERE court_id = ?;
UPDATE sportset sport_type_name = ?, number_of_participants = ?, date_time = ?, division = ?, court_id = ? WHERE sport_id = ?;
UPDATE sponsorset sponsor_name = ?, sponsor_affiliation = ?, sponsor_logo = ? WHERE sponsor_id = ?; 
UPDATE scoreset winning_team = ?, series = ?, winning_team = ?, losing_team = ? WHERE score_id = ?;
UPDATE game_game_typeset game_type = ? WHERE game_id = ? AND game_type = ?;