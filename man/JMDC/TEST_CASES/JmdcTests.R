source("JMDC_test_framework.R")

set_defaults_enrollment(observation_start = "201001", observation_end = "201712")
set_defaults_diagnosis(standard_disease_code = 123)
add_diagnosis_master(standard_disease_code = 123, icd10_level4_code = 'J309') # allergic rhinitis
set_defaults_procedure(standardized_procedure_id = 123, standardized_procedure_version = '201404')
add_procedure_master(standardized_procedure_id = 123, standardized_procedure_version = '201404', icd9cm_level1 = 9394) # Respiratory medication administered by nebulizer

# Person ------------------------------------------------------------------

declareTest(101, "Person id")
add_enrollment(member_id = "M000000101")
expect_person(person_id = 101, person_source_value = "M000000101")

declareTest(102, "Person gender mappings")
add_enrollment(member_id = "M000000102", gender_of_member = "male")
add_enrollment(member_id = "M000000103", gender_of_member = "female")
expect_person(person_id = 102, gender_concept_id = 8507, gender_source_value = "male")
expect_person(person_id = 103, gender_concept_id = 8532, gender_source_value = "female")

declareTest(103, "Person year and month of birth")
add_enrollment(member_id = "M000000104", month_and_year_of_birth_of_member = "197508")
expect_person(person_id = 104, year_of_birth = 1975)
expect_person(person_id = 104, month_of_birth = 8)

# Observation period ------------------------------------------------------------------

declareTest(201, "Observation period person id")
add_enrollment(member_id = "M000000201")
expect_observation_period(person_id = 201)

declareTest(202, "Observation period start date")
add_enrollment(member_id = "M000000202", observation_start = "201001", observation_end = "201212")
expect_observation_period(person_id = 202, observation_period_start_date = "20100101")

declareTest(203, "Observation period end date")
add_enrollment(member_id = "M000000203", observation_start = "201001", observation_end = "201412")
expect_observation_period(person_id = 203, observation_period_end_date = "20141231")

declareTest(204, "Observation period type")
add_enrollment(member_id = "M000000204", observation_start = "201001", observation_end = "201412")
expect_observation_period(person_id = 204, period_type_concept_id = 44814722)

# Care site ------------------------------------------------------------------

declareTest(301, "Care site id")
add_medical_facility(medical_facility_id = "F0000001")
expect_care_site(care_site_id = 10000001, care_site_source_value = "F0000001")

# Visit occurrence ------------------------------------------------------------------

declareTest(401, "Visit occurrence and person id")
add_enrollment(member_id = "M000000401")
add_claim(member_id = "M000000401", claim_id = "C000000000401")
expect_visit_occurrence(person_id = 401, visit_occurrence_id = 401)

declareTest(402, "Visit concept ID")
add_enrollment(member_id = "M000000402")
add_claim(member_id = "M000000402", claim_id = "C000000000402", type_of_claim = "Outpatient")
add_claim(member_id = "M000000402", claim_id = "C000000000403", type_of_claim = "DPC")
add_claim(member_id = "M000000402", claim_id = "C000000000404", type_of_claim = "Inpatient’")
expect_visit_occurrence(person_id = 402, visit_occurrence_id = 402, visit_concept_id = 9202)
expect_visit_occurrence(person_id = 402, visit_occurrence_id = 403, visit_concept_id = 9201)
expect_visit_occurrence(person_id = 402, visit_occurrence_id = 404, visit_concept_id = 9201)

declareTest(403, "Visit start date without other info")
add_enrollment(member_id = "M000000403")
add_claim(member_id = "M000000403", claim_id = "C000000000406", month_and_year_of_medical_care = "201002")
expect_visit_occurrence(person_id = 403, visit_occurrence_id = 406, visit_start_date = "2010-02-15")

declareTest(404, "Visit start date with admission date in month of care")
add_enrollment(member_id = "M000000404")
add_claim(member_id = "M000000404", claim_id = "C000000000407", month_and_year_of_medical_care = "201002", admission_date = "2010-02-05")
expect_visit_occurrence(person_id = 404, visit_occurrence_id = 407, visit_start_date = "2010-02-05")

declareTest(405, "Visit start date with admission date before month of care")
add_enrollment(member_id = "M000000405")
add_claim(member_id = "M000000405", claim_id = "C000000000408", month_and_year_of_medical_care = "201002", admission_date = "2010-01-05")
expect_visit_occurrence(person_id = 405, visit_occurrence_id = 408, visit_start_date = "2010-02-01")

