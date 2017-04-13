*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](README.md)

---

# CDM Table: NOTE

The NOTE table captures free text information recorder by a provider
about a patient.

Optum does not have clear note information so this table will only
contain one value representing the fact that no note information will be
captured.

<a name="table-mappings-note"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
NOTE_ID|0| | 
PERSON_ID|0| | 
NOTE_DATE|-|NULL| 
NOTE_TIME|-|NULL| 
NOTE_TYPE_CONCEPT_ID|0| | 
NOTE_TEXT|-|NULL| 
PROVIDER_ID|0| | 
NOTE_SOURCE_VALUE|-|NULL| 
VISIT_OCCURRENCE_ID|0| | 
  