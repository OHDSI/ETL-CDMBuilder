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
		   'Premier',
		   'Premier',
		   'Janssen R&D',
		   'Premier is a US hospital database that houses data on the inpatient and outpatient visits of 119 million people from 619 hospitals since 1999. The data represent 1 in 5 inpatient hospital stays in the US. It is a visit-centric, billing database where each visit is linked with a unique billing record. The process by which Premier is transformed to the patient-centric OMOP CDM is described in detail by Makadia and Ryan (2014) here: http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4371500/. Premier is not an insurance claims database.',
			'http://hicoe.jnj.com/DataSources/Premier',
			'http://www.ohdsi.org/web/wiki/doku.php?id=documentation:example_etls',
			'{0}',
			'{3}',
			'V5.0',
			'{1}'
		   );


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Person','Premier covers individuals from 0-90 years of age. Persons of 0 years of age are disproportionately represented because of in-hospital births. Persons of 90 years of age are overrepresented because the data capture system truncates age at 90 years. The covered population is 56% female. Race data include Black/African American, White, and other race and ethnicity data include an indicator for Hispanic/Latino.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Visit','Admission and discharge date information for a patient visit is recorded as month and year only, with the day set as the first of the month. Billing information for the visit includes the number of days since admission that a billable item or service was provided, so the maximum value of the service day is the length of stay. The order of multiple visits within a month is preserved by visit sequence information. For a subsequent visit in a month, the admission day is set as one day after the discharge date (i.e. maximum service day value) of the previous visit. Where admission date and discharge date are different months, the maximum service day value is subtracted from the discharge date to obtain the length of stay. The specific day of the visit start date and visit end date is not necessarily accurate, nor is the interval between visits. This logic assures the sequential order of visits and length of stay is accurate.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation period','Patient observation periods are defined using the visit occurrence table.  One visit is considered one observation period unless the visit end date or visit start date of an adjacent visit are fewer than 31 days from the visit start date or visit end date, respectively. Where a visit start date is within 31 days of the previous visit end date, the visits are collapsed into a single observation period.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Location','');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Care Site','Care site records represent hospitals. Hospital data include urban/rural locale, teaching hospital status, and number of beds.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Condition','Admitting, primary, and secondary conditions are recorded as ICD9-CM codes by visit. The day of diagnosis is unknown it is assumed that the condition start date is equal to the visit start date, as calculated in the visit occurrence table. Condition end date is null. Condition occurrence records are linked the admitting provider.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Death','In-hospital death information is captured by patient discharge status and diagnostic codes indicating death. In cases where death is recorded in both sources for one patient, the record from discharge status is used.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Procedure','Procedures are recorded as ICD9 procedure codes, CTP codes, and in billing records. Procedure records from ICD9 procedure and CTP codes are associated with a visit but it is unknown on which day of the visit the procedure occurred, so the procedure date is set as the last day of the visit. Procedures from the billing records include service day information, so procedure date is the number of service days since the visit start date. If the number of service days is greater than the end of the month, procedure date is truncated to the end of the month.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Measurement','Measurement information is housed as CPT codes and as billing records. Measurement records from CTP codes are associated with a visit but it is unknown on which day of the visit the measurement was made, so the measurement date is set as the last day of the visit. Measurements from the billing records include service day information, so measurement date is the number of service days since the visit start date. If the number of service days is greater than the end of the month, measurement date is truncated to the end of the month. Measurement orders are recorded but measurement values are not');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation','The observation table includes information on demographics and additional visit-related data. Observations are record as DRG, certain ICD9, and CPT codes, as well as billing records. Example observation records include marital status, admission information, discharge status, and patient type.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Provider','Each hospital (i.e. care site) is associated with a set of unique health service providers. An admitting provider is indicated for each visit. Each provider is linked to a specialty.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Drug','Drug administrations are recorded as ICD9 procedure codes, CTP codes, and in billing records. Drug records from ICD9 procedure and CTP codes are associated with a visit but it is unknown on which day of the visit the drug was administered, so drug exposure start date is set as the last day of the visit. Drug administrations from billing records include service day information, so drug exposure start date is the number of service days since the visit start date. If the number of service days is greater than the end of the month, drug exposure start date is truncated to the end of the month. The quantity of drugs administered is only known for drugs from the billing records.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Cohort','');
