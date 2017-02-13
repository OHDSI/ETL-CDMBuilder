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
		   'Truven Health MarketScan® Multi-State Medicaid Database',
		   'MDCD',
		   'Janssen R&D',
		   'The Truven Health MarketScan® Research Databases contain individual-level, de-identified, healthcare claims information from employers, health plans, hospitals, Medicare, and Medicaid programs. Since their creation in the early 1990s, the MarketScan Databases have grown into one of the largest collections of de-identified patient-level data in the nation. These databases reflect the real-world of treatment patterns and costs by tracking millions of patients as they travel through the healthcare system offering detailed information about all aspects of care. Data from individual patients are integrated from all providers of care, maintaining all healthcare utilization and cost record connections at the patient level. Used primarily for research, these databases are fully HIPAA compliant. Research using MarketScan data has been widely publicized in peer-reviewed journals.
This retrospective claims analysis utilized data from the Truven Health MarketScan® Medicaid Database for the period of [starting date] to [ending date]. These data included health insurance claims for seven million Medicaid enrollees from multiple states across the continuum of care (e.g. inpatient, outpatient, and outpatient pharmacy) as well as variables of interest for Medicaid populations, such as ethnicity and Medicare eligibility.
',
			'http://hicoe.jnj.com/DataSources/Truven/MDCD',
			'http://www.ohdsi.org/web/wiki/doku.php?id=documentation:example_etls',
			'{0}',
			'{3}',
			'V5.0',
			'{1}'
		   );

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Person','Person information is pulled from insurance enrollment data where the individual both has medical and prescription benefits or the individual has both Medicaid and Medicare eligibility. The month of birth is not provided however for enrollees who start their enrollment the year they are born we extrapolate their month of birth from the month where their enrollment starts, for the majority of patients only year of birth is available.  Persons who change gender over their enrollments or change year of birth are excluded.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Visit','A standardized definition of visit logic is applied to our U.S. claims data.  The data vendors do apply methods to define inpatient, outpatient, ER and long term care visits however we have found inconsistencies between the data vendors of claims data.  Inpatient visits defined by Truven remain as IP unless they have a revenue code suggesting it is actually an ER visit.  Additionally outpatient service charges that are associated to room and board are categorized as inpatient.  ER or outpatient services during the middle of an inpatient stay are associated to that inpatient stay.  To learn additional information please refer to the publication:
Voss EA, Ma Q, Ryan PB. The impact of standardizing the definition of visits on the consistency of multi-database observational health research. BMC Med Res Methodol. 2015 Mar 8;15:13. doi: 10.1186/s12874-015-0001-6. PubMed PMID: 25887092; PubMed Central PMCID: PMC4369827.
');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation period','An observation period is a representation of when a patient was enrolled in a health insurance plan and had prescription benefits.  Periods of continuous enrollment are consolidated by combining monthly records as long as the time between the end of one enrollment period and the start of the next is 32 days or less.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Location','Truven provides no location information for this database.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Care Site','There is not clear care site information in this source so no data will be captured within this table.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Condition','Condition records are primarily recorded as codified claims data (e.g. ICD9 or ICD10 records that are submitted associated with a service).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Death','Death in Truven can be captured at discharge from an inpatient visits or in some cases by diagnosis code.  The death data in this source should not be considered complete, for example if a patient left a hospital and later died at home that would not be captured.  Additionally if a death was recorded however if the patient continues to have services charges after 30 days of the death date we assume the death data was faulty.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Procedure','Procedure occurrence records are recorded as codified claims data (e.g. a CPT4 code or ICD9 procedure code).  If the OMOP Vocabulary deems a procedure code to be of a type of another domain (e.g. CPT4- 90690- “Typhoid vaccine, live, oral” maps to drug concept in the OMOP Vocabularies so the CDM_BUILDER will move the record to the DRUG_EXPOSURE table instead of the procedure table) however in the case of the primary procedure code those will always write a record to this table in order to maintain cost data.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Measurement','Truven MDCD does not contain lab data, however, if the OMOP Vocabulary deems a code of a non-traditional measurement centric vocabulary is in fact a measurement, the record will move to this table (e.g. ICD9- V85.22- “Body Mass Index 26.0-26.9, adult” usually thought of as a diagnosis code maps to a measurement concept in the OMOP Vocabularies so the CDM_BUILDER will move the record to the MEASUREMENT table).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation','Codified data that is not a diagnosis, drug exposure, procedure, or measurement will become an observation.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Provider','Unique list of health care providers (physicians).  Truven does provide some provider information however some of the providers listed by Truven may also be considered care sites or organizations.  Since there is not clear way to decipher between all items identified as providers by Truven, regardless if they are truly organizations or care sites, they will be added to this table.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Drug','Drug exposure records are primarily recorded as codified claims data (e.g. an NDC code or a procedure code that includes a drug).  If the OMOP Vocabulary deems a code of a non-traditional drug centric vocabulary is in fact a drug exposure, the record will move to this table (e.g. CPT4- 90690- “Typhoid vaccine, live, oral” maps to drug concept in the OMOP Vocabularies so the CDM_BUILDER will move the record to the DRUG_EXPOSURE table instead of the procedure table).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Cohort','No preprocessed cohorts exit.');
