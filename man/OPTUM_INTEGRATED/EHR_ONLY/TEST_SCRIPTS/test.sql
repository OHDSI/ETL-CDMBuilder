DROP TABLE IF EXISTS  scratch_cdm_results.test_results;

CREATE TABLE scratch_cdm_results.test_results (id INT, description VARCHAR(512), test VARCHAR(256), status VARCHAR(5));


-- 1. Condition Occurrence

/*--*/
/* 1.0 Diagnosis without ''Diagnosis of'' status is not loaded [Test ID: 1] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 1 AS id, '1.0 Diagnosis without ''Diagnosis of'' status is not loaded' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.condition_occurrence WHERE person_id = '1') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 1.1 Test diag_date to condition_start_date [Test ID: 2] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 2 AS id, '1.1 Test diag_date to condition_start_date' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.condition_occurrence WHERE person_id = '3' AND condition_start_date = '01/01/2009') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 1.2 Test diagnosis code type ICD9 [Test ID: 3] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 3 AS id, '1.2 Test diagnosis code type ICD9' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.condition_occurrence WHERE person_id = '5' AND condition_concept_id = '141095' AND condition_source_value = '7061') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 1.3 Test diagnosis code type ICD10 [Test ID: 4] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 4 AS id, '1.3 Test diagnosis code type ICD10' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.condition_occurrence WHERE person_id = '7' AND condition_concept_id = '4008081' AND condition_source_value = 'B23.0') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 1.4 Test primary diagnosis to condition_type_concept_id [Test ID: 5] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 5 AS id, '1.4 Test primary diagnosis to condition_type_concept_id' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.condition_occurrence WHERE person_id = '9' AND condition_type_concept_id = '44786627') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 1.5 Test non-primary diagnosis to condition_type_concept_id [Test ID: 6] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 6 AS id, '1.5 Test non-primary diagnosis to condition_type_concept_id' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.condition_occurrence WHERE person_id = '11' AND condition_type_concept_id = '44786629') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 1.6 Test HCPCS derived condition coming from procedure table [Test ID: 7] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 7 AS id, '1.6 Test HCPCS derived condition coming from procedure table' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.condition_occurrence WHERE person_id = '13' AND condition_concept_id = '312327') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 1.7 Patient has PROCEDURE record; validate the provider for the encid is mapped to provid [Test ID: 8] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 8 AS id, '1.7 Patient has PROCEDURE record; validate the provider for the encid is mapped to provid' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.condition_occurrence WHERE person_id = '15' AND provider_id = '17') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 1.8 Patient has PROCEDURE record; validate the provider for the encid is mapped to provid [Test ID: 9] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 9 AS id, '1.8 Patient has PROCEDURE record; validate the provider for the encid is mapped to provid' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.condition_occurrence WHERE person_id = '18' AND provider_id = '20' AND visit_occurrence_id = '19') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 2. Death

/*--*/
/* 2.0 Patient is indicated dead by date_of_death. Their death date is the last day of the month. [Test ID: 10] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 10 AS id, '2.0 Patient is indicated dead by date_of_death. Their death date is the last day of the month.' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '22' AND death_date = '04/30/2014') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.1 Patient has care_area data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 11] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 11 AS id, '2.1 Patient has care_area data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '24') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.2 Patient has diagnosis data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 12] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 12 AS id, '2.2 Patient has diagnosis data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '27') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.3 Patient has encounter data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 13] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 13 AS id, '2.3 Patient has encounter data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '30') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.4 Patient has immunization data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 14] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 14 AS id, '2.4 Patient has immunization data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '33') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.5 Patient has insurance data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 15] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 15 AS id, '2.5 Patient has insurance data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '36') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.6 Patient has labs data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 16] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 16 AS id, '2.6 Patient has labs data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '39') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.7 Patient has medication_administrations data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 17] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 17 AS id, '2.7 Patient has medication_administrations data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '42') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.8 Patient has microbiology data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 18] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 18 AS id, '2.8 Patient has microbiology data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '45') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.9 Patient has nlp_biomarker data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 19] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 19 AS id, '2.9 Patient has nlp_biomarker data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '48') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.10 Patient has nlp_drug_rationale data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 20] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 20 AS id, '2.10 Patient has nlp_drug_rationale data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '51') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.11 Patient has nlp_measurements data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 21] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 21 AS id, '2.11 Patient has nlp_measurements data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '54') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.12 Patient has nlp_sds data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 22] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 22 AS id, '2.12 Patient has nlp_sds data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '57') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.13 Patient has nlp_sds_family data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 23] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 23 AS id, '2.13 Patient has nlp_sds_family data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '60') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.14 Patient has observations data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 24] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 24 AS id, '2.14 Patient has observations data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '63') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.15 Patient has patient_reported_meds data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 25] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 25 AS id, '2.15 Patient has patient_reported_meds data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '66') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.16 Patient has prescriptions_written data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 26] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 26 AS id, '2.16 Patient has prescriptions_written data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '69') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.17 Patient has procedure data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 27] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 27 AS id, '2.17 Patient has procedure data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '72') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.18 Patient has visit data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 28] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 28 AS id, '2.18 Patient has visit data occurring data occurring exactly 30 days after death event. Expected result: dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '75') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.19 Patient has care_area data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 29] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 29 AS id, '2.19 Patient has care_area data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '78') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.20 Patient has diagnosis data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 30] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 30 AS id, '2.20 Patient has diagnosis data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '81') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.21 Patient has encounter data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 31] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 31 AS id, '2.21 Patient has encounter data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '84') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.22 Patient has immunization data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 32] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 32 AS id, '2.22 Patient has immunization data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '87') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.23 Patient has insurance data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 33] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 33 AS id, '2.23 Patient has insurance data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '90') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.24 Patient has labs data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 34] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 34 AS id, '2.24 Patient has labs data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '93') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.25 Patient has medication_administrations data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 35] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 35 AS id, '2.25 Patient has medication_administrations data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '96') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.26 Patient has microbiology data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 36] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 36 AS id, '2.26 Patient has microbiology data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '99') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.27 Patient has nlp_biomarker data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 37] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 37 AS id, '2.27 Patient has nlp_biomarker data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '102') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.28 Patient has nlp_drug_rationale data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 38] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 38 AS id, '2.28 Patient has nlp_drug_rationale data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '105') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.29 Patient has nlp_measurements data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 39] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 39 AS id, '2.29 Patient has nlp_measurements data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '108') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.30 Patient has nlp_sds data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 40] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 40 AS id, '2.30 Patient has nlp_sds data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '111') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.31 Patient has nlp_sds_family data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 41] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 41 AS id, '2.31 Patient has nlp_sds_family data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '114') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.32 Patient has observations data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 42] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 42 AS id, '2.32 Patient has observations data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '117') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.33 Patient has patient_reported_meds data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 43] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 43 AS id, '2.33 Patient has patient_reported_meds data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '120') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.34 Patient has prescriptions_written data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 44] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 44 AS id, '2.34 Patient has prescriptions_written data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '123') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.35 Patient has procedure data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 45] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 45 AS id, '2.35 Patient has procedure data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '126') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 2.36 Patient has visit data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 46] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 46 AS id, '2.36 Patient has visit data occurring data occurring 60 days after death event. Expected result: not dead' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.death WHERE person_id = '129') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 3. Device Exposure

-- 4. Drug Exposure

/*--*/
/* 4.0 Patient has 1 valid MEDICATION_ADMINISTRATIONS record within the enrollment period. [Test ID: 47] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 47 AS id, '4.0 Patient has 1 valid MEDICATION_ADMINISTRATIONS record within the enrollment period.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '132' AND drug_exposure_start_date = '2011-01-07' AND drug_source_value = '55111067101' AND drug_type_concept_id = '38000180') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.1 Patient has 2 MEDICATION_ADMINISTRATIONS records, the first within the enrollment period, the second outside of enrollment. [Test ID: 48] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 48 AS id, '4.1 Patient has 2 MEDICATION_ADMINISTRATIONS records, the first within the enrollment period, the second outside of enrollment.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '134' AND drug_source_value = '55111067101') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;
insert into scratch_cdm_results.test_results SELECT 48 AS id, '4.1 Patient has 2 MEDICATION_ADMINISTRATIONS records, the first within the enrollment period, the second outside of enrollment.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '134' AND drug_source_value = '58487000102') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.2 Patient has multiple MEDICATION_ADMINISTRATIONS records, all within enrollment period, but have the same encounter_id, ndc and order_date. [Test ID: 49] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 49 AS id, '4.2 Patient has multiple MEDICATION_ADMINISTRATIONS records, all within enrollment period, but have the same encounter_id, ndc and order_date.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '136' AND drug_exposure_start_date = '2013-01-07' AND drug_source_value = '55111067101' AND visit_occurrence_id = '137') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.3 Patient has multiple MEDICATION_ADMINISTRATIONS records, all within enrollment period, that have the same ndc on the same day, but different encounters which should be collapsed. [Test ID: 50] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 50 AS id, '4.3 Patient has multiple MEDICATION_ADMINISTRATIONS records, all within enrollment period, that have the same ndc on the same day, but different encounters which should be collapsed.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '138') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.4 Patient has series of MEDICATION_ADMINISTRATIONS with the same encounter_id, but different order_date [Test ID: 51] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 51 AS id, '4.4 Patient has series of MEDICATION_ADMINISTRATIONS with the same encounter_id, but different order_date' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '141') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.5 Patient has MEDICATION_ADMINISTRATIONS with provid that is NULL but the encounter has a valid provider id specified [Test ID: 52] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 52 AS id, '4.5 Patient has MEDICATION_ADMINISTRATIONS with provid that is NULL but the encounter has a valid provider id specified' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '143' AND drug_exposure_start_date = '2012-01-08' AND provider_id = '1077416' AND visit_occurrence_id IS NULL) = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.6 Patient has MEDICATION_ADMINISTRATIONS with an NDC that is properly mapped to the source_concept_id and standard concept_id [Test ID: 53] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 53 AS id, '4.6 Patient has MEDICATION_ADMINISTRATIONS with an NDC that is properly mapped to the source_concept_id and standard concept_id' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '146' AND drug_concept_id = '1322189' AND drug_source_value = '55111067101' AND drug_source_concept_id = '45071548') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.7 Patient has MEDICATION_ADMINISTRATIONS with a valid quantity_of_dose [Test ID: 54] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 54 AS id, '4.7 Patient has MEDICATION_ADMINISTRATIONS with a valid quantity_of_dose' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '148' AND quantity = '.5') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.8 Patient has MEDICATION_ADMINISTRATIONS and the route value is found in the source-to-concept-map and assigned the proper concept_id [Test ID: 55] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 55 AS id, '4.8 Patient has MEDICATION_ADMINISTRATIONS and the route value is found in the source-to-concept-map and assigned the proper concept_id' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '150' AND route_concept_id = '4128794' AND route_source_value = 'Oral') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.9 Patient has MEDICATION_ADMINISTRATIONS and the route value is NOT found in the source-to-concept-map and assigned concept_id of 0 [Test ID: 56] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 56 AS id, '4.9 Patient has MEDICATION_ADMINISTRATIONS and the route value is NOT found in the source-to-concept-map and assigned concept_id of 0' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '152' AND route_concept_id = '0' AND route_source_value = 'Osmosis') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.10 Patient has MEDICATION_ADMINISTRATIONS with a strength_unit that maps to dose_unit_source_value [Test ID: 57] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 57 AS id, '4.10 Patient has MEDICATION_ADMINISTRATIONS with a strength_unit that maps to dose_unit_source_value' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '154' AND dose_unit_source_value = 'mg/mL') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.11 Patient has PRESCRIPTIONS_WRITTEN with valid information [Test ID: 58] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 58 AS id, '4.11 Patient has PRESCRIPTIONS_WRITTEN with valid information' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '156' AND drug_type_concept_id = '38000177') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.12 Patient has multiple PRESCRIPTIONS_WRITTEN with the first within the enrollment period, the second outside of enrollment. [Test ID: 59] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 59 AS id, '4.12 Patient has multiple PRESCRIPTIONS_WRITTEN with the first within the enrollment period, the second outside of enrollment.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '157') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.13 Patient has multiple PRESCRIPTIONS_WRITTEN records, all within enrollment period, but have the same rxdate and ndc which should be collapsed. [Test ID: 60] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 60 AS id, '4.13 Patient has multiple PRESCRIPTIONS_WRITTEN records, all within enrollment period, but have the same rxdate and ndc which should be collapsed.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '158') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.14 Patient has PRESCRIPTIONS_WRITTEN and the NDC is properly mapped to the source_concept_id and standard concept_id [Test ID: 61] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 61 AS id, '4.14 Patient has PRESCRIPTIONS_WRITTEN and the NDC is properly mapped to the source_concept_id and standard concept_id' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '159' AND drug_concept_id = '1322189' AND drug_source_value = '55111067101' AND drug_source_concept_id = '45071548') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.15 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains non-numeric values [Test ID: 62] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 62 AS id, '4.15 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains non-numeric values' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '160' AND quantity = '90') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.16 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains only numerics [Test ID: 63] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 63 AS id, '4.16 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains only numerics' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '161' AND quantity = '90') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.17 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains NULL AND quantity_of_dose is NOT NULL [Test ID: 64] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 64 AS id, '4.17 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains NULL AND quantity_of_dose is NOT NULL' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '162' AND quantity = '1') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.18 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains NULL AND quantity_of_dose is NOT NULL with text [Test ID: 65] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 65 AS id, '4.18 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains NULL AND quantity_of_dose is NOT NULL with text' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '163' AND quantity = '1') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.19 Patient has PRESCRIPTIONS_WRITTEN with num_refils that contains only numerics [Test ID: 66] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 66 AS id, '4.19 Patient has PRESCRIPTIONS_WRITTEN with num_refils that contains only numerics' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '164' AND refills = '0') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.20 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains an empty value [Test ID: 67] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 67 AS id, '4.20 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains an empty value' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '165' AND refills = '0') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.21 Patient has PRESCRIPTIONS_WRITTEN with days_supply that contains only numerics [Test ID: 68] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 68 AS id, '4.21 Patient has PRESCRIPTIONS_WRITTEN with days_supply that contains only numerics' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '166' AND days_supply = '1') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.22 Patient has PRESCRIPTIONS_WRITTEN with days_supply that contains an empty value [Test ID: 69] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 69 AS id, '4.22 Patient has PRESCRIPTIONS_WRITTEN with days_supply that contains an empty value' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '167' AND days_supply IS NULL) = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.23 Patient has PRESCRIPTIONS_WRITTEN with provid specified [Test ID: 70] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 70 AS id, '4.23 Patient has PRESCRIPTIONS_WRITTEN with provid specified' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '168' AND provider_id = '843801') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.24 Patient has PRESCRIPTIONS_WRITTEN with a route that is specified in the route source-to-concept map. [Test ID: 71] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 71 AS id, '4.24 Patient has PRESCRIPTIONS_WRITTEN with a route that is specified in the route source-to-concept map.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '169' AND route_concept_id = '0' AND route_source_value = 'Oral') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.25 Patient has PRESCRIPTIONS_WRITTEN with strength + strength_unit + dosefreq + dosage_form that should be concatenated [Test ID: 72] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 72 AS id, '4.25 Patient has PRESCRIPTIONS_WRITTEN with strength + strength_unit + dosefreq + dosage_form that should be concatenated' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '170' AND dose_unit_source_value = '20-25;15 MG;1 time a day;Capsule Delayed Release') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.26 Patient has PATIENT_REPORTED_MEDS with valid information [Test ID: 73] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 73 AS id, '4.26 Patient has PATIENT_REPORTED_MEDS with valid information' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '171') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.27 Patient has multiple PATIENT_REPORTED_MEDS with the first within the enrollment period, the second outside of enrollment. [Test ID: 74] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 74 AS id, '4.27 Patient has multiple PATIENT_REPORTED_MEDS with the first within the enrollment period, the second outside of enrollment.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '172') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.28 Patient has multiple PATIENT_REPORTED_MEDS records, all within enrollment period, but have the same reported_date and ndc which should be collapsed. [Test ID: 75] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 75 AS id, '4.28 Patient has multiple PATIENT_REPORTED_MEDS records, all within enrollment period, but have the same reported_date and ndc which should be collapsed.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '173') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.29 Patient has PATIENT_REPORTED_MEDS with valid reported_date and drug_type_concept_id [Test ID: 76] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 76 AS id, '4.29 Patient has PATIENT_REPORTED_MEDS with valid reported_date and drug_type_concept_id' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '174' AND drug_exposure_start_date = '01-08-2012' AND drug_type_concept_id = '44787730') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.30 Patient has PRESCRIPTIONS_WRITTEN and the NDC is properly mapped to the source_concept_id and standard concept_id [Test ID: 77] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 77 AS id, '4.30 Patient has PRESCRIPTIONS_WRITTEN and the NDC is properly mapped to the source_concept_id and standard concept_id' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '175' AND drug_concept_id = '1322189' AND drug_source_value = '55111067101' AND drug_source_concept_id = '45071548') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.31 Patient has PATIENT_REPORTED_MEDS with provid mapped [Test ID: 78] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 78 AS id, '4.31 Patient has PATIENT_REPORTED_MEDS with provid mapped' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '176' AND provider_id = '179865') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.32 Patient has PATIENT_REPORTED_MEDS with a route that is specified in the route source-to-concept map. [Test ID: 79] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 79 AS id, '4.32 Patient has PATIENT_REPORTED_MEDS with a route that is specified in the route source-to-concept map.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '177' AND route_concept_id = '0' AND route_source_value = 'Oral') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.33 Patient has PATIENT_REPORTED_MEDS with a quantity_of_dose that maps to quantity. [Test ID: 80] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 80 AS id, '4.33 Patient has PATIENT_REPORTED_MEDS with a quantity_of_dose that maps to quantity.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '178' AND route_concept_id = '0' AND quantity = '6') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.34 Patient has IMMUNIZATION with valid information [Test ID: 81] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 81 AS id, '4.34 Patient has IMMUNIZATION with valid information' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '179') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.35 Patient has multiple IMMUNIZATION with the first within the enrollment period, the second outside of enrollment. [Test ID: 82] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 82 AS id, '4.35 Patient has multiple IMMUNIZATION with the first within the enrollment period, the second outside of enrollment.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '180') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.36 Patient has multiple IMMUNIZATION records, all within enrollment period, but have the same immunization_date and ndc which should be collapsed. [Test ID: 83] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 83 AS id, '4.36 Patient has multiple IMMUNIZATION records, all within enrollment period, but have the same immunization_date and ndc which should be collapsed.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '181') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.37 Patient has IMMUNIZATION with immunization_date that is NULL [Test ID: 84] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 84 AS id, '4.37 Patient has IMMUNIZATION with immunization_date that is NULL' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '182') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.38 Patient has IMMUNIZATION with pt_reported =''Y'' [Test ID: 85] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 85 AS id, '4.38 Patient has IMMUNIZATION with pt_reported =''Y''' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '183') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.39 Patient has IMMUNIZATION and the NDC is properly mapped to the source_concept_id and standard concept_id [Test ID: 86] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 86 AS id, '4.39 Patient has IMMUNIZATION and the NDC is properly mapped to the source_concept_id and standard concept_id' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '184' AND drug_concept_id = '44818419' AND drug_source_value = '66521011710' AND drug_source_concept_id = '46255929') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.40 Patient has IMMUNIZATION with pt_reported =''N'' with a valid drug_type_concept_id [Test ID: 87] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 87 AS id, '4.40 Patient has IMMUNIZATION with pt_reported =''N'' with a valid drug_type_concept_id' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '185' AND drug_type_concept_id = '43542358') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.41 Procedure has PROC_CODE that is a drug with valid information and valid drug_type_concept_id [Test ID: 88] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 88 AS id, '4.41 Procedure has PROC_CODE that is a drug with valid information and valid drug_type_concept_id' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '186' AND drug_type_concept_id = '38000275') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.42 Patient has multiple PROCEDURE records with the first within the enrollment period, the second outside of enrollment. [Test ID: 89] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 89 AS id, '4.42 Patient has multiple PROCEDURE records with the first within the enrollment period, the second outside of enrollment.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '187') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.43 Patient has multiple PROCEDURE records, all within enrollment period, but have the same PROC_DATE and proc_code which should be collapsed. [Test ID: 90] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 90 AS id, '4.43 Patient has multiple PROCEDURE records, all within enrollment period, but have the same PROC_DATE and proc_code which should be collapsed.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '188') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.44 Patient has PROCEDURE with HCPCS proc_code that maps to a standard concept [Test ID: 91] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 91 AS id, '4.44 Patient has PROCEDURE with HCPCS proc_code that maps to a standard concept' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '189' AND drug_concept_id = '	46275076' AND drug_source_value = 'J9310' AND drug_source_concept_id = '2718907') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.45 Patient has PROCEDURE with provid_perform that maps to provid [Test ID: 92] */
/*--*/