declareTest(406, "Visit start date with prescription date")
add_enrollment(member_id = "M000000406")
add_claim(member_id = "M000000406", claim_id = "C000000000409", month_and_year_of_medical_care = "201002")
add_drug(member_id = "M000000406", claim_id = "C000000000409", date_of_prescription = "2010-02-05")
expect_visit_occurrence(person_id = 406, visit_occurrence_id = 409, visit_start_date = "2010-02-05")

declareTest(407, "Visit start date with procedure date")
add_enrollment(member_id = "M000000407")
add_claim(member_id = "M000000407", claim_id = "C000000000410", month_and_year_of_medical_care = "201002")
add_procedure(member_id = "M000000407", claim_id = "C000000000410", date_of_procedure = "2010-02-05")
expect_visit_occurrence(person_id = 407, visit_occurrence_id = 410, visit_start_date = "2010-02-05")

declareTest(408, "Visit start date from start of medical care")
add_enrollment(member_id = "M000000408")
add_claim(member_id = "M000000408", claim_id = "C000000000411", month_and_year_of_medical_care = "201002")
add_diagnosis(member_id = "M000000408", claim_id = "C000000000411", date_of_medical_care_start = "2010-02-08")
expect_visit_occurrence(person_id = 408, visit_occurrence_id = 411, visit_start_date = "2010-02-08")

declareTest(409, "Visit start date when start of medical care before month of care")
add_enrollment(member_id = "M000000409")
add_claim(member_id = "M000000409", claim_id = "C000000000412", month_and_year_of_medical_care = "201002")
add_diagnosis(member_id = "M000000409", claim_id = "C000000000412", date_of_medical_care_start = "2010-01-01")
expect_visit_occurrence(person_id = 409, visit_occurrence_id = 412, visit_start_date = "2010-02-15")

declareTest(410, "Visit end date")
add_enrollment(member_id = "M000000410")
add_claim(member_id = "M000000410", claim_id = "C000000000413", month_and_year_of_medical_care = "201002", days_of_medical_care = 3)
add_claim(member_id = "M000000410", claim_id = "C000000000414", month_and_year_of_medical_care = "201004", days_of_medical_care = 3, admission_date = "2010-04-05")
add_claim(member_id = "M000000410", claim_id = "C000000000415", month_and_year_of_medical_care = "201006", days_of_medical_care = 3, admission_date = "2010-05-05")
add_claim(member_id = "M000000410", claim_id = "C000000000416", month_and_year_of_medical_care = "201008", days_of_medical_care = 3)
add_claim(member_id = "M000000410", claim_id = "C000000000417", month_and_year_of_medical_care = "201010", days_of_medical_care = 3)
add_claim(member_id = "M000000410", claim_id = "C000000000418", month_and_year_of_medical_care = "201012", days_of_medical_care = 3)
add_claim(member_id = "M000000410", claim_id = "C000000000419", month_and_year_of_medical_care = "201102", days_of_medical_care = 3)
add_drug(member_id = "M000000410", claim_id = "C000000000416", date_of_prescription = "2010-08-05")
add_procedure(member_id = "M000000410", claim_id = "C000000000417", date_of_procedure = "2010-10-05")
add_diagnosis(member_id = "M000000410", claim_id = "C000000000418", date_of_medical_care_start = "2010-12-05")
add_diagnosis(member_id = "M000000410", claim_id = "C000000000419", date_of_medical_care_start = "2011-01-08")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 413, visit_end_date = "2010-02-17")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 414, visit_end_date = "2010-04-07")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 415, visit_end_date = "2010-06-03")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 416, visit_end_date = "2010-08-07")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 417, visit_end_date = "2010-10-07")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 418, visit_end_date = "2010-12-07")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 419, visit_end_date = "2011-02-17")

declareTest(411, "Visit type concept ID")
add_enrollment(member_id = "M000000411")
add_claim(member_id = "M000000411", claim_id = "C000000000420")
expect_visit_occurrence(person_id = 411, visit_occurrence_id = 420, visit_type_concept_id = 44818517)

declareTest(412, "Visit care site ID")
add_enrollment(member_id = "M000000412")
add_claim(member_id = "M000000412", claim_id = "C000000000421", medical_facility_id = "F0000002")
expect_visit_occurrence(person_id = 412, visit_occurrence_id = 421, care_site_id = 10000002)

declareTest(413, "Visit source value")
add_enrollment(member_id = "M000000413")
add_claim(member_id = "M000000413", claim_id = "C000000000422", type_of_claim = "Outpatient")
expect_visit_occurrence(person_id = 413, visit_occurrence_id = 422, visit_source_value = "Outpatient")

declareTest(414, "Visit start date from multiple start of medical care records")
add_enrollment(member_id = "M000000414")
add_claim(member_id = "M000000414", claim_id = "C000000000423", month_and_year_of_medical_care = "201002")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000423", date_of_medical_care_start = "2010-02-08")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000423", date_of_medical_care_start = "2010-02-12")
expect_visit_occurrence(person_id = 414, visit_occurrence_id = 423, visit_start_date = "2010-02-12")

