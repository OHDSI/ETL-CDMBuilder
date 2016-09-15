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
		   'Clinformatics Extended DataMart (CEDM) is a robust, longitudinally-linked, statistically de-identified database consisting of de-identified individual-level data.

			The SES portion of CEDM provides Socio-Economic Status for members with both medical and pharmacy coverage. It may not be linked with the other portions of CEDM (Date of Death, Non-Affiliate). The DOD portion of CEDM provides date of death for its members as well as location.',
			'https://jnj.sharepoint.com/sites/PHM-GCSP-RND/RWE/Pages/DataSourceDetails.aspx?DataSourceItem=39',
			'https://github.com/OHDSI/ETL-CDMBuilder/tree/master/man',
			'{0}',
			'{3}',
			'V5.0',
			'{1}'
		   )