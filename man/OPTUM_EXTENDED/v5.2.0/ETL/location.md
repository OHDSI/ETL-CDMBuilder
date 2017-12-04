*Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD* 
<br>*CDM Version = 5.2, Clinformatics Version = v7.1*
<br>*Authors: Qianli Ma, PhD; Erica Voss, MPH; Chris Knoll; Ajit Londhe, MPH; Clair Blacketer, MPH*

[Back to README](README.md)

---

# CDM Table: LOCATION

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
|LOCATION_ID| |System generated.| |
|ADDRESS_1| | | |
|ADDRESS_2| | | |	
|CITY| | | |
|STATE|**DOD, MEMBER_DETAIL**<br/>STATE|Only available in DOD database, set to NULL for SES database| |
|ZIP| | | |
|COUNTY| | | |
|LOCATION_SOURCE_VALUE|**DOD, MEMBER_DETAIL**<br/>STATE<br/><br/>**SES, MEMBER_DETAIL**<br/>DIVISION| |In SES database use MEMBER_DETAIL.DIVISION and in DOD database use MEMBER_DETAIL.STATE|

