#!/bin/bash
mysql -uroot -p < tables.sql     && echo "Created Tables"                  && 
mysql -uroot -p < data.sql       && echo "Inserted Dummy Data"