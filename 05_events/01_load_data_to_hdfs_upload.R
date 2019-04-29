library(ORCH)

#orch.dryrun(TRUE)
#orch.debug(TRUE)
orch.dbg.on("all")

setwd("/home/oracle/Desktop/ziraat_teknoloji_workshop/05_events")
dir()

rm(list=ls())

orch.disconnect()

hdfs.rmdir("products")  

prods <- hdfs.upload("products.csv",
                     dfs.id = "products/",
                     overwrite = TRUE,
                     attach = TRUE
) 

hdfs.rmdir("events")  
events <- hdfs.upload("events.csv",
                      dfs.id = "events/",
                      overwrite = TRUE,
                      header = TRUE,
                      attach = TRUE
) 
hdfs.meta
hdfs.head(prods)
hdfs.head(events)

rm(prods.hdfs)
prods.hdfs <- hdfs.get(prods)
hdfs.describe(prods)
hdfs.head(prods.hdfs)

hdfs.rm("/user/oracle/products_mr_out")
prod.mr.out <- 
  hadoop.run(
    prods.hdfs,
    mapper = function(key,val){
        key <- strsplit(val,",")[2]
        val <- strsplit(val,",")[5]
        return(orch.keyvals(key,val))
      
    },
    reducer = function(key,val){
      tmp <- do.call(rbind,val)
      orch.dlog(colnames())
      return(orch.keyvals(key,val))
    },
    out.name = "/user/oracle/products_mr_out"
  )

hdfs.head(prod.mr.out)
orch.dbg.off("all")