/*--*/
/* 4.46 Patient has PROCEDURE with encid that maps to visit_occurrence_id [Test ID: 93] */
/*--*/

/*--*/
/* 4.47 NLP_DRUG_RATIONALE has valid note_date and other valid information with a valid drug_type_concept_id [Test ID: 94] */
/*--*/

/*--*/
/* 4.48 Patient has multiple NLP_DRUG_RATIONALE records with the first within the enrollment period, the second outside of enrollment. [Test ID: 95] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 95 AS id, '4.48 Patient has multiple NLP_DRUG_RATIONALE records with the first within the enrollment period, the second outside of enrollment.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '193') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.49 Patient has multiple NLP_DRUG_RATIONALE records, all within enrollment period, but have the same note_date and drug_name which should be collapsed. [Test ID: 96] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 96 AS id, '4.49 Patient has multiple NLP_DRUG_RATIONALE records, all within enrollment period, but have the same note_date and drug_name which should be collapsed.' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.drug_exposure WHERE person_id = '194') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 4.50 NLP_DRUG_RATIONALE has reason_general that maps to stop_reason  [Test ID: 97] */
/*--*/

/*--*/
/* 4.51 NLP_DRUG_RATIONALE has valid note_date and drug_name that maps based on the source-to-concept-map [Test ID: 98] */
/*--*/

