TRUNCATE TABLE scratch_cdm_testing.provider;
TRUNCATE TABLE scratch_cdm_testing.care_area;
TRUNCATE TABLE scratch_cdm_testing.patient;
TRUNCATE TABLE scratch_cdm_testing.encounter_provider;
TRUNCATE TABLE scratch_cdm_testing.visit;
TRUNCATE TABLE scratch_cdm_testing.encounter;
TRUNCATE TABLE scratch_cdm_testing.diagnosis;
TRUNCATE TABLE scratch_cdm_testing.nlp_sds;
TRUNCATE TABLE scratch_cdm_testing.nlp_sds_family;
TRUNCATE TABLE scratch_cdm_testing.procedure;
TRUNCATE TABLE scratch_cdm_testing.labs;
TRUNCATE TABLE scratch_cdm_testing.observations;
TRUNCATE TABLE scratch_cdm_testing.nlp_measurements;
TRUNCATE TABLE scratch_cdm_testing.microbiology;
TRUNCATE TABLE scratch_cdm_testing.nlp_biomarker;
TRUNCATE TABLE scratch_cdm_testing.medication_administrations;
TRUNCATE TABLE scratch_cdm_testing.patient_reported_meds;
TRUNCATE TABLE scratch_cdm_testing.prescriptions_written;
TRUNCATE TABLE scratch_cdm_testing.nlp_drug_rationale;
TRUNCATE TABLE scratch_cdm_testing.immunization;
TRUNCATE TABLE scratch_cdm_testing.insurance;

-- 1. Condition Occurrence

