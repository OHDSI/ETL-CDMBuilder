---
output:
  html_document: default
---
# Truven Unit Tests
***

Release date: April 27, 2017

This package is intended to test the conversion of the Truven Marketscan® Commercial Claims and Encounters (CCAE), Medicare (MDCR), and Medicaid (MDCD) databases to the OMOP Common Data Model version 5.0.1 according to the ETL document available [here](https://github.com/OHDSI/ETL-CDMBuilder/tree/master/man/TRUVEN_CCAE_MDCR).

## Steps for how to correctly use this R project

The main file that will run the test cases is 

```{r eval=FALSE}
code to run.R
```

This file sources 

```{r, eval=FALSE}
main.R
```

which will source the necessary functions and test framework based on database you are testing. In order to make sure the correct test framework is loaded you should set the **truvenType** variable to either CCAE, MDCR or MDCD. For example, if you are testing CCAE it would look like this:

```{r, eval=FALSE}
Sys.setenv(truvenType = "CCAE");
#Sys.setenv(truvenType = "MDCR");
#Sys.setenv(truvenType = "MDCD");
```

After sourcing **main.R** and setting the **truvenType** variable, run the code 

```{r, eval=FALSE}
getSource();
```

This will load the test framework of the database set as **truvenType**. This step is very important because there are slight differences between the three, especially Medicaid, and by setting that variable not only will the test framework be sourced but the correct test cases will be run as well. 

At this point you will also want to run the **getSequence** function to create patient and visit ids as you create your test cases. This is very helpful once you run the test.sql file because it makes it much easier to pinpoint the failures.

```{r, eval=FALSE}
sequencer <- getSequence()
```

Now you are ready to write your tests, all of which should be located in the **R** folder. You are welcome to use the test cases we have created to test the logic in the ETL document referenced above, but feel free to add your own as well. If you would like more guidance on how to use the functions available (declareTests, add_<table name>, expect_<table name>, etc.) please refer to the test framework [wiki](http://www.ohdsi.org/web/wiki/doku.php?id=documentation:software:whiterabbit:test_framework). If you add any files with tests in them to the **R/** folder be sure to add them to the **getTests()** function in **main.R** and to the file **R/UnitTests.R**.

At this point you should also be thinking about any default values you need to set for your test cases. The test framework will automatically set defaults based on the scan report so if there are any you would like to change use the **R/SetDefaults.R** file to do so.

You can now load and create your tests by running the statements:

```{r,eval=FALSE}
getTests();
initFramework();
source('R/SetDefaults.R');
createTests();
```

From there you can create the sql files containing the insert scripts and the test scripts:

```{r, eval=FALSE}
cat(file="insert.sql", paste(getInsertSql(), collapse="\n"))

cat(file="test.sql", paste(getTestSql(), collapse="\n"))
```

In order to run the two sql files you created you will need a blank copy of the raw database you are testing and a blank cdm. Then you can use the [SqlRender](https://github.com/ohdsi/sqlrender) and [DatabaseConnector](https://github.com/ohdsi/databaseconnector) packages to remotely connect to your schemas to insert and then test your test cases once you run builder. There is currently no way to run builder directly from R so you will need to load your test cases to your schema in R, run builder externally and then return to R to validate them.

For example:

```{r,eval=FALSE}
library("DatabaseConnector")
library("SqlRender")

connectionDetails <- createConnectionDetails(dbms = "sql server",
                                   server = "your_server",
                                   schema = "your_raw_schema"
                                  )

conn <- connect(connectionDetails)

insertSql <- readSql("insert.sql")
renderedSql <- renderSql(sql = insertSql, source_schema = "your_raw_schema")$sql
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
renderedSql <- renderSql(sql = insertSql, cdm_schema = "your_cdm_schema")$sql
executeSql(conn, renderedSql)
testResults <- rbind(testResults,querySql(conn, "select * from your_cdm_schema.test_results"))

dbDisconnect(conn)
```

This will then return a data frame with the results of the test case validation and those with a **FAIL** should be investigated.
