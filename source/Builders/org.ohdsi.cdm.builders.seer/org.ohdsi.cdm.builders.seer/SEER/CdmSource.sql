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
		   'SEER',
		   'SEER',
		   'Janssen R&D',
		   'The SEER-Medicare data reflect the linkage of two large population-based sources of data that provide detailed information about Medicare beneficiaries with cancer. The data come from the Surveillance, Epidemiology and End Results (SEER) program of cancer registries that collect clinical, demographic and cause of death information for persons with cancer and the Medicare claims for covered health care services from the time of a person''s Medicare eligibility until death.
This database contains claims and registry data for patients with B-cell cancers, namely leukemia, lymphoma, and multiple myeloma as well as data for a random sample of Medicare beneficiaries. 
',
			'',
			'http://www.ohdsi.org/web/wiki/doku.php?id=documentation:example_etls',
			'{0}',
			'{3}',
			'V5.0',
			'{1}'
		   );

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Person','Person data is pulled from the SEER registry information. Any person born before 1900 or after 2015 is removed.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Visit','A standardized definition of visit logic is applied to our U.S. claims data.  SEER-Medicare applies methods to define inpatient and outpatient visits however we had to create logic to attribute carrier and device claims to visits.  Inpatient visits defined by Medicare remain as IP unless they have a indicator suggesting it is actually a long-term care visit. Outpatient, physician, and device services during the middle of an inpatient stay are associated to that inpatient stay. Remaining outpatient claims are considered outpatient visits unless they have a revenue code suggesting they are actually ER visits. Any physician and device services during the middle of an outpatient visit are attributed to that outpatient stay.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation period','An observation period is a representation of when a patient was enrolled in Medicare Part A and Medicare Part B and not enrolled in an HMO. This is due to the fact that HMO plans are handled by third party vendors and the resulting claims are not available in the SEER-Medicare database.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Location','Location in SEER-Medicare represents the states that participate in the cancer registry.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Care Site','The only care site information available is the state in which the care was given so care site represents a state rather than an institution.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Condition','Condition records are primarily recorded as codified claims data (e.g. ICD9 or ICD10 records that are submitted associated with a service).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Death','SEER-Medicare endeavors to reconcile death data from claims with publicly available information and death certificates where possible. If a death date is listed in the registry file then that date is used first otherwise the death date from the claims information is used.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Procedure','Procedure occurrence records are recorded as codified claims data (e.g. a CPT4 code or ICD9 procedure code).  If the OMOP Vocabulary deems a procedure code to be of a type of another domain (e.g. CPT4- 90690- “Typhoid vaccine, live, oral” maps to drug concept in the OMOP Vocabularies so the CDM_BUILDER will move the record to the DRUG_EXPOSURE table instead of the procedure table) however in the case of the primary procedure code those will always write a record to this table in order to maintain cost data.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Measurement','The only lab data available in SEER-Medicare is a hemoglobin test, however, if the OMOP Vocabulary deems a code of a non-traditional measurement centric vocabulary is in fact a measurement, the record will move to this table (e.g. ICD9- V85.22- “Body Mass Index 26.0-26.9, adult” usually thought of as a diagnosis code maps to a measurement concept in the OMOP Vocabularies so the CDM_BUILDER will move the record to the MEASUREMENT table).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation','All of the registry data collected by SEER is currently housed in this table as well as any codified data that is not a diagnosis, drug exposure, procedure, or measurement will become an observation. In order to determine the source table a patient came from (leukemia, lymphoma, multiple myeloma, 5 percent random sample) the variable OBSERVATION_SOURCE_VALUE will show the name of the source table collated with the name of the original variable as it appeared in the registry. There are over 2,000 registry variables available per patient.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Provider','Unique list of health care providers (physicians).  SEER-Medicare does provide some provider information however not all is available. Providers are first identified by their national provider number and if that is not available then their unique physician identification number is used.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Drug','Drug exposure records are primarily recorded as codified claims data (e.g. an NDC code or a procedure code that includes a drug).  If the OMOP Vocabulary deems a code of a non-traditional drug centric vocabulary is in fact a drug exposure, the record will move to this table (e.g. CPT4- 90690- “Typhoid vaccine, live, oral” maps to drug concept in the OMOP Vocabularies so the CDM_BUILDER will move the record to the DRUG_EXPOSURE table instead of the procedure table).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Cohort','Any cohorts created using this database are housed here.');


