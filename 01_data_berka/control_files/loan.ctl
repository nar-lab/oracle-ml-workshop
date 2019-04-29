load data 
infile 'data_files/loan.csv' "str '\r\n'"
append
into table BERKA_LOAN
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( loan_id CHAR(4000),
             account_id CHAR(4000),
             loan_date CHAR(4000),
             amount CHAR(4000),
             duration CHAR(4000),
             payments CHAR(4000),
             status CHAR(4000)
           )
