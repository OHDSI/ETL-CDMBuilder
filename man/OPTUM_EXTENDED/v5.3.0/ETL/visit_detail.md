*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD*
<br>*CDM Version = 5.3.1, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: VISIT_DETAIL

The VISIT_DETAIL table is an optional table used to represents details of each record in the parent visit_occurrence table. For every record in visit_occurrence table there may be 0 or more records in the visit_detail table with a 1:n relationship where n may be 0. The visit_detail table is structurally very similar to visit_occurrence table and belongs to the similar domain as the visit.

<a name="table-mappings-visit-detail"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
VISIT_DETAIL_ID| |System generated.|
PERSON_ID|**MEDICAL_CLAIMS**<br/>PATID/PAT_PLANID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.|
VISIT_DETAIL_CONCEPT_ID|**MEDICAL_CLAIMS**<br/>POS, RVNU_CD, PROC_CD|Use the steps from [Visit Logic](code_snippets.md#visit-logic) to map to these CONCEPT_IDs:<br>IP = 9201<br>OP = 9202<br>ER = 9203<br>LTC = 42898160|These CONCEPT_IDs fall under VOCABULARY_ID = 'Visit' in CONCEPT table.
VISIT_DETAIL_START_DATE|**MEDICAL_CLAIMS**<br/>FST_DT| Use min(FST_DT) |
VISIT_DETAIL_START_DATETIME|Set time to 00:00:00<br/><br/>**MEDICAL_CLAIMS** FST_DT| Use min(FST_DT) |
VISIT_DETAIL_END_DATE|**MEDICAL_CLAIMS**<br/>LST_DT| Use min(LST_DT) |
VISIT_DETAIL_END_DATETIME|**MEDICAL_CLAIMS**<br/>LST_DT|Set time to 00:00:00<br/><br/>Use min(LST_DT) |
VISIT_DETAIL_TYPE_CONCEPT_ID| |Use concept [44818517 (Visit derived from encounter on claim)](http://www.ohdsi.org/web/atlas/#/concept/44818517)|
PROVIDER_ID|**MEDICAL_CLAIMS**<br>PROV, PROVCAT|Map PROV and PROVCAT to PROVIDER_SOURCE_VALUE and SPECIALTY_SOURCE_VALUE in Provider table to extract its associated Provider ID. |
CARE_SITE_ID| | NULL |
VISIT_DETAIL_SOURCE_VALUE| | Use the steps from [Visit Logic](code_snippets.md#visit-logic) to define visit types, and then obtain values of 'IP','ER','OP', or 'LTC'. |
VISIT_DETAIL_SOURCE_CONCEPT_ID| | 0 |
ADMITTING_SOURCE_VALUE| | 0 |
ADMITTING_SOURCE_CONCEPT_ID| | NULL |
DISCHARGE_TO_CONCEPT_ID|**MEDICAL_CLAIMS**<br/>DSTATUS|Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Discharge Status Logic](code_snippets.md#discharge-status-logic) |
DISCHARGE_TO_SOURCE_VALUE|**MEDICAL_CLAIMS**<br/>DSTATUS| |
PRECEDING_VISIT_DETAIL_ID| | NULL |
VISIT_DETAIL_PARENT_ID| | NULL |
VISIT_OCCURRENCE_ID|**VISIT_OCCURRENCE**<br/>VISIT_OCCURRENCE_ID | This is the VISIT_OCCURRENCE_ID for the VISIT_OCCURRENCE record that is the parent for the VISIT_DETAIL record |
