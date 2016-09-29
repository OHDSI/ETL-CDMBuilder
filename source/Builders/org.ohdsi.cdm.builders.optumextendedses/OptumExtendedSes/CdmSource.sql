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
		   'Optum Extended SES',
		   'SES',
		   'Janssen R&D',
		    'The Optum Extended SES and DOD databases consist of administrative health claims data from the Optum ClinFormatics Extended Data Mart (CEDM). Due to usage policy, CEDM has been split into three databases: DOD (Date of Death), Other (Non-Affiliate View), and SES (Socio-Economic Status). As such, the data should not be combined into one CDM. SES and DOD cover the same population: commercially-insured and Medicare Advantage Affiliate Members with linked Health Risk Assessment (HRA). However, they differ on a few points. SES features race and ethnicity information, but lacks official death data and granular patient location. DOD features official Social Security death data and granular patient location, but lacks race and ethnicity details.',
			'https://jnj.sharepoint.com/sites/PHM-GCSP-RND/RWE/Pages/DataSourceDetails.aspx?DataSourceItem=39',
			'https://github.com/OHDSI/ETL-CDMBuilder/tree/master/man',
			'{0}',
			'{3}',
			'V5.0',
			'{1}'
		   );

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Person','SES and DOD cover commercially-insured and Medicare Advantage Affiliate Members from birth until age 90. The older people are less representative as compared with the whole population, especially from 70 onward. The majority of patients, aside from newborns, is between ages 20-65. Only the birth year is available, but birth month is inferred if the start of the observation period aligns with the year of birth.
For SES, race consists of Asian, African American, White, and Unknown. Ethnicity can be either Hispanic or non-Hispanic. For SES, location is based on U.S. Census Division. For DOD, location is based on U.S. state.
');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Visit','Each insurance claim is translated into a visit. All data is capped to fall between observation periods. Claim types are utilized to then assign a visit type of inpatient, outpatient, emergency room, or long term care (as defined by CMS through Place of Service codes). OP, LTC, and ER visits are consolidated with IP visits if they occur within an IP visit.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation period','The observation period is defined as the time of enrollment in the health insurance. If the member is a dependent, the enrollment depends on the enrollment of the main beneficiary.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Location','');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Care Site','Optum does not have clear care site information so this table will only contain one row representing the fact that no care site information will be captured.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Condition','Conditions are obtained from medical claims’ diagnoses and procedure codes. Diagnoses codes originate from either ICD9CM or ICD10CM, while procedure codes could originate from ICD9Proc, ICD10PCS, CPT4, or HCPCS. The conditions are used to construct condition eras by linking diagnoses from the same institution for the same diagnose code with the same start of medical care.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Death','For both SES and DOD, death can be inferred from medical claims (ICD9CM and ICD10CM). Discharge statuses can also be used, although as of July 2016, there are no matching death discharge statuses in the data. 
For DOD, death can be obtained from the Death table; only year and month are available.
');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Procedure','Procedure occurrences must fall within an observation period, with duplicates removed. Procedure occurrences originate from medical claims’ procedure codes (CPT4, ICD9Proc, ICD10PCS), diagnosis codes (ICD9CM, ICD10CM), and lab results (LOINC, CPT4, ICD9Proc, ICD10PCS).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Measurement','Measurements must fall within an observation period, with duplicates removed. Measurements originate from lab results (LOINC, CPT4, ICD9Proc, ICD10PCS) and medical claims’ diagnosis codes (ICD9CM, ICD10CM) and procedure codes (CPT4, ICD9Proc, ICD10PCS).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation','The observations contain any records with a domain of observations or records that are unmapped.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Provider','Providers are obtained based on NPI and DEA numbers. Specialties have been mapped to a custom Vocabulary (JNJ_OPTUM_P_SPCLTY).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Drug','Drug exposures must fall within an observation period, with duplicates removed. Drug exposures can originate from prescription claims (NDC) and procedure codes from medical claims (ICD9Proc, HCPCS, CPT4). All drug exposures roll up to drug eras using ingredient level concepts, linked by time (within a 30-day interval).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Cohort','');
