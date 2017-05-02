IF OBJECT_ID('@cdm_schema.test_results', 'U') IS NOT NULL
  DROP TABLE @cdm_schema.test_results;

CREATE TABLE @cdm_schema.test_results (id INT, description VARCHAR(512), test VARCHAR(256), source_pid VARCHAR(50), cdm_pid int, status VARCHAR(5));


-- 1. Condition Occurrence
--
-- 1.0 Patient has two different primary diagnoses between inpatient_services and inpatient_admissions, the inpatient_admissions PDX is used [Test ID: 1]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 1 AS id, '1.0 Patient has two different primary diagnoses between inpatient_services and inpatient_admissions, the inpatient_admissions PDX is used' AS description, 'Expect condition_occurrence' AS test, '1' as source_pid, 1 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '1' AND condition_concept_id = '198337' AND condition_type_concept_id = '38000199') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.1 Patient has the same diagnosis code in outpatient_services and facility_header but in different positions, outpatient_services dx is prioritized [Test ID: 2]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 2 AS id, '1.1 Patient has the same diagnosis code in outpatient_services and facility_header but in different positions, outpatient_services dx is prioritized' AS description, 'Expect condition_occurrence' AS test, '3' as source_pid, 3 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '3' AND condition_concept_id = '433706' AND condition_type_concept_id = '38000215') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.2 Patient has diagnosis in dx4 field in inpatient_services, condition_type_concept_id = 38000187 [Test ID: 3]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 3 AS id, '1.2 Patient has diagnosis in dx4 field in inpatient_services, condition_type_concept_id = 38000187' AS description, 'Expect condition_occurrence' AS test, '5' as source_pid, 5 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '5' AND condition_concept_id = '195587' AND condition_type_concept_id = '38000187') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.3 Patient has diagnosis in dx9 field in facility_header, condition_type_concept_id = 38000208 [Test ID: 4]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 4 AS id, '1.3 Patient has diagnosis in dx9 field in facility_header, condition_type_concept_id = 38000208' AS description, 'Expect condition_occurrence' AS test, '7' as source_pid, 7 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '7' AND condition_concept_id = '24970' AND condition_type_concept_id = '38000208') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.4 Patient has revcode 0450 and diagnosis codes in the pdx and dx1 fields, ER record created and conditions have condition_type_concept_id = 38000215 [Test ID: 5]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 5 AS id, '1.4 Patient has revcode 0450 and diagnosis codes in the pdx and dx1 fields, ER record created and conditions have condition_type_concept_id = 38000215' AS description, 'Expect visit_occurrence' AS test, '9' as source_pid, 9 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '9' AND visit_concept_id = '9203') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 5 AS id, '1.4 Patient has revcode 0450 and diagnosis codes in the pdx and dx1 fields, ER record created and conditions have condition_type_concept_id = 38000215' AS description, 'Expect condition_occurrence' AS test, '9' as source_pid, 9 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '9' AND condition_concept_id = '195587' AND condition_type_concept_id = '38000215') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 5 AS id, '1.4 Patient has revcode 0450 and diagnosis codes in the pdx and dx1 fields, ER record created and conditions have condition_type_concept_id = 38000215' AS description, 'Expect condition_occurrence' AS test, '9' as source_pid, 9 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '9' AND condition_concept_id = '24970' AND condition_type_concept_id = '38000215') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.5 Patient has diagnosis in a dx field that has domain=procedure, condition record moved to procedure_occurrence [Test ID: 6]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 6 AS id, '1.5 Patient has diagnosis in a dx field that has domain=procedure, condition record moved to procedure_occurrence' AS description, 'Expect procedure_occurrence' AS test, '11' as source_pid, 11 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_occurrence WHERE person_id = '11' AND procedure_concept_id = '4064909') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.6 Patient has diagnosis in a dx field that has domain=observation, condition record moved to observation [Test ID: 7]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 7 AS id, '1.6 Patient has diagnosis in a dx field that has domain=observation, condition record moved to observation' AS description, 'Expect observation' AS test, '13' as source_pid, 13 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation WHERE person_id = '13' AND observation_concept_id = '4117957') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.7 Patient has diagnosis in a dx field that has domain=measurement, condition record moved to measurement [Test ID: 8]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 8 AS id, '1.7 Patient has diagnosis in a dx field that has domain=measurement, condition record moved to measurement' AS description, 'Expect measurement' AS test, '15' as source_pid, 15 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.measurement WHERE person_id = '15' AND measurement_concept_id = '4034850') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.8 Patient has icd10 diagnosis in a dx field with dxver=0, condition record created with icd10 mapped to snomed [Test ID: 9]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 9 AS id, '1.8 Patient has icd10 diagnosis in a dx field with dxver=0, condition record created with icd10 mapped to snomed' AS description, 'Expect condition_occurrence' AS test, '17' as source_pid, 17 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '17' AND condition_concept_id = '438021') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.9 patient has icd10cm diagnosis in a dx field that overlaps with an icd10 diagnosis, condition record created with icd10cm mapped to snomed [Test ID: 10]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 10 AS id, '1.9 patient has icd10cm diagnosis in a dx field that overlaps with an icd10 diagnosis, condition record created with icd10cm mapped to snomed' AS description, 'Expect observation' AS test, '19' as source_pid, 19 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation WHERE person_id = '19' AND observation_concept_id = '437476') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 10 AS id, '1.9 patient has icd10cm diagnosis in a dx field that overlaps with an icd10 diagnosis, condition record created with icd10cm mapped to snomed' AS description, 'Expect condition_occurrence' AS test, '19' as source_pid, 19 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '19' AND condition_concept_id = '4053838') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.10 Patient has icd10 diagnosis after 10/1/2015 in a dx field with dxver=null, condition record created with icd10 mapped to snomed [Test ID: 11]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 11 AS id, '1.10 Patient has icd10 diagnosis after 10/1/2015 in a dx field with dxver=null, condition record created with icd10 mapped to snomed' AS description, 'Expect condition_occurrence' AS test, '21' as source_pid, 21 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '21' AND condition_concept_id = '438021') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.11 Patient has icd10 diagnosis before 10/1/2015 in a dx field with dxver=null, used ICD9 [Test ID: 12]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 12 AS id, '1.11 Patient has icd10 diagnosis before 10/1/2015 in a dx field with dxver=null, used ICD9' AS description, 'Expect condition_occurrence' AS test, '23' as source_pid, 23 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '23' AND condition_concept_id = '4053838' AND condition_source_concept_id = '44821630') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 1.12 Patient has diagnosis in dx1 in ltc, condition_type_concept_id = 38000215 [Test ID: 13]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 13 AS id, '1.12 Patient has diagnosis in dx1 in ltc, condition_type_concept_id = 38000215' AS description, 'Expect condition_occurrence' AS test, '25' as source_pid, 25 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '25' AND condition_concept_id = '4053838' AND condition_type_concept_id = '38000215') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 2. Condition Era
--
-- 2.0 Patient condition_concept_id of 0, no condition_era record created [Test ID: 14]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 14 AS id, '2.0 Patient condition_concept_id of 0, no condition_era record created' AS description, 'Expect condition_era' AS test, '27' as source_pid, 27 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_era WHERE person_id = '27') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 2.1 Two records with same condition_concept_id are less than 30 days apart, one condition_era record created [Test ID: 15]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 15 AS id, '2.1 Two records with same condition_concept_id are less than 30 days apart, one condition_era record created' AS description, 'Expect condition_era' AS test, '29' as source_pid, 29 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_era WHERE person_id = '29' AND condition_era_start_date = '2012-07-01' AND condition_era_end_date = '2012-07-12') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 2.2 Two records with same condition_concept_id are more than 30 days apart, two condition_era records created [Test ID: 16]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 16 AS id, '2.2 Two records with same condition_concept_id are more than 30 days apart, two condition_era records created' AS description, 'Expect condition_era' AS test, '31' as source_pid, 31 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_era WHERE person_id = '31' AND condition_era_start_date = '2012-07-01') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 16 AS id, '2.2 Two records with same condition_concept_id are more than 30 days apart, two condition_era records created' AS description, 'Expect condition_era' AS test, '31' as source_pid, 31 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_era WHERE person_id = '31' AND condition_era_start_date = '2012-08-12') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 3. Cost
--
-- 3.0 Patient has values in ingcost and and dispfee [Test ID: 17]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 17 AS id, '3.0 Patient has values in ingcost and and dispfee' AS description, 'Expect cost' AS test, '33' as source_pid, 33 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cost WHERE cost_domain_id = 'Drug' AND paid_patient_copay = '20' AND paid_ingredient_cost = '50' AND paid_dispensing_fee = '25') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 3.1 Patient has cost values, cost is correctly associated with cost_domain_id = 10 [Test ID: 18]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 18 AS id, '3.1 Patient has cost values, cost is correctly associated with cost_domain_id = 10' AS description, 'Expect procedure_occurrence' AS test, '35' as source_pid, 35 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_occurrence WHERE person_id = '35' AND procedure_concept_id = '40757105' AND procedure_date = '2012-06-11') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 18 AS id, '3.1 Patient has cost values, cost is correctly associated with cost_domain_id = 10' AS description, 'Expect cost' AS test, '35' as source_pid, 35 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cost WHERE cost_domain_id = 'Procedure' AND paid_by_patient = '160' AND paid_patient_copay = '40' AND paid_patient_deductible = '120') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 3.2 Patient has procedure with domain = measurement, measurement record created [Test ID: 19]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 19 AS id, '3.2 Patient has procedure with domain = measurement, measurement record created' AS description, 'Expect measurement' AS test, '37' as source_pid, 37 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.measurement WHERE person_id = '37' AND measurement_concept_id = '2212375' AND measurement_date = '2012-05-07') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 19 AS id, '3.2 Patient has procedure with domain = measurement, measurement record created' AS description, 'Expect cost' AS test, '37' as source_pid, 37 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cost WHERE cost_domain_id = 'Measurement' AND total_paid = '157' AND paid_by_payer = '120' AND paid_patient_copay = '37') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 3.3 Patient has procedure with domain = observation, observation record created [Test ID: 20]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 20 AS id, '3.3 Patient has procedure with domain = observation, observation record created' AS description, 'Expect observation' AS test, '39' as source_pid, 39 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation WHERE person_id = '39' AND observation_concept_id = '2721503' AND observation_date = '2012-10-03') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 20 AS id, '3.3 Patient has procedure with domain = observation, observation record created' AS description, 'Expect cost' AS test, '39' as source_pid, 39 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cost WHERE cost_domain_id = 'Observation' AND paid_by_payer = '75' AND paid_patient_coinsurance = '100' AND paid_by_primary = '52') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 3.4 Patient has cost values and revenue code, cost is correctly associated with cost_domain_id = 10 [Test ID: 21]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 21 AS id, '3.4 Patient has cost values and revenue code, cost is correctly associated with cost_domain_id = 10' AS description, 'Expect cost' AS test, '41' as source_pid, 41 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cost WHERE cost_domain_id = 'Procedure' AND paid_by_patient = '100' AND paid_patient_copay = '80' AND paid_patient_deductible = '20') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 3.5 Patient has record with costs in ltc, cost record created [Test ID: 22]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 22 AS id, '3.5 Patient has record with costs in ltc, cost record created' AS description, 'Expect condition_occurrence' AS test, '43' as source_pid, 43 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE person_id = '43' AND condition_concept_id = '4053838' AND condition_type_concept_id = '38000215') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 22 AS id, '3.5 Patient has record with costs in ltc, cost record created' AS description, 'Expect cost' AS test, '43' as source_pid, 43 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cost WHERE cost_domain_id = 'Procedure' AND paid_by_payer = '90' AND paid_by_patient = '150' AND paid_patient_copay = '62' AND paid_patient_coinsurance = '88' AND paid_by_primary = '20') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 4. Death
--
-- 4.0 Date of death visit end date [Test ID: 23]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 23 AS id, '4.0 Date of death visit end date' AS description, 'Expect death' AS test, '45' as source_pid, 45 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.death WHERE person_id = '45' AND death_date = '2013-01-09') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 4.1 ICD10 Death and Death Type Correct [Test ID: 24]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 24 AS id, '4.1 ICD10 Death and Death Type Correct' AS description, 'Expect death' AS test, '47' as source_pid, 47 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.death WHERE person_id = '47' AND death_type_concept_id = '38003567') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 4.2 ICD9 Death and Death Type Correct [Test ID: 25]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 25 AS id, '4.2 ICD9 Death and Death Type Correct' AS description, 'Expect death' AS test, '49' as source_pid, 49 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.death WHERE person_id = '49' AND death_type_concept_id = '38003567') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 4.3 Discharge Status and Death Type Correct [Test ID: 26]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 26 AS id, '4.3 Discharge Status and Death Type Correct' AS description, 'Expect death' AS test, '51' as source_pid, 51 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.death WHERE person_id = '51' AND death_type_concept_id = '38003566') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 4.4 Death by ICD9 and Death by Discharge, Keep the Discharge [Test ID: 27]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 27 AS id, '4.4 Death by ICD9 and Death by Discharge, Keep the Discharge' AS description, 'Expect death' AS test, '53' as source_pid, 53 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.death WHERE person_id = '53' AND death_type_concept_id = '38003566') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 4.5 Death and then contined Activity Cancels Death [Test ID: 28]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 28 AS id, '4.5 Death and then contined Activity Cancels Death' AS description, 'Expect death' AS test, '55' as source_pid, 55 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.death WHERE person_id = '55') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 4.6 Patient has icd9 death cord in ltc, death record created [Test ID: 29]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 29 AS id, '4.6 Patient has icd9 death cord in ltc, death record created' AS description, 'Expect death' AS test, '57' as source_pid, 57 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.death WHERE person_id = '57') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 5. Device Exposure

