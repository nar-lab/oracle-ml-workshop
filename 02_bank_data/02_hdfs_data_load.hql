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
            datestamp timestamp,
            datesta string
        )
   COMMENT 'Ad Web Data'
   PARTITIONED BY(year int, month int)
   ROW FORMAT DELIMITED
   FIELDS TERMINATED BY ','
   LINES TERMINATED BY '\n'
   STORED AS TEXTFILE;
   
LOAD DATA INPATH '/user/oracle/bank_data/ads/2009-02.txt' INTO TABLE ad_web_data PARTITION(year=2009,month=2);
LOAD DATA INPATH '/user/oracle/bank_data/ads/2009-03.txt' INTO TABLE ad_web_data PARTITION(year=2009,month=3);
LOAD DATA INPATH '/user/oracle/bank_data/ads/2009-04.txt' INTO TABLE ad_web_data PARTITION(year=2009,month=4);
LOAD DATA INPATH '/user/oracle/bank_data/ads/2009-05.txt' INTO TABLE ad_web_data PARTITION(year=2009,month=5);
LOAD DATA INPATH '/user/oracle/bank_data/ads/2009-06.txt' INTO TABLE ad_web_data PARTITION(year=2009,month=6);
LOAD DATA INPATH '/user/oracle/bank_data/ads/2009-07.txt' INTO TABLE ad_web_data PARTITION(year=2009,month=7);
LOAD DATA INPATH '/user/oracle/bank_data/ads/2009-08.txt' INTO TABLE ad_web_data PARTITION(year=2009,month=8);
LOAD DATA INPATH '/user/oracle/bank_data/ads/2009-09.txt' INTO TABLE ad_web_data PARTITION(year=2009,month=9);


DROP TABLE IF EXISTS bank_web_data;

CREATE TABLE bank_web_data
        (
            customer_id int,
            sessionid int,
            page string, 
            datestamp timestamp,
            datesta string
        )
   COMMENT 'Bank Web Data'
   PARTITIONED BY(year int, month int)
   ROW FORMAT DELIMITED
   FIELDS TERMINATED BY ','
   LINES TERMINATED BY '\n'
   STORED AS TEXTFILE;

LOAD DATA INPATH '/user/oracle/bank_data/banks/2004-03.txt' INTO TABLE bank_web_data PARTITION(year=2004,month=3);
LOAD DATA INPATH '/user/oracle/bank_data/banks/2004-04.txt' INTO TABLE bank_web_data PARTITION(year=2004,month=4);
LOAD DATA INPATH '/user/oracle/bank_data/banks/2004-05.txt' INTO TABLE bank_web_data PARTITION(year=2004,month=5);


DROP TABLE IF EXISTS retail_web_data;

CREATE TABLE retail_web_data
        (
            cookie_id int,
            sessionid int,
            productid int,
	    page string,
	    search_keyword string,
            datestamp timestamp,
	    datesta string
        )
   COMMENT 'Retail Web Data'
   PARTITIONED BY(year int, month int)
   ROW FORMAT DELIMITED
   FIELDS TERMINATED BY ','
   LINES TERMINATED BY '\n'
   STORED AS TEXTFILE;

LOAD DATA INPATH '/user/oracle/bank_data/retails/2009-03.txt' INTO TABLE retail_web_data PARTITION(year=2009,month=3);
LOAD DATA INPATH '/user/oracle/bank_data/retails/2009-04.txt' INTO TABLE retail_web_data PARTITION(year=2009,month=4);
LOAD DATA INPATH '/user/oracle/bank_data/retails/2009-05.txt' INTO TABLE retail_web_data PARTITION(year=2009,month=5);
LOAD DATA INPATH '/user/oracle/bank_data/retails/2009-06.txt' INTO TABLE retail_web_data PARTITION(year=2009,month=6);
LOAD DATA INPATH '/user/oracle/bank_data/retails/2009-07.txt' INTO TABLE retail_web_data PARTITION(year=2009,month=7);
LOAD DATA INPATH '/user/oracle/bank_data/retails/2009-08.txt' INTO TABLE retail_web_data PARTITION(year=2009,month=8);
LOAD DATA INPATH '/user/oracle/bank_data/retails/2009-09.txt' INTO TABLE retail_web_data PARTITION(year=2009,month=9);

CREATE INDEX idx_ad_adid ON TABLE ad_web_data (adid) AS 'BITMAP' WITH DEFERRED REBUILD;
CREATE INDEX idx_ad_event ON TABLE ad_web_data (event) AS 'BITMAP' WITH DEFERRED REBUILD;
 
CREATE INDEX idx_bank_page ON TABLE bank_web_data (page) AS 'COMPACT' WITH DEFERRED REBUILD;

CREATE INDEX idx_retail_pid ON TABLE retail_web_data(productid) AS 'COMPACT' WITH DEFERRED REBUILD; 
CREATE INDEX idx_retail_page ON TABLE retail_web_data (page) AS 'COMPACT' WITH DEFERRED REBUILD;
