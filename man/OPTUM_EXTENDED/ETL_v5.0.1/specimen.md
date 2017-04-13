*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](README.md)

---

# SPECIMEN

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
SPECIMEN_DATE|-|NULL| 
SPECIMEN_TIME|-|NULL| 
QUANTITY|-|NULL| 
UNIT_CONCEPT_ID|0| | 
ANATOMIC_SITE_CONCEPT_ID|0| | 
DISEASE_STATUS_CONCEPT_ID|0| | 
SPECIMEN_SOURCE_ID|0| | 
SPECIMEN_SOURCE_VALUE|-|NULL| 
UNIT_SOURCE_VALUE|-|NULL| 
ANATOMIC_SITE_SOURCE_VALUE|-|NULL| 
DISEASE_STATUS_SOURCE_VALUE|-|NULL| 
