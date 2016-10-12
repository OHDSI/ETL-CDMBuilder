Technology
============
* The CDM Builder was created using the Microsoft .NET framework (version 4.6+) and is meant to be executed against Microsoft SQL Server 2012+ databases and Amazon Redshift databases. 
* The CDM Builder is only intended to run in a Windows environment. 

System Requirements (for each server that will be running CDM Builder)
============
* .NET version 4.6+
* Visual Studio 2011+ is only required if you're looking to re-build the solution from source code
* SQL Server builds: SQL Server Native Client ODBC Driver (<a href="https://www.microsoft.com/en-us/download/details.aspx?id=36434">https://www.microsoft.com/en-us/download/details.aspx?id=36434</a>)
* Amazon Redshift builds: Amazon Redshift (x64) ODBC Driver (<a href="http://docs.aws.amazon.com/redshift/latest/mgmt/install-odbc-driver-windows.html">http://docs.aws.amazon.com/redshift/latest/mgmt/install-odbc-driver-windows.html</a>)

Dependencies
============
 * A SQL Server or Amazon Redshift database of the OMOP Vocabulary must be accessible within your network. This will be used to map source concepts into CDM concepts.
 * For SQL Server, SQL-based accounts are needed, as Trusted Connections via Windows Authentication are not supported.
 * In the MAN\VOCAB_ADDITIONS folder, you will need to append these files to the OMOP Vocabulary (i.e. add the JNJ_TRU_P_SPCLTY file to the records already in SOURCE_TO_CONCEPT_MAP and do the same for the VOCABULARY table with JNJ_VOCABULARY).

Getting Started
===============
* Download from the GitHub CDM Builder https://github.com/OHDSI/ETL-CDMBuilder/tree/master/source.
* The application requires the configuration of three databases: Source of non-CDM data, Destination (where to build the CDM data), and Vocabulary (the OMOP Vocabulary)
    - Connection strings and credentials for CDM Builder database can be configured either in the config file (<b>org.ohdsi.cdm.presentation.buildingmanager.exe.config</b>) or within the actual CDM Builder application (<b>org.ohdsi.cdm.presentation.buildingmanager.exe</b>)
    - Connection string examples (fill in the bolded values with your environment's values)
        - SQL Server (SQL-based accounts only)
            - Driver={SQL Server Native Client 11.0};Server=<b>HOST_NAME</b>;Database=<b>VOCAB_DB_NAME</b>;Uid=<b>USER_NAME</b>;Pwd=<b>PASSWORD</b>
        - Amazon Redshift
            - Driver={Amazon Redshift (x64)};Server=<b>HOST_NAME</b>;Database=<b>CDM_DB_NAME</b>;Sc=<b>SCHEMA_NAME</b>;Uid=<b>USER_NAME</b>;Pwd=<b>PASSWORD</b>;Port=<b>PORT</b>;SSL=<b>USE_SSL</b>;Sslmode=<b>SSL_MODE</b>                            
* As the Build process can be time- and resource-intensive, CDM Builder can be executed using multiple Windows servers. This is optional, but recommended, especially for larger databases. 

Kicking off a Build
=============
* The CDM Builder comes with several pre-written ETLs, each of which corresponds to a specific data vendor and data product. Select the appropriate vendor from the "Vendor" dropdown
    - The vendors and products can be found here: <a href="https://github.com/OHDSI/ETL-CDMBuilder/tree/master/man">https://github.com/OHDSI/ETL-CDMBuilder/tree/master/man</a>
* Builder Settings
    - The “Number of batches” field can be used to specify if you want to convert the entire source database (0) or a sample size for testing purposes. 
    - The “Batch size” refers to the number of person(s) that should be part of each those batches. 
    - The “MaxDegreeofParallelism” establishes the number of processes to start on this particular machine. This value should be based on the hardware resources at your disposal.  
    - It has been observed that a server with a 24-core CPU and 256 GB RAM should invoke 10 processes for optimal performance. Similarly, for a workstation with a 2-core CPU and 12 GB RAM, 3-4 processes was the best choice. Using these examples, you should determine the number of processes that fit best with your hardware configuration.


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