/*--*/
/* 4.52 NLP_DRUG_RATIONALE has reason_general that maps to stop_reason  [Test ID: 99] */
/*--*/

/*--*/
/* 4.53 NLP_DRUG_RATIONALE has encid that maps to visit_occurrence_id  [Test ID: 100] */
/*--*/

-- 5. Location

/*--*/
/* 5.0 Simple Location [Test ID: 101] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 101 AS id, '5.0 Simple Location' AS description, 'Expect location' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.location WHERE location_source_value = 'REGION_DIVISION') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 5.1 No Location Dupes [Test ID: 102] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 102 AS id, '5.1 No Location Dupes' AS description, 'Expect location' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.location WHERE location_source_value = 'DUPE_REGION_DUPE_DIVISION') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 6. Measurement

-- 7. Observation Period

/*--*/
/* 7.0 Tests if 2 patient durations (where second is subsumed by the first) results in a single observation period [Test ID: 103] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 103 AS id, '7.0 Tests if 2 patient durations (where second is subsumed by the first) results in a single observation period' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation_period WHERE person_id = '202') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 7.1 Tests if 2 patient durations (where second is within 30 days of first) results in a single observation period [Test ID: 104] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 104 AS id, '7.1 Tests if 2 patient durations (where second is within 30 days of first) results in a single observation period' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation_period WHERE person_id = '203') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 7.2 Tests if 2 patient durations (where second starts 33 days after first) results in two observation periods [Test ID: 105] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 105 AS id, '7.2 Tests if 2 patient durations (where second starts 33 days after first) results in two observation periods' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation_period WHERE person_id = '204') != 2 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 7.3 Invalid patient duration [Test ID: 106] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 106 AS id, '7.3 Invalid patient duration' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation_period WHERE person_id = '205') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 7.4 Patient duration is 1 month [Test ID: 107] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 107 AS id, '7.4 Patient duration is 1 month' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation_period WHERE person_id = '206') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 8. Observation

/*--*/
/* 8.0 Patient has 1 valid OBSERVATIONS record within the enrollment period. Validate that the obs_date maps to the observation_date field properly. [Test ID: 108] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 108 AS id, '8.0 Patient has 1 valid OBSERVATIONS record within the enrollment period. Validate that the obs_date maps to the observation_date field properly.' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '207' AND observation_date = '01/01/2009') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.1 Patient has 2 OBSERVATIONS records, the first within the enrollment period, the second outside of enrollment. [Test ID: 109] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 109 AS id, '8.1 Patient has 2 OBSERVATIONS records, the first within the enrollment period, the second outside of enrollment.' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '209') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.2 Patient has multiple OBSERVATIONS records, all within enrollment period [Test ID: 110] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 110 AS id, '8.2 Patient has multiple OBSERVATIONS records, all within enrollment period' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '211') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.3 Patient has OBSERVATIONS record; validate the encid mapping to visit_occurrence_id [Test ID: 111] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 111 AS id, '8.3 Patient has OBSERVATIONS record; validate the encid mapping to visit_occurrence_id' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.visit_occurrence WHERE visit_occurrence_id = '214' AND person_id = '213') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.4 Patient has OBSERVATIONS record; validate the obs_type mapping found in the STCM to observation_concept_id [Test ID: 112] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 112 AS id, '8.4 Patient has OBSERVATIONS record; validate the obs_type mapping found in the STCM to observation_concept_id' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '215' AND observation_concept_id = '40766362') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.5 Patient has OBSERVATIONS record; validate the obs_type mapping NOT found in the STCM maps to observation_concept_id = 0 [Test ID: 113] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 113 AS id, '8.5 Patient has OBSERVATIONS record; validate the obs_type mapping NOT found in the STCM maps to observation_concept_id = 0' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '217' AND observation_concept_id = '0') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.6 Patient has OBSERVATIONS record; validate the observation_type_concept_id is populated correctly [Test ID: 114] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 114 AS id, '8.6 Patient has OBSERVATIONS record; validate the observation_type_concept_id is populated correctly' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '219' AND observation_type_concept_id = '38000280') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.7 Patient has OBSERVATIONS record; validate the obs_time is mapped to observation_time [Test ID: 115] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 115 AS id, '8.7 Patient has OBSERVATIONS record; validate the obs_time is mapped to observation_time' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '221' AND observation_time = '14:30:00') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.8 Patient has OBSERVATIONS record; validate the obs_result is mapped to value_as_number when obs_result can be cast to a numeric [Test ID: 116] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 116 AS id, '8.8 Patient has OBSERVATIONS record; validate the obs_result is mapped to value_as_number when obs_result can be cast to a numeric' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '223' AND value_as_number = '100' AND value_as_string IS NULL) = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.9 Patient has OBSERVATIONS record; validate the obs_result is mapped to value_as_string when obs_result CANNOT be cast to a numeric [Test ID: 117] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 117 AS id, '8.9 Patient has OBSERVATIONS record; validate the obs_result is mapped to value_as_string when obs_result CANNOT be cast to a numeric' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '225' AND value_as_number IS NULL AND value_as_string = 'One Hundred') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.10 Patient has OBSERVATIONS record; validate the obs_unit is mapped to unit_source_value AND a valid unit_concept_id when it matches a concept in the UCUM vocabulary [Test ID: 118] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 118 AS id, '8.10 Patient has OBSERVATIONS record; validate the obs_unit is mapped to unit_source_value AND a valid unit_concept_id when it matches a concept in the UCUM vocabulary' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '227' AND unit_concept_id = '9529' AND unit_source_value = 'kilogram') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.11 Patient has OBSERVATIONS record; validate the obs_unit is mapped to unit_source_value AND unit_concept_id = 0 when it matches a concept in the UCUM vocabulary [Test ID: 119] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 119 AS id, '8.11 Patient has OBSERVATIONS record; validate the obs_unit is mapped to unit_source_value AND unit_concept_id = 0 when it matches a concept in the UCUM vocabulary' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '229' AND unit_concept_id = '0' AND unit_source_value = 'kg') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.12 Patient has 1 valid NLP_SDS_FAMILY record within the enrollment period. Validate that the note_date maps to the observation_date field properly. [Test ID: 120] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 120 AS id, '8.12 Patient has 1 valid NLP_SDS_FAMILY record within the enrollment period. Validate that the note_date maps to the observation_date field properly.' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '231' AND observation_date = '01/01/2009') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.13 Patient has 2 NLP_SDS_FAMILY records, the first within the enrollment period, the second outside of enrollment. [Test ID: 121] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 121 AS id, '8.13 Patient has 2 NLP_SDS_FAMILY records, the first within the enrollment period, the second outside of enrollment.' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '233') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.14 Patient has NLP_SDS_FAMILY record; validate the encid mapping to visit_occurrence_id [Test ID: 122] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 122 AS id, '8.14 Patient has NLP_SDS_FAMILY record; validate the encid mapping to visit_occurrence_id' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '235' AND visit_occurrence_id = '236') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.15 Patient has NLP_SDS_FAMILY record; validate the provider for the encid is mapped to provid [Test ID: 123] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 123 AS id, '8.15 Patient has NLP_SDS_FAMILY record; validate the provider for the encid is mapped to provid' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '237' AND provider_id = '239') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.16 Patient has NLP_SDS_FAMILY record; validate the observation_type_concept_id is populated correctly [Test ID: 124] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 124 AS id, '8.16 Patient has NLP_SDS_FAMILY record; validate the observation_type_concept_id is populated correctly' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '240' AND observation_type_concept_id = '38000280') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.17 Patient has NLP_SDS_FAMILY record; validate the sds_term is mapped to observation_source_value [Test ID: 125] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 125 AS id, '8.17 Patient has NLP_SDS_FAMILY record; validate the sds_term is mapped to observation_source_value' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '242' AND observation_source_value = 'cancer') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.18 Patient has NLP_SDS_FAMILY record; validate sds_term, sds_location, sds_family_member,
              sds_sentiment is mapped to value_as_string with semi-colon delimiter [Test ID: 126] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 126 AS id, '8.18 Patient has NLP_SDS_FAMILY record; validate sds_term, sds_location, sds_family_member,
              sds_sentiment is mapped to value_as_string with semi-colon delimiter' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '244' AND observation_source_value = 'cancer;prostate;who=family;negative') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.19 Patient has 1 valid NLP_SDS record within the enrollment period. Validate that the note_date maps to the observation_date field properly. [Test ID: 127] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 127 AS id, '8.19 Patient has 1 valid NLP_SDS record within the enrollment period. Validate that the note_date maps to the observation_date field properly.' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '246' AND observation_date = '01/01/2009') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.20 Patient has 2 NLP_SDS records, the first within the enrollment period, the second outside of enrollment. [Test ID: 128] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 128 AS id, '8.20 Patient has 2 NLP_SDS records, the first within the enrollment period, the second outside of enrollment.' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '248') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.21 Patient has NLP_SDS record; validate the encid mapping to visit_occurrence_id [Test ID: 129] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 129 AS id, '8.21 Patient has NLP_SDS record; validate the encid mapping to visit_occurrence_id' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '250' AND visit_occurrence_id = '251') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.22 Patient has NLP_SDS record; validate the provider for the encid is mapped to provid [Test ID: 130] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 130 AS id, '8.22 Patient has NLP_SDS record; validate the provider for the encid is mapped to provid' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '252' AND provider_id = '254') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.23 Patient has NLP_SDS record; validate the observation_type_concept_id is populated correctly [Test ID: 131] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 131 AS id, '8.23 Patient has NLP_SDS record; validate the observation_type_concept_id is populated correctly' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.observation WHERE person_id = '255' AND observation_type_concept_id = '38000280') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 8.24 Patient has NLP_SDS record; validate the sds_term is mapped to observation_concept_id using STCM [Test ID: 132] */