/*--*/
/* 1.0 Diagnosis without ''Diagnosis of'' status is not loaded [Test ID: 1] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT1', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT1', 'Family history of', '7061', 'ICD9', '01/01/2009', '1900-01-01 00:00:00', 'E00002', '0', '0', '0', '0', 'N');

/*--*/
/* 1.1 Test diag_date to condition_start_date [Test ID: 2] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT3', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT3', 'Diagnosis of', '7061', 'ICD9', '01/01/2009', '1900-01-01 00:00:00', 'E00004', '0', '0', '0', '0', 'N');

/*--*/
/* 1.2 Test diagnosis code type ICD9 [Test ID: 3] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT5', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT5', 'Diagnosis of', '7061', 'ICD9', '01/01/2009', '1900-01-01 00:00:00', 'E00006', '0', '0', '0', '0', 'N');

/*--*/
/* 1.3 Test diagnosis code type ICD10 [Test ID: 4] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT7', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT7', 'Diagnosis of', 'B23.0', 'ICD10', '01/01/2009', '1900-01-01 00:00:00', 'E00008', '0', '0', '0', '0', 'N');

/*--*/
/* 1.4 Test primary diagnosis to condition_type_concept_id [Test ID: 5] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT9', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT9', 'Diagnosis of', '7061', 'ICD9', '01/01/2009', '1900-01-01 00:00:00', 'E000010', '1', '0', '0', '0', 'N');

/*--*/
/* 1.5 Test non-primary diagnosis to condition_type_concept_id [Test ID: 6] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT11', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT11', 'Diagnosis of', '7061', 'ICD9', '01/01/2009', '1900-01-01 00:00:00', 'E000012', '0', '0', '0', '0', 'N');

/*--*/
/* 1.6 Test HCPCS derived condition coming from procedure table [Test ID: 7] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT13', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time, encid) VALUES ('PT13', 'G8007', 'HCPCS', '01/01/2009', '1900-01-01 00:00:00', 'E000014');

/*--*/
/* 1.7 Patient has PROCEDURE record; validate the provider for the encid is mapped to provid [Test ID: 8] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT15', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.provider (provid, specialty, prim_spec_ind) VALUES ('17', 'Internal Medicine', '1');
INSERT INTO scratch_cdm_testing.encounter_provider (encid, provid, provider_role) VALUES ('E000016', '17', 'ATTENDING');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time, encid) VALUES ('PT15', 'G8007', 'HCPCS', '01/01/2009', '1900-01-01 00:00:00', 'E000016');

/*--*/
/* 1.8 Patient has PROCEDURE record; validate the provider for the encid is mapped to provid [Test ID: 9] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT18', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.encounter_provider (encid, provid, provider_role) VALUES ('E000019', '20', 'ATTENDING');
INSERT INTO scratch_cdm_testing.encounter (encid, ptid, visitid, interaction_type, interaction_date, interaction_time) VALUES ('E000019', 'PT18', '21', 'Office or clinic patient', '01/01/2009', '1900-01-01 00:00:00');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time, encid) VALUES ('PT18', 'G8007', 'HCPCS', '01/01/2009', '1900-01-01 00:00:00', 'E000019');

-- 2. Death

/*--*/
/* 2.0 Patient is indicated dead by date_of_death. Their death date is the last day of the month. [Test ID: 10] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT22', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');

/*--*/
/* 2.1 Patient has care_area data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 11] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT24', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.care_area (ptid, encid, carearea, carearea_date, carearea_time) VALUES ('PT24', 'E000025', 'UNKNOWN CARE AREA', '2014-05-30', '1900-01-01 00:00:00');

/*--*/
/* 2.2 Patient has diagnosis data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 12] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT27', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT27', 'Diagnosis of', 'ICD9', '2014-05-30', '1900-01-01 00:00:00', 'E000028', '0', '0', '0', '0', 'N');

/*--*/
/* 2.3 Patient has encounter data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 13] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT30', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.encounter (encid, ptid, interaction_type, interaction_date, interaction_time) VALUES ('E000031', 'PT30', 'Office or clinic patient', '2014-05-30', '1900-01-01 00:00:00');

/*--*/
/* 2.4 Patient has immunization data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 14] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT33', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.immunization (ptid, immunization_date, ndc, ndc_source, immunization_desc, mapped_name) VALUES ('PT33', '2014-05-30', '49281001350', 'Derived', 'INFLUENZA VIRUS VACCINE; INACTIVATED', 'Influenza Inactivated Vaccine');

/*--*/
/* 2.5 Patient has insurance data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 15] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT36', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.insurance (ptid, encid, insurance_date, insurance_time, ins_type) VALUES ('PT36', 'E000037', '2014-05-30', '1900-01-01 00:00:00', 'Medicare');

/*--*/
/* 2.6 Patient has labs data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 16] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT39', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.labs (ptid, encid, test_name, order_date, result_time, test_result, result_unit, evaluated_for_range, value_within_range) VALUES ('PT39', 'E000040', 'O2 saturation.oximetry', '2014-05-30', '1900-01-01 00:00:00', 'Negative', '%', 'N', 'U');

/*--*/
/* 2.7 Patient has medication_administrations data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 17] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT42', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT42', 'E000043', 'SODIUM CHLORIDE 0.9 %', '00338004904', 'Derived', '2014-05-30', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 2.8 Patient has microbiology data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 18] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT45', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.microbiology (ptid, encid, order_date, order_time, collect_time, result_date, result_time, specimen_source) VALUES ('PT45', 'E000046', '2014-05-30', '1900-01-01 00:00:00', '1900-01-01 00:00:00', '2015-05-22', '1900-01-01 00:00:00', 'Urine');

/*--*/
/* 2.9 Patient has nlp_biomarker data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 19] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT48', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_biomarker (ptid, note_date, biomarker, biomarker_status) VALUES ('PT48', '2014-05-30', 'CD20', 'positive');

/*--*/
/* 2.10 Patient has nlp_drug_rationale data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 20] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT51', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_biomarker (ptid, note_date, biomarker, biomarker_status) VALUES ('PT51', '2014-05-30', 'CD20', 'positive');

/*--*/
/* 2.11 Patient has nlp_measurements data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 21] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT54', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_measurements (ptid, encid, note_date, measurement_type, measurement_value) VALUES ('PT54', 'E000055', '2014-05-30', 'DBP', '2');

/*--*/
/* 2.12 Patient has nlp_sds data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 22] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT57', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds (ptid, encid, note_date, sds_term) VALUES ('PT57', 'E000058', '2014-05-30', 'pain');

/*--*/
/* 2.13 Patient has nlp_sds_family data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 23] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT60', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds_family (ptid, encid, note_date, sds_term, sds_family_member, note_section) VALUES ('PT60', 'E000061', '2014-05-30', 'cancer', 'who=family', 'family medical history');

/*--*/
/* 2.14 Patient has observations data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 24] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT63', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT63', 'E000064', 'SBP', '2014-05-30', '1900-01-01 00:00:00', '18', 'mm Hg', 'N', 'U');

/*--*/
/* 2.15 Patient has patient_reported_meds data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 25] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT66', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, route, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT66', '2014-05-30', '49999035930', 'Oral', 'mg', 'Tabs', 'Salicylates', 'Direct');

/*--*/
/* 2.16 Patient has prescriptions_written data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 26] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT69', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT69', '2014-05-30', '1900-01-01 00:00:00', '00406035705', '30', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 2.17 Patient has procedure data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 27] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT72', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code_type, proc_date, proc_time) VALUES ('PT72', 'CPT4', '2014-05-30', '1900-01-01 00:00:00');

/*--*/
/* 2.18 Patient has visit data occurring data occurring exactly 30 days after death event. Expected result: dead [Test ID: 28] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT75', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.visit (ptid, visitid, visit_type, visit_start_date, visit_start_time, visit_end_date, visit_end_time, discharge_disposition, admission_source) VALUES ('PT75', '77', 'Inpatient', '2014-05-30', '1900-01-01 00:00:00', '2014-07-25', '1900-01-01 00:00:00', '01 DISCHARGED TO HOME OR SELF CARE', 'Referred by physician or self referral; non-healthcare facility point of origin');

/*--*/
/* 2.19 Patient has care_area data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 29] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT78', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.care_area (ptid, encid, carearea, carearea_date, carearea_time) VALUES ('PT78', 'E000079', 'UNKNOWN CARE AREA', '2014-06-29', '1900-01-01 00:00:00');

/*--*/
/* 2.20 Patient has diagnosis data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 30] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT81', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT81', 'Diagnosis of', 'ICD9', '2014-06-29', '1900-01-01 00:00:00', 'E000082', '0', '0', '0', '0', 'N');

/*--*/
/* 2.21 Patient has encounter data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 31] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT84', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.encounter (encid, ptid, interaction_type, interaction_date, interaction_time) VALUES ('E000085', 'PT84', 'Office or clinic patient', '2014-06-29', '1900-01-01 00:00:00');

/*--*/
/* 2.22 Patient has immunization data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 32] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT87', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.immunization (ptid, immunization_date, ndc, ndc_source, immunization_desc, mapped_name) VALUES ('PT87', '2014-06-29', '49281001350', 'Derived', 'INFLUENZA VIRUS VACCINE; INACTIVATED', 'Influenza Inactivated Vaccine');

/*--*/
/* 2.23 Patient has insurance data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 33] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT90', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.insurance (ptid, encid, insurance_date, insurance_time, ins_type) VALUES ('PT90', 'E000091', '2014-06-29', '1900-01-01 00:00:00', 'Medicare');

/*--*/
/* 2.24 Patient has labs data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 34] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT93', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.labs (ptid, encid, test_name, order_date, result_time, test_result, result_unit, evaluated_for_range, value_within_range) VALUES ('PT93', 'E000094', 'O2 saturation.oximetry', '2014-06-29', '1900-01-01 00:00:00', 'Negative', '%', 'N', 'U');

/*--*/
/* 2.25 Patient has medication_administrations data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 35] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT96', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT96', 'E000097', 'SODIUM CHLORIDE 0.9 %', '00338004904', 'Derived', '2014-06-29', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 2.26 Patient has microbiology data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 36] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT99', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.microbiology (ptid, encid, order_date, order_time, collect_time, result_date, result_time, specimen_source) VALUES ('PT99', 'E0000100', '2014-06-29', '1900-01-01 00:00:00', '1900-01-01 00:00:00', '2015-05-22', '1900-01-01 00:00:00', 'Urine');

/*--*/
/* 2.27 Patient has nlp_biomarker data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 37] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT102', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_biomarker (ptid, note_date, biomarker, biomarker_status) VALUES ('PT102', '2014-06-29', 'CD20', 'positive');

/*--*/
/* 2.28 Patient has nlp_drug_rationale data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 38] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT105', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_biomarker (ptid, note_date, biomarker, biomarker_status) VALUES ('PT105', '2014-06-29', 'CD20', 'positive');

/*--*/
/* 2.29 Patient has nlp_measurements data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 39] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT108', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_measurements (ptid, encid, note_date, measurement_type, measurement_value) VALUES ('PT108', 'E0000109', '2014-06-29', 'DBP', '2');

/*--*/
/* 2.30 Patient has nlp_sds data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 40] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT111', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds (ptid, encid, note_date, sds_term) VALUES ('PT111', 'E0000112', '2014-06-29', 'pain');

/*--*/
/* 2.31 Patient has nlp_sds_family data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 41] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT114', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds_family (ptid, encid, note_date, sds_term, sds_family_member, note_section) VALUES ('PT114', 'E0000115', '2014-06-29', 'cancer', 'who=family', 'family medical history');

/*--*/
/* 2.32 Patient has observations data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 42] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT117', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT117', 'E0000118', 'SBP', '2014-06-29', '1900-01-01 00:00:00', '18', 'mm Hg', 'N', 'U');

/*--*/
/* 2.33 Patient has patient_reported_meds data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 43] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT120', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, route, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT120', '2014-06-29', '49999035930', 'Oral', 'mg', 'Tabs', 'Salicylates', 'Direct');

/*--*/
/* 2.34 Patient has prescriptions_written data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 44] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT123', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT123', '2014-06-29', '1900-01-01 00:00:00', '00406035705', '30', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 2.35 Patient has procedure data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 45] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT126', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code_type, proc_date, proc_time) VALUES ('PT126', 'CPT4', '2014-06-29', '1900-01-01 00:00:00');

/*--*/
/* 2.36 Patient has visit data occurring data occurring 60 days after death event. Expected result: not dead [Test ID: 46] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT129', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '201404', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.visit (ptid, visitid, visit_type, visit_start_date, visit_start_time, visit_end_date, visit_end_time, discharge_disposition, admission_source) VALUES ('PT129', '131', 'Inpatient', '2014-06-29', '1900-01-01 00:00:00', '2014-07-25', '1900-01-01 00:00:00', '01 DISCHARGED TO HOME OR SELF CARE', 'Referred by physician or self referral; non-healthcare facility point of origin');

-- 3. Device Exposure

-- 4. Drug Exposure

/*--*/
/* 4.0 Patient has 1 valid MEDICATION_ADMINISTRATIONS record within the enrollment period. [Test ID: 47] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT132', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201412', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT132', 'E0000133', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2011-01-07', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 4.1 Patient has 2 MEDICATION_ADMINISTRATIONS records, the first within the enrollment period, the second outside of enrollment. [Test ID: 48] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT134', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT134', 'E0000135', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2011-01-07', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT134', 'E0000135', 'SODIUM CHLORIDE 0.9 %', '58487000102', 'Derived', '2013-01-07', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 4.2 Patient has multiple MEDICATION_ADMINISTRATIONS records, all within enrollment period, but have the same encounter_id, ndc and order_date. [Test ID: 49] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT136', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT136', 'E0000137', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2011-01-07', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT136', 'E0000137', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2013-01-07', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 4.3 Patient has multiple MEDICATION_ADMINISTRATIONS records, all within enrollment period, that have the same ndc on the same day, but different encounters which should be collapsed. [Test ID: 50] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT138', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT138', 'E0000139', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2011-01-07', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT138', 'E0000140', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2013-01-07', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 4.4 Patient has series of MEDICATION_ADMINISTRATIONS with the same encounter_id, but different order_date [Test ID: 51] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT141', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT141', 'E0000142', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2011-01-07', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT141', 'E0000142', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2013-01-08', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 4.5 Patient has MEDICATION_ADMINISTRATIONS with provid that is NULL but the encounter has a valid provider id specified [Test ID: 52] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT143', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.encounter (encid, ptid, visitid, interaction_type, interaction_date, interaction_time) VALUES ('E0000144', 'PT143', '145', 'Office or clinic patient', '2014-06-16', '1900-01-01 00:00:00');
INSERT INTO scratch_cdm_testing.encounter_provider (encid, provid, provider_role) VALUES ('E0000144', '1077416', 'ATTENDING');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT143', 'E0000144', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2012-01-08', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 4.6 Patient has MEDICATION_ADMINISTRATIONS with an NDC that is properly mapped to the source_concept_id and standard concept_id [Test ID: 53] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT146', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT146', 'E0000147', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2012-01-08', '1900-01-01 00:00:00', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 4.7 Patient has MEDICATION_ADMINISTRATIONS with a valid quantity_of_dose [Test ID: 54] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT148', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, quantity_of_dose, route, generic_desc, drug_class) VALUES ('PT148', 'E0000149', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2012-01-08', '1900-01-01 00:00:00', '.5', 'Intravenous', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 4.8 Patient has MEDICATION_ADMINISTRATIONS and the route value is found in the source-to-concept-map and assigned the proper concept_id [Test ID: 55] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT150', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT150', 'E0000151', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2012-01-08', '1900-01-01 00:00:00', 'Oral', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 4.9 Patient has MEDICATION_ADMINISTRATIONS and the route value is NOT found in the source-to-concept-map and assigned concept_id of 0 [Test ID: 56] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT152', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, generic_desc, drug_class) VALUES ('PT152', 'E0000153', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2012-01-08', '1900-01-01 00:00:00', 'Osmosis', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 4.10 Patient has MEDICATION_ADMINISTRATIONS with a strength_unit that maps to dose_unit_source_value [Test ID: 57] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT154', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.medication_administrations (ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, route, strength_unit, generic_desc, drug_class) VALUES ('PT154', 'E0000155', 'SODIUM CHLORIDE 0.9 %', '55111067101', 'Derived', '2012-01-08', '1900-01-01 00:00:00', 'Intravenous', 'mg/mL', 'SODIUM CHLORIDE', 'Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations');

/*--*/
/* 4.11 Patient has PRESCRIPTIONS_WRITTEN with valid information [Test ID: 58] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT156', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT156', '2012-01-08', '1900-01-01 00:00:00', '00406035705', '30', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.12 Patient has multiple PRESCRIPTIONS_WRITTEN with the first within the enrollment period, the second outside of enrollment. [Test ID: 59] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT157', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT157', '2012-01-08', '1900-01-01 00:00:00', '00406035705', '30', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT157', '2014-01-08', '1900-01-01 00:00:00', '00406035705', '30', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.13 Patient has multiple PRESCRIPTIONS_WRITTEN records, all within enrollment period, but have the same rxdate and ndc which should be collapsed. [Test ID: 60] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT158', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT158', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '30', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT158', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '30', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.14 Patient has PRESCRIPTIONS_WRITTEN and the NDC is properly mapped to the source_concept_id and standard concept_id [Test ID: 61] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT159', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT159', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '30', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.15 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains non-numeric values [Test ID: 62] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT160', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT160', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '90 Tab', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.16 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains only numerics [Test ID: 63] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT161', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT161', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '90', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.17 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains NULL AND quantity_of_dose is NOT NULL [Test ID: 64] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT162', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, num_refills, route, quantity_of_dose, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT162', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '0.0', 'Oral', '1', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.18 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains NULL AND quantity_of_dose is NOT NULL with text [Test ID: 65] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT163', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, num_refills, route, quantity_of_dose, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT163', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '0.0', 'Oral', '1 tablet', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.19 Patient has PRESCRIPTIONS_WRITTEN with num_refils that contains only numerics [Test ID: 66] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT164', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT164', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '30', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.20 Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains an empty value [Test ID: 67] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT165', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT165', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.21 Patient has PRESCRIPTIONS_WRITTEN with days_supply that contains only numerics [Test ID: 68] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT166', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, days_supply, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT166', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '30', '0.0', '1.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.22 Patient has PRESCRIPTIONS_WRITTEN with days_supply that contains an empty value [Test ID: 69] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT167', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT167', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '30', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.23 Patient has PRESCRIPTIONS_WRITTEN with provid specified [Test ID: 70] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT168', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, provid, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT168', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '30', '0.0', '843801', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.24 Patient has PRESCRIPTIONS_WRITTEN with a route that is specified in the route source-to-concept map. [Test ID: 71] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT169', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength_unit, ndc_source, drug_class, dosage_form) VALUES ('PT169', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '30', '0.0', 'Oral', 'mg', 'Direct', 'HMG & CoA reductase inhibitors (statins)', 'Tabs');

/*--*/
/* 4.25 Patient has PRESCRIPTIONS_WRITTEN with strength + strength_unit + dosefreq + dosage_form that should be concatenated [Test ID: 72] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT170', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.prescriptions_written (ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, route, strength, strength_unit, ndc_source, drug_class, dosefreq, dosage_form) VALUES ('PT170', '2012-01-08', '1900-01-01 00:00:00', '55111067101', '30', '0.0', 'Oral', '20 - 25', '15 MG', 'Direct', 'HMG & CoA reductase inhibitors (statins)', '1 time a day', 'Capsule Delayed Release');

/*--*/
/* 4.26 Patient has PATIENT_REPORTED_MEDS with valid information [Test ID: 73] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT171', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, route, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT171', '2012-01-08', '49999035930', 'Oral', 'mg', 'Tabs', 'Salicylates', 'Direct');

/*--*/
/* 4.27 Patient has multiple PATIENT_REPORTED_MEDS with the first within the enrollment period, the second outside of enrollment. [Test ID: 74] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT172', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, route, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT172', '2012-01-08', '49999035930', 'Oral', 'mg', 'Tabs', 'Salicylates', 'Direct');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, route, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT172', '2014-01-08', '49999035930', 'Oral', 'mg', 'Tabs', 'Salicylates', 'Direct');

/*--*/
/* 4.28 Patient has multiple PATIENT_REPORTED_MEDS records, all within enrollment period, but have the same reported_date and ndc which should be collapsed. [Test ID: 75] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT173', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, route, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT173', '2012-01-08', '55111067101', 'Oral', 'mg', 'Tabs', 'Salicylates', 'Direct');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, route, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT173', '2012-01-08', '55111067101', 'Oral', 'mg', 'Tabs', 'Salicylates', 'Direct');

/*--*/
/* 4.29 Patient has PATIENT_REPORTED_MEDS with valid reported_date and drug_type_concept_id [Test ID: 76] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT174', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, route, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT174', '2012-01-08', '55111067101', 'Oral', 'mg', 'Tabs', 'Salicylates', 'Direct');

/*--*/
/* 4.30 Patient has PRESCRIPTIONS_WRITTEN and the NDC is properly mapped to the source_concept_id and standard concept_id [Test ID: 77] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT175', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, route, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT175', '2012-01-08', '55111067101', 'Oral', 'mg', 'Tabs', 'Salicylates', 'Direct');

/*--*/
/* 4.31 Patient has PATIENT_REPORTED_MEDS with provid mapped [Test ID: 78] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT176', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, provid, route, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT176', '2012-01-08', '49999035930', '179865', 'Oral', 'mg', 'Tabs', 'Salicylates', 'Direct');

/*--*/
/* 4.32 Patient has PATIENT_REPORTED_MEDS with a route that is specified in the route source-to-concept map. [Test ID: 79] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT177', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, route, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT177', '2012-01-08', '55111067101', 'Oral', 'mg', 'Tabs', 'Salicylates', 'Direct');

/*--*/
/* 4.33 Patient has PATIENT_REPORTED_MEDS with a quantity_of_dose that maps to quantity. [Test ID: 80] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT178', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient_reported_meds (ptid, reported_date, ndc, route, quantity_of_dose, strength_unit, dosage_form, drug_class, ndc_source) VALUES ('PT178', '2012-01-08', '55111067101', 'Oral', '6', 'mg', 'Tabs', 'Salicylates', 'Direct');

/*--*/
/* 4.34 Patient has IMMUNIZATION with valid information [Test ID: 81] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT179', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.immunization (ptid, immunization_date, ndc, pt_reported, ndc_source, immunization_desc, mapped_name) VALUES ('PT179', '2011-10-12', '66521011710', 'N', 'Derived', 'INFLUENZA VIRUS VACCINE; INACTIVATED', 'Influenza Inactivated Vaccine');

/*--*/
/* 4.35 Patient has multiple IMMUNIZATION with the first within the enrollment period, the second outside of enrollment. [Test ID: 82] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT180', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.immunization (ptid, immunization_date, ndc, pt_reported, ndc_source, immunization_desc, mapped_name) VALUES ('PT180', '2011-10-12', '66521011710', 'N', 'Derived', 'INFLUENZA VIRUS VACCINE; INACTIVATED', 'Influenza Inactivated Vaccine');
INSERT INTO scratch_cdm_testing.immunization (ptid, immunization_date, ndc, pt_reported, ndc_source, immunization_desc, mapped_name) VALUES ('PT180', '2013-10-12', '66521011710', 'N', 'Derived', 'INFLUENZA VIRUS VACCINE; INACTIVATED', 'Influenza Inactivated Vaccine');

/*--*/
/* 4.36 Patient has multiple IMMUNIZATION records, all within enrollment period, but have the same immunization_date and ndc which should be collapsed. [Test ID: 83] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT181', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.immunization (ptid, immunization_date, ndc, pt_reported, ndc_source, immunization_desc, mapped_name) VALUES ('PT181', '2011-10-12', '66521011710', 'N', 'Derived', 'INFLUENZA VIRUS VACCINE; INACTIVATED', 'Influenza Inactivated Vaccine');
INSERT INTO scratch_cdm_testing.immunization (ptid, immunization_date, ndc, pt_reported, ndc_source, immunization_desc, mapped_name) VALUES ('PT181', '2011-10-12', '66521011710', 'N', 'Derived', 'INFLUENZA VIRUS VACCINE; INACTIVATED', 'Influenza Inactivated Vaccine');

/*--*/
/* 4.37 Patient has IMMUNIZATION with immunization_date that is NULL [Test ID: 84] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT182', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.immunization (ptid, ndc, pt_reported, ndc_source, immunization_desc, mapped_name) VALUES ('PT182', '66521011710', 'N', 'Derived', 'INFLUENZA VIRUS VACCINE; INACTIVATED', 'Influenza Inactivated Vaccine');

/*--*/
/* 4.38 Patient has IMMUNIZATION with pt_reported =''Y'' [Test ID: 85] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT183', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.immunization (ptid, immunization_date, ndc, pt_reported, ndc_source, immunization_desc, mapped_name) VALUES ('PT183', '2011-10-12', '66521011710', 'Y', 'Derived', 'INFLUENZA VIRUS VACCINE; INACTIVATED', 'Influenza Inactivated Vaccine');

/*--*/
/* 4.39 Patient has IMMUNIZATION and the NDC is properly mapped to the source_concept_id and standard concept_id [Test ID: 86] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT184', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.immunization (ptid, immunization_date, ndc, pt_reported, ndc_source, immunization_desc, mapped_name) VALUES ('PT184', '2011-10-12', '66521011710', 'N', 'Derived', 'INFLUENZA VIRUS VACCINE; INACTIVATED', 'Influenza Inactivated Vaccine');

/*--*/
/* 4.40 Patient has IMMUNIZATION with pt_reported =''N'' with a valid drug_type_concept_id [Test ID: 87] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT185', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.immunization (ptid, immunization_date, ndc, pt_reported, ndc_source, immunization_desc, mapped_name) VALUES ('PT185', '2011-10-12', '66521011710', 'N', 'Derived', 'INFLUENZA VIRUS VACCINE; INACTIVATED', 'Influenza Inactivated Vaccine');

/*--*/
/* 4.41 Procedure has PROC_CODE that is a drug with valid information and valid drug_type_concept_id [Test ID: 88] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT186', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time) VALUES ('PT186', 'J9310', 'HCPCS', '2011-02-11', '1900-01-01 00:00:00');

/*--*/
/* 4.42 Patient has multiple PROCEDURE records with the first within the enrollment period, the second outside of enrollment. [Test ID: 89] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT187', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time) VALUES ('PT187', 'J9310', 'HCPCS', '2011-10-12', '1900-01-01 00:00:00');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time) VALUES ('PT187', 'J9310', 'HCPCS', '2013-10-12', '1900-01-01 00:00:00');

/*--*/
/* 4.43 Patient has multiple PROCEDURE records, all within enrollment period, but have the same PROC_DATE and proc_code which should be collapsed. [Test ID: 90] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT188', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time) VALUES ('PT188', 'J9310', 'HCPCS', '2011-10-12', '1900-01-01 00:00:00');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time) VALUES ('PT188', 'J9310', 'HCPCS', '2011-10-12', '1900-01-01 00:00:00');

/*--*/
/* 4.44 Patient has PROCEDURE with HCPCS proc_code that maps to a standard concept [Test ID: 91] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT189', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time) VALUES ('PT189', 'J9310', 'HCPCS', '2011-10-12', '1900-01-01 00:00:00');

/*--*/
/* 4.45 Patient has PROCEDURE with provid_perform that maps to provid [Test ID: 92] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT190', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');

/*--*/
/* 4.46 Patient has PROCEDURE with encid that maps to visit_occurrence_id [Test ID: 93] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT191', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');

/*--*/
/* 4.47 NLP_DRUG_RATIONALE has valid note_date and other valid information with a valid drug_type_concept_id [Test ID: 94] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT192', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');

/*--*/
/* 4.48 Patient has multiple NLP_DRUG_RATIONALE records with the first within the enrollment period, the second outside of enrollment. [Test ID: 95] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT193', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time) VALUES ('PT193', 'J9310', 'HCPCS', '2011-10-12', '1900-01-01 00:00:00');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time) VALUES ('PT193', 'J9310', 'HCPCS', '2013-10-12', '1900-01-01 00:00:00');

/*--*/
/* 4.49 Patient has multiple NLP_DRUG_RATIONALE records, all within enrollment period, but have the same note_date and drug_name which should be collapsed. [Test ID: 96] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT194', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');

/*--*/
/* 4.50 NLP_DRUG_RATIONALE has reason_general that maps to stop_reason  [Test ID: 97] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT195', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');

/*--*/
/* 4.51 NLP_DRUG_RATIONALE has valid note_date and drug_name that maps based on the source-to-concept-map [Test ID: 98] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT196', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');

/*--*/
/* 4.52 NLP_DRUG_RATIONALE has reason_general that maps to stop_reason  [Test ID: 99] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT197', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');

/*--*/
/* 4.53 NLP_DRUG_RATIONALE has encid that maps to visit_occurrence_id  [Test ID: 100] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT198', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201212', '1', '1', 'S0034', '201506');

-- 5. Location

/*--*/
/* 5.0 Simple Location [Test ID: 101] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT199', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'REGION', 'DIVISION', '39005.0', '26.0', '0', '1', '200601', '201506', '1', '1', 'S0034', '201506');

/*--*/
/* 5.1 No Location Dupes [Test ID: 102] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT200', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'DUPE_REGION', 'DUPE_DIVISION', '39005.0', '26.0', '0', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT201', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'DUPE_DIVISION', 'DUPE_DIVISION', '39005.0', '26.0', '0', '1', '200601', '201506', '1', '1', 'S0034', '201506');

-- 6. Measurement

-- 7. Observation Period

/*--*/
/* 7.0 Tests if 2 patient durations (where second is subsumed by the first) results in a single observation period [Test ID: 103] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT202', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201005', '201412', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT202', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201006', '201411', '1', '1', 'S0034', '201506');

/*--*/
/* 7.1 Tests if 2 patient durations (where second is within 30 days of first) results in a single observation period [Test ID: 104] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT203', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200005', '200512', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT203', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200601', '201112', '1', '1', 'S0034', '201506');

/*--*/
/* 7.2 Tests if 2 patient durations (where second starts 33 days after first) results in two observation periods [Test ID: 105] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT204', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200104', '200612', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT204', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200005', '200012', '1', '1', 'S0034', '201506');

/*--*/
/* 7.3 Invalid patient duration [Test ID: 106] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT205', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200101', '200001', '1', '1', 'S0034', '201506');

/*--*/
/* 7.4 Patient duration is 1 month [Test ID: 107] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT206', '201305', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '201305', '201506', '1', '1', 'S0034', '201506');

-- 8. Observation

/*--*/
/* 8.0 Patient has 1 valid OBSERVATIONS record within the enrollment period. Validate that the obs_date maps to the observation_date field properly. [Test ID: 108] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT207', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT207', 'E0000208', 'SBP', '01/01/2009', '1900-01-01 00:00:00', '18', 'mm Hg', 'N', 'U');

/*--*/
/* 8.1 Patient has 2 OBSERVATIONS records, the first within the enrollment period, the second outside of enrollment. [Test ID: 109] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT209', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT209', 'E0000210', 'SBP', '01/01/2009', '1900-01-01 00:00:00', '18', 'mm Hg', 'N', 'U');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT209', 'E0000210', 'SBP', '01/01/2015', '1900-01-01 00:00:00', '18', 'mm Hg', 'N', 'U');

/*--*/
/* 8.2 Patient has multiple OBSERVATIONS records, all within enrollment period [Test ID: 110] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT211', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT211', 'E0000212', 'SBP', '01/01/2009', '1900-01-01 00:00:00', '18', 'mm Hg', 'N', 'U');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT211', 'E0000212', 'SBP', '01/01/2009', '1900-01-01 00:00:00', '18', 'mm Hg', 'N', 'U');

/*--*/
/* 8.3 Patient has OBSERVATIONS record; validate the encid mapping to visit_occurrence_id [Test ID: 111] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT213', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT213', 'E0000214', 'SBP', '01/01/2009', '1900-01-01 00:00:00', '18', 'mm Hg', 'N', 'U');

/*--*/
/* 8.4 Patient has OBSERVATIONS record; validate the obs_type mapping found in the STCM to observation_concept_id [Test ID: 112] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT215', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT215', 'E0000216', 'SMOKE', '01/01/2009', '1900-01-01 00:00:00', '18', 'mm Hg', 'N', 'U');

/*--*/
/* 8.5 Patient has OBSERVATIONS record; validate the obs_type mapping NOT found in the STCM maps to observation_concept_id = 0 [Test ID: 113] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT217', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT217', 'E0000218', 'SBP', '01/01/2009', '1900-01-01 00:00:00', '18', 'mm Hg', 'N', 'U');

/*--*/
/* 8.6 Patient has OBSERVATIONS record; validate the observation_type_concept_id is populated correctly [Test ID: 114] */
/*--*/
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT219', 'E0000220', 'SBP', '01/01/2009', '1900-01-01 00:00:00', '18', 'mm Hg', 'N', 'U');

