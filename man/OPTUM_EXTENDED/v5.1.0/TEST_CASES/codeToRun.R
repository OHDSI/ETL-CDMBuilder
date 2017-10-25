# Establish Extended Type and Connection strings
#=============================

detach("package:OptumExtendedSesDodTesting", unload = TRUE)

## Set Extended Type ("ses" for SES, "dod" for DOD)

Sys.setenv(extendedType = "ses")
#Sys.setenv(extendedType = "dod")

library(OptumExtendedSesDodTesting)

sourceDatabaseSchema <- "scratch_cdm_testing"
cdmDatabaseSchema <- "scratch_cdm_results"

## Set Environment variables before running
user <- Sys.getenv("cdmUser")
password <- Sys.getenv("cdmPassword")
server <- Sys.getenv("cdmServer")
port <- Sys.getenv("cdmServerPort")
dbms <- Sys.getenv("cdmDbms")

## Modify connection details as needed
connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = dbms, server = server,
                                             port = port, user = user, password = password)

#BUILD RAW DATA
#=============================

connection <- DatabaseConnector::connect(connectionDetails = connectionDetails)

insertSql <- SqlRender::translateSql(SqlRender::renderSql(paste(getInsertSql(connectionDetails), sep = "", collapse = "\n"),
                                    sourceDatabaseSchema = sourceDatabaseSchema)$sql,
                          targetDialect = connectionDetails$dbms)$sql

DatabaseConnector::executeSql(connection, insertSql)

#RUN CDM BUILDER (not part of this package)
#=============================


# RUN TESTS
#=============================

testSql <- SqlRender::translateSql(SqlRender::renderSql(paste(getTestSql(connectionDetails), collapse = "\n"),
                                  cdmDatabaseSchema = cdmDatabaseSchema)$sql,
                        targetDialect = connectionDetails$dbms)$sql
DatabaseConnector::executeSql(connection, testSql)


# VIEW TEST RESULTS
#=============================

DatabaseConnector::querySql(connection, 
                            SqlRender::renderSql("SELECT status, count(*) FROM @cdmDatabaseSchema.test_results group by status", cdmDatabaseSchema = cdmDatabaseSchema)$sql)
DatabaseConnector::querySql(connection, 
                            SqlRender::renderSql("SELECT * FROM @cdmDatabaseSchema.test_results where status = 'FAIL'", cdmDatabaseSchema = cdmDatabaseSchema)$sql)




