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
		   'Japan Medical Data Center (JMDC)',
		   'JMDC',
		   'Janssen R&D',
		   'Japan Medical Data Center (JMDC) database consists of data from 60 Society-Managed Health Insurance plans covering workers aged 18 to 65 and their dependents (children younger than 18 years old and elderly people older than 65 years old).  JMDC data includes membership status of the insured people and claims data provided by insurers under contract (e.g. patient-level demographic information, inpatient and outpatient data inclusive of diagnosis and procedures, and prescriptions as dispensed claims information).  Claims data are derived from monthly claims issued by clinics, hospitals and community pharmacies; for claims only the month and year are provided however prescriptions, procedures, admission, discharge, and start of medical care as associated with a full date.  

All diagnoses are coded using ICD-10. All prescriptions refer to national Japanese drug codes, which have been linked to ATC. Procedures are encoded using local procedure codes, which the vendor has mapped to ICD-9 procedure codes. The annual health checkups report a standard battery of measurements (e.g. BMI), which are not coded but clearly described.

[For further information link to RWE site for JMDC.](https://catalog.rwe.jnj.com/index#jnjsearches?dataSetUri=%2Fdataset%2F06d7e4d1-6000-4779-bdc9-16ace880912a.xml)',
			'https://catalog.rwe.jnj.com/index#jnjsearches?dataSetUri=%2Fdataset%2F06d7e4d1-6000-4779-bdc9-16ace880912a.xml',
			'https://github.com/OHDSI/ETL-CDMBuilder',
			'{0}',
			'{3}',
			'V5.2.0',
			'{1}'
		   );

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Person','JMDC covers workers aged 18 to 65 and their dependents (children younger than 18 years old and elderly people older than 65 years old).  The old people (particularly those aged 66 or older) are less representative as compared with whole population in the nation.  When estimated among the people who are younger than 66 years old, the proportion of children younger than 18 years old in JMDC is approximately the same as the proportion in the whole nation.  
Only the year of birth is available, so not the day or month.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Visit','Each insurance claim is translated into a visit. Because a claim is always for costs in a specific month, a visit is always restricted to one month, even if the underlying real visit is longer than a month. Only the year and month is provided for each claim, day information is not available. However, oftentimes a claim will be associated with a piece of information that does have a specific date.  Specific dates can come from prescription date, procedure date, admission date, discharge date, or the start of medical care date.  This information will be used to infer the visit date with more precision. (e.g. if it’s a 2 day visit, and it has a procedure taking place on the 20th, we might assume the visit starts on the 20th).  If no specific date is available, we will assume the visit start and any events associated with the visit fall on the 15th of the month.  We choose the middle of the month because accidental reversal of temporality (where the order of events is switched because one piece of information did have a date, and another didn’t) is just as likely to occur in one direction as the other.');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation period','The observation period is defined as the time of enrollment in the health insurance. If the member is a dependent, the enrollment depends on the enrollment of the main beneficiary. The observation is truncated by the time when JMDC had a contract with the respective insurer.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Location','');


INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Care Site','Care sites in JMDC are institutions where care is provided, typically a department in a hospital.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Condition','In JMDC we distinguish between two different types of conditions, both derived from the diagnoses associated with a claim. The first have their start date set to the date of diagnose, which is often taken to be the visit start date. The second type uses the ‘date of start of medical care’ that is recorded for virtually every diagnosis in JMDC. This start date often precedes the actual visit where the diagnosis is recorded, and sometimes even precedes start of enrollment. This second type of conditions is used to construct condition eras by linking diagnoses from the same institution for the same diagnose code with the same start of medical care.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Death','There are two sources of death status: enrollment and the diagnosis table. To make sure we have at most one death per person, when there are multiple death records per person, we will take the latest from diagnose if available, else the date from enrollment. The reason for this is that the date from diagnosis might be specific to date, whereas the information from enrollment status is always at the month level and therefore assumed to be at the end of the month.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Procedure','Medical procedures as recorded in the insurance claims. Some procedures are derived from diagnosis codes.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Measurement','Most employees in Japan are required by law to undergo annual health checkups. For some but not all insurance companies included in JMDC the results of these checkups are available as measurements.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Observation','During annual health screenings information about sleeping is collected that cannot go into the measurement table and is therefore stored here. Some observations are derived from some of the diagnosis codes.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Provider','In JMDC providers are derived from two sources: institutions and physicians. Institutions (typically hospital departments) are included because diagnoses and procedures are linked to institutions but not to physicians, and this way we can preserve the specialty of the department that recorded a diagnosis or procedure.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Drug','Drug exposures include a mix of prescriptions and dispensings as records on the insurance claims.');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Cohort','');

INSERT INTO {sc}.CDM_DOMAIN_META
           (DOMAIN_ID, DESCRIPTION)
     VALUES
           ('Cost','Only the total amount paid for a claim is known with certainty. Since we map most claims directly to visits, we have reflected these costs as costs per visit.');