library(ORCH)
library(ORE)

orch.disconnect()
orch.connect(user = "ziraat",
             password = "teknoloji",
             host = "localhost",
             sid = "ORCL",
             port = 1521,
             driver = "sqoop", #alternative sqoop
             secure = FALSE,
             silent = FALSE,
             force = TRUE
) 



ore.sync("ZIRAAT","BERKA_TRX")
ore.attach("ZIRAAT")
ore.ls()

hdfs.toHive("BERKA_TRX",table = BERKA_TRX)

