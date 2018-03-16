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
		    'Optum’s Integrated Claims-Clinical Dataset combines adjudicated claims from Optum Clinformatics Extended DataMart along with Humedica’s Electronic Health Record data for the same patients, this makes it both a claims database and a medical records database.  The population is primarily representative of US commercial claims patients (0-65 years old) with some Medicare (65+ years old) however ages are capped at 90 years.  However this version only uses the EHR data portion of the data and ignores the claims portion.  The medical record data includes clinical information, inclusive of prescriptions as prescribed and administered, lab results, vital signs, body measurements, diagnoses, procedures, and information derived from clinical Notes using Natural Language Processing (NLP). 

The major data elements contained within this database are outpatient pharmacy dispensing claims (coded with National Drug Codes (NDC)) and NLP-sourced drug records, inpatient and outpatient medical claims which provide procedure codes (coded in CPT-4, HCPCs, ICD-9-CM or ICD-10-PCS) and diagnosis codes (coded in ICD-9-CM, ICD-10-CM or SNOMED).  The data also contain selected laboratory test results (those sent to a contracted thirds-party laboratory service provider) for a non-random sample of the population (coded with LOINC codes) and NLP-sourced measurements.  

[For further information link to RWE site for Optum Integrated.](https://catalog.rwe.jnj.com/index#jnjsearches?dataSetUri=%2Fdataset%2F4c6c9253-7625-4055-b33e-6fda9b1bc57e.xml)',
			'https://catalog.rwe.jnj.com/index#jnjsearches?dataSetUri=%2Fdataset%2F4c6c9253-7625-4055-b33e-6fda9b1bc57e.xml',
			'http://www.ohdsi.org/web/wiki/doku.php?id=documentation:example_etls',
			'{0}',
			'{3}',
			'V5.2.0',
			'{1}'
		   )