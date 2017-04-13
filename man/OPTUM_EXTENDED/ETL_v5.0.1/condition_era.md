*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](README.md)

---

# CONDITION_ERA

*CONDITION_ERA*s are chronological periods of condition occurrence.
There will only be one type of persistence window (duration that is
allowed to elapse between condition occurrences) applied to this CDM,
which is 30 days.

**Key conventions:**

-   The *CONDITION_ERA*s are not aggregated to a higher-level class,
    therefore the CONDITION_CONCEPT_ID is unchanged.

-   Use the following steps to build this table off
    *CONDITION_OCCURRENCE* table:

1.  Exclude records with CONDITION_CONCEPT_ID = 0.

2.  Set CONDITION_END_DATE = CONDITION_START_DATE.

3.  Sort *CONDITION_OCCURRENCE* table by PERSON_ID,
    CONDITION_CONCEPT_ID and CONDITION_START_DATE in
    ascending order.

4.  Combine records as long as both PERSON_ID and
    CONDITION_CONCEPT_ID don't change and the time between
    CONDITION_END_DATE of one record and CONDITION_START_DATE of the
    next is 30 days or less (&le;30).

<a name="table-mappings-condition-era"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
CONDITION_ERA_ID|-|System generated.| 
PERSON_ID|**CONDITION_OCCURRENCE** PERSON_ID| | 
CONDITION_CONCEPT_ID|**CONDITION_OCCURRENCE** CONDITION_CONCEPT_ID|Do not build CONDITION_ERAS where the CONDITION_OCCURRENCE.CONDITION_CONCEPT_ID is 0.| 
CONDITION_ERA_START_DATE|**CONDITION_OCCURRENCE** min(CONDITION_START_DATE)|The start date for the condition era constructed from the individual instances of condition occurrences. It is the start date of the very first chronologically recorded instance of the condition.| 
CONDITION_ERA_END_DATE|-|The end date for the condition era constructed from the individual instances of condition occurrences. It is the end date of the final continuously recorded instance of the condition. | 
CONDITION_OCCURRENCE_COUNT|-|Sum up the number of CONDITION_OCCURRENCEs for this PERSON_ID and this CONCEPT_ID during the exposure window being built.| 
