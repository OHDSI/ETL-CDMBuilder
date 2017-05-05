# install.packages("S:/JW/ETL/etl_design/Premier/PremierTests", repos = NULL, type ="source")
library(PremierTests)
library(DatabaseConnector)
library(SqlRender)


#BUILD RAW DATA
#=============================

connectionDetails <- createConnectionDetails(dbms     = "redshift",
                                             server   = Sys.getenv("server"),
                                             port     = as.numeric(Sys.getenv("port")),
                                             user     = Sys.getenv("user"),
                                             password = Sys.getenv("password"))
connection <- connect(connectionDetails)

# create native schema
# createNativeSchema <- readSql("inst/sql/sql_server/createNativeSchema.sql")
# executeSql(connection, createNativeSchema)

# populate native schema
source_schema <- "scratch_jweave17_272"
insertSql <- translateSql(renderSql(paste(getInsertSql(connectionDetails), sep = "", collapse = "\n"),
                                    source_schema = source_schema)$sql,
                          targetDialect = connectionDetails$dbms)$sql
writeSql(insertSql, "inst/sql/sql_server/insert.sql")
executeSql(connection, insertSql)


#RUN BUILDER
#=============================

# create cdm schema
# createCdmSchema <- readSql("inst/sql/sql_server/createCdmSchema.sql")
# executeSql(connection, createCdmSchema)

# truncate test cdm
truncateCdmSchema <- readSql("inst/sql/sql_server/truncateCdmSchema.sql") #must truncate cost 5.0.0 and 5.0.1
executeSql(connection, truncateCdmSchema)

# run builder


#TEST CDM
#=============================

cdm_schema <- "scratch_jweave17_273"
testSql <- translateSql(renderSql(paste(getTestSql(connectionDetails), sep = "", collapse = "\n"),
                                  cdm_schema = cdm_schema)$sql,
                        targetDialect = connectionDetails$dbms)$sql
writeSql(testSql, "inst/sql/sql_server/test.sql")
executeSql(connection, testSql)

View(querySql(connection, "select * from scratch_jweave17_273.test_results order by id"))
View(querySql(connection, "select * from scratch_jweave17_273.test_results where status = 'FAIL' order by id"))
write.csv(querySql(connection, "select * from scratch_jweave17_273.test_results order by id"), "inst/csv/test_results.csv")
