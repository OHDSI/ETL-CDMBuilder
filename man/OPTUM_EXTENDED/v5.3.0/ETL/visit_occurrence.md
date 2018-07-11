*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD*
<br>*CDM Version = 5.3.1, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: VISIT_OCCURRENCE

The VISIT_OCCURRENCE table contains all person visits to health care providers, including inpatient, outpatient and ER visits. A visit is an encounter for a patient at a point of care for duration of time. There could be several providers involved in the patient's care during the Visit.

<a name="table-mappings-visit-occurrence"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
VISIT_OCCURRENCE_ID| |System generated.|
PERSON_ID|**MEDICAL_CLAIMS**<br/>PATID/PAT_PLANID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.|
VISIT_CONCEPT_ID|**MEDICAL_CLAIMS**<br/>POS, RVNU_CD, PROC_CD|Use the steps in [Visit Logic](code_snippets.md#visit-logic) to map to CONCEPT_IDs:<br>IP = 9201<br>OP = 9202<br>ER = 9203<br>LTC = 42898160|These CONCEPT_IDs fall under VOCABULARY_ID = 'Visit' in CONCEPT table.
VISIT_START_DATE|**MEDICAL_CLAIMS**<br/>FST_DT| Use min(FST_DT) |
VISIT_START_DATETIME|Set time to 00:00:00<br/><br/>**MEDICAL_CLAIMS** FST_DT| Use min(FST_DT) |
VISIT_END_DATE|**MEDICAL_CLAIMS**<br/>LST_DT| Use min(LST_DT) |
VISIT_END_DATETIME|**MEDICAL_CLAIMS**<br/>LST_DT|Set time to 00:00:00<br/><br/>Use min(LST_DT) |
VISIT_TYPE_CONCEPT_ID| |Use concept [44818517 (Visit derived from encounter on claim)](http://www.ohdsi.org/web/atlas/#/concept/44818517)|
PROVIDER_ID|**MEDICAL_CLAIMS**<br>PROV, PROVCAT|Map PROV and PROVCAT to PROVIDER_SOURCE_VALUE and SPECIALTY_SOURCE_VALUE in Provider table to extract its associated Provider ID. |
CARE_SITE_ID| | NULL |
VISIT_SOURCE_VALUE| **MEDICAL_CLAIMS**<br/>POS, RVNU_CD, PROC_CD | Use the steps from [Visit Logic](code_snippets.md#visit-logic) to define visit types, and then obtain values of 'IP','ER','OP', or 'LTC'. |
VISIT_SOURCE_CONCEPT_ID| | 0 |
ADMITTING_SOURCE_CONCEPT_ID| | 0 |
ADMITTING_SOURCE_VALUE| | NULL |
DISCHARGE_TO_CONCEPT_ID|**MEDICAL_CLAIMS**<br/>DSTATUS|Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Discharge Status Logic](code_snippets.md#discharge-status-logic) |
DISCHARGE_TO_SOURCE_VALUE|**MEDICAL_CLAIMS**<br/>DSTATUS| |
PRECEDING_VISIT_OCCURRENCE_ID|**VISIT_OCCURRENCE** | For a given person, find the previous visit and reference it. | A foreign key to the **VISIT_OCCURRENCE** table of the visit immediately
