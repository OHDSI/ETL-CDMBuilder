INSERT INTO {sc}.[COHORT_DEFINITION]
           ([COHORT_DEFINITION_ID]
           ,[COHORT_DEFINITION_NAME]
           ,[COHORT_DEFINITION_DESCRIPTION]
           ,[DEFINITION_TYPE_CONCEPT_ID]
           ,[COHORT_DEFINITION_SYNTAX]
           ,[SUBJECT_CONCEPT_ID]
           ,[COHORT_INITIATION_DATE])
     VALUES
           (224
           ,'HES Patients'
           ,'Patients participating in Hospital Episodes Statistics (HES) linkage'
           ,NULL
           ,NULL
           ,NULL
           ,GETDATE())