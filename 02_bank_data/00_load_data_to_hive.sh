#!/bin/bash

./01_generate_date_partitions.sh
#hive -f 02_local_data_load.hql
hive -f 02_hdfs_data_load.hql