add_claim(member_id = "M000000414", claim_id = "C000000000424", month_and_year_of_medical_care = "201003")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000424", date_of_medical_care_start = "2010-03-08")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000424", date_of_medical_care_start = "2010-03-12", medical_facility_id = "F0000002")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000424", date_of_medical_care_start = "2010-03-10", medical_facility_id = "F0000002")
expect_visit_occurrence(person_id = 414, visit_occurrence_id = 424, visit_start_date = "2010-03-08")

add_claim(member_id = "M000000414", claim_id = "C000000000425", month_and_year_of_medical_care = "201003")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000425", date_of_medical_care_start = "2010-03-12", medical_facility_id = "F0000002")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000425", date_of_medical_care_start = "2010-03-10", medical_facility_id = "F0000002")
expect_visit_occurrence(person_id = 414, visit_occurrence_id = 425, visit_start_date = "2010-03-15")

declareTest(415, "No visit occurrence when claim type is pharmacy")
add_enrollment(member_id = "M000000415")
add_claim(member_id = "M000000415", claim_id = "C000000000426", type_of_claim = "Pharmacy")
expect_no_visit_occurrence(person_id = 415)

# Provider ------------------------------------------------------------------

declareTest(501, "Provider ID from institution")
add_medical_facility(medical_facility_id = "F0000003")
expect_provider(provider_id = 10000003, provider_source_value = "F0000003")

declareTest(504, "Provider specialty")
add_medical_facility(medical_facility_id = "F0000005", medium_classification_of_department = "Cardiology")
expect_provider(care_site_id = 10000005, specialty_concept_id = 38004451, specialty_source_value = "Cardiology")


# Death ------------------------------------------------------------------

declareTest(601, "Death person ID from diagnosis")
add_enrollment(member_id = "M000000601")
add_claim(member_id = "M000000601", claim_id = "C000000000600")
add_diagnosis(member_id = "M000000601", claim_id = "C000000000600", outcome = 3)
expect_death(person_id = 601)

declareTest(602, "Death person ID from enrollement")
add_enrollment(member_id = "M000000602", withdrawal_death_flag = "true")
expect_death(person_id = 602)

declareTest(603, "Death date from diagnosis")
add_enrollment(member_id = "M000000603")
add_claim(member_id = "M000000603", claim_id = "C000000000601", month_and_year_of_medical_care = "201001", days_of_medical_care = 3, admission_date = 2010-01-01)
add_diagnosis(member_id = "M000000603", claim_id = "C000000000601", outcome = 3)
expect_death(person_id = 603, death_date = "2010-01-03")

declareTest(604, "Death date from enrollment")
add_enrollment(member_id = "M000000604", withdrawal_death_flag = "true", observation_start = "201001", observation_end = "201112")
expect_death(person_id = 604, death_date = "2011-12-31")

declareTest(605, "Death date from multiple diagnoses")
add_enrollment(member_id = "M000000605")
add_claim(member_id = "M000000605", claim_id = "C000000000602", month_and_year_of_medical_care = "201001", days_of_medical_care = 3, admission_date = 2010-01-01)
add_diagnosis(member_id = "M000000605", claim_id = "C000000000602", outcome = 3)
add_claim(member_id = "M000000605", claim_id = "C000000000603", month_and_year_of_medical_care = "201002", days_of_medical_care = 3, admission_date = 2010-02-01)
add_diagnosis(member_id = "M000000605", claim_id = "C000000000603", outcome = 3)
expect_death(person_id = 605, death_date = "2010-02-03")

declareTest(606, "Death date from diagnosis and enrollment")
add_enrollment(member_id = "M000000606", withdrawal_death_flag = "true", observation_start = "201001", observation_end = "201112")
add_claim(member_id = "M000000606", claim_id = "C000000000604", month_and_year_of_medical_care = "201001", days_of_medical_care = 3, admission_date = 2010-01-01)
add_diagnosis(member_id = "M000000606", claim_id = "C000000000604", outcome = 3)
expect_death(person_id = 606, death_date = "2010-01-03")

declareTest(607, "Death type concept ID")
add_enrollment(member_id = "M000000607", withdrawal_death_flag = "true")
add_enrollment(member_id = "M000000608")
add_claim(member_id = "M000000608", claim_id = "C000000000605")
add_diagnosis(member_id = "M000000608", claim_id = "C000000000605", outcome = 3)
expect_death(person_id = 607, death_type_concept_id = 38003565)
expect_death(person_id = 608, death_type_concept_id = 38003567)


