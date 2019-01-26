library(RODBC)

   
## set the database path
DbPath <- "*.accdb"
## connect to the database
co_nAccdb <- odbcConnectAccess2007(DbPath,rows_at_time = 1) 

tab <- sqlFetch(co_nAccdb, "table1",as.is = T)# read your database table

close(co_nAccdb)# close the connection


colnames(tab)
tab<-data.frame(tab[ ,c(1:8,17,20)],table=rep("table1",nrow(tab)))# Select the columns of your interest

write.csv(tab,"*.csv")# save your data as csv for further analysis
############################
