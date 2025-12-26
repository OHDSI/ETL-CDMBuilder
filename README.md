The .Net CDM Builder was developed by Janssen Research & Development as a tool to transform its observational databases into the OMOP Common Data Model. The tool was specifically developed for the Janssen environment: MS SQL Server/PostgreSQL.  Additionally, the builder logic designed is based on the input format of the source data that are loaded in our local environment. We have made the tool open-source as a reference for other researchers in the OHDSI community who may be looking ETL their observational data, but we do not expect the tool would execute successfully for others unless they have similar infrastructure and similar source datasets. The tool was not originally designed to support general purpose ETLs across different platforms, and modifications would be required to apply to other systems. Contributions from the community to advance the tool in that direction are welcome and encouraged, as our team cannot support and test the tool in other environments.

Technology
============
* The CDM Builder was created using the .NET 8.0 and is meant to be executed against Microsoft SQL Server 2012+ databases, PostgreSQL databases. 

System Requirements (for each server that will be running CDM Builder)
============
* .NET 8.0 
* Visual Studio 2019+ is only required if you're looking to re-build the solution from source code
* SQL Server builds: MS SQL ODBC Driver
* PostgreSQL builds: PostgreSQL ODBC Driver
* Java

Dependencies
============
 * A SQL Server or PostgreSQL database of the OMOP Vocabulary must be accessible within your network. This will be used to map source concepts into CDM concepts.
 * For SQL Server, SQL-based accounts are needed, as Trusted Connections via Windows Authentication are not supported.
 * Java must be installed and be setup in PATH environmenal variables for the translator to work

Getting Started
===============
* Download from the GitHub CDM Builder https://github.com/OHDSI/ETL-CDMBuilder/tree/master/source.
* The application requires the configuration of three databases: Source of non-CDM data, Destination (where to build the CDM data), and Vocabulary (the OMOP Vocabulary)
    - Connection strings templates (MS SQL, PostgreSQL) and Vendor for CDM Builder database can be configured either in the config file (<b>App.config</b>)
* The CDM Builder comes without any pre-written ETLs. It uses the code from the OHDSI/ETL-LambdaBuilder repository
    - The vendors and products can be found here: <a href="https://github.com/OHDSI/ETL-LambdaBuilder/tree/master/docs">https://github.com/OHDSI/ETL-LambdaBuilder/tree/master/docs</a>

Kicking off a Build
===============
* Windows environment
    - Go to the ETL-CDMBuilder\source\RunLocal folder
    - Update App.config file:
        1. Check actual driver names in the ODBC Data Sources system application
        2. Update drivers in the connection strings with the actual driver names
	- Either
		1. Specify settings as the program arguments
			- Some examples of correct settings can be found in the file Properties\launchSettingsExample.json
		2. Change settings in the /Bats/<vendor>.bat file.
	- (Optionally) To overwrite and tweak DDL or transformation queries copy the files with the required changes from ETL-LambdaBuilder to a separate directory and set QueryOverwriteFolderPath parameter to that directory.
		- The files must folow this structure:
		  <QueryOverwriteFolderPath>/<RDBMS name for DDL or vendor name for tranformations>/<file copy with the same name as original>
    - Run RunLocal.exe or a bat for the required vendor

Notes
===============
* This application heaviliy relies on ETL-LambdaBuilder project. 
* As it translates code from one SQL dialect to another, errors are likely to happen in case of changes in source SQL code.
* So after any relevant SQL code update in ETL-LambdaBuilder this project should be updated as well.

Getting Involved
=============
* Developer questions/comments/feedback: <a href="http://forums.ohdsi.org/c/developers">OHDSI Forum</a>
* We use the <a href="../../issues">GitHub issue tracker</a> for all bugs/issues/enhancements

License
=======
ETL-CDMBuilder is licensed under Apache License 2.0

Development
===========

###Development status
Beta testing, source is not set up properly to deploy an executable this release.

Acknowledgements
===========
Janssen Pharmaceutical Research & Development, LLC
