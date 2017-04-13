*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD 
CDM Version = 5.0.1, Clinformatics Version = v7.0
Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](readme.md)

---
# PERSON
PERSON demographics are sourced from the **MEMBER_DETAIL** table. All
enrollment records in **MEMBER_DETAIL** table have both medical and
pharmacy coverage, but one person may have multiple records if there are
gaps between enrollments. However, one record per person will be stored
in the **PERSON** table.

**Key conventions:**

-   Delete the following members: Gender changed over different
    enrollment period or max(YRDOB) &gt; min(YRDOB) +2
-   **MEMBER_DETAIL** records for each person are sorted in ascending
    order by ELIGEFF and ELIGEND, and then use person demographics in
    the last record.
-   After defining the patient's YEAR_OF_BIRTH, delete individuals
    whose
    -   YEAR_OF_BIRTH &lt;1900 or > CURRENT_YEAR
    -   AND whose YEAR_OF_BIRTH > Min(Year(ELIGEFF)) +1
-   For MONTH_OF_BIRTH, the *OBSERVATION_PERIOD* table will need to
    be generated first. Then, the value can be derived from using
    YEAR_OF_BIRTH and OBSERVATION_PERIOD_START_DATE

-   For Race, utilize the D_RACE_CODE as shown below

<a name="table-mappings-person"></a>

|**Destination Field**|**Source Field**|**Applied Rule**|**Comment**|
|:-----:|:-----:|:-----:|:-----:|
|PERSON_ID|**MEMBER_DETAIL** PATID| | |
|GENDER_CONCEPT_ID|GENDER_SOURCE_VALUE|Map source values to their associated CONCEPT_IDs: 'M' = 8507; 'F' = 8532 |These CONCEPT_IDs fall under VOCABULARY_ID = 'Gender' in CONCEPT table. If a person has a GENDER_SOURCE_VALUE other than M or F they should be deleted.| 
|YEAR_OF_BIRTH|**MEMBER_DETAIL**: YRDOB| | 
|MONTH_OF_BIRTH|**PERSON**: YEAR_OF_BIRTH<br>**(Depends on OBSERVATION_PERIOD generation)** OBSERVATION_PERIOD_START_DATE| `if PERSON.YEAR_OF_BIRTH = YEAR(OBSERVATION_PERIOD_START_DATE), then PERSON.MONTH_OF_BIRTH = MONTH( MIN (OBSERVATION_PERIOD_START_DATE))`|This is a derived column.  Make sure to have Observation Periods generated before coming to this.|
|DAY_OF_BIRTH|-|NULL|| 
|RACE_CONCEPT_ID|**SES:** D_RACE_CODE|If no SES record, then map to 0.<br>Otherwise, map source values to their associated CONCEPT_IDs:<br>W = 8527<br>A = 8515<br>U = 0<br>H = 0<br>B = 8516|This data does not exist for DOD so this should be set to 0 for persons in the DOD database.|
|ETHNICITY_CONCEPT_ID|**SES**: D_RACE_CODE |If no SES_SES record, then map to 0. Otherwise, map source values to their associated CONCEPT_IDs:<br>W = 0<br>A = 0<br>U = 0<br>H = 38003563<br>B = 0|This data does not exist for DOD so this should be set to 0 for persons in the DOD database.| 
|LOCATION_ID|**SES: MEMBER_DETAIL** DIVISION<br>**DOD: MEMBER_DETAIL** STATE|**SES**: map DIVISION to LOCATION_SOURCE_VALUE in Location table, then extract its associated LOCATION_ID<br><br>**DOD**: map STATE to LOCATION_SOURCE_VALUE in Location table, then extract its associated LOCATION_ID||
|PROVIDER_ID|-|NULL||
|CARE_SITE_ID|-|NULL||
|PERSON_SOURCE_VALUE|**MEMBER_DETAIL** PATID|||
|GENDER_SOURCE_CONCEPT_ID||0||
|GENDER_SOURCE_VALUE|**MEMBER_DETAIL** GDR_CD|||
|RACE_SOURCE_CONCEPT_ID||0|| 
|RACE_SOURCE_VALUE|**SES**: D_RACE_CODE |`If D_RACE_CODE in ('W','A','U','B')`|This data does not exist for DOD so this should be set to NULL for persons in the DOD database.|
|ETHNICITY_SOURCE_CONCEPT_ID||0|||
|ETHNICITY_SOURCE_VALUE|**SES**: D_RACE_CODE|`If D_RACE_CODE = 'H'`|This data does not exist for DOD so this should be set to NULL for persons in the DOD database.|
