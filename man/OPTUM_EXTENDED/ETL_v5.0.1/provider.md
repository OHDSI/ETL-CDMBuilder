*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD 
CDM Version = 5.0.1, Clinformatics Version = v7.0
Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](readme.md)

---

# PROVIDER

The PROVIDER table contains a list of uniquely identified health care
providers (physicians). Optum does have some provider information in
**RX_CLAIMS** and **MEDICAL_CLAIMS** tables. However, some of the
providers listed by Optum may also be considered care sites or
organizations. Since there is no clear way to decipher between all items
identified as providers by Optum, all of them will be added to this
table, regardless if they are truly organizations or care sites.

**Key conventions:**

-   DEA and NPI are encrypted in **RX_CLAIMS** table.
-   PROV is the provider ID in **MEDICAL_CLAIMS** table but cannot be
    linked to DEA or NPI, so we will keep it as
    PROVIDER_SOURCE_VALUE too.
-   Provider Specialty (PROVCAT) is available in **MEDICAL_CLAIMS** table.
    -   We added mapping of Optum provider specialty to OMOP concept - VOCABULARY_ID = 'JNJ_OPTUM_P_SPCLTY'.
-   Remove duplicate records before assigning PROVIDER_ID.

<a name="table-mappings-provider"></a>

**Destination Field**|**Source Field**|**Applied Rule**|**Comment**
:-----:|:-----:|:-----:|:-----:
PROVIDER_ID| |System generated.| 
PROVIDER_NAME| |NULL| 
NPI|NPI|Ignore blanks, 'H' and 'HHHHHHHHHH'| 
DEA|DEA| | 
SPECIALTY_CONCEPT_ID|SPECIALTY_SOURCE_VALUE|**RX_CLAIMS** set as 38004514 (Unknown Physician Specialty)<br><br>**MEDICAL_CLAIMS** PROVCAT: Map it to OMOP VOCABULARY_ID = 'JNJ_OPTUM_P_SPCLTY'|These CONCEPT_IDs fall under VOCABULARY_ID = 'JNJ_OPTUM_P_SPCLTY'.  A record of this vocabulary can be found in Appendix 3.1.<br><br>Set as 38004514 (Unknown Physician Specialty) if SPECIALTY_SOURCE_VALUE has missing value or is NULL or cannot be mapped. 
CARE_SITE_ID|-|0| 
YEAR_OF_BIRTH|-|NULL| 
GENDER_CONCEPT_ID|-|0| 
PROVIDER_SOURCE_VALUE|**RX_CLAIMS** NPI, DEA<br><br>**MEDICAL_CLAIMS** PROV|For NPI, ignore blanks, H and HHHHHHHHHH.|We pull in both DEA and NPI codes. Some NPI = DEA, however OPTUM has identified that as data coming in with the codes switched and not a duplication of NPI and DEA codes.
SPECIALTY_SOURCE_VALUE|**RX_CLAIMS** NULL<br><br>**MEDICAL_CLAIMS** PROVCAT| | 
SPECIALTY_SOURCE_CONCEPT_ID|-|0| 
GENDER_SOURCE_VALUE|-|NULL| 
GENDER_SOURCE_CONCEPT_ID|-|0| 