-- 6. Drug Exposure
--
-- 6.0 Duplicate drug records become one record in the CDM [Test ID: 30]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 30 AS id, '6.0 Duplicate drug records become one record in the CDM' AS description, 'Expect drug_exposure' AS test, '59' as source_pid, 59 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_exposure WHERE person_id = '59' AND drug_concept_id = '40161912' AND drug_exposure_start_date = '02-01-2012') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 6.1 Negative daysupp should be 0 in cdm [Test ID: 31]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 31 AS id, '6.1 Negative daysupp should be 0 in cdm' AS description, 'Expect drug_exposure' AS test, '61' as source_pid, 61 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_exposure WHERE person_id = '61' AND drug_concept_id = '1545998' AND drug_exposure_start_date = '06-12-2012' AND days_supply = '0') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 6.2 Daysupp >365 should be 365 in cdm [Test ID: 32]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 32 AS id, '6.2 Daysupp >365 should be 365 in cdm' AS description, 'Expect drug_exposure' AS test, '63' as source_pid, 63 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_exposure WHERE person_id = '63' AND drug_concept_id = '1545998' AND drug_exposure_start_date = '08-07-2012' AND days_supply = '365') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 6.3 CPT4 drug code in inpatient record moves to drug_exposure [Test ID: 33]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 33 AS id, '6.3 CPT4 drug code in inpatient record moves to drug_exposure' AS description, 'Expect drug_exposure' AS test, '65' as source_pid, 65 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_exposure WHERE person_id = '65' AND drug_concept_id = '2213404' AND drug_exposure_start_date = '2012-08-09') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 6.4 Patient has 11 digit NDC that doesn''t map, should use first 9 digits instead [Test ID: 34]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 34 AS id, '6.4 Patient has 11 digit NDC that doesn''t map, should use first 9 digits instead' AS description, 'Expect drug_exposure' AS test, '67' as source_pid, 67 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_exposure WHERE person_id = '67' AND drug_concept_id = '46275250' AND drug_exposure_start_date = '01-17-2012') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 6.5 Patient has 9 digit NDC that doesn''t map, should use first 9 digits instead, should map to DRUG_CONCEPT_ID=0 because of the date filter [Test ID: 35]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 35 AS id, '6.5 Patient has 9 digit NDC that doesn''t map, should use first 9 digits instead, should map to DRUG_CONCEPT_ID=0 because of the date filter' AS description, 'Expect drug_exposure' AS test, '69' as source_pid, 69 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_exposure WHERE person_id = '69' AND drug_concept_id = '0' AND drug_exposure_start_date = '07-08-2006') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 6.6 Patient has 9 digit NDC that doesn''t map, should use first 9 digits instead, should map to correct DRUG_CONCEPT_ID because of the date filter [Test ID: 36]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 36 AS id, '6.6 Patient has 9 digit NDC that doesn''t map, should use first 9 digits instead, should map to correct DRUG_CONCEPT_ID because of the date filter' AS description, 'Expect drug_exposure' AS test, '71' as source_pid, 71 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_exposure WHERE person_id = '71' AND drug_concept_id = '45775771' AND drug_exposure_start_date = '09-18-2014') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 7. Drug Era
--
-- 7.0 Two drugs with same ingredient within 30 days, should be one drug era [Test ID: 37]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 37 AS id, '7.0 Two drugs with same ingredient within 30 days, should be one drug era' AS description, 'Expect drug_era' AS test, '73' as source_pid, 73 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_era WHERE person_id = '73' AND drug_concept_id = '1134439' AND drug_era_start_date = '02-04-2012') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 7.1 Two drugs with same ingredient > 30 days apart, should be two drug eras [Test ID: 38]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 38 AS id, '7.1 Two drugs with same ingredient > 30 days apart, should be two drug eras' AS description, 'Expect drug_era' AS test, '75' as source_pid, 75 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_era WHERE person_id = '75' AND drug_concept_id = '1134439' AND drug_era_start_date = '09-21-2012') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 38 AS id, '7.1 Two drugs with same ingredient > 30 days apart, should be two drug eras' AS description, 'Expect drug_era' AS test, '75' as source_pid, 75 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_era WHERE person_id = '75' AND drug_concept_id = '1134439' AND drug_era_start_date = '12-08-2012') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 7.2 Drug_era_end_date should be drug start date + days supply [Test ID: 39]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 39 AS id, '7.2 Drug_era_end_date should be drug start date + days supply' AS description, 'Expect drug_era' AS test, '77' as source_pid, 77 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_era WHERE person_id = '77' AND drug_concept_id = '956874' AND drug_era_start_date = '12-08-2010' AND drug_era_end_date = '12-22-2010') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 7.3 No drug era created from procedure drugs since they are not related to ingredients [Test ID: 40]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 40 AS id, '7.3 No drug era created from procedure drugs since they are not related to ingredients' AS description, 'Expect drug_era' AS test, '79' as source_pid, 79 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_era WHERE person_id = '79') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 7.4 Drug with two ingredients should have two drug eras [Test ID: 41]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 41 AS id, '7.4 Drug with two ingredients should have two drug eras' AS description, 'Expect drug_era' AS test, '81' as source_pid, 81 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_era WHERE person_id = '81' AND drug_concept_id = '1134439' AND drug_era_start_date = '05-01-2010') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 41 AS id, '7.4 Drug with two ingredients should have two drug eras' AS description, 'Expect drug_era' AS test, '81' as source_pid, 81 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_era WHERE person_id = '81' AND drug_concept_id = '1112807' AND drug_era_start_date = '05-01-2010') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 8. Location

