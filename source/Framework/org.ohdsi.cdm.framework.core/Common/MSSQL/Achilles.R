### package setup steps
install.packages("devtools", repos = "http://cran.us.r-project.org")
library(devtools)

#options(java.home="C:\\Program Files (x86)\\Java\\jre1.8.0_25")
#install.packages('rJava', .libPaths()[1], 'http://www.rforge.net/')
#library(rJava)

if (Sys.getenv("JAVA_HOME")!="")
  Sys.setenv(JAVA_HOME="")
library(rJava)

install_github("OHDSI/SqlRender")
install_github("OHDSI/DatabaseConnector")
install_github("OHDSI/Achilles")
library(Achilles)

### Fill these out
rCluster <- "{rsCluster}" # adjust this cluster name
rUser <- "{rsUser}" # adjust this user name
rPassword <- "{rsPassword}" # adjust this password
cdmDatabaseSchema = "{rsDbSchema}" # should stay as-is
db <- "{rsDbName}" # adjust this database name
sourceName <- "{sourceName}" # we can grab this from HIX.VendorSchema on 01
outputRoot <- "{achillesJsonFolder}" # need to put a root folder for JSON file exports, use forward slashes
loadId <= "{loadId}" # specify HIX database load id
runCostAnalysis <- {runCostAnalysis} # this should be a parameter in the wrapper or UI
cdmVersion = "{cdmVersion}" # this should be a parameter in the wrapper or UI
resultsDatabaseSchema <- "{resultsSchema}" ### edited to use ohdsi_results as location to write to

jsonPath <- paste0(outputRoot, "/", paste(db, loadId, sep = "_", collapse = ""))
unlink(x = jsonPath, recursive = TRUE, force = TRUE) 

connectionDetails <- createConnectionDetails(dbms="redshift",
                                             server=paste(rCluster, ".cldcoxyrkflo.us-east-1.redshift.amazonaws.com/", db,
                                                          "?ssl=true&sslfactory=com.amazon.redshift.ssl.NonValidatingFactory",
                                                          sep="", collapse=""), port=5439, user=rUser, password=rPassword)

achillesResults <- achilles(connectionDetails, cdmDatabaseSchema = cdmDatabaseSchema, runCostAnalysis = runCostAnalysis,
                            resultsDatabaseSchema = resultsDatabaseSchema, sourceName = sourceName,
                            cdmVersion = cdmVersion, vocabDatabaseSchema = cdmDatabaseSchema)


exportToJson(connectionDetails, cdmDatabaseSchema = cdmDatabaseSchema,
             resultsDatabaseSchema = resultsDatabaseSchema,
             outputPath = jsonPath,
             cdmVersion = cdmVersion, vocabDatabaseSchema = cdmDatabaseSchema)