/*--*/

/*--*/
/* 8.25 Patient has NLP_SDS record; validate the sds_term is mapped to observation_source_value using STCM [Test ID: 133] */
/*--*/

/*--*/
/* 8.26 Patient has NLP_SDS record; validate sds_term, sds_location, sds_family_member, sds_sentiment is mapped to value_as_string with semi-colon delimiter [Test ID: 134] */
/*--*/

/*--*/
/* 8.27 Patient has 1 valid DIAGNOSIS record within the enrollment period. Validate that the diag_date and diag_time maps to the observation_date and observation_time fields properly. [Test ID: 135] */
/*--*/

/*--*/
/* 8.28 Patient has 2 DIAGNOSIS records, the first within the enrollment period, the second outside of enrollment. [Test ID: 136] */
/*--*/

/*--*/
/* 8.29 Patient has DIAGNOSIS record; validate that the diagnosis_cd_type = ICD10, diagnosis_cd = R42 maps to a valid observation_concept_id = 433316, observation_source_value =	R42 and observation_source_concept_id = 45568132 [Test ID: 137] */
/*--*/

/*--*/
/* 8.30 Patient has DIAGNOSIS record; validate that the diagnosis_cd_type = CIEL, diagnosis_cd = 6011 maps to observation_concept_id = 0, observation_source_value = 6011 and observation_source_concept_id = 45922786 [Test ID: 138] */
/*--*/

