*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.2, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: PROCEDURE_OCCURRENCE

For PROCEDURE data coming from **MEDICAL_CLAIMS**, please refer to the claims collapsing and visit type creation found in the [VISIT_OCCURRENCE file](VISIT_OCCURRENCE.md).

### Procedure code conventions


#### For ICD procedure codes stored in **MED_PROCEDURE**'s PROC field:

1.  '0', '00', '000', '0000', '00000', '000000', '0000000' are usually
    used as place holder and will be excluded.

2.  ICD9 procedure codes should contains only 2, 3 or 4 digits numeric
    codes (without their decimals). Exclude codes that are not in
    this format.

3.  ICD10 procedure codes should contain 7 characters. Exclude codes
    that are not in this format.

4.  Remove duplicates existing from PROCs with PROC_POSITION in ('01', '02', '03'): if same ICD
    procedure code exists in more than one position, keep only the one
    with low position number (e.g. if 7061 exists in PROC with PROC_POSITION '01' and '02',
    then keep only 7061 with PROC_POSITION = '01'). Then store the ICD procedure code
    as PROCEDURE_SOURCE_VALUE.

5.  Following step 1 through 4, sort data by VISIT_OCCURRENCE_ID,
    PROCEDURE_SOURCE_VALUE and DIAG (with DIAG_POSITION = '01') in ascending order. For each
    PROCEDURE_SOURCE_VALUE in a visit, assign its associated
    VISIT_END_DATE as PROCEDURE_DATE, use PROV and PROVCAT (refer to [VISIT_OCCURRENCE file](VISIT_OCCURRENCE.md)) extract its
    ASSOCIATED_PROVIDER_ID from *PROVIDER* table, and choose the
    concept_id associated with DIAG (with DIAG_POSITION = '01') in the first record
    as RELEVANT_CONDITION_CONCEPT_ID.

6.  Map PROCEDURE_SOURCE_VALUE to **ICD** procedure codes using code
    from [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology)..

#### For procedure codes stored in **MEDICAL_CLAIMS**'s PROC_CD field:

1.  **Records with unmapped or missing values will be kept to link cost
    information**. Set PROC_CD as PROCEDURE_SOURCE_VALUE and FST_DT
    as PROCEDURE_DATE. For each row in **MEDICAL_CLAIMS** table, assign
    a unique PROCEDURE_COST_ID which will be used for creating
    *PROCEDURE_COST* table.

2.  Following step 1, sort data by VISIT_OCCURRENCE_ID,
    PROCEDURE_SOURCE_VALUE, PROCEDURE_DATE, DIAG1, PROV, and PROVCAT.
    For each PROCEDURE_SOURCE_VALUE in a visit on the same
    PROCEDURE_DATE, use PROV and PROVCAT (refer to [VISIT_OCCURRENCE file](VISIT_OCCURRENCE.md)) from the first
    record to extract its ASSOCIATED_PROVIDER_ID from PROVIDER table,
    and choose the concept_id associated with DIAG1 in the first record
    as RELEVANT_CONDITION_CONCEPT_ID.

3.  Map PROCEDURE_SOURCE_VALUE to CPT4/HCPCS/**ICD** procedure codes
    using [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) code.

-   Remove duplicate records before assigning PROCEDURE_SOURCE_CONCEPT_ID.


**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
PROCEDURE_OCCURRENCE_ID|-|System generated.| 
PERSON_ID|**MEDICAL_CLAIMS**<br/>PATID/PAT_PLANID <br><br> **LAB_RESULTS**<br/>PATID/PAT_PLANID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
PROCEDURE_CONCEPT_ID|**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**MED_DIAGNOSIS**<br/>DIAG<br/><br/>**LAB_RESULTS**<br/>LOINC, PROC_CD|**MED_DIAGNOSIS** (DIAG)<br> Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields) <br><br> **MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD)<br/>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields) <br><br> **LAB_RESULTS** (First, look for LOINC_CD. If no map exists, then look for PROC_CD and use PROC_CD logic)<br/> For LOINC_CD:<br/>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Lab Results LOINC_CD](code_snippets.md#from-lab-results-loinc_cd)<br><br>**PROC_CD**<br/> Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Other Procedure Fields](code_snippets.md#from-other-procedure-fields)|
PROCEDURE_DATE|**MEDICAL_CLAIMS**<br/>FST_DT<br/><br/>**VISIT_OCCURRENCE**<br/>VISIT_END_DATE|**MED_PROCEDURE** (PROC)<br/>Use VISIT_END_DATE of the associated VISIT_OCCURRENCE<br/><br/>**MED_DIAGNOSIS** (DIAG), **MEDICAL_CLAIMS** (PROC_CD)<br/>Use FST_DT| 
PROCEDURE_DATETIME|**MEDICAL_CLAIMS**<br/>FST_DT<br/><br/>**VISIT_OCCURRENCE**<br/>VISIT_END_DATE|Set time to 00:00:00<br/><br/>**MED_PROCEDURE** (PROC)<br/>Use VISIT_END_DATE of the associated VISIT_OCCURRENCE<br/><br/>**MED_DIAGNOSIS** (DIAG), **MEDICAL_CLAIMS** (PROC_CD)<br/>Use FST_DT| 
PROCEDURE_TYPE_CONCEPT_ID|**VISIT_OCCURRENCE**<br/>PLACE_OF_SERVICE_SOURCE_VALUE<br/><br/>**MED_DIAGNOSIS**<br/>DIAG_POSITION<br/><br/>**MED_PROCEDURE**<br/>PROC_POSITION|**MED_DIAGNOSIS** (DIAG) Use [Concept Type Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields-1) <br><br> **MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD) Use [Concept Type Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-1) <br><br> **LAB_RESULTS** table: Use [44818702 (Lab Result)](http://www.ohdsi.org/web/atlas/#/concept/44818702) for all rows| 
MODIFIER_CONCEPT_ID|-|0| 
QUANTITY|**MEDICAL_CLAIMS**<br/>Units| | 
PROVIDER_ID|**MEDICAL_CLAIMS**<br/>PROV, PROVCAT|Map PROV and PROVCAT to PROVIDER_SOURCE_VALUE and SPECIALTY_SOURCE_VALUE in Provider table to extract its associated Provider ID| 
VISIT_OCCURRENCE_ID|**VISIT_OCCURRENCE**<br/>VISIT_OCCURRENCE_ID| | 
PROCEDURE_SOURCE_VALUE|**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**MED_DIAGNOSIS**<br/>DIAG<br/><br/>**LAB_RESULTS**<br/>PROC_CD|Clean codes using logic above ("Procedure Code Conventions")|
PROCEDURE_SOURCE_CONCEPT_ID|**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**MED_DIAGNOSIS**<br/>DIAG<br/><br/>**LAB_RESULTS**<br/>PROC_CD|**MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD)<br/>Use [Source to Source (Procedure)](code_snippets.md#source-to-source and filter with [Source Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-2) <br/><br/> **MED_DIAGNOSIS** (DIAG)<br/>Use [Source to Source (Condition)](code_snippets.md#source-to-source and filter with [Source Concept Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields-2) <br><br> **LAB_RESULTS**<br/>Use [Source to Source (Other)](code_snippets.md#source-to-source and filter with [Source Concept Ids from Other Procedure Fields](code_snippets.md#from-other-procedure-fields-2)| 
QUALIFIER_SOURCE_VALUE|-|NULL| 