/*--*/
/* 8.7 Patient has OBSERVATIONS record; validate the obs_time is mapped to observation_time [Test ID: 115] */
/*--*/
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT221', 'E0000222', 'SBP', '01/01/2009', '1900-01-01 14:30:00', '18', 'mm Hg', 'N', 'U');

/*--*/
/* 8.8 Patient has OBSERVATIONS record; validate the obs_result is mapped to value_as_number when obs_result can be cast to a numeric [Test ID: 116] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT223', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT223', 'E0000224', 'SBP', '01/01/2009', '1900-01-01 00:00:00', '100', 'mm Hg', 'N', 'U');

/*--*/
/* 8.9 Patient has OBSERVATIONS record; validate the obs_result is mapped to value_as_string when obs_result CANNOT be cast to a numeric [Test ID: 117] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT225', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT225', 'E0000226', 'SBP', '01/01/2009', '1900-01-01 00:00:00', 'One Hundred', 'mm Hg', 'N', 'U');

/*--*/
/* 8.10 Patient has OBSERVATIONS record; validate the obs_unit is mapped to unit_source_value AND a valid unit_concept_id when it matches a concept in the UCUM vocabulary [Test ID: 118] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT227', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT227', 'E0000228', 'SBP', '01/01/2009', '1900-01-01 00:00:00', '18', 'kilogram', 'N', 'U');

/*--*/
/* 8.11 Patient has OBSERVATIONS record; validate the obs_unit is mapped to unit_source_value AND unit_concept_id = 0 when it matches a concept in the UCUM vocabulary [Test ID: 119] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT229', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.observations (ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) VALUES ('PT229', 'E0000230', 'SBP', '01/01/2009', '1900-01-01 00:00:00', '18', 'kg', 'N', 'U');

/*--*/
/* 8.12 Patient has 1 valid NLP_SDS_FAMILY record within the enrollment period. Validate that the note_date maps to the observation_date field properly. [Test ID: 120] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT231', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds_family (ptid, encid, note_date, sds_term, sds_family_member, note_section) VALUES ('PT231', 'E0000232', '01/01/2009', 'cancer', 'who=family', 'family medical history');

/*--*/
/* 8.13 Patient has 2 NLP_SDS_FAMILY records, the first within the enrollment period, the second outside of enrollment. [Test ID: 121] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT233', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds_family (ptid, encid, note_date, sds_term, sds_family_member, note_section) VALUES ('PT233', 'E0000234', '01/01/2009', 'cancer', 'who=family', 'family medical history');
INSERT INTO scratch_cdm_testing.nlp_sds_family (ptid, encid, note_date, sds_term, sds_family_member, note_section) VALUES ('PT233', 'E0000234', '01/01/2015', 'cancer', 'who=family', 'family medical history');

/*--*/
/* 8.14 Patient has NLP_SDS_FAMILY record; validate the encid mapping to visit_occurrence_id [Test ID: 122] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT235', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds_family (ptid, encid, note_date, sds_term, sds_family_member, note_section) VALUES ('PT235', 'E0000236', '01/01/2009', 'cancer', 'who=family', 'family medical history');

/*--*/
/* 8.15 Patient has NLP_SDS_FAMILY record; validate the provider for the encid is mapped to provid [Test ID: 123] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT237', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.provider (provid, specialty, prim_spec_ind) VALUES ('239', 'Internal Medicine', '1');
INSERT INTO scratch_cdm_testing.encounter_provider (encid, provid, provider_role) VALUES ('E0000238', '239', 'ATTENDING');
INSERT INTO scratch_cdm_testing.nlp_sds_family (ptid, encid, note_date, sds_term, sds_family_member, note_section) VALUES ('PT237', 'E0000238', '01/01/2009', 'cancer', 'who=family', 'family medical history');

/*--*/
/* 8.16 Patient has NLP_SDS_FAMILY record; validate the observation_type_concept_id is populated correctly [Test ID: 124] */
/*--*/
INSERT INTO scratch_cdm_testing.nlp_sds_family (ptid, encid, note_date, sds_term, sds_family_member, note_section) VALUES ('PT240', 'E0000241', '01/01/2009', 'cancer', 'who=family', 'family medical history');

