source("JmdcTestFramework.R")

# Database time is specified by occurrences of first and last claims, so set these wide to include all test cases:
add_claim(member_id = "M000000999", claim_id = "C000000000999", month_and_year_of_medical_care = "200501")
add_claim(member_id = "M000000999", claim_id = "C000000000998", month_and_year_of_medical_care = "201412")


### Person ###

declareTest(101, "Person id")
add_enrollment(member_id = "M000000101")
expect_person(person_id = 101, person_source_value = "M000000101")

declareTest(102, "Person gender mappings")
add_enrollment(member_id = "M000000102", gender_of_member = "male")
add_enrollment(member_id = "M000000103", gender_of_member = "female")
expect_person(person_id = 102, gender_concept_id = 8507, gender_source_value = "male")
expect_person(person_id = 103, gender_concept_id = 8532, gender_source_value = "female")

declareTest(103, "Person year of birth")
add_enrollment(member_id = "M000000104", year_of_birth_of_member = 1975)
expect_person(person_id = 104, year_of_birth = 1975)


### Observation period ###

declareTest(201, "Observation period person id")
add_enrollment(member_id = "M000000201")
expect_observation_period(person_id = 201)

declareTest(202, "Observation period start date without truncation")
add_enrollment(member_id = "M000000202", month_and_year_of_entry = "201001", month_and_year_of_withdrawal = "201212")
expect_observation_period(person_id = 202, observation_period_start_date = "20100101")

declareTest(203, "Observation period start date with truncation")
add_enrollment(member_id = "M000000203", month_and_year_of_entry = "199001", month_and_year_of_withdrawal = "201212")
expect_observation_period(person_id = 203, observation_period_start_date = "20050101") # From first claim in database

declareTest(202, "Observation period end date without truncation")
add_enrollment(member_id = "M000000204", month_and_year_of_entry = "201001", month_and_year_of_withdrawal = "201212")
expect_observation_period(person_id = 204, observation_period_end_date = "20121231")

declareTest(203, "Observation period end date with truncation")
add_enrollment(member_id = "M000000205", month_and_year_of_entry = "201001", month_and_year_of_withdrawal = NULL)
expect_observation_period(person_id = 205, observation_period_end_date = "20141231") # From last claim in database


### Care site ###

declareTest(301, "Care site id")
add_institution(institution_id = "F0000001")
expect_care_site(care_site_id = 10000001, care_site_source_value = "F0000001")


### Visit occurrence ###

declareTest(401, "Visit occurrence and person id")
add_enrollment(member_id = "M000000401")
add_claim(member_id = "M000000401", claim_id = "C000000000401")
expect_visit_occurrence(person_id = 401, visit_occurrence_id = 401)

declareTest(402, "Visit concept ID")
add_enrollment(member_id = "M000000402")
add_claim(member_id = "M000000402", claim_id = "C000000000402", type_of_claim = "out-patient")
add_claim(member_id = "M000000402", claim_id = "C000000000403", type_of_claim = "pharmacy")
add_claim(member_id = "M000000402", claim_id = "C000000000404", type_of_claim = "DPC")
add_claim(member_id = "M000000402", claim_id = "C000000000405", type_of_claim = "in-patient")
expect_visit_occurrence(person_id = 402, visit_occurrence_id = 402, visit_concept_id = 9202)
expect_visit_occurrence(person_id = 402, visit_occurrence_id = 403, visit_concept_id = 9202)
expect_visit_occurrence(person_id = 402, visit_occurrence_id = 404, visit_concept_id = 9201)
expect_visit_occurrence(person_id = 402, visit_occurrence_id = 405, visit_concept_id = 9201)

declareTest(403, "Visit start date without other info")
add_enrollment(member_id = "M000000403")
add_claim(member_id = "M000000403", claim_id = "C000000000406", month_and_year_of_medical_care = "201002")
expect_visit_occurrence(person_id = 403, visit_occurrence_id = 406, visit_start_date = "2010-02-15")

declareTest(403, "Visit start date with admission date in month of care")
add_enrollment(member_id = "M000000404")
add_claim(member_id = "M000000404", claim_id = "C000000000407", month_and_year_of_medical_care = "201002")
add_diagnosis(member_id = "M000000404", claim_id = "C000000000407", admission_date = "2010-02-05")
expect_visit_occurrence(person_id = 404, visit_occurrence_id = 407, visit_start_date = "2010-02-05")

