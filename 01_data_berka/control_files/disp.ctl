load data 
infile 'data_files/disp.csv' "str '\r\n'"
append
into table berka_disp
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( disp_id CHAR(4000),
             client_id CHAR(4000),
             account_id CHAR(4000),
             type CHAR(4000)
           )
