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
		   'Optum’s Integrated Claims-Clinical Dataset (EHR Data Only)',
		   'Optum EHR Only',
		   'Janssen R&D',
		    'Optum© de-identified Electronic Health Record Dataset represents Humedica’s Electronic Health Record data a medical records database.  The medical record data includes clinical information, inclusive of prescriptions as prescribed and administered, lab results, vital signs, body measurements, diagnoses, procedures, and information derived from clinical Notes using Natural Language Processing (NLP).',
			'https://catalog.rwe.jnj.com/index#jnjsearches?dataSetUri=%2Fdataset%2F4c6c9253-7625-4055-b33e-6fda9b1bc57e.xml',
			'http://www.ohdsi.org/web/wiki/doku.php?id=documentation:example_etls',
			'{0}',
			'{3}',
			'V5.2.0',
			'{1}'
		   )