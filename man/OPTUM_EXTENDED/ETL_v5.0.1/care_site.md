*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.0.1, Clinformatics Version = v7.0*
<br>*Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](README.md)

---

# CARE_SITE

The *CARE_SITE* table contains a list of uniquely identified points of
care, or an individual clinical location within an organization. Each
*CARE_SITE* belongs to one *ORGANIZATION*.

Optum does not have clear care site information so this table will only
contain one row representing the fact that no care site information will
be captured.

<a name="table-mappings-care-site"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
CARE_SITE_ID|0| | 
LOCATION_ID|0| | 
ORGANIZATION_ID|0| | 
PLACE_OF_SERVICE_CONCEPT_ID|0| | 
CARE_SITE_SOURCE_VALUE|-|NULL| 
PLACE_OF_SERVICE_SOURCE_VALUE|-|NULL| 