# Condition occurrence ------------------------------------------------------------------

declareTest(701, "Condition occurrence person ID")
add_enrollment(member_id = "M000000701")
add_claim(member_id = "M000000701", claim_id = "C000000000701")
add_diagnosis(member_id = "M000000701", claim_id = "C000000000701")
expect_condition_occurrence(person_id = 701)

declareTest(702, "Condition occurrence visit occurrence ID")
add_enrollment(member_id = "M000000702")
add_claim(member_id = "M000000702", claim_id = "C000000000702")
add_diagnosis(member_id = "M000000702", claim_id = "C000000000702")
expect_condition_occurrence(visit_occurrence_id = 702)

declareTest(703, "Condition type concept ID")
add_enrollment(member_id = "M000000703")
add_claim(member_id = "M000000703", claim_id = "C000000000703")
add_diagnosis(member_id = "M000000703", claim_id = "C000000000703", type_of_claim = "Outpatient")
add_claim(member_id = "M000000703", claim_id = "C000000000704")
add_diagnosis(member_id = "M000000703", claim_id = "C000000000704", type_of_claim = "Inpatient")
add_claim(member_id = "M000000703", claim_id = "C000000000705")
add_diagnosis(member_id = "M000000703", claim_id = "C000000000705", type_of_claim = "DPC")
expect_condition_occurrence(person_id = 703, visit_occurrence_id = 703, condition_type_concept_id = 38000215)
expect_condition_occurrence(person_id = 703, visit_occurrence_id = 704, condition_type_concept_id = 38000184)
expect_condition_occurrence(person_id = 703, visit_occurrence_id = 705, condition_type_concept_id = 38000184)

declareTest(704, "Condition start date from admission date")
add_enrollment(member_id = "M000000704")
add_claim(member_id = "M000000704", claim_id = "C000000000706", month_and_year_of_medical_care = "201002", admission_date = "2010-01-01")
add_diagnosis(member_id = "M000000704", claim_id = "C000000000706")
expect_condition_occurrence(person_id = 704, visit_occurrence_id = 706, condition_start_date = "2010-01-01")

declareTest(705, "Condition start date from claim date")
add_enrollment(member_id = "M000000705")
add_claim(member_id = "M000000705", claim_id = "C000000000707", month_and_year_of_medical_care = "201002")
add_diagnosis(member_id = "M000000705", claim_id = "C000000000707")
expect_condition_occurrence(person_id = 705, visit_occurrence_id = 707, condition_start_date = "2010-02-15")

declareTest(706, "Condition provider ID")
add_enrollment(member_id = "M000000706")
add_claim(member_id = "M000000706", claim_id = "C000000000708")
add_diagnosis(member_id = "M000000706", claim_id = "C000000000708", medical_facility_id = "F0000006")
expect_condition_occurrence(person_id = 706, visit_occurrence_id = 708, provider_id = 10000006)

declareTest(707, "Condition concept ID and source values")
add_enrollment(member_id = "M000000707")
add_claim(member_id = "M000000707", claim_id = "C000000000709")
add_diagnosis(member_id = "M000000707", claim_id = "C000000000709", standard_disease_code = 1)
add_diagnosis_master(standard_disease_code = 1, icd10_level4_code = "I10-")
expect_condition_occurrence(person_id = 707, visit_occurrence_id = 709, condition_concept_id =  320128, condition_source_value = "I10-", condition_source_concept_id = 45591453)

declareTest(708, "Condition occurrence that are era-like")
add_enrollment(member_id = "M000000708", observation_start = "201001", observation_end = "201212")
add_claim(member_id = "M000000708", claim_id = "C000000000710", month_and_year_of_medical_care = "201002", days_of_medical_care = 1)
add_diagnosis(member_id = "M000000708", claim_id = "C000000000710", date_of_medical_care_start = "2010-01-05")
expect_condition_occurrence(person_id = 708, condition_type_concept_id = 38000246, condition_start_date = "2010-01-05", condition_end_date = "2010-02-15")

declareTest(709, "Condition occurrence that are era-like, start before OP start")
add_enrollment(member_id = "M000000709", observation_start = "201001", observation_end = "201212")
add_claim(member_id = "M000000709", claim_id = "C000000000711", month_and_year_of_medical_care = "201002", days_of_medical_care = 1)
add_diagnosis(member_id = "M000000709", claim_id = "C000000000711", date_of_medical_care_start = "2009-12-01")
expect_condition_occurrence(person_id = 709, condition_type_concept_id = 38000246, condition_start_date = "2010-01-01", condition_end_date = "2010-02-15")