declareTest(404, "Visit start date with admission date before month of care")
add_enrollment(member_id = "M000000405")
add_claim(member_id = "M000000405", claim_id = "C000000000408", month_and_year_of_medical_care = "201002")
add_diagnosis(member_id = "M000000405", claim_id = "C000000000408", admission_date = "2010-01-05")
expect_visit_occurrence(person_id = 405, visit_occurrence_id = 408, visit_start_date = "2010-02-01")

declareTest(405, "Visit start date with prescription date")
add_enrollment(member_id = "M000000406")
add_claim(member_id = "M000000406", claim_id = "C000000000409", month_and_year_of_medical_care = "201002")
add_drug(member_id = "M000000406", claim_id = "C000000000409", date_of_prescription = "2010-02-05")
expect_visit_occurrence(person_id = 406, visit_occurrence_id = 409, visit_start_date = "2010-02-05")

declareTest(406, "Visit start date with procedure date")
add_enrollment(member_id = "M000000407")
add_claim(member_id = "M000000407", claim_id = "C000000000410", month_and_year_of_medical_care = "201002")
add_procedure(member_id = "M000000407", claim_id = "C000000000410", date_of_procedure = "2010-02-05")
expect_visit_occurrence(person_id = 407, visit_occurrence_id = 410, visit_start_date = "2010-02-05")

declareTest(407, "Visit start date from start of medical care")
add_enrollment(member_id = "M000000408")
add_claim(member_id = "M000000408", claim_id = "C000000000411", month_and_year_of_medical_care = "201002")
add_diagnosis(member_id = "M000000408", claim_id = "C000000000411", month_and_year_of_start_of_medical_care = "20100208")
expect_visit_occurrence(person_id = 408, visit_occurrence_id = 411, visit_start_date = "2010-02-08")

declareTest(408, "Visit start date when start of medical care before month of care")
add_enrollment(member_id = "M000000409")
add_claim(member_id = "M000000409", claim_id = "C000000000412", month_and_year_of_medical_care = "201002")
add_diagnosis(member_id = "M000000409", claim_id = "C000000000412", month_and_year_of_start_of_medical_care = "20100101")
expect_visit_occurrence(person_id = 409, visit_occurrence_id = 412, visit_start_date = "2010-02-15")

declareTest(409, "Visit end date")
add_enrollment(member_id = "M000000410")
add_claim(member_id = "M000000410", claim_id = "C000000000413", month_and_year_of_medical_care = "201002", actual_number_of_days_of_medical_care = 3)
add_claim(member_id = "M000000410", claim_id = "C000000000414", month_and_year_of_medical_care = "201004", actual_number_of_days_of_medical_care = 3)
add_claim(member_id = "M000000410", claim_id = "C000000000415", month_and_year_of_medical_care = "201006", actual_number_of_days_of_medical_care = 3)
add_claim(member_id = "M000000410", claim_id = "C000000000416", month_and_year_of_medical_care = "201008", actual_number_of_days_of_medical_care = 3)
add_claim(member_id = "M000000410", claim_id = "C000000000417", month_and_year_of_medical_care = "201010", actual_number_of_days_of_medical_care = 3)
add_claim(member_id = "M000000410", claim_id = "C000000000418", month_and_year_of_medical_care = "201012", actual_number_of_days_of_medical_care = 3)
add_claim(member_id = "M000000410", claim_id = "C000000000419", month_and_year_of_medical_care = "201102", actual_number_of_days_of_medical_care = 3)
add_diagnosis(member_id = "M000000410", claim_id = "C000000000414", admission_date = "2010-04-05")
add_diagnosis(member_id = "M000000410", claim_id = "C000000000415", admission_date = "2010-05-05")
add_drug(member_id = "M000000410", claim_id = "C000000000416", date_of_prescription = "2010-08-05")
add_procedure(member_id = "M000000410", claim_id = "C000000000417", date_of_procedure = "2010-10-05")
add_diagnosis(member_id = "M000000410", claim_id = "C000000000418", month_and_year_of_start_of_medical_care = "20101205")
add_diagnosis(member_id = "M000000410", claim_id = "C000000000419", month_and_year_of_start_of_medical_care = "20110108")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 413, visit_end_date = "2010-02-17")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 414, visit_end_date = "2010-04-07")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 415, visit_end_date = "2010-06-03")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 416, visit_end_date = "2010-08-07")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 417, visit_end_date = "2010-10-07")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 418, visit_end_date = "2010-12-07")
expect_visit_occurrence(person_id = 410, visit_occurrence_id = 419, visit_end_date = "2011-02-17")

