library(ORCH)
library(readr)

setwd("/home/oracle/Desktop/ziraat_teknoloji_workshop/05_events")
dir()

rm(list=ls())
products <- read_csv("products.csv")
events <- read_csv("events.csv",
                   col_types =
                     cols(
                       user_id = col_integer(),
                       event_timestamp = col_character(),
                       event_type = col_character(),
                       product_id = col_integer(),
                       seller_id = col_double()
                     )
                   )
products.df <- data.frame(products)
events.df <- data.frame(events)

head(products.df )
typeof(products.df)
class(products.df)
str(products.df)
nrow(products.df)

typeof(events.df)
class(events.df)
str(events.df)
nrow(events.df)

orch.disconnect()
hdfs.cwd()
if(hdfs.exists("products")){
  hdfs.rmdir("products")  
}

if(hdfs.exists("events")){
  hdfs.rmdir("events")  
}


hdfs.put(data = products.df,dfs.name =  "products/")
product_hdfs <- hdfs.attach("/user/oracle/products")
hdfs.ls(product_hdfs)
hdfs.meta(product_hdfs,names=c("product_id","category_id_0","category_id_1","category_id_2","price"))
pr.desc <- hdfs.describe(product_hdfs)
pr.desc[4:5,2]
hdfs.nrow(product_hdfs ,force = TRUE)
hdfs.dim(pr.desc)
hdfs.head(product_hdfs)


hdfs.put(data = events.df,dfs.name =  "events/")
event_hdfs <- hdfs.attach("/user/oracle/events")
hdfs.ls(event_hdfs)
hdfs.meta(event_hdfs,names=c("user_id","event_timestamp","event_type","product_id","seller_id"))
ev.desc <- hdfs.describe(event_hdfs)
ev.desc[4:5,2]
hdfs.nrow(event_hdfs ,force = TRUE)
hdfs.dim(ev.desc)
hdfs.head(event_hdfs)

rm(list=ls())


   


