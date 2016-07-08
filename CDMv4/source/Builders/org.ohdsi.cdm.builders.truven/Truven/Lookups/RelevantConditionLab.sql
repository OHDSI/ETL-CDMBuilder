	SELECT REPLACE(stcm.SOURCE_CODE, '.', '') AS SOURCE_CODE, 
		stcm.TARGET_CONCEPT_ID
	FROM SOURCE_TO_CONCEPT_MAP stcm
	WHERE stcm.TARGET_VOCABULARY_ID = 1 /*SNOMED*/
	AND stcm.SOURCE_VOCABULARY_ID = 2 /*ICD9*/
	AND stcm.PRIMARY_MAP = 'Y'
	AND (stcm.INVALID_REASON IS NULL or stcm.INVALID_REASON = '')
	AND GETDATE() BETWEEN stcm.VALID_START_DATE and stcm.VALID_END_DATE
	/*only pull valid ICD9 condition codes - only start with V/E/0-9 and between 3 to 5 char unless E then between 4 to 5*/
	AND (
		CASE 
			WHEN SUBSTRING(stcm.SOURCE_CODE, 1, 1) IN ('V','0','1','2','3','4','5','6','7','8','9') 
			AND LEN(stcm.SOURCE_CODE) BETWEEN 3 AND 6 THEN 1
		      
			WHEN SUBSTRING(stcm.SOURCE_CODE, 1, 1) IN ('E') 
			AND LEN(stcm.SOURCE_CODE) BETWEEN 4 AND 6 THEN 1
		      
			ELSE 0 
		END
	) = 1
	/*since we have the decimals we have another method to cut out procedures*/
	AND (
		CASE 
			WHEN SUBSTRING(stcm.SOURCE_CODE,1,1) = 'E' AND SUBSTRING(stcm.SOURCE_CODE,5,1) IN ('.','') THEN 1
			WHEN SUBSTRING(stcm.SOURCE_CODE,4,1) IN ('.') THEN 1
			WHEN LEN(stcm.SOURCE_CODE) = 3 AND stcm.SOURCE_CODE NOT LIKE '%.%' THEN 1 
			ELSE 0
		END
	) = 1