declareTest(410, "Visit type concept ID")
add_enrollment(member_id = "M000000411")
add_claim(member_id = "M000000411", claim_id = "C000000000420")
expect_visit_occurrence(person_id = 411, visit_occurrence_id = 420, visit_type_concept_id = 44818517)

declareTest(411, "Visit care site ID")
add_enrollment(member_id = "M000000412")
add_claim(member_id = "M000000412", claim_id = "C000000000421", institution_id = "F0000002")
expect_visit_occurrence(person_id = 412, visit_occurrence_id = 421, care_site_id = 10000002)

declareTest(412, "Visit source value")
add_enrollment(member_id = "M000000413")
add_claim(member_id = "M000000413", claim_id = "C000000000422", type_of_claim = "pharmacy")
expect_visit_occurrence(person_id = 413, visit_occurrence_id = 422, visit_source_value = "pharmacy")

declareTest(413, "Visit start date from multiple start of medical care records")
add_enrollment(member_id = "M000000414")
add_claim(member_id = "M000000414", claim_id = "C000000000423", month_and_year_of_medical_care = "201002")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000423", month_and_year_of_start_of_medical_care = "20100208")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000423", month_and_year_of_start_of_medical_care = "20100212")
expect_visit_occurrence(person_id = 414, visit_occurrence_id = 423, visit_start_date = "2010-02-12")

add_claim(member_id = "M000000414", claim_id = "C000000000424", month_and_year_of_medical_care = "201003")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000424", month_and_year_of_start_of_medical_care = "20100308")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000424", month_and_year_of_start_of_medical_care = "20100312", institution_id = 123)
add_diagnosis(member_id = "M000000414", claim_id = "C000000000424", month_and_year_of_start_of_medical_care = "20100310", institution_id = 123)
expect_visit_occurrence(person_id = 414, visit_occurrence_id = 424, visit_start_date = "2010-03-08")

add_claim(member_id = "M000000414", claim_id = "C000000000425", month_and_year_of_medical_care = "201003")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000425", month_and_year_of_start_of_medical_care = "20100312", institution_id = 123)
add_diagnosis(member_id = "M000000414", claim_id = "C000000000425", month_and_year_of_start_of_medical_care = "20100310", institution_id = 123)
expect_visit_occurrence(person_id = 414, visit_occurrence_id = 425, visit_start_date = "2010-03-15")

### Provider ###

declareTest(501, "Provider ID from institution")
add_institution(institution_id = "F0000003")
expect_provider(provider_id = 10000003, provider_source_value = "F0000003")

declareTest(502, "Provider ID from physician")
add_physician(physician_id = "P0000001")
expect_provider(provider_id = 20000001, provider_source_value = "P0000001")

declareTest(503, "Provider care site ID")
add_institution(institution_id = "F0000004")
expect_provider(care_site_id = 10000004)

declareTest(504, "Provider specialty")
add_institution(institution_id = "F0000005", medium_classification_of_department = "Cardiology")
expect_provider(care_site_id = 10000005, specialty_concept_id = 38004451, specialty_source_value = "Cardiology")


### Death ###

declareTest(601, "Death person ID from diagnosis")
add_enrollment(member_id = "M000000601")
add_claim(member_id = "M000000601", claim_id = "C000000000600")
add_diagnosis(member_id = "M000000601", claim_id = "C000000000600", outcome = 2)
expect_death(person_id = 601)

declareTest(602, "Death person ID from enrollement")
add_enrollment(member_id = "M000000602", death_flag = 1)
expect_death(person_id = 602)

declareTest(603, "Death date from diagnosis")
add_enrollment(member_id = "M000000603")
add_claim(member_id = "M000000603", claim_id = "C000000000601", month_and_year_of_medical_care = "201001", actual_number_of_days_of_medical_care = 3)
add_diagnosis(member_id = "M000000603", claim_id = "C000000000601", admission_date = 2010-01-01, outcome = 2)
expect_death(person_id = 603, death_date = "2010-01-03")