declareTest(710, "Condition with suspicion flag")
add_enrollment(member_id = "M000000710")
add_claim(member_id = "M000000710", claim_id = "C000000000712")
add_diagnosis(member_id = "M000000710", claim_id = "C000000000712", standard_disease_code = 1, suspicion_flag = 1)
expect_no_condition_occurrence(person_id = 710)


# Drug exposure ------------------------------------------------------------------

declareTest(801, "Drug exposure person ID")
add_enrollment(member_id = "M000000801")
add_claim(member_id = "M000000801", claim_id = "C000000000801")
add_drug(member_id = "M000000801", claim_id = "C000000000801")
expect_drug_exposure(person_id = 801)

declareTest(802, "Drug exposure visit occurrence ID")
add_enrollment(member_id = "M000000802")
add_claim(member_id = "M000000802", claim_id = "C000000000802")
add_drug(member_id = "M000000802", claim_id = "C000000000802")
expect_drug_exposure(visit_occurrence_id = 802)

declareTest(803, "Drug exposure type concept ID")
add_enrollment(member_id = "M000000803")
add_claim(member_id = "M000000803", claim_id = "C000000000803")
add_drug(member_id = "M000000803", claim_id = "C000000000803", type_of_claim = "Outpatient")
add_claim(member_id = "M000000803", claim_id = "C000000000804")
add_drug(member_id = "M000000803", claim_id = "C000000000804", type_of_claim = "Inpatient")
add_claim(member_id = "M000000803", claim_id = "C000000000805")
add_drug(member_id = "M000000803", claim_id = "C000000000805", type_of_claim = "DPC")
add_claim(member_id = "M000000803", claim_id = "C000000000806")
add_drug(member_id = "M000000803", claim_id = "C000000000806", type_of_claim = "Pharmacy")
expect_drug_exposure(person_id = 803, visit_occurrence_id = 803, drug_type_concept_id = 38000175)
expect_drug_exposure(person_id = 803, visit_occurrence_id = 804, drug_type_concept_id = 38000180)
expect_drug_exposure(person_id = 803, visit_occurrence_id = 805, drug_type_concept_id = 38000180)
expect_drug_exposure(person_id = 803, visit_occurrence_id = 806, drug_type_concept_id = 38000175)

declareTest(804, "Drug provider from institution ID")
add_enrollment(member_id = "M000000804")
add_claim(member_id = "M000000804", claim_id = "C000000000807")
add_drug(member_id = "M000000804", claim_id = "C000000000807", medical_facility_id = "F0000007")
expect_drug_exposure(person_id = 804, visit_occurrence_id = 807, provider_id = 10000007)

declareTest(806, "Drug start date from prescription date")
add_enrollment(member_id = "M000000806")
add_claim(member_id = "M000000806", claim_id = "C000000000809")
add_drug(member_id = "M000000806", claim_id = "C000000000809", date_of_prescription = "2010-01-05")
expect_drug_exposure(person_id = 806, visit_occurrence_id = 809, drug_exposure_start_date = "2010-01-05")

declareTest(807, "Drug start date from visit date")
add_enrollment(member_id = "M000000807")
add_claim(member_id = "M000000807", claim_id = "C000000000810", month_and_year_of_medical_care = "201002", type_of_claim = "pharmacy")
add_drug(member_id = "M000000807", claim_id = "C000000000810", date_of_prescription = NULL)
expect_drug_exposure(person_id = 807, visit_occurrence_id = NULL, drug_exposure_start_date = "2010-02-15")

declareTest(808, "Drug end date")
add_enrollment(member_id = "M000000808")
add_claim(member_id = "M000000808", claim_id = "C000000000811")
add_claim(member_id = "M000000808", claim_id = "C000000000812")
add_drug(member_id = "M000000808", claim_id = "C000000000811", date_of_prescription = "2010-01-05", administered_days = 3)
add_drug(member_id = "M000000808", claim_id = "C000000000812", date_of_prescription = "2010-01-01", administered_days = 365)
expect_drug_exposure(person_id = 808, visit_occurrence_id = 811, drug_exposure_end_date = "2010-01-08")
date <- as.character(as.Date("2010-01-01") + 180)
expect_drug_exposure(person_id = 808, visit_occurrence_id = 812, drug_exposure_end_date = date)

declareTest(809, "Drug days supply")
add_enrollment(member_id = "M000000809")
add_claim(member_id = "M000000809", claim_id = "C000000000813")
add_claim(member_id = "M000000809", claim_id = "C000000000814")
add_drug(member_id = "M000000809", claim_id = "C000000000813", administered_days = 3)
add_drug(member_id = "M000000809", claim_id = "C000000000814", administered_days = 365)
expect_drug_exposure(person_id = 809, visit_occurrence_id = 813, days_supply = 3)
expect_drug_exposure(person_id = 809, visit_occurrence_id = 814, days_supply = 180)

