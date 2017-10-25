*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](README.md)

---

# CDM Table: DRUG_EXPOSURE

Drug exposures are garnered from **RX_CLAIMS** table but can also be extracted from procedure codes found in the *PROCEDURE_OCCURRENCE* table.

**Key conventions:**

-   **Prescription drug**:

    1.  Keep records with FILL_DT that fall within an *OBSERVATION_PERIOD* available for each person.
    2.  Remove duplicate records within each RX claim (identified by PAT_PLANID and CLMID): Sort Rx table by PAT_PLANID, CLMID, NDC, COPAY, DEDUCT, DISPFEE, AVGWHLSL, STD_COST, DAYS_SUP, QUANTITY, RFL_NBR, MAIL_IND, NPI and DEA in ascending order. For each PAT_PLANID, CLMID,NDC combination, keep the last record.
    3.  Following previous step, smoosh records to remove reversals: Group data by PAT_PLANID, NDC, and FILL_DT, then keep max(RFL_NBR) as RFL_NBR, max(MAIL_IND) as MAIL_IND. Also if NPI exists keep max(NPI) as PROVIDER, if NPI does not exist try max(DEA). Cost information will be summed up and this intermediate table will be used for populating DRUG_COST table.
        1.  Set sum (QUANTITY) as QUANTITY – rounded to a whole number (e.g. 2.6 = 3)
        2.  Set sum (DAYS_SUP) as DAYS_SUPPLY, then apply this rule: if DAYS_SUPPLY &gt; 365, set it as 365, if DAYS_SUPPLY &lt;0,       set it as 0.
        3.  Set sum (COPAY) as PAID_COPAY, sum(DEDUCT) as PAID_TOWARD_DEDUCTIBLE, sum (DISPFEE) as DISPENSING_FEE, sum (AVGWHLSL) as AVERAGE_WHOLESALE_PRICE, sum (STD_COST) as TOTAL_PAID

<a name="table-mappings-drug-exposure"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
DRUG_EXPOSURE_ID|-|System generated.| 
PERSON_ID|**RX_CLAIMS**: <br>PATID/PAT_PLANID<br><br>**TEMP_MEDICAL**: PATID/PAT_PLAN_ID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
DRUG_CONCEPT_ID|**RX_CLAIMS**:<br>NDC<br><br>**TEMP_MEDICAL**:<br>PROC1-PROC25, PROC_CD<br><br><br><br>|NDC:<br>Use Vocab map [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology).<br>Use filter:<br>WHERE SOURCE_VOCABULARY_ID IN ('NDC')<br>AND TARGET_STANDARD_CONCEPT= 'S'<br>AND TARGET_INVALID_REASON IS NULL<br>AND FILL_DT BETWEEN SOURCE_VALID_START_DATE AND SOURCE_VALID_END_DATE<br>**TEMP_MEDICAL** (PROC1-PROC25, PROC_CD):<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields)<br><br>|For procedure drugs, the CONCEPT_ID must have a DOMAIN_ID of ‘Drug’ to be included.<br><br>
DRUG_EXPOSURE_START_DATE|**RX_CLAIMS**: <br>FILL_DT<br><br>**TEMP_MEDICAL**: PROC1-PROC25, PROC_CD: VISIT_END_DATE  | | 
DRUG_EXPOSURE_END_DATE|-|NULL| 
DRUG_TYPE_CONCEPT_ID|**RX_CLAIMS**: <br>MAIL_IND<br><br>**TEMP_MEDICAL**: PROC1-PROC25, PROC_CD: PLACE_OF_SERVICE_SOURCE_VALUE |Prescription drug:  <br> If MAIL_IND = ‘Y’ then 38000176 (Prescription dispensed through mail order); else 38000175 (Prescription dispensed in pharmacy) <br><br>Procedure drug:  if <br>IP then 38000180 (Inpatient administration); else 38000179 (Physician administered drug, identified as procedure)|These CONCEPT_IDs fall under VOCABULARY_ID = ‘Drug Type’ in CONCEPT table.
STOP_REASON|-|NULL| 
REFILLS|**RX_CLAIMS**:<br>RFL_NBR|NULL for Procedure drug| 
QUANTITY|**RX_CLAIMS**:<br> sum(QUANTITY)<br><br> <br>**TEMP_MEDICAL**: PROC1-PROC25, PROC_CD:<br>sum(UNITS)| | 
DAYS_SUPPLY|**RX_CLAIMS** :<br>sum(DAYS_SUP)|NULL for  Procedure drug| 
SIG|-|NULL| 
ROUTE_CONCEPT_ID|-|0| 
EFFECTIVE_DRUG_DOSE|-|NULL| 
DOSE_UNIT_CONCEPT_ID|-|0| 
LOT_NUMBER|-|NULL| 
PROVIDER_ID|**RX_CLAIMS**:<br>NPI,<br>DEA<br><br>**TEMP_MEDICAL**: PROC1-PROC25, PROC_CD: <br>NEW_PROV, <br>NEW_PROVCAT<br>|Prescription drug:  <br>Map NPI or DEA to PROVIDER_SOURCE_VALUE in PROVIDER table, and extract its associated PROVIDER_ID;<br><br>Procedure drug:  <br>Map NEW_PROV and NEW_PROVCAT to PROVIDER_SOURCE_VALUE and SPECIALTY_SOURCE_VALUE in Provider table to extract its associated Provider ID.| 
VISIT_OCCURRENCE_ID|VISIT_OCCURRENCE_ID:   VISIT_OCCURRENCE_ID|Prescription drug: <br>NULL<br><br>Procedure drug:  VISIT_OCCURRENCE_ID| 
DRUG_SOURCE_VALUE|**RX_CLAIMS**:<br>NDC<br><br>**TEMP_MEDICAL**:<br>PROC_CD, PROC1-PROC25<br><br>SES/DOD_LAB_RESULTS:<br>PROC_CD| | 
DRUG_SOURCE_CONCEPT_ID|**RX_CLAIMS**:<br>NDC<br><br>**TEMP_MEDICAL**:<br>PROC_CD, PROC1-PROC25<br><br>SES/DOD_LAB_RESULTS:<br>PROC_CD|Filter when drug coming from **RX_CLAIMS**:<br>WHERE SOURCE_VOCABULARY_ID IN ('NDC')<br>AND TARGET_VOCABULARY_ID IN ('NDC')<br>AND FILL_DT BETWEEN SOURCE_VALID_START_DATE AND SOURCE_VALID_END_DATE<br><br>**TEMP_MEDICAL** (PROC_CD, PROC1-PROC25):<br>Use [Source to Source](code_snippets.md#source-to-source) and filter with [Source Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-2)<br><br>SES/DOD_LAB_RESULTS<br>Use [Source to Source](code_snippets.md#source-to-source) and filter with [Source Concept Ids from Other Procedure Fields](code_snippets.md#from-other-procedure-fields-2)| 
ROUTE_SOURCE_VALUE|-|0| 
DOSE_UNIT_SOURCE_VALUE|-|0| 

