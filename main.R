install.packages("RMySQL")
library(RMySQL)
#https://www.digitalocean.com/community/questions/how-to-allow-remote-mysql-database-connection
mydb = dbConnect(MySQL(), user='root', password='root', dbname='HHP_comp', host='141.219.190.19',port=3306)

dbListTables(mydb)
dbSendQuery(mydb, 'use HHP_comp')



dbSendQuery(mydb, 'CREATE TABLE Claims
(
MemberID     VARCHAR(8),
ProviderID VARCHAR(7) ,
Vendor VARCHAR(6) ,
PCP VARCHAR(5) ,
Year VARCHAR(2), 
Specialty VARCHAR(25),
 PlaceSvc VARCHAR(19),
 PayDelay VARCHAR(4),
 LengthOfStay VARCHAR(10),
 DSFS VARCHAR(12),
 PrimaryConditionGroup VARCHAR(8),
 CharlsonIndex VARCHAR(3),
 ProcedureGroup VARCHAR(4),
 SupLOS TINYINT );')