-- 9. Measurement

-- 10. Observation Period
--
-- 10.0 Subsumed enrollment test where two enrollment durations with the second subsumed by the first results in a single observation [Test ID: 42]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 42 AS id, '10.0 Subsumed enrollment test where two enrollment durations with the second subsumed by the first results in a single observation' AS description, 'Expect observation_period' AS test, '83' as source_pid, 83 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation_period WHERE person_id = '83' AND observation_period_start_date = '2012-01-01' AND observation_period_end_date = '2012-12-31') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 10.1 Combine enrollment test where two enrollment durations with the second within 30 days of the first results in a single observation [Test ID: 43]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 43 AS id, '10.1 Combine enrollment test where two enrollment durations with the second within 30 days of the first results in a single observation' AS description, 'Expect observation_period' AS test, '84' as source_pid, 84 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation_period WHERE person_id = '84' AND observation_period_start_date = '2012-05-01' AND observation_period_end_date = '2012-12-31') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 10.2 Gap enrollment test where two enrollment durations are 33 days apart results in two observations [Test ID: 44]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 44 AS id, '10.2 Gap enrollment test where two enrollment durations are 33 days apart results in two observations' AS description, 'Expect observation_period' AS test, '85' as source_pid, 85 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation_period WHERE person_id = '85' AND observation_period_start_date = '2012-01-01' AND observation_period_end_date = '2012-06-01') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 44 AS id, '10.2 Gap enrollment test where two enrollment durations are 33 days apart results in two observations' AS description, 'Expect observation_period' AS test, '85' as source_pid, 85 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation_period WHERE person_id = '85' AND observation_period_start_date = '2012-08-02' AND observation_period_end_date = '2012-12-31') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 11. Observation
--
-- 11.0 Store Discharge Status [Test ID: 45]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 45 AS id, '11.0 Store Discharge Status' AS description, 'Expect observation' AS test, '86' as source_pid, 86 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation WHERE person_id = '86' AND observation_concept_id = '4202605' AND observation_source_value = '51') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 12. Payer Plan Period
--
-- 12.0 Person has a gap of >32 days between enrollment periods with the same payer_source_value; person has two records [Test ID: 46]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 46 AS id, '12.0 Person has a gap of >32 days between enrollment periods with the same payer_source_value; person has two records' AS description, 'Expect payer_plan_period' AS test, '88' as source_pid, 88 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.payer_plan_period WHERE person_id = '88' AND payer_plan_period_start_date = '2013-01-01' AND payer_plan_period_end_date = '2013-01-31' AND payer_source_value = 'D N PPO') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 46 AS id, '12.0 Person has a gap of >32 days between enrollment periods with the same payer_source_value; person has two records' AS description, 'Expect payer_plan_period' AS test, '88' as source_pid, 88 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.payer_plan_period WHERE person_id = '88' AND payer_plan_period_start_date = '2013-05-01' AND payer_plan_period_end_date = '2013-05-31' AND payer_source_value = 'D N PPO') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 12.1 Person does not have prescription benefits and is excluded [Test ID: 47]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 47 AS id, '12.1 Person does not have prescription benefits and is excluded' AS description, 'Expect payer_plan_period' AS test, '89' as source_pid, 89 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.payer_plan_period WHERE ) != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 12.2 Person switches plans in the middle of an enrollment period; person has two records with the first truncated [Test ID: 48]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 48 AS id, '12.2 Person switches plans in the middle of an enrollment period; person has two records with the first truncated' AS description, 'Expect payer_plan_period' AS test, '90' as source_pid, 90 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.payer_plan_period WHERE person_id = '90' AND payer_plan_period_start_date = '2012-04-01' AND payer_plan_period_end_date = '2012-04-07' AND payer_source_value = 'D N PPO') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 48 AS id, '12.2 Person switches plans in the middle of an enrollment period; person has two records with the first truncated' AS description, 'Expect payer_plan_period' AS test, '90' as source_pid, 90 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.payer_plan_period WHERE person_id = '90' AND payer_plan_period_start_date = '2012-04-07' AND payer_plan_period_end_date = '2012-04-30' AND payer_source_value = 'D N POS') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 12.3 Person has duplicate records, only one is brought into the cdm [Test ID: 49]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 49 AS id, '12.3 Person has duplicate records, only one is brought into the cdm' AS description, 'Expect payer_plan_period' AS test, '91' as source_pid, 91 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.payer_plan_period WHERE person_id = '91' AND payer_plan_period_start_date = '2012-04-01' AND payer_plan_period_end_date = '2012-04-30' AND payer_source_value = 'D N PPO') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 13. Person
--
-- 13.0 Person with two genders is excluded [Test ID: 50]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 50 AS id, '13.0 Person with two genders is excluded' AS description, 'Expect person' AS test, '92' as source_pid, 92 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '92') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.1 Person with two birth years >2 yrs apart is excluded [Test ID: 51]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 51 AS id, '13.1 Person with two birth years >2 yrs apart is excluded' AS description, 'Expect person' AS test, '93' as source_pid, 93 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '93') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.2 Person with two birth years <2 yrs apart is kept with last birth year selected [Test ID: 52]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 52 AS id, '13.2 Person with two birth years <2 yrs apart is kept with last birth year selected' AS description, 'Expect person' AS test, '94' as source_pid, 94 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '94' AND year_of_birth = '1971') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.3 Person born before 1900 is excluded [Test ID: 53]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 53 AS id, '13.3 Person born before 1900 is excluded' AS description, 'Expect person' AS test, '95' as source_pid, 95 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '95') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.4 Person born in 2099 is excluded [Test ID: 54]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 54 AS id, '13.4 Person born in 2099 is excluded' AS description, 'Expect person' AS test, '96' as source_pid, 96 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '96') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.5 Person born in 2014 but enrolled in 2012 is excluded [Test ID: 55]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 55 AS id, '13.5 Person born in 2014 but enrolled in 2012 is excluded' AS description, 'Expect person' AS test, '97' as source_pid, 97 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '97') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.6 Person born in 2013 but enrolled in 2012 is kept, latest birth year taken [Test ID: 56]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 56 AS id, '13.6 Person born in 2013 but enrolled in 2012 is kept, latest birth year taken' AS description, 'Expect person' AS test, '98' as source_pid, 98 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '98' AND year_of_birth = '2013') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.7 Person with two enrollment_detail records has one person record [Test ID: 57]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 57 AS id, '13.7 Person with two enrollment_detail records has one person record' AS description, 'Expect person' AS test, '99' as source_pid, 99 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '99' AND year_of_birth = '1980') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.8 Person with sex=3 is excluded [Test ID: 58]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 58 AS id, '13.8 Person with sex=3 is excluded' AS description, 'Expect person' AS test, '100' as source_pid, 100 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '100') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.9 Person has record with sex=3 but last record has sex=1, person is kept [Test ID: 59]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 59 AS id, '13.9 Person has record with sex=3 but last record has sex=1, person is kept' AS description, 'Expect person' AS test, '101' as source_pid, 101 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '101' AND gender_concept_id = '8507') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.10 Person born the same year as enrolled, use first enrollment month to impute month of birth and day of birth [Test ID: 60]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 60 AS id, '13.10 Person born the same year as enrolled, use first enrollment month to impute month of birth and day of birth' AS description, 'Expect person' AS test, '102' as source_pid, 102 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '102' AND year_of_birth = '2012' AND month_of_birth = '4' AND day_of_birth = '1') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.11 Person with DRUGCOVG=0 and MEDICARE=0, person is excluded [Test ID: 61]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 61 AS id, '13.11 Person with DRUGCOVG=0 and MEDICARE=0, person is excluded' AS description, 'Expect person' AS test, '103' as source_pid, 103 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '103') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.12 Person with DRUGCOVG=1 and MEDICARE=0, person is kept [Test ID: 62]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 62 AS id, '13.12 Person with DRUGCOVG=1 and MEDICARE=0, person is kept' AS description, 'Expect person' AS test, '104' as source_pid, 104 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '104') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.13 Person with DRUGCOVG=0 and MEDICARE=1, person is kept [Test ID: 63]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 63 AS id, '13.13 Person with DRUGCOVG=0 and MEDICARE=1, person is kept' AS description, 'Expect person' AS test, '105' as source_pid, 105 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '105') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.14 Person with stdrace=1 [Test ID: 64]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 64 AS id, '13.14 Person with stdrace=1' AS description, 'Expect person' AS test, '106' as source_pid, 106 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '106' AND race_concept_id = '8527' AND ethnicity_concept_id = '38003564') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 13.15 Person with stdrace=4 [Test ID: 65]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 65 AS id, '13.15 Person with stdrace=4' AS description, 'Expect person' AS test, '107' as source_pid, 107 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE person_id = '107' AND race_concept_id = '0' AND ethnicity_concept_id = '38003563') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 14. Procedure Occurrence
--
-- 14.0 Patient has two PPROC values, PPROC from inpatient_admissions is used [Test ID: 66]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 66 AS id, '14.0 Patient has two PPROC values, PPROC from inpatient_admissions is used' AS description, 'Expect procedure_occurrence' AS test, '108' as source_pid, 108 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_occurrence WHERE person_id = '108' AND procedure_concept_id = '40757126' AND procedure_date = '2012-06-12') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 14.1 Patient has two different providers for the same procedure, the provider on the first line (ascending) is chosen [Test ID: 67]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 67 AS id, '14.1 Patient has two different providers for the same procedure, the provider on the first line (ascending) is chosen' AS description, 'Expect procedure_occurrence' AS test, '110' as source_pid, 110 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_occurrence WHERE person_id = '110' AND procedure_concept_id = '2109659' AND procedure_date = '2012-10-20') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 14.2 Patient has procedure in proc1 field in long_term_care table [Test ID: 68]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 68 AS id, '14.2 Patient has procedure in proc1 field in long_term_care table' AS description, 'Expect procedure_occurrence' AS test, '112' as source_pid, 112 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_occurrence WHERE person_id = '112' AND procedure_concept_id = '2313736' AND procedure_date = '2012-09-15') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 14.3 Patient has two records for the same procedure, procedure in outpatient_services prioritized [Test ID: 69]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 69 AS id, '14.3 Patient has two records for the same procedure, procedure in outpatient_services prioritized' AS description, 'Expect procedure_occurrence' AS test, '114' as source_pid, 114 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_occurrence WHERE person_id = '114' AND procedure_concept_id = '2109995' AND procedure_date = '2012-02-15' AND procedure_type_concept_id = '38000267') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 14.4 Patient has procedure in proc5 position in facility header, procedure_type_concept_id = 38000273 [Test ID: 70]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 70 AS id, '14.4 Patient has procedure in proc5 position in facility header, procedure_type_concept_id = 38000273' AS description, 'Expect procedure_occurrence' AS test, '116' as source_pid, 116 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_occurrence WHERE person_id = '116' AND procedure_concept_id = '2313827' AND procedure_type_concept_id = '38000273') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 14.5 Patient has procedure with domain = device, device record created [Test ID: 71]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 71 AS id, '14.5 Patient has procedure with domain = device, device record created' AS description, 'Expect device_exposure' AS test, '118' as source_pid, 118 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.device_exposure WHERE person_id = '118' AND device_concept_id = '2616599' AND device_exposure_start_date = '2012-04-03') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 14.6 Patient has procedure with domain = drug, drug record created [Test ID: 72]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 72 AS id, '14.6 Patient has procedure with domain = drug, drug record created' AS description, 'Expect drug_exposure' AS test, '120' as source_pid, 120 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_exposure WHERE person_id = '120' AND drug_concept_id = '44816520' AND drug_exposure_start_date = '2012-05-03') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 14.7 Patient has procedure with domain = measurement, measurement record created [Test ID: 73]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 73 AS id, '14.7 Patient has procedure with domain = measurement, measurement record created' AS description, 'Expect measurement' AS test, '122' as source_pid, 122 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.measurement WHERE person_id = '122' AND measurement_concept_id = '2212375' AND measurement_date = '2012-05-03') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 14.8 Patient has procedure with domain = observation, observation record created [Test ID: 74]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 74 AS id, '14.8 Patient has procedure with domain = observation, observation record created' AS description, 'Expect observation' AS test, '124' as source_pid, 124 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation WHERE person_id = '124' AND observation_concept_id = '2721503' AND observation_date = '2012-05-03') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 15. Provider
--
-- 15.0 Provider in facility header table with stdprov=220, specialty = emergency medicine [Test ID: 75]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 75 AS id, '15.0 Provider in facility header table with stdprov=220, specialty = emergency medicine' AS description, 'Expect provider' AS test, NULL as source_pid, NULL as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.provider WHERE specialty_concept_id = '38004510' AND specialty_source_value = '220') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 15.1 Provider in outpatient_services table with stdprov=285, specialty = infectious disease [Test ID: 76]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 76 AS id, '15.1 Provider in outpatient_services table with stdprov=285, specialty = infectious disease' AS description, 'Expect provider' AS test, NULL as source_pid, NULL as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.provider WHERE specialty_concept_id = '38004484' AND specialty_source_value = '285') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 15.2 provider in inpatient_services table with stdprov=540, specialty = cardiac surgery [Test ID: 77]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 77 AS id, '15.2 provider in inpatient_services table with stdprov=540, specialty = cardiac surgery' AS description, 'Expect provider' AS test, NULL as source_pid, NULL as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.provider WHERE specialty_concept_id = '38004497' AND specialty_source_value = '540') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 15.3 provider in long_term_care table with stdprov=22, specialty = addiction medicine [Test ID: 78]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 78 AS id, '15.3 provider in long_term_care table with stdprov=22, specialty = addiction medicine' AS description, 'Expect provider' AS test, NULL as source_pid, NULL as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.provider WHERE specialty_concept_id = '38004498' AND specialty_source_value = '22') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 16. Visit Occurrence
--
-- 16.0 Patient with visit that starts before the observation period, start date trimmed to beginning of observation period [Test ID: 79]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 79 AS id, '16.0 Patient with visit that starts before the observation period, start date trimmed to beginning of observation period' AS description, 'Expect visit_occurrence' AS test, '134' as source_pid, 134 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '134' AND visit_start_date = '2012-01-01' AND visit_end_date = '2012-01-06') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.1 svcdate>tsvcdate, visit_end_date is svcdate [Test ID: 80]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 80 AS id, '16.1 svcdate>tsvcdate, visit_end_date is svcdate' AS description, 'Expect visit_occurrence' AS test, '136' as source_pid, 136 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '136' AND visit_start_date = '2012-03-21' AND visit_end_date = '2012-03-21') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.2 Service falls during observation period but ends after the period ends, visit_end_date is the observation_period_end_date [Test ID: 81]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 81 AS id, '16.2 Service falls during observation period but ends after the period ends, visit_end_date is the observation_period_end_date' AS description, 'Expect visit_occurrence' AS test, '138' as source_pid, 138 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '138' AND visit_start_date = '2012-12-30' AND visit_end_date = '2012-12-31') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.3 service in inpatient_services with revcode of 0450, visit classified as ER [Test ID: 82]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 82 AS id, '16.3 service in inpatient_services with revcode of 0450, visit classified as ER' AS description, 'Expect visit_occurrence' AS test, '140' as source_pid, 140 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '140' AND visit_concept_id = '9203' AND visit_start_date = '2012-04-12' AND visit_end_date = '2012-04-12') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.4 service in outpatient_services with revcode of 0450, visit classified as ER [Test ID: 83]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 83 AS id, '16.4 service in outpatient_services with revcode of 0450, visit classified as ER' AS description, 'Expect visit_occurrence' AS test, '142' as source_pid, 142 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '142' AND visit_concept_id = '9203' AND visit_start_date = '2012-05-01' AND visit_end_date = '2012-05-01') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.5 service in outpatient_services with revcode of 0100, visit classified as IP [Test ID: 84]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 84 AS id, '16.5 service in outpatient_services with revcode of 0100, visit classified as IP' AS description, 'Expect visit_occurrence' AS test, '144' as source_pid, 144 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '144' AND visit_concept_id = '9201' AND visit_start_date = '2012-10-17' AND visit_end_date = '2012-10-20') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.6 patient has two lines in the inpatient_services table where the end_date of one line and the start_date of the next >1, two visits created [Test ID: 85]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 85 AS id, '16.6 patient has two lines in the inpatient_services table where the end_date of one line and the start_date of the next >1, two visits created' AS description, 'Expect visit_occurrence' AS test, '146' as source_pid, 146 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '146' AND visit_start_date = '2012-08-08' AND visit_end_date = '2012-08-12') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 85 AS id, '16.6 patient has two lines in the inpatient_services table where the end_date of one line and the start_date of the next >1, two visits created' AS description, 'Expect visit_occurrence' AS test, '146' as source_pid, 146 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '146' AND visit_start_date = '2012-10-01' AND visit_end_date = '2012-10-05') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.7 Patient has an ER record that starts and ends on the first day of the IP visit, separate ER visit created [Test ID: 86]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 86 AS id, '16.7 Patient has an ER record that starts and ends on the first day of the IP visit, separate ER visit created' AS description, 'Expect visit_occurrence' AS test, '148' as source_pid, 148 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '148' AND visit_concept_id = '9203' AND visit_start_date = '2012-09-03' AND visit_end_date = '2012-09-03') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 86 AS id, '16.7 Patient has an ER record that starts and ends on the first day of the IP visit, separate ER visit created' AS description, 'Expect visit_occurrence' AS test, '148' as source_pid, 148 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '148' AND visit_concept_id = '9201' AND visit_start_date = '2012-09-03' AND visit_end_date = '2012-09-10') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.8 Patient has two lines in the inpatient_services table where the difference between the end_date of one line and the start_date of the next is <= 1, one visit created [Test ID: 87]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 87 AS id, '16.8 Patient has two lines in the inpatient_services table where the difference between the end_date of one line and the start_date of the next is <= 1, one visit created' AS description, 'Expect visit_occurrence' AS test, '150' as source_pid, 150 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '150') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.9 Patient has record in outpatient_services table but no rx benefits, visit dropped [Test ID: 88]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 88 AS id, '16.9 Patient has record in outpatient_services table but no rx benefits, visit dropped' AS description, 'Expect visit_occurrence' AS test, '152' as source_pid, 152 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE visit_occurrence_id = '152') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.10 Patient has two records in the same visit with different prov_id and provstd [Test ID: 89]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 89 AS id, '16.10 Patient has two records in the same visit with different prov_id and provstd' AS description, 'Expect visit_occurrence' AS test, '154' as source_pid, 154 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '154' AND visit_start_date = '2012-08-08' AND visit_end_date = '2012-08-12') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.11 Patient has two LTC claims where the end_date of the first is within one day of the start_date of the second, one visit created [Test ID: 90]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 90 AS id, '16.11 Patient has two LTC claims where the end_date of the first is within one day of the start_date of the second, one visit created' AS description, 'Expect visit_occurrence' AS test, '158' as source_pid, 158 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '158' AND visit_start_date = '2012-06-18' AND visit_end_date = '2012-07-31') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
--
-- 16.12 Patient has LTC claim where the end_date = the start_date [Test ID: 91]
--
INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT 91 AS id, '16.12 Patient has LTC claim where the end_date = the start_date' AS description, 'Expect visit_occurrence' AS test, '160' as source_pid, 160 as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE person_id = '160' AND visit_start_date = '2012-08-01' AND visit_end_date = '2012-08-31') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;