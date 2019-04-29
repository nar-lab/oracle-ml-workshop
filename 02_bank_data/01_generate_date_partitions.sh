#!/bin/bash

rm -rf ads
rm -rf banks
rm -rf retails

mkdir -p ads
mkdir -p banks
mkdir -p retails

awk -F"\t" 'NR > 1{print $1","$2","$3","$4","$5","substr($5,1,7) >> "ads/"substr($5,1,7)".txt"}' ad_web_data.txt

awk -F"\t" 'NR > 1{print $1","$2","$3","$4","substr($4,1,7) >> "banks/"substr($4,1,7)".txt"}'  bank_web_data.txt 

awk -F"\t" 'NR > 1{print $1","$2","$3","$4","$5","$6","substr($6,1,7) >> "retails/"substr($6,1,7)".txt"}' retail_web_data.txt 

hadoop fs -rm -r /user/oracle/bank_data
hadoop fs -mkdir -p /user/oracle/bank_data
hadoop fs -put -p ads /user/oracle/bank_data
hadoop fs -put -p banks /user/oracle/bank_data
hadoop fs -put -p retails /user/oracle/bank_data

rm -rf ads
rm -rf banks
rm -rf retails
