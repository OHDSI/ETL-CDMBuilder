*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.2, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

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
PERSON_ID|**RX_CLAIMS**: <br>PATID/PAT_PLANID<br><br>**MEDICAL_CLAIMS**: PATID/PAT_PLAN_ID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
DRUG_CONCEPT_ID|**RX_CLAIMS**:<br>NDC<br><br>**MED_PROCEDURE**<br>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br><br><br><br>|**NDC**<br>Use Vocab map [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology).<br>Use filter:<br>```WHERE SOURCE_VOCABULARY_ID IN ('NDC') AND TARGET_STANDARD_CONCEPT= 'S' AND TARGET_INVALID_REASON IS NULL AND FILL_DT BETWEEN SOURCE_VALID_START_DATE AND SOURCE_VALID_END_DATE```<br/><br/>**PROC**, **PROC_CD**<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields)<br><br>|For procedure drugs, the CONCEPT_ID must have a DOMAIN_ID of ‘Drug’ to be included.<br><br>
DRUG_EXPOSURE_START_DATE|**RX_CLAIMS**<br>FILL_DT<br><br>**VISIT_OCCURRENCE**<br/>VISIT_END_DATE|**MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD)<br/>Use VISIT_END_DATE | 
DRUG_EXPOSURE_START_DATETIME|**RX_CLAIMS**<br>FILL_DT<br><br>**VISIT_OCCURRENCE**<br/>VISIT_END_DATE|Set time to 00:00:00<br/><br/>**MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD)<br/>Use VISIT_END_DATE | 
DRUG_EXPOSURE_END_DATE| | | 
DRUG_EXPOSURE_END_DATETIME| | | 
DRUG_TYPE_CONCEPT_ID|**RX_CLAIMS**<br>MAIL_IND<br><br>**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD, PLACE_OF_SERVICE_SOURCE_VALUE |**RX_CLAIMS**<br/>if MAIL_IND = 'Y' then 38000176 (Prescription dispensed through mail order) else 38000175 (Prescription dispensed in pharmacy) <br><br>**MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD)<br/>if PLACE_OF_SERVICE_SOURCE_VALUE == 'IP' then [38000180 (Inpatient administration)](http://www.ohdsi.org/web/atlas/#/concept/38000180)<br/>else [38000179 (Physician administered drug, identified as procedure)](http://www.ohdsi.org/web/atlas/#/concept/38000179)|These CONCEPT_IDs fall under VOCABULARY_ID = 'Drug Type' in CONCEPT table.
STOP_REASON| | | 
REFILLS|**RX_CLAIMS**<br>RFL_NBR|NULL for Procedure drug| 
QUANTITY|**RX_CLAIMS**<br>QUANTITY<br><br>**MEDICAL_CLAIMS** <br/>UNITS|**RX_CLAIMS**<br/>Use sum(QUANTITY)<br/><br/>**MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD)<br>Use sum(UNITS) | 
DAYS_SUPPLY|**RX_CLAIMS**<br/>DAYS_SUP|Use sum(DAYS_SUPPLY)| 
SIG| | | 
ROUTE_CONCEPT_ID| |0| 
EFFECTIVE_DRUG_DOSE| | | 
DOSE_UNIT_CONCEPT_ID| |0| 
LOT_NUMBER| | | 
PROVIDER_ID|**RX_CLAIMS**<br>NPI, DEA<br><br>**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD, PROV, PROVCAT|**RX_CLAIMS**<br>Map NPI or DEA to PROVIDER_SOURCE_VALUE in PROVIDER table, and extract its associated PROVIDER_ID;<br><br>**MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD)<br>Map PROV and PROVCAT from linked **MEDICAL_CLAIMS** to PROVIDER_SOURCE_VALUE and SPECIALTY_SOURCE_VALUE in Provider table to extract its associated Provider ID.| 
VISIT_OCCURRENCE_ID|**VISIT_OCCURRENCE**<br/>VISIT_OCCURRENCE_ID|**MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD)<br/>Get associated VISIT_OCCURRENCE_ID| 
DRUG_SOURCE_VALUE|**RX_CLAIMS**<br>NDC<br><br>**MEDICAL_CLAIMS**<br>PROC_CD<br/><br/>**MED_PROCEDURE**<br/>PROC<br><br>**LAB_RESULTS**<br>PROC_CD| | 
DRUG_SOURCE_CONCEPT_ID|**RX_CLAIMS**<br>NDC<br><br>**MEDICAL_CLAIMS**<br>PROC_CD<br/><br/>**MED_PROCEDURE**<br/>PROC<br><br>**LAB_RESULTS**<br>PROC_CD|**RX_CLAIMS**<br>Use [Source to Source](code_snippets.md#source-to-source) and filter with ```WHERE SOURCE_VOCABULARY_ID IN ('NDC') AND TARGET_VOCABULARY_ID IN ('NDC') AND FILL_DT BETWEEN SOURCE_VALID_START_DATE AND SOURCE_VALID_END_DATE```<br><br>**MEDICAL_CLAIMS** (PROC_CD), **MED_PROCEDURE** (PROC)<br>Use [Source to Source](code_snippets.md#source-to-source) and filter with [Source Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-2)<br><br>**LAB_RESULTS** (PROC_CD)<br>Use [Source to Source](code_snippets.md#source-to-source) and filter with [Source Concept Ids from Other Procedure Fields](code_snippets.md#from-other-procedure-fields-2)| 
ROUTE_SOURCE_VALUE| | | 
DOSE_UNIT_SOURCE_VALUE| | | 

