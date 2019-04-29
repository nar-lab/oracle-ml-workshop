#!/bin/bash

mysql -h "localhost" -u "root" "-pwelcome1" "information_schema" < 01_retail_db_import.sql
mysql -h "localhost" -u "root" "-pwelcome1" "information_schema" < 02_retail_db.sql

#./03_retail_db_to_hive_all.sh
./03_retail_db_to_hive.sh

exit | sqlplus -S odmuser/welcome1@ORCL @04_retail_map_oracle_externals.sql
