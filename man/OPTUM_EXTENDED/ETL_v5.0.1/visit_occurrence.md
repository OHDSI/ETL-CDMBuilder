*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](README.md)

---

# VISIT_OCCURRENCE

The VISIT_OCCURRENCE table contains all person visits to health care providers, including inpatient, outpatient and ER visits. A visit is an encounter for a patient at a point of care for duration of time. There could be several providers involved in the patient's care during the Visit.

The logic derived to define inpatient visits versus emergency room visits was obtained from the following reference:  
*Scerbo, M., C. Dickstein, and A. Wilson, Health Care Data and SAS. 2001, Cary, NC: SAS Institute Inc.*

**Key conventions:**

-   **Extract records within OBSERVATION_PERIODs where a person has
    both prescription benefits and medical benefits from MEDICAL_CLAIMS
    table**:

-   If LST_DT is NULL or &lt; FST_DT, set LST_DT = FST_DT.

-   Cap data to fall between OBSERVATION_PERIODS. If the
    OBSERVATION_PERIOD_START_DATE falls between FST_DT and LST_DT,
    set FST_DT = OBSERVATION_PERIOD_START_DATE; if
    OBSERVATION_PERIOD_END_DATE falls between FST_DT and LST_DT,
    set LST_DT = OBSERVATION_PERIOD_END_DATE. Then extract all
    records with both FST_DT and LST_DT falling between a person's
    OBSERVATION_PERIOD_START_DATE and OBSERVATION_PERIOD_END_DATE.

-   After eligible records are extracted and truncated as mentioned
    above, use the following steps to define visit and type of visit:
    
1. For each line of claim, define claim type using the following logic:

```
IF (RVNU_CD >= '0100' AND RVNU_CD <= '0219') /* Room and Board Charges */
OR (RVNU_CD >= '0720' AND RVNU_CD <= '0729') /* Labor Room and Delivery */
OR (RVNU_CD >= '0800' AND RVNU_CD <= '0809') /* Inpatient Renal Dialysis */
THEN
IF POS IN (13,31,32,34) THEN CLAIM_TYPE = 'LTC'
ELSE CLAIM_TYPE = 'IP';
ELSE IF POS IN (23)
OR (RVNU_CD >= '0450' AND RVNU_CD <= '0459')
OR RVNU_CD ='0981'
OR PROC_CD IN ('99281','99282','99283','99284','99285')
THEN CLAIM_TYPE= 'ER';
ELSE CLAIM_TYPE = 'OP';
```

The LTC codes are Place of Service Codes from CMS.

This **TEMP_MEDICAL** table can be used throughout the loading process. Pulling the following columns will help you throughout the build:

 -   RVNU_CD
 -   POS
 -   DIAG1-DIAG25
 -   ICD_FLAG
 -   PROC1-PROC3
 -   DRG   
 -   PROC_CD
 -   COINS
 -   COPAY
 -   DEDUCT       
 -   STD_COST 
 -   DSTATUS
 -   UNITS
 -   NDC
 -   PATID
 -   PAT_PLANID
 -   FST_DT

