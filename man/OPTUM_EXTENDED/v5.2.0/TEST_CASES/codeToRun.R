# Establish Extended Type and Connection strings
#=============================

detach("package:OptumExtendedSesDodTesting", unload = TRUE)

## Set Extended Type ("ses" for SES, "dod" for DOD)

#Sys.setenv(extendedType = "ses")
Sys.setenv(extendedType = "dod")

library(OptumExtendedSesDodTesting)

nativeDatabaseSchema <- "cdm_testing_optumdod_native.dbo"
cdmDatabaseSchema <- "cdm_testing_optumdod.dbo"

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

sql <- SqlRender::translateSql(SqlRender::renderSql(paste(insertDf$sql, sep = "", collapse = "\n"),
                                    nativeDatabaseSchema = nativeDatabaseSchema)$sql,
                          targetDialect = connectionDetails$dbms)$sql

DatabaseConnector::executeSql(connection = connection, sql = sql)
DatabaseConnector::disconnect(connection = connection)

#RUN CDM BUILDER (not part of this package)
#=============================


# RUN TESTS
#=============================

connection <- DatabaseConnector::connect(connectionDetails = connectionDetails)

sql <- SqlRender::translateSql(SqlRender::renderSql(paste(lapply(testSql, paste0, ";"), collapse = "\n"),
                                  cdmDatabaseSchema = cdmDatabaseSchema)$sql,
                        targetDialect = connectionDetails$dbms)$sql
DatabaseConnector::executeSql(connection = connection, sql = sql)
DatabaseConnector::disconnect(connection = connection)

# VIEW TEST RESULTS
#=============================

connection <- DatabaseConnector::connect(connectionDetails = connectionDetails)

DatabaseConnector::querySql(connection, 
                            SqlRender::renderSql("SELECT status, count(*) FROM @cdmDatabaseSchema.test_results group by status", cdmDatabaseSchema = cdmDatabaseSchema)$sql)
DatabaseConnector::querySql(connection, 
                            SqlRender::renderSql("SELECT * FROM @cdmDatabaseSchema.test_results where status = 'FAIL'", cdmDatabaseSchema = cdmDatabaseSchema)$sql)

DatabaseConnector::disconnect(connection = connection)



