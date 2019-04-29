DROP DATABASE IF EXISTS bank_db CASCADE;
CREATE DATABASE bank_db;

USE bank_db;

DROP TABLE IF EXISTS ad_web_data;

CREATE TABLE ad_web_data
        (
            userid int,
            adid int,
            productid int,
            event string,
            datestamp timestamp
        )
   COMMENT 'Ad Web Data'
   ROW FORMAT DELIMITED
   FIELDS TERMINATED BY '\t'
   LINES TERMINATED BY '\n'
   STORED AS TEXTFILE
   tblproperties("skip.header.line.count"="1");
   
LOAD DATA LOCAL INPATH '/home/oracle/Downloads/bank_data/ad_web_data.txt' OVERWRITE INTO TABLE ad_web_data;

DROP TABLE IF EXISTS bank_web_data;

CREATE TABLE bank_web_data
        (
            customer_id int,
            sessionid int,
            page string, 
            datestamp timestamp
        )
   COMMENT 'Bank Web Data'
   ROW FORMAT DELIMITED
   FIELDS TERMINATED BY '\t'
   LINES TERMINATED BY '\n'
   STORED AS TEXTFILE
   tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/home/oracle/Downloads/bank_data/bank_web_data.txt' OVERWRITE INTO TABLE bank_web_data;


DROP TABLE IF EXISTS retail_web_data;

CREATE TABLE retail_web_data
        (
            cookie_id int,
            sessionid int,
            productid int, 
	    page string,
	    search_keyword string,
            datestamp timestamp
        )
   COMMENT 'Retail Web Data'
   ROW FORMAT DELIMITED
   FIELDS TERMINATED BY '\t'
   LINES TERMINATED BY '\n'
   STORED AS TEXTFILE
   tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/home/oracle/Downloads/bank_data/retail_web_data.txt' OVERWRITE INTO TABLE retail_web_data;


 
                  