declareTest(604, "Death date from enrollemnt")
add_enrollment(member_id = "M000000604", death_flag = 1, month_and_year_of_entry = "201001", month_and_year_of_withdrawal = "201112")
expect_death(person_id = 604, death_date = "2011-12-31")

declareTest(605, "Death date from multiple diagnoses")
add_enrollment(member_id = "M000000605")
add_claim(member_id = "M000000605", claim_id = "C000000000602", month_and_year_of_medical_care = "201001", actual_number_of_days_of_medical_care = 3)
add_diagnosis(member_id = "M000000605", claim_id = "C000000000602", admission_date = 2010-01-01, outcome = 2)
add_claim(member_id = "M000000605", claim_id = "C000000000603", month_and_year_of_medical_care = "201002", actual_number_of_days_of_medical_care = 3)
add_diagnosis(member_id = "M000000605", claim_id = "C000000000603", admission_date = 2010-02-01, outcome = 2)
expect_death(person_id = 605, death_date = "2010-02-03")

declareTest(606, "Death date from diagnosis and enrollment")
add_enrollment(member_id = "M000000606", death_flag = 1, month_and_year_of_entry = "201001", month_and_year_of_withdrawal = "201112")
add_claim(member_id = "M000000606", claim_id = "C000000000604", month_and_year_of_medical_care = "201001", actual_number_of_days_of_medical_care = 3)
add_diagnosis(member_id = "M000000606", claim_id = "C000000000604", admission_date = 2010-01-01, outcome = 2)
expect_death(person_id = 606, death_date = "2010-01-03")

declareTest(607, "Death type concept ID")
add_enrollment(member_id = "M000000607", death_flag = 1)
add_enrollment(member_id = "M000000608")
add_claim(member_id = "M000000608", claim_id = "C000000000605")
add_diagnosis(member_id = "M000000608", claim_id = "C000000000605", outcome = 2)
expect_death(person_id = 607, death_type_concept_id = 38003565)
expect_death(person_id = 608, death_type_concept_id = 38003567)


### Condition occurrence ###

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
add_diagnosis(member_id = "M000000703", claim_id = "C000000000703", type_of_claim = "out-patient")
add_claim(member_id = "M000000703", claim_id = "C000000000704")
add_diagnosis(member_id = "M000000703", claim_id = "C000000000704", type_of_claim = "in-patient")
add_claim(member_id = "M000000703", claim_id = "C000000000705")
add_diagnosis(member_id = "M000000703", claim_id = "C000000000705", type_of_claim = "DPC")
expect_condition_occurrence(person_id = 703, visit_occurrence_id = 703, condition_type_concept_id = 38000215)
expect_condition_occurrence(person_id = 703, visit_occurrence_id = 704, condition_type_concept_id = 38000184)
expect_condition_occurrence(person_id = 703, visit_occurrence_id = 705, condition_type_concept_id = 38000184)

declareTest(704, "Condition start date from admission date")
add_enrollment(member_id = "M000000704")
add_claim(member_id = "M000000704", claim_id = "C000000000706", month_and_year_of_medical_care = "201002")
add_diagnosis(member_id = "M000000704", claim_id = "C000000000706", admission_date = "2010-01-01")
expect_condition_occurrence(person_id = 704, visit_occurrence_id = 706, condition_start_date = "2010-01-01")

declareTest(705, "Condition start date from claim date")
add_enrollment(member_id = "M000000705")
add_claim(member_id = "M000000705", claim_id = "C000000000707", month_and_year_of_medical_care = "201002")
add_diagnosis(member_id = "M000000705", claim_id = "C000000000707")
expect_condition_occurrence(person_id = 705, visit_occurrence_id = 707, condition_start_date = "2010-02-15")

declareTest(706, "Condition provider ID")
add_enrollment(member_id = "M000000706")
add_claim(member_id = "M000000706", claim_id = "C000000000708")
add_diagnosis(member_id = "M000000706", claim_id = "C000000000708", institution_id = "F0000006")
expect_condition_occurrence(person_id = 706, visit_occurrence_id = 708, provider_id = 10000006)