2. For lines of claim with CLAIM_TYPE = 'IP' (inpatient):
	1. Sort by PAT_PLANID, FST_DT, LST_DT, PROV, and PROVCAT in ascending order.
    2. For each PAT_PLANID, collapse lines of claim as long as the time between the LST_DT of one line and the FST_DT of the next is &le;1 day. Then each consolidated inpatient claim is considered as one inpatient visit, and set min(FST_DT) as VISIT_START_DATE, max(LST_DT) as VISIT_END_DATE, 'IP' as PLACE_OF_SERVICE_SOURCE_VALUE.
    3. For each inpatient visit, set PROV and PROVCAT from the first claim line (all claim lines of each visit already sorted in step 2.1 as NEW_PROV and NEW_PROVCAT respectively
    4. Sort again by VISIT_START_DATE, VISIT_END_DATE. Assign a VISIT_OCCURRENCE_ID for each inpatient visit that begins on the same day and ends on the same day. This should result in cases in which there is 1 VISIT_OCCURRENCE_ID for multiple claim records. Apply this VISIT_OCCURRENCE_ID to **TEMP_MEDICAL**. In the actual *VISIT_OCCURRENCE* table, collapse these records so that there is only 1 record for 1 VISIT_OCCURRENCE_ID. 
3. Any outpatient, long term care, or emergency visits during an inpatient stay should be consolidated with that inpatient visit (i.e. if you are already in the hospital as an inpatient you most likely did not leave to go to an emergency room or outpatient visit, these records appear due to charge back reasons). 
   1. The only records you do not consolidate are emergency room visits that occur on the first day of the inpatient stay (both FST_DT and LST_DT are equal to the VISIT_START_DATE of inpatient visit), this most likely is a patient who came in through the ER and later was transferred to an inpatient stay.
4. Following Step (3), for all lines of claim with CLAIM_TYPE = 'ER' but not collapsed into inpatient visits, sort them by PAT_PLANID, FST_DT, LST_DT, PROV, PROVCAT in ascending order. 
	1. For each PAT_PLANID, collapse lines of claim with the same FST_DT in ER table as one unique ER visit, and set FST_DT as VISIT_START_DATE, max (LST_DT) as VISIT_END_DATE, 'ER' as PLACE_OF_SERVICE_SOURCE_VALUE. 
	2. For each ER visit, set NEW_PROV and NEW_PROVCAT from the first claim line as NEW_PROV and NEW_PROVCAT respectively and assign VISIT_OCCURRENCE_ID.
5. Following Step (3), for all lines of claim with CLAIM_TYPE = 'OP'but not collapsed into inpatient visits, sort them by PAT_PLANID, FST_DT, PROV, LST_DT, PROVCAT in ascending order. 
	1. For each PAT_PLANID, collapse lines of claim with the same FST_DT, PROV table as one unique OP visit, and set FST_DT as VISIT_START_DATE, max (LST_DT) as VISIT_END_DATE, 'OP' as PLACE_OF_SERVICE_SOURCE_VALUE. For each OP visit, set NEW_PROV and NEW_PROVCAT from the first claim line as NEW_PROV and NEW_PROVCAT respectively and assign VISIT_OCCURRENCE_ID.
6. After Step 2 through 5, all lines of claim in the table created in Step (1) will be assigned to a visit. 
	1. Add assigned VISIT_OCCURRENCE_ID, NEW_PROV, NEW_PROVCAT, VISIT_START_DATE, VISIT_END_DATE and PLACE_OF_SERVICE_SOURCE_VALUE to each line of this table and create the **TEMP_MEDICAL** table. 
	2. The **TEMP_MEDICAL** can be used to define *CONDITION_OCCURRENCE*, *PROCEDURE_OCCURRENCE*, *PROCEDURE_COST* and *DEATH*.

<a name="table-mappings-visit-occurrence"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
VISIT_OCCURRENCE_ID|-|System generated.| 
PERSON_ID|**TEMP_MEDICAL** PATID/PAT_PLANID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
VISIT_START_DATE|**TEMP_MEDICAL** min(FST_DT)| | 
VISIT_START_TIME| |NULL| 
VISIT_END_DATE|**TEMP_MEDICAL** max(LST_DT)| | 
VISIT_END_TIME|-|NULL| 
VISIT_TYPE_CONCEPT_ID|-|44818517|CONCEPT_ID [44818517](http://www.ohdsi.org/web/atlas/#/concept/44818517) = 'Visit derived from encounter on claim'
VISIT_CONCEPT_ID|TEMP_MEDICAL: POS RVNU_CD PROC_CD|Use the steps mentioned above to create PLACE_OF_SERVICE_SOURCE_VALUE, then map it to its associated CONCEPT_ID:<br>IP = 9201<br>OP = 9202<br>ER = 9203<br>LTC = 42898160|These CONCEPT_IDs fall under VOCABULARY_ID = 'Visit' in CONCEPT table.
