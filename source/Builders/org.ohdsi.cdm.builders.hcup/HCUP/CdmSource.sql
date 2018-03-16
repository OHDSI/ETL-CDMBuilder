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
		   'The Healthcare Cost and Utilization Project (HCUP), Nationwide Inpatient Sample (NIS)',
		   'HCUP',
		   'Janssen R&D',
		   'The Healthcare Cost and Utilization Project (HCUP) National Inpatient Sample (NIS) database is a representative sample of non-federal US community hospital data, collected under sponsorship of the Agency for Healthcare Research and Quality (AHRQ).  The publicly available data includes inpatient diagnoses (coded as ICD-9), procedures (ICD-9 Procedures), discharge status, demographics, and charges for hospital care in the United States, regardless of payer for patients of all ages.  Information on drugs and devices is not included.  The HCUP data is based on hospital visits, with no information linking multiple visits of the same patient together. 

[For further information link to RWE site for HCUP.](https://catalog.rwe.jnj.com/index#jnjsearches?dataSetUri=%2Fdataset%2F83fff67e-66ac-41dc-9d40-8c400846528e.xml)',
		   'https://catalog.rwe.jnj.com/index#jnjsearches?dataSetUri=%2Fdataset%2F83fff67e-66ac-41dc-9d40-8c400846528e.xml',
		    'https://github.com/OHDSI/JCdmBuilder',
			'{0}',
			'{3}',
			'5.0.1',
			'{1}'
		   );

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Person','For every visit an entry has been created in the person table, because we are not able to link multiple visits from the same patient together.  For most children under 1 year old at admission the exact date of birth could be derived, for all others only the age in years and hence the approximate year of birth is available.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Visit','Only the calendar month of the admission date is available,  the day of the month has been imputed based on whether the admission date was classified as weekday or weekend. Visit end date is defined as visit start date + length of stay.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation period','Observation periods are an exact copy of the visit occurrences; the patient is only assumed to be observed during their hospital visit.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Location','For every county found in the database a location record has been created.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Care Site','One records has been created for each hospital in the database.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Condition','Principal and secondary diagnoses during hospitalization. Also included are external cause of injury codes. The condition start date is assumed to be the visit start date.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Death','Data on in-hospital death was captured for almost all patients.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Procedure','Procedures performed during hospitalization. For procedures the exact day of the procedure (relative to the visit start date) is available. Some of the procedure occurrences are derived from diagnose codes using the vocabulary.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Measurement','Some of the diagnose codes mapped to the measurement domain and were recorded here.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation','Some of the diagnose codes mapped to the observation domain and were recorded here. Also, the sample weights (per discharge) are recorded in the observation table.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Provider','');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Drug','');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Cohort','');