declareTest(707, "Condition concept ID and source values")
add_enrollment(member_id = "M000000707")
add_claim(member_id = "M000000707", claim_id = "C000000000709")
add_diagnosis(member_id = "M000000707", claim_id = "C000000000709", icd10_level4_code = "I10-")
expect_condition_occurrence(person_id = 707, visit_occurrence_id = 709, condition_concept_id =  320128, condition_source_value = "I10-", condition_source_concept_id = 45591453)

declareTest(708, "Condition occurrence that are era-like")
add_enrollment(member_id = "M000000708", month_and_year_of_entry = "201001", month_and_year_of_withdrawal = "201212")
add_claim(member_id = "M000000708", claim_id = "C000000000710", month_and_year_of_medical_care = "201002", actual_number_of_days_of_medical_care = 1)
add_diagnosis(member_id = "M000000708", claim_id = "C000000000710", month_and_year_of_start_of_medical_care = "20100105")
expect_condition_occurrence(person_id = 708, condition_type_concept_id = 38000246, condition_start_date = "2010-01-05", condition_end_date = "2010-02-15")

declareTest(709, "Condition occurrence that are era-like, start before OP start")
add_enrollment(member_id = "M000000709", month_and_year_of_entry = "201001", month_and_year_of_withdrawal = "201212")
add_claim(member_id = "M000000709", claim_id = "C000000000711", month_and_year_of_medical_care = "201002", actual_number_of_days_of_medical_care = 1)
add_diagnosis(member_id = "M000000709", claim_id = "C000000000711", month_and_year_of_start_of_medical_care = "20091201")
expect_condition_occurrence(person_id = 709, condition_type_concept_id = 38000246, condition_start_date = "2010-01-01", condition_end_date = "2010-02-15")


### Drug exposure ###

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
add_drug(member_id = "M000000803", claim_id = "C000000000803", type_of_claim = "out-patient")
add_claim(member_id = "M000000803", claim_id = "C000000000804")
add_drug(member_id = "M000000803", claim_id = "C000000000804", type_of_claim = "in-patient")
add_claim(member_id = "M000000803", claim_id = "C000000000805")
add_drug(member_id = "M000000803", claim_id = "C000000000805", type_of_claim = "DPC")
add_claim(member_id = "M000000803", claim_id = "C000000000806")
add_drug(member_id = "M000000803", claim_id = "C000000000806", type_of_claim = "pharmacy")
expect_drug_exposure(person_id = 803, visit_occurrence_id = 803, drug_type_concept_id = 38000175)
expect_drug_exposure(person_id = 803, visit_occurrence_id = 804, drug_type_concept_id = 38000180)
expect_drug_exposure(person_id = 803, visit_occurrence_id = 805, drug_type_concept_id = 38000180)
expect_drug_exposure(person_id = 803, visit_occurrence_id = 806, drug_type_concept_id = 38000175)

declareTest(804, "Drug provider from institution ID")
add_enrollment(member_id = "M000000804")
add_claim(member_id = "M000000804", claim_id = "C000000000807")
add_drug(member_id = "M000000804", claim_id = "C000000000807", institution_id = "F0000007", physician_id = NULL)
expect_drug_exposure(person_id = 804, visit_occurrence_id = 807, provider_id = 10000007)

declareTest(805, "Drug provider from physician ID")
add_enrollment(member_id = "M000000805")
add_claim(member_id = "M000000805", claim_id = "C000000000808")
add_drug(member_id = "M000000805", claim_id = "C000000000808", institution_id = "F0000007", physician_id = "P0000002")
expect_drug_exposure(person_id = 805, visit_occurrence_id = 808, provider_id = 20000002)

declareTest(806, "Drug start date from prescription date")
add_enrollment(member_id = "M000000806")
add_claim(member_id = "M000000806", claim_id = "C000000000809")
add_drug(member_id = "M000000806", claim_id = "C000000000809", date_of_prescription = "2010-01-05")
expect_drug_exposure(person_id = 806, visit_occurrence_id = 809, drug_exposure_start_date = "2010-01-05")

declareTest(807, "Drug start date from visit date")
add_enrollment(member_id = "M000000807")
add_claim(member_id = "M000000807", claim_id = "C000000000810", month_and_year_of_medical_care = "201002")
add_drug(member_id = "M000000807", claim_id = "C000000000810", date_of_prescription = NULL)
expect_drug_exposure(person_id = 807, visit_occurrence_id = 810, drug_exposure_start_date = "2010-02-15")

