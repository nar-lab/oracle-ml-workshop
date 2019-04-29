load data 
infile 'data_files/client.csv' "str '\r\n'"
append
into table berka_client
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( client_id CHAR(4000),
             birth_number CHAR(4000),
             district_id CHAR(4000)
           )