/*--*/
/* 8.31 Patient has DIAGNOSIS record; validate the encid mapping to visit_occurrence_id [Test ID: 139] */
/*--*/

/*--*/
/* 8.32 Patient has DIAGNOSIS record; validate the provider for the encid is mapped to provid [Test ID: 140] */
/*--*/

/*--*/
/* 8.33 Patient has 1 valid PROCEDURE record within the enrollment period. Validate that the proc_date and proc_time maps to the observation_date and observation_time fields properly. [Test ID: 141] */
/*--*/

/*--*/
/* 8.34 Patient has 2 PROCEDURE records, the first within the enrollment period, the second outside of enrollment. [Test ID: 142] */
/*--*/

/*--*/
/* 8.35 Patient has PROCEDURE record; validate that the proc_cd_type = ICD10, proc_code = R42 maps to a valid observation_concept_id = 433316, observation_source_value = R42 and observation_source_concept_id = 45568132 [Test ID: 143] */
/*--*/

/*--*/
/* 8.36 Patient has PROCEDURE record; validate that the proc_cd_type = CIEL, diagnosis_cd = 6011 maps to observation_concept_id = 0, observation_source_value = 6011 and observation_source_concept_id = 45922786 [Test ID: 144] */
/*--*/

/*--*/
/* 8.37 Patient has PROCEDURE record; validate the encid mapping to visit_occurrence_id [Test ID: 145] */
/*--*/

