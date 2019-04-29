load data 
infile 'data_files/order.csv' "str '\r\n'"
append
into table BERKA_ORDER
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( order_id CHAR(4000),
             account_id CHAR(4000),
             bank_to CHAR(4000),
             account_to CHAR(4000),
             amount CHAR(4000),
             k_symbol CHAR(4000)
           )
