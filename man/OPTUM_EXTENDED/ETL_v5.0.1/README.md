<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mermaid/7.0.0/mermaid.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/mermaid/7.0.0/mermaid.js"></script>

# Common Data Model ETL Mapping Specification for Optum Extended SES & Extended DOD 
### CDM Version = 5.0.1, Clinformatics Version = v7.0
##### Authors: Qianli Ma; Erica Voss, Chris Knoll, Ajit Londhe, Clair Blacketer (Janssen)

#### Changelog

|**Date**|**Comments**|
|:-----:|:-----:|
|2017/01/03|Added changelog. Updated death logic for DOD to use the last day of the month rather than the first. Also, to delete death records occurring after the patient DOB.|
|2017/01/11|Updated to use Clinformatics v7, but without adding all of the new features. Clinformatics v7 removes two variables, AMT_COB_RED, and AMT_COB_SAV, so now we are mapping PAID_BY_COORDINATION_BENEFITS to null in drug_cost, procedure_cost, and device_cost|
|2017/03/15|Modified IP visit logic to collapse potential IP visits on the same day even if there are multiple pat_planids associated.|
|2017/04/11|Upgraded to CDM v5.0.1, which brings changes to the COST tables and POA mapping. Also upgraded to Clinformatics v7 fully, bringing in all 25 DIAG fields. Converted document to Markdown.|

---


**Table of Contents**