/*--*/
/* 8.38 Patient has PROCEDURE record; validate the provider for the encid is mapped to provid [Test ID: 146] */
/*--*/

/*--*/
/* 8.39 Patient has 1 valid MICROBIOLOGY record within the enrollment period. Validate that the collect_date and collect_time maps to the observation_date and observation_time fields properly. [Test ID: 147] */
/*--*/

/*--*/
/* 8.40 Patient has 2 MICROBIOLOGY records, the first within the enrollment period, the second outside of enrollment. [Test ID: 148] */
/*--*/

/*--*/
/* 8.41 Patient has MICROBIOLOGY record; validate the encid mapping to visit_occurrence_id [Test ID: 149] */
/*--*/

/*--*/
/* 8.42 Patient has MICROBIOLOGY record; validate the provider for the encid is mapped to provid [Test ID: 150] */
/*--*/

/*--*/
/* 8.43 Patient has MICROBIOLOGY record; validate the organism is mapped to value_as_string and observation_source_value [Test ID: 151] */
/*--*/

/*--*/
/* 8.44 Patient has 1 valid NLP_BIOMARKER record within the enrollment period. Validate that the note_date maps to the observation_date properly. [Test ID: 152] */
/*--*/

/*--*/
/* 8.45 Patient has 2 NLP_BIOMARKER records, the first within the enrollment period, the second outside of enrollment. [Test ID: 153] */
/*--*/

