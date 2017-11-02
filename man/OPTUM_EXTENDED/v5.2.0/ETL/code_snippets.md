*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.2, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# Code Snippets

Use this code to map source codes to concept ids; change the source_vocabulary_id and target_vocabulary_id as needed.

### Source to Source

```
WITH CTE_VOCAB_MAP AS (

       SELECT c.concept_code AS SOURCE_CODE, c.concept_id AS
SOURCE_CONCEPT_ID, c.CONCEPT_NAME AS SOURCE_CODE_DESCRIPTION,

                        c.vocabulary_id AS SOURCE_VOCABULARY_ID,
c.domain_id AS SOURCE_DOMAIN_ID, c.concept_class_id AS
SOURCE_CONCEPT_CLASS_ID,

            c.VALID_START_DATE AS SOURCE_VALID_START_DATE,
c.VALID_END_DATE AS SOURCE_VALID_END_DATE, c.invalid_reason AS
SOURCE_INVALID_REASON,

            c.concept_ID as TARGET_CONCEPT_ID, c.concept_name AS
TARGET_CONCEPT_NAME, c.vocabulary_id AS TARGET_VOCABULARY_ID,
c.domain_id AS TARGET_DOMAIN_ID,

                        c.concept_class_id AS
TARGET_CONCEPT_CLASS_ID, c.INVALID_REASON AS
TARGET_INVALID_REASON,

            c.STANDARD_CONCEPT AS TARGET_STANDARD_CONCEPT

       FROM CONCEPT c

       UNION

       SELECT source_code, SOURCE_CONCEPT_ID,
SOURCE_CODE_DESCRIPTION, source_vocabulary_id, c1.domain_id AS
SOURCE_DOMAIN_ID, c2.CONCEPT_CLASS_ID AS SOURCE_CONCEPT_CLASS_ID,

                                        c1.VALID_START_DATE AS
SOURCE_VALID_START_DATE, c1.VALID_END_DATE AS
SOURCE_VALID_END_DATE,stcm.INVALID_REASON AS
SOURCE_INVALID_REASON,

                                        target_concept_id,
c2.CONCEPT_NAME AS TARGET_CONCEPT_NAME, target_vocabulary_id,
c2.domain_id AS TARGET_DOMAIN_ID, c2.concept_class_id AS
TARGET_CONCEPT_CLASS_ID,

                     c2.INVALID_REASON AS TARGET_INVALID_REASON,
c2.standard_concept AS TARGET_STANDARD_CONCEPT
       FROM source_to_concept_map stcm
              LEFT OUTER JOIN CONCEPT c1
                     ON c1.concept_id = stcm.source_concept_id
              LEFT OUTER JOIN CONCEPT c2
                     ON c2.CONCEPT_ID = stcm.target_concept_id
       WHERE stcm.INVALID_REASON IS NULL
)

SELECT * FROM CTE_VOCAB_MAP
/*EXAMPLE FILTERS*/
WHERE SOURCE_VOCABULARY_ID IN ('ICD9CM')
AND TARGET_VOCABULARY_ID IN ('ICD9CM')

```

### Source to Standard Terminology

