load data 
infile 'data_files/district.csv' "str '\r\n'"
append
into table BERKA_DISTRICT
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( district_id CHAR(4000),
             district_name CHAR(4000),
             region CHAR(4000),
             num_of_inhab CHAR(4000),
             num_of_inhab_l5 CHAR(4000),
             num_of_inhab_5_2k CHAR(4000),
             num_of_inhab_2k_10k CHAR(4000),
             num_of_inhab_u10k CHAR(4000),
             num_of_cities CHAR(4000),
             ratio_of_urb_inh CHAR(4000),
             avg_salary CHAR(4000),
             unemp_rate_95 CHAR(4000),
             unemp_rate_96 CHAR(4000),
             num_of_enterp CHAR(4000),
             num_of_comm_crime_95 CHAR(4000),
             num_of_comm_crime_96 CHAR(4000)
           )
