*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD 
CDM Version = 5.0.1, Clinformatics Version = v7.0
Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](readme.md)

---

# PAYER_PLAN_PERIOD

For each person, create records that indicate that person's continuous
enrollment for a specific product (defined by BUS and PRODUCT) according
to the **MEMBER_DETAIL** table.

Enrollment entries are consolidated by combining records that indicate
continuous enrollment over a period for a specific payer plan.
Consolidation is done through the following steps:

-   Exclude members not included in *PERSON* table.
-   Use the combination of BUS, ASO, PRODUCT, and CDHP to define
    PAYER_SOURCE_VALUE (see table below).
-   **MEMBER_DETAIL** records for each person are sorted in ascending
    order by ELIGEFF, ELIGEND and PAYER_SOURCE_VALUE.
-   Periods of continuous enrollment are consolidated by combining
    records as long as PAYER_SOURCE_VALUE and PLAN_SOURCE_VALUE do
    not change and the time between the end of one enrollment period and
    the start of the next is 32 days or less (&le;32).

**Key conventions:**

-   The gap between plan periods needs to be 32 days or less (&le;32).
-   Revise ELIGEFF to match the start date of Optum data (05/01/2000).
    Note: Depending on your organization's cut of data will determine
    what start bounds you need to enforce.

`CASE WHEN eligeff < '05/01/2000' THEN '05/01/2000' ELSE eligeff END AS PAYER_PLAN_PERIOD_START_DATE`

<a name="table-mappings-payer-plan-period"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
PAYER_PLAN_PERIOD_ID|-|System generated.| 
PERSON_ID|**MEMBER_DETAIL** PATID| | 
PAYER_PLAN_PERIOD_START_DATE|**MEMBER_DETAIL** ELIGEFF|Minimum start date of a continuous enrollment in a plan.|Revise ELIGEFF using the code above to match the start date of Optum data.
PAYER_PLAN_PERIOD_END_DATE|**MEMBER_DETAIL** ELIGEND|Maximum end date of a continuous enrollment in a plan.| 
PAYER_SOURCE_VALUE|**MEMBER_DETAIL** BUS, ASO, PRODUCT, CDHP|[See Payer Source Logic](#payer-source-logic)|
PLAN_SOURCE_VALUE|**MEDICAL_CLAIMS** PAT_PLANID||
FAMILY_SOURCE_VALUE|-|NULL|