/*--*/
/* 8.46 Patient has NLP_BIOMARKER record; ensure the biomarker field is valid and the newly mapped row has observation_concept_id = 0 and observation_source_value = 'BIOMARKER' and observation_source_concept_id = 0 [Test ID: 154] */
/*--*/

/*--*/
/* 8.47 Patient has NLP_BIOMARKER record; ensure the biomarker, variation_detail and biomarker_status fields are concatenated by a semi-colon in the value_as_string field [Test ID: 155] */
/*--*/

/*--*/
/* 8.48 Patient has 1 valid INSURANCE record within the enrollment period. Validate that the insurance_date maps to the observation_date field and insurance_time maps to the observation_time field. [Test ID: 156] */
/*--*/

/*--*/
/* 8.49 Patient has 2 INSURANCE records, the first within the enrollment period, the second outside of enrollment. [Test ID: 157] */
/*--*/

/*--*/
/* 8.50 Patient has INSURANCE record; ensure the ins_type field is valid and mapped row has value_as_string = ins_type, observation_concept_id = 45877222 (Insurance status/requirement) and and observation_source_concept_id = 0 [Test ID: 158] */
/*--*/

/*--*/
/* 8.51 Patient has INSURANCE record; validate the encid mapping to visit_occurrence_id [Test ID: 159] */
/*--*/

/*--*/
/* 8.52 Patient has INSURANCE record; validate the provider for the encid is mapped to provid [Test ID: 160] */
/*--*/

-- 9. Payer Plan Period

-- 10. Person

