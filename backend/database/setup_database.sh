#!/bin/bash
read -p "Enter mysql root password: " user
mysql -uroot -p"$user" < tables.sql     			&& echo "Created Tables"				&&
mysql -uroot -p"$user" < create_procedures.sql		&& echo "Inserted Create Procedures"	&&
mysql -uroot -p"$user" < retrieve_procedures.sql	&& echo "Inserted Retrieve Procedures"	&&
mysql -uroot -p"$user" < update_procedures.sql		&& echo "Inserted Update Procedures"	&&
mysql -uroot -p"$user" < delete_procedures.sql		&& echo "Inserted Delete Procedures"	&&
mysql -uroot -p"$user" < triggers.sql				&& echo "Inserted Triggers"				&&
mysql -uroot -p"$user" < dummy_data.sql				&& echo "Inserted Dummy Data"
