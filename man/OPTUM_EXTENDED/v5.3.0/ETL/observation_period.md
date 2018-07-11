*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD*
<br>*CDM Version = 5.3.1, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: OBSERVATION_PERIOD

The **MEMBER_DETAIL** table includes records that indicate a person's
continuous enrollment with both medical and pharmacy coverage.

Enrollment entries are consolidated by combining records that indicate
continuous enrollment over a period. Consolidation is done through the
following steps:

-   Exclude members not included in *PERSON* table.
-   **MEMBER_DETAIL** records for each person are sorted in ascending
    order by ELIGEFF and ELIGEND.
-   Periods of continuous enrollment are consolidated by combining
    records as long as the time between the end of one enrollment period
    and the start of the next is 32 days or less (&le;32).

**Key conventions:**

-   The gap between observation periods needs to be 32 days or
    less (&le;32).
-   Revise ELIGEFF to match the start date of Extended
    data (05/01/2000). Note: Depending on your organiation's cut of data
    will determine what start bounds you need to enforce:

`CASE WHEN eligeff < '05/01/2000' THEN '05/01/2000' ELSE eligeff END AS OBSERVATION_PERIOD_START_DATE`

<a name="table-mappings-observation-period"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
OBSERVATION_PERIOD_ID| |System generated.|
PERSON_ID|**MEMBER_DETAIL** PATID| |
OBSERVATION_PERIOD_START_DATE|**MEMBER_DETAIL**<br/>ELIGEFF|Revise ELIGEFF using the code above to match the start date. <br/><br/>Use min(ELIGEFF)|
OBSERVATION_PERIOD_START_DATETIME|**MEMBER_DETAIL**<br/>ELIGEFF|Set time to 00:00:00<br/><br/>Revise ELIGEFF using the code above to match the start date. <br/><br/>Use min(ELIGEFF)|
OBSERVATION_PERIOD_END_DATE|**MEMBER_DETAIL**<br/>ELIGEND|Use max(ELIGEND)|
OBSERVATION_PERIOD_END_DATETIME|Set time to 00:00:00<br/><br/>**MEMBER_DETAIL**<br/>ELIGEND|Use max(ELIGEND)|
PERIOD_TYPE_CONCEPT_ID|Use concept [44814722 (Period while enrolled in insurance)](http://www.ohdsi.org/web/atlas/#/concept/44814722)| |
