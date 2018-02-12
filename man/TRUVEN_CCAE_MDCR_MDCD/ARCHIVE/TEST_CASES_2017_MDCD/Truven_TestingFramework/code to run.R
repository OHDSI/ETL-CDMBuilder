#Code to run

## STEP 1: Source the main file and set variable for which Truven database is being tested ("CCAE" for Commercial Claims and Encounters, "MDCR" for Medicare
## and "MDCD" for Medicaid)

source('main.R')

#Sys.setenv(truvenType = "CCAE");
#Sys.setenv(truvenType = "MDCR");
Sys.setenv(truvenType = "MDCD");

# STEP 2: Run the getSource function to source the proper framework based on the variable set above and then set defaults

getSource();

# STEP 3: Run the sequencer function to create patient and provider ids

sequencer <- getSequence()

# STEP 4: AFTER writing all of your tests in the different files, run the functions to create the insertsql statements

getTests();
initFramework();
source('R/SetDefaults.R');
createTests();

# STEP 5: Create the insert & test sql file

cat(file="insert.sql", paste(getInsertSql(), collapse="\n"))

cat(file="test.sql", paste(getTestSql(), collapse="\n"))

# STEP 6: Run DatabaseConnector to put the test cases on the server
library("DatabaseConnector")
library("SqlRender")

connectionDetails <- createConnectionDetails(dbms = "sql server",
                                   server = "your server",
                                   schema = "your schema"
                                  )

conn <- connect(connectionDetails)

insertSql <- readSql("insert.sql")
renderedSql <- renderSql(sql = insertSql, source_schema = "your schema")$sql
executeSql(conn, renderedSql)

#YOU NEED A COPY OF GEOLOC IN YOUR RAW
executeSql(conn, "TRUNCATE TABLE GEOLOC; INSERT INTO GEOLOC (EGEOLOC, EGEOLOC_Description, STATE) VALUES (11, 'New Jersey', 'NJ');
           INSERT INTO GEOLOC (EGEOLOC, EGEOLOC_Description, STATE) VALUES (38, 'Virginia', 'VA')")

#IF TESTING CCAE OR MDCR YOU NEED A COPY OF HRA_QUESTON_REF, HRA_VARIABLE_REF IN YOUR RAW
executeSql(conn, "TRUNCATE TABLE HRA_VARIABLE_REF;
           INSERT INTO HRA_VARIABLE_REF (VARIABLE_NAME, VARIABLE_LONGNAME, QUESTION_TYPE_ID) 
           VALUES ('CC_ASTHMA', 'Self-reported asthma', '4');
           INSERT INTO HRA_VARIABLE_REF (VARIABLE_NAME, VARIABLE_LONGNAME, QUESTION_TYPE_ID) 
           VALUES ('CGTDUR', 'Number of years of cigarette use', '8');
           INSERT INTO HRA_VARIABLE_REF (VARIABLE_NAME, VARIABLE_LONGNAME, QUESTION_TYPE_ID) 
           VALUES ('CGTPKAMT', 'Number of packs of cigarettes smoked per day', '9');")
executeSql(conn, "TRUNCATE TABLE HRA_QUESTION_REF;
           INSERT INTO HRA_QUESTION_REF (QUESTION_TYPE_ID, CATEGORY_VALUE, CATEGORY_NAME) 
           VALUES ('4', '1', 'Yes');
           INSERT INTO HRA_QUESTION_REF (QUESTION_TYPE_ID, CATEGORY_VALUE, CATEGORY_NAME) 
           VALUES ('8', '3', '11-20');
           INSERT INTO HRA_QUESTION_REF (QUESTION_TYPE_ID, CATEGORY_VALUE, CATEGORY_NAME) 
           VALUES ('9', '2', '1 pack per day or more');")

dbDisconnect(conn)

# STEP 7: Run builder externally
# STEP 8: Use test.sql to determine which cases pass and which fail
testResults <- data.frame("id"=numeric(0), "description"=character(0), 
                            "test"=character(0), "source_pid"=numeric(0), 
                            "cdm_pid"=numeric(0), "status"=character(0)
                            , stringsAsFactors=FALSE)

conn <- connect(connectionDetails)

insertSql <- readSql("test.sql")
renderedSql <- renderSql(sql = insertSql, cdm_schema = "your schema")$sql
executeSql(conn, renderedSql)
testResults <- rbind(testResults,querySql(conn, "select * from TRUVEN_TEST_CDM_CB.dbo.test_results"))

dbDisconnect(conn)




