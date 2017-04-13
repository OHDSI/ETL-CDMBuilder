*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD 
CDM Version = 5.0.1, Clinformatics Version = v7.0
Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](readme.md)

---

# MEASUREMENT

The Measurement table contains lab tests, vital signs, etc. that were
conducted during a valid *OBSERVATION_PERIOD*. Lab values are sourced
from the Optum **LAB_RESULTS** and the **TEMP_MEDICAL** tables. Lab
Observations from **LAB_RESULTS** are tracked using standard LOINC
codes which are mapped to standard concept identifiers. Units of measure
are also mapped to standard concept identifiers in the dictionary for
standardization. Lab observations from **TEMP_MEDICAL** are codes in
the DIAG1-DIAG25 and PROC1-PROC3 fields that have been mapped to standard
concepts with DOMAIN_IDs of 'Measurement'.

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

/\*Result as concept code\*/

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

<a name="table-mappings-measurement"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
MEASUREMENT_ID|-|System Generated| 
PERSON_ID|LAB_RESULTS:<br>PATID / PAT_PLANID<br><br>TEMP_MEDICAL:<br>PATID / PAT_PLANID|At the row level we work with PAT_PLANID, but PATID is what is written to the CDM.| 
MEASUREMENT_CONCEPT_ID|LAB_RESULTS: <br>LOINC_CD<br>PROC_CD<br><br>TEMP_MEDICAL:<br>DIAG1-DIAG5; PROC1-PROC3, PROC_CD|LAB_RESULTS:<br>(First, look for LOINC_CD. If no map exists, then look for PROC_CD):<br>Use Section 3.1.2 and filter with Section 4.3<br><br>TEMP_MEDICAL (DIAG1-DIAG5):<br>Use Section 3.1.2 and filter with Section 4.1<br><br>TEMP_MEDICAL (PROC1-PROC3, PROC_CD):<br>Use Section 3.1.2 and filter with Section 4.2<br><br>From LOINC_CD:<br>WHERE SOURCE_VOCABULARY_ID IN ('LOINC')<br>AND TARGET_STANDARD_CONCEPT IS NOT NULL <br>| 
MEASUREMENT_<br>DATE|LAB_RESULTS:<br>FST_DT<br><br>TEMP_MEDICAL:<br>FST_DT| | 
MEASUREMENT_<br>TIME|-|NULL| 
MEASUREMENT_<br>TYPE_CONCEPT_ID|-|From LAB_RESULTS table: This will be 44818702 for all rows (Lab Result)<br><br>If the record is coming from another table, like the CONDITION_OCCURENCE, keep the types that would have been assigned in that table.| 
OPERATOR_<br>CONCEPT_ID|LAB_RESULTS:<br>RSLT_TXT<br>|Use first 2 characters of RSLT_TXT as described above to get the concept ID| 
VALUE_AS_NUMBER|LAB_RESULTS: <br>RSLT_NBR<br><br>TEMP_MEDICAL: <br>UNITS<br>| | 
VALUE_AS_<br>CONCEPT_ID|LAB_RESULTS<br>ABNL_CD<br>RSLT_TXT<br><br>TEMP_MEDICAL:<br>DIAG1-DIAG5; PROC1-PROC3, PROC_CD|LAB_RESULTS<br>Refer to logic above<br><br><br>TEMP_MEDICAL:<br>Use 3.1.3 and point it at the SOURCE_CODE.  But only take the top TARGET_CONCEPT_ID because a few SOURCE_CODES can map to multiple TARGET_CONCEPT_ID.|<br>
UNIT_CONCEPT_ID|LAB_RESULTS:<br>RSLT_UNIT_NM<br><br><br>|Filters:<br>WHERE SOURCE_VOCABULARY_ID IN ('UCUM')<br>AND TARGET_VOCABULARY_ID IN ('UCUM') <br>AND TARGET_INVALID_REASON IS NULL|Use the code in Section 3.1.1.<br><br>This vocabulary is case sensitive.
RANGE_LOW|LAB_RESULTS:<br>LOW_NRML<br>| | 
RANGE_HIGH|LAB_RESULTS:<br>HI_NRML<br>| | 
PROVIDER_ID|TEMP_MEDICAL:<br>PROV| | 
VISIT_OCCURRENCE_ID|Measurement from TEMP_MEDICAL tables use VISIT_OCCURRENCE:<br>VISIT_OCCURRENCE_ID|Refer to logic in building VISIT_OCCURRENCE table for linking with VISIT_OCCURRENCE_ID| 
MEASUREMENT_<br>SOURCE_VALUE|LAB_RESULTS: <br>LOINC_CD<br>PROC_CD<br><br>TEMP_MEDICAL:<br>DIAG1-DIAG5; PROC1-PROC3, PROC_CD|LAB_RESULTS: <br>The LOINC_CD or PROC_CD as it appears in the LAB_RESULTS table and as was selected above (i.e. use the LOINC_CD first if possible).  <br><br>TEMP_MEDICAL: Code as it appears in the table| 
MEASUREMENT_SOURCE_CONCEPT_ID|LAB_RESULTS: <br>LOINC_CD,<br>PROC_CD<br><br><br><br><br>TEMP_MEDICAL: <br>DIAG1-DIAG5; PROC1-PROC3, PROC_CD|LAB_RESULTS use When LOINC was selected section 3.1. with filters:<br>WHERE SOURCE_VOCABULARY_ID IN ('LOINC')<br>AND TARGET_VOCABULARY_ID IN ('LOINC') <br>When PROC_CD was selected, use section 3.1 with filters from 6.3.<br><br><br>TEMP_MEDICAL (DIAG1-DIAG5):<br>Use Section 3.1.1 and filter using Section 6.1<br><br>TEMP_MEDICAL (PROC1-PROC3, PROC_CD):<br>Use Section 3.1.1 and filter using Section 6.2|Use the code in Section 3.1.1.<br>
UNIT_SOURCE_<br>VALUE|LAB_RESULTS:<br>RSLT_UNIT_NM<br><br>TEMP_MEDICAL:<br>NULL| | 
VALUE_SOURCE_<br>VALUE|LAB_RESULTS:<br>RSLT_TXT<br><br>TEMP_MEDICAL:<br>DIAG1-DIAG5; PROC1-PROC3, PROC_CD| | 
