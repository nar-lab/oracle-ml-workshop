#!/bin/bash

hive -e "DROP TABLE retail_db.categories;"
hive -e "DROP TABLE retail_db.departments;"
hive -e "DROP TABLE retail_db.products;"
hive -e "DROP TABLE retail_db.customers;"
hive -e "DROP TABLE retail_db.orders;"
hive -e "DROP TABLE retail_db.order_items;"
hive -e "DROP DATABASE retail_db;"

sqoop import-all-tables \
    -m 1 \
    --connect jdbc:mysql://localhost:3306/retail_db \
    --username=retail_dba \
    --password=welcome1 \
    --compression-codec=snappy \
    --as-parquetfile \
    --warehouse-dir=/user/hive/warehouse \
    --hive-database retail_db \
    --hive-import