/*--*/
/* 8.17 Patient has NLP_SDS_FAMILY record; validate the sds_term is mapped to observation_source_value [Test ID: 125] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT242', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds_family (ptid, encid, note_date, sds_term, sds_family_member, note_section) VALUES ('PT242', 'E0000243', '01/01/2009', 'cancer', 'who=family', 'family medical history');

/*--*/
/* 8.18 Patient has NLP_SDS_FAMILY record; validate sds_term, sds_location, sds_family_member,
              sds_sentiment is mapped to value_as_string with semi-colon delimiter [Test ID: 126] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT244', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds_family (ptid, encid, note_date, sds_term, sds_location, sds_family_member, sds_sentiment, note_section) VALUES ('PT244', 'E0000245', '01/01/2009', 'cancer', 'prostate', 'who=family', 'negative', 'family medical history');

/*--*/
/* 8.19 Patient has 1 valid NLP_SDS record within the enrollment period. Validate that the note_date maps to the observation_date field properly. [Test ID: 127] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT246', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds (ptid, encid, note_date, sds_term) VALUES ('PT246', 'E0000247', '01/01/2009', 'pain');

/*--*/
/* 8.20 Patient has 2 NLP_SDS records, the first within the enrollment period, the second outside of enrollment. [Test ID: 128] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT248', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds (ptid, encid, note_date, sds_term) VALUES ('PT248', 'E0000249', '01/01/2009', 'pain');
INSERT INTO scratch_cdm_testing.nlp_sds (ptid, encid, note_date, sds_term) VALUES ('PT248', 'E0000249', '01/01/2015', 'pain');

/*--*/
/* 8.21 Patient has NLP_SDS record; validate the encid mapping to visit_occurrence_id [Test ID: 129] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT250', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds (ptid, encid, note_date, sds_term) VALUES ('PT250', 'E0000251', '01/01/2009', 'pain');

/*--*/
/* 8.22 Patient has NLP_SDS record; validate the provider for the encid is mapped to provid [Test ID: 130] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT252', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.provider (provid, specialty, prim_spec_ind) VALUES ('254', 'Internal Medicine', '1');
INSERT INTO scratch_cdm_testing.encounter_provider (encid, provid, provider_role) VALUES ('E0000253', '254', 'ATTENDING');
INSERT INTO scratch_cdm_testing.nlp_sds (ptid, encid, note_date, sds_term) VALUES ('PT252', 'E0000253', '01/01/2009', 'pain');

/*--*/
/* 8.23 Patient has NLP_SDS record; validate the observation_type_concept_id is populated correctly [Test ID: 131] */
/*--*/
INSERT INTO scratch_cdm_testing.nlp_sds (ptid, encid, note_date, sds_term) VALUES ('PT255', 'E0000256', '01/01/2009', 'pain');

