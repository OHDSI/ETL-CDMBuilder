Technology
============
* The CDM Builder was created using the Microsoft .NET framework (version 4.6+) and is meant to be executed against Microsoft SQL Server 2012+ databases and Amazon Redshift databases. It is only intended to run in a Windows environment. 
* Visual Studio 2011+ is required for building the solution.

System Requirements
============
* SQL Server Native Client and .NET version 4.6+ are required on each server that will be running CDM Builder.
* Amazon Redshift ODBC Driver

Dependencies
============
 * A SQL Server database of the OMOP Vocabulary must be accessible within your network. This will be used to map source concepts into CDM concepts.
 * In the MAN\VOCAB_ADDITIONS folder, you will need to append these files to the OMOP Vocabulary (i.e. add the JNJ_TRU_P_SPCLTY file to the records already in SOURCE_TO_CONCEPT_MAP and do the same for the VOCABULARY table with JNJ_VOCABULARY).

Getting Started
===============

  - Download from the GitHub CDM Builder https://github.com/OHDSI/ETL-CDMBuilder/tree/master/source.
   - Specify connection string for CDM Builder database (only MS SQL database) in org.ohdsi.cdm.presentation.buildingmanager.exe.config or through CDM Builder GUI, CDM Builder will create Builder db and all necessary tables 
       - connection string example: 
                                    ...
                                    <connectionStrings>
                                    ...
                                        <add name="Builder" connectionString="Data Source=...;Initial Catalog=...;User Id=...;Password=...;Connection Timeout=0;"/>
                                    ...
                                    </connectionStrings>
                                    ...
                                    
   - As the Build process can be time- and resource-intensive, CDM Builder can be executed using multiple Windows servers. This is optional, but recommended, especially for larger databases. 
   -The following executable is the Builder GUI that can be used on each of the Build servers: ..\org.ohdsi.cdm.presentation.buildingmanager.exe 

Getting Involved
=============
* User Guide:  <a href="https://github.com/OHDSI/ETL-CDMBuilder/blob/master/man/ETL-CDMBuilder.docx">ETL-CDMBuilder</a>
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
