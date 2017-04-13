*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](README.md)

---

# CDM Table: PROCEDURE_OCCURRENCE

Procedure data can be extracted from the Optum **TEMP_MEDICAL** table
and should be created when building *VISIT_OCCURRENCE*.

**Key conventions:**

-   Starts from the **TEMP_MEDICAL** table generated throughout the
    *VISIT_OCCURRENCE* creation.

-   The following graph shows how procedure data is stored in
    **MEDICAL_CLAIMS** table

> &lt;img src="media/image7.png" width="560" height="161" />

-   For ICD procedure codes stored in PROC1, PROC2 and PROC3:

1.  '0', '00', '000', '0000', '00000', '000000', '0000000' are usually
    used as place holder and will be excluded.

2.  ICD9 procedure codes should contains only 2, 3 or 4 digits numeric
    codes (without their decimals). Exclude codes that are not in
    this format.

3.  ICD10 procedure codes should contain 7 characters. Exclude codes
    that are not in this format.

4.  Remove duplicates existing from PROC1 through PROC3: if same ICD
    procedure code exists in more than one position, keep only the one
    with low position number (e.g. if 7061 exists in PROC1 and PROC2,
    then keep only 7061 in PROC1). Then store the ICD procedure code
    as PROCEDURE_SOURCE_VALUE.

5.  Following step 1 through 4, sort data by VISIT_OCCURRENCE_ID,
    PROCEDURE_SOURCE_VALUE and DIAG1 in ascending order. For each
    PROCEDURE_SOURCE_VALUE in a visit, assign its associated
    VISIT_END_DATE as PROCEDURE_DATE, use NEW_PROV and NEW_PROVCAT
    (refer to VISIT_OCCURRENCE section) extract its
    ASSOCIATED_PROVIDER_ID from *PROVIDER* table, and choose the
    concept_id associated with DIAG1 in the first record
    as RELEVANT_CONDITION_CONCEPT_ID.

6.  Map PROCEDURE_SOURCE_VALUE to **ICD** procedure codes using code
    from Section 3.1.2..

-   For procedure codes stored in PROC_CD:

1.  **Records with unmapped or missing values will be kept to link cost
    information**. Set PROC_CD as PROCEDURE_SOURCE_VALUE and FST_DT
    as PROCEDURE_DATE. For each row in **TEMP_MEDICAL** table, assign
    a unique PROCEDURE_COST_ID which will be used for creating
    *PROCEDURE_COST* table.

2.  Following step 1, sort data by VISIT_OCCURRENCE_ID,
    PROCEDURE_SOURCE_VALUE, PROCEDURE_DATE, DIAG1, PROV, and PROVCAT.
    For each PROCEDURE_SOURCE_VALUE in a visit on the same
    PROCEDURE_DATE, use NEW_PROV and NEW_PROVCAT from the first
    record to extract its ASSOCIATED_PROVIDER_ID from PROVIDER table,
    and choose the concept_id associated with DIAG1 in the first record
    as RELEVANT_CONDITION_CONCEPT_ID.

3.  Map PROCEDURE_SOURCE_VALUE to CPT4/HCPCS/**ICD** procedure codes
    using Section 3.1.2 code.

-   Remove duplicate records before assigning PROCEDURE_URCE_ID.

<a name="table-mappings-procedure-occurrence"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
PROCEDURE_OCCURRENCE_ID|-|System generated.| 
PERSON_ID|**TEMP_MEDICAL** PATID/PAT_PLANID <br><br> **LAB_RESULTS** PATID/PAT_PLANID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
PROCEDURE_CONCEPT_ID|**TEMP_MEDICAL** PROC1, PROC2, PROC3, PROC_CD, DIAG1-DIAG25 <br><br> **LAB_RESULTS**: LOINC, PROC_CD|**TEMP_MEDICAL** (DIAG1-DIAG25) <br><br> Use Section 3.1.2 and filter with Section 4.1 <br><br> **TEMP_MEDICAL** (PROC1-PROC3, PROC_CD) Use Section 3.1.2 and filter with Section 4.2 <br><br> **LAB_RESULTS** (First, look for LOINC_CD. If no map exists, then look for PROC_CD) LOINC_CD WHERE SOURCE_VOCABULARY_ID IN ('LOINC') AND TARGET_STANDARD_CONCEPT IS NOT NULL <br><br> PROC_CD: Use Section 3.1.2 and filter with Section 4.3|As data is being assigned a CONCEPT_ID check the domain.  While all PROC_CD records write to the PROCEDURE_OCCURRENCE to help the PROCEDURE_COST table CONCEPTs that belong to other domains should land in their appropriate table.  Codes that move to another table based on domain should have PROCEDURE_CONCEPT_ID set to 0 in the PROCEDURE_OCCURRENCE table. <br><br> Procedures included in the DRUG_EXPOSURE table are also included here. <br><br> 0 will be set for unmapped procedure codes.
PROCEDURE_DATE|**TEMP_MEDICAL** FST_DT (only for procedure code extracted from PROC_CD) <br> VISIT_OCCURRENCE:VISIT_END_DATE|For ICD procedure codes extracted from PROC1, PROC2, PROC3: use VISIT_END_DATE of their associated VISIT_OCCURRENCE; For procedure code extracted from PROC_CD, use FST_DT| 
PROCEDURE_TYPE_CONCEPT_ID|VISIT_OCCURRENCE PLACE_OF_SERVICE_SOURCE_VALUE|**TEMP_MEDICAL** (DIAG1-5) Use Section 5.1 <br><br> **TEMP_MEDICAL** (PROC1-3, PROC_CD) Use Section 5.2 <br><br> **LAB_RESULTS** table: This will be 44818702 for all rows (Lab Result)| 
MODIFIER_CONCEPT_ID|-|0| 
QUANTITY|**TEMP_MEDICAL** Units| | 
PROVIDER_ID|**TEMP_MEDICAL** NEW_PROV, NEW_PROVCAT|Map NEW_PROV and NEW_PROVCAT to PROVIDER_SOURCE_VALUE and SPECIALTY_SOURCE_VALUE in Provider table to extract its associated Provider ID| 
VISIT_OCCURRENCE_ID|VISIT_OCCURRENCE VISIT_OCCURRENCE_ID| | 
PROCEDURE_SOURCE_VALUE|**TEMP_MEDICAL** PROC1, PROC2, PROC3, PROC_CD,DIAG1-DIAG25 <br><br> **LAB_RESULTS** PROC_CD|Clean codes from PROC1, PROC2, PROC3|See logic above for how to clean ICD procedure codes.
PROCEDURE_SOURCE_CONCEPT_ID|**TEMP_MEDICAL** PROC1-PROC3, PROC_CD, DIAG1-DIAG25 <br><br> **LAB_RESULTS**: PROC_CD|**TEMP_MEDICAL** (PROC_CD, PROC1-3): Use Section 3.1.1 and filter with Section 6.2 **TEMP_MEDICAL** (DIAG1-5) Use Section 3.1.1 and filter with Section 6.1 <br><br> **LAB_RESULTS** Use Section 3.1.1 and filter with Section 6.3| 
QUALIFIER_SOURCE_VALUE|-|NULL| 
