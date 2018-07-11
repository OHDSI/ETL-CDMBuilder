*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD*
<br>*CDM Version = 5.3.1, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: DEATH

The *DEATH* table is designed to capture the time when a person is deceased and cause of death. Death in Optum Extended SES/DOD can be captured by discharge status "Died" or condition in one of the various diagnosis fields containing codes indicating death in the **MED_DIAGNOSIS** table. This table should be loaded when building the *VISIT_OCCURRENCE* table. The DOD database has verified death information sourced from Social Security Death Master File.

**Key conventions:**

-   Starts from the **MED_DIAGNOSIS** table generated throughout the *VISIT_OCCURRENCE* creation.

-   The date of death will be associated to the VISIT_END_DATE.

-   There are five ways to identify death:

  1. discharge status
  2. ICD10s
  3. ICD9s
  4. DRGs
  5. (if using Extended DOD) the death table.


**Discharge Status**


| CODE_TYPE       | SOURCE_CODE | SOURCE_CODE_DESCRIPTION               | DEATH_TYPE_CONCEPT_ID |
|------------------|--------------|-----------------------------------------|--------------------------|
| Discharge Status | 20           | EXPIRED                                 | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 21           | EXPIRED TO BE DEFINED AT STATE LEVEL    | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 22           | EXPIRED TO BE DEFINED AT STATE LEVEL    | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 23           | EXPIRED TO BE DEFINED AT STATE LEVEL    | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 24           | EXPIRED TO BE DEFINED AT STATE LEVEL    | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 25           | EXPIRED TO BE DEFINED AT STATE LEVEL    | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 26           | EXPIRED TO BE DEFINED AT STATE LEVEL    | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 27           | EXPIRED TO BE DEFINED AT STATE LEVEL    | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 27           | EXPIRED TO BE DEFINED AT STATE LEVEL    | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 28           | EXPIRED TO BE DEFINED AT STATE LEVEL    | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 29           | EXPIRED TO BE DEFINED AT STATE LEVEL    | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 40           | EXPIRED AT HOME (HOSPICE)               | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 41           | EXPIRED IN A MEDICAL FACILITY (HOSPICE) | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |
| Discharge Status | 42           | EXPIRED – PLACE UNKNOWN (HOSPICE)       | [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)        |



**Mapping ICD9CM and ICD10CM from MED_DIAGNOSIS**    

Use [Source to Source](code_snippets.md#source-to-source) and filter with
```WHERE SOURCE_VOCABULARY_ID IN ('JNJ_DEATH')```

**DRGs**

For DRGs, use the following query.  DRGs are date-sensitve so you need to only pick up DRGs that fall within the valid start and end dates.

```
SELECT CONCEPT_ID, CONCEPT_NAME, CONCEPT_CODE, valid_start_date, valid_end_date
FROM concept
WHERE CONCEPT_ID IN (
  38000421,38001111,38001112,38001113
)
```
**(DOD Only) pulling data from the DOD_DEATH table.**

-   Only one record will be kept for each patient; use the following
    hierarchy to determine which record to use

    1.  ***(DOD Only)*** Death recorded in **DEATH** table
    2.  Death captured by discharge status in **MEDICAL_CLAIMS**
    3.  Death captured by DRGs in **MEDICAL_CLAIMS**
    4.  Death captured by ICD9 or ICD10 diagnosis codes in **MED_DIAGNOSIS**
        1.  If ICD_FLAG = 9 then use the ICD9 codes
        2.  If ICD_FLAG = 10 then use the ICD10 codes

-   After determining which table or code the death should come from
    take the record with the latest date of death.

-   If there are health care visits after 30 days of death date, delete
    the death record.

-   If the death date occurs after the patient's date of birth, then
    delete the death record.

***

<a name="table-mappings-death"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
PERSON_ID|**MEDICAL_CLAIMS** PATID/PAT_PLANID <br><br> **(DOD only) DEATH**<br/> PATID/PAT_PLANID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.|
DEATH_DATE|**VISIT_OCCURRENCE**<br/>VISIT_END_DATE <br><br>**(DOD only) DEATH**<br/> ymdod|**(DOD only) DEATH**<br/> Use the last day of the month|
DEATH_DATETIME|Set time to 00:00:00<br/><br/>**VISIT_OCCURRENCE**<br/>VISIT_END_DATE <br><br>**(DOD only) DEATH**<br/> ymdod|**(DOD only) DEATH**<br/> Use the last day of the month|
DEATH_TYPE_CONCEPT_ID|Discharge status: **MEDICAL_CLAIMS**<br/>DSTATUS<br><br>Condition: **MED_DIAGNOSIS**<br/>ICD_FLAG, DIAG <br><br> DRG: **MEDICAL_CLAIMS** DRG<br/><br/>Death status:<br/> **DOD only**<br/> DEATH|**DOD only, DEATH**<br/>(Priority 1)<br/>Use concept [38003569](http://www.ohdsi.org/web/atlas/#/concept/38003569)<br/><br/>**MEDICAL_CLAIMS** (DSTATUS)<br/>(Priority 2)<br/>Use concept [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566)<br/><br/>**MEDICAL_CLAIMS**<br/>(DRG)<br/>(Priority 3)<br/>Use concept [38003568](http://www.ohdsi.org/web/atlas/#/concept/38003568)<br><br>**MED_DIAGNOSIS** (DIAG)<br/>(Priority 4)<br/>Use concept [38003567](http://www.ohdsi.org/web/atlas/#/concept/38003567) |These CONCEPT_IDs fall under VOCABULARY_ID = 'Death Type' in CONCEPT table. <br><br> The death type for social security data is not optimal and will update if a better code becomes available.
CAUSE_OF_DEATH_CONCEPT_ID| |0|
CAUSE_OF_DEATH_SOURCE_VALUE| | |
CAUSE_SOURCE_CONCEPT_ID| |0|
