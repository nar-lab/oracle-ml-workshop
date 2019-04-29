drop database if exists retail_db;
grant usage on *.* to retail_dba identified by 'welcome1';
drop user retail_dba;
create database retail_db;
create user retail_dba identified by 'welcome1';
grant all on retail_db.* to retail_dba;
flush privileges;



