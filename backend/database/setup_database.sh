#!/bin/bash
echo "-------------Enter mysql ROOT password"
mysql -uroot -p < tables.sql     							&& echo "Created Tables"				&&
mysql -uroot -proot < create_procedures.sql		&& echo "Inserted Create Procedures"	&&
mysql -uroot -proot < retrieve_procedures.sql		&& echo "Inserted Retrieve Procedures"	&&
mysql -uroot -proot < update_procedures.sql		&& echo "Inserted Update Procedures"	&&
mysql -uroot -proot < delete_procedures.sql		&& echo "Inserted Delete Procedures"	&&
mysql -uroot -proot < triggers.sql					&& echo "Inserted Triggers"				&&
mysql -uroot -proot < dummy_data.sql				&& echo "Inserted Dummy Data"
