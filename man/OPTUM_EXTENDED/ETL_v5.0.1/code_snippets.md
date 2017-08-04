*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

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

SELECT *

FROM CTE_VOCAB_MAP

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
      
```
**DIAG1-DIAG25:**
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

```
**PROC_CD,PROC1-PROC25:**

If ICD_FLAG = 9

Filter when procedure code comes from PROC field:

WHERE SOURCE_VOCABULARY_ID IN ('ICD9Proc', 'HCPCS','CPT4')

TARGET_STANDARD_CONCEPT ='S'

AND TARGET_INVALID_REASON IS NULL

AND TARGET_CONCEPT_CLASS_ID NOT IN ('HCPCS Modifier','CPT4 Modifier')

ELSE IF ICD_FLAG = 10

Filter when procedure code comes from PROC field:

WHERE SOURCE_VOCABULARY_ID IN ('ICD10PCS', 'HCPCS','CPT4')

AND TARGET_STANDARD_CONCEPT ='S'

AND TARGET_INVALID_REASON IS NULL

AND TARGET_CONCEPT_CLASS_ID NOT IN ('HCPCS Modifier','CPT4 Modifier','ICD10PCS Hierarchy')
```

### From Other Procedure Fields

```
WHERE SOURCE_VOCABULARY_ID IN ('HCPCS','CPT4','ICD9Proc','ICD10PCS')
AND
TARGET_STANDARD_CONCEPT ='S'
AND TARGET_INVALID_REASON IS NULL
AND TARGET_CONCEPT_CLASS_ID NOT IN ('HCPCS Modifier','CPT4 Modifier','ICD10PCS Hierarchy')
```

## Concept Type Id Mapping Filters

### From Medical Claims' Diagnosis Fields
       

```
**DIAG1-DIAG25:**

if (PLACE_OF_SERVICE_SOURCE_VALUE == 'IP')
{
  if DIAG1 then 38000200
  else if DIAG2 then 38000201
  else if DIAG3 then 38000202
  else if DIAG4 then 38000203
  else if DIAG5 then 38000204
  else if DIAG6 then 38000205
  else if DIAG7 then 38000206
  else if DIAG8 then 38000207
  else if DIAG9 then 38000208
  else if DIAG10 then 38000209
  else if DIAG11 then 38000210
  else if DIAG12 then 38000211
  else if DIAG13 then 38000212
  else if DIAG14 then 38000213
  else then 38000214
}
else
{
  if DIAG1 then 38000230
  else if DIAG2 then 38000231
  else if DIAG3 then 38000232
  else if DIAG4 then 38000233
  else if DIAG5 then 38000234
  else if DIAG6 then 38000235
  else if DIAG7 then 38000236
  else if DIAG8 then 38000237
  else if DIAG9 then 38000238
  else if DIAG10 then 38000239
  else if DIAG11 then 38000240
  else if DIAG12 then 38000241
  else if DIAG13 then 38000242
  else if DIAG14 then 38000243
  else then 38000244
}

```

### From Medical Claims' Procedure Fields

```
if (PLACE_OF_SERVICE_SOURCE_VALUE == 'IP')
{
  if PROC_CD then 38000254;
  
  if PROC1 then 38000251
  else if PROC2 then 38000252
  else if PROC3 then 38000253
  else if PROC4 then 38000254
  else if PROC5 then 38000255
  else if PROC6 then 38000256
  else if PROC7 then 38000257
  else if PROC8 then 38000258
  else if PROC9 then 38000259
  else if PROC10 then 38000260
  else if PROC11 then 38000261
  else if PROC12 then 38000262
  else if PROC13 then 38000263
  else if PROC14 then 38000264
  else if PROC15 then 38000265
  else then 38000265;
}
else
{
  if PROC_CD then 38000272;
  
  if PROC1 then 38000269
  else if PROC2 then 38000270
  else if PROC3 then 38000271
  else if PROC4 then 38000272
  else if PROC5 then 38000273
  else then 38000274;
}

```

## Source Concept Id Mapping Filters

  ### From Medical Claims' Diagnosis Fields

**DIAG1-DIAG25:**
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

**PROC_CD, PROC1-PROC25:**
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
filter = "WHERE SOURCE_VOCABULARY_ID IN ('HCPCS','CPT4','ICD9Proc','ICD10PCS') AND TARGET_VOCABULARY_ID IN ('HCPCS','CPT4',') AND TARGET_CONCEPT_CLASS_ID NOT IN ('HCPCS Modifier','CPT4 Modifier','ICD10PCS Hierarchy')";
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

## POA to CONDITION_STATUS_CONCEPT_ID

The POA field in **TEMP_MEDICAL** is a period-delimited string that looks like this: 
```
Y.U.U.U.U.U.U.U.U.U.U.U.U.U.U.U.U.U.U.U.U.U.U.U.U
```

There is a POA character value that corresponds for each slot of the DIAG codes (DIAG1-DIAG25), but this string must be split on period (".") in order to get this array of POA values. Here's a C#-like code snippet using the above sample POA.

```
POA_split = POA.split('.').ToList();

if (DIAG1) POA_value = POA_split[0]; // this would get 'Y'
if (DIAG2) POA_value = POA_split[1]; // this and all subsequent DIAG codes would get 'U'
if (DIAG3) POA_value = POA_split[2];
if (DIAG4) POA_value = POA_split[3];
if (DIAG5) POA_value = POA_split[4];
if (DIAG6) POA_value = POA_split[5];
if (DIAG7) POA_value = POA_split[6];
if (DIAG8) POA_value = POA_split[7];
if (DIAG9) POA_value = POA_split[8];
if (DIAG10) POA_value = POA_split[9];
if (DIAG11) POA_value = POA_split[10];
if (DIAG12) POA_value = POA_split[11];
if (DIAG13) POA_value = POA_split[12];
if (DIAG14) POA_value = POA_split[13];
if (DIAG15) POA_value = POA_split[14];
if (DIAG16) POA_value = POA_split[15];
if (DIAG17) POA_value = POA_split[16];
if (DIAG18) POA_value = POA_split[17];
if (DIAG19) POA_value = POA_split[18];
if (DIAG20) POA_value = POA_split[19];
if (DIAG21) POA_value = POA_split[20];
if (DIAG22) POA_value = POA_split[21];
if (DIAG23) POA_value = POA_split[22];
if (DIAG24) POA_value = POA_split[23];
if (DIAG25) POA_value = POA_split[24];

```
