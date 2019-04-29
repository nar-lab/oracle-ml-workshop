load data 
infile 'data_files/account.csv' "str '\r\n'"
append
into table berka_account
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( account_id CHAR(4000),
             district_id CHAR(4000),
             frequency CHAR(4000),
             account_date CHAR(4000)
           )