declareTest(810, "Drug concept ID")
add_enrollment(member_id = "M000000810")
add_claim(member_id = "M000000810", claim_id = "C000000000815")
add_drug(member_id = "M000000810", claim_id = "C000000000815", jmdc_drug_code = 100000008105)
expect_drug_exposure(person_id = 810, visit_occurrence_id = 815, drug_concept_id = 1110727, drug_source_value = "100000008105")

declareTest(811, "Drug sig")
add_enrollment(member_id = "M000000811")
add_claim(member_id = "M000000811", claim_id = "C000000000816")
add_drug(member_id = "M000000811", claim_id = "C000000000816", as_needed_medication_flag = "1", prescribed_amount_per_day = 1, administered_amount = "20", unit_of_administered_amount = "g")
expect_drug_exposure(person_id = 811, visit_occurrence_id = 816, sig = "1 g per day as needed, 20 g total")


# Procedure occurrence ------------------------------------------------------------------

declareTest(901, "Procedure occurrence person ID")
add_enrollment(member_id = "M000000901")
add_claim(member_id = "M000000901", claim_id = "C000000000901")
add_procedure(member_id = "M000000901", claim_id = "C000000000901")
expect_procedure_occurrence(person_id = 901)

declareTest(902, "Procedure occurrence visit occurrence ID")
add_enrollment(member_id = "M000000902")
add_claim(member_id = "M000000902", claim_id = "C000000000902")
add_procedure(member_id = "M000000902", claim_id = "C000000000902")
expect_procedure_occurrence(visit_occurrence_id = 902)

declareTest(903, "Procedure occurrence type concept ID")
add_enrollment(member_id = "M000000903")
add_claim(member_id = "M000000903", claim_id = "C000000000903")
add_procedure(member_id = "M000000903", claim_id = "C000000000903", type_of_claim = "Outpatient")
add_claim(member_id = "M000000903", claim_id = "C000000000904")
add_procedure(member_id = "M000000903", claim_id = "C000000000904", type_of_claim = "Inpatient")
add_claim(member_id = "M000000903", claim_id = "C000000000905")
add_procedure(member_id = "M000000903", claim_id = "C000000000905", type_of_claim = "DPC")
expect_procedure_occurrence(person_id = 903, visit_occurrence_id = 903, procedure_type_concept_id = 38000215)
expect_procedure_occurrence(person_id = 903, visit_occurrence_id = 904, procedure_type_concept_id = 38000184)
expect_procedure_occurrence(person_id = 903, visit_occurrence_id = 905, procedure_type_concept_id = 38000184)

declareTest(904, "Procedure provider")
add_enrollment(member_id = "M000000904")
add_claim(member_id = "M000000904", claim_id = "C000000000907")
add_procedure(member_id = "M000000904", claim_id = "C000000000907", medical_facility_id = "F0000008")
expect_procedure_occurrence(person_id = 904, visit_occurrence_id = 907, provider_id = 10000008)

declareTest(906, "Procedure date from procedure date")
add_enrollment(member_id = "M000000906")
add_claim(member_id = "M000000906", claim_id = "C000000000909")
add_procedure(member_id = "M000000906", claim_id = "C000000000909", date_of_procedure = "2010-01-05")
expect_procedure_occurrence(person_id = 906, visit_occurrence_id = 909, procedure_date = "2010-01-05")

declareTest(907, "Procedure date from visit date")
add_enrollment(member_id = "M000000907")
add_claim(member_id = "M000000907", claim_id = "C000000000910", month_and_year_of_medical_care = "201002")
add_procedure(member_id = "M000000907", claim_id = "C000000000910", date_of_procedure = NULL)
expect_procedure_occurrence(person_id = 907, visit_occurrence_id = 910, procedure_date = "2010-02-15")

declareTest(908, "Procedure concept ID")
add_enrollment(member_id = "M000000908")
add_claim(member_id = "M000000908", claim_id = "C000000000911")
add_procedure(member_id = "M000000908", claim_id = "C000000000911", standardized_procedure_id = 1, standardized_procedure_version = 1)
add_procedure_master(standardized_procedure_id = 1, standardized_procedure_version = 1, icd9cm_level1 = "9394" )
expect_procedure_occurrence(person_id = 908, visit_occurrence_id = 911, procedure_concept_id = 2007683, procedure_source_value = "9394", procedure_source_concept_id = 2007683)

declareTest(909, "Procedure from diagnosis")
add_enrollment(member_id = "M000000909")
add_claim(member_id = "M000000909", claim_id = "C000000000912")
add_diagnosis(member_id = "M000000909", claim_id = "C000000000912", standard_disease_code = 2, type_of_claim = "Outpatient") 
add_diagnosis_master(standard_disease_code = 2, icd10_level4_code = "Z043") # Examination and observation following other accident
expect_procedure_occurrence(person_id = 909, visit_occurrence_id = 912, procedure_concept_id = 4085923, procedure_type_concept_id = 38000215)


