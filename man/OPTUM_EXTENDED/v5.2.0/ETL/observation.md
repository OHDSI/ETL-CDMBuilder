*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.2, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

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
PERSON_ID|**MEDICAL_CLAIMS** <br>PATID/PAT_PLANID<br><br>**LAB_RESULTS**<br>PATID / PAT_PLANID<br>|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
OBSERVATION_CONCEPT_ID|**MED_DIAGNOSIS**<br/>DIAG<br><br>**MED_PROCEDURE**<br/>PROC<br><br>**MEDICAL_CLAIMS**<br/>PROC\_CD, DRG<br><br>**LAB_RESULTS**<br/>LOINC_CD, PROC_CD<br><br>**SES (only in Extended SES)** d_household_income_range_code, d_education_level_code, d_home_ownership_code, d_occupation_type_code|**MED_DIAGNOSIS** (DIAG)<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields)<br/><br/>**MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD)<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields)<br/><br/>**LAB_RESULTS** (LOINC_CD)<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Lab Results LOINC_CD](code_snippets.md#from-lab-results-loinc_cd)<br/><br/>**MEDICAL_CLAIMS** (DRG)<br/> DRGs still require a mapping. DRGs change over time so we need to map to the DRG that is valid at the time the procedure occurred.  Notice we do not set INVALID_REASON IS NULL – since we are using historical codes, some DRGs we use will be invalid today but not at the time of the procedure.<br><br>Use Vocab map [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology), but do not set INVALID_REASON to NULL<br><br>Use filter:<br>```WHERE SOURCE_VOCABULARY_ID IN ('DRG') AND TARGET_VOCABULARY_ID IN ('DRG') AND TARGET_STANDARD_CONCEPT IS NOT NULL``` <br/><br/>**SES** d_household_income_range_code: Set to concept [4076114 (Household Income)](http://www.ohdsi.org/web/atlas/#/concept/4076114)<br/><br/>d_education_level_code:<br/>Set to [42528763 (Highest level of education - reported)](http://www.ohdsi.org/web/atlas/#/concept/42528763)<br/><br/>d_home_ownership_code:<br/>Set to [4076206 (House ownership and tenure)](http://www.ohdsi.org/web/atlas/#/concept/4076206)<br/><br/>d_occupation_type_code:<br/>Set to [4033543 (Occupation)](http://www.ohdsi.org/web/atlas/#/concept/4033543)|<br><br>**LAB_RESULTS**:<br>(First, look for LOINC_CD. If no map exists, then look for PROC_CD):<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Other Procedure Fields](code_snippets.md#from-other-procedure-fields) 
OBSERVATION_DATE|**MEDICAL_CLAIMS**<br>FST_DT<br><br>**LAB_RESULTS**<br>FST_DT<br/><br/>**OBSERVATION_PERIOD**<br/>OBSERVATION_PERIOD_START_DATE| **SES**<br/>As no date is associated with these SES fields, use the observation_period_start_date | 
OBSERVATION_DATETIME|Set time to 00:00:00<br/><br/> **MEDICAL_CLAIMS**: <br>FST_DT<br><br>**LAB_RESULTS**:<br>FST_DT| | 
OBSERVATION_TYPE_CONCEPT_ID|**MED_DIAGNOSIS**<br/>DIAG_POSITION<br/><br/>**MED_PROCEDURE**<br/>PROC_POSITION<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**LAB_RESULTS**<br>Take whatever was set in the MEASUREMENT table<br/><br/>**SES (only for Extended SES)** d_household_income_range_code, d_education_level_code, d_home_ownership_code, d_occupation_type_code|**DIAG_POSITION**<br>Use [Concept Type Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields-1)<br/><br/>**PROC_POSITION**, **PROC_CD**<br/>Use [Concept Type Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-1). <br><br>**DRG**<br>Use concept [900000008 (Claim DRG)](http://www.ohdsi.org/web/atlas/#/concept/900000008)<br><br>**LAB_RESULTS**<br>Use concept [38000277 (Observation numeric result)](http://www.ohdsi.org/web/atlas/#/concept/38000277)<br/><br/>**SES**<br/> For each of these fields, use concept [44814721 - Patient Reported](http://www.ohdsi.org/web/atlas/#/concept/44814721)<br/><br/>| 
VALUE_AS_NUMBER|**MEDICAL_CLAIMS**<br>UNITS<br><br>**LAB_RESULTS**<br/>RSLT_NBR<br/><br/>**SES**<br/>d_home_ownership_code| | 
VALUE_AS_STRING|**SES (Extended SES Only)** d_household_income_range_code, d_education_level_code, d_home_ownership_code, d_occupation_type_code |**d_household_income_range_code**<br/> 0 = Unknown<br/>1 = <$40K<br/>2 = $40K-$49K<br/>3 = $50K-$59K<br/>4 = $60K-$74K<br/>5 = $75K-$99K<br/>6 = $100K+<br/><br/>**d_education_level_code**<br/> A = Less than 12th Grade<br/>B = High School Diploma<br/>C = Less than Bachelor Degree<br/>D = Bachelor Degree Plus<br/>U =	Unknown<br/><br/>**d_home_ownership_code**<br/>1 = Probable Homeowner<br/>0 = Unknown<br/><br/>**d_occupation_type_code**<br/>1 = Manager/Owner/Professional<br/>2 = White Collar/Health/Civil Service/Military<br/>3 = Blue Collar<br/>4 = Homemaker/Retired<br/>U = Missing/Unknown|
VALUE_AS_CONCEPT_ID|**LAB_RESULTS**<br>ABNL_CD<br>RSLT_TXT<br><br>**MED_DIAGNOSIS**<br>DIAG<br/><br/>**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD |**LAB_RESULTS** <br>Follow logic given in MEASUREMENT table.<br><br>**MEDICAL_CLAIMS**<br>Use [Source to Maps to Value](code_snippets.md#source-to-maps-to-value) and point it at the SOURCE_CODE.  But only take the top TARGET_CONCEPT_ID because a few SOURCE_CODES can map to multiple TARGET_CONCEPT_ID.| 
QUALIFIER_CONCEPT_ID| | |
UNIT_CONCEPT_ID|**LAB_RESULTS**:<br>RSLT_UNIT_NM<br><br><br>|Use Vocab map [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with:<br>```WHERE SOURCE_VOCABULARY_ID IN ('UCUM') AND TARGET_VOCABULARY_ID IN ('UCUM') AND TARGET_INVALID_REASON IS NULL```| 
PROVIDER_ID|**MEDICAL_CLAIMS**<br/>PROV| |
VISIT_OCCURRENCE_ID|**MEDICAL_CLAIMS**<br>VISIT_OCCURRENCE_ID| |Refer to logic in building VISIT_OCCURRENCE table for linking with VISIT_OCCURRENCE_ID
OBSERVATION_SOURCE_VALUE|**MED_DIAGNOSIS**<br/>DIAG<br/><br/>**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD, DRG<br><br>**LAB_RESULTS**<br/>LOINC_CD, PROC_CD|**LAB_RESULTS**: <br>The LOINC_CD or PROC_CD as it appears<br><br>**LAB_RESULTS** table and as was selected above (i.e. use the LOINC_CD first if possible).  <br>| 
OBSERVATION_SOURCE_CONCEPT_ID|**MED_DIAGNOSIS**<br/>DIAG<br/><br/>**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD, DRG<br><br>**LAB_RESULTS**<br/>LOINC_CD, PROC_CD|**DIAG**<br/>Use [Source to Source](code_snippets.md#source-to-source) and filter with [Source Concept Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields-2) <br><br> **PROC_CD, PROC**<br/>Use [Source to Source](code_snippets.md#source-to-source) and filter with [Source Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-2)<br/><br/>**LOINC_CD**<br/>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Source Concept Ids from Lab Results LOINC_CD](code_snippets.md#from-lab-results-loinc_cd-1)|
UNIT_SOURCE_VALUE|**LAB_RESULTS**<br>RSLT_UNIT_NM| | 
QUALIFIER_SOURCE_VALUE| | |