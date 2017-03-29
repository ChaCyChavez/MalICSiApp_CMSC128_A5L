#!/bin/bash
echo "----------------------------------------------------Enter mysql ROOT password"
mysql -uroot -p < tables.sql     							&& echo "Created Tables"				&& 
mysql -uCMSC128 -pproject128 < create_procedures.sql		&& echo "Inserted Create Procedures"	&&	
mysql -uCMSC128 -pproject128 < retrieve_procedures.sql		&& echo "Inserted Retrieve Procedures"	&&	
mysql -uCMSC128 -pproject128 < update_procedures.sql		&& echo "Inserted Update Procedures"	&&	
mysql -uCMSC128 -pproject128 < delete_procedures.sql		&& echo "Inserted Delete Procedures"	&&	
mysql -uCMSC128 -pproject128 < triggers.sql					&& echo "Inserted Triggers"				&&	
mysql -uCMSC128 -pproject128 < dummy_data.sql				&& echo "Inserted Dummy Data"			