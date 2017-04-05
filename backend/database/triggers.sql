
use malicsi;

-- trigger after creating an account 
\d //
DROP TRIGGER IF EXISTS accountCreate//
    CREATE TRIGGER accountCreate
    AFTER INSERT ON account 
    FOR EACH ROW
    CALL add_activity_log(" created his/her account!", NEW.account_id);
//

-- trigger after updating an account 
DROP TRIGGER IF EXISTS accountUpdate//
    CREATE TRIGGER accountUpdate
    AFTER UPDATE ON account
    FOR EACH ROW
    CALL add_activity_log(" updated his/her account!", NEW.account_id);
//

-- trigger after deleting an account 
DROP TRIGGER IF EXISTS accountDelete//
    CREATE TRIGGER accountDelete
    AFTER DELETE ON account
    FOR EACH ROW
    CALL add_activity_log(" deleted his/her account!", OLD.account_id);
//

-- trigger after a game_head created a game_event 
DROP TRIGGER IF EXISTS game_eventCreate//
    CREATE TRIGGER game_eventCreate
    AFTER INSERT ON game_event 
    FOR EACH ROW
    CALL add_activity_log(" created a game_event!", NEW.account_id);
//

-- trigger after a game_head updated a game_event 
DROP TRIGGER IF EXISTS game_eventUpdate//
    CREATE TRIGGER game_eventUpdate
    AFTER UPDATE ON game_event
    FOR EACH ROW
    CALL add_activity_log(" updated a game_event!", OLD.account_id);
//

-- trigger after a game_head deleted a game_event 
DROP TRIGGER IF EXISTS game_eventDelete//
    CREATE TRIGGER game_eventDelete
    AFTER DELETE ON game_event
    FOR EACH ROW
    CALL add_activity_log(" deleted a game_event!", OLD.account_id);
//

-- trigger after a player joined a team 
DROP TRIGGER IF EXISTS team_accountCreate//
    CREATE TRIGGER team_accountCreate
    AFTER INSERT ON team_account 
    FOR EACH ROW
    CALL add_activity_log(" joined a Team!", NEW.account_id);
//

-- trigger after a player updated which team he/she joined
DROP TRIGGER IF EXISTS team_accountUpdate//
    CREATE TRIGGER team_accountUpdate
    AFTER UPDATE ON team_account
    FOR EACH ROW
    CALL add_activity_log(" updated which team he/she joined!", NEW.account_id);
//

-- trigger after a player deleted which team he/she joined
DROP TRIGGER IF EXISTS team_accountDelete//
    CREATE TRIGGER team_accountDelete
    AFTER DELETE ON team_account
    FOR EACH ROW
    CALL add_activity_log(" deleted which team he/she joined!", OLD.account_id);
//
\d ; 

