#!/bin/bash

echo "######### Creating User...."
echo "Please wait...."
echo exit | sqlplus -S SYS/welcome1@ORCL AS SYSDBA @01_create_user.sql
echo "######### DONE USER AND GRANTS...."
printf "\n\n"

