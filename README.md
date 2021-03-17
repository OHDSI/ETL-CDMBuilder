Introduction
========

This repository forked from OHDSI/ETL-CDMBuilder https://github.com/OHDSI/ETL-CDMBuilder.

The .Net CDM Builder was developed by Janssen Research & Development as a tool to transform its observational databases into the OMOP Common Data Model. The tool was specifically developed for the Janssen environment: MS SQL Server/PostgreSQL/MySQL.  Additionally, the builder logic designed is based on the input format of the source data that are loaded in our local environment. We have made the tool open-source as a reference for other researchers in the OHDSI community who may be looking ETL their observational data, but we do not expect the tool would execute successfully for others unless they have similar infrastructure and similar source datasets. The tool was not originally designed to support general purpose ETLs across different platforms, and modifications would be required to apply to other systems. Contributions from the community to advance the tool in that direction are welcome and encouraged, as our team cannot support and test the tool in other environments.

This service wraps **CDM-builder** functional in Web-service, that used by **Perseus** https://github.com/SoftwareCountry/Perseus.

Technology
============
* The CDM Builder was created using the .NET Core 3.1 and is meant to be executed against Microsoft SQL Server 2012+ databases, PostgreSQL and MySQL databases. 

System Requirements (for each server that will be running CDM Builder)
============
* .NET Core 3.1 
* Visual Studio 2019+ is only required if you're looking to re-build the solution from source code
* SQL Server builds: MS SQL ODBC Driver
* PostgreSQL builds: PostgreSQL ODBC Driver
* MySQL builds: MySQL ODBC Driver

Dependencies
============
 * A SQL Server or PostgreSQL or MySQL database of the OMOP Vocabulary must be accessible within your network. This will be used to map source concepts into CDM concepts.
 * For SQL Server, SQL-based accounts are needed, as Trusted Connections via Windows Authentication are not supported.
 * In the MAN\VOCAB_ADDITIONS folder, you will need to append these files to the OMOP Vocabulary (i.e. add the JNJ_TRU_P_SPCLTY file to the records already in SOURCE_TO_CONCEPT_MAP and do the same for the VOCABULARY table with JNJ_VOCABULARY).

Getting Started
===============

    docker build -f "source/org.ohdsi.cdm.presentation.builderwebapi/Dockerfile" -t cdm-builder-service .
    docker run -d --network host --name cdm-builder-service cdm-builder-service

Kicking off a Build
===============
* Windows environment
    - Go to the ETL-CDMBuilder\executable\ folder
    - Update org.ohdsi.cdm.presentation.builder.dll.config file (Uncomment necessary rows):
        1. Select necessary vendor ("Vendor", "PersonBuilder")
        2. Select CDM version ("CDM")
        3. Choose connection string templates (MsSQL, PostgreSQL or MySQL) for source, destination and vocabulary databases. ("SourceConnectionStringTemplate", "DestinationConnectionStringTemplate", "VocabularyConnectionStringTemplate")
    - Run org.ohdsi.cdm.presentation.builder.exe
    - [settins tab] Through UI specify source, destination and vocabulary settings (server, database name, schema name, user and password)
    - Go [building tab] click start button

Getting Involved
=============
* Developer questions/comments/feedback: <a href="http://forums.ohdsi.org/c/developers">OHDSI Forum</a>
* We use the <a href="../../issues">GitHub issue tracker</a> for all bugs/issues/enhancements

License
=======
ETL-CDMBuilder is licensed under Apache License 2.0