1. [Introduction](#introduction)
2. [Abbreviations](#abbreviations)
3. [Conventions Used in the Documents](#conventions-used-in-the-documents)
4. [Processing Sequence Map](#processing-sequence-map)
5. [Data Mapping](#data-mapping)
6. [CDM Table - LOCATION](location.md)
7. [CDM Table - PERSON](person.md)
8. [CDM Table - OBSERVATION PERIOD](observation_period.md)
9. [CDM Table - PAYER PLAN PERIOD](payer_plan_period.md)
10. [CDM Table - PROVIDER](provider.md)
11. [CDM Table - VISIT_OCCURRENCE](visit_occurrence.md)
12. [CDM Table - CONDITION_OCCURRENCE](condition_occurrence.md)
13. [CDM Table - CONDITION_ERA](condition_era.md)
14. [CDM Table - PROCEDURE_OCCURRENCE](procedure_occurrence.md)
16. [CDM Table - DEATH](death.md)
17. [CDM Table - DRUG_EXPOSURE](drug_exposure.md)
19. [CDM Table - DRUG_ERA](drug_era.md)
20. [CDM Table - OBSERVATION](observation.md)
21. [CDM Table - CARE_SITE](care_site.md)
22. [CDM Table - MEASUREMENT](measurement.md)
23. [CDM Table - SPECIMEN](specimen.md)
24. [CDM Table - DEVICE_EXPOSURE](device_exposure.md)
25. [CDM Table - NOTE](note.md)
27. [CDM Table - DOSE_ERA](dose_era.md)
28. [CDM Table - FACT_RELATIONSHIP](fact_relationship.md)
30. [CDM Table - COST](cost.md)
31. [Code Snippets](code_snippets.md)

## Introduction

The purpose of this document is to describe the Extract, Transform, Load (ETL) mapping of the licensed data from Optum Extended SES and Optum Extended DOD into the Observational Medical Outcomes Partnership (OMOP) Common Data Model (CDM) V5. Due to usage policy, the Optum ClinFormatics Extended Data Mart (CEDM) has been split into three databases: DOD (Date of Death), Other (Non-Affiliate View), and SES (Socio-Economic Status) – and the data should not be combinded into one CDM. CDM BUILDER will treat building SES and DOD the same for the claims information however DOD has more granularity on location and death while SES include more information on socio-economic status.

## Abbreviations

|**Abbreviation**|**Description**|
|------------------|---------------|
|ETL|Extract, Transform, Load|
|OMOP|Observational Medical Outcomes Partnership|
|CDM|Common Data Model|
|FIPS|Federal Information Processing Standard|
|ICD|The International Classification of Diseases|
|CPT|Current Procedural Terminology|
|HCPCS|Healthcare Common Procedure Coding System|
|DRG|Diagnosis-Related Groups|
|MDC|Major Diagnostic Categories|
|CEDM|ClinFormatics Extended Data Mart|
|SES|Socio-Economic Status|
|DOD|Date of Death|


## Conventions Used in the Documents

The following conventions are used within this document:

|**Convention**|**Description**|
|--------------|--------------|
|-|Value does not exist|
|[]|Refers to a CDM Domain|
|*Italicized*|Refers to a CDM table|
|**Bold**|Refers to a source table (from Optum Extended SES or DOD, in its native schema)|
|```Code```|Pseudo-code, not to be executed directly|

## Processing Sequence Map

This section describes the processing sequence to build CDM tables from
source data files.

### Step I

Use **MEMBER_DETAIL** table to build *LOCATION*, *PERSON*, *OBSERVATION_PERIOD*, and *PAYER_PLAN_PERIOD* tables:

<div class="mermaid">
    graph TD
        MEMBER_DETAIL-->LOCATION
        LOCATION-->PERSON
        PERSON-->OBSERVATION_PERIOD
        PERSON-->PAYER_PLAN_PERIOD
</div>

### Step II

Use **RX_CLAIMS** and **MEDICAL_CLAIMS** tables to build *PROVIDER*
table:

<div class="mermaid">
    graph TD
        RX_CLAIMS-->PROVIDER
        MEDICAL_CLAIMS-->PROVIDER
</div>

### Step III

Use *OBSERVATION_PERIOD*, *PAYER_PLAN_PERIOD*, *PROVIDER* and **MEDICAL_CLAIMS** tables to build *VISIT_OCCURRENCE*, *CONDITION_OCCURRENCE*, *CONDITION_ERA*, *PROCEDURE_OCCURRENCE*,
*COST*, and *DEATH* tables:

<div class="mermaid">
    graph TD
        MEDICAL_CLAIMS-->VISIT_OCCURRENCE
        PROVIDER-->VISIT_OCCURRENCE
        OBSERVATION_PERIOD-->VISIT_OCCURRENCE
        PAYER_PLAN_PERIOD-->VISIT_OCCURRENCE
        VISIT_OCCURRENCE-->CONDITION_OCCURRENCE
        VISIT_OCCURRENCE-->DEATH
        VISIT_OCCURRENCE-->PROCEDURE_OCCURRENCE
        CONDITION_OCCURRENCE-->CONDITION_ERA
        PROCEDURE_OCCURRENCE-->COST
        
</div>

### Step IV 

Use *OBSERVATION_PERIOD*, *PAYER_PLAN_PERIOD*, *PROVIDER*, *PROCEDURE_OCCURRENCE* and **RX_CLAIMS** tables to build *DRUG_EXPOSURE*, *DRUG_ERA*, and *COST* tables:

<div class="mermaid">
    graph TD
        RX_CLAIMS-->DRUG_EXPOSURE
        PROVIDER-->DRUG_EXPOSURE
        OBSERVATION_PERIOD-->DRUG_EXPOSURE
        PROCEDURE_OCCURRENCE-->DRUG_EXPOSURE
        PAYER_PLAN_PERIOD-->DRUG_EXPOSURE
        DRUG_EXPOSURE-->DRUG_ERA
        DRUG_EXPOSURE-->COST
        
</div>

### Step V 

Use *OBSERVATION_PERIOD* and **LAB_RESULTS** tables to build *OBSERVATION* and *MEASUREMENT* tables, and create table shells for *CARE_SITE* table:

<div class="mermaid">
    graph TD
        LAB_RESULTS-->OBSERVATION
        OBSERVATION_PERIOD-->OBSERVATION
</div>

### Data Mapping

This section describes how the source data are mapped into the CDM.

The following are a list of conventions used throughout all tables in this ETL:

-   Since our data is already de-identified, we do not need to mask our PERSON_IDs.
-   If a CONCEPT_ID column cannot be mapped to a known code, it should be set to 0.
-   If a non-CONCEPT_ID column cannot be mapped to a known code, it should be set to NULL.
-   Only pull records during observation periods where a person had both medical and pharmacy benefits.
-   ICD diagnosis and procedure codes in **MEDICAL_CLAIMS** table have no decimal point, so when mapping to the OMOP Vocabulary, the decimal points need to be removed from the vocabulary in order to map between the source and the vocabulary.

