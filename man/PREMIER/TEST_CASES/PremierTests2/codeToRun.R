################################################################################
#### WRITE TEST CASES AND RELOAD PACKAGE                                   ####
################################################################################

source("R/main.R");
source("R/PremierTestFramework.R");
sequencer <- getSequence();
getTests();
initFramework();
createTests();

connectionDetails <- DatabaseConnector::createConnectionDetails(
  dbms     = Sys.getenv("dbms"),
  server   = Sys.getenv("server"),
  port     = as.numeric(Sys.getenv("port")),
  user     = Sys.getenv("user"),
  password = Sys.getenv("password")
)
connection <- DatabaseConnector::connect(connectionDetails)


################################################################################
#### BUILD TEST CASES                                                       ####
################################################################################

source_schema <- "native.cdm_testing_premier"
insertSql <- paste(generateInsertSql(databaseSchema = source_schema),
                   sep = "", collapse = "\n")
SqlRender::writeSql(insertSql, "inst/sql/sql_server/insert.sql")
DatabaseConnector::executeSql(connection = connection, sql = insertSql)

################################################################################
#### RUN BUILDER                                                            ####
################################################################################

#  Vendor                    = "Premier v5.2"
#  Number of batches         = 0
#  Batch Size                = 1000
#  Max Degree of Parallelism = 1

################################################################################
#### TEST CDM                                                               ####
################################################################################

cdm_schema <- "testing.cdm_testing_premier"
testSql <- paste(generateTestSql(databaseSchema = cdm_schema),
                 sep = "", collapse = "\n")
SqlRender::writeSql(testSql, "inst/sql/sql_server/test.sql")
DatabaseConnector::executeSql(connection, testSql)

################################################################################
#### VIEW RESULTS                                                           ####
################################################################################

View(DatabaseConnector::querySql(
  connection = connection,
  sql        = paste0("select * from ", cdm_schema, ".test_results order by id")
))

View(DatabaseConnector::querySql(
  connection = connection,
  sql        = paste0("select * from ", cdm_schema, ".test_results
                      where status = 'FAIL' order by id")
))

# SAVE RESULTS
testingResults <- DatabaseConnector::querySql(
  connection = connection,
  sql        = paste0("select * from ", cdm_schema, ".test_results order by id")
)
utils::write.csv(x         = testingResults,
                 file      = "inst/csv/test_results.csv",
                 row.names = FALSE)

