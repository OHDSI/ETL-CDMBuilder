# Code to run

# Build and reload the package
library(CernerTesting)

## Step 1: Set connection parameters using the config file and create connection details
#========================================================================================

config <- read.csv("extras/config.csv",as.is=TRUE)[1,]

Sys.setenv(dbms = config$dbms)
Sys.setenv(user = config$user)
Sys.setenv(pw = config$pw)
Sys.setenv(server = config$server)
Sys.setenv(port = config$port)
Sys.setenv(raw_db = config$raw_db)
Sys.setenv(raw_schema = config$raw)
Sys.setenv(cdm_db = config$cdm_db)
Sys.setenv(cdm_schema = config$cdm)

connectionDetailsNative <- DatabaseConnector::createConnectionDetails(dbms = Sys.getenv("dbms"),
                                                   server = Sys.getenv("server"),
                                                   user = Sys.getenv("user"),
                                                   password = Sys.getenv("pw")
)

connectionDetailsTesting <- DatabaseConnector::createConnectionDetails(dbms = Sys.getenv("dbms"),
                                                                       server = Sys.getenv("server"),
                                                                       user = Sys.getenv("user"),
                                                                       password = Sys.getenv("pw")
)

## Step 2: Run the createTests function to write the test case insert and test sql
#===================================================================================

CernerTesting::createTests()

## Step 3: Put the test cases on the server
#===========================================

conn <- DatabaseConnector::connect(connectionDetails = connectionDetailsNative)

sql <- SqlRender::renderSql(paste(insertDf$sql, sep = "", collapse = "\n"),
                            nativeDatabaseSchema = paste0(Sys.getenv("raw_db"),".",Sys.getenv("raw_schema")))$sql

sql <- SqlRender::translateSql(sql,
                               targetDialect = connectionDetailsNative$dbms)$sql

SqlRender::writeSql(sql, "insertSql.sql")

DatabaseConnector::executeSql(connection = conn, sql = sql)
DatabaseConnector::disconnect(connection = conn)

#===================================================================================
## Step 4: Run the builder! This must be done externally, cannot be done through R
#===================================================================================



## Step 5: Execute the testSql file on the cdm created in step 4
#=================================================================

conn <- DatabaseConnector::connect(connectionDetails = connectionDetailsTesting)

sql <- SqlRender::renderSql(paste(testSql, sep = "", collapse = "\n"),
                            cdmDatabaseSchema = paste0(Sys.getenv("cdm_db"),".",Sys.getenv("cdm_schema")))$sql

sql <- SqlRender::translateSql(sql,
                               targetDialect = connectionDetailsTesting$dbms)$sql

SqlRender::writeSql(sql, "testSql.sql")

DatabaseConnector::executeSql(connection = conn, sql = sql)
DatabaseConnector::disconnect(connection = conn)

## Step 6: View test results
#=============================

conn <- DatabaseConnector::connect(connectionDetails = connectionDetailsTesting)

DatabaseConnector::querySql(conn,
                            SqlRender::renderSql("SELECT status, count(*) FROM @cdmDatabaseSchema.test_results group by status", cdmDatabaseSchema = paste0(Sys.getenv("cdm_db"),".",Sys.getenv("cdm_schema")))$sql)
DatabaseConnector::querySql(conn,
                            SqlRender::renderSql("SELECT * FROM @cdmDatabaseSchema.test_results where status = 'FAIL'", cdmDatabaseSchema = paste0(Sys.getenv("cdm_db"),".",Sys.getenv("cdm_schema")))$sql)

DatabaseConnector::disconnect(connection = conn)
