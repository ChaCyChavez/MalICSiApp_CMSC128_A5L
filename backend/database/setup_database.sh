#!/bin/bash
echo "[mysql root password]"			 &&
mysql -uroot -p < tables.sql     && echo "Created Tables"                  && 
echo "[mysql root password]"			 &&
mysql -uroot -p < data.sql       && echo "Inserted Dummy Data"
