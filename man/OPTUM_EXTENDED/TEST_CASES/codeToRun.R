# Establish Extended Type and Connection strings
#=============================

detach("package:OptumExtendedSesDodTesting", unload=TRUE)

## Set Extended Type ("ses" for SES, "dod" for DOD)

#Sys.setenv(extendedType = "ses")
Sys.setenv(extendedType = "dod")

library(OptumExtendedSesDodTesting)

source_schema <- "scratch_cdm_testing"
cdm_schema <- "scratch_cdm_results"

## Set Environment variables before running
user <- Sys.getenv("cdmUser")
password <- Sys.getenv("cdmPassword")
server <- Sys.getenv("cdmServer")
port <- Sys.getenv("cdmServerPort")

## Modify connection details as needed
connectionDetails <- createConnectionDetails(dbms="redshift", server=server,
                                             port=port, user=user, password=password)

#BUILD RAW DATA
#=============================

connection <- connect(connectionDetails)

insertSql <- translateSql(renderSql(paste(getInsertSql(connectionDetails), sep = "", collapse = "\n"),
                                    source_schema = source_schema)$sql,
                          targetDialect = connectionDetails$dbms)$sql

executeSql(connection, insertSql)

#RUN CDM BUILDER (not part of this package)
#=============================


# RUN TESTS
#=============================

testSql <- translateSql(renderSql(paste(getTestSql(connectionDetails), sep = "", collapse = "\n"),
                                  cdm_schema = cdm_schema)$sql,
                        targetDialect = connectionDetails$dbms)$sql
executeSql(connection, testSql)


# VIEW TEST RESULTS
#=============================

querySql(connection, renderSql("SELECT status, count(*) FROM @cdm_schema.test_results group by status", cdm_schema = cdm_schema)$sql)
querySql(connection, renderSql("SELECT * FROM @cdm_schema.test_results where status = 'FAIL'", cdm_schema = cdm_schema)$sql)


