*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.2, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: MEASUREMENT

The Measurement table contains lab tests, vital signs, etc. that were
conducted during a valid *OBSERVATION_PERIOD*. Lab values are sourced
from the Optum **LAB_RESULTS** and the **MEDICAL_CLAIMS**, **MED_PROCEDURE**, and **MED_DIAGNOSIS** tables. Lab
Observations from **LAB_RESULTS** are tracked using standard LOINC
codes which are mapped to standard concept identifiers. Units of measure
are also mapped to standard concept identifiers in the dictionary for
standardization. 


-   Units are mapped to UNIT_CONCEPT_IDs in the OMOP VOCABULARY
    (VOCABULARY_ID = 'UCUM' - Unified Code for Units of
    Measure (UCUM)). Please note that mapping a UNIT_SOURCE_VALUE to a
    UNIT_CONCEPT_ID is both **case sensitive** and **accent
    sensitive**.

-   If both the LOINC_CD and TST_DESC fields are blank from
    **LAB_RESULTS**, this row is not considered useful and should not
    be used.

-   LOINCs

    1.  Valid LOINC codes have the following layouts \#-\#, \#\#-\#,
        \#\#\#-\#, \#\#\#\#-\#, and \#\#\#\#\#-\# .

    2.  When mapping to valid LOINCs in the OMOP Vocabulary
        (VOCABULARY_ID = 'LOINC') there are a few invalid LOINC codes.
        Implementing a check for the second to last character is a '-'
        ensures you pull a valid LOINC from the VOCABULARY.

-   Lab results in Optum **LAB_RESULTS** is stored in three fields:
    ABNL_CD, RSLT_TXT and RSLT_NBR. Numeric results can be in both
    RSLT_TXT and RSLT_NBR, and RSLT_NBR usually has the following
    values if the result is string: **0 or -999999.999999**.

-   ABNL_CD is the abnormal indicator set by the lab vendors: **'A'**
    or **'AB'** means “abnormal”, **'N'** means “normal”, **'H'** means
    “Above the normal range”, **'L'** means “Below the normal range”.
    Use the following logic to assign value to VALUE_AS_NUMBER,
    VALUE_AS_CONCEPT_ID and OBSERVATION_TYPE_CONCEPT_ID:

```
VALUE_SOURCE_VALUE = RSLT_TXT;

/*Result as concept code*/

IF LOWER(RSLT_TXT) ='low' OR ABNL_CD ='L' THEN VALUE_AS_CONCEPT_ID
= 4267416;

ELSE IF LOWER(RSLT_TXT) ='high' OR ABNL_CD ='H' THEN
VALUE_AS_CONCEPT_ID =4328749;

ELSE IF LOWER(RSLT_TXT) ='normal' OR ABNL_CD ='N' THEN
VALUE_AS_CONCEPT_ID =4069590;

ELSE IF LOWER(RSLT_TXT) ='abnormal' OR ABNL_CD IN ('A','AB')

THEN VALUE_AS_CONCEPT_ID =4135493;

ELSE IF LOWER(RSLT_TXT) ='absent' THEN VALUE_AS_CONCEPT_ID
=4132135;

ELSE IF LOWER(RSLT_TXT) ='present' THEN VALUE_AS_CONCEPT_ID
=4181412;

ELSE IF LOWER(RSLT_TXT) ='positive' THEN VALUE_AS_CONCEPT_ID
=9191;

ELSE IF LOWER(RSLT_TXT) ='negative' THEN VALUE_AS_CONCEPT_ID
=9189;

ELSE IF LOWER(RSLT_TXT) in ('final','final report') THEN
VALUE_AS_CONCEPT_ID =9188;

ELSE IF LOWER(RSLT_TXT) ='not found' THEN VALUE_AS_CONCEPT_ID
=9190;

ELSE IF LOWER(RSLT_TXT) ='trace' THEN VALUE_AS_CONCEPT_ID =
9192;

IF RSLT_NBR NOT IN (0, -999999.999999) THEN DO; /*Result as
number*/

VALUE_AS_NUMBER = RSLT_NBR;

MEASUREMENT_TYPE_CONCEPT_ID = 38000277;

END;

ELSE IF MEASUREMENT_CONCEPT_ID is not null THEN

MEASUREMENT_TYPE_CONCEPT_ID = **38000279**; /*Result as Concept*/

ELSE MEASUREMENT_TYPE_CONCEPT_ID = **38000278**; /*Result as Text*/

```

