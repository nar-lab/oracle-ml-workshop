load data 
infile 'data_files/card.csv' "str '\r\n'"
append
into table berka_card
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( card_id CHAR(4000),
             disp_id CHAR(4000),
             type CHAR(4000),
             issued CHAR(4000)
           )