declareTest(808, "Drug end date")
add_enrollment(member_id = "M000000808")
add_claim(member_id = "M000000808", claim_id = "C000000000811")
add_claim(member_id = "M000000808", claim_id = "C000000000812")
add_drug(member_id = "M000000808", claim_id = "C000000000811", date_of_prescription = "2010-01-05", duration_per_prescription = 3)
add_drug(member_id = "M000000808", claim_id = "C000000000812", date_of_prescription = "2010-01-01", duration_per_prescription = 365)
expect_drug_exposure(person_id = 808, visit_occurrence_id = 811, drug_exposure_end_date = "2010-01-08")
date <- as.character(as.Date("2010-01-01") + 180)
expect_drug_exposure(person_id = 808, visit_occurrence_id = 812, drug_exposure_end_date = date)

declareTest(809, "Drug days supply")
add_enrollment(member_id = "M000000809")
add_claim(member_id = "M000000809", claim_id = "C000000000813")
add_claim(member_id = "M000000809", claim_id = "C000000000814")
add_drug(member_id = "M000000809", claim_id = "C000000000813", duration_per_prescription = 3)
add_drug(member_id = "M000000809", claim_id = "C000000000814", duration_per_prescription = 365)
expect_drug_exposure(person_id = 809, visit_occurrence_id = 813, days_supply = 3)
expect_drug_exposure(person_id = 809, visit_occurrence_id = 814, days_supply = 180)

declareTest(810, "Drug concept ID")
add_enrollment(member_id = "M000000810")
add_claim(member_id = "M000000810", claim_id = "C000000000815")
add_drug(member_id = "M000000810", claim_id = "C000000000815", drug_code = "100000008105")
expect_drug_exposure(person_id = 810, visit_occurrence_id = 815, drug_concept_id = 1110727, drug_source_value = "100000008105")

declareTest(811, "Drug sig")
add_enrollment(member_id = "M000000811")
add_claim(member_id = "M000000811", claim_id = "C000000000816")
add_drug(member_id = "M000000811", claim_id = "C000000000816", as_needed_medication_flag = "1", daily_dose_per_prescription = "2", unit_of_administered_amount = "g")
expect_drug_exposure(person_id = 811, visit_occurrence_id = 816, sig = "2 g as needed")


### Procedure occurrence ###

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
add_procedure(member_id = "M000000903", claim_id = "C000000000903", type_of_claim = "out-patient")
add_claim(member_id = "M000000903", claim_id = "C000000000904")
add_procedure(member_id = "M000000903", claim_id = "C000000000904", type_of_claim = "in-patient")
add_claim(member_id = "M000000903", claim_id = "C000000000905")
add_procedure(member_id = "M000000903", claim_id = "C000000000905", type_of_claim = "DPC")
expect_procedure_occurrence(person_id = 903, visit_occurrence_id = 903, procedure_type_concept_id = 38000215)
expect_procedure_occurrence(person_id = 903, visit_occurrence_id = 904, procedure_type_concept_id = 38000184)
expect_procedure_occurrence(person_id = 903, visit_occurrence_id = 905, procedure_type_concept_id = 38000184)

declareTest(904, "Procedure provider")
add_enrollment(member_id = "M000000904")
add_claim(member_id = "M000000904", claim_id = "C000000000907")
add_procedure(member_id = "M000000904", claim_id = "C000000000907", institution_id = "F0000008")
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
add_procedure(member_id = "M000000908", claim_id = "C000000000911", icd9cm_level1 = "9394")
expect_procedure_occurrence(person_id = 908, visit_occurrence_id = 911, procedure_concept_id = 2007683, procedure_source_value = "9394", procedure_source_concept_id = 2007683)

declareTest(909, "Procedure from diagnosis")
add_enrollment(member_id = "M000000909")
add_claim(member_id = "M000000909", claim_id = "C000000000912")
add_diagnosis(member_id = "M000000909", claim_id = "C000000000912", icd10_level4_code = "Z043", type_of_claim = "out-patient") # Examination and observation following other accident
expect_procedure_occurrence(person_id = 909, visit_occurrence_id = 912, procedure_concept_id = 4085923, procedure_type_concept_id = 38000215)


### Measurement ###

