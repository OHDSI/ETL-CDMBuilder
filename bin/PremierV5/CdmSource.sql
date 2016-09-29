INSERT INTO {sc}.CDM_SOURCE
           (CDM_SOURCE_NAME
           ,CDM_SOURCE_ABBREVIATION
           ,CDM_HOLDER
           ,SOURCE_DESCRIPTION
           ,SOURCE_DOCUMENTATION_REFERENCE
           ,CDM_ETL_REFERENCE
           ,SOURCE_RELEASE_DATE
           ,CDM_RELEASE_DATE
           ,CDM_VERSION
           ,VOCABULARY_VERSION)
     VALUES
           (
		   'Premier',
		   'Premier',
		   'Janssen R&D',
		   'Anonymized hospital transactional database from over 500 hospitals from 2000-present day includes inpatient, outpatient and emergency room visits.
The database is a visit-oriented database, with each visit having its own unique id. 
Conditions are coded as ICD9 codes and procedures are coded both in ICD9,CPT and HCPCS procedure codes. Drugs, labs, and other procedures are coded as a standard charge code and occur as a transaction. 
Cost information is associated to each transaction including charges and quantity of each transaction is recorded in the billing table.
',
			'http://hicoe.jnj.com/DataSources/Premier',
			'http://www.ohdsi.org/web/wiki/doku.php?id=documentation:example_etls',
			'{0}',
			'{3}',
			'V5.0',
			'{1}'
		   )