/*--*/
/* 8.24 Patient has NLP_SDS record; validate the sds_term is mapped to observation_concept_id using STCM [Test ID: 132] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT257', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.nlp_sds (ptid, encid, note_date, sds_term) VALUES ('PT257', 'E0000258', '01/01/2009', '');

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
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT315', '1950', 'Unknown', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.1 Tests Male gender [Test ID: 162] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT316', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.2 Tests Female gender [Test ID: 163] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT317', '1950', 'Female', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.3 Tests Unknown birth year [Test ID: 164] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT318', 'Unknown', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.4 Tests 1930 and earlier birth year [Test ID: 165] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT319', '1930 and earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.5 Tests Asian race [Test ID: 166] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT320', '1950', 'Male', 'Asian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.6 Tests African American race [Test ID: 167] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT321', '1950', 'Male', 'African American', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.7 Tests Caucasian race [Test ID: 168] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT322', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.8 Tests Unknown race [Test ID: 169] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT323', '1950', 'Male', 'Other/Unknown', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.9 Tests Hispanic ethnicity, Asian race [Test ID: 170] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT324', '1950', 'Male', 'Asian', 'Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.10 Tests Hispanic ethnicity, African American race [Test ID: 171] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT325', '1950', 'Male', 'African American', 'Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.11 Tests Hispanic ethnicity, Caucasian race [Test ID: 172] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT326', '1950', 'Male', 'Caucasian', 'Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

/*--*/
/* 10.12 Tests Hispanic ethnicity, unknown race [Test ID: 173] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT327', '1950', 'Male', 'Other/Unknown', 'Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');

-- 11. Procedure Occurrence

/*--*/
/* 11.0 Tests procedure record with proc_code_type CPT4 [Test ID: 174] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT328', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time, encid) VALUES ('PT328', '36415', 'CPT4', '01/01/2009', '1900-01-01 00:00:00', 'E0000329');

/*--*/
/* 11.1 Tests procedure record with proc_code_type HCPCS [Test ID: 175] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT330', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time, encid) VALUES ('PT330', 'C9743', 'HCPCS', '01/01/2009', '1900-01-01 00:00:00', 'E0000331');

/*--*/
/* 11.2 Tests procedure record with proc_code_type ICD9 [Test ID: 176] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT332', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time, encid) VALUES ('PT332', '634.91', 'ICD9', '01/01/2009', '1900-01-01 00:00:00', 'E0000333');

/*--*/
/* 11.3 Tests procedure type concept [Test ID: 177] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT334', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time, encid) VALUES ('PT334', '36415', 'CPT4', '01/01/2009', '1900-01-01 00:00:00', 'E0000335');

/*--*/
/* 11.4 Tests procedure record with proc_code_type of blank results in no record [Test ID: 178] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT336', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time, encid) VALUES ('PT336', '36415', '', '01/01/2009', '1900-01-01 00:00:00', 'E0000337');

/*--*/
/* 11.5 Tests procedure record with proc_code_type CUSTOM results in no record [Test ID: 179] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT338', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time, encid) VALUES ('PT338', '36415', 'CUSTOM', '01/01/2009', '1900-01-01 00:00:00', 'E0000339');

/*--*/
/* 11.6 Tests procedure record with proc_code_type REV results in no record [Test ID: 180] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT340', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time, encid) VALUES ('PT340', '36415', 'REV', '01/01/2009', '1900-01-01 00:00:00', 'E0000341');

/*--*/
/* 11.7 Tests procedure record with proc_code_type CLM_UNK results in no record [Test ID: 181] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT342', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.procedure (ptid, proc_code, proc_code_type, proc_date, proc_time, encid) VALUES ('PT342', '36415', 'CLM_UNK', '01/01/2009', '1900-01-01 00:00:00', 'E0000343');

/*--*/
/* 11.8 Tests procedure type concept id from diagnosis record [Test ID: 182] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT344', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT344', 'Diagnosis of', '634.91', 'ICD9', '01/01/2009', '1900-01-01 00:00:00', 'E0000345', '0', '0', '0', '0', 'N');

/*--*/
/* 11.9 Diagnosis without ''Diagnosis of'' status is not loaded [Test ID: 183] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT346', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT346', 'Family history of', '634.91', 'ICD9', '01/01/2009', '1900-01-01 00:00:00', 'E0000347', '0', '0', '0', '0', 'N');

/*--*/
/* 11.10 Diagnosis record with diagnosis_cd_type ICD9 [Test ID: 184] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT348', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT348', 'Diagnosis of', '634.91', 'ICD9', '01/01/2009', '1900-01-01 00:00:00', 'E0000349', '0', '0', '0', '0', 'N');

/*--*/
/* 11.11 Diagnosis record with diagnosis_cd_type ICD10 [Test ID: 185] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT350', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT350', 'Diagnosis of', 'O04.87', 'ICD10', '01/01/2009', '1900-01-01 00:00:00', 'E0000351', '0', '0', '0', '0', 'N');

/*--*/
/* 11.12 Diagnosis record with diagnosis_cd_type SNOMED [Test ID: 186] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT352', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT352', 'Diagnosis of', '10019001', 'SNOMED', '01/01/2009', '1900-01-01 00:00:00', 'E0000353', '0', '0', '0', '0', 'N');

/*--*/
/* 11.13 Diagnosis record with blank diagnosis_cd_type [Test ID: 187] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT354', '1950', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200701', '201001', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT354', 'Diagnosis of', '10019001', '', '01/01/2009', '1900-01-01 00:00:00', 'E0000355', '0', '0', '0', '0', 'N');

-- 12. Provider

/*--*/
/* 12.0 Simple Provider Mapping [Test ID: 188] */
/*--*/
INSERT INTO scratch_cdm_testing.provider (provid, specialty, prim_spec_ind) VALUES ('356', 'Internal Medicine', '1');

