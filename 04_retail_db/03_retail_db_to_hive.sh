#!/bin/bash

hive -e "DROP TABLE retail_db.categories;"
hive -e "DROP TABLE retail_db.departments;"
hive -e "DROP TABLE retail_db.products;"
hive -e "DROP TABLE retail_db.customers;"
hive -e "DROP TABLE retail_db.orders;"
hive -e "DROP TABLE retail_db.order_items;"
hive -e "DROP DATABASE retail_db;"


sqoop import \
    -m 1 \
    --connect jdbc:mysql://localhost:3306/retail_db \
    --username=retail_dba \
    --password=welcome1 \
    --compression-codec=snappy \
    --as-parquetfile \
    --warehouse-dir=/user/hive/warehouse \
    --table "categories" \
    --hive-database retail_db \
    --hive-table categories \
    --hive-import \
    --driver com.mysql.jdbc.Driver 

sqoop import \
    -m 1 \
    --connect jdbc:mysql://localhost:3306/retail_db \
    --username=retail_dba \
    --password=welcome1 \
    --compression-codec=snappy \
    --as-parquetfile \
    --warehouse-dir=/user/hive/warehouse \
    --table "products" \
    --hive-database retail_db \
    --hive-table products \
    --hive-import \
    --driver com.mysql.jdbc.Driver 

sqoop import \
    -m 1 \
    --connect jdbc:mysql://localhost:3306/retail_db \
    --username=retail_dba \
    --password=welcome1 \
    --compression-codec=snappy \
    --as-parquetfile \
    --warehouse-dir=/user/hive/warehouse \
    --table "departments" \
    --hive-database retail_db \
    --hive-table departments \ 
    --hive-import \
    --driver com.mysql.jdbc.Driver 

sqoop import \
    -m 1 \
    --connect jdbc:mysql://localhost:3306/retail_db \
    --username=retail_dba \
    --password=welcome1 \
    --compression-codec=snappy \
    --as-parquetfile \
    --warehouse-dir=/user/hive/warehouse \
    --table "customers" \
    --hive-database retail_db \
    --hive-table customers \
    --hive-import \
    --driver com.mysql.jdbc.Driver 


sqoop import \
    -m 1 \
    --connect jdbc:mysql://localhost:3306/retail_db \
    --username=retail_dba \
    --password=welcome1 \
    --compression-codec=snappy \
    --as-parquetfile \
    --warehouse-dir=/user/hive/warehouse \
    --table "orders" \
    --hive-database retail_db \
    --hive-table orders \
    --hive-import \
    --driver com.mysql.jdbc.Driver 


sqoop import \
    -m 1 \
    --connect jdbc:mysql://localhost:3306/retail_db \
    --username=retail_dba \
    --password=welcome1 \
    --compression-codec=snappy \
    --as-parquetfile \
    --warehouse-dir=/user/hive/warehouse \
    --table "order_items" \
    --hive-database retail_db \
    --hive-table order_items \
    --hive-import \
    --driver com.mysql.jdbc.Driver 

  