# Measurement ------------------------------------------------------------------

declareTest(1001, "Measurement person ID")
add_enrollment(member_id = "M000001001")
add_annual_health_checkup(member_id = "M000001001")
expect_measurement(person_id = 1001)

declareTest(1002, "Measurement concept ID and type concept ID")
add_enrollment(member_id = "M000001002")
add_annual_health_checkup(member_id = "M000001002", bmi = "25", ecg = 1)
expect_measurement(person_id = 1002, measurement_concept_id = 3038553, measurement_type_concept_id = 38000277) # BMI
expect_measurement(person_id = 1002, measurement_concept_id = 42869419, measurement_type_concept_id = 38000279) # ECG

declareTest(1003, "Measurement date")
add_enrollment(member_id = "M000001003")
add_annual_health_checkup(member_id = "M000001003", date_of_health_checkup = "2010-01-16")
expect_measurement(person_id = 1003, measurement_date = "2010-01-16")

declareTest(1004, "Measurement value")
add_enrollment(member_id = "M000001004")
add_annual_health_checkup(member_id = "M000001004", bmi = "25.0", ecg = 1, triglyceride = 40, ast = 20, alt = 21)
expect_measurement(person_id = 1004, measurement_concept_id = 3038553, value_as_number = 25, value_source_value = "25.0", unit_concept_id = 9531)
expect_measurement(person_id = 1004, measurement_concept_id = 42869419, value_as_concept_id = 263654008, value_source_value = "1")
expect_measurement(person_id = 1004, measurement_concept_id = 3022038, value_as_number = 40, value_source_value = "40", unit_concept_id = 8840)
expect_measurement(person_id = 1004, measurement_concept_id = 3003792, value_as_number = 20, value_source_value = "20", unit_concept_id = 8645)
expect_measurement(person_id = 1004, measurement_concept_id = 3006923, value_as_number = 21, value_source_value = "21", unit_concept_id = 8645)



declareTest(1005, "Measurement normal ranges")
add_enrollment(member_id = "M000001005")
add_annual_health_checkup(member_id = "M000001005", systolic_bp = 110, diastolic_bp = 70)
expect_measurement(person_id = 1005, measurement_concept_id = 3004249, range_low = 60, range_high = 300)
expect_measurement(person_id = 1005, measurement_concept_id = 3012888, range_low = 30, range_high = 150)

declareTest(1006, "Measurement from diagnosis")
add_enrollment(member_id = "M000001006")
add_claim(member_id = "M000001006", claim_id = "C000000001001")
add_diagnosis(member_id = "M000001006", claim_id = "C000000001001", standard_disease_code = 3, type_of_claim = "Outpatient") 
add_diagnosis_master(standard_disease_code = 3, icd10_level4_code = "R824")# Acetonuria
expect_measurement(person_id = 1006, visit_occurrence_id = 1001, measurement_concept_id = 4042243, value_as_concept_id = 4181412, measurement_type_concept_id = 38000215)


# Observation ------------------------------------------------------------------

declareTest(1101, "Observation person ID from diagnosis")
add_enrollment(member_id = "M000001101")
add_claim(member_id = "M000001101", claim_id = "C000000001101")
add_diagnosis(member_id = "M000001101", claim_id = "C000000001101", standard_disease_code = 4) 
add_diagnosis_master(standard_disease_code = 4, icd10_level4_code = "Z914") # Personal history of psychological trauma, not elsewhere classified
expect_observation(person_id = 1101)

declareTest(1102, "Observation concept ID from diagnosis")
add_enrollment(member_id = "M000001102")
add_claim(member_id = "M000001102", claim_id = "C000000001102")
add_diagnosis(member_id = "M000001102", claim_id = "C000000001102", standard_disease_code = 4) 
expect_observation(person_id = 1102, observation_concept_id = 4214956, observation_source_concept_id = 45590771) # History of clinical finding in subject

declareTest(1103, "Observation value as concept ID from diagnosis")
add_enrollment(member_id = "M000001103")
add_claim(member_id = "M000001103", claim_id = "C000000001103")
add_diagnosis(member_id = "M000001103", claim_id = "C000000001103", standard_disease_code = 4) # Personal history of psychological trauma, not elsewhere classified
expect_observation(person_id = 1103, observation_concept_id = 4214956, value_as_concept_id = 439990) # Victim of psychological trauma

