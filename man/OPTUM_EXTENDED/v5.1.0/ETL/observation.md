*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](README.md)

---

# CDM Table: OBSERVATION

Observations describe symptoms, clinical observations, etc. about the
person.

Key conventions:

-   Optum Extended SES does include a Health Risk Assessment table
    (**HRA**), but for the purposes of this document, we will not
    include this data at this time due to the ambiguities of the
    source data. Future versions may include it once clarifications on
    the content of that table are made available by Optum.

-   Only include records with OBSERVATION_DATE that fall within an
    *OBSERVATION_PERIOD*s.


**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
OBSERVATION_ID| |A system generated unique identifier for each observation. | 
PERSON_ID|**TEMP_MEDICAL**: <br>PATID/PAT_PLANID<br><br>**LAB_RESULTS**:<br>PATID / PAT_PLANID<br>|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
OBSERVATION_CONCEPT_ID|**TEMP_MEDICAL**:<br>DIAG1-DIAG25; PROC1-PROC25, PROC_CD, <br><br>DRG<br><br>SES/DOD_**LAB_RESULTS**: <br>LOINC_CD<br>PROC_CD|**TEMP_MEDICAL** (DIAG1-DIAG25):<br>Use [Concept Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields)<br>**TEMP_MEDICAL** (PROC1-PROC25, PROC_CD):<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields)<br><br><br>DRGs still require a mapping. DRGs change over time so we need to map to the DRG that is valid at the time the procedure occurred.  Notice we do not set INVALID_REASON IS NULL – since we are using historical codes, some DRGs we use will be invalid today but not at the time of the procedure.<br><br>Use Vocab map [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology), but do not set INVALID_REASON to NULL<br><br>Use filter:<br>```WHERE SOURCE_VOCABULARY_ID IN ('DRG')<br>AND TARGET_VOCABULARY_ID IN ('DRG')<br>AND TARGET_STANDARD_CONCEPT IS NOT NULL```|<br><br>**LAB_RESULTS**:<br>(First, look for LOINC_CD. If no map exists, then look for PROC_CD):<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Other Procedure Fields](code_snippets.md#from-other-procedure-fields)<br>
OBSERVATION_DATE|**TEMP_MEDICAL**: <br>FST_DT<br><br>**LAB_RESULTS**:<br>FST_DT| | 
OBSERVATION_TIME|-|NULL| 
VALUE_AS_NUMBER|**TEMP_MEDICAL**:<br>UNITS<br><br>**LAB_RESULTS**: <br>RSLT_NBR| | 
VALUE_AS_STRING|-|NULL| 
VALUE_AS_CONCEPT_ID|**LAB_RESULTS**<br>ABNL_CD<br>RSLT_TXT<br><br>**TEMP_MEDICAL**:<br>DIAG1-DIAG25; PROC1-PROC25, PROC_CD |**LAB_RESULTS**:  <br>Follow logic given in MEASUREMENT table.<br><br>**TEMP_MEDICAL**:<br>Use [Source to Maps to Value](code_snippets.md#source-to-maps-to-value) and point it at the SOURCE_CODE.  But only take the top TARGET_CONCEPT_ID because a few SOURCE_CODES can map to multiple TARGET_CONCEPT_ID.| 
UNIT_CONCEPT_ID|**TEMP_MEDICAL**:<br>-<br><br>**LAB_RESULTS**:<br>RSLT_UNIT_NM<br><br><br>|Null<br><br><br>Filters:<br>```WHERE SOURCE_VOCABULARY_ID IN ('UCUM')<br>AND TARGET_VOCABULARY_ID IN ('UCUM') <br>AND TARGET_INVALID_REASON IS NULL```| 
RANGE_LOW|**TEMP_MEDICAL**:<br>-<br><br>**LAB_RESULTS**:<br>LOW_NRML<br>| | 
RANGE_HIGH|**TEMP_MEDICAL**:<br>-<br><br>**LAB_RESULTS**:<br>HI_NRML<br>| | 
OBSERVATION_TYPE_CONCEPT_ID|**TEMP_MEDICAL**:<br>UNITS<br><br>**LAB_RESULTS**:<br>Take whatever was set in the MEASUREMENT table|**TEMP_MEDICAL**:<br>DIAG1-DIAG25; PROC1-PROC25, PROC_CD<br><br>Take the type assigned in [Concept Type Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields-1) and [Concept Type Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-1). <br><br>DRG:<br>900000008-Claim DRG<br><br>LAB:<br>38000277 – Observation numeric result| 
ASSOCIATED_PROVIDER_ID|**TEMP_MEDICAL**:<br>PROV|NULL| 
VISIT_OCCURRENCE_ID|**TEMP_MEDICAL**:<br>VISIT_OCCURRENCE_ID|<br><br>**LAB_RESULTS**:<br>NULL|Refer to logic in building VISIT_OCCURRENCE table for linking with VISIT_OCCURRENCE_ID
RELEVANT_CONDITION_CONCEPT_ID|-|NULL| 
OBSERVATION_SOURCE_VALUE|**TEMP_MEDICAL**:<br>DIAG1-DIAG25; PROC1-PROC25, PROC_CD, DRG<br><br>**LAB_RESULTS**: <br>LOINC_CD<br>PROC_CD|**LAB_RESULTS**: <br>The LOINC_CD or PROC_CD as it appears<br><br>**LAB_RESULTS** table and as was selected above (i.e. use the LOINC_CD first if possible).  <br>| 
UNIT_SOURCE_VALUE|**TEMP_MEDICAL**:<br>NULL<br><br>**LAB_RESULTS**:<br>RSLT_UNIT_NM| | 
