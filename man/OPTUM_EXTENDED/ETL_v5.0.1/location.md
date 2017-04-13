*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD 
CDM Version = 5.0.1, Clinformatics Version = v7.0
Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)*

[Back to README](readme.md)

---

# LOCATION

This table is built off the Optum **MEMBER_DETAIL** table, which contains only census division where members live during a certain
enrollment period.

**Key conventions:**

-   Remove duplicate records before assigning LOCATION_ID.
-   In the **DOD** database use the variable **MEMBER_DETAIL.**STATE to
    create the location records
-   In the **SES** database use the variable **MEMBER_DETAIL.**DIVISION
    to create the location records


|**Destination Field**|**Source Field**|**Applied Rule**|**Comment**|
|---------------------|----------------|----------------|-----------|
|LOCATION_ID|-|System generated.|-|
|ADDRESS_1|-|NULL|-|
|ADDRESS_2|-|NULL|-|	
|CITY|-|NULL|-|
|STATE|**DOD**: **MEMBER_DETAIL** STATE|Only available in DOD database, set to NULL for SES database|
|ZIP|-|NULL|-|
|COUNTY|-|NULL|-|
|LOCATION_SOURCE_VALUE|**DOD**: **MEMBER_DETAIL** STATE; **SES**: DIVISION|-|In SES database use MEMBER_DETAIL.DIVISION and in DOD database use MEMBER_DETAIL.STATE|

