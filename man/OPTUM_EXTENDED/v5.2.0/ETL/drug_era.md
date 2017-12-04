*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.2, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: DRUG_ERA

A Drug Era is defined as a span of time when the Person is assumed to be
exposed to a particular drug. Successive periods of Drug Exposures are
combined under certain rules to produce continuous Drug Eras. The
*DRUG_ERA* table is populated by pulling from the *DRUG_EXPOSURE*
table within the CDM. Drug eras are consolidated to their respective
ingredient off the *DRUG_EXPOSURE* table. A drug era is therefore
understood as exposure to a certain compound over a certain period of
time. There will only be one type of persistence window (duration that
is allowed to elapse between drug exposures) applied to this CDM, which
is 30 days.

**Key conventions:**

-   Use the following steps to build this table off *DRUG_EXPOSURE*
    table:

1.  Exclude records with DRUG_CONCEPT_ID = 0. 
2.  Use the following logic to map DRUG_CONCEPT_ID to ingredient levels:

```
select distinct A.concept_id as Drug_EXPOSURE_concept_id,
C.concept_id as ingredient_concept_id
FROM CONCEPT C
JOIN CONCEPT_ANCESTOR CA
ON CA.ancestor_concept_id = C.concept_id
and c.vocabulary_id = 'RxNorm'
and c.concept_class_id = 'Ingredient'
and invalid_reason is null
JOIN concept A
ON CA.descendant_CONCEPT_ID = A.CONCEPT_ID
```
3.  Replace the values of DRUG_CONCEPT_ID with their ingredient CONCEPT_IDs identified by step 2), and exclude records with DRUG_CONCEPT_IDs that can't be mapped to ingredient level.
4.  Calculate DRUG_EXPOSURE_END_DATE: If DRUG_TYPE_CONCEPT_ID in (38000175, 38000176), set to DRUG_EXPOSURE_START_DATE+DAYS_SUPPLY; Else set to DRUG_EXPOSURE_START_DATE.
5.  Sort *DRUG_EXPOSURE* table by PERSON_ID, DRUG_CONCEPT_ID, DRUG_EXPOSURE_START_DATE and DRUG_EXPOSURE_END_DATE in ascending order.
6.  Combine records as long as both PERSON_ID and DRUG_CONCEPT_ID don't change and the time between DRUG_EXPOSURE_END_DATE of one record and DRUG_EXPOSURE_START_DATE of the next is 30 days or less (&le;30).

-   Compound drugs can create multiple ERAs since they can be mapped to
    multiple ingredients.

<a name="table-mappings-drug-era"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
DRUG_ERA_ID|-|System generated.| 
PERSON_ID|**DRUG_EXPOSURE**<br>PERSON_ID| | 
DRUG_CONCEPT_ID|**DRUG_EXPOSURE**<br/>DRUG_CONCEPT_ID|Use the logic above to map to ingredient CONCEPT_ID and exclude records. | 
DRUG_ERA_START_DATE|**DRUG_EXPOSURE**<br/>DRUG_EXPOSURE_START_DATE|Use min(DRUG_EXPOSURE_START_DATE)| 
DRUG_ERA_END_DATE|**DRUG_EXPOSURE**<br>DRUG_EXPOSURE_END_DATE<br>|Use max(DRUG_EXPOSURE_END_DATE)| 
DRUG_EXPOSURE_COUNT| |Sum up the number of DRUG_EXPOSURE records for this PERSON_ID and this CONCEPT_ID during the exposure window being built.| 
GAP_DAYS| |Sum of the days in the drug_era that were not covered by a drug_exposure_record| 