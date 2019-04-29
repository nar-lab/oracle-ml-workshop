
ore.hiveOptions(dbname="bank_db",delim="\t")
ore.showHiveOptions()
ore.disconnect()
ore.connect(type = "HIVE")



 
spark.disconnect()
spark.connect(master = "spark://bigdatalite.localdomain:7077",
              dfs.namenode = "bigdatalite.localdomain",
              memory = "1G"
)


spark-connect(master = "yarn-client",memory="2G",dfs.namenode = "bigdatalite.localdomain")