```
WITH CTE_VOCAB_MAP AS (

       SELECT c.concept_code AS SOURCE_CODE, c.concept_id AS
SOURCE_CONCEPT_ID, c.concept_name AS SOURCE_CODE_DESCRIPTION,
c.vocabulary_id AS SOURCE_VOCABULARY_ID,

                           c.domain_id AS SOURCE_DOMAIN_ID,
c.CONCEPT_CLASS_ID AS SOURCE_CONCEPT_CLASS_ID,

                                                   c.VALID_START_DATE
AS SOURCE_VALID_START_DATE, c.VALID_END_DATE AS
SOURCE_VALID_END_DATE, c.INVALID_REASON AS SOURCE_INVALID_REASON,

                           c1.concept_id AS TARGET_CONCEPT_ID,
c1.concept_name AS TARGET_CONCEPT_NAME, c1.VOCABULARY_ID AS
TARGET_VOCABUALRY_ID, c1.domain_id AS TARGET_DOMAIN_ID,
c1.concept_class_id AS TARGET_CONCEPT_CLASS_ID,

                           c1.INVALID_REASON AS
TARGET_INVALID_REASON, c1.standard_concept AS
TARGET_STANDARD_CONCEPT

       FROM CONCEPT C

             JOIN CONCEPT_RELATIONSHIP CR

                        ON C.CONCEPT_ID = CR.CONCEPT_ID_1

                        AND CR.invalid_reason IS NULL

                        AND cr.relationship_id = 'Maps To'

              JOIN CONCEPT C1

                        ON CR.CONCEPT_ID_2 = C1.CONCEPT_ID

                        AND C1.INVALID_REASON IS NULL

       UNION

       SELECT source_code, SOURCE_CONCEPT_ID,
SOURCE_CODE_DESCRIPTION, source_vocabulary_id, c1.domain_id AS
SOURCE_DOMAIN_ID, c2.CONCEPT_CLASS_ID AS SOURCE_CONCEPT_CLASS_ID,

                                        c1.VALID_START_DATE AS
SOURCE_VALID_START_DATE, c1.VALID_END_DATE AS
SOURCE_VALID_END_DATE,

                     stcm.INVALID_REASON AS
SOURCE_INVALID_REASON,target_concept_id, c2.CONCEPT_NAME AS
TARGET_CONCEPT_NAME, target_vocabulary_id, c2.domain_id AS
TARGET_DOMAIN_ID, c2.concept_class_id AS TARGET_CONCEPT_CLASS_ID,

                     c2.INVALID_REASON AS TARGET_INVALID_REASON,
c2.standard_concept AS TARGET_STANDARD_CONCEPT

       FROM source_to_concept_map stcm

              LEFT OUTER JOIN CONCEPT c1

                     ON c1.concept_id = stcm.source_concept_id

              LEFT OUTER JOIN CONCEPT c2

                     ON c2.CONCEPT_ID = stcm.target_concept_id

       WHERE stcm.INVALID_REASON IS NULL

)

SELECT *

FROM CTE_VOCAB_MAP

/*EXAMPLE FILTERS*/

WHERE SOURCE_VOCABULARY_ID IN ('NDC')

AND TARGET_VOCABUALRY_ID IN ('RxNORM')
```

### Source to Maps to Value

```
WITH CTE_VOCAB_MAP AS (

SELECT c.concept_code AS SOURCE_CODE, c.concept_id AS
SOURCE_CONCEPT_ID, c.concept_name AS SOURCE_CODE_DESCRIPTION,
c.vocabulary_id AS SOURCE_VOCABULARY_ID,

c.domain_id AS SOURCE_DOMAIN_ID, c.CONCEPT_CLASS_ID AS
SOURCE_CONCEPT_CLASS_ID,

c.VALID_START_DATE AS SOURCE_VALID_START_DATE, c.VALID_END_DATE
AS SOURCE_VALID_END_DATE, c.INVALID_REASON AS
SOURCE_INVALID_REASON,

c1.concept_id AS TARGET_CONCEPT_ID, c1.concept_name AS
TARGET_CONCEPT_NAME, c1.VOCABULARY_ID AS TARGET_VOCABUALRY_ID,
c1.domain_id AS TARGET_DOMAIN_ID, c1.concept_class_id AS
TARGET_CONCEPT_CLASS_ID,

c1.INVALID_REASON AS TARGET_INVALID_REASON, c1.standard_concept AS
TARGET_STANDARD_CONCEPT

FROM CONCEPT C

JOIN CONCEPT_RELATIONSHIP CR

ON C.CONCEPT_ID = CR.CONCEPT_ID_1

AND CR.invalid_reason IS NULL

AND cr.relationship_id = 'Maps To Value'

JOIN CONCEPT C1

ON CR.CONCEPT_ID_2 = C1.CONCEPT_ID

AND C1.INVALID_REASON IS NULL

)

SELECT *

FROM CTE_VOCAB_MAP

/*EXAMPLE FILTERS*/

WHERE SOURCE_CODE = 'V87.43'

```

## Concept Id Mapping Filters
  ### From Medical Claims' Diagnosis Fields

**DIAG, ICD_FLAG**
```
WHERE
AND TARGET_STANDARD_CONCEPT ='S'
AND TARGET_INVALID_REASON IS NULL
AND SOURCE_VOCABULARY_ID IN (
CASE
/*ICD9-CM*/
WHEN ICD_FLAG = 9
THEN 'ICD9CM'
/*ICD10-CM*/
WHEN ICD_FLAG = 10
THEN ('ICD10CM')
END
)
```

