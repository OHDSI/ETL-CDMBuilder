*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD*
<br>*CDM Version = 5.3.1, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: SPECIMEN

The SPECIMEN table contains information identifying biological samples
from a person.

Optum does not have clear specimen information so this table will only
contain one value representing the fact that no specimen information
will be captured.

<a name="table-mappings-specimen"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
SPECIMEN_ID|0| |
PERSON_ID|0| |
SPECIMEN_CONCEPT_ID|0| |
SPECIMEN_TYPE_CONCEPT_ID|0| |
SPECIMEN_DATE| | |
SPECIMEN_TIME| | |
QUANTITY| | |
UNIT_CONCEPT_ID|0| |
ANATOMIC_SITE_CONCEPT_ID|0| |
DISEASE_STATUS_CONCEPT_ID|0| |
SPECIMEN_SOURCE_ID|0| |
SPECIMEN_SOURCE_VALUE| | |
UNIT_SOURCE_VALUE| | |
ANATOMIC_SITE_SOURCE_VALUE| | |
DISEASE_STATUS_SOURCE_VALUE| | |
