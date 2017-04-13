*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](README.md)

---

# DEATH

The *DEATH* table is designed to capture the time when a person is
deceased and cause of death. Death in Optum Extended SES/DOD can be
captured by discharge status “Died” or condition in one of the various
diagnosis fields containing codes indicating death in the
**MEDICAL_CLAIMS** table. This table should be loaded when building
*VISIT_OCCURRENCE* table. The DOD database has additional death
information sourced from Social Security Master File.

Key conventions:

-   Starts from the **TEMP_MEDICAL** table generated throughout the
    *VISIT_OCCURRENCE* creation.

-   The date of death will be associated to the VISIT_END_DATE.

-   There are three ways to identify death:

    1.  Discharge Status

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

1.  The following file provides codes for identifying death from
    **TEMP_MEDICAL** and mapping to DEATH_TYPE_CONCEPT_ID. The death
    codes can come from ICD9s, ICD10s, discharge status, or DRGs.

2.  ***(DOD Only)*** pulling data from the DOD_DEATH table.

-   Only one record will be kept for each patient; use the following
    hierarchy to determine which record to use

    1.  ***(DOD Only)*** Death recorded in **DEATH** table
    2.  Death captured by discharge status
    3.  Death captured by DRGs
    4.  Death captured by ICD9 or ICD10 diagnosis codes.
        1.  If ICD_FLAG = 9 then use the ICD9 codes
        2.  If ICD_FLAG = 10 then use the ICD10 codes

-   After determining which table or code the death should come from
    take the record with the latest date of death.

-   If there are health care visits after 30 days of death date, delete
    the death record.

-   If the death date occurs after the patient's date of birth, then
    delete the death record.

<a name="table-mappings-death"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
PERSON_ID|**TEMP_MEDICAL** PATID/PAT_PLANID <br><br> (DOD only) <br><br> DEATH PATID/PAT_PLANID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
DEATH_DATE|VISIT_OCCURRENCE VISIT_END_DATE <br><br> (DOD only): DEATH ymdod|DEATH Use the last day of the month| 
DEATH_TYPE_CONCEPT_ID|Discharge status: **TEMP_MEDICAL**: DSTATUS <br><br> Condition: **TEMP_MEDICAL**: ICD_FLAG, DIAG1-DIAG25 <br><br> DRG: **TEMP_MEDICAL**: DRG Death status (DOD only): DEATH|**TEMP_MEDICAL**  (DSTATUS): - Priority 2 - [38003566](http://www.ohdsi.org/web/atlas/#/concept/38003566) **TEMP_MEDICAL** (DIAG1-DIAG25): - Priority 4 - [38003567](http://www.ohdsi.org/web/atlas/#/concept/38003567) <br><br> **TEMP_MEDICAL** (DRG): - Priority 3 - [38003568](http://www.ohdsi.org/web/atlas/#/concept/38003568) <br><br> **DEATH**: - Priority 1 - [38003569](http://www.ohdsi.org/web/atlas/#/concept/38003569)|These CONCEPT_IDs fall under VOCABULARY_ID = 'Death Type' in CONCEPT table. <br><br> The death type for social security data is not optimal and will update if a better code becomes available.
CAUSE_OF_DEATH_CONCEPT_ID|-|0| 
CAUSE_OF_DEATH_SOURCE_VALUE|NULL| | 
CAUSE_SOURCE_CONCEPT_ID|-|0| 