### From Medical Claims' Procedure Fields

**PROC_CD, PROC, ICD_FLAG**

```

if (ICD_FLAG = 9)
{
    filter = "WHERE SOURCE_VOCABULARY_ID IN ('ICD9Proc', 'HCPCS','CPT4')
    TARGET_STANDARD_CONCEPT ='S'
    AND TARGET_INVALID_REASON IS NULL
    AND TARGET_CONCEPT_CLASS_ID NOT IN ('HCPCS Modifier','CPT4 Modifier')";
}
Filter when procedure code comes from PROC field:


else if (ICD_FLAG = 10)
{
    filter = "WHERE SOURCE_VOCABULARY_ID IN ('ICD10PCS', 'HCPCS','CPT4')
    AND TARGET_STANDARD_CONCEPT ='S'
    AND TARGET_INVALID_REASON IS NULL
    AND TARGET_CONCEPT_CLASS_ID NOT IN ('HCPCS Modifier','CPT4 Modifier','ICD10PCS Hierarchy')";
}


```

### From Other Procedure Fields

```
filter = "WHERE SOURCE_VOCABULARY_ID IN ('HCPCS','CPT4','ICD9Proc','ICD10PCS') AND
    TARGET_STANDARD_CONCEPT ='S'
    AND TARGET_INVALID_REASON IS NULL
    AND TARGET_CONCEPT_CLASS_ID NOT IN ('HCPCS Modifier','CPT4 Modifier','ICD10PCS Hierarchy')";
```

### From Lab Results LOINC_CD

```
filter = "WHERE SOURCE_VOCABULARY_ID = 'LOINC' AND TARGET_VOCABULARY_ID = 'LOINC'
            AND TARGET_STANDARD_CONCEPT = 'S'
            AND TARGET_INVALID_REASON IS NULL";
```

## Concept Type Id Mapping Filters

### From Medical Claims' Diagnosis Fields
       

```
**DIAG, DIAG_POSITION**

if (PLACE_OF_SERVICE_SOURCE_VALUE == 'IP')
{
  if DIAG_POSITION = '01' then 38000200
  else if DIAG_POSITION = '02' then 38000201
  else if DIAG_POSITION = '03' then 38000202
  else if DIAG_POSITION = '04' then 38000203
  else if DIAG_POSITION = '05' then 38000204
  else if DIAG_POSITION = '06' then 38000205
  else if DIAG_POSITION = '07' then 38000206
  else if DIAG_POSITION = '08' then 38000207
  else if DIAG_POSITION = '09' then 38000208
  else if DIAG_POSITION = '10' then 38000209
  else if DIAG_POSITION = '11' then 38000210
  else if DIAG_POSITION = '12' then 38000211
  else if DIAG_POSITION = '13' then 38000212
  else if DIAG_POSITION = '14' then 38000213
  else then 38000214
}
else
{
  if DIAG_POSITION = '01' then 38000230
  else if DIAG_POSITION = '02' then 38000231
  else if DIAG_POSITION = '03' then 38000232
  else if DIAG_POSITION = '04' then 38000233
  else if DIAG_POSITION = '05' then 38000234
  else if DIAG_POSITION = '06' then 38000235
  else if DIAG_POSITION = '07' then 38000236
  else if DIAG_POSITION = '08' then 38000237
  else if DIAG_POSITION = '09' then 38000238
  else if DIAG_POSITION = '10' then 38000239
  else if DIAG_POSITION = '11' then 38000240
  else if DIAG_POSITION = '12' then 38000241
  else if DIAG_POSITION = '13' then 38000242
  else if DIAG_POSITION = '14' then 38000243
  else then 38000244
}

```

### From Medical Claims' Procedure Fields

