#!/bin/bash

R CMD BATCH --no-save --no-restore 01_json_data_load.R 01_json_data_load.Rout

hadoop fs -rm -r  /user/oracle/jsonfiles
hadoop fs -mkdir -p /user/oracle/jsonfiles
hadoop fs -copyFromLocal world_bank.json /user/oracle/jsonfiles
hadoop fs -copyFromLocal stocks.json /user/oracle/jsonfiles 
hadoop fs -copyFromLocal companies.json /user/oracle/jsonfiles

exit | sqlplus -S ZIRAAT/teknoloji@ORCL @05_json_data_oracle_map.sql