-   The RSLT_TXT field tends to have operators (&lt;, &gt;, =,
    &le;, &gt;=) included in the first 2 characters of the string. Use
    the following logic:
    
```
    case substring(rslt_txt, 0, 2)

    when '<' then operator_concept_id = 4172704

    when '>' then operator_concept_id = 4171756

    when '=' then operator_concept_id = 4172703

    when '>=' then operator_concept_id = 4171755

    when '<=' then operator_concept_id = 4171754

    end
```

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
MEASUREMENT_ID|-|System Generated| 
PERSON_ID|**LAB_RESULTS**:<br>PATID / PAT_PLANID<br><br>**MEDICAL_CLAIMS**:<br>PATID / PAT_PLANID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
MEASUREMENT_CONCEPT_ID|**LAB_RESULTS**<br>LOINC_CD<br>PROC_CD<br><br>**MED_DIAGNOSIS**<br>DIAG<br/><br/>**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**HRA**<br/>H_BMI, H_BSA, H_CHRONIC_PAIN, H_HEIGHT, H_SMOKING_STATUS, H_WEIGHT, HRA_COMPLTD_DT, ISA10008, ISA1006, ISA13021, ISA13022, ISA13023, ISA13040, ISA16010, ISA16016, ISA16040, ISA17001, ISA17015, ISA17021, ISA17023, ISA18015, ISA19004, ISA19005, ISA20061, ISA20064, ISA20069, ISA20072, ISA21001, ISA21003, ISA21009, ISA21015, ISA21020, ISA21021, ISA21025, ISA3010, ISA5001, ISA5004, ISA5010, ISA5018, ISA7018, ISA8016, ISA9009, ISA9063|**LAB_RESULTS**<br>(First, look for LOINC_CD. If no map exists, then look for PROC_CD)<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Other Procedure Fields](code_snippets.md#from-other-procedure-fields)<br><br>**MED_DIAGNOSIS** (DIAG):<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields)<br><br>**MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD)<br/>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields)<br><br>**LAB_RESULTS** (LOINC_CD)<br>Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with [Concept Ids from Lab Results LOINC_CD](code_snippets.md#from-lab-results-loinc_cd)<br><br>**HRA**<br>Use [HRA Mappings](hra_mappings.md)| 
MEASUREMENT_DATE|**LAB_RESULTS**:<br>FST_DT<br><br>**MEDICAL_CLAIMS**:<br>FST_DT<br/><br/>**HRA**<br/>HRA_COMPLTD_DT| | 
MEASUREMENT_DATETIME|Set time to 00:00:00<br/><br/>**LAB_RESULTS**<br/>FST_DT<br/><br/>**MEDICAL_CLAIMS**<br>FST_DT<br/><br/>**HRA**<br/>HRA_COMPLTD_DT| | 
MEASUREMENT_TYPE_CONCEPT_ID| **MED_DIAGNOSIS**<br/>DIAG_POSITION<br/><br/>**MED_PROCEDURE**<br/>PROC_POSITION|**LAB_RESULTS**<br/> Use concept [44818702 (Lab Result)](http://www.ohdsi.org/web/atlas/#/concept/44818702)  for all rows (Lab Result)<br><br>**DIAG**<br/>Use [Concept Type Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields-1)<br/><br/>**PROC**, **PROC_CD**<br/>Use [Concept Type Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-1)|<br/><br/>**HRA**<br/>Use concept [44786634 (categorical HRA values (internally generated CONCEPT_ID))](http://www.ohdsi.org/web/atlas/#/concept/44786633) 
OPERATOR_CONCEPT_ID|**LAB_RESULTS**:<br>RSLT_TXT<br>|Use first 2 characters of RSLT_TXT as described above to get the concept ID| 
VALUE_AS_NUMBER|**LAB_RESULTS**<br>RSLT_NBR<br/><br/>**HRA**<br>Use [HRA Mappings](hra_mappings.md)|```if rslt_nbr != 0 then rslt_nbr```<br/>```else NULL```<br/><br/> | Measurements from **MEDICAL_CLAIMS** do not have reliable units to map
VALUE_AS_CONCEPT_ID|**LAB_RESULTS**<br>ABNL_CD<br>RSLT_TXT<br><br>**MEDICAL_CLAIMS**:<br/>PROC_CD<br/><br/>**MED_DIAGNOSIS**<br/>DIAG<br/><br/>**MED_PROCEDURE**<br/>PROC|**LAB_RESULTS**<br>Refer to logic above<br><br><br>**MEDICAL_CLAIMS**:<br>Use [Source to Maps to Value](code_snippets.md#source-to-maps-to-value) and point it at the SOURCE_CODE.  But only take the top TARGET_CONCEPT_ID because a few SOURCE_CODES can map to multiple TARGET_CONCEPT_ID.|<br>
UNIT_CONCEPT_ID|**LAB_RESULTS**<br>RSLT_UNIT_NM<br><br><br>|Use [Source to Standard Terminology](code_snippets.md#source-to-standard-terminology) and filter with<br>```WHERE SOURCE_VOCABULARY_ID IN ('UCUM') AND TARGET_VOCABULARY_ID IN ('UCUM') AND TARGET_INVALID_REASON IS NULL```|
RANGE_LOW|**LAB_RESULTS**:<br>LOW_NRML<br>| | 
RANGE_HIGH|**LAB_RESULTS**:<br>HI_NRML<br>| | 
PROVIDER_ID|**MEDICAL_CLAIMS**:<br>PROV| | 
VISIT_OCCURRENCE_ID|**VISIT_OCCURRENCE**<br>VISIT_OCCURRENCE_ID|Refer to logic in building **VISIT_OCCURRENCE** table for linking with VISIT_OCCURRENCE_ID| 
MEASUREMENT_SOURCE_VALUE|**LAB_RESULTS**<br>LOINC_CD<br>PROC_CD<br><br>**MED_DIAGNOSIS**<br>DIAG<br/><br/>**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD<br/><br/>**HRA**<br>Use [HRA Mappings](hra_mappings.md)|**LAB_RESULTS**<br>The LOINC_CD or PROC_CD as it appears in the **LAB_RESULTS** table and as was selected above (i.e. use the LOINC_CD first if possible).| 
MEASUREMENT_SOURCE_CONCEPT_ID|**LAB_RESULTS**<br>LOINC_CD,<br>PROC_CD<br><br>**MED_DIAGNOSIS**<br>DIAG<br/><br/>**MED_PROCEDURE**<br/>PROC<br/><br/>**MEDICAL_CLAIMS**<br/>PROC_CD|**LAB_RESULTS** (LOINC_CD)<br/>Use [Source to Source](code_snippets.md#source-to-source) and filter with [Source Concept Ids from Lab Results LOINC_CD](code_snippets.md#from-lab-results-loinc_cd-1)<br/><br/>**LAB_RESULTS** (PROC_CD)<br/>Use [Source to Source](code_snippets.md#source-to-source) and filter using [Source Concept Ids from Other Procedure Fields](code_snippets.md#from-other-procedure-fields-2).<br><br><br>**MED_DIAGNOSIS** (DIAG):<br>Use [Source to Source](code_snippets.md#source-to-source) and filter using [Source Concept Ids from Medical Claims Diagnosis Fields](code_snippets.md#from-medical-claims-diagnosis-fields-2)<br><br>**MED_PROCEDURE** (PROC), **MEDICAL_CLAIMS** (PROC_CD)<br>Use [Source to Source Snippet](code_snippets.md#source-to-source) and filter using [Source Concept Ids from Medical Claims Procedure Fields](code_snippets.md#from-medical-claims-procedure-fields-2)|
UNIT_SOURCE_VALUE|**LAB_RESULTS**:<br>RSLT_UNIT_NM<br><br>**MEDICAL_CLAIMS**:<br>NULL| | 
VALUE_SOURCE_VALUE|**LAB_RESULTS**:<br>RSLT_TXT<br><br>**MEDICAL_CLAIMS**<br>PROC_CD<br/><br/>**MED_DIAGNOSIS**<br/>DIAG<br/><br/>**MED_PROCEDURE**<br/>PROC<br/><br/>**HRA**<br>Use [HRA Mappings](hra_mappings.md)|**LAB_RESULTS** (RSLT_TXT)<br/>```if rslt_nbr == 0 then rslt_txt```<br/>```else rslt_nbr```<br/><br/> | 
