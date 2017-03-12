#!/bin/bash
echo "[root password]"			 &&
mysql -uroot -p < tables.sql     && echo "Created Tables"                  && 
echo "[root password]"			 &&
mysql -uroot -p < data.sql       && echo "Inserted Dummy Data"