declareTest(1001, "Measurement person ID")
add_enrollment(member_id = "M000001001")
add_health_checkups(member_id = "M000001001")
expect_measurement(person_id = 1001)

declareTest(1002, "Measurement concept ID and type concept ID")
add_enrollment(member_id = "M000001002")
add_health_checkups(member_id = "M000001002", bmi = "25", electrocardiogram = 1)
expect_measurement(person_id = 1002, measurement_concept_id = 3038553, measurement_type_concept_id = 38000277) # BMI
expect_measurement(person_id = 1002, measurement_concept_id = 42869419, measurement_type_concept_id = 38000279) # ECG

declareTest(1003, "Measurement date")
add_enrollment(member_id = "M000001003")
add_health_checkups(member_id = "M000001003", month_and_year_of_health_chechups = "201001")
expect_measurement(person_id = 1003, measurement_date = "2010-01-15")

declareTest(1004, "Measurement value")
add_enrollment(member_id = "M000001004")
add_health_checkups(member_id = "M000001004", bmi = "25.0", electrocardiogram = 1)
expect_measurement(person_id = 1004, measurement_concept_id = 3038553, value_as_number = 25, value_source_value = "25.0", unit_concept_id = 9531)
expect_measurement(person_id = 1004, measurement_concept_id = 42869419, value_as_concept_id = 263654008, value_source_value = "1")

declareTest(1005, "Measurement normal ranges")
add_enrollment(member_id = "M000001005")
add_health_checkups(member_id = "M000001005", sbp = 110, dbp = 70)
expect_measurement(person_id = 1005, measurement_concept_id = 3004249, range_low = 60, range_high = 300)
expect_measurement(person_id = 1005, measurement_concept_id = 3012888, range_low = 30, range_high = 150)

declareTest(1006, "Measurement from diagnosis")
add_enrollment(member_id = "M000001006")
add_claim(member_id = "M000001006", claim_id = "C000000001001")
add_diagnosis(member_id = "M000001006", claim_id = "C000000001001", icd10_level4_code = "R824", type_of_claim = "out-patient") # Acetonuria
expect_measurement(person_id = 1006, visit_occurrence_id = 1001, measurement_concept_id = 441968, value_as_concept_id = 4181412, measurement_type_concept_id = 38000215)


### Observation ###

declareTest(1101, "Observation person ID from diagnosis")
add_enrollment(member_id = "M000001101")
add_claim(member_id = "M000001101", claim_id = "C000000001101")
add_diagnosis(member_id = "M000001101", claim_id = "C000000001101", icd10_level4_code = "Z914") # Personal history of psychological trauma, not elsewhere classified
expect_observation(person_id = 1101)

declareTest(1102, "Observation concept ID from diagnosis")
add_enrollment(member_id = "M000001102")
add_claim(member_id = "M000001102", claim_id = "C000000001102")
add_diagnosis(member_id = "M000001102", claim_id = "C000000001102", icd10_level4_code = "Z914") # Personal history of psychological trauma, not elsewhere classified
expect_observation(person_id = 1102, observation_concept_id = 4214956, observation_source_concept_id = 45590771) # History of clinical finding in subject

declareTest(1103, "Observation value as concept ID from diagnosis")
add_enrollment(member_id = "M000001103")
add_claim(member_id = "M000001103", claim_id = "C000000001103")
add_diagnosis(member_id = "M000001103", claim_id = "C000000001103", icd10_level4_code = "Z914") # Personal history of psychological trauma, not elsewhere classified
expect_observation(person_id = 1103, observation_concept_id = 4214956, value_as_concept_id = 439990) # Victim of psychological trauma

declareTest(1104, "Observation visit occurrence ID, provider ID, type concept ID from diagnosis")
add_enrollment(member_id = "M000001104")
add_claim(member_id = "M000001104", claim_id = "C000000001104")
add_diagnosis(member_id = "M000001104", claim_id = "C000000001104", icd10_level4_code = "Z914", institution_id = "F0000009", type_of_claim = "out-patient") # Personal history of psychological trauma, not elsewhere classified
expect_observation(person_id = 1104, visit_occurrence_id = 1104, provider_id = 10000009, observation_type_concept_id = 38000215)

