#!/bin/bash
echo "----------------------------------------------------Enter mysql ROOT password"
mysql -uroot -p < tables.sql     && echo "Created Tables"                  && 
mysql -uCMSC128 -pproject128 < data.sql       && echo "Inserted Dummy Data"
