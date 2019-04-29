SET DEFINE OFF
DROP TABLE berka_account;
CREATE TABLE berka_account ( 
    account_id NUMBER(10),
    district_id NUMBER(10),
    frequency VARCHAR2(100),
    account_date NUMBER(8)
    );

DROP TABLE berka_card;
CREATE TABLE berka_card ( 
    card_id NUMBER(10),
    disp_id NUMBER(10),
    type VARCHAR2(100),
    issued VARCHAR2(26)
    );

DROP TABLE berka_client;
CREATE TABLE berka_client ( 
    client_id NUMBER(10),
    birth_number NUMBER(8),
    district_id NUMBER(10)
    );

DROP TABLE berka_disp;
CREATE TABLE berka_disp ( 
    disp_id NUMBER(10),
    client_id NUMBER(10),
    account_id NUMBER(10),
    type VARCHAR2(100)
    );

DROP TABLE BERKA_LOAN;
CREATE TABLE BERKA_LOAN ( 
    loan_id NUMBER(10),
    account_id NUMBER(10),
    loan_date NUMBER(8),
    amount NUMBER(8),
    duration NUMBER(10),
    payments NUMBER(20, 4),
    status VARCHAR2(26)
    );

DROP TABLE BERKA_ORDER;
CREATE TABLE BERKA_ORDER ( 
    order_id NUMBER(10),
    account_id NUMBER(10),
    bank_to VARCHAR2(26),
    account_to NUMBER(10),
    amount NUMBER(20, 3),
    k_symbol VARCHAR2(100)
    );

DROP TABLE berka_trx;
CREATE TABLE berka_trx ( 
    trans_id NUMBER(20),
    account_id NUMBER(10),
    trx_date NUMBER(8),
    type VARCHAR2(26),
    operation VARCHAR2(100),
    amount NUMBER(20, 3),
    balance NUMBER(20, 3),
    k_symbol VARCHAR2(100),
    bank VARCHAR2(50),
    account NUMBER(20)
    );

DROP TABLE BERKA_DISTRICT;
CREATE TABLE BERKA_DISTRICT ( 
    district_id NUMBER(4),
    district_name VARCHAR2(100),
    region VARCHAR2(100),
    num_of_inhab NUMBER(10),
    num_of_inhab_l5 NUMBER(5),
    num_of_inhab_5_2k NUMBER(4),
    num_of_inhab_2k_10k NUMBER(4),
    num_of_inhab_u10k NUMBER(3),
    num_of_cities NUMBER(4),
    ratio_of_urb_inh NUMBER(6, 1),
    avg_salary NUMBER(7),
    unemp_rate_95 VARCHAR2(26),
    unemp_rate_96 NUMBER(5, 2),
    num_of_enterp NUMBER(4),
    num_of_comm_crime_95 VARCHAR2(26),
    num_of_comm_crime_96 NUMBER(7)
    );
