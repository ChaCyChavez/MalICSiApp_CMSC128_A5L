use malicsi;

\d //
--trigger after creating an account 
DROP TRIGGER IF EXISTS accountCreate//
    CREATE TRIGGER accountCreate
    AFTER INSERT ON account 
    FOR EACH ROW
    CALL add_log("Created an account!", NEW.account_id);
//

--trigger after updating an account 
DROP TRIGGER IF EXISTS accountUpdate//
    CREATE TRIGGER accountUpdate
    AFTER UPDATE ON account
    FOR EACH ROW
    CALL add_log("Updated an account!", NEW.account_id);
//

--trigger after deleting an account 
DROP TRIGGER IF EXISTS accountDelete//
    CREATE TRIGGER accountDelete
    AFTER DELETE ON account
    FOR EACH ROW
    CALL add_log("Deleted an account!", OLD.account_id);
//

--trigger after creating a game_event 
DROP TRIGGER IF EXISTS game_eventCreate//
    CREATE TRIGGER game_eventCreate
    AFTER INSERT ON game_event 
    FOR EACH ROW
    CALL add_log("Created a game_event!", NEW.account_id);
//

--trigger after updating a game_event 
DROP TRIGGER IF EXISTS game_eventUpdate//
    CREATE TRIGGER game_eventUpdate
    AFTER UPDATE ON game_event
    FOR EACH ROW
    CALL add_log("Updated a game_event!", OLD.account_id);
//

--trigger after deleting a game_event 
DROP TRIGGER IF EXISTS game_eventDelete//
    CREATE TRIGGER game_eventDelete
    AFTER DELETE ON game_event
    FOR EACH ROW
    CALL add_log("Deleted a game_event!", OLD.account_id);
//

--trigger after a player joined a team 
DROP TRIGGER IF EXISTS team_accountCreate//
    CREATE TRIGGER team_account
    AFTER INSERT ON team_account 
    FOR EACH ROW
    CALL add_log("Player JOINED a Team!", NEW.account_id);
//

--trigger after a player updated which team he/she joined
DROP TRIGGER IF EXISTS team_accountUpdate//
    CREATE TRIGGER team_accountUpdate
    AFTER UPDATE ON team_account
    FOR EACH ROW
    CALL add_log("Player updated which team he/she joined!", NEW.account_id);
//

--trigger after a player deleted which team he/she joined
DROP TRIGGER IF EXISTS team_accountDelete//
    CREATE TRIGGER team_accountDelete
    AFTER DELETE ON team_account
    FOR EACH ROW
    CALL add_log("Player deleted which team he/she joined!", OLD.account_id);
//
/*
--trigger after creating a court 
DROP TRIGGER IF EXISTS courtCreate//
    CREATE TRIGGER courtCreate
    AFTER INSERT ON court 
    FOR EACH ROW
    CALL add_log("Created a court!", NEW.court_id);
//

--trigger after updating a court 
DROP TRIGGER IF EXISTS courtUpdate//
    CREATE TRIGGER courtUpdate
    AFTER UPDATE ON court
    FOR EACH ROW
    CALL add_log("Updated a court!", NEW.court_id);
//

--trigger after deleting an court 
DROP TRIGGER IF EXISTS courtDelete//
    CREATE TRIGGER courtDelete
    AFTER DELETE ON court
    FOR EACH ROW
    CALL add_log("Deleted a court!", OLD.court_id);
//

--trigger after creating a sponsor 
DROP TRIGGER IF EXISTS sponsorCreate//
    CREATE TRIGGER sponsorCreate
    AFTER INSERT ON sponsor 
    FOR EACH ROW
    CALL add_log("Created a sponsor!", NEW.sponsor_id);
//

--trigger after updating a sponsor 
DROP TRIGGER IF EXISTS sponsorUpdate//
    CREATE TRIGGER sponsorUpdate
    AFTER UPDATE ON sponsor
    FOR EACH ROW
    CALL add_log("Updated a sponsor!", NEW.sponsor_id);
//

--trigger after deleting an sponsor 
DROP TRIGGER IF EXISTS sponsorDelete//
    CREATE TRIGGER sponsorDelete
    AFTER DELETE ON court
    FOR EACH ROW
    CALL add_log("Deleted a sponsor!", OLD.sponsor_id);
//
*/\d ; 

