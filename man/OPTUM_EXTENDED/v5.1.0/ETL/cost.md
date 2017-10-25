*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](README.md)

---

# CDM Table: COST

The COST table captures cost information associated with any medical entity recorded in the [DRUG], [PROCEDURE], [VISIT], and [DEVICE] domains.

**Key conventions:**

- Use [*DRUG_EXPOSURE*](drug_exposure.md), [*PROCEDURE_OCCURRENCE*](procedure_occurrence.md), [*VISIT_OCCURRENCE*](visit_occurrence.md), and [*DEVICE_EXPOSURE*](device_exposure.md) to reference the COST_EVENT_ID
- Use *PAYER_PLAN_PERIOD* to obtain the PAYER_PLAN_PERIOD_ID.
- Use **RX_CLAIMS** and **TEMP_MEDICAL** to obtain the actual costs.

- Since the amount of observation time in *OBSERVATION_PERIOD* may be greater than that in *PAYER_PLAN_PERIOD* table, use left join to avoid excluding records when pulling PAYER_PLAN_PERIOD_ID. For those records fall out of PAYER_PLAN_PERIOD_START_DATE AND PAYER_PLAN_PERIOD_END_DATE, set PAYER_PLAN_PERIOD_ID as NULL.


**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
COST_ID|-|-|A unique identifier for each COST record.
COST_EVENT_ID|*DRUG_EXPOSURE*<br>drug_exposure_id<br><br>*PROCEDURE_OCCURRENCE*<br>procedure_occurrence_id<br><br>*VISIT_OCCURRENCE*<br>visit_occurrence_id| |A foreign key identifier to the event (e.g. Measurement, Procedure, Visit, Drug Exposure, etc) record for which cost data are recorded.
COST_DOMAIN_ID|cost_event_id|WHEN cost_event_id = drug_exposure.drug_exposure_id THEN cost_domain_id = ‘Drug’<br>WHEN cost_event_id = procedure_occurrence.procedure_occurrence_id THEN cost_domain_id = ‘Procedure’<br>WHEN cost_event_id = visit_occurrence.visit_occurrence_id THEN cost_domain_id = ‘Visit’<br>| 
COST_TYPE_CONCEPT_ID|0| |Awaiting clarity on what codes to use here.
CURRENCY_CONCEPT_ID|-|[44818668](http://www.ohdsi.org/web/atlas/#/concept/44818668)|American dollar
TOTAL_CHARGE|[DRUG]<br>**RX_CLAIMS**<br>sum(charge)<br><br>[PROCEDURE]<br>**TEMP_MEDICAL**<br>charge<br><br>[VISIT]<br>**TEMP_MEDICAL**<br>charge| | 
TOTAL_COST|-| | 
TOTAL_PAID|-| | 
PAID_BY_PAYER|-|-| 
PAID_BY_PATIENT|[DRUG]<br>-<br><br>[PROCEDURE]<br>**TEMP_MEDICAL**<br>COINS+DEDUCT<br><br>[VISIT]<br>**TEMP_MEDICAL**<br>COINS+DEDUCT| | 
PAID_PATIENT_COPAY|[DRUG]<br>**RX_CLAIMS**<br>sum(COPAY)<br><br>[PROCEDURE]<br>**TEMP_MEDICAL**<br>COPAY<br><br>[VISIT]<br>**TEMP_MEDICAL**<br>COPAY| | 
PAID_PATIENT_COINSURANCE|[DRUG]<br>-<br><br>[PROCEDURE]<br>**TEMP_MEDICAL**<br>COINS<br><br>[VISIT]<br>**TEMP_MEDICAL**<br>COINS| | 
PAID_PATIENT_DEDUCTIBLE|[DRUG]<br>**RX_CLAIMS**<br>sum(DEDUCT)<br><br>[PROCEDURE]<br>**TEMP_MEDICAL**<br>DEDUCT<br><br>[VISIT]<br>**TEMP_MEDICAL**<br>DEDUCT| | 
PAID_BY_PRIMARY|-| | 
PAID_INGREDIENT_COST|-| | 
PAID_DISPENSING_COST|-| | 
PAID_DISPENSING_FEE|[DRUG]<br>**RX_CLAIMS**<br>sum(DISPFEE)| | 
PAYER_PLAN_PERIOD_ID|*PAYER_PLAN_PERIOD*<br>PAYER_PLAN_PERIOD_ID|[DRUG]<br>Look up associated PAYER_PLAN_PERIOD_ID by PERSON_ID and DRUG_EXPOSURE_START_DATE AND PAT_PLANID.  If there no match, put NULL.<br><br>[PROCEDURE]<br>Lookup associated PAYER_PLAN_PERIOD_ID.  Look up by PERSON_ID and PROCEDURE_DATE.  If there no match, put NULL.<br><br>[VISIT]<br>Lookup associated PAYER_PLAN_PERIOD_ID.  Look up by PERSON_ID and VISIT_START_DATE.  If there no match, put NULL.| 
AMOUNT_ALLOWED|[DRUG]<br>**RX_CLAIMS**<br>sum(STD_COST)<br><br>[PROCEDURE]<br>**TEMP_MEDICAL**<br>STD_COST<br><br>[VISIT]<br>**TEMP_MEDICAL**<br>STD_COST| | 
REVENUE_CODE_CONCEPT_ID|**TEMP_MEDICAL**<br>RVNU_CD|Use Vocabulary map  [Source to Source](code_snippets.md#source-to-source).<br>Filters: <br>```WHERE SOURCE_VOCABULARY_ID IN ('Revenue Code')<br>AND TARGET_VOCABULARY_ID IN ('Revenue Code')```| 
REVENUE_CODE_SOURCE_VALUE|**TEMP_MEDICAL**<br>RVNU_CD|```if RVNU_CD == '0000' then NULL``` | 