```
if (PLACE_OF_SERVICE_SOURCE_VALUE == 'IP')
{
  if PROC_CD then 38000254;
  
  if PROC_POSITION = '01' then 38000251
  else if PROC_POSITION = '02' then 38000252
  else if PROC_POSITION = '03' then 38000253
  else if PROC_POSITION = '04' then 38000254
  else if PROC_POSITION = '05' then 38000255
  else if PROC_POSITION = '06' then 38000256
  else if PROC_POSITION = '07' then 38000257
  else if PROC_POSITION = '08' then 38000258
  else if PROC_POSITION = '09' then 38000259
  else if PROC_POSITION = '10' then 38000260
  else if PROC_POSITION = '11' then 38000261
  else if PROC_POSITION = '12' then 38000262
  else if PROC_POSITION = '13' then 38000263
  else if PROC_POSITION = '14' then 38000264
  else if PROC_POSITION = '15' then 38000265
  else then 38000265;
}
else
{
  if PROC_CD then 38000272;
  
  if PROC_POSITION = '01' then 38000269
  else if PROC_POSITION = '02' then 38000270
  else if PROC_POSITION = '03' then 38000271
  else if PROC_POSITION = '04' then 38000272
  else if PROC_POSITION = '05' then 38000273
  else then 38000274;
}

```

## Source Concept Id Mapping Filters

  ### From Medical Claims' Diagnosis Fields

**DIAG**
```
if (ICD_FLAG == '9') 
{
  filter = "WHERE SOURCE_VOCABULARY_ID IN ('ICD9CM') AND TARGET_VOCABULARY_ID IN ('ICD9CM')";
}
else if (ICD_FLAG == '10')
{
  filter = "WHERE SOURCE_VOCABULARY_ID IN ('ICD10','ICD10CM') AND TARGET_VOCABULARY_ID IN ('ICD10CM')";
} 

```
### From Medical Claims' Procedure Fields

**PROC_CD, PROC**
```
if (ICD_FLAG == '9') 
{
  filter = "WHERE SOURCE_VOCABULARY_ID IN ('ICD9Proc','HCPCS','CPT4') AND TARGET_VOCABULARY_ID IN ('ICD9Proc','HCPCS','CPT4') AND TARGET_CONCEPT_CLASS_ID NOT IN ('HCPCS Modifier','CPT4 Modifier')";
}
else if (ICD_FLAG == '10')
{
  filter = "WHERE SOURCE_VOCABULARY_ID IN ('ICD10PCS','HCPCS','CPT4') AND TARGET_VOCABULARY_ID IN ('ICD10PCS','HCPCS','CPT4') AND TARGET_CONCEPT_CLASS_ID NOT IN ('HCPCS Modifier','CPT4 Modifier','ICD10PCS Hierarchy')";
}
```

### From Other Procedure Fields

```
filter = "WHERE SOURCE_VOCABULARY_ID IN ('HCPCS','CPT4','ICD9Proc','ICD10PCS') AND TARGET_VOCABULARY_ID IN ('HCPCS','CPT4') AND TARGET_CONCEPT_CLASS_ID NOT IN ('HCPCS Modifier','CPT4 Modifier','ICD10PCS Hierarchy')";
```

### From Lab Results LOINC_CD

```
filter = "WHERE SOURCE_VOCABULARY_ID = 'LOINC' AND TARGET_VOCABULARY_ID = 'LOINC'";
```

## Payer Source Logic
Combine in the following order: BUS, ASO, PRODUCT, and CDHP:
```
[W] BUS
[Y] ASO
[X] PRODUCT
[Z] CDHP
Or [W] + [Y] + [X] + [Z]

For [W] Take BUS as is, if NULL set to empty string ''

IF ASO = Y replace [Y] with '(ASO)'

ELSE replace [Y] with ''

If PRODUCT = 'HMO' replace [X] with 'Health Maint Org'
If PRODUCT = 'PPO' replace [X] with 'Preferred Provider Org'
If PRODUCT = 'EPO' replace [X] with 'Exclusive Provider Org'
If PRODUCT = 'IND' replace [X] with 'Indemnity'
If PRODUCT = 'POS' replace [X] with 'Point of Service'
If PRODUCT = 'ALL' replace [X] with 'National Ancillaries, All Prod'
If PRODUCT = 'UNK' replace [X] with 'Unknown'
If PRODUCT = 'OTH' replace [X]  with 'Other'
IF PRODUCT = NULL then replace [X] with ''
Else [X] = PRODUCT
If CDHP = 1 replace [Z] with '(HRA)'.
If CDHP = 2 replace [Z] with '(HSA)'.
IF CDHP IS NULL then ''
Else [Z] = ''
```