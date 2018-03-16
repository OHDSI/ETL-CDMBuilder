### package setup steps
install.packages("devtools", repos = "https://cran.rstudio.com")
library(devtools)

# explicit packages install are needed to install dependencies
install.packages("rJava", repos = "https://cran.rstudio.com") 
install.packages("fastmatch", repos = "https://cran.rstudio.com")

if (Sys.getenv("JAVA_HOME")!="")
  Sys.setenv(JAVA_HOME="")

install_github("alondhe/PregnancyAlgorithm")
install_github("OHDSI/DatabaseConnector")

library(PregnancyAlgorithm)

### Fill these out
Sys.setenv("AWS_ACCESS_KEY_ID" = "{awsAccessKeyId}",
           "AWS_SECRET_ACCESS_KEY" = "{awsSecretKey}",
           "AWS_DEFAULT_REGION" = "us-east-1",
           "AWS_BUCKET_NAME" = "{awsBucketName}",
           "AWS_OBJECT_KEY" = "{awsObjectKey}",
           "AWS_SSE_TYPE" = "AES256")

rCluster <- "{rsCluster}" # adjust this cluster name
rPort <- 5439
rUser <- "{rsUser}" # adjust this user name
rPassword <- "{rsPassword}" # adjust this password
cdmDatabaseSchema = "{rsCdmSchema}" # schema where the CDM data is located
resultsDatabaseSchema = "{rsResultsSchema}" # schema where the final pregnancy tables are to be stored
db <- "{rsDbName}" # adjust this database name


connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = "redshift",
                                                                server = paste(paste(rCluster, db, sep = "/"),
                                                                               "ssl=true&sslfactory=com.amazon.redshift.ssl.NonValidatingFactory",
                                                                               sep = "?"), 
                                                                port = rPort, 
                                                                user = rUser, 
                                                                password = rPassword)



PregnancyAlgorithm::clean(connectionDetails = connectionDetails, resultsDatabaseSchema = resultsDatabaseSchema)
PregnancyAlgorithm::init(connectionDetails = connectionDetails, resultsDatabaseSchema = resultsDatabaseSchema,
                         useMppUpload = TRUE)
PregnancyAlgorithm::execute(connectionDetails = connectionDetails, cdmDatabaseSchema = cdmDatabaseSchema,
                            resultsDatabaseSchema = resultsDatabaseSchema)