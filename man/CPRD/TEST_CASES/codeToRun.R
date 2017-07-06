# Establish Extended Type and Connection strings
#=============================

detach("package:CPRDTesting", unload=TRUE)

library(CPRDTesting)

source_schema <- "CDM_CPRD_TESTING_RAW.dbo"
cdm_schema <- "CDM_CPRD_TESTING_CDM.dbo"
cdmDatabaseSchema = strsplit(source_schema, '[.]')[[1]][1]

pw <- NULL
dbms <- "sql server"
user <- NULL
server <- "SERVER_NAME"
port <- NULL
connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = dbms,
                                                                server = server,
                                                                user = user,
                                                                password = pw,
                                                                port = port)
#BUILD RAW DATA
#=============================

connection <- DatabaseConnector::connect(connectionDetails)

insertSql <- SqlRender::translateSql(SqlRender::renderSql(paste(getInsertSql(connectionDetails), sep = "", collapse = "\n"),
                                    source_schema = source_schema)$sql,
                          targetDialect = connectionDetails$dbms)$sql
SqlRender::writeSql(insertSql, 'insertSql.sql')
DatabaseConnector::executeSql(connection, insertSql)


#insertSqls <- getInsertSql(connectionDetails)
#for (i in 1:905){#length(insertSqls)){ # 901 issue   857 ok
#for (i in 907:length(insertSqls)){ # 901 issue   857 ok 880
#  insertSql <- SqlRender::translateSql(SqlRender::renderSql(insertSqls[i],
#                                                            source_schema = source_schema)$sql,
#                                       targetDialect = connectionDetails$dbms)$sql
#  if(insertSql!='' & substring(insertSql,1,2)!='--')
#    DatabaseConnector::executeSql(connection, insertSql)
#} # 900 was an issue

# add the extra tables:
sql <- SqlRender::loadRenderTranslateSql('HES_FieldDefinitions_inserts2.sql', packageName = 'CPRDtesting', dbms = connectionDetails$dbms,
                                         cdm_database_schema= cdmDatabaseSchema)
DatabaseConnector::executeSql(connection, sql)
sql <- SqlRender::loadRenderTranslateSql('HES_FieldMappings_inserts2.sql', packageName = 'CPRDtesting', dbms = connectionDetails$dbms,
                                         cdm_database_schema= cdmDatabaseSchema)
DatabaseConnector::executeSql(connection, sql)

sql <- SqlRender::loadRenderTranslateSql('lookup_insert.sql', packageName = 'CPRDtesting', dbms = connectionDetails$dbms,
                                         cdm_database_schema= cdmDatabaseSchema)
DatabaseConnector::executeSql(connection, sql)

sql <- SqlRender::loadRenderTranslateSql('lookuptype_insert.sql', packageName = 'CPRDtesting', dbms = connectionDetails$dbms,
                                         cdm_database_schema= cdmDatabaseSchema)
DatabaseConnector::executeSql(connection, sql)

sql <- SqlRender::loadRenderTranslateSql('entity_insert.sql', packageName = 'CPRDtesting', dbms = connectionDetails$dbms,
                                         cdm_database_schema= cdmDatabaseSchema)
DatabaseConnector::executeSql(connection, sql)

#sql <- SqlRender::loadRenderTranslateSql('hes_linkage_coverage_insert.sql', packageName = 'CPRDtesting', dbms = connectionDetails$dbms,
#                                         cdm_database_schema= cdmDatabaseSchema)
#DatabaseConnector::executeSql(connection, sql)

#RUN BUILDER
#=============================


#TEST CDM
#=============================

testSql <- SqlRender::translateSql(SqlRender::renderSql(paste(gsub('; ','', getTestSql(connectionDetails)), sep = "", collapse = "\n"),
                                  cdm_schema = cdm_schema)$sql,
                        targetDialect = connectionDetails$dbms)$sql
SqlRender::writeSql(testSql, 'testSql.sql')
DatabaseConnector::executeSql(connection, testSql)

DatabaseConnector::querySql(connection, SqlRender::renderSql("SELECT status, count(*) FROM @cdm_schema.test_results group by status", cdm_schema = cdm_schema)$sql)
DatabaseConnector::querySql(connection, SqlRender::renderSql("SELECT * FROM @cdm_schema.test_results where status = 'FAIL'", cdm_schema = cdm_schema)$sql)