/*--*/
/* 12.1 Dupe Provider Mapping [Test ID: 189] */
/*--*/
INSERT INTO scratch_cdm_testing.provider (provid, specialty, prim_spec_ind) VALUES ('357', 'Family Medicine', '1');
INSERT INTO scratch_cdm_testing.provider (provid, specialty, prim_spec_ind) VALUES ('357', 'Family Medicine', '1');

/*--*/
/* 12.2 Non-Primary specialty Mapping [Test ID: 190] */
/*--*/
INSERT INTO scratch_cdm_testing.provider (provid, specialty, prim_spec_ind) VALUES ('358', 'Emergency Medicine', '0');

-- 13. Visit Occurrence

/*--*/
/* 13.0 Visit from Diagnosis Test [Test ID: 191] */
/*--*/
INSERT INTO scratch_cdm_testing.patient (ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) VALUES ('PT359', '1930 and Earlier', 'Male', 'Caucasian', 'Not Hispanic', 'South', 'South Atl/West South Crl', '39005.0', '26.0', '0', '1', '200601', '201506', '1', '1', 'S0034', '201506');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT359', 'Diagnosis of', '4019', 'ICD9', '2014-05-02', '1900-01-01 00:00:00', 'E0000360', '0', '0', '0', '0', 'N');
INSERT INTO scratch_cdm_testing.diagnosis (ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) VALUES ('PT359', 'Diagnosis of', '2724', 'ICD9', '2014-05-02', '1900-01-01 00:00:00', 'E0000361', '0', '0', '0', '0', 'N');
INSERT INTO scratch_cdm_testing.visit (ptid, visitid, visit_type, visit_start_date, visit_start_time, visit_end_date, visit_end_time, discharge_disposition, admission_source) VALUES ('PT359', '362', 'Inpatient', '2014-03-05', '1900-01-01 00:00:00', '2014-03-10', '1900-01-01 00:00:00', '01 DISCHARGED TO HOME OR SELF CARE', 'Referred by physician or self referral; non-healthcare facility point of origin');
INSERT INTO scratch_cdm_testing.encounter (encid, ptid, visitid, interaction_type, interaction_date, interaction_time) VALUES ('E0000360', 'PT359', '362', 'Office or clinic patient', '2014-03-06', '1900-01-01 00:00:00');
INSERT INTO scratch_cdm_testing.encounter (encid, ptid, visitid, interaction_type, interaction_date, interaction_time) VALUES ('E0000361', 'PT359', '362', 'Office or clinic patient', '2014-03-07', '1900-01-01 00:00:00');

/*--*/
/* 13.1 Visit from Drug Exposure [Test ID: 192] */
/*--*/
