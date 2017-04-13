*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](README.md)

---

# CONDITION_OCCURRENCE

Condition data can be found in the medical claim table and should be
created when building VISIT_OCCURRENCE table.

**Key conventions:**

-   Starts from the **TEMP_MEDICAL** table generated throughout the
    VISIT_OCCURRENCE creation.

-   Remove duplicates existing from DIAG1 through DIAG25: if same ICD
    code exists in more than one position, keep only the one with lowest
    position number (e.g. if 30750 exists in DIAG1 and DIAG2, then keep
    only 30750 in DIAG1)

-   The ICD_FLAG field defines if the claim is using ICD9 or ICD10.

    1.  If ICD_FLAG is 9, then use VOCABULARY_ID = 'ICD9CM'

    2.  If ICD_FLAG is 10, then use VOCABULARY_ID = 'ICD10CM'

-   Optum removes decimal points from ICD diagnoses so when mapping to
    the OMOP Vocabulary, the decimal points need to also be removed from
    the vocabulary in order to map between the source and
    the vocabulary.

-   Always assign its associated VISIT_START_DATE as
    CONDITION_START_DATE, and use NEW_PROV and NEW_PROVCAT (refer to
    VISIT_OCCURRENCE section) to extract its ASSOCIATED_PROVIDER_ID
    from the *PROVIDER* table.

-   Remove duplicate records before assigning CONDITION_OCCURRENCE_ID.

<a name="table-mappings-condition-occurrence"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
CONDITION_OCCURRENCE_ID|-|System generated.| 
PERSON_ID|**TEMP_MEDICAL** PATID/PAT_PLANID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
CONDITION_CONCEPT_ID|**TEMP_MEDICAL** DIAG1-25, PROC_CD, PROC1-3|DIAG1-DIAG25: Use Section 3.1.2 and filter with Section 4.1 PROC1-PROC3, PROC_CD:<br>Use Section 3.1.2 and filter with Section 4.2| 
CONDITION_START_DATE|**VISIT_OCCURRENCE** VISIT_START_DATE| | 
CONDITION_END_DATE|-|NULL| 
CONDITION_TYPE_CONCEPT_ID|**VISIT_OCCURRENCE** PLACE_OF_SERVICE_SOURCE_VALUE|**DIAG1-DIAG25**: Use Section 5.1 <br> PROC1-3, PROC_CD Use Section 5.2|If same ICD code exists in more than one position, keep only the one with lowest position number. <br> Map to inpatient/outpatient header to be consistent with PROCEDURE_OCCURRENCE table. <br> These CONCEPT_IDs fall under VOCABULARY_ID = 'Condition Type' in CONCEPT table.
STOP_REASON|-|NULL| 
PROVIDER_ID|**TEMP_MEDICAL** NEW_PROV, NEW_PROVCAT|Map NEW_PROV and NEW_PROVCAT to PROVIDER_SOURCE_VALUE and SPECIALTY_SOURCE_VALUE in Provider table to extract its associated Provider ID. | 
VISIT_OCCURRENCE_ID|**VISIT_OCCURRENCE** VISIT_OCCURRENCE_ID| | 
CONDITION_STATUS_CONCEPT_ID|**TEMP_MEDICAL** POA, DIAG1-DIAG25 | Split period-delimited string to obtain single character value corresponding to DIAG code by ordinal value.<br><br>N = 0<br>U = 0<br>W = 46236988<br>Y = 46236988<br>|
CONDITION_SOURCE_CONCEPT_ID|**TEMP_MEDICAL** DIAG1-DIAG25, PROC_CD, PROC1-3|**DIAG1-DIAG25**: Use Section 3.1.1 and filter with Section 6.1 <br><br> PROC_CD, PROC1-3: Use Section 3.1.1 and filter with Section 6.2| 
CONDITION_SOURCE_VALUE|**TEMP_MEDICAL** DIAG1-DIAG25, PROC_CD, PROC1-3|Exclude records with invalid ICD9 or ICD10 diagnosis codes.|Use rules mentioned above to exclude invalid ICD9 or ICD10 diagnosis codes.|
CONDITION_SOURCE_VALUE|**TEMP_MEDICAL** POA, DIAG1-DIAG25|Split period-delimited string to obtain single character value corresponding to DIAG code by ordinal value.|

