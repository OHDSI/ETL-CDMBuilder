truncate table {sc}.CDM_SOURCE;
truncate table {sc}.CDM_DOMAIN_META;

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
		   'Optum Integrated',
		   'OptumIntegrated',
		   'Janssen R&D',
		    'Optum’s Integrated Claims-Clinical Dataset combines adjudicated claims from Optum Clinformatics Extended DataMart along with Humedica’s Electronic Health Record data for the same patients, this makes it both a claims database and a medical records database.  The population is primarily representative of US commercial claims patients (0-65 years old) with some Medicare (65+ years old) however ages are capped at 90 years.  The Integrated dataset includes historical, linked administrative claim data, prescriptions as dispensed, physician claims, and facility claims, with clinical information, inclusive of prescriptions as prescribed and administered, lab results, vital signs, body measurements, diagnoses, procedures, and information derived from clinical notes using Natural Language Processing.  [For further information link to RWE site for Optum Integrated.](https://catalog.rwe.jnj.com/index#jnjsearches?dataSetUri=%2Fdataset%2F4c6c9253-7625-4055-b33e-6fda9b1bc57e.xml)',
			'https://jnj.sharepoint.com/sites/PHM-GCSP-RND/RWE/Pages/DataSourceDetails.aspx?DataSourceItem=36',
			'http://www.ohdsi.org/web/wiki/doku.php?id=documentation:example_etls',
			'{0}',
			'{3}',
			'V5.0',
			'{1}'
		   )