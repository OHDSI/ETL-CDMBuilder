*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD 
CDM Version = 5.0.1, Clinformatics Version = v7.0
Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](readme.md)

---

# DEVICE_EXPOSURE

The *DEVICE_EXPOSURE* table will be populated with records from
**TEMP_MEDICAL,** where the PROC code was mapped to a standard concept
with a DOMAIN_ID of 'Device'.

<a name="table-mappings-device-exposure"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
DEVICE_EXPOSURE_ID|-|System Generated| 
PERSON_ID|TEMP_MEDICAL:<br>PATID / PAT_PLANID| | 
DEVICE_CONCEPT_ID|TEMP_MEDICAL:<br>PROC1-PROC3, PROC_CD, DIAG1-5|DIAG1-DIAG5:<br>Use Section 3.1.2 and filter with Section 4.1<br><br>PROC1-PROC3, PROC_CD:<br>Use Section 3.1.2 and filter with Section 4.2<br>| 
DEVICE_EXPOSURE_START_DATE|VISIT_OCCURRENCE VISIT_END_DATE| | 
DEVICE_EXPOSURE_END_DATE|-| | 
DEVICE_TYPE_CONCEPT_ID|-|If the record is coming from another table, like the PROCEDURE_OCCURENCE, keep the types that would have been assigned in that table.| 
UNIQUE_DEVICE_ID|-| | 
QUANTITY|0| | 
PROVIDER_ID|NEW_PROV<br>NEW_PROVCAT|Map NEW_PROV<br>to PROVIDER_SOURCE_VALUE and NEW_PROVCAT to<br>SPECIALTY_SOURCE_VALUE in Provider table to extract associated Provider ID.| 
VISIT_OCCURRENCE_ID|VISIT_OCCURRENCE –VISIT_OCCURRENCE_ID|Refer to logic in building VISIT_OCCURRENCE table for linking with VISIT_OCCURRENCE_ID| 
DEVICE_SOURCE_VALUE|TEMP_MEDICAL:<br>PROC1-PROC3, PROC_CD, DIAG1-5| | 
DEVICE_SOURCE_CONCEPT_ID|TEMP_MEDICAL:<br>PROC1-PROC3, PROC_CD, DIAG1-5|TEMP_MEDICAL (PROC1-3 & PROC_CD):<br>Use Section 3.1.1 and filter with Section 6.2<br><br>TEMP_MEDICAL (DIAG1-DIAG5):<br>Use Section 3.1.1 and filter with Section 6.1<br><br><br>|Use the code in Section 3.1.1
