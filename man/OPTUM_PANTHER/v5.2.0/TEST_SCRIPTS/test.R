#BUILD RAW DATA
#=============================
library(DatabaseConnector)
library(SqlRender)
library(OptumPantherTests)

db <- "native"
source_schema <- "native.Cdm_testing_optumpan"
cdm_schema <- "testing.cdm_testing_optumpan"

insertSql <- SqlRender::translateSql(SqlRender::renderSql(paste(OptumPantherTests::getInsertSql(source_schema), sep = "", collapse = "\n"))$sql,
                                    targetDialect = "sql server")$sql
SqlRender::writeSql(insertSql, "insert.sql")


#TEST CDM
#=============================

testSql <- SqlRender::translateSql(SqlRender::renderSql(paste(OptumPantherTests::getTestSql(cdm_schema), sep = "", collapse = "\n"))$sql,
                                   targetDialect = "sql server")$sql
SqlRender::writeSql(testSql, "test.sql")

querySql(connection, renderSql("SELECT status, count(*) FROM @cdm_schema.test_results group by status", cdm_schema = cdm_schema)$sql)
querySql(connection, renderSql("SELECT * FROM @cdm_schema.test_results where status = 'FAIL'", cdm_schema = cdm_schema)$sql)

