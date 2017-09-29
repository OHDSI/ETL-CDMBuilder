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
		   'CPRD',
		   'CPRD',
		   'Janssen R&D',
		   'The Clinical Practice Research Datalink (CPRD) is a governmental, not-for-profit research service, jointly funded by the NHS National Institute for Health Research (NIHR) and the Medicines and Healthcare products Regulatory Agency (MHRA), a part of the Department of Health, United Kingdom (UK).  CPRD consists of data collected from UK primary care for all ages.  This includes conditions, observations, measurements, and procedures that the general practitioner is made aware of in additional to any prescriptions as prescribed by the general practitioner.  In addition to primary care, there are also linked secondary care records for a small number of people. [For further information link to RWE site for CPRD.](https://catalog.rwe.jnj.com/index#jnjsearches?dataSetUri=%2Fdataset%2Fe3d6a6b5-a712-456f-9418-31b9c4f4c4fb.xml)',
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
           ('Person','CPRD covers all age groups however a study comparing the general UK age/gender proportions recorded during the 2011 census with the age/genders of the CPRD population showed that the ages 0-4 and 15-29 were slightly less represented in the CPRD population compared to the general UK population.
In general, only the year of birth is exact and the month is only recorded accurately for people aged under 16.  The day of birth is never recorded.
');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Visit','For the outpatient visits, all activity that is recorded on a single day for a person is considered to have occurred during one visit with the visit start and end date corresponding to this date. For inpatient visits, the start date is the date of admission to a hospital and the end date is the date of discharge.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation period','The observation period is defined as the time at which the person is registered at a participating practice and the practice records are considered valid.  The observation start is the latest out of the date the practice is deemed to be of research quality and the date the person registered at the practice and the observation end date is the earliest out of the date the patient transferred out of the practice, the date the patient died or the date the practice data were last updated.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Location','The location table is not included in CPRD.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Care Site','Care sites in CPRD are the general practices and the care site location is the region that the practice is located.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Condition','The condition occurrence is populated by the ‘Clinical’, ‘Referral’, and ‘Test’ outpatient records (that use Read codes) and the HES_ diagnosis_epi and HES_primary_diag_hosp inpatient records (that use ICD10 codes).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Death','Death is generally well recoded within the CPRD but the cause of death is unknown unless additional linked data sources (Office of National Statistics) are requested.  In general, using the Office of National Statistics death date is more accurate but the CPRD calculated death date may be more accurate than the Office of National Statistics dates for recent data due to potential delays in reporting death to the Office of National Statistics.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Procedure','Medical procedures are extracted from the CPRD GOLD (outpatient using Read codes) and HES (inpatient using OPCS and ICD10).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Measurement','Contains all Read code recorded with a corresponding measurement domain.  Also includes ‘Family member identifier’ and ‘Marital’ extracted from the CPRD patient table and inpatient measurements (including maternity information).');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation','The observations contain any records with a domain of observations or records that are unmapped.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Provider','In CPRD the provider corresponds to the member of staff who entered the data and may not correspond to the actual provider of care.  The HES provider corresponds to the member of staff who performs the care and their specialty is also available.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Drug','Drug exposures include a mix of prescriptions and immunizations records.  Only prescriptions from CPRD GOLD (outpatient: primary care) are recorded, inpatient prescribing/dispensing is not recorded.  This also excludes over the counter medication.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Cohort','The cohort table contains the people who also have inpatient data. This cohort has a cohort_definition_id of 224 and the cohort period is the overlap between the person’s outpatient observational period and their hospital stay. The cohort start period is the maximum of the person’s observational period start date and the start date of the hospital observation, whereas the cohort end date if the minimum of the person’s observational period end date and the end date of the hospital observation.');