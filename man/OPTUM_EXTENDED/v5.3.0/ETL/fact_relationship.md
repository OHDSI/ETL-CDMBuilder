*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD*
<br>*CDM Version = 5.3.1, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: FACT_RELATIONSHIP

The *FACT_RELATIONSHIP* table captures the relationships between facts
in any table of the CDM. These can be person relationships, care site
relationships, indication relationships, usage relationships, or facts
derived from one another

Optum does not have clear relationship information so this table will
only contain one value representing the fact that no relationship
information will be captured.

<a name="table-mappings-fact-relationship"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
DOMAIN_CONCEPT_ID_1|0| |
FACT_ID_1|0| |
DOMAIN_CONCEPT_ID_2|0| |
FACT_ID_2|0| |
RELATIONSHIP_CONCEPT_ID|0| |