/*--*/
/* 10.0 Tests Unknown gender does not get loaded [Test ID: 161] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 161 AS id, '10.0 Tests Unknown gender does not get loaded' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '315') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.1 Tests Male gender [Test ID: 162] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 162 AS id, '10.1 Tests Male gender' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '316' AND gender_concept_id = '8507' AND year_of_birth = '1950') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.2 Tests Female gender [Test ID: 163] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 163 AS id, '10.2 Tests Female gender' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '317' AND gender_concept_id = '8532' AND year_of_birth = '1950') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.3 Tests Unknown birth year [Test ID: 164] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 164 AS id, '10.3 Tests Unknown birth year' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '318') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.4 Tests 1930 and earlier birth year [Test ID: 165] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 165 AS id, '10.4 Tests 1930 and earlier birth year' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '319' AND gender_concept_id = '8507' AND year_of_birth = '1930') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.5 Tests Asian race [Test ID: 166] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 166 AS id, '10.5 Tests Asian race' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '320' AND gender_concept_id = '8507' AND year_of_birth = '1950' AND race_concept_id = '8515' AND ethnicity_concept_id = '0') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.6 Tests African American race [Test ID: 167] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 167 AS id, '10.6 Tests African American race' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '321' AND gender_concept_id = '8507' AND year_of_birth = '1950' AND race_concept_id = '8516' AND ethnicity_concept_id = '0') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.7 Tests Caucasian race [Test ID: 168] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 168 AS id, '10.7 Tests Caucasian race' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '322' AND gender_concept_id = '8507' AND year_of_birth = '1950' AND race_concept_id = '8527' AND ethnicity_concept_id = '0') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.8 Tests Unknown race [Test ID: 169] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 169 AS id, '10.8 Tests Unknown race' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '323' AND gender_concept_id = '8507' AND year_of_birth = '1950' AND race_concept_id = '0' AND ethnicity_concept_id = '0') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.9 Tests Hispanic ethnicity, Asian race [Test ID: 170] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 170 AS id, '10.9 Tests Hispanic ethnicity, Asian race' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '324' AND gender_concept_id = '8507' AND year_of_birth = '1950' AND race_concept_id = '8515' AND ethnicity_concept_id = '38003563') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.10 Tests Hispanic ethnicity, African American race [Test ID: 171] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 171 AS id, '10.10 Tests Hispanic ethnicity, African American race' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '325' AND gender_concept_id = '8507' AND year_of_birth = '1950' AND race_concept_id = '8516' AND ethnicity_concept_id = '38003563') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.11 Tests Hispanic ethnicity, Caucasian race [Test ID: 172] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 172 AS id, '10.11 Tests Hispanic ethnicity, Caucasian race' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '326' AND gender_concept_id = '8507' AND year_of_birth = '1950' AND race_concept_id = '8527' AND ethnicity_concept_id = '38003563') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 10.12 Tests Hispanic ethnicity, unknown race [Test ID: 173] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 173 AS id, '10.12 Tests Hispanic ethnicity, unknown race' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.person WHERE person_id = '327' AND gender_concept_id = '8507' AND year_of_birth = '1950' AND race_concept_id = '0' AND ethnicity_concept_id = '38003563') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 11. Procedure Occurrence

/*--*/
/* 11.0 Tests procedure record with proc_code_type CPT4 [Test ID: 174] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 174 AS id, '11.0 Tests procedure record with proc_code_type CPT4' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '328' AND procedure_concept_id = '2108115' AND procedure_source_value = '36415') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.1 Tests procedure record with proc_code_type HCPCS [Test ID: 175] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 175 AS id, '11.1 Tests procedure record with proc_code_type HCPCS' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '330' AND procedure_concept_id = '915607' AND procedure_source_value = 'C9743') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.2 Tests procedure record with proc_code_type ICD9 [Test ID: 176] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 176 AS id, '11.2 Tests procedure record with proc_code_type ICD9' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '332' AND procedure_concept_id = '435868' AND procedure_source_value = '634.91') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.3 Tests procedure type concept [Test ID: 177] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 177 AS id, '11.3 Tests procedure type concept' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '334' AND procedure_type_concept_id = '38000275') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.4 Tests procedure record with proc_code_type of blank results in no record [Test ID: 178] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 178 AS id, '11.4 Tests procedure record with proc_code_type of blank results in no record' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '336') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.5 Tests procedure record with proc_code_type CUSTOM results in no record [Test ID: 179] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 179 AS id, '11.5 Tests procedure record with proc_code_type CUSTOM results in no record' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '338') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.6 Tests procedure record with proc_code_type REV results in no record [Test ID: 180] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 180 AS id, '11.6 Tests procedure record with proc_code_type REV results in no record' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '340') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.7 Tests procedure record with proc_code_type CLM_UNK results in no record [Test ID: 181] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 181 AS id, '11.7 Tests procedure record with proc_code_type CLM_UNK results in no record' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '342') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.8 Tests procedure type concept id from diagnosis record [Test ID: 182] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 182 AS id, '11.8 Tests procedure type concept id from diagnosis record' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '344' AND procedure_type_concept_id = '42865906') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.9 Diagnosis without ''Diagnosis of'' status is not loaded [Test ID: 183] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 183 AS id, '11.9 Diagnosis without ''Diagnosis of'' status is not loaded' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '346') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.10 Diagnosis record with diagnosis_cd_type ICD9 [Test ID: 184] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 184 AS id, '11.10 Diagnosis record with diagnosis_cd_type ICD9' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '348' AND procedure_concept_id = '435868' AND procedure_source_value = '634.91') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.11 Diagnosis record with diagnosis_cd_type ICD10 [Test ID: 185] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 185 AS id, '11.11 Diagnosis record with diagnosis_cd_type ICD10' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '350' AND procedure_concept_id = '43530939' AND procedure_source_value = 'O04.87') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.12 Diagnosis record with diagnosis_cd_type SNOMED [Test ID: 186] */
/*--*/
INSERT INTO scratch_cdm_results.test_results SELECT 186 AS id, '11.12 Diagnosis record with diagnosis_cd_type SNOMED' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '352' AND procedure_concept_id = '4001760' AND procedure_source_value = '10019001') = 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 11.13 Diagnosis record with blank diagnosis_cd_type [Test ID: 187] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 187 AS id, '11.13 Diagnosis record with blank diagnosis_cd_type' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.procedure_occurrence WHERE person_id = '354') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 12. Provider

/*--*/
/* 12.0 Simple Provider Mapping [Test ID: 188] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 188 AS id, '12.0 Simple Provider Mapping' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.provider WHERE specialty_concept_id = '38004456' AND provider_source_value = 'Internal Medicine' AND specialty_source_concept_id = '0') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 12.1 Dupe Provider Mapping [Test ID: 189] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 189 AS id, '12.1 Dupe Provider Mapping' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.provider WHERE specialty_concept_id = '38004453' AND provider_source_value = 'Family Medicine' AND specialty_source_concept_id = '0') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 12.2 Non-Primary specialty Mapping [Test ID: 190] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 190 AS id, '12.2 Non-Primary specialty Mapping' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.provider WHERE specialty_concept_id = '38004510' AND provider_source_value = 'Emergency Medicine' AND specialty_source_concept_id = '0') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

-- 13. Visit Occurrence

/*--*/
/* 13.0 Visit from Diagnosis Test [Test ID: 191] */
/*--*/
insert into scratch_cdm_results.test_results SELECT 191 AS id, '13.0 Visit from Diagnosis Test' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.visit_occurrence WHERE person_id = '359' AND visit_start_date = '2014-03-05' AND visit_end_date = '2014-03-10') != 1 THEN 'FAIL' ELSE 'PASS' END AS status;
insert into scratch_cdm_results.test_results SELECT 191 AS id, '13.0 Visit from Diagnosis Test' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.visit_occurrence WHERE person_id = '359' AND visit_start_date = '2014-03-06') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;
insert into scratch_cdm_results.test_results SELECT 191 AS id, '13.0 Visit from Diagnosis Test' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM scratch_cdm_results.visit_occurrence WHERE person_id = '359' AND visit_start_date = '2014-03-07') != 0 THEN 'FAIL' ELSE 'PASS' END AS status;

/*--*/
/* 13.1 Visit from Drug Exposure [Test ID: 192] */
/*--*/
