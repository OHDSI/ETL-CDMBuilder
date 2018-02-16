# Establish Extended Type and Connection strings
#=============================
#detach("package:CPRDTesting", unload=TRUE)

library(CPRDtesting)

source_schema <- "source_schema"
cdm_schema <- "cdm_schema"
cdmDatabaseSchema = strsplit(source_schema, '[.]')[[1]][1]

pw <- "password"
dbms <- "dbms"
user <- "use"
server <- "server"
port <- NULL
connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = dbms,
                                                                server = server,
                                                                user = user,
                                                                password = pw,
                                                                port = port
                                                                )
#BUILD RAW DATA
#=============================

connection <- DatabaseConnector::connect(connectionDetails)

insertSql <- SqlRender::translateSql(SqlRender::renderSql(paste(getInsertSql(connectionDetails),
                                                                sep = "", collapse = "\n"),
                                    source_schema = source_schema)$sql,
                          targetDialect = connectionDetails$dbms)$sql
SqlRender::writeSql(insertSql, 'insertSql.sql')
DatabaseConnector::executeSql(connection, insertSql)


#RUN BUILDER
#=============================


#TEST CDM
#=============================

#BUILD RAW DATA
#=============================
connection <- DatabaseConnector::connect(connectionDetails)
testSql <- SqlRender::translateSql(SqlRender::renderSql(paste(gsub('; ','', getTestSql(connectionDetails)), sep = "", collapse = "\n"),
                                  cdm_schema = cdm_schema)$sql,
                        targetDialect = connectionDetails$dbms)$sql
SqlRender::writeSql(testSql, 'testSql.sql')
DatabaseConnector::executeSql(connection, testSql)

DatabaseConnector::querySql(connection, SqlRender::renderSql("SELECT status, count(*) FROM @cdm_schema.test_results group by status", cdm_schema = cdm_schema)$sql)

fails <- DatabaseConnector::querySql(connection, SqlRender::renderSql("SELECT * FROM @cdm_schema.test_results where status = 'FAIL'", cdm_schema = cdm_schema)$sql)

