load data 
infile 'data_files/trans.csv' "str '\r\n'"
append
into table berka_trx
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( trans_id CHAR(4000),
             account_id CHAR(4000),
             trx_date CHAR(4000),
             type CHAR(4000),
             operation CHAR(4000),
             amount CHAR(4000),
             balance CHAR(4000),
             k_symbol CHAR(4000),
             bank CHAR(4000),
             account CHAR(4000)
           )
