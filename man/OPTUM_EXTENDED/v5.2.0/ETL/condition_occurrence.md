*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.2, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: CONDITION_OCCURRENCE

For CONDITION data coming from **MEDICAL_CLAIMS**, please refer to the claims collapsing and visit type creation found in the [VISIT_OCCURRENCE file](VISIT_OCCURRENCE.md).

**Key conventions:**

-   **MEDICAL_CLAIMS** define the claims, but to obtain the actual diagnoses, join with the **MED_DIAGNOSIS** table on CLMID.

-   For each claim referenced in **MED_DIAGNOSIS**, remove duplicates existing in the DIAG field among DIAG_POSITION 01-25: 
    - If the same ICD code exists in more than one position, keep only the one with lowest
    position number (e.g. if 30750 exists in DIAG_POSITION '01' and '02', then keep only 30750 from DIAG_POSITION '01')

-   The ICD_FLAG field in **MED_DIAGNOSIS** defines if the claim is using ICD9 or ICD10.

    1.  If ICD_FLAG is 9, then use VOCABULARY_ID = 'ICD9CM'

    2.  If ICD_FLAG is 10, then use VOCABULARY_ID = 'ICD10CM'

-   Optum removes decimal points from ICD diagnoses so when mapping to
    the OMOP Vocabulary, the decimal points need to also be removed from
    the vocabulary in order to map between the source and
    the vocabulary.

-   Always assign its associated VISIT_START_DATE as
    CONDITION_START_DATE, and use PROV and PROVCAT (refer to [VISIT_OCCURRENCE file](VISIT_OCCURRENCE.md)) to extract its ASSOCIATED_PROVIDER_ID
    from the *PROVIDER* table.

-   Remove duplicate records before assigning CONDITION_OCCURRENCE_ID.


**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
CONDITION_OCCURRENCE_ID|-|System generated.| 
PERSON_ID|**MEDICAL_CLAIMS**<br/> PATID/PAT_PLANID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
CONDITION_CONCEPT_ID|**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**MED_DIAGNOSIS**<br/>DIAG<br/><br/>**MED_PROCEDURE**<br/> PROC|**DIAG**<br/>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields) <br/><br/>**PROC, PROC_CD**<br/>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields)| 
CONDITION_START_DATE|**VISIT_OCCURRENCE** VISIT_START_DATE| | 
CONDITION_START_DATETIME|**VISIT_OCCURRENCE** VISIT_START_DATE| Set time to 00:00:00 | 
CONDITION_END_DATE| | | 
CONDITION_END_DATETIME| | | 
CONDITION_TYPE_CONCEPT_ID|**VISIT_OCCURRENCE**<br/>PLACE_OF_SERVICE_SOURCE_VALUE<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**MED_DIAGNOSIS**<br/>DIAG, DIAG_POSITION<br/><br/>**MED_PROCEDURE**<br/>PROC, PROC_POSITION|**DIAG**<br/>Use [Concept Type Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields-1)<br/><br/>**PROC**, **PROC_CD**<br/>Use [Concept Type Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-1)|If same ICD code exists in more than one position, keep only the one with lowest position number. <br> Map to inpatient/outpatient header to be consistent with PROCEDURE_OCCURRENCE table. <br> These CONCEPT_IDs fall under VOCABULARY_ID = 'Condition Type' in CONCEPT table.
STOP_REASON| | | 
PROVIDER_ID|**MEDICAL_CLAIMS**<br>PROV, PROVCAT|Map PROV and PROVCAT to PROVIDER_SOURCE_VALUE and SPECIALTY_SOURCE_VALUE in Provider table to extract its associated Provider ID. | 
VISIT_OCCURRENCE_ID|**VISIT_OCCURRENCE**<br/>VISIT_OCCURRENCE_ID| | 
CONDITION_SOURCE_VALUE|**MED_DIAGNOSIS**<br/>DIAG<br/><br/>**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD|Exclude records with invalid ICD9 or ICD10 diagnosis codes.|Use rules mentioned above to exclude invalid ICD9 or ICD10 diagnosis codes.|
CONDITION_SOURCE_CONCEPT_ID|**MED_DIAGNOSIS**<br/>DIAG<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**MED_PROCEDURE**<br/>PROC|**DIAG**<br/>Use [Source to Source](code_snippets.md#source-to-source) and filter with [Source Concept Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields-2) <br><br> **PROC_CD, PROC**<br/>Use [Source to Source](code_snippets.md#source-to-source) and filter with [Source Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-2)| 
CONDITION_STATUS_SOURCE_VALUE|**MED_DIAGNOSIS**<br/>POA| |
CONDITION_STATUS_CONCEPT_ID|**MED_DIAGNOSIS**<br/>POA | N = 0<br>U = 0<br>W = 46236988<br>Y = 46236988<br>|



