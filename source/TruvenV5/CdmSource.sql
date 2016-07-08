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
		   'Truven Health MarketScan® Commercial Claims and Encounters Database',
		   'CCAE',
		   'Janssen R&D',
		   'The Truven Health MarketScan® Research Databases contain individual-level, de-identified, healthcare claims information from employers, health plans, hospitals, Medicare, and Medicaid programs. Since their creation in the early 1990s, the MarketScan Databases have grown into one of the largest collections of de-identified patient-level data in the nation. These databases reflect the real-world of treatment patterns and costs by tracking millions of patients as they travel through the healthcare system offering detailed information about all aspects of care. Data from individual patients are integrated from all providers of care, maintaining all healthcare utilization and cost record connections at the patient level. Used primarily for research, these databases are fully HIPAA compliant. Research using MarketScan data has been widely publicized in peer-reviewed journals.

This retrospective claims analysis utilized data from the Truven Health MarketScan® Commercial Claims Database for the period of [starting date] to [ending date]. These data included health insurance claims across the continuum of care (e.g. inpatient, outpatient, outpatient pharmacy, carve-out behavioral healthcare) as well as enrollment data from large employers and health plans across the United States who provide private healthcare coverage for more than xx million employees, their spouses, and dependents. This administrative claims database includes a variety of fee-for-service, preferred provider organizations, and capitated health plans',
			'http://hicoe.jnj.com/DataSources/Truven/CCAE',
			'http://www.ohdsi.org/web/wiki/doku.php?id=documentation:example_etls',
			'{0}',
			'{3}',
			'V5.0',
			'{1}'
		   )