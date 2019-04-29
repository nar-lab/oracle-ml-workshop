#source(echo = TRUE)
library(ROracle)

drv <- dbDriver("Oracle")
host <- "localhost"
port <- 1521
sid <- "ORCL"
connect.string <- paste(
            "(DESCRIPTION=",
            "(ADDRESS=(PROTOCOL=tcp)(HOST=", host, ")(PORT=", port, "))",
            "(CONNECT_DATA=(SID=", sid, ")))", sep = "")

constraint.table <- "CONSTRAINT \"WB_JSON_CHECK\" CHECK (doc IS JSON) ENABLE"
conn <- dbConnect(drv, username = "ZIRAAT", password = "teknoloji",dbname = connect.string)

if(dbExistsTable(conn,"JSON_TMP")){
  dbRemoveTable(conn,"JSON_TMP")
}

path <- 'world_bank.json'
data <- readLines(path)
wb.json.df <- data.frame(DOC = data)
attr(wb.json.df$DOC,"ora.type") <- "clob"
dbWriteTable(conn,"JSON_TMP",wb.json.df)

if(dbExistsTable(conn,"WORLDBANK_JSON")){
  dbRemoveTable(conn,"WORLDBANK_JSON")
}

create.stmt <- paste("CREATE TABLE WORLDBANK_JSON(DOC CLOB ",constraint.table," )",sep="")
qry <- dbSendQuery(conn,create.stmt)
execute(qry)

insert.stmt <- "INSERT INTO WORLDBANK_JSON SELECT DOC FROM JSON_TMP"
qry <- dbSendQuery(conn,insert.stmt)
execute(qry)
qry <- dbSendQuery(conn,"COMMIT")
execute(qry)


if(dbExistsTable(conn,"JSON_TMP")){
  dbRemoveTable(conn,"JSON_TMP")
}


dbDisconnect(conn)

