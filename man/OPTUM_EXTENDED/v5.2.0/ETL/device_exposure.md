*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.2, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: DEVICE_EXPOSURE

The *DEVICE_EXPOSURE* table will be populated with records from
**MED_PROCEDURE**, where the PROC code was mapped to a standard concept
with a DOMAIN_ID of 'Device'.

<a name="table-mappings-device-exposure"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
DEVICE_EXPOSURE_ID|-|System Generated| 
PERSON_ID|**MEDICAL_CLAIMS**<br>PATID / PAT_PLANID| | 
DEVICE_CONCEPT_ID|**MED_PROCEDURE**<br>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**MED_DIAGNOSIS**<br/>DIAG|**DIAG**<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields)<br><br>**PROC**, **PROC_CD**<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields)<br>| 
DEVICE_EXPOSURE_START_DATE|**VISIT_OCCURRENCE**<br/>VISIT_END_DATE| | 
DEVICE_EXPOSURE_END_DATE| | | 
DEVICE_TYPE_CONCEPT_ID|**MED_PROCEDURE**<br>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**MED_DIAGNOSIS**<br/>DIAG|**DIAG_POSITION**<br>Use [Concept Type Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields-1)<br/><br/>**PROC_POSITION**, **PROC_CD**<br/>Use [Concept Type Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-1).| 
UNIQUE_DEVICE_ID| | | 
QUANTITY|0| | 
PROVIDER_ID|**MEDICAL_CLAIMS**<br/>PROV, PROVCAT|Map PROV to PROVIDER_SOURCE_VALUE and PROVCAT to SPECIALTY_SOURCE_VALUE in Provider table to extract associated Provider ID.| 
VISIT_OCCURRENCE_ID|**VISIT_OCCURRENCE**<br/>VISIT_OCCURRENCE_ID|Refer to logic in building VISIT_OCCURRENCE table for linking with VISIT_OCCURRENCE_ID| 
DEVICE_SOURCE_VALUE|**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**MED_DIAGNOSIS**<br/>DIAG| | 
DEVICE_SOURCE_CONCEPT_ID|**MED_PROCEDURE**<br>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**MED_DIAGNOSIS**<br/>DIAG|**PROC**, **PROC_CD**<br/>Use [Source to Source](code_snippets.md#source-to-source) and filter with [Source Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-2)<br><br>**DIAG**<br>Use [Source to Source](code_snippets.md#source-to-source) and filter with [Source Concept Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields-2)<br><br><br>|