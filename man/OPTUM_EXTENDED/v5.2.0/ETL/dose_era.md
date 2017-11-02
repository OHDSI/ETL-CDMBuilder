*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.2, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: DOSE_ERA

The *DOSE_ERA* table captures the span of time when the person is
assumed to be exposed to a constant dose of a specific active
ingredient.

Optum does not have clear dose information so this table will only
contain one value representing the fact that no dose information will be
captured.

<a name="table-mappings-dose-era"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
DOSE_ERA_ID|0| | 
PERSON_ID|0| | 
DRUG_CONCEPT_ID|0| | 
UNIT_CONCEPT_ID|0| | 
DOSE_VALUE|-|NULL| 
DOSE_ERA_START_DATE|-|NULL| 
DOSE_ERA_END_DATE|-|NULL| 
  