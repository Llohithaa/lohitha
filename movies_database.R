install.packages("RSQLite")
library("RSQLite")
if(!dir.exists("F://R_workspace//mydata"))dir.create
("F://R_workspace//mydata")

conn<-dbConnect(SQLite(),"F://R_workspace//mydata//movies.sqlite")
movies<-read.csv("F://R_workspace//movies.csv")
movies

dbWriteTable(conn,"movies",movies)
dbExistsTable(conn,"movies")

dbReadTable(conn,"movies")
head(dbGetQuery(conn,"select * from movies"),10)
head(dbGetQuery(conn,"select distinct actress from movies"),10)

dbDisconnect(conn)