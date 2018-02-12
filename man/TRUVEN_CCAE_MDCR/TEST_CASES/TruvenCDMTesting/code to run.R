#Code to run

## STEP 1: Source the main file and set variable for which Truven database is being tested ("CCAE" for Commercial Claims and Encounters, "MDCR" for Medicare
## and "MDCD" for Medicaid)

source('main.R')
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

#DON'T FORGET THE CONFIG FILE CHANGE
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

cat(file="insert.sql", paste(generateInsertSql(databaseSchema = Sys.getenv("raw_schema")), collapse="\n"))

cat(file="test.sql", paste(generateTestSql(databaseSchema = Sys.getenv("cdm_schema")), collapse="\n"))

# STEP 6: Run DatabaseConnector to put the test cases on the server
library("DatabaseConnector")
library("SqlRender")

connectionDetails <- createConnectionDetails(dbms = Sys.getenv("dbms"),
                                   server = Sys.getenv("server"),
                                   schema = Sys.getenv("raw_db"),
                                   user = Sys.getenv("user"),
                                   password = Sys.getenv("pw")
                                  )

conn <- connect(connectionDetails)

insertSql <- readSql("insert.sql")
renderedSql <- renderSql(sql = insertSql)$sql#, source_schema = paste0(Sys.getenv("raw_db"),".",Sys.getenv("raw_schema")))$sql
executeSql(conn, renderedSql)

if(Sys.getenv("truvenType") != "MDCD" ){
#YOU NEED A COPY OF GEOLOC IN YOUR RAW
executeSql(conn, paste0("TRUNCATE TABLE ",Sys.getenv("raw_db"),".",
          Sys.getenv("raw_schema"),".GEOLOC; INSERT INTO ",Sys.getenv("raw_db"),".",
          Sys.getenv("raw_schema"),".GEOLOC (EGEOLOC, EGEOLOC_Description, STATE) VALUES (11, 'New Jersey', 'NJ'); INSERT INTO ",
          Sys.getenv("raw_db"),".",Sys.getenv("raw_schema"),
          ".GEOLOC (EGEOLOC, EGEOLOC_Description, STATE) VALUES (38, 'Virginia', 'VA')"))
}
  
#IF TESTING CCAE  YOU NEED A COPY OF HRA_QUESTON_REF, HRA_VARIABLE_REF IN YOUR RAW
if (Sys.getenv("truvenType") == "CCAE" ){
  executeSql(conn, paste0("TRUNCATE TABLE ",Sys.getenv("raw_db"),".",
                          Sys.getenv("raw_schema"),".HRA_VARIABLE_REF;
           INSERT INTO ",Sys.getenv("raw_db"),".",
                          Sys.getenv("raw_schema"),".HRA_VARIABLE_REF (VARIABLE_NAME, VARIABLE_LONGNAME, QUESTION_TYPE_ID) 
           VALUES ('CC_ASTHMA', 'Self-reported asthma', '4');
           INSERT INTO ",Sys.getenv("raw_db"),".",
                          Sys.getenv("raw_schema"),".HRA_VARIABLE_REF (VARIABLE_NAME, VARIABLE_LONGNAME, QUESTION_TYPE_ID) 
           VALUES ('CGTDUR', 'Number of years of cigarette use', '8');
           INSERT INTO ",Sys.getenv("raw_db"),".",
                          Sys.getenv("raw_schema"),".HRA_VARIABLE_REF (VARIABLE_NAME, VARIABLE_LONGNAME, QUESTION_TYPE_ID) 
           VALUES ('CGTPKAMT', 'Number of packs of cigarettes smoked per day', '9');"))
  executeSql(conn, paste0("TRUNCATE TABLE ",Sys.getenv("raw_db"),".",
                          Sys.getenv("raw_schema"),".HRA_QUESTION_REF;
           INSERT INTO ",Sys.getenv("raw_db"),".",
                          Sys.getenv("raw_schema"),".HRA_QUESTION_REF (QUESTION_TYPE_ID, CATEGORY_VALUE, CATEGORY_NAME) 
           VALUES ('4', '1', 'Yes');
           INSERT INTO ",Sys.getenv("raw_db"),".",
                          Sys.getenv("raw_schema"),".HRA_QUESTION_REF (QUESTION_TYPE_ID, CATEGORY_VALUE, CATEGORY_NAME) 
           VALUES ('8', '3', '11-20');
           INSERT INTO ",Sys.getenv("raw_db"),".",
                          Sys.getenv("raw_schema"),".HRA_QUESTION_REF (QUESTION_TYPE_ID, CATEGORY_VALUE, CATEGORY_NAME) 
           VALUES ('9', '2', '1 pack per day or more');"))
}

DatabaseConnector::disconnect(conn)


# STEP 7: Run builder externally
#               .--.
#              (    )
#                 _/
#  ,   ,         |
#  |\_/|_________|
#  |+ +          o
#  |_^_|-||_____||
#    U   ||     ||
#       (_|    (_|


# STEP 8: Use test.sql to determine which cases pass and which fail
testResults <- data.frame("id"=numeric(0), "description"=character(0), 
                            "test"=character(0), "source_pid"=numeric(0), 
                            "cdm_pid"=numeric(0), "status"=character(0)
                            , stringsAsFactors=FALSE)

connectionDetails <- createConnectionDetails(dbms = Sys.getenv("dbms"),
                                             server = Sys.getenv("server"),
                                             schema = Sys.getenv("cdm_db"),
                                             user = Sys.getenv("user"),
                                             password = Sys.getenv("pw")
)

conn <- connect(connectionDetails)

insertSql <- readSql("test.sql")
renderedSql <- renderSql(sql = insertSql)$sql;#, cdm_schema = paste0(Sys.getenv("cdm_db"),".",Sys.getenv("cdm_schema")))$sql
executeSql(conn, renderedSql)
testResults <- rbind(testResults,querySql(conn, 
                    paste0("select * from ", paste0(Sys.getenv("cdm_db"),".",Sys.getenv("cdm_schema")),
                    ".test_results")))

DatabaseConnector::disconnect(conn)




