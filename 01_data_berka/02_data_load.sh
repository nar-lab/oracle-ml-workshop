#!/bin/bash

echo "######### Refreshing DB schema...."
echo "Please wait...."
echo exit | sqlplus -S ziraat/teknoloji@ORCL @02_table_schemas.sql
echo "######### DONE DB schema...."
printf "\n\n"

echo "######### BERKA_ACCOUNT"
echo "Loading Account Table...."
echo "Please wait...."
sqlldr odmuser/welcome1@ORCL CONTROL=control_files/account.ctl LOG=logs/account.log BAD=bad_records/account.bad silent=ALL skip=1 
cat logs/account.log | grep 'Rows' | awk -F" " '{if(NR==2){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else if(NR==3){if($1 > 0){ print "Finished with errors: " $1 " records.";}} else if(NR==4){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else {print "Finished successfully: " $1 " records.";}}'
echo "######### BERKA_ACCOUNT DONE"
printf "\n\n"		

echo "######### BERKA_CARD"
echo "Loading Card Table...."
echo "Please wait...."
sqlldr odmuser/welcome1@ORCL CONTROL=control_files/card.ctl LOG=logs/card.log BAD=bad_records/acard.bad silent=ALL skip=1 
cat logs/card.log | grep 'Rows' | awk -F" " '{if(NR==2){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else if(NR==3){if($1 > 0){ print "Finished with errors: " $1 " records.";}} else if(NR==4){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else {print "Finished  successfully: " $1 " records.";}}'
echo "######### BERKA_CARD DONE"
printf "\n\n"

echo "######### BERKA_CLIENT"
echo "Loading Client Table...."
echo "Please wait...."
sqlldr odmuser/welcome1@ORCL CONTROL=control_files/client.ctl LOG=logs/client.log BAD=bad_records/aclient.bad silent=ALL skip=1 
cat logs/client.log | grep 'Rows' | awk -F" " '{if(NR==2){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else if(NR==3){if($1 > 0){ print "Finished with errors: " $1 " records.";}} else if(NR==4){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else {print "Finished successfully: " $1 " records.";}}'
echo "######### BERKA_CLIENT DONE"
printf "\n\n"

echo "######### BERKA_DISP"
echo "Loading Disp Table...."
echo "Please wait...."
sqlldr odmuser/welcome1@ORCL CONTROL=control_files/disp.ctl LOG=logs/disp.log BAD=bad_records/disp.bad silent=ALL skip=1 
cat logs/disp.log | grep 'Rows' | awk -F" " '{if(NR==2){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else if(NR==3){if($1 > 0){ print "Finished with errors: " $1 " records.";}} else if(NR==4){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else {print "Finished successfully: " $1 " records.";}}'
echo "######### BERKA_DISP DONE"
printf "\n\n"

echo "######### BERKA_LOAN"
echo "Loading Loan Table...."
echo "Please wait...."
sqlldr odmuser/welcome1@ORCL CONTROL=control_files/loan.ctl LOG=logs/loan.log BAD=bad_records/loan.bad silent=ALL skip=1  
cat logs/loan.log | grep 'Rows' | awk -F" " '{if(NR==2){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else if(NR==3){if($1 > 0){ print "Finished with errors: " $1 " records.";}} else if(NR==4){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else {print "Finished successfully: " $1 " records.";}}'
echo "######### BERKA_LOAN DONE"
printf "\n\n"

echo "######### BERKA_ORDER"
echo "Loading Order Table...."
echo "Please wait...."
sqlldr odmuser/welcome1@ORCL CONTROL=control_files/order.ctl LOG=logs/order.log BAD=bad_records/order.bad silent=ALL skip=1  
cat logs/order.log | grep 'Rows' | awk -F" " '{if(NR==2){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else if(NR==3){if($1 > 0){ print "Finished with errors: " $1 " records.";}} else if(NR==4){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else {print "Finished successfully: " $1 " records.";}}'
echo "######### BERKA_ORDER DONE"
printf "\n\n"

echo "######### BERKA_TRX"
echo "Loading Transaction Table...."
echo "Please wait...."
sqlldr odmuser/welcome1@ORCL CONTROL=control_files/trans.ctl LOG=logs/trans.log BAD=bad_records/trans.bad silent=ALL skip=1
cat logs/trans.log | grep 'Rows' | awk -F" " '{if(NR==2){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else if(NR==3){if($1 > 0){ print "Finished with errors: " $1 " records.";}} else if(NR==4){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else {print "Finished successfully: " $1 " records.";}}'
echo "######### BERKA_TRX DONE"
printf "\n\n"

echo "######### BERKA_DISTRICT"
echo "Loading District Table...."
echo "Please wait...."
sqlldr odmuser/welcome1@ORCL CONTROL=control_files/district.ctl LOG=logs/district.log BAD=bad_records/district.bad silent=ALL skip=1
cat logs/district.log | grep 'Rows' | awk -F" " '{if(NR==2){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else if(NR==3){if($1 > 0){ print "Finished with errors: " $1 " records.";}} else if(NR==4){ if($1 > 0){ print "Finished with errors: " $1 " records.";}}else {print "Finished successfully: " $1 " records.";}}'
echo "######### BERKA_DISTRICT DONE"
printf "\n\n"


echo "BYE...."