declareTest(1104, "Observation visit occurrence ID, provider ID, type concept ID from diagnosis")
add_enrollment(member_id = "M000001104")
add_claim(member_id = "M000001104", claim_id = "C000000001104")
add_diagnosis(member_id = "M000001104", claim_id = "C000000001104", standard_disease_code = 4, medical_facility_id = "F0000009", type_of_claim = "Outpatient") # Personal history of psychological trauma, not elsewhere classified
expect_observation(person_id = 1104, visit_occurrence_id = 1104, provider_id = 10000009, observation_type_concept_id = 38000215)

declareTest(1105, "Observation date from diagnosis with admission date")
add_enrollment(member_id = "M000001105")
add_claim(member_id = "M000001105", claim_id = "C000000001105", month_and_year_of_medical_care = "201001", admission_date = "20100101")
add_diagnosis(member_id = "M000001105", claim_id = "C000000001105", standard_disease_code = 4) # Personal history of psychological trauma, not elsewhere classified
expect_observation(person_id = 1105, visit_occurrence_id = 1105, observation_date = "2010-01-01")

declareTest(1106, "Observation date from diagnosis without admission date")
add_enrollment(member_id = "M000001106")
add_claim(member_id = "M000001106", claim_id = "C000000001106", month_and_year_of_medical_care = "201001", admission_date = NULL)
add_diagnosis(member_id = "M000001106", claim_id = "C000000001106", standard_disease_code = 4) # Personal history of psychological trauma, not elsewhere classified
expect_observation(person_id = 1106, visit_occurrence_id = 1106, observation_date = "2010-01-15")

declareTest(1107, "Observation from checkup")
add_enrollment(member_id = "M000001107")
add_annual_health_checkup(member_id = "M000001107", sleep = 2, date_of_health_checkup =  "2010-01-13")
expect_observation(person_id = 1107, observation_date = "2010-01-13", observation_concept_id = 40764749, value_as_concept_id = 4188540)


# Cost ------------------------------------------------------------------

declareTest(1201, "Claim cost")
add_enrollment(member_id = "M000001201")
add_claim(member_id = "M000001201", claim_id = "C000000001201", total_point = 123)
expect_cost(cost_event_id = 1201, cost_domain_id = "Visit", cost_type_concept_id = 5031, currency_concept_id = 44818592, total_paid = 1230)

declareTest(1202, "Procedure cost")
add_enrollment(member_id = "M000001202")
add_claim(member_id = "M000001202", claim_id = "C000000001202")
add_procedure(claim_id = "C000000001202", member_id = "M000001202", standardized_procedure_id = 2, standardized_procedure_version = '201404', number_of_times = 3)
add_procedure_master(standardized_procedure_id = 2, standardized_procedure_version = '201404', procedure_standard_point = 50)
expect_cost(cost_event_id = lookup_procedure_occurrence("procedure_occurrence_id", person_id = 1202, visit_occurrence_id = 1202), cost_domain_id = "Procedure", cost_type_concept_id = 5032, currency_concept_id = 44818592, total_charge = 1500)

declareTest(1203, "Drug cost")
add_enrollment(member_id = "M000001203")
add_claim(member_id = "M000001203", claim_id = "C000000001203")
add_drug(claim_id = "C000000001203", member_id = "M000001203",  jmdc_drug_code = 1, drug_price = 40, administered_amount = 2)
expect_cost(cost_event_id = lookup_drug_exposure("drug_exposure_id", person_id = 1203, visit_occurrence_id = 1203), cost_domain_id = "Drug", cost_type_concept_id = 5032, currency_concept_id = 44818592, total_charge = 80)


# Generate SQL -------------------------------------------------------------------

insertSql <- generateInsertSql(databaseSchema = "native.cdm_testing_jmdc")
testSql <- generateTestSql(databaseSchema = "testing.cdm_testing_jmdc")
write(insertSql, "insert.sql")
write(testSql, "test.sql")


# Execute tests ------------------------------------------------------------------
library(DatabaseConnector)
connectionDetails <- createConnectionDetails(user = Sys.getenv("userRds"),
                                             password = Sys.getenv("pwRds"),
                                             dbms = "sql server",
                                             server = Sys.getenv("serverRdsTesting"))
connection <- connect(connectionDetails)

executeSql(connection, paste(insertSql, collapse = "\n"))

# Run CDM_builder

executeSql(connection, paste(testSql, collapse = "\n"))

querySql(connection, "SELECT * FROM testing.cdm_testing_jmdc.test_results;")

querySql(connection, "SELECT * FROM testing.cdm_testing_jmdc.cost WHERE total_paid = 1230")

querySql(connection, "SELECT * FROM testing.cdm_testing_jmdc.visit_occurrence WHERE visit_occurrence_id =  620001201")

DatabaseConnector::disconnect(connection)