declareTest(1105, "Observation date from diagnosis with admission date")
add_enrollment(member_id = "M000001105")
add_claim(member_id = "M000001105", claim_id = "C000000001105", month_and_year_of_medical_care = "201001")
add_diagnosis(member_id = "M000001105", claim_id = "C000000001105", icd10_level4_code = "Z914", admission_date = "20100101") # Personal history of psychological trauma, not elsewhere classified
expect_observation(person_id = 1105, visit_occurrence_id = 1105, observation_date = "2010-01-01")

declareTest(1106, "Observation date from diagnosis without admission date")
add_enrollment(member_id = "M000001106")
add_claim(member_id = "M000001106", claim_id = "C000000001106", month_and_year_of_medical_care = "201001")
add_diagnosis(member_id = "M000001106", claim_id = "C000000001106", icd10_level4_code = "Z914", admission_date = NULL) # Personal history of psychological trauma, not elsewhere classified
expect_observation(person_id = 1106, visit_occurrence_id = 1106, observation_date = "2010-01-15")

declareTest(1107, "Observation from checkup")
add_enrollment(member_id = "M000001107")
add_health_checkups(member_id = "M000001107", sleeping = 2, month_and_year_of_health_chechups = "201001")
expect_observation(person_id = 1107, observation_date = "2010-01-15", observation_concept_id = 40764749, value_as_concept_id = 4188540)


### Drug cost ###

declareTest(1201, "Drug cost")
add_enrollment(member_id = "M000001201")
add_claim(member_id = "M000001201", claim_id = "C000000001201")
add_drug(member_id = "M000001201", claim_id = "C000000001201", actual_point = 123)
expect_drug_cost(total_paid = 1230)


### Procedure cost ###

declareTest(1301, "Procedure cost")
add_enrollment(member_id = "M000001301")
add_claim(member_id = "M000001301", claim_id = "C000000001301")
add_procedure(member_id = "M000001301", claim_id = "C000000001301", actual_point = 123)
expect_procedure_cost(total_paid = 1230)

write(insertSql, "insert.sql")
write(testSql, "test.sql")


### Execute tests ###
library(DatabaseConnector)
connectionDetails <- createConnectionDetails(user = "cdm_builder",
                                             password = Sys.getenv("pwCdmBuilder"),
                                             dbms = "sql server",
                                             server = "RNDUSRDHIT09.jnj.com")
connection <- connect(connectionDetails)

executeSql(connection, "USE jmdc_test")
executeSql(connection, paste(insertSql, collapse = "\n"))

# Run CDM_builder

executeSql(connection, "USE jmdc_cdm")
executeSql(connection, paste(testSql, collapse = "\n"))

querySql(connection, "SELECT * FROM test_results")
querySql(connection, "SELECT COUNT(*) FROM test_results WHERE status = 'FAIL'")


executeSql(connection, "USE jmdc_test")
querySql(connection, "SELECT * FROM Diagnosis WHERE [Member ID] = 'M000000601'")

executeSql(connection, "USE jmdc_cdm")
querySql(connection, "SELECT * FROM visit_occurrence WHERE person_id = 414")

add_claim(member_id = "M000000414", claim_id = "C000000000424", month_and_year_of_medical_care = "201003")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000424", month_and_year_of_start_of_medical_care = "20100308")
add_diagnosis(member_id = "M000000414", claim_id = "C000000000424", month_and_year_of_start_of_medical_care = "20100312", institution_id = 123)
add_diagnosis(member_id = "M000000414", claim_id = "C000000000424", month_and_year_of_start_of_medical_care = "20100310", institution_id = 123)
expect_visit_occurrence(person_id = 414, visit_occurrence_id = 424, visit_start_date = "2010-03-12")


executeSql(connection, "USE jmdc_cdm")
x <- querySql(connection, "SELECT MEASUREMENT_TYPE_CONCEPT_ID FROM measurement WHERE person_id = 1002 AND measurement_concept_id = 42869419")


add_enrollment(member_id = "M000001002")
add_health_checkups(member_id = "M000001002", bmi = "25", electrocardiogram = 1)
expect_measurement(person_id = 1002, measurement_concept_id = 3038553, measurement_type_concept_id = 38000277) # BMI
expect_measurement(person_id = 1002, measurement_concept_id = 42869419, measurement_type_concept_id = 38000279) # ECG, failing, currently type_concept_id = 900000004 


