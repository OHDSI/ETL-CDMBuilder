### package setup steps
install.packages("devtools", repos = "http://cran.us.r-project.org")
library(devtools)

# explicit packages install are needed to install dependencies
install.packages("rJava", repos=c("http://rstudio.org/_packages", "http://cran.rstudio.com")) 
install.packages("DBI", repos=c("http://rstudio.org/_packages", "http://cran.rstudio.com")) 
install.packages("fastmatch", repos=c("http://rstudio.org/_packages", "http://cran.rstudio.com")) 
install.packages("devtools", repos=c("http://rstudio.org/_packages", "http://cran.rstudio.com"))

if (Sys.getenv("JAVA_HOME")!="")
  Sys.setenv(JAVA_HOME="")

install_github("OHDSI/SqlRender")
install_github("OHDSI/DatabaseConnector")
install_github("OHDSI/Achilles")
install_github("ohdsi/OhdsiRTools")
library(Achilles)
library(SqlRender)
library(devtools)

### Fill these out
loadId <- "{loadId}" # specify HIX database load id
rCluster <- "{rsCluster}" # adjust this cluster name
rPort <- 5439
rUser <- "{rsUser}" # adjust this user name
rPassword <- "{rsPassword}" # adjust this password
cdmDatabaseSchema = "{rsDbSchema}" # schema where the CDM data is located
db <- "{rsDbName}" # adjust this database name

hixServer <- "{hixServer}"
hixDb <- "{hixDb}"
hixPort <- 1433
hixUser <- "{hixUser}"
hixPass <- "{hixPassword}"


# grab source name from HIX
sourceNameSql <- "select case
					when C.Name = D.Name then D.Name + ' v' + cast(A.loadId as varchar)
					else D.Name + ' ' + C.Name + ' v' + cast(A.loadId as varchar)
					end as cdm_name from HIX.dbo.load A
					join HIX.dbo.load B on A.LineageId = B.LoadId
					join HIX.dbo.VendorSchema C on B.VendorSchemaId = C.VendorSchemaId
					join HIX.dbo.Vendor D on C.VendorId = D.VendorId
					where A.loadid = @loadId;"

renderedSql <- SqlRender::renderSql(sql = sourceNameSql, loadId = loadId)$sql
connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = "sql server", 
                                             server = hixServer, 
                                             port = hixPort, 
                                             user = hixUser, 
                                             password = hixPass)
connection <- connect(connectionDetails)
sourceName <- querySql(connection = connection, sql = renderedSql)
DatabaseConnector::disconnect(connection)

outputRoot <- "{achillesJsonFolder}" # need to put a root folder for JSON file exports, use forward slashes


jsonPath <- paste0(outputRoot, "/", paste(db, loadId, sep = "_", collapse = ""))
unlink(x = jsonPath, recursive = TRUE, force = TRUE) 

connectionDetails <- createConnectionDetails(dbms="redshift",
                                             server=paste(rCluster, "/", db,
                                                          "?ssl=true&sslfactory=com.amazon.redshift.ssl.NonValidatingFactory",
                                                          sep="", collapse=""), port=5439, user=rUser, password=rPassword)

Achilles::achilles(connectionDetails = connectionDetails, 
         cdmDatabaseSchema = cdmDatabaseSchema,
         vocabDatabaseSchema = cdmDatabaseSchema,
         resultsDatabaseSchema = cdmDatabaseSchema,
         createTable = TRUE,
         runCostAnalysis = FALSE, 
         smallcellcount = 10,
         runHeel = FALSE,
         sourceName = sourceName,
         cdmVersion = "5",
         conceptHierarchy = TRUE,
         createIndices = FALSE,
         sqlOnly = FALSE)

Achilles::achillesHeel(connectionDetails = connectionDetails, cdmDatabaseSchema = cdmDatabaseSchema, 
             resultsDatabaseSchema = cdmDatabaseSchema, cdmVersion = "5", 
             vocabDatabaseSchema = cdmDatabaseSchema)

exportToJson(connectionDetails, cdmDatabaseSchema = cdmDatabaseSchema,
             resultsDatabaseSchema = cdmDatabaseSchema,
             outputPath = jsonPath,
             cdmVersion = "5", vocabDatabaseSchema = cdmDatabaseSchema)