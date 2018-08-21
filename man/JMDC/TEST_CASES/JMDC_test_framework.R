initFramework <- function() {
  frameworkContext <- new.env(parent = globalenv())
  assign('frameworkContext', frameworkContext, envir = globalenv())
  frameworkContext$inserts <- list()
  frameworkContext$expects <- list()
  frameworkContext$testId <- -1
  frameworkContext$testDescription <- ""
  frameworkContext$defaultValues <- new.env(parent = frameworkContext)

  defaults <- list()
  defaults$member_id <- 'M012602920'
  defaults$type_of_claim <- 'Outpatient'
  defaults$month_and_year_of_medical_care <- '201603'
  defaults$days_of_medical_care <- '1'
  defaults$medical_facility_id <- 'F0110804'
  defaults$total_point <- '338'
  assign('claim', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$month_and_year_of_birth_of_member <- '198407'
  defaults$gender_of_member <- 'Male'
  defaults$insured_or_dependent <- 'Insured'
  defaults$observation_start <- '201304'
  defaults$observation_end <- '201706'
  assign('enrollment', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$member_id <- 'M003175199'
  defaults$type_of_claim <- 'Outpatient'
  defaults$date_of_medical_care_start <- '2014-04-28'
  defaults$month_and_year_of_medical_care <- '201603'
  defaults$standard_disease_code <- '4779004'
  defaults$medical_facility_id <- 'F0280760'
  defaults$statement_id <- '1'
  defaults$standard_disease_name <- 'allergic rhinitis'
  defaults$outcome <- '0'
  assign('diagnosis', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$icd10_level1_code <- 'S00-T98'
  defaults$icd10_level1_name <- 'Injury, poisoning and certain other consequences of external causes'
  defaults$icd10_level2_code <- 'D10-D36'
  defaults$icd10_level2_name <- 'Benign neoplasms'
  defaults$icd10_level3_code <- 'C44'
  defaults$icd10_level3_name <- 'Other malignant neoplasms of skin'
  defaults$icd10_level4_code <- 'D180'
  defaults$icd10_level4_name <- 'Haemangioma, any site'
  assign('diagnosis_master', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$member_id <- 'M004580354'
  defaults$type_of_claim <- 'Outpatient'
  defaults$month_and_year_of_medical_care <- '201603'
  defaults$standardized_procedure_id <- '112007410'
  defaults$medical_facility_id <- 'F0280760'
  defaults$statement_id <- '1'
  defaults$standardized_procedure_version <- '201404'
  defaults$standardized_procedure_name <- 'prescription fee, other'
  defaults$number_of_times <- '1'
  defaults$concurrent_id <- '1'
  defaults$category_of_medical_care <- '60'
  defaults$actual_point <- '0'
  assign('procedure', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$standardized_procedure_id <- '160076210'
  defaults$standardized_procedure_version <- '201604'
  defaults$standardized_procedure_name <- 'additional fee for play space, nursery teacher etc. <pediatric inpatient management fee>'
  defaults$procedure_category_medium_classification_name <- 'surgery'
  defaults$procedure_category_small_classification_name <- 'surgery fee'
  defaults$procedure_category_subclassification_name <- 'musculoskeletal system / extremity / trunk'
  defaults$procedure_code <- 'D007'
  defaults$procedure_standard_point <- '100'
  assign('procedure_master', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$date_of_health_checkup <- '2013-04-01'
  defaults$diastolic_bp <- '70'
  defaults$urinary_sugar <- '1'
  defaults$uric_protein_qualitative <- '1'
  defaults$presence_of_medical_history <- '2'
  defaults$presence_of_subjective_symptoms <- '2'
  defaults$presence_of_objective_symptoms <- '2'
  defaults$smoking_habit <- '2'
  defaults$eating1_fast_eating <- '2'
  defaults$eating2_before_bedtime <- '2'
  defaults$eating3_late_evening_snack <- '2'
  defaults$eating_habit <- '2'
  defaults$drinking_habit <- '3'
  defaults$sleep <- '1'
  defaults$Drug1_Hypertention <- '2'
  defaults$Drug2_Diabetes <- '2'
  defaults$Drug3_Hyperlipidemia <- '2'
  defaults$Medical_history1_Cerebrovascular <- '2'
  defaults$Medical_history2_Cardiovascular <- '2'
  defaults$Medical_history3_Renal <- '2'
  defaults$anemia <- '2'
  defaults$Change_of_weight_from_age_of_twenty <- '2'
  defaults$exercise_hibit <- '2'
  defaults$physical_activity <- '2'
  defaults$walking_speed <- '2'
  defaults$change_of_weight_in_a_year <- '2'
  defaults$lifestyle_modification <- '2'
  defaults$request_for_health_guidance <- '2'
  assign('annual_health_checkup', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$member_id <- 'M001481041'
  defaults$type_of_claim <- 'Pharmacy'
  defaults$month_and_year_of_medical_care <- '201603'
  defaults$administered_days <- '1.0'
  defaults$jmdc_drug_code <- '100000049967'
  defaults$prescribed_amount_per_day <- '1.0'
  defaults$administered_amount <- '1.0'
  defaults$unit_of_administered_amount <- 'T'
  defaults$medical_facility_id <- 'F0280760'
  defaults$statement_id <- '1'
  defaults$drug_name <- 'Asverin Powder 10%'
  defaults$drug_price <- '5.60'
  defaults$concurrent_id <- '1'
  defaults$actual_point <- '0'
  assign('drug', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$drug_name <- 'Deleted NHI price'
  defaults$atc_level1_code <- 'A'
  defaults$atc_level1_name <- 'ALIMENTARY TRACT AND METABOLISM'
  defaults$atc_level2_code <- 'V03'
  defaults$atc_level2_name <- 'ALL OTHER THERAPEUTIC PRODUCTS'
  defaults$atc_level3_code <- 'V03B'
  defaults$atc_level3_name <- 'KANPO AND CHINESE MEDICINES'
  defaults$atc_level4_code <- 'V03B2'
  defaults$atc_level4_name <- 'Chinese medicines'
  defaults$who_atc_code <- 'V03AX'
  defaults$who_atc_name <- 'Other therapeutic products'
  defaults$general_name <- 'Amlodipine Besilate'
  defaults$brand_name <- 'Unknown Brand Name in English'
  defaults$generic_drug_flag <- '0'
  defaults$formulation_large_classification_name <- 'Oral Use'
  defaults$formulation_medium_classification_name <- 'Tablet'
  defaults$formulation_small_classification_name <- 'Tablet '
  assign('drug_master', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$medium_classification_of_department <- 'General Internal Medicine'
  defaults$number_of_beds <- '0-19'
  defaults$hpgp <- 'GP'
  defaults$large_classification_of_department <- 'Internal Medicine'
  defaults$management_body <- 'Clinic'
  assign('medical_facility', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$member_id <- 'M003314349'
  defaults$claim_id <- 'C000163885752'
  defaults$type_of_claim <- 'Outpatient'
  defaults$month_and_year_of_medical_care <- '201608'
  defaults$statement_id <- '1'
  defaults$medical_facility_id <- 'F0280760'
  defaults$standardized_material_id <- '739200000'
  defaults$standardized_material_version <- '201404'
  defaults$standardized_material_name <- 'liquid oxygen, cold evaporator (CE)'
  defaults$number_of_material <- '1.0'
  defaults$category_of_medical_care <- '40'
  assign('material', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$standardized_material_id <- '728490000'
  defaults$standardized_material_version <- '201404'
  defaults$standardized_material_name <- 'peritoneal dialysis fluid replacement set (circuit, Y set)'
  defaults$material_category_large_classification_name <- 'cardiac/vascular material'
  defaults$material_category_medium_classification_name <- 'film'
  defaults$material_code <- 'Z133'
  defaults$material_standard_price <- '0.00'
  assign('material_master', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  assign('version', defaults, envir = frameworkContext$defaultValues)
}

initFramework()

set_defaults_claim <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, admission_date, discharge_date, days_of_medical_care, medical_facility_id, total_point, large_classification_of_department, medium_classification_of_department) {
  defaults <- get('claim', envir = frameworkContext$defaultValues)
  if (!missing(claim_id)) {
    defaults$claim_id <- claim_id
  }
  if (!missing(member_id)) {
    defaults$member_id <- member_id
  }
  if (!missing(type_of_claim)) {
    defaults$type_of_claim <- type_of_claim
  }
  if (!missing(month_and_year_of_medical_care)) {
    defaults$month_and_year_of_medical_care <- month_and_year_of_medical_care
  }
  if (!missing(admission_date)) {
    defaults$admission_date <- admission_date
  }
  if (!missing(discharge_date)) {
    defaults$discharge_date <- discharge_date
  }
  if (!missing(days_of_medical_care)) {
    defaults$days_of_medical_care <- days_of_medical_care
  }
  if (!missing(medical_facility_id)) {
    defaults$medical_facility_id <- medical_facility_id
  }
  if (!missing(total_point)) {
    defaults$total_point <- total_point
  }
  if (!missing(large_classification_of_department)) {
    defaults$large_classification_of_department <- large_classification_of_department
  }
  if (!missing(medium_classification_of_department)) {
    defaults$medium_classification_of_department <- medium_classification_of_department
  }
  assign('claim', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_enrollment <- function(member_id, month_and_year_of_birth_of_member, gender_of_member, insured_or_dependent, observation_start, observation_end, withdrawal_death_flag) {
  defaults <- get('enrollment', envir = frameworkContext$defaultValues)
  if (!missing(member_id)) {
    defaults$member_id <- member_id
  }
  if (!missing(month_and_year_of_birth_of_member)) {
    defaults$month_and_year_of_birth_of_member <- month_and_year_of_birth_of_member
  }
  if (!missing(gender_of_member)) {
    defaults$gender_of_member <- gender_of_member
  }
  if (!missing(insured_or_dependent)) {
    defaults$insured_or_dependent <- insured_or_dependent
  }
  if (!missing(observation_start)) {
    defaults$observation_start <- observation_start
  }
  if (!missing(observation_end)) {
    defaults$observation_end <- observation_end
  }
  if (!missing(withdrawal_death_flag)) {
    defaults$withdrawal_death_flag <- withdrawal_death_flag
  }
  assign('enrollment', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_diagnosis <- function(claim_id, member_id, type_of_claim, date_of_medical_care_start, month_and_year_of_medical_care, standard_disease_code, medical_facility_id, statement_id, standard_disease_name, suspicion_flag, outcome) {
  defaults <- get('diagnosis', envir = frameworkContext$defaultValues)
  if (!missing(claim_id)) {
    defaults$claim_id <- claim_id
  }
  if (!missing(member_id)) {
    defaults$member_id <- member_id
  }
  if (!missing(type_of_claim)) {
    defaults$type_of_claim <- type_of_claim
  }
  if (!missing(date_of_medical_care_start)) {
    defaults$date_of_medical_care_start <- date_of_medical_care_start
  }
  if (!missing(month_and_year_of_medical_care)) {
    defaults$month_and_year_of_medical_care <- month_and_year_of_medical_care
  }
  if (!missing(standard_disease_code)) {
    defaults$standard_disease_code <- standard_disease_code
  }
  if (!missing(medical_facility_id)) {
    defaults$medical_facility_id <- medical_facility_id
  }
  if (!missing(statement_id)) {
    defaults$statement_id <- statement_id
  }
  if (!missing(standard_disease_name)) {
    defaults$standard_disease_name <- standard_disease_name
  }
  if (!missing(suspicion_flag)) {
    defaults$suspicion_flag <- suspicion_flag
  }
  if (!missing(outcome)) {
    defaults$outcome <- outcome
  }
  assign('diagnosis', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_diagnosis_master <- function(standard_disease_code, standard_disease_name, icd10_level1_code, icd10_level1_name, icd10_level2_code, icd10_level2_name, icd10_level3_code, icd10_level3_name, icd10_level4_code, icd10_level4_name) {
  defaults <- get('diagnosis_master', envir = frameworkContext$defaultValues)
  if (!missing(standard_disease_code)) {
    defaults$standard_disease_code <- standard_disease_code
  }
  if (!missing(standard_disease_name)) {
    defaults$standard_disease_name <- standard_disease_name
  }
  if (!missing(icd10_level1_code)) {
    defaults$icd10_level1_code <- icd10_level1_code
  }
  if (!missing(icd10_level1_name)) {
    defaults$icd10_level1_name <- icd10_level1_name
  }
  if (!missing(icd10_level2_code)) {
    defaults$icd10_level2_code <- icd10_level2_code
  }
  if (!missing(icd10_level2_name)) {
    defaults$icd10_level2_name <- icd10_level2_name
  }
  if (!missing(icd10_level3_code)) {
    defaults$icd10_level3_code <- icd10_level3_code
  }
  if (!missing(icd10_level3_name)) {
    defaults$icd10_level3_name <- icd10_level3_name
  }
  if (!missing(icd10_level4_code)) {
    defaults$icd10_level4_code <- icd10_level4_code
  }
  if (!missing(icd10_level4_name)) {
    defaults$icd10_level4_name <- icd10_level4_name
  }
  assign('diagnosis_master', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_procedure <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, date_of_procedure, standardized_procedure_id, medical_facility_id, statement_id, standardized_procedure_version, standardized_procedure_name, number_of_times, concurrent_id, category_of_medical_care, actual_point) {
  defaults <- get('procedure', envir = frameworkContext$defaultValues)
  if (!missing(claim_id)) {
    defaults$claim_id <- claim_id
  }
  if (!missing(member_id)) {
    defaults$member_id <- member_id
  }
  if (!missing(type_of_claim)) {
    defaults$type_of_claim <- type_of_claim
  }
  if (!missing(month_and_year_of_medical_care)) {
    defaults$month_and_year_of_medical_care <- month_and_year_of_medical_care
  }
  if (!missing(date_of_procedure)) {
    defaults$date_of_procedure <- date_of_procedure
  }
  if (!missing(standardized_procedure_id)) {
    defaults$standardized_procedure_id <- standardized_procedure_id
  }
  if (!missing(medical_facility_id)) {
    defaults$medical_facility_id <- medical_facility_id
  }
  if (!missing(statement_id)) {
    defaults$statement_id <- statement_id
  }
  if (!missing(standardized_procedure_version)) {
    defaults$standardized_procedure_version <- standardized_procedure_version
  }
  if (!missing(standardized_procedure_name)) {
    defaults$standardized_procedure_name <- standardized_procedure_name
  }
  if (!missing(number_of_times)) {
    defaults$number_of_times <- number_of_times
  }
  if (!missing(concurrent_id)) {
    defaults$concurrent_id <- concurrent_id
  }
  if (!missing(category_of_medical_care)) {
    defaults$category_of_medical_care <- category_of_medical_care
  }
  if (!missing(actual_point)) {
    defaults$actual_point <- actual_point
  }
  assign('procedure', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_procedure_master <- function(standardized_procedure_id, standardized_procedure_version, standardized_procedure_name, procedure_category_medium_classification_name, procedure_category_small_classification_name, procedure_category_subclassification_name, procedure_category_sub_and_detail_classification_name, procedure_code, procedure_standard_point, icd9cm_level1) {
  defaults <- get('procedure_master', envir = frameworkContext$defaultValues)
  if (!missing(standardized_procedure_id)) {
    defaults$standardized_procedure_id <- standardized_procedure_id
  }
  if (!missing(standardized_procedure_version)) {
    defaults$standardized_procedure_version <- standardized_procedure_version
  }
  if (!missing(standardized_procedure_name)) {
    defaults$standardized_procedure_name <- standardized_procedure_name
  }
  if (!missing(procedure_category_medium_classification_name)) {
    defaults$procedure_category_medium_classification_name <- procedure_category_medium_classification_name
  }
  if (!missing(procedure_category_small_classification_name)) {
    defaults$procedure_category_small_classification_name <- procedure_category_small_classification_name
  }
  if (!missing(procedure_category_subclassification_name)) {
    defaults$procedure_category_subclassification_name <- procedure_category_subclassification_name
  }
  if (!missing(procedure_category_sub_and_detail_classification_name)) {
    defaults$procedure_category_sub_and_detail_classification_name <- procedure_category_sub_and_detail_classification_name
  }
  if (!missing(procedure_code)) {
    defaults$procedure_code <- procedure_code
  }
  if (!missing(procedure_standard_point)) {
    defaults$procedure_standard_point <- procedure_standard_point
  }
  if (!missing(icd9cm_level1)) {
    defaults$icd9cm_level1 <- icd9cm_level1
  }
  assign('procedure_master', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_annual_health_checkup <- function(health_checkup_id, member_id, date_of_health_checkup, bmi, abdominal_circumference, systolic_bp, diastolic_bp, triglyceride, hdl_cholesterol, ldl_cholesterol, ast, alt, g_gt, fasting_blood_sugar, casual_blood_sugar, hba1c, urinary_sugar, uric_protein_qualitative, hct, hemoglobin_content, rbc_count, serum_creatinine, serum_uric_acid, total_cholesterol, ecg, presence_of_medical_history, time_of_blood_collection, presence_of_subjective_symptoms, presence_of_objective_symptoms, Fundus_examination_Keith_Wagener_classification, fundus_examination_scheie_classification_h, fundus_examination_scheie_classification_s, fundus_examination_scott_classification, smoking_habit, eating1_fast_eating, eating2_before_bedtime, eating3_late_evening_snack, eating_habit, drinking_habit, amount_drinking, sleep, Drug1_Hypertention, Drug2_Diabetes, Drug3_Hyperlipidemia, Medical_history1_Cerebrovascular, Medical_history2_Cardiovascular, Medical_history3_Renal, anemia, Change_of_weight_from_age_of_twenty, exercise_hibit, physical_activity, walking_speed, change_of_weight_in_a_year, lifestyle_modification, request_for_health_guidance) {
  defaults <- get('annual_health_checkup', envir = frameworkContext$defaultValues)
  if (!missing(health_checkup_id)) {
    defaults$health_checkup_id <- health_checkup_id
  }
  if (!missing(member_id)) {
    defaults$member_id <- member_id
  }
  if (!missing(date_of_health_checkup)) {
    defaults$date_of_health_checkup <- date_of_health_checkup
  }
  if (!missing(bmi)) {
    defaults$bmi <- bmi
  }
  if (!missing(abdominal_circumference)) {
    defaults$abdominal_circumference <- abdominal_circumference
  }
  if (!missing(systolic_bp)) {
    defaults$systolic_bp <- systolic_bp
  }
  if (!missing(diastolic_bp)) {
    defaults$diastolic_bp <- diastolic_bp
  }
  if (!missing(triglyceride)) {
    defaults$triglyceride <- triglyceride
  }
  if (!missing(hdl_cholesterol)) {
    defaults$hdl_cholesterol <- hdl_cholesterol
  }
  if (!missing(ldl_cholesterol)) {
    defaults$ldl_cholesterol <- ldl_cholesterol
  }
  if (!missing(ast)) {
    defaults$ast <- ast
  }
  if (!missing(alt)) {
    defaults$alt <- alt
  }
  if (!missing(g_gt)) {
    defaults$g_gt <- g_gt
  }
  if (!missing(fasting_blood_sugar)) {
    defaults$fasting_blood_sugar <- fasting_blood_sugar
  }
  if (!missing(casual_blood_sugar)) {
    defaults$casual_blood_sugar <- casual_blood_sugar
  }
  if (!missing(hba1c)) {
    defaults$hba1c <- hba1c
  }
  if (!missing(urinary_sugar)) {
    defaults$urinary_sugar <- urinary_sugar
  }
  if (!missing(uric_protein_qualitative)) {
    defaults$uric_protein_qualitative <- uric_protein_qualitative
  }
  if (!missing(hct)) {
    defaults$hct <- hct
  }
  if (!missing(hemoglobin_content)) {
    defaults$hemoglobin_content <- hemoglobin_content
  }
  if (!missing(rbc_count)) {
    defaults$rbc_count <- rbc_count
  }
  if (!missing(serum_creatinine)) {
    defaults$serum_creatinine <- serum_creatinine
  }
  if (!missing(serum_uric_acid)) {
    defaults$serum_uric_acid <- serum_uric_acid
  }
  if (!missing(total_cholesterol)) {
    defaults$total_cholesterol <- total_cholesterol
  }
  if (!missing(ecg)) {
    defaults$ecg <- ecg
  }
  if (!missing(presence_of_medical_history)) {
    defaults$presence_of_medical_history <- presence_of_medical_history
  }
  if (!missing(time_of_blood_collection)) {
    defaults$time_of_blood_collection <- time_of_blood_collection
  }
  if (!missing(presence_of_subjective_symptoms)) {
    defaults$presence_of_subjective_symptoms <- presence_of_subjective_symptoms
  }
  if (!missing(presence_of_objective_symptoms)) {
    defaults$presence_of_objective_symptoms <- presence_of_objective_symptoms
  }
  if (!missing(Fundus_examination_Keith_Wagener_classification)) {
    defaults$Fundus_examination_Keith_Wagener_classification <- Fundus_examination_Keith_Wagener_classification
  }
  if (!missing(fundus_examination_scheie_classification_h)) {
    defaults$fundus_examination_scheie_classification_h <- fundus_examination_scheie_classification_h
  }
  if (!missing(fundus_examination_scheie_classification_s)) {
    defaults$fundus_examination_scheie_classification_s <- fundus_examination_scheie_classification_s
  }
  if (!missing(fundus_examination_scott_classification)) {
    defaults$fundus_examination_scott_classification <- fundus_examination_scott_classification
  }
  if (!missing(smoking_habit)) {
    defaults$smoking_habit <- smoking_habit
  }
  if (!missing(eating1_fast_eating)) {
    defaults$eating1_fast_eating <- eating1_fast_eating
  }
  if (!missing(eating2_before_bedtime)) {
    defaults$eating2_before_bedtime <- eating2_before_bedtime
  }
  if (!missing(eating3_late_evening_snack)) {
    defaults$eating3_late_evening_snack <- eating3_late_evening_snack
  }
  if (!missing(eating_habit)) {
    defaults$eating_habit <- eating_habit
  }
  if (!missing(drinking_habit)) {
    defaults$drinking_habit <- drinking_habit
  }
  if (!missing(amount_drinking)) {
    defaults$amount_drinking <- amount_drinking
  }
  if (!missing(sleep)) {
    defaults$sleep <- sleep
  }
  if (!missing(Drug1_Hypertention)) {
    defaults$Drug1_Hypertention <- Drug1_Hypertention
  }
  if (!missing(Drug2_Diabetes)) {
    defaults$Drug2_Diabetes <- Drug2_Diabetes
  }
  if (!missing(Drug3_Hyperlipidemia)) {
    defaults$Drug3_Hyperlipidemia <- Drug3_Hyperlipidemia
  }
  if (!missing(Medical_history1_Cerebrovascular)) {
    defaults$Medical_history1_Cerebrovascular <- Medical_history1_Cerebrovascular
  }
  if (!missing(Medical_history2_Cardiovascular)) {
    defaults$Medical_history2_Cardiovascular <- Medical_history2_Cardiovascular
  }
  if (!missing(Medical_history3_Renal)) {
    defaults$Medical_history3_Renal <- Medical_history3_Renal
  }
  if (!missing(anemia)) {
    defaults$anemia <- anemia
  }
  if (!missing(Change_of_weight_from_age_of_twenty)) {
    defaults$Change_of_weight_from_age_of_twenty <- Change_of_weight_from_age_of_twenty
  }
  if (!missing(exercise_hibit)) {
    defaults$exercise_hibit <- exercise_hibit
  }
  if (!missing(physical_activity)) {
    defaults$physical_activity <- physical_activity
  }
  if (!missing(walking_speed)) {
    defaults$walking_speed <- walking_speed
  }
  if (!missing(change_of_weight_in_a_year)) {
    defaults$change_of_weight_in_a_year <- change_of_weight_in_a_year
  }
  if (!missing(lifestyle_modification)) {
    defaults$lifestyle_modification <- lifestyle_modification
  }
  if (!missing(request_for_health_guidance)) {
    defaults$request_for_health_guidance <- request_for_health_guidance
  }
  assign('annual_health_checkup', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_drug <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, date_of_prescription, administered_days, jmdc_drug_code, as_needed_medication_flag, prescribed_amount_per_day, administered_amount, unit_of_administered_amount, medical_facility_id, statement_id, drug_name, drug_price, date_of_dispense, concurrent_id, category_of_medical_care, actual_point) {
  defaults <- get('drug', envir = frameworkContext$defaultValues)
  if (!missing(claim_id)) {
    defaults$claim_id <- claim_id
  }
  if (!missing(member_id)) {
    defaults$member_id <- member_id
  }
  if (!missing(type_of_claim)) {
    defaults$type_of_claim <- type_of_claim
  }
  if (!missing(month_and_year_of_medical_care)) {
    defaults$month_and_year_of_medical_care <- month_and_year_of_medical_care
  }
  if (!missing(date_of_prescription)) {
    defaults$date_of_prescription <- date_of_prescription
  }
  if (!missing(administered_days)) {
    defaults$administered_days <- administered_days
  }
  if (!missing(jmdc_drug_code)) {
    defaults$jmdc_drug_code <- jmdc_drug_code
  }
  if (!missing(as_needed_medication_flag)) {
    defaults$as_needed_medication_flag <- as_needed_medication_flag
  }
  if (!missing(prescribed_amount_per_day)) {
    defaults$prescribed_amount_per_day <- prescribed_amount_per_day
  }
  if (!missing(administered_amount)) {
    defaults$administered_amount <- administered_amount
  }
  if (!missing(unit_of_administered_amount)) {
    defaults$unit_of_administered_amount <- unit_of_administered_amount
  }
  if (!missing(medical_facility_id)) {
    defaults$medical_facility_id <- medical_facility_id
  }
  if (!missing(statement_id)) {
    defaults$statement_id <- statement_id
  }
  if (!missing(drug_name)) {
    defaults$drug_name <- drug_name
  }
  if (!missing(drug_price)) {
    defaults$drug_price <- drug_price
  }
  if (!missing(date_of_dispense)) {
    defaults$date_of_dispense <- date_of_dispense
  }
  if (!missing(concurrent_id)) {
    defaults$concurrent_id <- concurrent_id
  }
  if (!missing(category_of_medical_care)) {
    defaults$category_of_medical_care <- category_of_medical_care
  }
  if (!missing(actual_point)) {
    defaults$actual_point <- actual_point
  }
  assign('drug', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_drug_master <- function(jmdc_drug_code, drug_name, standardized_unit, atc_level1_code, atc_level1_name, atc_level2_code, atc_level2_name, atc_level3_code, atc_level3_name, atc_level4_code, atc_level4_name, who_atc_code, who_atc_name, drug_code, general_name, brand_name, generic_drug_flag, formulation_large_classification_name, formulation_medium_classification_name, formulation_small_classification_name) {
  defaults <- get('drug_master', envir = frameworkContext$defaultValues)
  if (!missing(jmdc_drug_code)) {
    defaults$jmdc_drug_code <- jmdc_drug_code
  }
  if (!missing(drug_name)) {
    defaults$drug_name <- drug_name
  }
  if (!missing(standardized_unit)) {
    defaults$standardized_unit <- standardized_unit
  }
  if (!missing(atc_level1_code)) {
    defaults$atc_level1_code <- atc_level1_code
  }
  if (!missing(atc_level1_name)) {
    defaults$atc_level1_name <- atc_level1_name
  }
  if (!missing(atc_level2_code)) {
    defaults$atc_level2_code <- atc_level2_code
  }
  if (!missing(atc_level2_name)) {
    defaults$atc_level2_name <- atc_level2_name
  }
  if (!missing(atc_level3_code)) {
    defaults$atc_level3_code <- atc_level3_code
  }
  if (!missing(atc_level3_name)) {
    defaults$atc_level3_name <- atc_level3_name
  }
  if (!missing(atc_level4_code)) {
    defaults$atc_level4_code <- atc_level4_code
  }
  if (!missing(atc_level4_name)) {
    defaults$atc_level4_name <- atc_level4_name
  }
  if (!missing(who_atc_code)) {
    defaults$who_atc_code <- who_atc_code
  }
  if (!missing(who_atc_name)) {
    defaults$who_atc_name <- who_atc_name
  }
  if (!missing(drug_code)) {
    defaults$drug_code <- drug_code
  }
  if (!missing(general_name)) {
    defaults$general_name <- general_name
  }
  if (!missing(brand_name)) {
    defaults$brand_name <- brand_name
  }
  if (!missing(generic_drug_flag)) {
    defaults$generic_drug_flag <- generic_drug_flag
  }
  if (!missing(formulation_large_classification_name)) {
    defaults$formulation_large_classification_name <- formulation_large_classification_name
  }
  if (!missing(formulation_medium_classification_name)) {
    defaults$formulation_medium_classification_name <- formulation_medium_classification_name
  }
  if (!missing(formulation_small_classification_name)) {
    defaults$formulation_small_classification_name <- formulation_small_classification_name
  }
  assign('drug_master', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_medical_facility <- function(medical_facility_id, medium_classification_of_department, number_of_beds, hpgp, large_classification_of_department, management_body, home_care_support_clinic, regional_medical_care_support_hospitals, designated_cancer_care_hospitals, medical_institution_introducing_dpc, special_functioning_hospitals) {
  defaults <- get('medical_facility', envir = frameworkContext$defaultValues)
  if (!missing(medical_facility_id)) {
    defaults$medical_facility_id <- medical_facility_id
  }
  if (!missing(medium_classification_of_department)) {
    defaults$medium_classification_of_department <- medium_classification_of_department
  }
  if (!missing(number_of_beds)) {
    defaults$number_of_beds <- number_of_beds
  }
  if (!missing(hpgp)) {
    defaults$hpgp <- hpgp
  }
  if (!missing(large_classification_of_department)) {
    defaults$large_classification_of_department <- large_classification_of_department
  }
  if (!missing(management_body)) {
    defaults$management_body <- management_body
  }
  if (!missing(home_care_support_clinic)) {
    defaults$home_care_support_clinic <- home_care_support_clinic
  }
  if (!missing(regional_medical_care_support_hospitals)) {
    defaults$regional_medical_care_support_hospitals <- regional_medical_care_support_hospitals
  }
  if (!missing(designated_cancer_care_hospitals)) {
    defaults$designated_cancer_care_hospitals <- designated_cancer_care_hospitals
  }
  if (!missing(medical_institution_introducing_dpc)) {
    defaults$medical_institution_introducing_dpc <- medical_institution_introducing_dpc
  }
  if (!missing(special_functioning_hospitals)) {
    defaults$special_functioning_hospitals <- special_functioning_hospitals
  }
  assign('medical_facility', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_material <- function(member_id, claim_id, type_of_claim, month_and_year_of_medical_care, statement_id, date_of_material, medical_facility_id, standardized_material_id, standardized_material_version, standardized_material_name, unit, number_of_material, concurrent_id, category_of_medical_care, actual_point) {
  defaults <- get('material', envir = frameworkContext$defaultValues)
  if (!missing(member_id)) {
    defaults$member_id <- member_id
  }
  if (!missing(claim_id)) {
    defaults$claim_id <- claim_id
  }
  if (!missing(type_of_claim)) {
    defaults$type_of_claim <- type_of_claim
  }
  if (!missing(month_and_year_of_medical_care)) {
    defaults$month_and_year_of_medical_care <- month_and_year_of_medical_care
  }
  if (!missing(statement_id)) {
    defaults$statement_id <- statement_id
  }
  if (!missing(date_of_material)) {
    defaults$date_of_material <- date_of_material
  }
  if (!missing(medical_facility_id)) {
    defaults$medical_facility_id <- medical_facility_id
  }
  if (!missing(standardized_material_id)) {
    defaults$standardized_material_id <- standardized_material_id
  }
  if (!missing(standardized_material_version)) {
    defaults$standardized_material_version <- standardized_material_version
  }
  if (!missing(standardized_material_name)) {
    defaults$standardized_material_name <- standardized_material_name
  }
  if (!missing(unit)) {
    defaults$unit <- unit
  }
  if (!missing(number_of_material)) {
    defaults$number_of_material <- number_of_material
  }
  if (!missing(concurrent_id)) {
    defaults$concurrent_id <- concurrent_id
  }
  if (!missing(category_of_medical_care)) {
    defaults$category_of_medical_care <- category_of_medical_care
  }
  if (!missing(actual_point)) {
    defaults$actual_point <- actual_point
  }
  assign('material', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_material_master <- function(standardized_material_id, standardized_material_version, standardized_material_name, unit, material_category_large_classification_name, material_category_medium_classification_name, material_code, material_standard_price) {
  defaults <- get('material_master', envir = frameworkContext$defaultValues)
  if (!missing(standardized_material_id)) {
    defaults$standardized_material_id <- standardized_material_id
  }
  if (!missing(standardized_material_version)) {
    defaults$standardized_material_version <- standardized_material_version
  }
  if (!missing(standardized_material_name)) {
    defaults$standardized_material_name <- standardized_material_name
  }
  if (!missing(unit)) {
    defaults$unit <- unit
  }
  if (!missing(material_category_large_classification_name)) {
    defaults$material_category_large_classification_name <- material_category_large_classification_name
  }
  if (!missing(material_category_medium_classification_name)) {
    defaults$material_category_medium_classification_name <- material_category_medium_classification_name
  }
  if (!missing(material_code)) {
    defaults$material_code <- material_code
  }
  if (!missing(material_standard_price)) {
    defaults$material_standard_price <- material_standard_price
  }
  assign('material_master', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_version <- function(version_id, version_date) {
  defaults <- get('version', envir = frameworkContext$defaultValues)
  if (!missing(version_id)) {
    defaults$version_id <- version_id
  }
  if (!missing(version_date)) {
    defaults$version_date <- version_date
  }
  assign('version', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

get_defaults_claim <- function() {
  defaults <- get('claim', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_enrollment <- function() {
  defaults <- get('enrollment', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_diagnosis <- function() {
  defaults <- get('diagnosis', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_diagnosis_master <- function() {
  defaults <- get('diagnosis_master', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_procedure <- function() {
  defaults <- get('procedure', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_procedure_master <- function() {
  defaults <- get('procedure_master', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_annual_health_checkup <- function() {
  defaults <- get('annual_health_checkup', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_drug <- function() {
  defaults <- get('drug', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_drug_master <- function() {
  defaults <- get('drug_master', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_medical_facility <- function() {
  defaults <- get('medical_facility', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_material <- function() {
  defaults <- get('material', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_material_master <- function() {
  defaults <- get('material_master', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_version <- function() {
  defaults <- get('version', envir = frameworkContext$defaultValues)
  return(defaults)
}

declareTest <- function(id, description) {
  frameworkContext$testId <- id
  frameworkContext$testDescription <- description
}

add_claim <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, admission_date, discharge_date, days_of_medical_care, medical_facility_id, total_point, large_classification_of_department, medium_classification_of_department) {
  defaults <- get('claim', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(claim_id)) {
    claim_id <- defaults$claim_id
  }
  if (!is.null(claim_id)) {
    fields <- c(fields, "claim_id")
    values <- c(values, if (is.null(claim_id)) "NULL" else if (is(claim_id, "subQuery")) paste0("(", as.character(claim_id), ")") else paste0("'", as.character(claim_id), "'"))
  }

  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    fields <- c(fields, "member_id")
    values <- c(values, if (is.null(member_id)) "NULL" else if (is(member_id, "subQuery")) paste0("(", as.character(member_id), ")") else paste0("'", as.character(member_id), "'"))
  }

  if (missing(type_of_claim)) {
    type_of_claim <- defaults$type_of_claim
  }
  if (!is.null(type_of_claim)) {
    fields <- c(fields, "type_of_claim")
    values <- c(values, if (is.null(type_of_claim)) "NULL" else if (is(type_of_claim, "subQuery")) paste0("(", as.character(type_of_claim), ")") else paste0("'", as.character(type_of_claim), "'"))
  }

  if (missing(month_and_year_of_medical_care)) {
    month_and_year_of_medical_care <- defaults$month_and_year_of_medical_care
  }
  if (!is.null(month_and_year_of_medical_care)) {
    fields <- c(fields, "month_and_year_of_medical_care")
    values <- c(values, if (is.null(month_and_year_of_medical_care)) "NULL" else if (is(month_and_year_of_medical_care, "subQuery")) paste0("(", as.character(month_and_year_of_medical_care), ")") else paste0("'", as.character(month_and_year_of_medical_care), "'"))
  }

  if (missing(admission_date)) {
    admission_date <- defaults$admission_date
  }
  if (!is.null(admission_date)) {
    fields <- c(fields, "admission_date")
    values <- c(values, if (is.null(admission_date)) "NULL" else if (is(admission_date, "subQuery")) paste0("(", as.character(admission_date), ")") else paste0("'", as.character(admission_date), "'"))
  }

  if (missing(discharge_date)) {
    discharge_date <- defaults$discharge_date
  }
  if (!is.null(discharge_date)) {
    fields <- c(fields, "discharge_date")
    values <- c(values, if (is.null(discharge_date)) "NULL" else if (is(discharge_date, "subQuery")) paste0("(", as.character(discharge_date), ")") else paste0("'", as.character(discharge_date), "'"))
  }

  if (missing(days_of_medical_care)) {
    days_of_medical_care <- defaults$days_of_medical_care
  }
  if (!is.null(days_of_medical_care)) {
    fields <- c(fields, "days_of_medical_care")
    values <- c(values, if (is.null(days_of_medical_care)) "NULL" else if (is(days_of_medical_care, "subQuery")) paste0("(", as.character(days_of_medical_care), ")") else paste0("'", as.character(days_of_medical_care), "'"))
  }

  if (missing(medical_facility_id)) {
    medical_facility_id <- defaults$medical_facility_id
  }
  if (!is.null(medical_facility_id)) {
    fields <- c(fields, "medical_facility_id")
    values <- c(values, if (is.null(medical_facility_id)) "NULL" else if (is(medical_facility_id, "subQuery")) paste0("(", as.character(medical_facility_id), ")") else paste0("'", as.character(medical_facility_id), "'"))
  }

  if (missing(total_point)) {
    total_point <- defaults$total_point
  }
  if (!is.null(total_point)) {
    fields <- c(fields, "total_point")
    values <- c(values, if (is.null(total_point)) "NULL" else if (is(total_point, "subQuery")) paste0("(", as.character(total_point), ")") else paste0("'", as.character(total_point), "'"))
  }

  if (missing(large_classification_of_department)) {
    large_classification_of_department <- defaults$large_classification_of_department
  }
  if (!is.null(large_classification_of_department)) {
    fields <- c(fields, "large_classification_of_department")
    values <- c(values, if (is.null(large_classification_of_department)) "NULL" else if (is(large_classification_of_department, "subQuery")) paste0("(", as.character(large_classification_of_department), ")") else paste0("'", as.character(large_classification_of_department), "'"))
  }

  if (missing(medium_classification_of_department)) {
    medium_classification_of_department <- defaults$medium_classification_of_department
  }
  if (!is.null(medium_classification_of_department)) {
    fields <- c(fields, "medium_classification_of_department")
    values <- c(values, if (is.null(medium_classification_of_department)) "NULL" else if (is(medium_classification_of_department, "subQuery")) paste0("(", as.character(medium_classification_of_department), ")") else paste0("'", as.character(medium_classification_of_department), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "claim", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_enrollment <- function(member_id, month_and_year_of_birth_of_member, gender_of_member, insured_or_dependent, observation_start, observation_end, withdrawal_death_flag) {
  defaults <- get('enrollment', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    fields <- c(fields, "member_id")
    values <- c(values, if (is.null(member_id)) "NULL" else if (is(member_id, "subQuery")) paste0("(", as.character(member_id), ")") else paste0("'", as.character(member_id), "'"))
  }

  if (missing(month_and_year_of_birth_of_member)) {
    month_and_year_of_birth_of_member <- defaults$month_and_year_of_birth_of_member
  }
  if (!is.null(month_and_year_of_birth_of_member)) {
    fields <- c(fields, "month_and_year_of_birth_of_member")
    values <- c(values, if (is.null(month_and_year_of_birth_of_member)) "NULL" else if (is(month_and_year_of_birth_of_member, "subQuery")) paste0("(", as.character(month_and_year_of_birth_of_member), ")") else paste0("'", as.character(month_and_year_of_birth_of_member), "'"))
  }

  if (missing(gender_of_member)) {
    gender_of_member <- defaults$gender_of_member
  }
  if (!is.null(gender_of_member)) {
    fields <- c(fields, "gender_of_member")
    values <- c(values, if (is.null(gender_of_member)) "NULL" else if (is(gender_of_member, "subQuery")) paste0("(", as.character(gender_of_member), ")") else paste0("'", as.character(gender_of_member), "'"))
  }

  if (missing(insured_or_dependent)) {
    insured_or_dependent <- defaults$insured_or_dependent
  }
  if (!is.null(insured_or_dependent)) {
    fields <- c(fields, "insured_or_dependent")
    values <- c(values, if (is.null(insured_or_dependent)) "NULL" else if (is(insured_or_dependent, "subQuery")) paste0("(", as.character(insured_or_dependent), ")") else paste0("'", as.character(insured_or_dependent), "'"))
  }

  if (missing(observation_start)) {
    observation_start <- defaults$observation_start
  }
  if (!is.null(observation_start)) {
    fields <- c(fields, "observation_start")
    values <- c(values, if (is.null(observation_start)) "NULL" else if (is(observation_start, "subQuery")) paste0("(", as.character(observation_start), ")") else paste0("'", as.character(observation_start), "'"))
  }

  if (missing(observation_end)) {
    observation_end <- defaults$observation_end
  }
  if (!is.null(observation_end)) {
    fields <- c(fields, "observation_end")
    values <- c(values, if (is.null(observation_end)) "NULL" else if (is(observation_end, "subQuery")) paste0("(", as.character(observation_end), ")") else paste0("'", as.character(observation_end), "'"))
  }

  if (missing(withdrawal_death_flag)) {
    withdrawal_death_flag <- defaults$withdrawal_death_flag
  }
  if (!is.null(withdrawal_death_flag)) {
    fields <- c(fields, "withdrawal_death_flag")
    values <- c(values, if (is.null(withdrawal_death_flag)) "NULL" else if (is(withdrawal_death_flag, "subQuery")) paste0("(", as.character(withdrawal_death_flag), ")") else paste0("'", as.character(withdrawal_death_flag), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "enrollment", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_diagnosis <- function(claim_id, member_id, type_of_claim, date_of_medical_care_start, month_and_year_of_medical_care, standard_disease_code, medical_facility_id, statement_id, standard_disease_name, suspicion_flag, outcome) {
  defaults <- get('diagnosis', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(claim_id)) {
    claim_id <- defaults$claim_id
  }
  if (!is.null(claim_id)) {
    fields <- c(fields, "claim_id")
    values <- c(values, if (is.null(claim_id)) "NULL" else if (is(claim_id, "subQuery")) paste0("(", as.character(claim_id), ")") else paste0("'", as.character(claim_id), "'"))
  }

  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    fields <- c(fields, "member_id")
    values <- c(values, if (is.null(member_id)) "NULL" else if (is(member_id, "subQuery")) paste0("(", as.character(member_id), ")") else paste0("'", as.character(member_id), "'"))
  }

  if (missing(type_of_claim)) {
    type_of_claim <- defaults$type_of_claim
  }
  if (!is.null(type_of_claim)) {
    fields <- c(fields, "type_of_claim")
    values <- c(values, if (is.null(type_of_claim)) "NULL" else if (is(type_of_claim, "subQuery")) paste0("(", as.character(type_of_claim), ")") else paste0("'", as.character(type_of_claim), "'"))
  }

  if (missing(date_of_medical_care_start)) {
    date_of_medical_care_start <- defaults$date_of_medical_care_start
  }
  if (!is.null(date_of_medical_care_start)) {
    fields <- c(fields, "date_of_medical_care_start")
    values <- c(values, if (is.null(date_of_medical_care_start)) "NULL" else if (is(date_of_medical_care_start, "subQuery")) paste0("(", as.character(date_of_medical_care_start), ")") else paste0("'", as.character(date_of_medical_care_start), "'"))
  }

  if (missing(month_and_year_of_medical_care)) {
    month_and_year_of_medical_care <- defaults$month_and_year_of_medical_care
  }
  if (!is.null(month_and_year_of_medical_care)) {
    fields <- c(fields, "month_and_year_of_medical_care")
    values <- c(values, if (is.null(month_and_year_of_medical_care)) "NULL" else if (is(month_and_year_of_medical_care, "subQuery")) paste0("(", as.character(month_and_year_of_medical_care), ")") else paste0("'", as.character(month_and_year_of_medical_care), "'"))
  }

  if (missing(standard_disease_code)) {
    standard_disease_code <- defaults$standard_disease_code
  }
  if (!is.null(standard_disease_code)) {
    fields <- c(fields, "standard_disease_code")
    values <- c(values, if (is.null(standard_disease_code)) "NULL" else if (is(standard_disease_code, "subQuery")) paste0("(", as.character(standard_disease_code), ")") else paste0("'", as.character(standard_disease_code), "'"))
  }

  if (missing(medical_facility_id)) {
    medical_facility_id <- defaults$medical_facility_id
  }
  if (!is.null(medical_facility_id)) {
    fields <- c(fields, "medical_facility_id")
    values <- c(values, if (is.null(medical_facility_id)) "NULL" else if (is(medical_facility_id, "subQuery")) paste0("(", as.character(medical_facility_id), ")") else paste0("'", as.character(medical_facility_id), "'"))
  }

  if (missing(statement_id)) {
    statement_id <- defaults$statement_id
  }
  if (!is.null(statement_id)) {
    fields <- c(fields, "statement_id")
    values <- c(values, if (is.null(statement_id)) "NULL" else if (is(statement_id, "subQuery")) paste0("(", as.character(statement_id), ")") else paste0("'", as.character(statement_id), "'"))
  }

  if (missing(standard_disease_name)) {
    standard_disease_name <- defaults$standard_disease_name
  }
  if (!is.null(standard_disease_name)) {
    fields <- c(fields, "standard_disease_name")
    values <- c(values, if (is.null(standard_disease_name)) "NULL" else if (is(standard_disease_name, "subQuery")) paste0("(", as.character(standard_disease_name), ")") else paste0("'", as.character(standard_disease_name), "'"))
  }

  if (missing(suspicion_flag)) {
    suspicion_flag <- defaults$suspicion_flag
  }
  if (!is.null(suspicion_flag)) {
    fields <- c(fields, "suspicion_flag")
    values <- c(values, if (is.null(suspicion_flag)) "NULL" else if (is(suspicion_flag, "subQuery")) paste0("(", as.character(suspicion_flag), ")") else paste0("'", as.character(suspicion_flag), "'"))
  }

  if (missing(outcome)) {
    outcome <- defaults$outcome
  }
  if (!is.null(outcome)) {
    fields <- c(fields, "outcome")
    values <- c(values, if (is.null(outcome)) "NULL" else if (is(outcome, "subQuery")) paste0("(", as.character(outcome), ")") else paste0("'", as.character(outcome), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "diagnosis", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_diagnosis_master <- function(standard_disease_code, standard_disease_name, icd10_level1_code, icd10_level1_name, icd10_level2_code, icd10_level2_name, icd10_level3_code, icd10_level3_name, icd10_level4_code, icd10_level4_name) {
  defaults <- get('diagnosis_master', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(standard_disease_code)) {
    standard_disease_code <- defaults$standard_disease_code
  }
  if (!is.null(standard_disease_code)) {
    fields <- c(fields, "standard_disease_code")
    values <- c(values, if (is.null(standard_disease_code)) "NULL" else if (is(standard_disease_code, "subQuery")) paste0("(", as.character(standard_disease_code), ")") else paste0("'", as.character(standard_disease_code), "'"))
  }

  if (missing(standard_disease_name)) {
    standard_disease_name <- defaults$standard_disease_name
  }
  if (!is.null(standard_disease_name)) {
    fields <- c(fields, "standard_disease_name")
    values <- c(values, if (is.null(standard_disease_name)) "NULL" else if (is(standard_disease_name, "subQuery")) paste0("(", as.character(standard_disease_name), ")") else paste0("'", as.character(standard_disease_name), "'"))
  }

  if (missing(icd10_level1_code)) {
    icd10_level1_code <- defaults$icd10_level1_code
  }
  if (!is.null(icd10_level1_code)) {
    fields <- c(fields, "icd10_level1_code")
    values <- c(values, if (is.null(icd10_level1_code)) "NULL" else if (is(icd10_level1_code, "subQuery")) paste0("(", as.character(icd10_level1_code), ")") else paste0("'", as.character(icd10_level1_code), "'"))
  }

  if (missing(icd10_level1_name)) {
    icd10_level1_name <- defaults$icd10_level1_name
  }
  if (!is.null(icd10_level1_name)) {
    fields <- c(fields, "icd10_level1_name")
    values <- c(values, if (is.null(icd10_level1_name)) "NULL" else if (is(icd10_level1_name, "subQuery")) paste0("(", as.character(icd10_level1_name), ")") else paste0("'", as.character(icd10_level1_name), "'"))
  }

  if (missing(icd10_level2_code)) {
    icd10_level2_code <- defaults$icd10_level2_code
  }
  if (!is.null(icd10_level2_code)) {
    fields <- c(fields, "icd10_level2_code")
    values <- c(values, if (is.null(icd10_level2_code)) "NULL" else if (is(icd10_level2_code, "subQuery")) paste0("(", as.character(icd10_level2_code), ")") else paste0("'", as.character(icd10_level2_code), "'"))
  }

  if (missing(icd10_level2_name)) {
    icd10_level2_name <- defaults$icd10_level2_name
  }
  if (!is.null(icd10_level2_name)) {
    fields <- c(fields, "icd10_level2_name")
    values <- c(values, if (is.null(icd10_level2_name)) "NULL" else if (is(icd10_level2_name, "subQuery")) paste0("(", as.character(icd10_level2_name), ")") else paste0("'", as.character(icd10_level2_name), "'"))
  }

  if (missing(icd10_level3_code)) {
    icd10_level3_code <- defaults$icd10_level3_code
  }
  if (!is.null(icd10_level3_code)) {
    fields <- c(fields, "icd10_level3_code")
    values <- c(values, if (is.null(icd10_level3_code)) "NULL" else if (is(icd10_level3_code, "subQuery")) paste0("(", as.character(icd10_level3_code), ")") else paste0("'", as.character(icd10_level3_code), "'"))
  }

  if (missing(icd10_level3_name)) {
    icd10_level3_name <- defaults$icd10_level3_name
  }
  if (!is.null(icd10_level3_name)) {
    fields <- c(fields, "icd10_level3_name")
    values <- c(values, if (is.null(icd10_level3_name)) "NULL" else if (is(icd10_level3_name, "subQuery")) paste0("(", as.character(icd10_level3_name), ")") else paste0("'", as.character(icd10_level3_name), "'"))
  }

  if (missing(icd10_level4_code)) {
    icd10_level4_code <- defaults$icd10_level4_code
  }
  if (!is.null(icd10_level4_code)) {
    fields <- c(fields, "icd10_level4_code")
    values <- c(values, if (is.null(icd10_level4_code)) "NULL" else if (is(icd10_level4_code, "subQuery")) paste0("(", as.character(icd10_level4_code), ")") else paste0("'", as.character(icd10_level4_code), "'"))
  }

  if (missing(icd10_level4_name)) {
    icd10_level4_name <- defaults$icd10_level4_name
  }
  if (!is.null(icd10_level4_name)) {
    fields <- c(fields, "icd10_level4_name")
    values <- c(values, if (is.null(icd10_level4_name)) "NULL" else if (is(icd10_level4_name, "subQuery")) paste0("(", as.character(icd10_level4_name), ")") else paste0("'", as.character(icd10_level4_name), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "diagnosis_master", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_procedure <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, date_of_procedure, standardized_procedure_id, medical_facility_id, statement_id, standardized_procedure_version, standardized_procedure_name, number_of_times, concurrent_id, category_of_medical_care, actual_point) {
  defaults <- get('procedure', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(claim_id)) {
    claim_id <- defaults$claim_id
  }
  if (!is.null(claim_id)) {
    fields <- c(fields, "claim_id")
    values <- c(values, if (is.null(claim_id)) "NULL" else if (is(claim_id, "subQuery")) paste0("(", as.character(claim_id), ")") else paste0("'", as.character(claim_id), "'"))
  }

  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    fields <- c(fields, "member_id")
    values <- c(values, if (is.null(member_id)) "NULL" else if (is(member_id, "subQuery")) paste0("(", as.character(member_id), ")") else paste0("'", as.character(member_id), "'"))
  }

  if (missing(type_of_claim)) {
    type_of_claim <- defaults$type_of_claim
  }
  if (!is.null(type_of_claim)) {
    fields <- c(fields, "type_of_claim")
    values <- c(values, if (is.null(type_of_claim)) "NULL" else if (is(type_of_claim, "subQuery")) paste0("(", as.character(type_of_claim), ")") else paste0("'", as.character(type_of_claim), "'"))
  }

  if (missing(month_and_year_of_medical_care)) {
    month_and_year_of_medical_care <- defaults$month_and_year_of_medical_care
  }
  if (!is.null(month_and_year_of_medical_care)) {
    fields <- c(fields, "month_and_year_of_medical_care")
    values <- c(values, if (is.null(month_and_year_of_medical_care)) "NULL" else if (is(month_and_year_of_medical_care, "subQuery")) paste0("(", as.character(month_and_year_of_medical_care), ")") else paste0("'", as.character(month_and_year_of_medical_care), "'"))
  }

  if (missing(date_of_procedure)) {
    date_of_procedure <- defaults$date_of_procedure
  }
  if (!is.null(date_of_procedure)) {
    fields <- c(fields, "date_of_procedure")
    values <- c(values, if (is.null(date_of_procedure)) "NULL" else if (is(date_of_procedure, "subQuery")) paste0("(", as.character(date_of_procedure), ")") else paste0("'", as.character(date_of_procedure), "'"))
  }

  if (missing(standardized_procedure_id)) {
    standardized_procedure_id <- defaults$standardized_procedure_id
  }
  if (!is.null(standardized_procedure_id)) {
    fields <- c(fields, "standardized_procedure_id")
    values <- c(values, if (is.null(standardized_procedure_id)) "NULL" else if (is(standardized_procedure_id, "subQuery")) paste0("(", as.character(standardized_procedure_id), ")") else paste0("'", as.character(standardized_procedure_id), "'"))
  }

  if (missing(medical_facility_id)) {
    medical_facility_id <- defaults$medical_facility_id
  }
  if (!is.null(medical_facility_id)) {
    fields <- c(fields, "medical_facility_id")
    values <- c(values, if (is.null(medical_facility_id)) "NULL" else if (is(medical_facility_id, "subQuery")) paste0("(", as.character(medical_facility_id), ")") else paste0("'", as.character(medical_facility_id), "'"))
  }

  if (missing(statement_id)) {
    statement_id <- defaults$statement_id
  }
  if (!is.null(statement_id)) {
    fields <- c(fields, "statement_id")
    values <- c(values, if (is.null(statement_id)) "NULL" else if (is(statement_id, "subQuery")) paste0("(", as.character(statement_id), ")") else paste0("'", as.character(statement_id), "'"))
  }

  if (missing(standardized_procedure_version)) {
    standardized_procedure_version <- defaults$standardized_procedure_version
  }
  if (!is.null(standardized_procedure_version)) {
    fields <- c(fields, "standardized_procedure_version")
    values <- c(values, if (is.null(standardized_procedure_version)) "NULL" else if (is(standardized_procedure_version, "subQuery")) paste0("(", as.character(standardized_procedure_version), ")") else paste0("'", as.character(standardized_procedure_version), "'"))
  }

  if (missing(standardized_procedure_name)) {
    standardized_procedure_name <- defaults$standardized_procedure_name
  }
  if (!is.null(standardized_procedure_name)) {
    fields <- c(fields, "standardized_procedure_name")
    values <- c(values, if (is.null(standardized_procedure_name)) "NULL" else if (is(standardized_procedure_name, "subQuery")) paste0("(", as.character(standardized_procedure_name), ")") else paste0("'", as.character(standardized_procedure_name), "'"))
  }

  if (missing(number_of_times)) {
    number_of_times <- defaults$number_of_times
  }
  if (!is.null(number_of_times)) {
    fields <- c(fields, "number_of_times")
    values <- c(values, if (is.null(number_of_times)) "NULL" else if (is(number_of_times, "subQuery")) paste0("(", as.character(number_of_times), ")") else paste0("'", as.character(number_of_times), "'"))
  }

  if (missing(concurrent_id)) {
    concurrent_id <- defaults$concurrent_id
  }
  if (!is.null(concurrent_id)) {
    fields <- c(fields, "concurrent_id")
    values <- c(values, if (is.null(concurrent_id)) "NULL" else if (is(concurrent_id, "subQuery")) paste0("(", as.character(concurrent_id), ")") else paste0("'", as.character(concurrent_id), "'"))
  }

  if (missing(category_of_medical_care)) {
    category_of_medical_care <- defaults$category_of_medical_care
  }
  if (!is.null(category_of_medical_care)) {
    fields <- c(fields, "category_of_medical_care")
    values <- c(values, if (is.null(category_of_medical_care)) "NULL" else if (is(category_of_medical_care, "subQuery")) paste0("(", as.character(category_of_medical_care), ")") else paste0("'", as.character(category_of_medical_care), "'"))
  }

  if (missing(actual_point)) {
    actual_point <- defaults$actual_point
  }
  if (!is.null(actual_point)) {
    fields <- c(fields, "actual_point")
    values <- c(values, if (is.null(actual_point)) "NULL" else if (is(actual_point, "subQuery")) paste0("(", as.character(actual_point), ")") else paste0("'", as.character(actual_point), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "[procedure]", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_procedure_master <- function(standardized_procedure_id, standardized_procedure_version, standardized_procedure_name, procedure_category_medium_classification_name, procedure_category_small_classification_name, procedure_category_subclassification_name, procedure_category_sub_and_detail_classification_name, procedure_code, procedure_standard_point, icd9cm_level1) {
  defaults <- get('procedure_master', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(standardized_procedure_id)) {
    standardized_procedure_id <- defaults$standardized_procedure_id
  }
  if (!is.null(standardized_procedure_id)) {
    fields <- c(fields, "standardized_procedure_id")
    values <- c(values, if (is.null(standardized_procedure_id)) "NULL" else if (is(standardized_procedure_id, "subQuery")) paste0("(", as.character(standardized_procedure_id), ")") else paste0("'", as.character(standardized_procedure_id), "'"))
  }

  if (missing(standardized_procedure_version)) {
    standardized_procedure_version <- defaults$standardized_procedure_version
  }
  if (!is.null(standardized_procedure_version)) {
    fields <- c(fields, "standardized_procedure_version")
    values <- c(values, if (is.null(standardized_procedure_version)) "NULL" else if (is(standardized_procedure_version, "subQuery")) paste0("(", as.character(standardized_procedure_version), ")") else paste0("'", as.character(standardized_procedure_version), "'"))
  }

  if (missing(standardized_procedure_name)) {
    standardized_procedure_name <- defaults$standardized_procedure_name
  }
  if (!is.null(standardized_procedure_name)) {
    fields <- c(fields, "standardized_procedure_name")
    values <- c(values, if (is.null(standardized_procedure_name)) "NULL" else if (is(standardized_procedure_name, "subQuery")) paste0("(", as.character(standardized_procedure_name), ")") else paste0("'", as.character(standardized_procedure_name), "'"))
  }

  if (missing(procedure_category_medium_classification_name)) {
    procedure_category_medium_classification_name <- defaults$procedure_category_medium_classification_name
  }
  if (!is.null(procedure_category_medium_classification_name)) {
    fields <- c(fields, "procedure_category_medium_classification_name")
    values <- c(values, if (is.null(procedure_category_medium_classification_name)) "NULL" else if (is(procedure_category_medium_classification_name, "subQuery")) paste0("(", as.character(procedure_category_medium_classification_name), ")") else paste0("'", as.character(procedure_category_medium_classification_name), "'"))
  }

  if (missing(procedure_category_small_classification_name)) {
    procedure_category_small_classification_name <- defaults$procedure_category_small_classification_name
  }
  if (!is.null(procedure_category_small_classification_name)) {
    fields <- c(fields, "procedure_category_small_classification_name")
    values <- c(values, if (is.null(procedure_category_small_classification_name)) "NULL" else if (is(procedure_category_small_classification_name, "subQuery")) paste0("(", as.character(procedure_category_small_classification_name), ")") else paste0("'", as.character(procedure_category_small_classification_name), "'"))
  }

  if (missing(procedure_category_subclassification_name)) {
    procedure_category_subclassification_name <- defaults$procedure_category_subclassification_name
  }
  if (!is.null(procedure_category_subclassification_name)) {
    fields <- c(fields, "procedure_category_subclassification_name")
    values <- c(values, if (is.null(procedure_category_subclassification_name)) "NULL" else if (is(procedure_category_subclassification_name, "subQuery")) paste0("(", as.character(procedure_category_subclassification_name), ")") else paste0("'", as.character(procedure_category_subclassification_name), "'"))
  }

  if (missing(procedure_category_sub_and_detail_classification_name)) {
    procedure_category_sub_and_detail_classification_name <- defaults$procedure_category_sub_and_detail_classification_name
  }
  if (!is.null(procedure_category_sub_and_detail_classification_name)) {
    fields <- c(fields, "procedure_category_sub_and_detail_classification_name")
    values <- c(values, if (is.null(procedure_category_sub_and_detail_classification_name)) "NULL" else if (is(procedure_category_sub_and_detail_classification_name, "subQuery")) paste0("(", as.character(procedure_category_sub_and_detail_classification_name), ")") else paste0("'", as.character(procedure_category_sub_and_detail_classification_name), "'"))
  }

  if (missing(procedure_code)) {
    procedure_code <- defaults$procedure_code
  }
  if (!is.null(procedure_code)) {
    fields <- c(fields, "procedure_code")
    values <- c(values, if (is.null(procedure_code)) "NULL" else if (is(procedure_code, "subQuery")) paste0("(", as.character(procedure_code), ")") else paste0("'", as.character(procedure_code), "'"))
  }

  if (missing(procedure_standard_point)) {
    procedure_standard_point <- defaults$procedure_standard_point
  }
  if (!is.null(procedure_standard_point)) {
    fields <- c(fields, "procedure_standard_point")
    values <- c(values, if (is.null(procedure_standard_point)) "NULL" else if (is(procedure_standard_point, "subQuery")) paste0("(", as.character(procedure_standard_point), ")") else paste0("'", as.character(procedure_standard_point), "'"))
  }

  if (missing(icd9cm_level1)) {
    icd9cm_level1 <- defaults$icd9cm_level1
  }
  if (!is.null(icd9cm_level1)) {
    fields <- c(fields, "icd9cm_level1")
    values <- c(values, if (is.null(icd9cm_level1)) "NULL" else if (is(icd9cm_level1, "subQuery")) paste0("(", as.character(icd9cm_level1), ")") else paste0("'", as.character(icd9cm_level1), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "procedure_master", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_annual_health_checkup <- function(health_checkup_id, member_id, date_of_health_checkup, bmi, abdominal_circumference, systolic_bp, diastolic_bp, triglyceride, hdl_cholesterol, ldl_cholesterol, ast, alt, g_gt, fasting_blood_sugar, casual_blood_sugar, hba1c, urinary_sugar, uric_protein_qualitative, hct, hemoglobin_content, rbc_count, serum_creatinine, serum_uric_acid, total_cholesterol, ecg, presence_of_medical_history, time_of_blood_collection, presence_of_subjective_symptoms, presence_of_objective_symptoms, Fundus_examination_Keith_Wagener_classification, fundus_examination_scheie_classification_h, fundus_examination_scheie_classification_s, fundus_examination_scott_classification, smoking_habit, eating1_fast_eating, eating2_before_bedtime, eating3_late_evening_snack, eating_habit, drinking_habit, amount_drinking, sleep, Drug1_Hypertention, Drug2_Diabetes, Drug3_Hyperlipidemia, Medical_history1_Cerebrovascular, Medical_history2_Cardiovascular, Medical_history3_Renal, anemia, Change_of_weight_from_age_of_twenty, exercise_hibit, physical_activity, walking_speed, change_of_weight_in_a_year, lifestyle_modification, request_for_health_guidance) {
  defaults <- get('annual_health_checkup', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(health_checkup_id)) {
    health_checkup_id <- defaults$health_checkup_id
  }
  if (!is.null(health_checkup_id)) {
    fields <- c(fields, "health_checkup_id")
    values <- c(values, if (is.null(health_checkup_id)) "NULL" else if (is(health_checkup_id, "subQuery")) paste0("(", as.character(health_checkup_id), ")") else paste0("'", as.character(health_checkup_id), "'"))
  }

  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    fields <- c(fields, "member_id")
    values <- c(values, if (is.null(member_id)) "NULL" else if (is(member_id, "subQuery")) paste0("(", as.character(member_id), ")") else paste0("'", as.character(member_id), "'"))
  }

  if (missing(date_of_health_checkup)) {
    date_of_health_checkup <- defaults$date_of_health_checkup
  }
  if (!is.null(date_of_health_checkup)) {
    fields <- c(fields, "date_of_health_checkup")
    values <- c(values, if (is.null(date_of_health_checkup)) "NULL" else if (is(date_of_health_checkup, "subQuery")) paste0("(", as.character(date_of_health_checkup), ")") else paste0("'", as.character(date_of_health_checkup), "'"))
  }

  if (missing(bmi)) {
    bmi <- defaults$bmi
  }
  if (!is.null(bmi)) {
    fields <- c(fields, "bmi")
    values <- c(values, if (is.null(bmi)) "NULL" else if (is(bmi, "subQuery")) paste0("(", as.character(bmi), ")") else paste0("'", as.character(bmi), "'"))
  }

  if (missing(abdominal_circumference)) {
    abdominal_circumference <- defaults$abdominal_circumference
  }
  if (!is.null(abdominal_circumference)) {
    fields <- c(fields, "abdominal_circumference")
    values <- c(values, if (is.null(abdominal_circumference)) "NULL" else if (is(abdominal_circumference, "subQuery")) paste0("(", as.character(abdominal_circumference), ")") else paste0("'", as.character(abdominal_circumference), "'"))
  }

  if (missing(systolic_bp)) {
    systolic_bp <- defaults$systolic_bp
  }
  if (!is.null(systolic_bp)) {
    fields <- c(fields, "systolic_bp")
    values <- c(values, if (is.null(systolic_bp)) "NULL" else if (is(systolic_bp, "subQuery")) paste0("(", as.character(systolic_bp), ")") else paste0("'", as.character(systolic_bp), "'"))
  }

  if (missing(diastolic_bp)) {
    diastolic_bp <- defaults$diastolic_bp
  }
  if (!is.null(diastolic_bp)) {
    fields <- c(fields, "diastolic_bp")
    values <- c(values, if (is.null(diastolic_bp)) "NULL" else if (is(diastolic_bp, "subQuery")) paste0("(", as.character(diastolic_bp), ")") else paste0("'", as.character(diastolic_bp), "'"))
  }

  if (missing(triglyceride)) {
    triglyceride <- defaults$triglyceride
  }
  if (!is.null(triglyceride)) {
    fields <- c(fields, "triglyceride")
    values <- c(values, if (is.null(triglyceride)) "NULL" else if (is(triglyceride, "subQuery")) paste0("(", as.character(triglyceride), ")") else paste0("'", as.character(triglyceride), "'"))
  }

  if (missing(hdl_cholesterol)) {
    hdl_cholesterol <- defaults$hdl_cholesterol
  }
  if (!is.null(hdl_cholesterol)) {
    fields <- c(fields, "hdl_cholesterol")
    values <- c(values, if (is.null(hdl_cholesterol)) "NULL" else if (is(hdl_cholesterol, "subQuery")) paste0("(", as.character(hdl_cholesterol), ")") else paste0("'", as.character(hdl_cholesterol), "'"))
  }

  if (missing(ldl_cholesterol)) {
    ldl_cholesterol <- defaults$ldl_cholesterol
  }
  if (!is.null(ldl_cholesterol)) {
    fields <- c(fields, "ldl_cholesterol")
    values <- c(values, if (is.null(ldl_cholesterol)) "NULL" else if (is(ldl_cholesterol, "subQuery")) paste0("(", as.character(ldl_cholesterol), ")") else paste0("'", as.character(ldl_cholesterol), "'"))
  }

  if (missing(ast)) {
    ast <- defaults$ast
  }
  if (!is.null(ast)) {
    fields <- c(fields, "ast")
    values <- c(values, if (is.null(ast)) "NULL" else if (is(ast, "subQuery")) paste0("(", as.character(ast), ")") else paste0("'", as.character(ast), "'"))
  }

  if (missing(alt)) {
    alt <- defaults$alt
  }
  if (!is.null(alt)) {
    fields <- c(fields, "alt")
    values <- c(values, if (is.null(alt)) "NULL" else if (is(alt, "subQuery")) paste0("(", as.character(alt), ")") else paste0("'", as.character(alt), "'"))
  }

  if (missing(g_gt)) {
    g_gt <- defaults$g_gt
  }
  if (!is.null(g_gt)) {
    fields <- c(fields, "g_gt")
    values <- c(values, if (is.null(g_gt)) "NULL" else if (is(g_gt, "subQuery")) paste0("(", as.character(g_gt), ")") else paste0("'", as.character(g_gt), "'"))
  }

  if (missing(fasting_blood_sugar)) {
    fasting_blood_sugar <- defaults$fasting_blood_sugar
  }
  if (!is.null(fasting_blood_sugar)) {
    fields <- c(fields, "fasting_blood_sugar")
    values <- c(values, if (is.null(fasting_blood_sugar)) "NULL" else if (is(fasting_blood_sugar, "subQuery")) paste0("(", as.character(fasting_blood_sugar), ")") else paste0("'", as.character(fasting_blood_sugar), "'"))
  }

  if (missing(casual_blood_sugar)) {
    casual_blood_sugar <- defaults$casual_blood_sugar
  }
  if (!is.null(casual_blood_sugar)) {
    fields <- c(fields, "casual_blood_sugar")
    values <- c(values, if (is.null(casual_blood_sugar)) "NULL" else if (is(casual_blood_sugar, "subQuery")) paste0("(", as.character(casual_blood_sugar), ")") else paste0("'", as.character(casual_blood_sugar), "'"))
  }

  if (missing(hba1c)) {
    hba1c <- defaults$hba1c
  }
  if (!is.null(hba1c)) {
    fields <- c(fields, "hba1c")
    values <- c(values, if (is.null(hba1c)) "NULL" else if (is(hba1c, "subQuery")) paste0("(", as.character(hba1c), ")") else paste0("'", as.character(hba1c), "'"))
  }

  if (missing(urinary_sugar)) {
    urinary_sugar <- defaults$urinary_sugar
  }
  if (!is.null(urinary_sugar)) {
    fields <- c(fields, "urinary_sugar")
    values <- c(values, if (is.null(urinary_sugar)) "NULL" else if (is(urinary_sugar, "subQuery")) paste0("(", as.character(urinary_sugar), ")") else paste0("'", as.character(urinary_sugar), "'"))
  }

  if (missing(uric_protein_qualitative)) {
    uric_protein_qualitative <- defaults$uric_protein_qualitative
  }
  if (!is.null(uric_protein_qualitative)) {
    fields <- c(fields, "uric_protein_qualitative")
    values <- c(values, if (is.null(uric_protein_qualitative)) "NULL" else if (is(uric_protein_qualitative, "subQuery")) paste0("(", as.character(uric_protein_qualitative), ")") else paste0("'", as.character(uric_protein_qualitative), "'"))
  }

  if (missing(hct)) {
    hct <- defaults$hct
  }
  if (!is.null(hct)) {
    fields <- c(fields, "hct")
    values <- c(values, if (is.null(hct)) "NULL" else if (is(hct, "subQuery")) paste0("(", as.character(hct), ")") else paste0("'", as.character(hct), "'"))
  }

  if (missing(hemoglobin_content)) {
    hemoglobin_content <- defaults$hemoglobin_content
  }
  if (!is.null(hemoglobin_content)) {
    fields <- c(fields, "hemoglobin_content")
    values <- c(values, if (is.null(hemoglobin_content)) "NULL" else if (is(hemoglobin_content, "subQuery")) paste0("(", as.character(hemoglobin_content), ")") else paste0("'", as.character(hemoglobin_content), "'"))
  }

  if (missing(rbc_count)) {
    rbc_count <- defaults$rbc_count
  }
  if (!is.null(rbc_count)) {
    fields <- c(fields, "rbc_count")
    values <- c(values, if (is.null(rbc_count)) "NULL" else if (is(rbc_count, "subQuery")) paste0("(", as.character(rbc_count), ")") else paste0("'", as.character(rbc_count), "'"))
  }

  if (missing(serum_creatinine)) {
    serum_creatinine <- defaults$serum_creatinine
  }
  if (!is.null(serum_creatinine)) {
    fields <- c(fields, "serum_creatinine")
    values <- c(values, if (is.null(serum_creatinine)) "NULL" else if (is(serum_creatinine, "subQuery")) paste0("(", as.character(serum_creatinine), ")") else paste0("'", as.character(serum_creatinine), "'"))
  }

  if (missing(serum_uric_acid)) {
    serum_uric_acid <- defaults$serum_uric_acid
  }
  if (!is.null(serum_uric_acid)) {
    fields <- c(fields, "serum_uric_acid")
    values <- c(values, if (is.null(serum_uric_acid)) "NULL" else if (is(serum_uric_acid, "subQuery")) paste0("(", as.character(serum_uric_acid), ")") else paste0("'", as.character(serum_uric_acid), "'"))
  }

  if (missing(total_cholesterol)) {
    total_cholesterol <- defaults$total_cholesterol
  }
  if (!is.null(total_cholesterol)) {
    fields <- c(fields, "total_cholesterol")
    values <- c(values, if (is.null(total_cholesterol)) "NULL" else if (is(total_cholesterol, "subQuery")) paste0("(", as.character(total_cholesterol), ")") else paste0("'", as.character(total_cholesterol), "'"))
  }

  if (missing(ecg)) {
    ecg <- defaults$ecg
  }
  if (!is.null(ecg)) {
    fields <- c(fields, "ecg")
    values <- c(values, if (is.null(ecg)) "NULL" else if (is(ecg, "subQuery")) paste0("(", as.character(ecg), ")") else paste0("'", as.character(ecg), "'"))
  }

  if (missing(presence_of_medical_history)) {
    presence_of_medical_history <- defaults$presence_of_medical_history
  }
  if (!is.null(presence_of_medical_history)) {
    fields <- c(fields, "presence_of_medical_history")
    values <- c(values, if (is.null(presence_of_medical_history)) "NULL" else if (is(presence_of_medical_history, "subQuery")) paste0("(", as.character(presence_of_medical_history), ")") else paste0("'", as.character(presence_of_medical_history), "'"))
  }

  if (missing(time_of_blood_collection)) {
    time_of_blood_collection <- defaults$time_of_blood_collection
  }
  if (!is.null(time_of_blood_collection)) {
    fields <- c(fields, "time_of_blood_collection")
    values <- c(values, if (is.null(time_of_blood_collection)) "NULL" else if (is(time_of_blood_collection, "subQuery")) paste0("(", as.character(time_of_blood_collection), ")") else paste0("'", as.character(time_of_blood_collection), "'"))
  }

  if (missing(presence_of_subjective_symptoms)) {
    presence_of_subjective_symptoms <- defaults$presence_of_subjective_symptoms
  }
  if (!is.null(presence_of_subjective_symptoms)) {
    fields <- c(fields, "presence_of_subjective_symptoms")
    values <- c(values, if (is.null(presence_of_subjective_symptoms)) "NULL" else if (is(presence_of_subjective_symptoms, "subQuery")) paste0("(", as.character(presence_of_subjective_symptoms), ")") else paste0("'", as.character(presence_of_subjective_symptoms), "'"))
  }

  if (missing(presence_of_objective_symptoms)) {
    presence_of_objective_symptoms <- defaults$presence_of_objective_symptoms
  }
  if (!is.null(presence_of_objective_symptoms)) {
    fields <- c(fields, "presence_of_objective_symptoms")
    values <- c(values, if (is.null(presence_of_objective_symptoms)) "NULL" else if (is(presence_of_objective_symptoms, "subQuery")) paste0("(", as.character(presence_of_objective_symptoms), ")") else paste0("'", as.character(presence_of_objective_symptoms), "'"))
  }

  if (missing(Fundus_examination_Keith_Wagener_classification)) {
    Fundus_examination_Keith_Wagener_classification <- defaults$Fundus_examination_Keith_Wagener_classification
  }
  if (!is.null(Fundus_examination_Keith_Wagener_classification)) {
    fields <- c(fields, "Fundus_examination_Keith_Wagener_classification")
    values <- c(values, if (is.null(Fundus_examination_Keith_Wagener_classification)) "NULL" else if (is(Fundus_examination_Keith_Wagener_classification, "subQuery")) paste0("(", as.character(Fundus_examination_Keith_Wagener_classification), ")") else paste0("'", as.character(Fundus_examination_Keith_Wagener_classification), "'"))
  }

  if (missing(fundus_examination_scheie_classification_h)) {
    fundus_examination_scheie_classification_h <- defaults$fundus_examination_scheie_classification_h
  }
  if (!is.null(fundus_examination_scheie_classification_h)) {
    fields <- c(fields, "fundus_examination_scheie_classification_h")
    values <- c(values, if (is.null(fundus_examination_scheie_classification_h)) "NULL" else if (is(fundus_examination_scheie_classification_h, "subQuery")) paste0("(", as.character(fundus_examination_scheie_classification_h), ")") else paste0("'", as.character(fundus_examination_scheie_classification_h), "'"))
  }

  if (missing(fundus_examination_scheie_classification_s)) {
    fundus_examination_scheie_classification_s <- defaults$fundus_examination_scheie_classification_s
  }
  if (!is.null(fundus_examination_scheie_classification_s)) {
    fields <- c(fields, "fundus_examination_scheie_classification_s")
    values <- c(values, if (is.null(fundus_examination_scheie_classification_s)) "NULL" else if (is(fundus_examination_scheie_classification_s, "subQuery")) paste0("(", as.character(fundus_examination_scheie_classification_s), ")") else paste0("'", as.character(fundus_examination_scheie_classification_s), "'"))
  }

  if (missing(fundus_examination_scott_classification)) {
    fundus_examination_scott_classification <- defaults$fundus_examination_scott_classification
  }
  if (!is.null(fundus_examination_scott_classification)) {
    fields <- c(fields, "fundus_examination_scott_classification")
    values <- c(values, if (is.null(fundus_examination_scott_classification)) "NULL" else if (is(fundus_examination_scott_classification, "subQuery")) paste0("(", as.character(fundus_examination_scott_classification), ")") else paste0("'", as.character(fundus_examination_scott_classification), "'"))
  }

  if (missing(smoking_habit)) {
    smoking_habit <- defaults$smoking_habit
  }
  if (!is.null(smoking_habit)) {
    fields <- c(fields, "smoking_habit")
    values <- c(values, if (is.null(smoking_habit)) "NULL" else if (is(smoking_habit, "subQuery")) paste0("(", as.character(smoking_habit), ")") else paste0("'", as.character(smoking_habit), "'"))
  }

  if (missing(eating1_fast_eating)) {
    eating1_fast_eating <- defaults$eating1_fast_eating
  }
  if (!is.null(eating1_fast_eating)) {
    fields <- c(fields, "eating1_fast_eating")
    values <- c(values, if (is.null(eating1_fast_eating)) "NULL" else if (is(eating1_fast_eating, "subQuery")) paste0("(", as.character(eating1_fast_eating), ")") else paste0("'", as.character(eating1_fast_eating), "'"))
  }

  if (missing(eating2_before_bedtime)) {
    eating2_before_bedtime <- defaults$eating2_before_bedtime
  }
  if (!is.null(eating2_before_bedtime)) {
    fields <- c(fields, "eating2_before_bedtime")
    values <- c(values, if (is.null(eating2_before_bedtime)) "NULL" else if (is(eating2_before_bedtime, "subQuery")) paste0("(", as.character(eating2_before_bedtime), ")") else paste0("'", as.character(eating2_before_bedtime), "'"))
  }

  if (missing(eating3_late_evening_snack)) {
    eating3_late_evening_snack <- defaults$eating3_late_evening_snack
  }
  if (!is.null(eating3_late_evening_snack)) {
    fields <- c(fields, "eating3_late_evening_snack")
    values <- c(values, if (is.null(eating3_late_evening_snack)) "NULL" else if (is(eating3_late_evening_snack, "subQuery")) paste0("(", as.character(eating3_late_evening_snack), ")") else paste0("'", as.character(eating3_late_evening_snack), "'"))
  }

  if (missing(eating_habit)) {
    eating_habit <- defaults$eating_habit
  }
  if (!is.null(eating_habit)) {
    fields <- c(fields, "eating_habit")
    values <- c(values, if (is.null(eating_habit)) "NULL" else if (is(eating_habit, "subQuery")) paste0("(", as.character(eating_habit), ")") else paste0("'", as.character(eating_habit), "'"))
  }

  if (missing(drinking_habit)) {
    drinking_habit <- defaults$drinking_habit
  }
  if (!is.null(drinking_habit)) {
    fields <- c(fields, "drinking_habit")
    values <- c(values, if (is.null(drinking_habit)) "NULL" else if (is(drinking_habit, "subQuery")) paste0("(", as.character(drinking_habit), ")") else paste0("'", as.character(drinking_habit), "'"))
  }

  if (missing(amount_drinking)) {
    amount_drinking <- defaults$amount_drinking
  }
  if (!is.null(amount_drinking)) {
    fields <- c(fields, "amount_drinking")
    values <- c(values, if (is.null(amount_drinking)) "NULL" else if (is(amount_drinking, "subQuery")) paste0("(", as.character(amount_drinking), ")") else paste0("'", as.character(amount_drinking), "'"))
  }

  if (missing(sleep)) {
    sleep <- defaults$sleep
  }
  if (!is.null(sleep)) {
    fields <- c(fields, "sleep")
    values <- c(values, if (is.null(sleep)) "NULL" else if (is(sleep, "subQuery")) paste0("(", as.character(sleep), ")") else paste0("'", as.character(sleep), "'"))
  }

  if (missing(Drug1_Hypertention)) {
    Drug1_Hypertention <- defaults$Drug1_Hypertention
  }
  if (!is.null(Drug1_Hypertention)) {
    fields <- c(fields, "Drug1_Hypertention")
    values <- c(values, if (is.null(Drug1_Hypertention)) "NULL" else if (is(Drug1_Hypertention, "subQuery")) paste0("(", as.character(Drug1_Hypertention), ")") else paste0("'", as.character(Drug1_Hypertention), "'"))
  }

  if (missing(Drug2_Diabetes)) {
    Drug2_Diabetes <- defaults$Drug2_Diabetes
  }
  if (!is.null(Drug2_Diabetes)) {
    fields <- c(fields, "Drug2_Diabetes")
    values <- c(values, if (is.null(Drug2_Diabetes)) "NULL" else if (is(Drug2_Diabetes, "subQuery")) paste0("(", as.character(Drug2_Diabetes), ")") else paste0("'", as.character(Drug2_Diabetes), "'"))
  }

  if (missing(Drug3_Hyperlipidemia)) {
    Drug3_Hyperlipidemia <- defaults$Drug3_Hyperlipidemia
  }
  if (!is.null(Drug3_Hyperlipidemia)) {
    fields <- c(fields, "Drug3_Hyperlipidemia")
    values <- c(values, if (is.null(Drug3_Hyperlipidemia)) "NULL" else if (is(Drug3_Hyperlipidemia, "subQuery")) paste0("(", as.character(Drug3_Hyperlipidemia), ")") else paste0("'", as.character(Drug3_Hyperlipidemia), "'"))
  }

  if (missing(Medical_history1_Cerebrovascular)) {
    Medical_history1_Cerebrovascular <- defaults$Medical_history1_Cerebrovascular
  }
  if (!is.null(Medical_history1_Cerebrovascular)) {
    fields <- c(fields, "Medical_history1_Cerebrovascular")
    values <- c(values, if (is.null(Medical_history1_Cerebrovascular)) "NULL" else if (is(Medical_history1_Cerebrovascular, "subQuery")) paste0("(", as.character(Medical_history1_Cerebrovascular), ")") else paste0("'", as.character(Medical_history1_Cerebrovascular), "'"))
  }

  if (missing(Medical_history2_Cardiovascular)) {
    Medical_history2_Cardiovascular <- defaults$Medical_history2_Cardiovascular
  }
  if (!is.null(Medical_history2_Cardiovascular)) {
    fields <- c(fields, "Medical_history2_Cardiovascular")
    values <- c(values, if (is.null(Medical_history2_Cardiovascular)) "NULL" else if (is(Medical_history2_Cardiovascular, "subQuery")) paste0("(", as.character(Medical_history2_Cardiovascular), ")") else paste0("'", as.character(Medical_history2_Cardiovascular), "'"))
  }

  if (missing(Medical_history3_Renal)) {
    Medical_history3_Renal <- defaults$Medical_history3_Renal
  }
  if (!is.null(Medical_history3_Renal)) {
    fields <- c(fields, "Medical_history3_Renal")
    values <- c(values, if (is.null(Medical_history3_Renal)) "NULL" else if (is(Medical_history3_Renal, "subQuery")) paste0("(", as.character(Medical_history3_Renal), ")") else paste0("'", as.character(Medical_history3_Renal), "'"))
  }

  if (missing(anemia)) {
    anemia <- defaults$anemia
  }
  if (!is.null(anemia)) {
    fields <- c(fields, "anemia")
    values <- c(values, if (is.null(anemia)) "NULL" else if (is(anemia, "subQuery")) paste0("(", as.character(anemia), ")") else paste0("'", as.character(anemia), "'"))
  }

  if (missing(Change_of_weight_from_age_of_twenty)) {
    Change_of_weight_from_age_of_twenty <- defaults$Change_of_weight_from_age_of_twenty
  }
  if (!is.null(Change_of_weight_from_age_of_twenty)) {
    fields <- c(fields, "Change_of_weight_from_age_of_twenty")
    values <- c(values, if (is.null(Change_of_weight_from_age_of_twenty)) "NULL" else if (is(Change_of_weight_from_age_of_twenty, "subQuery")) paste0("(", as.character(Change_of_weight_from_age_of_twenty), ")") else paste0("'", as.character(Change_of_weight_from_age_of_twenty), "'"))
  }

  if (missing(exercise_hibit)) {
    exercise_hibit <- defaults$exercise_hibit
  }
  if (!is.null(exercise_hibit)) {
    fields <- c(fields, "exercise_hibit")
    values <- c(values, if (is.null(exercise_hibit)) "NULL" else if (is(exercise_hibit, "subQuery")) paste0("(", as.character(exercise_hibit), ")") else paste0("'", as.character(exercise_hibit), "'"))
  }

  if (missing(physical_activity)) {
    physical_activity <- defaults$physical_activity
  }
  if (!is.null(physical_activity)) {
    fields <- c(fields, "physical_activity")
    values <- c(values, if (is.null(physical_activity)) "NULL" else if (is(physical_activity, "subQuery")) paste0("(", as.character(physical_activity), ")") else paste0("'", as.character(physical_activity), "'"))
  }

  if (missing(walking_speed)) {
    walking_speed <- defaults$walking_speed
  }
  if (!is.null(walking_speed)) {
    fields <- c(fields, "walking_speed")
    values <- c(values, if (is.null(walking_speed)) "NULL" else if (is(walking_speed, "subQuery")) paste0("(", as.character(walking_speed), ")") else paste0("'", as.character(walking_speed), "'"))
  }

  if (missing(change_of_weight_in_a_year)) {
    change_of_weight_in_a_year <- defaults$change_of_weight_in_a_year
  }
  if (!is.null(change_of_weight_in_a_year)) {
    fields <- c(fields, "change_of_weight_in_a_year")
    values <- c(values, if (is.null(change_of_weight_in_a_year)) "NULL" else if (is(change_of_weight_in_a_year, "subQuery")) paste0("(", as.character(change_of_weight_in_a_year), ")") else paste0("'", as.character(change_of_weight_in_a_year), "'"))
  }

  if (missing(lifestyle_modification)) {
    lifestyle_modification <- defaults$lifestyle_modification
  }
  if (!is.null(lifestyle_modification)) {
    fields <- c(fields, "lifestyle_modification")
    values <- c(values, if (is.null(lifestyle_modification)) "NULL" else if (is(lifestyle_modification, "subQuery")) paste0("(", as.character(lifestyle_modification), ")") else paste0("'", as.character(lifestyle_modification), "'"))
  }

  if (missing(request_for_health_guidance)) {
    request_for_health_guidance <- defaults$request_for_health_guidance
  }
  if (!is.null(request_for_health_guidance)) {
    fields <- c(fields, "request_for_health_guidance")
    values <- c(values, if (is.null(request_for_health_guidance)) "NULL" else if (is(request_for_health_guidance, "subQuery")) paste0("(", as.character(request_for_health_guidance), ")") else paste0("'", as.character(request_for_health_guidance), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "annual_health_checkup", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_drug <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, date_of_prescription, administered_days, jmdc_drug_code, as_needed_medication_flag, prescribed_amount_per_day, administered_amount, unit_of_administered_amount, medical_facility_id, statement_id, drug_name, drug_price, date_of_dispense, concurrent_id, category_of_medical_care, actual_point) {
  defaults <- get('drug', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(claim_id)) {
    claim_id <- defaults$claim_id
  }
  if (!is.null(claim_id)) {
    fields <- c(fields, "claim_id")
    values <- c(values, if (is.null(claim_id)) "NULL" else if (is(claim_id, "subQuery")) paste0("(", as.character(claim_id), ")") else paste0("'", as.character(claim_id), "'"))
  }

  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    fields <- c(fields, "member_id")
    values <- c(values, if (is.null(member_id)) "NULL" else if (is(member_id, "subQuery")) paste0("(", as.character(member_id), ")") else paste0("'", as.character(member_id), "'"))
  }

  if (missing(type_of_claim)) {
    type_of_claim <- defaults$type_of_claim
  }
  if (!is.null(type_of_claim)) {
    fields <- c(fields, "type_of_claim")
    values <- c(values, if (is.null(type_of_claim)) "NULL" else if (is(type_of_claim, "subQuery")) paste0("(", as.character(type_of_claim), ")") else paste0("'", as.character(type_of_claim), "'"))
  }

  if (missing(month_and_year_of_medical_care)) {
    month_and_year_of_medical_care <- defaults$month_and_year_of_medical_care
  }
  if (!is.null(month_and_year_of_medical_care)) {
    fields <- c(fields, "month_and_year_of_medical_care")
    values <- c(values, if (is.null(month_and_year_of_medical_care)) "NULL" else if (is(month_and_year_of_medical_care, "subQuery")) paste0("(", as.character(month_and_year_of_medical_care), ")") else paste0("'", as.character(month_and_year_of_medical_care), "'"))
  }

  if (missing(date_of_prescription)) {
    date_of_prescription <- defaults$date_of_prescription
  }
  if (!is.null(date_of_prescription)) {
    fields <- c(fields, "date_of_prescription")
    values <- c(values, if (is.null(date_of_prescription)) "NULL" else if (is(date_of_prescription, "subQuery")) paste0("(", as.character(date_of_prescription), ")") else paste0("'", as.character(date_of_prescription), "'"))
  }

  if (missing(administered_days)) {
    administered_days <- defaults$administered_days
  }
  if (!is.null(administered_days)) {
    fields <- c(fields, "administered_days")
    values <- c(values, if (is.null(administered_days)) "NULL" else if (is(administered_days, "subQuery")) paste0("(", as.character(administered_days), ")") else paste0("'", as.character(administered_days), "'"))
  }

  if (missing(jmdc_drug_code)) {
    jmdc_drug_code <- defaults$jmdc_drug_code
  }
  if (!is.null(jmdc_drug_code)) {
    fields <- c(fields, "jmdc_drug_code")
    values <- c(values, if (is.null(jmdc_drug_code)) "NULL" else if (is(jmdc_drug_code, "subQuery")) paste0("(", as.character(jmdc_drug_code), ")") else paste0("'", as.character(jmdc_drug_code), "'"))
  }

  if (missing(as_needed_medication_flag)) {
    as_needed_medication_flag <- defaults$as_needed_medication_flag
  }
  if (!is.null(as_needed_medication_flag)) {
    fields <- c(fields, "as_needed_medication_flag")
    values <- c(values, if (is.null(as_needed_medication_flag)) "NULL" else if (is(as_needed_medication_flag, "subQuery")) paste0("(", as.character(as_needed_medication_flag), ")") else paste0("'", as.character(as_needed_medication_flag), "'"))
  }

  if (missing(prescribed_amount_per_day)) {
    prescribed_amount_per_day <- defaults$prescribed_amount_per_day
  }
  if (!is.null(prescribed_amount_per_day)) {
    fields <- c(fields, "prescribed_amount_per_day")
    values <- c(values, if (is.null(prescribed_amount_per_day)) "NULL" else if (is(prescribed_amount_per_day, "subQuery")) paste0("(", as.character(prescribed_amount_per_day), ")") else paste0("'", as.character(prescribed_amount_per_day), "'"))
  }

  if (missing(administered_amount)) {
    administered_amount <- defaults$administered_amount
  }
  if (!is.null(administered_amount)) {
    fields <- c(fields, "administered_amount")
    values <- c(values, if (is.null(administered_amount)) "NULL" else if (is(administered_amount, "subQuery")) paste0("(", as.character(administered_amount), ")") else paste0("'", as.character(administered_amount), "'"))
  }

  if (missing(unit_of_administered_amount)) {
    unit_of_administered_amount <- defaults$unit_of_administered_amount
  }
  if (!is.null(unit_of_administered_amount)) {
    fields <- c(fields, "unit_of_administered_amount")
    values <- c(values, if (is.null(unit_of_administered_amount)) "NULL" else if (is(unit_of_administered_amount, "subQuery")) paste0("(", as.character(unit_of_administered_amount), ")") else paste0("'", as.character(unit_of_administered_amount), "'"))
  }

  if (missing(medical_facility_id)) {
    medical_facility_id <- defaults$medical_facility_id
  }
  if (!is.null(medical_facility_id)) {
    fields <- c(fields, "medical_facility_id")
    values <- c(values, if (is.null(medical_facility_id)) "NULL" else if (is(medical_facility_id, "subQuery")) paste0("(", as.character(medical_facility_id), ")") else paste0("'", as.character(medical_facility_id), "'"))
  }

  if (missing(statement_id)) {
    statement_id <- defaults$statement_id
  }
  if (!is.null(statement_id)) {
    fields <- c(fields, "statement_id")
    values <- c(values, if (is.null(statement_id)) "NULL" else if (is(statement_id, "subQuery")) paste0("(", as.character(statement_id), ")") else paste0("'", as.character(statement_id), "'"))
  }

  if (missing(drug_name)) {
    drug_name <- defaults$drug_name
  }
  if (!is.null(drug_name)) {
    fields <- c(fields, "drug_name")
    values <- c(values, if (is.null(drug_name)) "NULL" else if (is(drug_name, "subQuery")) paste0("(", as.character(drug_name), ")") else paste0("'", as.character(drug_name), "'"))
  }

  if (missing(drug_price)) {
    drug_price <- defaults$drug_price
  }
  if (!is.null(drug_price)) {
    fields <- c(fields, "drug_price")
    values <- c(values, if (is.null(drug_price)) "NULL" else if (is(drug_price, "subQuery")) paste0("(", as.character(drug_price), ")") else paste0("'", as.character(drug_price), "'"))
  }

  if (missing(date_of_dispense)) {
    date_of_dispense <- defaults$date_of_dispense
  }
  if (!is.null(date_of_dispense)) {
    fields <- c(fields, "date_of_dispense")
    values <- c(values, if (is.null(date_of_dispense)) "NULL" else if (is(date_of_dispense, "subQuery")) paste0("(", as.character(date_of_dispense), ")") else paste0("'", as.character(date_of_dispense), "'"))
  }

  if (missing(concurrent_id)) {
    concurrent_id <- defaults$concurrent_id
  }
  if (!is.null(concurrent_id)) {
    fields <- c(fields, "concurrent_id")
    values <- c(values, if (is.null(concurrent_id)) "NULL" else if (is(concurrent_id, "subQuery")) paste0("(", as.character(concurrent_id), ")") else paste0("'", as.character(concurrent_id), "'"))
  }

  if (missing(category_of_medical_care)) {
    category_of_medical_care <- defaults$category_of_medical_care
  }
  if (!is.null(category_of_medical_care)) {
    fields <- c(fields, "category_of_medical_care")
    values <- c(values, if (is.null(category_of_medical_care)) "NULL" else if (is(category_of_medical_care, "subQuery")) paste0("(", as.character(category_of_medical_care), ")") else paste0("'", as.character(category_of_medical_care), "'"))
  }

  if (missing(actual_point)) {
    actual_point <- defaults$actual_point
  }
  if (!is.null(actual_point)) {
    fields <- c(fields, "actual_point")
    values <- c(values, if (is.null(actual_point)) "NULL" else if (is(actual_point, "subQuery")) paste0("(", as.character(actual_point), ")") else paste0("'", as.character(actual_point), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "drug", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_drug_master <- function(jmdc_drug_code, drug_name, standardized_unit, atc_level1_code, atc_level1_name, atc_level2_code, atc_level2_name, atc_level3_code, atc_level3_name, atc_level4_code, atc_level4_name, who_atc_code, who_atc_name, drug_code, general_name, brand_name, generic_drug_flag, formulation_large_classification_name, formulation_medium_classification_name, formulation_small_classification_name) {
  defaults <- get('drug_master', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(jmdc_drug_code)) {
    jmdc_drug_code <- defaults$jmdc_drug_code
  }
  if (!is.null(jmdc_drug_code)) {
    fields <- c(fields, "jmdc_drug_code")
    values <- c(values, if (is.null(jmdc_drug_code)) "NULL" else if (is(jmdc_drug_code, "subQuery")) paste0("(", as.character(jmdc_drug_code), ")") else paste0("'", as.character(jmdc_drug_code), "'"))
  }

  if (missing(drug_name)) {
    drug_name <- defaults$drug_name
  }
  if (!is.null(drug_name)) {
    fields <- c(fields, "drug_name")
    values <- c(values, if (is.null(drug_name)) "NULL" else if (is(drug_name, "subQuery")) paste0("(", as.character(drug_name), ")") else paste0("'", as.character(drug_name), "'"))
  }

  if (missing(standardized_unit)) {
    standardized_unit <- defaults$standardized_unit
  }
  if (!is.null(standardized_unit)) {
    fields <- c(fields, "standardized_unit")
    values <- c(values, if (is.null(standardized_unit)) "NULL" else if (is(standardized_unit, "subQuery")) paste0("(", as.character(standardized_unit), ")") else paste0("'", as.character(standardized_unit), "'"))
  }

  if (missing(atc_level1_code)) {
    atc_level1_code <- defaults$atc_level1_code
  }
  if (!is.null(atc_level1_code)) {
    fields <- c(fields, "atc_level1_code")
    values <- c(values, if (is.null(atc_level1_code)) "NULL" else if (is(atc_level1_code, "subQuery")) paste0("(", as.character(atc_level1_code), ")") else paste0("'", as.character(atc_level1_code), "'"))
  }

  if (missing(atc_level1_name)) {
    atc_level1_name <- defaults$atc_level1_name
  }
  if (!is.null(atc_level1_name)) {
    fields <- c(fields, "atc_level1_name")
    values <- c(values, if (is.null(atc_level1_name)) "NULL" else if (is(atc_level1_name, "subQuery")) paste0("(", as.character(atc_level1_name), ")") else paste0("'", as.character(atc_level1_name), "'"))
  }

  if (missing(atc_level2_code)) {
    atc_level2_code <- defaults$atc_level2_code
  }
  if (!is.null(atc_level2_code)) {
    fields <- c(fields, "atc_level2_code")
    values <- c(values, if (is.null(atc_level2_code)) "NULL" else if (is(atc_level2_code, "subQuery")) paste0("(", as.character(atc_level2_code), ")") else paste0("'", as.character(atc_level2_code), "'"))
  }

  if (missing(atc_level2_name)) {
    atc_level2_name <- defaults$atc_level2_name
  }
  if (!is.null(atc_level2_name)) {
    fields <- c(fields, "atc_level2_name")
    values <- c(values, if (is.null(atc_level2_name)) "NULL" else if (is(atc_level2_name, "subQuery")) paste0("(", as.character(atc_level2_name), ")") else paste0("'", as.character(atc_level2_name), "'"))
  }

  if (missing(atc_level3_code)) {
    atc_level3_code <- defaults$atc_level3_code
  }
  if (!is.null(atc_level3_code)) {
    fields <- c(fields, "atc_level3_code")
    values <- c(values, if (is.null(atc_level3_code)) "NULL" else if (is(atc_level3_code, "subQuery")) paste0("(", as.character(atc_level3_code), ")") else paste0("'", as.character(atc_level3_code), "'"))
  }

  if (missing(atc_level3_name)) {
    atc_level3_name <- defaults$atc_level3_name
  }
  if (!is.null(atc_level3_name)) {
    fields <- c(fields, "atc_level3_name")
    values <- c(values, if (is.null(atc_level3_name)) "NULL" else if (is(atc_level3_name, "subQuery")) paste0("(", as.character(atc_level3_name), ")") else paste0("'", as.character(atc_level3_name), "'"))
  }

  if (missing(atc_level4_code)) {
    atc_level4_code <- defaults$atc_level4_code
  }
  if (!is.null(atc_level4_code)) {
    fields <- c(fields, "atc_level4_code")
    values <- c(values, if (is.null(atc_level4_code)) "NULL" else if (is(atc_level4_code, "subQuery")) paste0("(", as.character(atc_level4_code), ")") else paste0("'", as.character(atc_level4_code), "'"))
  }

  if (missing(atc_level4_name)) {
    atc_level4_name <- defaults$atc_level4_name
  }
  if (!is.null(atc_level4_name)) {
    fields <- c(fields, "atc_level4_name")
    values <- c(values, if (is.null(atc_level4_name)) "NULL" else if (is(atc_level4_name, "subQuery")) paste0("(", as.character(atc_level4_name), ")") else paste0("'", as.character(atc_level4_name), "'"))
  }

  if (missing(who_atc_code)) {
    who_atc_code <- defaults$who_atc_code
  }
  if (!is.null(who_atc_code)) {
    fields <- c(fields, "who_atc_code")
    values <- c(values, if (is.null(who_atc_code)) "NULL" else if (is(who_atc_code, "subQuery")) paste0("(", as.character(who_atc_code), ")") else paste0("'", as.character(who_atc_code), "'"))
  }

  if (missing(who_atc_name)) {
    who_atc_name <- defaults$who_atc_name
  }
  if (!is.null(who_atc_name)) {
    fields <- c(fields, "who_atc_name")
    values <- c(values, if (is.null(who_atc_name)) "NULL" else if (is(who_atc_name, "subQuery")) paste0("(", as.character(who_atc_name), ")") else paste0("'", as.character(who_atc_name), "'"))
  }

  if (missing(drug_code)) {
    drug_code <- defaults$drug_code
  }
  if (!is.null(drug_code)) {
    fields <- c(fields, "drug_code")
    values <- c(values, if (is.null(drug_code)) "NULL" else if (is(drug_code, "subQuery")) paste0("(", as.character(drug_code), ")") else paste0("'", as.character(drug_code), "'"))
  }

  if (missing(general_name)) {
    general_name <- defaults$general_name
  }
  if (!is.null(general_name)) {
    fields <- c(fields, "general_name")
    values <- c(values, if (is.null(general_name)) "NULL" else if (is(general_name, "subQuery")) paste0("(", as.character(general_name), ")") else paste0("'", as.character(general_name), "'"))
  }

  if (missing(brand_name)) {
    brand_name <- defaults$brand_name
  }
  if (!is.null(brand_name)) {
    fields <- c(fields, "brand_name")
    values <- c(values, if (is.null(brand_name)) "NULL" else if (is(brand_name, "subQuery")) paste0("(", as.character(brand_name), ")") else paste0("'", as.character(brand_name), "'"))
  }

  if (missing(generic_drug_flag)) {
    generic_drug_flag <- defaults$generic_drug_flag
  }
  if (!is.null(generic_drug_flag)) {
    fields <- c(fields, "generic_drug_flag")
    values <- c(values, if (is.null(generic_drug_flag)) "NULL" else if (is(generic_drug_flag, "subQuery")) paste0("(", as.character(generic_drug_flag), ")") else paste0("'", as.character(generic_drug_flag), "'"))
  }

  if (missing(formulation_large_classification_name)) {
    formulation_large_classification_name <- defaults$formulation_large_classification_name
  }
  if (!is.null(formulation_large_classification_name)) {
    fields <- c(fields, "formulation_large_classification_name")
    values <- c(values, if (is.null(formulation_large_classification_name)) "NULL" else if (is(formulation_large_classification_name, "subQuery")) paste0("(", as.character(formulation_large_classification_name), ")") else paste0("'", as.character(formulation_large_classification_name), "'"))
  }

  if (missing(formulation_medium_classification_name)) {
    formulation_medium_classification_name <- defaults$formulation_medium_classification_name
  }
  if (!is.null(formulation_medium_classification_name)) {
    fields <- c(fields, "formulation_medium_classification_name")
    values <- c(values, if (is.null(formulation_medium_classification_name)) "NULL" else if (is(formulation_medium_classification_name, "subQuery")) paste0("(", as.character(formulation_medium_classification_name), ")") else paste0("'", as.character(formulation_medium_classification_name), "'"))
  }

  if (missing(formulation_small_classification_name)) {
    formulation_small_classification_name <- defaults$formulation_small_classification_name
  }
  if (!is.null(formulation_small_classification_name)) {
    fields <- c(fields, "formulation_small_classification_name")
    values <- c(values, if (is.null(formulation_small_classification_name)) "NULL" else if (is(formulation_small_classification_name, "subQuery")) paste0("(", as.character(formulation_small_classification_name), ")") else paste0("'", as.character(formulation_small_classification_name), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "drug_master", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_medical_facility <- function(medical_facility_id, medium_classification_of_department, number_of_beds, hpgp, large_classification_of_department, management_body, home_care_support_clinic, regional_medical_care_support_hospitals, designated_cancer_care_hospitals, medical_institution_introducing_dpc, special_functioning_hospitals) {
  defaults <- get('medical_facility', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(medical_facility_id)) {
    medical_facility_id <- defaults$medical_facility_id
  }
  if (!is.null(medical_facility_id)) {
    fields <- c(fields, "medical_facility_id")
    values <- c(values, if (is.null(medical_facility_id)) "NULL" else if (is(medical_facility_id, "subQuery")) paste0("(", as.character(medical_facility_id), ")") else paste0("'", as.character(medical_facility_id), "'"))
  }

  if (missing(medium_classification_of_department)) {
    medium_classification_of_department <- defaults$medium_classification_of_department
  }
  if (!is.null(medium_classification_of_department)) {
    fields <- c(fields, "medium_classification_of_department")
    values <- c(values, if (is.null(medium_classification_of_department)) "NULL" else if (is(medium_classification_of_department, "subQuery")) paste0("(", as.character(medium_classification_of_department), ")") else paste0("'", as.character(medium_classification_of_department), "'"))
  }

  if (missing(number_of_beds)) {
    number_of_beds <- defaults$number_of_beds
  }
  if (!is.null(number_of_beds)) {
    fields <- c(fields, "number_of_beds")
    values <- c(values, if (is.null(number_of_beds)) "NULL" else if (is(number_of_beds, "subQuery")) paste0("(", as.character(number_of_beds), ")") else paste0("'", as.character(number_of_beds), "'"))
  }

  if (missing(hpgp)) {
    hpgp <- defaults$hpgp
  }
  if (!is.null(hpgp)) {
    fields <- c(fields, "hpgp")
    values <- c(values, if (is.null(hpgp)) "NULL" else if (is(hpgp, "subQuery")) paste0("(", as.character(hpgp), ")") else paste0("'", as.character(hpgp), "'"))
  }

  if (missing(large_classification_of_department)) {
    large_classification_of_department <- defaults$large_classification_of_department
  }
  if (!is.null(large_classification_of_department)) {
    fields <- c(fields, "large_classification_of_department")
    values <- c(values, if (is.null(large_classification_of_department)) "NULL" else if (is(large_classification_of_department, "subQuery")) paste0("(", as.character(large_classification_of_department), ")") else paste0("'", as.character(large_classification_of_department), "'"))
  }

  if (missing(management_body)) {
    management_body <- defaults$management_body
  }
  if (!is.null(management_body)) {
    fields <- c(fields, "management_body")
    values <- c(values, if (is.null(management_body)) "NULL" else if (is(management_body, "subQuery")) paste0("(", as.character(management_body), ")") else paste0("'", as.character(management_body), "'"))
  }

  if (missing(home_care_support_clinic)) {
    home_care_support_clinic <- defaults$home_care_support_clinic
  }
  if (!is.null(home_care_support_clinic)) {
    fields <- c(fields, "home_care_support_clinic")
    values <- c(values, if (is.null(home_care_support_clinic)) "NULL" else if (is(home_care_support_clinic, "subQuery")) paste0("(", as.character(home_care_support_clinic), ")") else paste0("'", as.character(home_care_support_clinic), "'"))
  }

  if (missing(regional_medical_care_support_hospitals)) {
    regional_medical_care_support_hospitals <- defaults$regional_medical_care_support_hospitals
  }
  if (!is.null(regional_medical_care_support_hospitals)) {
    fields <- c(fields, "regional_medical_care_support_hospitals")
    values <- c(values, if (is.null(regional_medical_care_support_hospitals)) "NULL" else if (is(regional_medical_care_support_hospitals, "subQuery")) paste0("(", as.character(regional_medical_care_support_hospitals), ")") else paste0("'", as.character(regional_medical_care_support_hospitals), "'"))
  }

  if (missing(designated_cancer_care_hospitals)) {
    designated_cancer_care_hospitals <- defaults$designated_cancer_care_hospitals
  }
  if (!is.null(designated_cancer_care_hospitals)) {
    fields <- c(fields, "designated_cancer_care_hospitals")
    values <- c(values, if (is.null(designated_cancer_care_hospitals)) "NULL" else if (is(designated_cancer_care_hospitals, "subQuery")) paste0("(", as.character(designated_cancer_care_hospitals), ")") else paste0("'", as.character(designated_cancer_care_hospitals), "'"))
  }

  if (missing(medical_institution_introducing_dpc)) {
    medical_institution_introducing_dpc <- defaults$medical_institution_introducing_dpc
  }
  if (!is.null(medical_institution_introducing_dpc)) {
    fields <- c(fields, "medical_institution_introducing_dpc")
    values <- c(values, if (is.null(medical_institution_introducing_dpc)) "NULL" else if (is(medical_institution_introducing_dpc, "subQuery")) paste0("(", as.character(medical_institution_introducing_dpc), ")") else paste0("'", as.character(medical_institution_introducing_dpc), "'"))
  }

  if (missing(special_functioning_hospitals)) {
    special_functioning_hospitals <- defaults$special_functioning_hospitals
  }
  if (!is.null(special_functioning_hospitals)) {
    fields <- c(fields, "special_functioning_hospitals")
    values <- c(values, if (is.null(special_functioning_hospitals)) "NULL" else if (is(special_functioning_hospitals, "subQuery")) paste0("(", as.character(special_functioning_hospitals), ")") else paste0("'", as.character(special_functioning_hospitals), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "medical_facility", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_material <- function(member_id, claim_id, type_of_claim, month_and_year_of_medical_care, statement_id, date_of_material, medical_facility_id, standardized_material_id, standardized_material_version, standardized_material_name, unit, number_of_material, concurrent_id, category_of_medical_care, actual_point) {
  defaults <- get('material', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    fields <- c(fields, "member_id")
    values <- c(values, if (is.null(member_id)) "NULL" else if (is(member_id, "subQuery")) paste0("(", as.character(member_id), ")") else paste0("'", as.character(member_id), "'"))
  }

  if (missing(claim_id)) {
    claim_id <- defaults$claim_id
  }
  if (!is.null(claim_id)) {
    fields <- c(fields, "claim_id")
    values <- c(values, if (is.null(claim_id)) "NULL" else if (is(claim_id, "subQuery")) paste0("(", as.character(claim_id), ")") else paste0("'", as.character(claim_id), "'"))
  }

  if (missing(type_of_claim)) {
    type_of_claim <- defaults$type_of_claim
  }
  if (!is.null(type_of_claim)) {
    fields <- c(fields, "type_of_claim")
    values <- c(values, if (is.null(type_of_claim)) "NULL" else if (is(type_of_claim, "subQuery")) paste0("(", as.character(type_of_claim), ")") else paste0("'", as.character(type_of_claim), "'"))
  }

  if (missing(month_and_year_of_medical_care)) {
    month_and_year_of_medical_care <- defaults$month_and_year_of_medical_care
  }
  if (!is.null(month_and_year_of_medical_care)) {
    fields <- c(fields, "month_and_year_of_medical_care")
    values <- c(values, if (is.null(month_and_year_of_medical_care)) "NULL" else if (is(month_and_year_of_medical_care, "subQuery")) paste0("(", as.character(month_and_year_of_medical_care), ")") else paste0("'", as.character(month_and_year_of_medical_care), "'"))
  }

  if (missing(statement_id)) {
    statement_id <- defaults$statement_id
  }
  if (!is.null(statement_id)) {
    fields <- c(fields, "statement_id")
    values <- c(values, if (is.null(statement_id)) "NULL" else if (is(statement_id, "subQuery")) paste0("(", as.character(statement_id), ")") else paste0("'", as.character(statement_id), "'"))
  }

  if (missing(date_of_material)) {
    date_of_material <- defaults$date_of_material
  }
  if (!is.null(date_of_material)) {
    fields <- c(fields, "date_of_material")
    values <- c(values, if (is.null(date_of_material)) "NULL" else if (is(date_of_material, "subQuery")) paste0("(", as.character(date_of_material), ")") else paste0("'", as.character(date_of_material), "'"))
  }

  if (missing(medical_facility_id)) {
    medical_facility_id <- defaults$medical_facility_id
  }
  if (!is.null(medical_facility_id)) {
    fields <- c(fields, "medical_facility_id")
    values <- c(values, if (is.null(medical_facility_id)) "NULL" else if (is(medical_facility_id, "subQuery")) paste0("(", as.character(medical_facility_id), ")") else paste0("'", as.character(medical_facility_id), "'"))
  }

  if (missing(standardized_material_id)) {
    standardized_material_id <- defaults$standardized_material_id
  }
  if (!is.null(standardized_material_id)) {
    fields <- c(fields, "standardized_material_id")
    values <- c(values, if (is.null(standardized_material_id)) "NULL" else if (is(standardized_material_id, "subQuery")) paste0("(", as.character(standardized_material_id), ")") else paste0("'", as.character(standardized_material_id), "'"))
  }

  if (missing(standardized_material_version)) {
    standardized_material_version <- defaults$standardized_material_version
  }
  if (!is.null(standardized_material_version)) {
    fields <- c(fields, "standardized_material_version")
    values <- c(values, if (is.null(standardized_material_version)) "NULL" else if (is(standardized_material_version, "subQuery")) paste0("(", as.character(standardized_material_version), ")") else paste0("'", as.character(standardized_material_version), "'"))
  }

  if (missing(standardized_material_name)) {
    standardized_material_name <- defaults$standardized_material_name
  }
  if (!is.null(standardized_material_name)) {
    fields <- c(fields, "standardized_material_name")
    values <- c(values, if (is.null(standardized_material_name)) "NULL" else if (is(standardized_material_name, "subQuery")) paste0("(", as.character(standardized_material_name), ")") else paste0("'", as.character(standardized_material_name), "'"))
  }

  if (missing(unit)) {
    unit <- defaults$unit
  }
  if (!is.null(unit)) {
    fields <- c(fields, "unit")
    values <- c(values, if (is.null(unit)) "NULL" else if (is(unit, "subQuery")) paste0("(", as.character(unit), ")") else paste0("'", as.character(unit), "'"))
  }

  if (missing(number_of_material)) {
    number_of_material <- defaults$number_of_material
  }
  if (!is.null(number_of_material)) {
    fields <- c(fields, "number_of_material")
    values <- c(values, if (is.null(number_of_material)) "NULL" else if (is(number_of_material, "subQuery")) paste0("(", as.character(number_of_material), ")") else paste0("'", as.character(number_of_material), "'"))
  }

  if (missing(concurrent_id)) {
    concurrent_id <- defaults$concurrent_id
  }
  if (!is.null(concurrent_id)) {
    fields <- c(fields, "concurrent_id")
    values <- c(values, if (is.null(concurrent_id)) "NULL" else if (is(concurrent_id, "subQuery")) paste0("(", as.character(concurrent_id), ")") else paste0("'", as.character(concurrent_id), "'"))
  }

  if (missing(category_of_medical_care)) {
    category_of_medical_care <- defaults$category_of_medical_care
  }
  if (!is.null(category_of_medical_care)) {
    fields <- c(fields, "category_of_medical_care")
    values <- c(values, if (is.null(category_of_medical_care)) "NULL" else if (is(category_of_medical_care, "subQuery")) paste0("(", as.character(category_of_medical_care), ")") else paste0("'", as.character(category_of_medical_care), "'"))
  }

  if (missing(actual_point)) {
    actual_point <- defaults$actual_point
  }
  if (!is.null(actual_point)) {
    fields <- c(fields, "actual_point")
    values <- c(values, if (is.null(actual_point)) "NULL" else if (is(actual_point, "subQuery")) paste0("(", as.character(actual_point), ")") else paste0("'", as.character(actual_point), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "material", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_material_master <- function(standardized_material_id, standardized_material_version, standardized_material_name, unit, material_category_large_classification_name, material_category_medium_classification_name, material_code, material_standard_price) {
  defaults <- get('material_master', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(standardized_material_id)) {
    standardized_material_id <- defaults$standardized_material_id
  }
  if (!is.null(standardized_material_id)) {
    fields <- c(fields, "standardized_material_id")
    values <- c(values, if (is.null(standardized_material_id)) "NULL" else if (is(standardized_material_id, "subQuery")) paste0("(", as.character(standardized_material_id), ")") else paste0("'", as.character(standardized_material_id), "'"))
  }

  if (missing(standardized_material_version)) {
    standardized_material_version <- defaults$standardized_material_version
  }
  if (!is.null(standardized_material_version)) {
    fields <- c(fields, "standardized_material_version")
    values <- c(values, if (is.null(standardized_material_version)) "NULL" else if (is(standardized_material_version, "subQuery")) paste0("(", as.character(standardized_material_version), ")") else paste0("'", as.character(standardized_material_version), "'"))
  }

  if (missing(standardized_material_name)) {
    standardized_material_name <- defaults$standardized_material_name
  }
  if (!is.null(standardized_material_name)) {
    fields <- c(fields, "standardized_material_name")
    values <- c(values, if (is.null(standardized_material_name)) "NULL" else if (is(standardized_material_name, "subQuery")) paste0("(", as.character(standardized_material_name), ")") else paste0("'", as.character(standardized_material_name), "'"))
  }

  if (missing(unit)) {
    unit <- defaults$unit
  }
  if (!is.null(unit)) {
    fields <- c(fields, "unit")
    values <- c(values, if (is.null(unit)) "NULL" else if (is(unit, "subQuery")) paste0("(", as.character(unit), ")") else paste0("'", as.character(unit), "'"))
  }

  if (missing(material_category_large_classification_name)) {
    material_category_large_classification_name <- defaults$material_category_large_classification_name
  }
  if (!is.null(material_category_large_classification_name)) {
    fields <- c(fields, "material_category_large_classification_name")
    values <- c(values, if (is.null(material_category_large_classification_name)) "NULL" else if (is(material_category_large_classification_name, "subQuery")) paste0("(", as.character(material_category_large_classification_name), ")") else paste0("'", as.character(material_category_large_classification_name), "'"))
  }

  if (missing(material_category_medium_classification_name)) {
    material_category_medium_classification_name <- defaults$material_category_medium_classification_name
  }
  if (!is.null(material_category_medium_classification_name)) {
    fields <- c(fields, "material_category_medium_classification_name")
    values <- c(values, if (is.null(material_category_medium_classification_name)) "NULL" else if (is(material_category_medium_classification_name, "subQuery")) paste0("(", as.character(material_category_medium_classification_name), ")") else paste0("'", as.character(material_category_medium_classification_name), "'"))
  }

  if (missing(material_code)) {
    material_code <- defaults$material_code
  }
  if (!is.null(material_code)) {
    fields <- c(fields, "material_code")
    values <- c(values, if (is.null(material_code)) "NULL" else if (is(material_code, "subQuery")) paste0("(", as.character(material_code), ")") else paste0("'", as.character(material_code), "'"))
  }

  if (missing(material_standard_price)) {
    material_standard_price <- defaults$material_standard_price
  }
  if (!is.null(material_standard_price)) {
    fields <- c(fields, "material_standard_price")
    values <- c(values, if (is.null(material_standard_price)) "NULL" else if (is(material_standard_price, "subQuery")) paste0("(", as.character(material_standard_price), ")") else paste0("'", as.character(material_standard_price), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "material_master", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_version <- function(version_id, version_date) {
  defaults <- get('version', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(version_id)) {
    version_id <- defaults$version_id
  }
  if (!is.null(version_id)) {
    fields <- c(fields, "version_id")
    values <- c(values, if (is.null(version_id)) "NULL" else if (is(version_id, "subQuery")) paste0("(", as.character(version_id), ")") else paste0("'", as.character(version_id), "'"))
  }

  if (missing(version_date)) {
    version_date <- defaults$version_date
  }
  if (!is.null(version_date)) {
    fields <- c(fields, "version_date")
    values <- c(values, if (is.null(version_date)) "NULL" else if (is(version_date, "subQuery")) paste0("(", as.character(version_date), ")") else paste0("'", as.character(version_date), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "_version", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

expect_cost <- function(cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  fields <- c()
  values <- c()
  if (!missing(cost_id)) {
    fields <- c(fields, "cost_id")
    values <- c(values, if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    fields <- c(fields, "cost_event_id")
    values <- c(values, if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    fields <- c(fields, "cost_domain_id")
    values <- c(values, if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    fields <- c(fields, "cost_type_concept_id")
    values <- c(values, if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    fields <- c(fields, "currency_concept_id")
    values <- c(values, if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    fields <- c(fields, "total_charge")
    values <- c(values, if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    fields <- c(fields, "total_cost")
    values <- c(values, if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    fields <- c(fields, "total_paid")
    values <- c(values, if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    fields <- c(fields, "paid_by_payer")
    values <- c(values, if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    fields <- c(fields, "paid_by_patient")
    values <- c(values, if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    fields <- c(fields, "paid_patient_copay")
    values <- c(values, if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    fields <- c(fields, "paid_patient_coinsurance")
    values <- c(values, if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    fields <- c(fields, "paid_patient_deductible")
    values <- c(values, if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    fields <- c(fields, "paid_by_primary")
    values <- c(values, if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    fields <- c(fields, "paid_ingredient_cost")
    values <- c(values, if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    fields <- c(fields, "paid_dispensing_fee")
    values <- c(values, if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    fields <- c(fields, "amount_allowed")
    values <- c(values, if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    fields <- c(fields, "revenue_code_concept_id")
    values <- c(values, if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    fields <- c(fields, "revenue_code_source_value")
    values <- c(values, if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    fields <- c(fields, "drg_concept_id")
    values <- c(values, if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    fields <- c(fields, "drg_source_value")
    values <- c(values, if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cost", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_source_value, visit_start_date, visit_end_date, care_site_id, visit_start_datetime, visit_end_datetime, visit_type_concept_id, provider_id, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    fields <- c(fields, "preceding_visit_occurrence_id")
    values <- c(values, if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "visit_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_person <- function(person_id, person_source_value, year_of_birth, month_of_birth, gender_concept_id, gender_source_value, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(person_source_value)) {
    fields <- c(fields, "person_source_value")
    values <- c(values, if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    fields <- c(fields, "month_of_birth")
    values <- c(values, if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(day_of_birth)) {
    fields <- c(fields, "day_of_birth")
    values <- c(values, if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    fields <- c(fields, "birth_datetime")
    values <- c(values, if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    fields <- c(fields, "race_concept_id")
    values <- c(values, if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    fields <- c(fields, "ethnicity_concept_id")
    values <- c(values, if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    fields <- c(fields, "race_source_value")
    values <- c(values, if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    fields <- c(fields, "race_source_concept_id")
    values <- c(values, if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    fields <- c(fields, "ethnicity_source_value")
    values <- c(values, if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    fields <- c(fields, "ethnicity_source_concept_id")
    values <- c(values, if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "person", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(observation_period_id)) {
    fields <- c(fields, "observation_period_id")
    values <- c(values, if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    fields <- c(fields, "observation_period_start_date")
    values <- c(values, if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    fields <- c(fields, "observation_period_end_date")
    values <- c(values, if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    fields <- c(fields, "period_type_concept_id")
    values <- c(values, if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "observation_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_death <- function(person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    fields <- c(fields, "death_date")
    values <- c(values, if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    fields <- c(fields, "death_datetime")
    values <- c(values, if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    fields <- c(fields, "death_type_concept_id")
    values <- c(values, if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    fields <- c(fields, "cause_concept_id")
    values <- c(values, if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    fields <- c(fields, "cause_source_value")
    values <- c(values, if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    fields <- c(fields, "cause_source_concept_id")
    values <- c(values, if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "death", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_condition_occurrence <- function(condition_occurrence_id, person_id, visit_occurrence_id, condition_type_concept_id, condition_start_date, condition_end_date, condition_concept_id, condition_source_value, condition_source_concept_id, provider_id, condition_start_datetime, condition_end_datetime, stop_reason, visit_detail_id, condition_status_source_value, condition_status_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(condition_occurrence_id)) {
    fields <- c(fields, "condition_occurrence_id")
    values <- c(values, if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    fields <- c(fields, "condition_type_concept_id")
    values <- c(values, if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    fields <- c(fields, "condition_start_date")
    values <- c(values, if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_end_date)) {
    fields <- c(fields, "condition_end_date")
    values <- c(values, if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_source_value)) {
    fields <- c(fields, "condition_source_value")
    values <- c(values, if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    fields <- c(fields, "condition_source_concept_id")
    values <- c(values, if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(condition_start_datetime)) {
    fields <- c(fields, "condition_start_datetime")
    values <- c(values, if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_datetime)) {
    fields <- c(fields, "condition_end_datetime")
    values <- c(values, if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    fields <- c(fields, "condition_status_source_value")
    values <- c(values, if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    fields <- c(fields, "condition_status_concept_id")
    values <- c(values, if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "condition_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_measurement <- function(measurement_id, visit_occurrence_id, person_id, measurement_type_concept_id, measurement_date, measurement_concept_id, measurement_source_value, measurement_source_concept_id, provider_id, measurement_datetime, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, visit_detail_id, unit_source_value, value_source_value) {
  fields <- c()
  values <- c()
  if (!missing(measurement_id)) {
    fields <- c(fields, "measurement_id")
    values <- c(values, if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    fields <- c(fields, "measurement_type_concept_id")
    values <- c(values, if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    fields <- c(fields, "measurement_date")
    values <- c(values, if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_concept_id)) {
    fields <- c(fields, "measurement_concept_id")
    values <- c(values, if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    fields <- c(fields, "measurement_source_value")
    values <- c(values, if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    fields <- c(fields, "measurement_source_concept_id")
    values <- c(values, if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(measurement_datetime)) {
    fields <- c(fields, "measurement_datetime")
    values <- c(values, if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(operator_concept_id)) {
    fields <- c(fields, "operator_concept_id")
    values <- c(values, if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    fields <- c(fields, "range_low")
    values <- c(values, if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    fields <- c(fields, "range_high")
    values <- c(values, if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    fields <- c(fields, "value_source_value")
    values <- c(values, if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "measurement", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_observation <- function(observation_id, visit_occurrence_id, person_id, observation_type_concept_id, observation_date, observation_concept_id, observation_source_concept_id, observation_source_value, provider_id, observation_datetime, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, visit_detail_id, unit_source_value, qualifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(observation_id)) {
    fields <- c(fields, "observation_id")
    values <- c(values, if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    fields <- c(fields, "observation_type_concept_id")
    values <- c(values, if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    fields <- c(fields, "observation_date")
    values <- c(values, if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_concept_id)) {
    fields <- c(fields, "observation_concept_id")
    values <- c(values, if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    fields <- c(fields, "observation_source_concept_id")
    values <- c(values, if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(observation_source_value)) {
    fields <- c(fields, "observation_source_value")
    values <- c(values, if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(observation_datetime)) {
    fields <- c(fields, "observation_datetime")
    values <- c(values, if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    fields <- c(fields, "qualifier_concept_id")
    values <- c(values, if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "observation", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_procedure_occurrence <- function(procedure_occurrence_id, visit_occurrence_id, person_id, procedure_type_concept_id, procedure_date, procedure_concept_id, procedure_source_concept_id, procedure_source_value, provider_id, procedure_datetime, modifier_concept_id, quantity, visit_detail_id, modifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(procedure_occurrence_id)) {
    fields <- c(fields, "procedure_occurrence_id")
    values <- c(values, if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    fields <- c(fields, "procedure_type_concept_id")
    values <- c(values, if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    fields <- c(fields, "procedure_date")
    values <- c(values, if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_concept_id)) {
    fields <- c(fields, "procedure_concept_id")
    values <- c(values, if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    fields <- c(fields, "procedure_source_concept_id")
    values <- c(values, if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    fields <- c(fields, "procedure_source_value")
    values <- c(values, if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(procedure_datetime)) {
    fields <- c(fields, "procedure_datetime")
    values <- c(values, if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(modifier_concept_id)) {
    fields <- c(fields, "modifier_concept_id")
    values <- c(values, if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(modifier_source_value)) {
    fields <- c(fields, "modifier_source_value")
    values <- c(values, if (is.null(modifier_source_value)) "NULL" else if (is(modifier_source_value, "subQuery")) paste0("(", as.character(modifier_source_value), ")") else paste0("'", as.character(modifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "procedure_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_drug_exposure <- function(drug_exposure_id, visit_occurrence_id, person_id, drug_type_concept_id, drug_exposure_start_date, drug_exposure_end_date, days_supply, drug_concept_id, drug_source_value, sig, provider_id, quantity, dose_unit_source_value, drug_source_concept_id, drug_exposure_end_datetime, verbatim_end_date, stop_reason, refills, drug_exposure_start_datetime, route_concept_id, lot_number, visit_detail_id, route_source_value) {
  fields <- c()
  values <- c()
  if (!missing(drug_exposure_id)) {
    fields <- c(fields, "drug_exposure_id")
    values <- c(values, if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    fields <- c(fields, "drug_type_concept_id")
    values <- c(values, if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    fields <- c(fields, "drug_exposure_start_date")
    values <- c(values, if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    fields <- c(fields, "drug_exposure_end_date")
    values <- c(values, if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(days_supply)) {
    fields <- c(fields, "days_supply")
    values <- c(values, if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_source_value)) {
    fields <- c(fields, "drug_source_value")
    values <- c(values, if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(sig)) {
    fields <- c(fields, "sig")
    values <- c(values, if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    fields <- c(fields, "dose_unit_source_value")
    values <- c(values, if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    fields <- c(fields, "drug_source_concept_id")
    values <- c(values, if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    fields <- c(fields, "drug_exposure_end_datetime")
    values <- c(values, if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    fields <- c(fields, "verbatim_end_date")
    values <- c(values, if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    fields <- c(fields, "refills")
    values <- c(values, if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    fields <- c(fields, "drug_exposure_start_datetime")
    values <- c(values, if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(route_concept_id)) {
    fields <- c(fields, "route_concept_id")
    values <- c(values, if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    fields <- c(fields, "lot_number")
    values <- c(values, if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(route_source_value)) {
    fields <- c(fields, "route_source_value")
    values <- c(values, if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "drug_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_care_site <- function(care_site_id, care_site_source_value, care_site_name, place_of_service_concept_id, location_id, place_of_service_source_value) {
  fields <- c()
  values <- c()
  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    fields <- c(fields, "care_site_source_value")
    values <- c(values, if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(care_site_name)) {
    fields <- c(fields, "care_site_name")
    values <- c(values, if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    fields <- c(fields, "place_of_service_concept_id")
    values <- c(values, if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    fields <- c(fields, "place_of_service_source_value")
    values <- c(values, if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "care_site", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_provider <- function(provider_id, provider_source_value, specialty_concept_id, specialty_source_value, provider_name, npi, dea, care_site_id, year_of_birth, gender_concept_id, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_source_value)) {
    fields <- c(fields, "provider_source_value")
    values <- c(values, if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_concept_id)) {
    fields <- c(fields, "specialty_concept_id")
    values <- c(values, if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(specialty_source_value)) {
    fields <- c(fields, "specialty_source_value")
    values <- c(values, if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(provider_name)) {
    fields <- c(fields, "provider_name")
    values <- c(values, if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    fields <- c(fields, "dea")
    values <- c(values, if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    fields <- c(fields, "specialty_source_concept_id")
    values <- c(values, if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "provider", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, visit_detail_id, device_source_value, device_source__concept_id) {
  fields <- c()
  values <- c()
  if (!missing(device_exposure_id)) {
    fields <- c(fields, "device_exposure_id")
    values <- c(values, if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    fields <- c(fields, "device_concept_id")
    values <- c(values, if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    fields <- c(fields, "device_exposure_start_date")
    values <- c(values, if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    fields <- c(fields, "device_exposure_start_datetime")
    values <- c(values, if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    fields <- c(fields, "device_exposure_end_date")
    values <- c(values, if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    fields <- c(fields, "device_exposure_end_datetime")
    values <- c(values, if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    fields <- c(fields, "device_type_concept_id")
    values <- c(values, if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    fields <- c(fields, "unique_device_id")
    values <- c(values, if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(device_source_value)) {
    fields <- c(fields, "device_source_value")
    values <- c(values, if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    fields <- c(fields, "[device_source_ concept_id]")
    values <- c(values, if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "device_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_concept_id_1)) {
    fields <- c(fields, "domain_concept_id_1")
    values <- c(values, if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    fields <- c(fields, "fact_id_1")
    values <- c(values, if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    fields <- c(fields, "domain_concept_id_2")
    values <- c(values, if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    fields <- c(fields, "fact_id_2")
    values <- c(values, if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "fact_relationship", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_note <- function(note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, visit_occurrence_id, visit_detail_id, note_source_value) {
  fields <- c()
  values <- c()
  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    fields <- c(fields, "note_date")
    values <- c(values, if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    fields <- c(fields, "note_datetime")
    values <- c(values, if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    fields <- c(fields, "note_type_concept_id")
    values <- c(values, if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    fields <- c(fields, "note_class_concept_id")
    values <- c(values, if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    fields <- c(fields, "note_title")
    values <- c(values, if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    fields <- c(fields, "note_text")
    values <- c(values, if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    fields <- c(fields, "encoding_concept_id")
    values <- c(values, if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(note_source_value)) {
    fields <- c(fields, "note_source_value")
    values <- c(values, if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "note", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_note_nlp <- function(note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  fields <- c()
  values <- c()
  if (!missing(note_nlp_id)) {
    fields <- c(fields, "note_nlp_id")
    values <- c(values, if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    fields <- c(fields, "section_concept_id")
    values <- c(values, if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    fields <- c(fields, "snippet")
    values <- c(values, if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    fields <- c(fields, "offset")
    values <- c(values, if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    fields <- c(fields, "lexical_variant")
    values <- c(values, if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    fields <- c(fields, "note_nlp_concept_id")
    values <- c(values, if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    fields <- c(fields, "note_nlp_source_concept_id")
    values <- c(values, if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    fields <- c(fields, "nlp_system")
    values <- c(values, if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    fields <- c(fields, "nlp_date")
    values <- c(values, if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    fields <- c(fields, "nlp_date_time")
    values <- c(values, if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    fields <- c(fields, "term_exists")
    values <- c(values, if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    fields <- c(fields, "term_temporal")
    values <- c(values, if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    fields <- c(fields, "term_modifiers")
    values <- c(values, if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "note_nlp", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  fields <- c()
  values <- c()
  if (!missing(specimen_id)) {
    fields <- c(fields, "specimen_id")
    values <- c(values, if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    fields <- c(fields, "specimen_concept_id")
    values <- c(values, if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    fields <- c(fields, "specimen_type_concept_id")
    values <- c(values, if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    fields <- c(fields, "specimen_date")
    values <- c(values, if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    fields <- c(fields, "specimen_datetime")
    values <- c(values, if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    fields <- c(fields, "anatomic_site_concept_id")
    values <- c(values, if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    fields <- c(fields, "disease_status_concept_id")
    values <- c(values, if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    fields <- c(fields, "specimen_source_id")
    values <- c(values, if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    fields <- c(fields, "specimen_source_value")
    values <- c(values, if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    fields <- c(fields, "anatomic_site_source_value")
    values <- c(values, if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    fields <- c(fields, "disease_status_source_value")
    values <- c(values, if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "specimen", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_visit_detail <- function(visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    fields <- c(fields, "preceding_visit_detail_id")
    values <- c(values, if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    fields <- c(fields, "visit_detail_parent_id")
    values <- c(values, if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "visit_detail", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cohort", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cohort_attribute <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cohort_attribute", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  fields <- c()
  values <- c()
  if (!missing(condition_era_id)) {
    fields <- c(fields, "condition_era_id")
    values <- c(values, if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    fields <- c(fields, "condition_era_start_date")
    values <- c(values, if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    fields <- c(fields, "condition_era_end_date")
    values <- c(values, if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    fields <- c(fields, "condition_occurrence_count")
    values <- c(values, if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "condition_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  fields <- c()
  values <- c()
  if (!missing(dose_era_id)) {
    fields <- c(fields, "dose_era_id")
    values <- c(values, if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    fields <- c(fields, "dose_value")
    values <- c(values, if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    fields <- c(fields, "dose_era_start_date")
    values <- c(values, if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    fields <- c(fields, "dose_era_end_date")
    values <- c(values, if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "dose_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  fields <- c()
  values <- c()
  if (!missing(drug_era_id)) {
    fields <- c(fields, "drug_era_id")
    values <- c(values, if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    fields <- c(fields, "drug_era_start_date")
    values <- c(values, if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    fields <- c(fields, "drug_era_end_date")
    values <- c(values, if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    fields <- c(fields, "drug_exposure_count")
    values <- c(values, if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    fields <- c(fields, "gap_days")
    values <- c(values, if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "drug_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_concept_id, payer_source_value, payer_source_concept_id, plan_concept_id, plan_source_value, plan_source_concept_id, sponsor_concept_id, sponsor_source_value, sponsor_source_concept_id, family_source_value, stop_reason_concept_id, stop_reason_source_value, stop_reason_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    fields <- c(fields, "payer_plan_period_start_date")
    values <- c(values, if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    fields <- c(fields, "payer_plan_period_end_date")
    values <- c(values, if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_concept_id)) {
    fields <- c(fields, "payer_concept_id")
    values <- c(values, if (is.null(payer_concept_id)) "NULL" else if (is(payer_concept_id, "subQuery")) paste0("(", as.character(payer_concept_id), ")") else paste0("'", as.character(payer_concept_id), "'"))
  }

  if (!missing(payer_source_value)) {
    fields <- c(fields, "payer_source_value")
    values <- c(values, if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(payer_source_concept_id)) {
    fields <- c(fields, "payer_source_concept_id")
    values <- c(values, if (is.null(payer_source_concept_id)) "NULL" else if (is(payer_source_concept_id, "subQuery")) paste0("(", as.character(payer_source_concept_id), ")") else paste0("'", as.character(payer_source_concept_id), "'"))
  }

  if (!missing(plan_concept_id)) {
    fields <- c(fields, "plan_concept_id")
    values <- c(values, if (is.null(plan_concept_id)) "NULL" else if (is(plan_concept_id, "subQuery")) paste0("(", as.character(plan_concept_id), ")") else paste0("'", as.character(plan_concept_id), "'"))
  }

  if (!missing(plan_source_value)) {
    fields <- c(fields, "plan_source_value")
    values <- c(values, if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(plan_source_concept_id)) {
    fields <- c(fields, "plan_source_concept_id")
    values <- c(values, if (is.null(plan_source_concept_id)) "NULL" else if (is(plan_source_concept_id, "subQuery")) paste0("(", as.character(plan_source_concept_id), ")") else paste0("'", as.character(plan_source_concept_id), "'"))
  }

  if (!missing(sponsor_concept_id)) {
    fields <- c(fields, "sponsor_concept_id")
    values <- c(values, if (is.null(sponsor_concept_id)) "NULL" else if (is(sponsor_concept_id, "subQuery")) paste0("(", as.character(sponsor_concept_id), ")") else paste0("'", as.character(sponsor_concept_id), "'"))
  }

  if (!missing(sponsor_source_value)) {
    fields <- c(fields, "sponsor_source_value")
    values <- c(values, if (is.null(sponsor_source_value)) "NULL" else if (is(sponsor_source_value, "subQuery")) paste0("(", as.character(sponsor_source_value), ")") else paste0("'", as.character(sponsor_source_value), "'"))
  }

  if (!missing(sponsor_source_concept_id)) {
    fields <- c(fields, "sponsor_source_concept_id")
    values <- c(values, if (is.null(sponsor_source_concept_id)) "NULL" else if (is(sponsor_source_concept_id, "subQuery")) paste0("(", as.character(sponsor_source_concept_id), ")") else paste0("'", as.character(sponsor_source_concept_id), "'"))
  }

  if (!missing(family_source_value)) {
    fields <- c(fields, "family_source_value")
    values <- c(values, if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  if (!missing(stop_reason_concept_id)) {
    fields <- c(fields, "stop_reason_concept_id")
    values <- c(values, if (is.null(stop_reason_concept_id)) "NULL" else if (is(stop_reason_concept_id, "subQuery")) paste0("(", as.character(stop_reason_concept_id), ")") else paste0("'", as.character(stop_reason_concept_id), "'"))
  }

  if (!missing(stop_reason_source_value)) {
    fields <- c(fields, "stop_reason_source_value")
    values <- c(values, if (is.null(stop_reason_source_value)) "NULL" else if (is(stop_reason_source_value, "subQuery")) paste0("(", as.character(stop_reason_source_value), ")") else paste0("'", as.character(stop_reason_source_value), "'"))
  }

  if (!missing(stop_reason_source_concept_id)) {
    fields <- c(fields, "stop_reason_source_concept_id")
    values <- c(values, if (is.null(stop_reason_source_concept_id)) "NULL" else if (is(stop_reason_source_concept_id, "subQuery")) paste0("(", as.character(stop_reason_source_concept_id), ")") else paste0("'", as.character(stop_reason_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "payer_plan_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  fields <- c()
  values <- c()
  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    fields <- c(fields, "address_1")
    values <- c(values, if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    fields <- c(fields, "address_2")
    values <- c(values, if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    fields <- c(fields, "city")
    values <- c(values, if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    fields <- c(fields, "state")
    values <- c(values, if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    fields <- c(fields, "zip")
    values <- c(values, if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    fields <- c(fields, "county")
    values <- c(values, if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    fields <- c(fields, "location_source_value")
    values <- c(values, if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "location", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  fields <- c()
  values <- c()
  if (!missing(cdm_source_name)) {
    fields <- c(fields, "cdm_source_name")
    values <- c(values, if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    fields <- c(fields, "cdm_source_abbreviation")
    values <- c(values, if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    fields <- c(fields, "cdm_holder")
    values <- c(values, if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    fields <- c(fields, "source_description")
    values <- c(values, if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    fields <- c(fields, "source_documentation_reference")
    values <- c(values, if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    fields <- c(fields, "[cdm_etl _reference]")
    values <- c(values, if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    fields <- c(fields, "source_release_date")
    values <- c(values, if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    fields <- c(fields, "cdm_release_date")
    values <- c(values, if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    fields <- c(fields, "cdm_version")
    values <- c(values, if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cdm_source", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_metadata <- function(metadata_concept_id, metadata_type_concept_id, name, value_as_string, value_as_concept_id, metadata_date, metadata_datetime) {
  fields <- c()
  values <- c()
  if (!missing(metadata_concept_id)) {
    fields <- c(fields, "metadata_concept_id")
    values <- c(values, if (is.null(metadata_concept_id)) "NULL" else if (is(metadata_concept_id, "subQuery")) paste0("(", as.character(metadata_concept_id), ")") else paste0("'", as.character(metadata_concept_id), "'"))
  }

  if (!missing(metadata_type_concept_id)) {
    fields <- c(fields, "metadata_type_concept_id")
    values <- c(values, if (is.null(metadata_type_concept_id)) "NULL" else if (is(metadata_type_concept_id, "subQuery")) paste0("(", as.character(metadata_type_concept_id), ")") else paste0("'", as.character(metadata_type_concept_id), "'"))
  }

  if (!missing(name)) {
    fields <- c(fields, "name")
    values <- c(values, if (is.null(name)) "NULL" else if (is(name, "subQuery")) paste0("(", as.character(name), ")") else paste0("'", as.character(name), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(metadata_date)) {
    fields <- c(fields, "[metadata date]")
    values <- c(values, if (is.null(metadata_date)) "NULL" else if (is(metadata_date, "subQuery")) paste0("(", as.character(metadata_date), ")") else paste0("'", as.character(metadata_date), "'"))
  }

  if (!missing(metadata_datetime)) {
    fields <- c(fields, "metadata_datetime")
    values <- c(values, if (is.null(metadata_datetime)) "NULL" else if (is(metadata_datetime, "subQuery")) paste0("(", as.character(metadata_datetime), ")") else paste0("'", as.character(metadata_datetime), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "metadata", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  fields <- c()
  values <- c()
  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    fields <- c(fields, "attribute_name")
    values <- c(values, if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    fields <- c(fields, "attribute_description")
    values <- c(values, if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    fields <- c(fields, "attribute_type_concept_id")
    values <- c(values, if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    fields <- c(fields, "attribute_syntax")
    values <- c(values, if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "attribute_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    fields <- c(fields, "cohort_definition_name")
    values <- c(values, if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    fields <- c(fields, "cohort_definition_description")
    values <- c(values, if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    fields <- c(fields, "definition_type_concept_id")
    values <- c(values, if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    fields <- c(fields, "cohort_definition_syntax")
    values <- c(values, if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    fields <- c(fields, "subject_concept_id")
    values <- c(values, if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    fields <- c(fields, "cohort_instantiation_date")
    values <- c(values, if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cohort_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_concept <- function(concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(concept_id)) {
    fields <- c(fields, "concept_id")
    values <- c(values, if (is.null(concept_id)) "NULL" else if (is(concept_id, "subQuery")) paste0("(", as.character(concept_id), ")") else paste0("'", as.character(concept_id), "'"))
  }

  if (!missing(concept_name)) {
    fields <- c(fields, "concept_name")
    values <- c(values, if (is.null(concept_name)) "NULL" else if (is(concept_name, "subQuery")) paste0("(", as.character(concept_name), ")") else paste0("'", as.character(concept_name), "'"))
  }

  if (!missing(domain_id)) {
    fields <- c(fields, "domain_id")
    values <- c(values, if (is.null(domain_id)) "NULL" else if (is(domain_id, "subQuery")) paste0("(", as.character(domain_id), ")") else paste0("'", as.character(domain_id), "'"))
  }

  if (!missing(vocabulary_id)) {
    fields <- c(fields, "vocabulary_id")
    values <- c(values, if (is.null(vocabulary_id)) "NULL" else if (is(vocabulary_id, "subQuery")) paste0("(", as.character(vocabulary_id), ")") else paste0("'", as.character(vocabulary_id), "'"))
  }

  if (!missing(concept_class_id)) {
    fields <- c(fields, "concept_class_id")
    values <- c(values, if (is.null(concept_class_id)) "NULL" else if (is(concept_class_id, "subQuery")) paste0("(", as.character(concept_class_id), ")") else paste0("'", as.character(concept_class_id), "'"))
  }

  if (!missing(standard_concept)) {
    fields <- c(fields, "standard_concept")
    values <- c(values, if (is.null(standard_concept)) "NULL" else if (is(standard_concept, "subQuery")) paste0("(", as.character(standard_concept), ")") else paste0("'", as.character(standard_concept), "'"))
  }

  if (!missing(concept_code)) {
    fields <- c(fields, "concept_code")
    values <- c(values, if (is.null(concept_code)) "NULL" else if (is(concept_code, "subQuery")) paste0("(", as.character(concept_code), ")") else paste0("'", as.character(concept_code), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "concept", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_concept_ancestor <- function(ancestor_concept_id, descendant_concept_id, min_levels_of_separation, max_levels_of_separation) {
  fields <- c()
  values <- c()
  if (!missing(ancestor_concept_id)) {
    fields <- c(fields, "ancestor_concept_id")
    values <- c(values, if (is.null(ancestor_concept_id)) "NULL" else if (is(ancestor_concept_id, "subQuery")) paste0("(", as.character(ancestor_concept_id), ")") else paste0("'", as.character(ancestor_concept_id), "'"))
  }

  if (!missing(descendant_concept_id)) {
    fields <- c(fields, "descendant_concept_id")
    values <- c(values, if (is.null(descendant_concept_id)) "NULL" else if (is(descendant_concept_id, "subQuery")) paste0("(", as.character(descendant_concept_id), ")") else paste0("'", as.character(descendant_concept_id), "'"))
  }

  if (!missing(min_levels_of_separation)) {
    fields <- c(fields, "min_levels_of_separation")
    values <- c(values, if (is.null(min_levels_of_separation)) "NULL" else if (is(min_levels_of_separation, "subQuery")) paste0("(", as.character(min_levels_of_separation), ")") else paste0("'", as.character(min_levels_of_separation), "'"))
  }

  if (!missing(max_levels_of_separation)) {
    fields <- c(fields, "max_levels_of_separation")
    values <- c(values, if (is.null(max_levels_of_separation)) "NULL" else if (is(max_levels_of_separation, "subQuery")) paste0("(", as.character(max_levels_of_separation), ")") else paste0("'", as.character(max_levels_of_separation), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "concept_ancestor", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_concept_class <- function(concept_class_id, concept_class_name, concept_class_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(concept_class_id)) {
    fields <- c(fields, "concept_class_id")
    values <- c(values, if (is.null(concept_class_id)) "NULL" else if (is(concept_class_id, "subQuery")) paste0("(", as.character(concept_class_id), ")") else paste0("'", as.character(concept_class_id), "'"))
  }

  if (!missing(concept_class_name)) {
    fields <- c(fields, "concept_class_name")
    values <- c(values, if (is.null(concept_class_name)) "NULL" else if (is(concept_class_name, "subQuery")) paste0("(", as.character(concept_class_name), ")") else paste0("'", as.character(concept_class_name), "'"))
  }

  if (!missing(concept_class_concept_id)) {
    fields <- c(fields, "concept_class_concept_id")
    values <- c(values, if (is.null(concept_class_concept_id)) "NULL" else if (is(concept_class_concept_id, "subQuery")) paste0("(", as.character(concept_class_concept_id), ")") else paste0("'", as.character(concept_class_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "concept_class", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_concept_relationship <- function(concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(concept_id_1)) {
    fields <- c(fields, "concept_id_1")
    values <- c(values, if (is.null(concept_id_1)) "NULL" else if (is(concept_id_1, "subQuery")) paste0("(", as.character(concept_id_1), ")") else paste0("'", as.character(concept_id_1), "'"))
  }

  if (!missing(concept_id_2)) {
    fields <- c(fields, "concept_id_2")
    values <- c(values, if (is.null(concept_id_2)) "NULL" else if (is(concept_id_2, "subQuery")) paste0("(", as.character(concept_id_2), ")") else paste0("'", as.character(concept_id_2), "'"))
  }

  if (!missing(relationship_id)) {
    fields <- c(fields, "relationship_id")
    values <- c(values, if (is.null(relationship_id)) "NULL" else if (is(relationship_id, "subQuery")) paste0("(", as.character(relationship_id), ")") else paste0("'", as.character(relationship_id), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "concept_relationship", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_concept_synonym <- function(concept_id, concept_synonym_name, language_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(concept_id)) {
    fields <- c(fields, "concept_id")
    values <- c(values, if (is.null(concept_id)) "NULL" else if (is(concept_id, "subQuery")) paste0("(", as.character(concept_id), ")") else paste0("'", as.character(concept_id), "'"))
  }

  if (!missing(concept_synonym_name)) {
    fields <- c(fields, "concept_synonym_name")
    values <- c(values, if (is.null(concept_synonym_name)) "NULL" else if (is(concept_synonym_name, "subQuery")) paste0("(", as.character(concept_synonym_name), ")") else paste0("'", as.character(concept_synonym_name), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "concept_synonym", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_domain <- function(domain_id, domain_name, domain_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_id)) {
    fields <- c(fields, "domain_id")
    values <- c(values, if (is.null(domain_id)) "NULL" else if (is(domain_id, "subQuery")) paste0("(", as.character(domain_id), ")") else paste0("'", as.character(domain_id), "'"))
  }

  if (!missing(domain_name)) {
    fields <- c(fields, "domain_name")
    values <- c(values, if (is.null(domain_name)) "NULL" else if (is(domain_name, "subQuery")) paste0("(", as.character(domain_name), ")") else paste0("'", as.character(domain_name), "'"))
  }

  if (!missing(domain_concept_id)) {
    fields <- c(fields, "domain_concept_id")
    values <- c(values, if (is.null(domain_concept_id)) "NULL" else if (is(domain_concept_id, "subQuery")) paste0("(", as.character(domain_concept_id), ")") else paste0("'", as.character(domain_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "domain", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_drug_strength <- function(drug_concept_id, ingredient_concept_id, amount_value, amount_unit_concept_id, numerator_value, numerator_unit_concept_id, denominator_value, denominator_unit_concept_id, box_size, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(ingredient_concept_id)) {
    fields <- c(fields, "ingredient_concept_id")
    values <- c(values, if (is.null(ingredient_concept_id)) "NULL" else if (is(ingredient_concept_id, "subQuery")) paste0("(", as.character(ingredient_concept_id), ")") else paste0("'", as.character(ingredient_concept_id), "'"))
  }

  if (!missing(amount_value)) {
    fields <- c(fields, "amount_value")
    values <- c(values, if (is.null(amount_value)) "NULL" else if (is(amount_value, "subQuery")) paste0("(", as.character(amount_value), ")") else paste0("'", as.character(amount_value), "'"))
  }

  if (!missing(amount_unit_concept_id)) {
    fields <- c(fields, "amount_unit_concept_id")
    values <- c(values, if (is.null(amount_unit_concept_id)) "NULL" else if (is(amount_unit_concept_id, "subQuery")) paste0("(", as.character(amount_unit_concept_id), ")") else paste0("'", as.character(amount_unit_concept_id), "'"))
  }

  if (!missing(numerator_value)) {
    fields <- c(fields, "numerator_value")
    values <- c(values, if (is.null(numerator_value)) "NULL" else if (is(numerator_value, "subQuery")) paste0("(", as.character(numerator_value), ")") else paste0("'", as.character(numerator_value), "'"))
  }

  if (!missing(numerator_unit_concept_id)) {
    fields <- c(fields, "numerator_unit_concept_id")
    values <- c(values, if (is.null(numerator_unit_concept_id)) "NULL" else if (is(numerator_unit_concept_id, "subQuery")) paste0("(", as.character(numerator_unit_concept_id), ")") else paste0("'", as.character(numerator_unit_concept_id), "'"))
  }

  if (!missing(denominator_value)) {
    fields <- c(fields, "denominator_value")
    values <- c(values, if (is.null(denominator_value)) "NULL" else if (is(denominator_value, "subQuery")) paste0("(", as.character(denominator_value), ")") else paste0("'", as.character(denominator_value), "'"))
  }

  if (!missing(denominator_unit_concept_id)) {
    fields <- c(fields, "denominator_unit_concept_id")
    values <- c(values, if (is.null(denominator_unit_concept_id)) "NULL" else if (is(denominator_unit_concept_id, "subQuery")) paste0("(", as.character(denominator_unit_concept_id), ")") else paste0("'", as.character(denominator_unit_concept_id), "'"))
  }

  if (!missing(box_size)) {
    fields <- c(fields, "box_size")
    values <- c(values, if (is.null(box_size)) "NULL" else if (is(box_size, "subQuery")) paste0("(", as.character(box_size), ")") else paste0("'", as.character(box_size), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "drug_strength", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_relationship <- function(relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(relationship_id)) {
    fields <- c(fields, "relationship_id")
    values <- c(values, if (is.null(relationship_id)) "NULL" else if (is(relationship_id, "subQuery")) paste0("(", as.character(relationship_id), ")") else paste0("'", as.character(relationship_id), "'"))
  }

  if (!missing(relationship_name)) {
    fields <- c(fields, "relationship_name")
    values <- c(values, if (is.null(relationship_name)) "NULL" else if (is(relationship_name, "subQuery")) paste0("(", as.character(relationship_name), ")") else paste0("'", as.character(relationship_name), "'"))
  }

  if (!missing(is_hierarchical)) {
    fields <- c(fields, "is_hierarchical")
    values <- c(values, if (is.null(is_hierarchical)) "NULL" else if (is(is_hierarchical, "subQuery")) paste0("(", as.character(is_hierarchical), ")") else paste0("'", as.character(is_hierarchical), "'"))
  }

  if (!missing(defines_ancestry)) {
    fields <- c(fields, "defines_ancestry")
    values <- c(values, if (is.null(defines_ancestry)) "NULL" else if (is(defines_ancestry, "subQuery")) paste0("(", as.character(defines_ancestry), ")") else paste0("'", as.character(defines_ancestry), "'"))
  }

  if (!missing(reverse_relationship_id)) {
    fields <- c(fields, "reverse_relationship_id")
    values <- c(values, if (is.null(reverse_relationship_id)) "NULL" else if (is(reverse_relationship_id, "subQuery")) paste0("(", as.character(reverse_relationship_id), ")") else paste0("'", as.character(reverse_relationship_id), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "relationship", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_source_to_concept_map <- function(source_code, source_concept_id, source_vocabulary_id, source_code_description, target_concept_id, target_vocabulary_id, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(source_code)) {
    fields <- c(fields, "source_code")
    values <- c(values, if (is.null(source_code)) "NULL" else if (is(source_code, "subQuery")) paste0("(", as.character(source_code), ")") else paste0("'", as.character(source_code), "'"))
  }

  if (!missing(source_concept_id)) {
    fields <- c(fields, "source_concept_id")
    values <- c(values, if (is.null(source_concept_id)) "NULL" else if (is(source_concept_id, "subQuery")) paste0("(", as.character(source_concept_id), ")") else paste0("'", as.character(source_concept_id), "'"))
  }

  if (!missing(source_vocabulary_id)) {
    fields <- c(fields, "source_vocabulary_id")
    values <- c(values, if (is.null(source_vocabulary_id)) "NULL" else if (is(source_vocabulary_id, "subQuery")) paste0("(", as.character(source_vocabulary_id), ")") else paste0("'", as.character(source_vocabulary_id), "'"))
  }

  if (!missing(source_code_description)) {
    fields <- c(fields, "source_code_description")
    values <- c(values, if (is.null(source_code_description)) "NULL" else if (is(source_code_description, "subQuery")) paste0("(", as.character(source_code_description), ")") else paste0("'", as.character(source_code_description), "'"))
  }

  if (!missing(target_concept_id)) {
    fields <- c(fields, "target_concept_id")
    values <- c(values, if (is.null(target_concept_id)) "NULL" else if (is(target_concept_id, "subQuery")) paste0("(", as.character(target_concept_id), ")") else paste0("'", as.character(target_concept_id), "'"))
  }

  if (!missing(target_vocabulary_id)) {
    fields <- c(fields, "target_vocabulary_id")
    values <- c(values, if (is.null(target_vocabulary_id)) "NULL" else if (is(target_vocabulary_id, "subQuery")) paste0("(", as.character(target_vocabulary_id), ")") else paste0("'", as.character(target_vocabulary_id), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "source_to_concept_map", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_vocabulary <- function(vocabulary_id, vocabulary_name, vocabulary_reference, vocabulary_version, vocabulary_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(vocabulary_id)) {
    fields <- c(fields, "vocabulary_id")
    values <- c(values, if (is.null(vocabulary_id)) "NULL" else if (is(vocabulary_id, "subQuery")) paste0("(", as.character(vocabulary_id), ")") else paste0("'", as.character(vocabulary_id), "'"))
  }

  if (!missing(vocabulary_name)) {
    fields <- c(fields, "vocabulary_name")
    values <- c(values, if (is.null(vocabulary_name)) "NULL" else if (is(vocabulary_name, "subQuery")) paste0("(", as.character(vocabulary_name), ")") else paste0("'", as.character(vocabulary_name), "'"))
  }

  if (!missing(vocabulary_reference)) {
    fields <- c(fields, "vocabulary_reference")
    values <- c(values, if (is.null(vocabulary_reference)) "NULL" else if (is(vocabulary_reference, "subQuery")) paste0("(", as.character(vocabulary_reference), ")") else paste0("'", as.character(vocabulary_reference), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  if (!missing(vocabulary_concept_id)) {
    fields <- c(fields, "vocabulary_concept_id")
    values <- c(values, if (is.null(vocabulary_concept_id)) "NULL" else if (is(vocabulary_concept_id, "subQuery")) paste0("(", as.character(vocabulary_concept_id), ")") else paste0("'", as.character(vocabulary_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "vocabulary", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cost <- function(cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  fields <- c()
  values <- c()
  if (!missing(cost_id)) {
    fields <- c(fields, "cost_id")
    values <- c(values, if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    fields <- c(fields, "cost_event_id")
    values <- c(values, if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    fields <- c(fields, "cost_domain_id")
    values <- c(values, if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    fields <- c(fields, "cost_type_concept_id")
    values <- c(values, if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    fields <- c(fields, "currency_concept_id")
    values <- c(values, if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    fields <- c(fields, "total_charge")
    values <- c(values, if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    fields <- c(fields, "total_cost")
    values <- c(values, if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    fields <- c(fields, "total_paid")
    values <- c(values, if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    fields <- c(fields, "paid_by_payer")
    values <- c(values, if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    fields <- c(fields, "paid_by_patient")
    values <- c(values, if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    fields <- c(fields, "paid_patient_copay")
    values <- c(values, if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    fields <- c(fields, "paid_patient_coinsurance")
    values <- c(values, if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    fields <- c(fields, "paid_patient_deductible")
    values <- c(values, if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    fields <- c(fields, "paid_by_primary")
    values <- c(values, if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    fields <- c(fields, "paid_ingredient_cost")
    values <- c(values, if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    fields <- c(fields, "paid_dispensing_fee")
    values <- c(values, if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    fields <- c(fields, "amount_allowed")
    values <- c(values, if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    fields <- c(fields, "revenue_code_concept_id")
    values <- c(values, if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    fields <- c(fields, "revenue_code_source_value")
    values <- c(values, if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    fields <- c(fields, "drg_concept_id")
    values <- c(values, if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    fields <- c(fields, "drg_source_value")
    values <- c(values, if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cost", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_source_value, visit_start_date, visit_end_date, care_site_id, visit_start_datetime, visit_end_datetime, visit_type_concept_id, provider_id, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    fields <- c(fields, "preceding_visit_occurrence_id")
    values <- c(values, if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "visit_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_person <- function(person_id, person_source_value, year_of_birth, month_of_birth, gender_concept_id, gender_source_value, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(person_source_value)) {
    fields <- c(fields, "person_source_value")
    values <- c(values, if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    fields <- c(fields, "month_of_birth")
    values <- c(values, if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(day_of_birth)) {
    fields <- c(fields, "day_of_birth")
    values <- c(values, if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    fields <- c(fields, "birth_datetime")
    values <- c(values, if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    fields <- c(fields, "race_concept_id")
    values <- c(values, if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    fields <- c(fields, "ethnicity_concept_id")
    values <- c(values, if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    fields <- c(fields, "race_source_value")
    values <- c(values, if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    fields <- c(fields, "race_source_concept_id")
    values <- c(values, if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    fields <- c(fields, "ethnicity_source_value")
    values <- c(values, if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    fields <- c(fields, "ethnicity_source_concept_id")
    values <- c(values, if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "person", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(observation_period_id)) {
    fields <- c(fields, "observation_period_id")
    values <- c(values, if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    fields <- c(fields, "observation_period_start_date")
    values <- c(values, if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    fields <- c(fields, "observation_period_end_date")
    values <- c(values, if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    fields <- c(fields, "period_type_concept_id")
    values <- c(values, if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "observation_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_death <- function(person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    fields <- c(fields, "death_date")
    values <- c(values, if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    fields <- c(fields, "death_datetime")
    values <- c(values, if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    fields <- c(fields, "death_type_concept_id")
    values <- c(values, if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    fields <- c(fields, "cause_concept_id")
    values <- c(values, if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    fields <- c(fields, "cause_source_value")
    values <- c(values, if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    fields <- c(fields, "cause_source_concept_id")
    values <- c(values, if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "death", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_condition_occurrence <- function(condition_occurrence_id, person_id, visit_occurrence_id, condition_type_concept_id, condition_start_date, condition_end_date, condition_concept_id, condition_source_value, condition_source_concept_id, provider_id, condition_start_datetime, condition_end_datetime, stop_reason, visit_detail_id, condition_status_source_value, condition_status_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(condition_occurrence_id)) {
    fields <- c(fields, "condition_occurrence_id")
    values <- c(values, if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    fields <- c(fields, "condition_type_concept_id")
    values <- c(values, if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    fields <- c(fields, "condition_start_date")
    values <- c(values, if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_end_date)) {
    fields <- c(fields, "condition_end_date")
    values <- c(values, if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_source_value)) {
    fields <- c(fields, "condition_source_value")
    values <- c(values, if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    fields <- c(fields, "condition_source_concept_id")
    values <- c(values, if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(condition_start_datetime)) {
    fields <- c(fields, "condition_start_datetime")
    values <- c(values, if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_datetime)) {
    fields <- c(fields, "condition_end_datetime")
    values <- c(values, if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    fields <- c(fields, "condition_status_source_value")
    values <- c(values, if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    fields <- c(fields, "condition_status_concept_id")
    values <- c(values, if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "condition_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_measurement <- function(measurement_id, visit_occurrence_id, person_id, measurement_type_concept_id, measurement_date, measurement_concept_id, measurement_source_value, measurement_source_concept_id, provider_id, measurement_datetime, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, visit_detail_id, unit_source_value, value_source_value) {
  fields <- c()
  values <- c()
  if (!missing(measurement_id)) {
    fields <- c(fields, "measurement_id")
    values <- c(values, if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    fields <- c(fields, "measurement_type_concept_id")
    values <- c(values, if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    fields <- c(fields, "measurement_date")
    values <- c(values, if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_concept_id)) {
    fields <- c(fields, "measurement_concept_id")
    values <- c(values, if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    fields <- c(fields, "measurement_source_value")
    values <- c(values, if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    fields <- c(fields, "measurement_source_concept_id")
    values <- c(values, if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(measurement_datetime)) {
    fields <- c(fields, "measurement_datetime")
    values <- c(values, if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(operator_concept_id)) {
    fields <- c(fields, "operator_concept_id")
    values <- c(values, if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    fields <- c(fields, "range_low")
    values <- c(values, if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    fields <- c(fields, "range_high")
    values <- c(values, if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    fields <- c(fields, "value_source_value")
    values <- c(values, if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "measurement", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_observation <- function(observation_id, visit_occurrence_id, person_id, observation_type_concept_id, observation_date, observation_concept_id, observation_source_concept_id, observation_source_value, provider_id, observation_datetime, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, visit_detail_id, unit_source_value, qualifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(observation_id)) {
    fields <- c(fields, "observation_id")
    values <- c(values, if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    fields <- c(fields, "observation_type_concept_id")
    values <- c(values, if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    fields <- c(fields, "observation_date")
    values <- c(values, if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_concept_id)) {
    fields <- c(fields, "observation_concept_id")
    values <- c(values, if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    fields <- c(fields, "observation_source_concept_id")
    values <- c(values, if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(observation_source_value)) {
    fields <- c(fields, "observation_source_value")
    values <- c(values, if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(observation_datetime)) {
    fields <- c(fields, "observation_datetime")
    values <- c(values, if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    fields <- c(fields, "qualifier_concept_id")
    values <- c(values, if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "observation", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_procedure_occurrence <- function(procedure_occurrence_id, visit_occurrence_id, person_id, procedure_type_concept_id, procedure_date, procedure_concept_id, procedure_source_concept_id, procedure_source_value, provider_id, procedure_datetime, modifier_concept_id, quantity, visit_detail_id, modifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(procedure_occurrence_id)) {
    fields <- c(fields, "procedure_occurrence_id")
    values <- c(values, if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    fields <- c(fields, "procedure_type_concept_id")
    values <- c(values, if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    fields <- c(fields, "procedure_date")
    values <- c(values, if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_concept_id)) {
    fields <- c(fields, "procedure_concept_id")
    values <- c(values, if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    fields <- c(fields, "procedure_source_concept_id")
    values <- c(values, if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    fields <- c(fields, "procedure_source_value")
    values <- c(values, if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(procedure_datetime)) {
    fields <- c(fields, "procedure_datetime")
    values <- c(values, if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(modifier_concept_id)) {
    fields <- c(fields, "modifier_concept_id")
    values <- c(values, if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(modifier_source_value)) {
    fields <- c(fields, "modifier_source_value")
    values <- c(values, if (is.null(modifier_source_value)) "NULL" else if (is(modifier_source_value, "subQuery")) paste0("(", as.character(modifier_source_value), ")") else paste0("'", as.character(modifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "procedure_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_drug_exposure <- function(drug_exposure_id, visit_occurrence_id, person_id, drug_type_concept_id, drug_exposure_start_date, drug_exposure_end_date, days_supply, drug_concept_id, drug_source_value, sig, provider_id, quantity, dose_unit_source_value, drug_source_concept_id, drug_exposure_end_datetime, verbatim_end_date, stop_reason, refills, drug_exposure_start_datetime, route_concept_id, lot_number, visit_detail_id, route_source_value) {
  fields <- c()
  values <- c()
  if (!missing(drug_exposure_id)) {
    fields <- c(fields, "drug_exposure_id")
    values <- c(values, if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    fields <- c(fields, "drug_type_concept_id")
    values <- c(values, if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    fields <- c(fields, "drug_exposure_start_date")
    values <- c(values, if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    fields <- c(fields, "drug_exposure_end_date")
    values <- c(values, if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(days_supply)) {
    fields <- c(fields, "days_supply")
    values <- c(values, if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_source_value)) {
    fields <- c(fields, "drug_source_value")
    values <- c(values, if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(sig)) {
    fields <- c(fields, "sig")
    values <- c(values, if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    fields <- c(fields, "dose_unit_source_value")
    values <- c(values, if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    fields <- c(fields, "drug_source_concept_id")
    values <- c(values, if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    fields <- c(fields, "drug_exposure_end_datetime")
    values <- c(values, if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    fields <- c(fields, "verbatim_end_date")
    values <- c(values, if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    fields <- c(fields, "refills")
    values <- c(values, if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    fields <- c(fields, "drug_exposure_start_datetime")
    values <- c(values, if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(route_concept_id)) {
    fields <- c(fields, "route_concept_id")
    values <- c(values, if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    fields <- c(fields, "lot_number")
    values <- c(values, if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(route_source_value)) {
    fields <- c(fields, "route_source_value")
    values <- c(values, if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "drug_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_care_site <- function(care_site_id, care_site_source_value, care_site_name, place_of_service_concept_id, location_id, place_of_service_source_value) {
  fields <- c()
  values <- c()
  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    fields <- c(fields, "care_site_source_value")
    values <- c(values, if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(care_site_name)) {
    fields <- c(fields, "care_site_name")
    values <- c(values, if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    fields <- c(fields, "place_of_service_concept_id")
    values <- c(values, if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    fields <- c(fields, "place_of_service_source_value")
    values <- c(values, if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "care_site", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_provider <- function(provider_id, provider_source_value, specialty_concept_id, specialty_source_value, provider_name, npi, dea, care_site_id, year_of_birth, gender_concept_id, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_source_value)) {
    fields <- c(fields, "provider_source_value")
    values <- c(values, if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_concept_id)) {
    fields <- c(fields, "specialty_concept_id")
    values <- c(values, if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(specialty_source_value)) {
    fields <- c(fields, "specialty_source_value")
    values <- c(values, if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(provider_name)) {
    fields <- c(fields, "provider_name")
    values <- c(values, if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    fields <- c(fields, "dea")
    values <- c(values, if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    fields <- c(fields, "specialty_source_concept_id")
    values <- c(values, if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "provider", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, visit_detail_id, device_source_value, device_source__concept_id) {
  fields <- c()
  values <- c()
  if (!missing(device_exposure_id)) {
    fields <- c(fields, "device_exposure_id")
    values <- c(values, if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    fields <- c(fields, "device_concept_id")
    values <- c(values, if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    fields <- c(fields, "device_exposure_start_date")
    values <- c(values, if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    fields <- c(fields, "device_exposure_start_datetime")
    values <- c(values, if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    fields <- c(fields, "device_exposure_end_date")
    values <- c(values, if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    fields <- c(fields, "device_exposure_end_datetime")
    values <- c(values, if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    fields <- c(fields, "device_type_concept_id")
    values <- c(values, if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    fields <- c(fields, "unique_device_id")
    values <- c(values, if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(device_source_value)) {
    fields <- c(fields, "device_source_value")
    values <- c(values, if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    fields <- c(fields, "[device_source_ concept_id]")
    values <- c(values, if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "device_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_concept_id_1)) {
    fields <- c(fields, "domain_concept_id_1")
    values <- c(values, if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    fields <- c(fields, "fact_id_1")
    values <- c(values, if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    fields <- c(fields, "domain_concept_id_2")
    values <- c(values, if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    fields <- c(fields, "fact_id_2")
    values <- c(values, if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "fact_relationship", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_note <- function(note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, visit_occurrence_id, visit_detail_id, note_source_value) {
  fields <- c()
  values <- c()
  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    fields <- c(fields, "note_date")
    values <- c(values, if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    fields <- c(fields, "note_datetime")
    values <- c(values, if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    fields <- c(fields, "note_type_concept_id")
    values <- c(values, if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    fields <- c(fields, "note_class_concept_id")
    values <- c(values, if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    fields <- c(fields, "note_title")
    values <- c(values, if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    fields <- c(fields, "note_text")
    values <- c(values, if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    fields <- c(fields, "encoding_concept_id")
    values <- c(values, if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(note_source_value)) {
    fields <- c(fields, "note_source_value")
    values <- c(values, if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "note", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_note_nlp <- function(note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  fields <- c()
  values <- c()
  if (!missing(note_nlp_id)) {
    fields <- c(fields, "note_nlp_id")
    values <- c(values, if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    fields <- c(fields, "section_concept_id")
    values <- c(values, if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    fields <- c(fields, "snippet")
    values <- c(values, if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    fields <- c(fields, "offset")
    values <- c(values, if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    fields <- c(fields, "lexical_variant")
    values <- c(values, if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    fields <- c(fields, "note_nlp_concept_id")
    values <- c(values, if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    fields <- c(fields, "note_nlp_source_concept_id")
    values <- c(values, if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    fields <- c(fields, "nlp_system")
    values <- c(values, if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    fields <- c(fields, "nlp_date")
    values <- c(values, if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    fields <- c(fields, "nlp_date_time")
    values <- c(values, if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    fields <- c(fields, "term_exists")
    values <- c(values, if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    fields <- c(fields, "term_temporal")
    values <- c(values, if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    fields <- c(fields, "term_modifiers")
    values <- c(values, if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "note_nlp", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  fields <- c()
  values <- c()
  if (!missing(specimen_id)) {
    fields <- c(fields, "specimen_id")
    values <- c(values, if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    fields <- c(fields, "specimen_concept_id")
    values <- c(values, if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    fields <- c(fields, "specimen_type_concept_id")
    values <- c(values, if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    fields <- c(fields, "specimen_date")
    values <- c(values, if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    fields <- c(fields, "specimen_datetime")
    values <- c(values, if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    fields <- c(fields, "anatomic_site_concept_id")
    values <- c(values, if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    fields <- c(fields, "disease_status_concept_id")
    values <- c(values, if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    fields <- c(fields, "specimen_source_id")
    values <- c(values, if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    fields <- c(fields, "specimen_source_value")
    values <- c(values, if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    fields <- c(fields, "anatomic_site_source_value")
    values <- c(values, if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    fields <- c(fields, "disease_status_source_value")
    values <- c(values, if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "specimen", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_visit_detail <- function(visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    fields <- c(fields, "preceding_visit_detail_id")
    values <- c(values, if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    fields <- c(fields, "visit_detail_parent_id")
    values <- c(values, if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "visit_detail", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cohort", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cohort_attribute <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cohort_attribute", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  fields <- c()
  values <- c()
  if (!missing(condition_era_id)) {
    fields <- c(fields, "condition_era_id")
    values <- c(values, if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    fields <- c(fields, "condition_era_start_date")
    values <- c(values, if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    fields <- c(fields, "condition_era_end_date")
    values <- c(values, if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    fields <- c(fields, "condition_occurrence_count")
    values <- c(values, if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "condition_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  fields <- c()
  values <- c()
  if (!missing(dose_era_id)) {
    fields <- c(fields, "dose_era_id")
    values <- c(values, if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    fields <- c(fields, "dose_value")
    values <- c(values, if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    fields <- c(fields, "dose_era_start_date")
    values <- c(values, if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    fields <- c(fields, "dose_era_end_date")
    values <- c(values, if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "dose_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  fields <- c()
  values <- c()
  if (!missing(drug_era_id)) {
    fields <- c(fields, "drug_era_id")
    values <- c(values, if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    fields <- c(fields, "drug_era_start_date")
    values <- c(values, if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    fields <- c(fields, "drug_era_end_date")
    values <- c(values, if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    fields <- c(fields, "drug_exposure_count")
    values <- c(values, if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    fields <- c(fields, "gap_days")
    values <- c(values, if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "drug_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_concept_id, payer_source_value, payer_source_concept_id, plan_concept_id, plan_source_value, plan_source_concept_id, sponsor_concept_id, sponsor_source_value, sponsor_source_concept_id, family_source_value, stop_reason_concept_id, stop_reason_source_value, stop_reason_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    fields <- c(fields, "payer_plan_period_start_date")
    values <- c(values, if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    fields <- c(fields, "payer_plan_period_end_date")
    values <- c(values, if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_concept_id)) {
    fields <- c(fields, "payer_concept_id")
    values <- c(values, if (is.null(payer_concept_id)) "NULL" else if (is(payer_concept_id, "subQuery")) paste0("(", as.character(payer_concept_id), ")") else paste0("'", as.character(payer_concept_id), "'"))
  }

  if (!missing(payer_source_value)) {
    fields <- c(fields, "payer_source_value")
    values <- c(values, if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(payer_source_concept_id)) {
    fields <- c(fields, "payer_source_concept_id")
    values <- c(values, if (is.null(payer_source_concept_id)) "NULL" else if (is(payer_source_concept_id, "subQuery")) paste0("(", as.character(payer_source_concept_id), ")") else paste0("'", as.character(payer_source_concept_id), "'"))
  }

  if (!missing(plan_concept_id)) {
    fields <- c(fields, "plan_concept_id")
    values <- c(values, if (is.null(plan_concept_id)) "NULL" else if (is(plan_concept_id, "subQuery")) paste0("(", as.character(plan_concept_id), ")") else paste0("'", as.character(plan_concept_id), "'"))
  }

  if (!missing(plan_source_value)) {
    fields <- c(fields, "plan_source_value")
    values <- c(values, if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(plan_source_concept_id)) {
    fields <- c(fields, "plan_source_concept_id")
    values <- c(values, if (is.null(plan_source_concept_id)) "NULL" else if (is(plan_source_concept_id, "subQuery")) paste0("(", as.character(plan_source_concept_id), ")") else paste0("'", as.character(plan_source_concept_id), "'"))
  }

  if (!missing(sponsor_concept_id)) {
    fields <- c(fields, "sponsor_concept_id")
    values <- c(values, if (is.null(sponsor_concept_id)) "NULL" else if (is(sponsor_concept_id, "subQuery")) paste0("(", as.character(sponsor_concept_id), ")") else paste0("'", as.character(sponsor_concept_id), "'"))
  }

  if (!missing(sponsor_source_value)) {
    fields <- c(fields, "sponsor_source_value")
    values <- c(values, if (is.null(sponsor_source_value)) "NULL" else if (is(sponsor_source_value, "subQuery")) paste0("(", as.character(sponsor_source_value), ")") else paste0("'", as.character(sponsor_source_value), "'"))
  }

  if (!missing(sponsor_source_concept_id)) {
    fields <- c(fields, "sponsor_source_concept_id")
    values <- c(values, if (is.null(sponsor_source_concept_id)) "NULL" else if (is(sponsor_source_concept_id, "subQuery")) paste0("(", as.character(sponsor_source_concept_id), ")") else paste0("'", as.character(sponsor_source_concept_id), "'"))
  }

  if (!missing(family_source_value)) {
    fields <- c(fields, "family_source_value")
    values <- c(values, if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  if (!missing(stop_reason_concept_id)) {
    fields <- c(fields, "stop_reason_concept_id")
    values <- c(values, if (is.null(stop_reason_concept_id)) "NULL" else if (is(stop_reason_concept_id, "subQuery")) paste0("(", as.character(stop_reason_concept_id), ")") else paste0("'", as.character(stop_reason_concept_id), "'"))
  }

  if (!missing(stop_reason_source_value)) {
    fields <- c(fields, "stop_reason_source_value")
    values <- c(values, if (is.null(stop_reason_source_value)) "NULL" else if (is(stop_reason_source_value, "subQuery")) paste0("(", as.character(stop_reason_source_value), ")") else paste0("'", as.character(stop_reason_source_value), "'"))
  }

  if (!missing(stop_reason_source_concept_id)) {
    fields <- c(fields, "stop_reason_source_concept_id")
    values <- c(values, if (is.null(stop_reason_source_concept_id)) "NULL" else if (is(stop_reason_source_concept_id, "subQuery")) paste0("(", as.character(stop_reason_source_concept_id), ")") else paste0("'", as.character(stop_reason_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "payer_plan_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  fields <- c()
  values <- c()
  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    fields <- c(fields, "address_1")
    values <- c(values, if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    fields <- c(fields, "address_2")
    values <- c(values, if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    fields <- c(fields, "city")
    values <- c(values, if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    fields <- c(fields, "state")
    values <- c(values, if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    fields <- c(fields, "zip")
    values <- c(values, if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    fields <- c(fields, "county")
    values <- c(values, if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    fields <- c(fields, "location_source_value")
    values <- c(values, if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "location", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  fields <- c()
  values <- c()
  if (!missing(cdm_source_name)) {
    fields <- c(fields, "cdm_source_name")
    values <- c(values, if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    fields <- c(fields, "cdm_source_abbreviation")
    values <- c(values, if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    fields <- c(fields, "cdm_holder")
    values <- c(values, if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    fields <- c(fields, "source_description")
    values <- c(values, if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    fields <- c(fields, "source_documentation_reference")
    values <- c(values, if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    fields <- c(fields, "[cdm_etl _reference]")
    values <- c(values, if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    fields <- c(fields, "source_release_date")
    values <- c(values, if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    fields <- c(fields, "cdm_release_date")
    values <- c(values, if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    fields <- c(fields, "cdm_version")
    values <- c(values, if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cdm_source", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_metadata <- function(metadata_concept_id, metadata_type_concept_id, name, value_as_string, value_as_concept_id, metadata_date, metadata_datetime) {
  fields <- c()
  values <- c()
  if (!missing(metadata_concept_id)) {
    fields <- c(fields, "metadata_concept_id")
    values <- c(values, if (is.null(metadata_concept_id)) "NULL" else if (is(metadata_concept_id, "subQuery")) paste0("(", as.character(metadata_concept_id), ")") else paste0("'", as.character(metadata_concept_id), "'"))
  }

  if (!missing(metadata_type_concept_id)) {
    fields <- c(fields, "metadata_type_concept_id")
    values <- c(values, if (is.null(metadata_type_concept_id)) "NULL" else if (is(metadata_type_concept_id, "subQuery")) paste0("(", as.character(metadata_type_concept_id), ")") else paste0("'", as.character(metadata_type_concept_id), "'"))
  }

  if (!missing(name)) {
    fields <- c(fields, "name")
    values <- c(values, if (is.null(name)) "NULL" else if (is(name, "subQuery")) paste0("(", as.character(name), ")") else paste0("'", as.character(name), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(metadata_date)) {
    fields <- c(fields, "[metadata date]")
    values <- c(values, if (is.null(metadata_date)) "NULL" else if (is(metadata_date, "subQuery")) paste0("(", as.character(metadata_date), ")") else paste0("'", as.character(metadata_date), "'"))
  }

  if (!missing(metadata_datetime)) {
    fields <- c(fields, "metadata_datetime")
    values <- c(values, if (is.null(metadata_datetime)) "NULL" else if (is(metadata_datetime, "subQuery")) paste0("(", as.character(metadata_datetime), ")") else paste0("'", as.character(metadata_datetime), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "metadata", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  fields <- c()
  values <- c()
  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    fields <- c(fields, "attribute_name")
    values <- c(values, if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    fields <- c(fields, "attribute_description")
    values <- c(values, if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    fields <- c(fields, "attribute_type_concept_id")
    values <- c(values, if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    fields <- c(fields, "attribute_syntax")
    values <- c(values, if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "attribute_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    fields <- c(fields, "cohort_definition_name")
    values <- c(values, if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    fields <- c(fields, "cohort_definition_description")
    values <- c(values, if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    fields <- c(fields, "definition_type_concept_id")
    values <- c(values, if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    fields <- c(fields, "cohort_definition_syntax")
    values <- c(values, if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    fields <- c(fields, "subject_concept_id")
    values <- c(values, if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    fields <- c(fields, "cohort_instantiation_date")
    values <- c(values, if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cohort_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_concept <- function(concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(concept_id)) {
    fields <- c(fields, "concept_id")
    values <- c(values, if (is.null(concept_id)) "NULL" else if (is(concept_id, "subQuery")) paste0("(", as.character(concept_id), ")") else paste0("'", as.character(concept_id), "'"))
  }

  if (!missing(concept_name)) {
    fields <- c(fields, "concept_name")
    values <- c(values, if (is.null(concept_name)) "NULL" else if (is(concept_name, "subQuery")) paste0("(", as.character(concept_name), ")") else paste0("'", as.character(concept_name), "'"))
  }

  if (!missing(domain_id)) {
    fields <- c(fields, "domain_id")
    values <- c(values, if (is.null(domain_id)) "NULL" else if (is(domain_id, "subQuery")) paste0("(", as.character(domain_id), ")") else paste0("'", as.character(domain_id), "'"))
  }

  if (!missing(vocabulary_id)) {
    fields <- c(fields, "vocabulary_id")
    values <- c(values, if (is.null(vocabulary_id)) "NULL" else if (is(vocabulary_id, "subQuery")) paste0("(", as.character(vocabulary_id), ")") else paste0("'", as.character(vocabulary_id), "'"))
  }

  if (!missing(concept_class_id)) {
    fields <- c(fields, "concept_class_id")
    values <- c(values, if (is.null(concept_class_id)) "NULL" else if (is(concept_class_id, "subQuery")) paste0("(", as.character(concept_class_id), ")") else paste0("'", as.character(concept_class_id), "'"))
  }

  if (!missing(standard_concept)) {
    fields <- c(fields, "standard_concept")
    values <- c(values, if (is.null(standard_concept)) "NULL" else if (is(standard_concept, "subQuery")) paste0("(", as.character(standard_concept), ")") else paste0("'", as.character(standard_concept), "'"))
  }

  if (!missing(concept_code)) {
    fields <- c(fields, "concept_code")
    values <- c(values, if (is.null(concept_code)) "NULL" else if (is(concept_code, "subQuery")) paste0("(", as.character(concept_code), ")") else paste0("'", as.character(concept_code), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "concept", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_concept_ancestor <- function(ancestor_concept_id, descendant_concept_id, min_levels_of_separation, max_levels_of_separation) {
  fields <- c()
  values <- c()
  if (!missing(ancestor_concept_id)) {
    fields <- c(fields, "ancestor_concept_id")
    values <- c(values, if (is.null(ancestor_concept_id)) "NULL" else if (is(ancestor_concept_id, "subQuery")) paste0("(", as.character(ancestor_concept_id), ")") else paste0("'", as.character(ancestor_concept_id), "'"))
  }

  if (!missing(descendant_concept_id)) {
    fields <- c(fields, "descendant_concept_id")
    values <- c(values, if (is.null(descendant_concept_id)) "NULL" else if (is(descendant_concept_id, "subQuery")) paste0("(", as.character(descendant_concept_id), ")") else paste0("'", as.character(descendant_concept_id), "'"))
  }

  if (!missing(min_levels_of_separation)) {
    fields <- c(fields, "min_levels_of_separation")
    values <- c(values, if (is.null(min_levels_of_separation)) "NULL" else if (is(min_levels_of_separation, "subQuery")) paste0("(", as.character(min_levels_of_separation), ")") else paste0("'", as.character(min_levels_of_separation), "'"))
  }

  if (!missing(max_levels_of_separation)) {
    fields <- c(fields, "max_levels_of_separation")
    values <- c(values, if (is.null(max_levels_of_separation)) "NULL" else if (is(max_levels_of_separation, "subQuery")) paste0("(", as.character(max_levels_of_separation), ")") else paste0("'", as.character(max_levels_of_separation), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "concept_ancestor", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_concept_class <- function(concept_class_id, concept_class_name, concept_class_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(concept_class_id)) {
    fields <- c(fields, "concept_class_id")
    values <- c(values, if (is.null(concept_class_id)) "NULL" else if (is(concept_class_id, "subQuery")) paste0("(", as.character(concept_class_id), ")") else paste0("'", as.character(concept_class_id), "'"))
  }

  if (!missing(concept_class_name)) {
    fields <- c(fields, "concept_class_name")
    values <- c(values, if (is.null(concept_class_name)) "NULL" else if (is(concept_class_name, "subQuery")) paste0("(", as.character(concept_class_name), ")") else paste0("'", as.character(concept_class_name), "'"))
  }

  if (!missing(concept_class_concept_id)) {
    fields <- c(fields, "concept_class_concept_id")
    values <- c(values, if (is.null(concept_class_concept_id)) "NULL" else if (is(concept_class_concept_id, "subQuery")) paste0("(", as.character(concept_class_concept_id), ")") else paste0("'", as.character(concept_class_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "concept_class", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_concept_relationship <- function(concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(concept_id_1)) {
    fields <- c(fields, "concept_id_1")
    values <- c(values, if (is.null(concept_id_1)) "NULL" else if (is(concept_id_1, "subQuery")) paste0("(", as.character(concept_id_1), ")") else paste0("'", as.character(concept_id_1), "'"))
  }

  if (!missing(concept_id_2)) {
    fields <- c(fields, "concept_id_2")
    values <- c(values, if (is.null(concept_id_2)) "NULL" else if (is(concept_id_2, "subQuery")) paste0("(", as.character(concept_id_2), ")") else paste0("'", as.character(concept_id_2), "'"))
  }

  if (!missing(relationship_id)) {
    fields <- c(fields, "relationship_id")
    values <- c(values, if (is.null(relationship_id)) "NULL" else if (is(relationship_id, "subQuery")) paste0("(", as.character(relationship_id), ")") else paste0("'", as.character(relationship_id), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "concept_relationship", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_concept_synonym <- function(concept_id, concept_synonym_name, language_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(concept_id)) {
    fields <- c(fields, "concept_id")
    values <- c(values, if (is.null(concept_id)) "NULL" else if (is(concept_id, "subQuery")) paste0("(", as.character(concept_id), ")") else paste0("'", as.character(concept_id), "'"))
  }

  if (!missing(concept_synonym_name)) {
    fields <- c(fields, "concept_synonym_name")
    values <- c(values, if (is.null(concept_synonym_name)) "NULL" else if (is(concept_synonym_name, "subQuery")) paste0("(", as.character(concept_synonym_name), ")") else paste0("'", as.character(concept_synonym_name), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "concept_synonym", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_domain <- function(domain_id, domain_name, domain_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_id)) {
    fields <- c(fields, "domain_id")
    values <- c(values, if (is.null(domain_id)) "NULL" else if (is(domain_id, "subQuery")) paste0("(", as.character(domain_id), ")") else paste0("'", as.character(domain_id), "'"))
  }

  if (!missing(domain_name)) {
    fields <- c(fields, "domain_name")
    values <- c(values, if (is.null(domain_name)) "NULL" else if (is(domain_name, "subQuery")) paste0("(", as.character(domain_name), ")") else paste0("'", as.character(domain_name), "'"))
  }

  if (!missing(domain_concept_id)) {
    fields <- c(fields, "domain_concept_id")
    values <- c(values, if (is.null(domain_concept_id)) "NULL" else if (is(domain_concept_id, "subQuery")) paste0("(", as.character(domain_concept_id), ")") else paste0("'", as.character(domain_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "domain", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_drug_strength <- function(drug_concept_id, ingredient_concept_id, amount_value, amount_unit_concept_id, numerator_value, numerator_unit_concept_id, denominator_value, denominator_unit_concept_id, box_size, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(ingredient_concept_id)) {
    fields <- c(fields, "ingredient_concept_id")
    values <- c(values, if (is.null(ingredient_concept_id)) "NULL" else if (is(ingredient_concept_id, "subQuery")) paste0("(", as.character(ingredient_concept_id), ")") else paste0("'", as.character(ingredient_concept_id), "'"))
  }

  if (!missing(amount_value)) {
    fields <- c(fields, "amount_value")
    values <- c(values, if (is.null(amount_value)) "NULL" else if (is(amount_value, "subQuery")) paste0("(", as.character(amount_value), ")") else paste0("'", as.character(amount_value), "'"))
  }

  if (!missing(amount_unit_concept_id)) {
    fields <- c(fields, "amount_unit_concept_id")
    values <- c(values, if (is.null(amount_unit_concept_id)) "NULL" else if (is(amount_unit_concept_id, "subQuery")) paste0("(", as.character(amount_unit_concept_id), ")") else paste0("'", as.character(amount_unit_concept_id), "'"))
  }

  if (!missing(numerator_value)) {
    fields <- c(fields, "numerator_value")
    values <- c(values, if (is.null(numerator_value)) "NULL" else if (is(numerator_value, "subQuery")) paste0("(", as.character(numerator_value), ")") else paste0("'", as.character(numerator_value), "'"))
  }

  if (!missing(numerator_unit_concept_id)) {
    fields <- c(fields, "numerator_unit_concept_id")
    values <- c(values, if (is.null(numerator_unit_concept_id)) "NULL" else if (is(numerator_unit_concept_id, "subQuery")) paste0("(", as.character(numerator_unit_concept_id), ")") else paste0("'", as.character(numerator_unit_concept_id), "'"))
  }

  if (!missing(denominator_value)) {
    fields <- c(fields, "denominator_value")
    values <- c(values, if (is.null(denominator_value)) "NULL" else if (is(denominator_value, "subQuery")) paste0("(", as.character(denominator_value), ")") else paste0("'", as.character(denominator_value), "'"))
  }

  if (!missing(denominator_unit_concept_id)) {
    fields <- c(fields, "denominator_unit_concept_id")
    values <- c(values, if (is.null(denominator_unit_concept_id)) "NULL" else if (is(denominator_unit_concept_id, "subQuery")) paste0("(", as.character(denominator_unit_concept_id), ")") else paste0("'", as.character(denominator_unit_concept_id), "'"))
  }

  if (!missing(box_size)) {
    fields <- c(fields, "box_size")
    values <- c(values, if (is.null(box_size)) "NULL" else if (is(box_size, "subQuery")) paste0("(", as.character(box_size), ")") else paste0("'", as.character(box_size), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "drug_strength", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_relationship <- function(relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(relationship_id)) {
    fields <- c(fields, "relationship_id")
    values <- c(values, if (is.null(relationship_id)) "NULL" else if (is(relationship_id, "subQuery")) paste0("(", as.character(relationship_id), ")") else paste0("'", as.character(relationship_id), "'"))
  }

  if (!missing(relationship_name)) {
    fields <- c(fields, "relationship_name")
    values <- c(values, if (is.null(relationship_name)) "NULL" else if (is(relationship_name, "subQuery")) paste0("(", as.character(relationship_name), ")") else paste0("'", as.character(relationship_name), "'"))
  }

  if (!missing(is_hierarchical)) {
    fields <- c(fields, "is_hierarchical")
    values <- c(values, if (is.null(is_hierarchical)) "NULL" else if (is(is_hierarchical, "subQuery")) paste0("(", as.character(is_hierarchical), ")") else paste0("'", as.character(is_hierarchical), "'"))
  }

  if (!missing(defines_ancestry)) {
    fields <- c(fields, "defines_ancestry")
    values <- c(values, if (is.null(defines_ancestry)) "NULL" else if (is(defines_ancestry, "subQuery")) paste0("(", as.character(defines_ancestry), ")") else paste0("'", as.character(defines_ancestry), "'"))
  }

  if (!missing(reverse_relationship_id)) {
    fields <- c(fields, "reverse_relationship_id")
    values <- c(values, if (is.null(reverse_relationship_id)) "NULL" else if (is(reverse_relationship_id, "subQuery")) paste0("(", as.character(reverse_relationship_id), ")") else paste0("'", as.character(reverse_relationship_id), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "relationship", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_source_to_concept_map <- function(source_code, source_concept_id, source_vocabulary_id, source_code_description, target_concept_id, target_vocabulary_id, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(source_code)) {
    fields <- c(fields, "source_code")
    values <- c(values, if (is.null(source_code)) "NULL" else if (is(source_code, "subQuery")) paste0("(", as.character(source_code), ")") else paste0("'", as.character(source_code), "'"))
  }

  if (!missing(source_concept_id)) {
    fields <- c(fields, "source_concept_id")
    values <- c(values, if (is.null(source_concept_id)) "NULL" else if (is(source_concept_id, "subQuery")) paste0("(", as.character(source_concept_id), ")") else paste0("'", as.character(source_concept_id), "'"))
  }

  if (!missing(source_vocabulary_id)) {
    fields <- c(fields, "source_vocabulary_id")
    values <- c(values, if (is.null(source_vocabulary_id)) "NULL" else if (is(source_vocabulary_id, "subQuery")) paste0("(", as.character(source_vocabulary_id), ")") else paste0("'", as.character(source_vocabulary_id), "'"))
  }

  if (!missing(source_code_description)) {
    fields <- c(fields, "source_code_description")
    values <- c(values, if (is.null(source_code_description)) "NULL" else if (is(source_code_description, "subQuery")) paste0("(", as.character(source_code_description), ")") else paste0("'", as.character(source_code_description), "'"))
  }

  if (!missing(target_concept_id)) {
    fields <- c(fields, "target_concept_id")
    values <- c(values, if (is.null(target_concept_id)) "NULL" else if (is(target_concept_id, "subQuery")) paste0("(", as.character(target_concept_id), ")") else paste0("'", as.character(target_concept_id), "'"))
  }

  if (!missing(target_vocabulary_id)) {
    fields <- c(fields, "target_vocabulary_id")
    values <- c(values, if (is.null(target_vocabulary_id)) "NULL" else if (is(target_vocabulary_id, "subQuery")) paste0("(", as.character(target_vocabulary_id), ")") else paste0("'", as.character(target_vocabulary_id), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "source_to_concept_map", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_vocabulary <- function(vocabulary_id, vocabulary_name, vocabulary_reference, vocabulary_version, vocabulary_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(vocabulary_id)) {
    fields <- c(fields, "vocabulary_id")
    values <- c(values, if (is.null(vocabulary_id)) "NULL" else if (is(vocabulary_id, "subQuery")) paste0("(", as.character(vocabulary_id), ")") else paste0("'", as.character(vocabulary_id), "'"))
  }

  if (!missing(vocabulary_name)) {
    fields <- c(fields, "vocabulary_name")
    values <- c(values, if (is.null(vocabulary_name)) "NULL" else if (is(vocabulary_name, "subQuery")) paste0("(", as.character(vocabulary_name), ")") else paste0("'", as.character(vocabulary_name), "'"))
  }

  if (!missing(vocabulary_reference)) {
    fields <- c(fields, "vocabulary_reference")
    values <- c(values, if (is.null(vocabulary_reference)) "NULL" else if (is(vocabulary_reference, "subQuery")) paste0("(", as.character(vocabulary_reference), ")") else paste0("'", as.character(vocabulary_reference), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  if (!missing(vocabulary_concept_id)) {
    fields <- c(fields, "vocabulary_concept_id")
    values <- c(values, if (is.null(vocabulary_concept_id)) "NULL" else if (is(vocabulary_concept_id, "subQuery")) paste0("(", as.character(vocabulary_concept_id), ")") else paste0("'", as.character(vocabulary_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "vocabulary", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cost <- function(rowCount, cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  fields <- c()
  values <- c()
  if (!missing(cost_id)) {
    fields <- c(fields, "cost_id")
    values <- c(values, if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    fields <- c(fields, "cost_event_id")
    values <- c(values, if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    fields <- c(fields, "cost_domain_id")
    values <- c(values, if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    fields <- c(fields, "cost_type_concept_id")
    values <- c(values, if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    fields <- c(fields, "currency_concept_id")
    values <- c(values, if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    fields <- c(fields, "total_charge")
    values <- c(values, if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    fields <- c(fields, "total_cost")
    values <- c(values, if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    fields <- c(fields, "total_paid")
    values <- c(values, if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    fields <- c(fields, "paid_by_payer")
    values <- c(values, if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    fields <- c(fields, "paid_by_patient")
    values <- c(values, if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    fields <- c(fields, "paid_patient_copay")
    values <- c(values, if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    fields <- c(fields, "paid_patient_coinsurance")
    values <- c(values, if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    fields <- c(fields, "paid_patient_deductible")
    values <- c(values, if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    fields <- c(fields, "paid_by_primary")
    values <- c(values, if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    fields <- c(fields, "paid_ingredient_cost")
    values <- c(values, if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    fields <- c(fields, "paid_dispensing_fee")
    values <- c(values, if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    fields <- c(fields, "amount_allowed")
    values <- c(values, if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    fields <- c(fields, "revenue_code_concept_id")
    values <- c(values, if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    fields <- c(fields, "revenue_code_source_value")
    values <- c(values, if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    fields <- c(fields, "drg_concept_id")
    values <- c(values, if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    fields <- c(fields, "drg_source_value")
    values <- c(values, if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cost", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_visit_occurrence <- function(rowCount, visit_occurrence_id, person_id, visit_concept_id, visit_source_value, visit_start_date, visit_end_date, care_site_id, visit_start_datetime, visit_end_datetime, visit_type_concept_id, provider_id, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    fields <- c(fields, "preceding_visit_occurrence_id")
    values <- c(values, if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "visit_occurrence", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_person <- function(rowCount, person_id, person_source_value, year_of_birth, month_of_birth, gender_concept_id, gender_source_value, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(person_source_value)) {
    fields <- c(fields, "person_source_value")
    values <- c(values, if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    fields <- c(fields, "month_of_birth")
    values <- c(values, if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(day_of_birth)) {
    fields <- c(fields, "day_of_birth")
    values <- c(values, if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    fields <- c(fields, "birth_datetime")
    values <- c(values, if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    fields <- c(fields, "race_concept_id")
    values <- c(values, if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    fields <- c(fields, "ethnicity_concept_id")
    values <- c(values, if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    fields <- c(fields, "race_source_value")
    values <- c(values, if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    fields <- c(fields, "race_source_concept_id")
    values <- c(values, if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    fields <- c(fields, "ethnicity_source_value")
    values <- c(values, if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    fields <- c(fields, "ethnicity_source_concept_id")
    values <- c(values, if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "person", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_observation_period <- function(rowCount, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(observation_period_id)) {
    fields <- c(fields, "observation_period_id")
    values <- c(values, if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    fields <- c(fields, "observation_period_start_date")
    values <- c(values, if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    fields <- c(fields, "observation_period_end_date")
    values <- c(values, if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    fields <- c(fields, "period_type_concept_id")
    values <- c(values, if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "observation_period", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_death <- function(rowCount, person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    fields <- c(fields, "death_date")
    values <- c(values, if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    fields <- c(fields, "death_datetime")
    values <- c(values, if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    fields <- c(fields, "death_type_concept_id")
    values <- c(values, if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    fields <- c(fields, "cause_concept_id")
    values <- c(values, if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    fields <- c(fields, "cause_source_value")
    values <- c(values, if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    fields <- c(fields, "cause_source_concept_id")
    values <- c(values, if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "death", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_condition_occurrence <- function(rowCount, condition_occurrence_id, person_id, visit_occurrence_id, condition_type_concept_id, condition_start_date, condition_end_date, condition_concept_id, condition_source_value, condition_source_concept_id, provider_id, condition_start_datetime, condition_end_datetime, stop_reason, visit_detail_id, condition_status_source_value, condition_status_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(condition_occurrence_id)) {
    fields <- c(fields, "condition_occurrence_id")
    values <- c(values, if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    fields <- c(fields, "condition_type_concept_id")
    values <- c(values, if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    fields <- c(fields, "condition_start_date")
    values <- c(values, if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_end_date)) {
    fields <- c(fields, "condition_end_date")
    values <- c(values, if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_source_value)) {
    fields <- c(fields, "condition_source_value")
    values <- c(values, if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    fields <- c(fields, "condition_source_concept_id")
    values <- c(values, if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(condition_start_datetime)) {
    fields <- c(fields, "condition_start_datetime")
    values <- c(values, if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_datetime)) {
    fields <- c(fields, "condition_end_datetime")
    values <- c(values, if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    fields <- c(fields, "condition_status_source_value")
    values <- c(values, if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    fields <- c(fields, "condition_status_concept_id")
    values <- c(values, if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "condition_occurrence", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_measurement <- function(rowCount, measurement_id, visit_occurrence_id, person_id, measurement_type_concept_id, measurement_date, measurement_concept_id, measurement_source_value, measurement_source_concept_id, provider_id, measurement_datetime, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, visit_detail_id, unit_source_value, value_source_value) {
  fields <- c()
  values <- c()
  if (!missing(measurement_id)) {
    fields <- c(fields, "measurement_id")
    values <- c(values, if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    fields <- c(fields, "measurement_type_concept_id")
    values <- c(values, if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    fields <- c(fields, "measurement_date")
    values <- c(values, if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_concept_id)) {
    fields <- c(fields, "measurement_concept_id")
    values <- c(values, if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    fields <- c(fields, "measurement_source_value")
    values <- c(values, if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    fields <- c(fields, "measurement_source_concept_id")
    values <- c(values, if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(measurement_datetime)) {
    fields <- c(fields, "measurement_datetime")
    values <- c(values, if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(operator_concept_id)) {
    fields <- c(fields, "operator_concept_id")
    values <- c(values, if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    fields <- c(fields, "range_low")
    values <- c(values, if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    fields <- c(fields, "range_high")
    values <- c(values, if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    fields <- c(fields, "value_source_value")
    values <- c(values, if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "measurement", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_observation <- function(rowCount, observation_id, visit_occurrence_id, person_id, observation_type_concept_id, observation_date, observation_concept_id, observation_source_concept_id, observation_source_value, provider_id, observation_datetime, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, visit_detail_id, unit_source_value, qualifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(observation_id)) {
    fields <- c(fields, "observation_id")
    values <- c(values, if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    fields <- c(fields, "observation_type_concept_id")
    values <- c(values, if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    fields <- c(fields, "observation_date")
    values <- c(values, if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_concept_id)) {
    fields <- c(fields, "observation_concept_id")
    values <- c(values, if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    fields <- c(fields, "observation_source_concept_id")
    values <- c(values, if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(observation_source_value)) {
    fields <- c(fields, "observation_source_value")
    values <- c(values, if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(observation_datetime)) {
    fields <- c(fields, "observation_datetime")
    values <- c(values, if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    fields <- c(fields, "qualifier_concept_id")
    values <- c(values, if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "observation", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_procedure_occurrence <- function(rowCount, procedure_occurrence_id, visit_occurrence_id, person_id, procedure_type_concept_id, procedure_date, procedure_concept_id, procedure_source_concept_id, procedure_source_value, provider_id, procedure_datetime, modifier_concept_id, quantity, visit_detail_id, modifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(procedure_occurrence_id)) {
    fields <- c(fields, "procedure_occurrence_id")
    values <- c(values, if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    fields <- c(fields, "procedure_type_concept_id")
    values <- c(values, if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    fields <- c(fields, "procedure_date")
    values <- c(values, if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_concept_id)) {
    fields <- c(fields, "procedure_concept_id")
    values <- c(values, if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    fields <- c(fields, "procedure_source_concept_id")
    values <- c(values, if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    fields <- c(fields, "procedure_source_value")
    values <- c(values, if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(procedure_datetime)) {
    fields <- c(fields, "procedure_datetime")
    values <- c(values, if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(modifier_concept_id)) {
    fields <- c(fields, "modifier_concept_id")
    values <- c(values, if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(modifier_source_value)) {
    fields <- c(fields, "modifier_source_value")
    values <- c(values, if (is.null(modifier_source_value)) "NULL" else if (is(modifier_source_value, "subQuery")) paste0("(", as.character(modifier_source_value), ")") else paste0("'", as.character(modifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "procedure_occurrence", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_drug_exposure <- function(rowCount, drug_exposure_id, visit_occurrence_id, person_id, drug_type_concept_id, drug_exposure_start_date, drug_exposure_end_date, days_supply, drug_concept_id, drug_source_value, sig, provider_id, quantity, dose_unit_source_value, drug_source_concept_id, drug_exposure_end_datetime, verbatim_end_date, stop_reason, refills, drug_exposure_start_datetime, route_concept_id, lot_number, visit_detail_id, route_source_value) {
  fields <- c()
  values <- c()
  if (!missing(drug_exposure_id)) {
    fields <- c(fields, "drug_exposure_id")
    values <- c(values, if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    fields <- c(fields, "drug_type_concept_id")
    values <- c(values, if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    fields <- c(fields, "drug_exposure_start_date")
    values <- c(values, if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    fields <- c(fields, "drug_exposure_end_date")
    values <- c(values, if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(days_supply)) {
    fields <- c(fields, "days_supply")
    values <- c(values, if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_source_value)) {
    fields <- c(fields, "drug_source_value")
    values <- c(values, if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(sig)) {
    fields <- c(fields, "sig")
    values <- c(values, if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    fields <- c(fields, "dose_unit_source_value")
    values <- c(values, if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    fields <- c(fields, "drug_source_concept_id")
    values <- c(values, if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    fields <- c(fields, "drug_exposure_end_datetime")
    values <- c(values, if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    fields <- c(fields, "verbatim_end_date")
    values <- c(values, if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    fields <- c(fields, "refills")
    values <- c(values, if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    fields <- c(fields, "drug_exposure_start_datetime")
    values <- c(values, if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(route_concept_id)) {
    fields <- c(fields, "route_concept_id")
    values <- c(values, if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    fields <- c(fields, "lot_number")
    values <- c(values, if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(route_source_value)) {
    fields <- c(fields, "route_source_value")
    values <- c(values, if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "drug_exposure", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_care_site <- function(rowCount, care_site_id, care_site_source_value, care_site_name, place_of_service_concept_id, location_id, place_of_service_source_value) {
  fields <- c()
  values <- c()
  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    fields <- c(fields, "care_site_source_value")
    values <- c(values, if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(care_site_name)) {
    fields <- c(fields, "care_site_name")
    values <- c(values, if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    fields <- c(fields, "place_of_service_concept_id")
    values <- c(values, if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    fields <- c(fields, "place_of_service_source_value")
    values <- c(values, if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "care_site", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_provider <- function(rowCount, provider_id, provider_source_value, specialty_concept_id, specialty_source_value, provider_name, npi, dea, care_site_id, year_of_birth, gender_concept_id, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_source_value)) {
    fields <- c(fields, "provider_source_value")
    values <- c(values, if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_concept_id)) {
    fields <- c(fields, "specialty_concept_id")
    values <- c(values, if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(specialty_source_value)) {
    fields <- c(fields, "specialty_source_value")
    values <- c(values, if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(provider_name)) {
    fields <- c(fields, "provider_name")
    values <- c(values, if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    fields <- c(fields, "dea")
    values <- c(values, if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    fields <- c(fields, "specialty_source_concept_id")
    values <- c(values, if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "provider", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_device_exposure <- function(rowCount, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, visit_detail_id, device_source_value, device_source__concept_id) {
  fields <- c()
  values <- c()
  if (!missing(device_exposure_id)) {
    fields <- c(fields, "device_exposure_id")
    values <- c(values, if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    fields <- c(fields, "device_concept_id")
    values <- c(values, if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    fields <- c(fields, "device_exposure_start_date")
    values <- c(values, if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    fields <- c(fields, "device_exposure_start_datetime")
    values <- c(values, if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    fields <- c(fields, "device_exposure_end_date")
    values <- c(values, if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    fields <- c(fields, "device_exposure_end_datetime")
    values <- c(values, if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    fields <- c(fields, "device_type_concept_id")
    values <- c(values, if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    fields <- c(fields, "unique_device_id")
    values <- c(values, if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(device_source_value)) {
    fields <- c(fields, "device_source_value")
    values <- c(values, if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    fields <- c(fields, "[device_source_ concept_id]")
    values <- c(values, if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "device_exposure", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_fact_relationship <- function(rowCount, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_concept_id_1)) {
    fields <- c(fields, "domain_concept_id_1")
    values <- c(values, if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    fields <- c(fields, "fact_id_1")
    values <- c(values, if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    fields <- c(fields, "domain_concept_id_2")
    values <- c(values, if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    fields <- c(fields, "fact_id_2")
    values <- c(values, if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "fact_relationship", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_note <- function(rowCount, note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, visit_occurrence_id, visit_detail_id, note_source_value) {
  fields <- c()
  values <- c()
  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    fields <- c(fields, "note_date")
    values <- c(values, if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    fields <- c(fields, "note_datetime")
    values <- c(values, if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    fields <- c(fields, "note_type_concept_id")
    values <- c(values, if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    fields <- c(fields, "note_class_concept_id")
    values <- c(values, if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    fields <- c(fields, "note_title")
    values <- c(values, if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    fields <- c(fields, "note_text")
    values <- c(values, if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    fields <- c(fields, "encoding_concept_id")
    values <- c(values, if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(note_source_value)) {
    fields <- c(fields, "note_source_value")
    values <- c(values, if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "note", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_note_nlp <- function(rowCount, note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  fields <- c()
  values <- c()
  if (!missing(note_nlp_id)) {
    fields <- c(fields, "note_nlp_id")
    values <- c(values, if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    fields <- c(fields, "section_concept_id")
    values <- c(values, if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    fields <- c(fields, "snippet")
    values <- c(values, if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    fields <- c(fields, "offset")
    values <- c(values, if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    fields <- c(fields, "lexical_variant")
    values <- c(values, if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    fields <- c(fields, "note_nlp_concept_id")
    values <- c(values, if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    fields <- c(fields, "note_nlp_source_concept_id")
    values <- c(values, if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    fields <- c(fields, "nlp_system")
    values <- c(values, if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    fields <- c(fields, "nlp_date")
    values <- c(values, if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    fields <- c(fields, "nlp_date_time")
    values <- c(values, if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    fields <- c(fields, "term_exists")
    values <- c(values, if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    fields <- c(fields, "term_temporal")
    values <- c(values, if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    fields <- c(fields, "term_modifiers")
    values <- c(values, if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "note_nlp", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_specimen <- function(rowCount, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  fields <- c()
  values <- c()
  if (!missing(specimen_id)) {
    fields <- c(fields, "specimen_id")
    values <- c(values, if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    fields <- c(fields, "specimen_concept_id")
    values <- c(values, if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    fields <- c(fields, "specimen_type_concept_id")
    values <- c(values, if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    fields <- c(fields, "specimen_date")
    values <- c(values, if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    fields <- c(fields, "specimen_datetime")
    values <- c(values, if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    fields <- c(fields, "anatomic_site_concept_id")
    values <- c(values, if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    fields <- c(fields, "disease_status_concept_id")
    values <- c(values, if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    fields <- c(fields, "specimen_source_id")
    values <- c(values, if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    fields <- c(fields, "specimen_source_value")
    values <- c(values, if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    fields <- c(fields, "anatomic_site_source_value")
    values <- c(values, if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    fields <- c(fields, "disease_status_source_value")
    values <- c(values, if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "specimen", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_visit_detail <- function(rowCount, visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    fields <- c(fields, "preceding_visit_detail_id")
    values <- c(values, if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    fields <- c(fields, "visit_detail_parent_id")
    values <- c(values, if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "visit_detail", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cohort <- function(rowCount, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cohort", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cohort_attribute <- function(rowCount, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cohort_attribute", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_condition_era <- function(rowCount, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  fields <- c()
  values <- c()
  if (!missing(condition_era_id)) {
    fields <- c(fields, "condition_era_id")
    values <- c(values, if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    fields <- c(fields, "condition_era_start_date")
    values <- c(values, if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    fields <- c(fields, "condition_era_end_date")
    values <- c(values, if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    fields <- c(fields, "condition_occurrence_count")
    values <- c(values, if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "condition_era", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_dose_era <- function(rowCount, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  fields <- c()
  values <- c()
  if (!missing(dose_era_id)) {
    fields <- c(fields, "dose_era_id")
    values <- c(values, if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    fields <- c(fields, "dose_value")
    values <- c(values, if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    fields <- c(fields, "dose_era_start_date")
    values <- c(values, if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    fields <- c(fields, "dose_era_end_date")
    values <- c(values, if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "dose_era", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_drug_era <- function(rowCount, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  fields <- c()
  values <- c()
  if (!missing(drug_era_id)) {
    fields <- c(fields, "drug_era_id")
    values <- c(values, if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    fields <- c(fields, "drug_era_start_date")
    values <- c(values, if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    fields <- c(fields, "drug_era_end_date")
    values <- c(values, if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    fields <- c(fields, "drug_exposure_count")
    values <- c(values, if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    fields <- c(fields, "gap_days")
    values <- c(values, if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "drug_era", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_payer_plan_period <- function(rowCount, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_concept_id, payer_source_value, payer_source_concept_id, plan_concept_id, plan_source_value, plan_source_concept_id, sponsor_concept_id, sponsor_source_value, sponsor_source_concept_id, family_source_value, stop_reason_concept_id, stop_reason_source_value, stop_reason_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    fields <- c(fields, "payer_plan_period_start_date")
    values <- c(values, if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    fields <- c(fields, "payer_plan_period_end_date")
    values <- c(values, if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_concept_id)) {
    fields <- c(fields, "payer_concept_id")
    values <- c(values, if (is.null(payer_concept_id)) "NULL" else if (is(payer_concept_id, "subQuery")) paste0("(", as.character(payer_concept_id), ")") else paste0("'", as.character(payer_concept_id), "'"))
  }

  if (!missing(payer_source_value)) {
    fields <- c(fields, "payer_source_value")
    values <- c(values, if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(payer_source_concept_id)) {
    fields <- c(fields, "payer_source_concept_id")
    values <- c(values, if (is.null(payer_source_concept_id)) "NULL" else if (is(payer_source_concept_id, "subQuery")) paste0("(", as.character(payer_source_concept_id), ")") else paste0("'", as.character(payer_source_concept_id), "'"))
  }

  if (!missing(plan_concept_id)) {
    fields <- c(fields, "plan_concept_id")
    values <- c(values, if (is.null(plan_concept_id)) "NULL" else if (is(plan_concept_id, "subQuery")) paste0("(", as.character(plan_concept_id), ")") else paste0("'", as.character(plan_concept_id), "'"))
  }

  if (!missing(plan_source_value)) {
    fields <- c(fields, "plan_source_value")
    values <- c(values, if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(plan_source_concept_id)) {
    fields <- c(fields, "plan_source_concept_id")
    values <- c(values, if (is.null(plan_source_concept_id)) "NULL" else if (is(plan_source_concept_id, "subQuery")) paste0("(", as.character(plan_source_concept_id), ")") else paste0("'", as.character(plan_source_concept_id), "'"))
  }

  if (!missing(sponsor_concept_id)) {
    fields <- c(fields, "sponsor_concept_id")
    values <- c(values, if (is.null(sponsor_concept_id)) "NULL" else if (is(sponsor_concept_id, "subQuery")) paste0("(", as.character(sponsor_concept_id), ")") else paste0("'", as.character(sponsor_concept_id), "'"))
  }

  if (!missing(sponsor_source_value)) {
    fields <- c(fields, "sponsor_source_value")
    values <- c(values, if (is.null(sponsor_source_value)) "NULL" else if (is(sponsor_source_value, "subQuery")) paste0("(", as.character(sponsor_source_value), ")") else paste0("'", as.character(sponsor_source_value), "'"))
  }

  if (!missing(sponsor_source_concept_id)) {
    fields <- c(fields, "sponsor_source_concept_id")
    values <- c(values, if (is.null(sponsor_source_concept_id)) "NULL" else if (is(sponsor_source_concept_id, "subQuery")) paste0("(", as.character(sponsor_source_concept_id), ")") else paste0("'", as.character(sponsor_source_concept_id), "'"))
  }

  if (!missing(family_source_value)) {
    fields <- c(fields, "family_source_value")
    values <- c(values, if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  if (!missing(stop_reason_concept_id)) {
    fields <- c(fields, "stop_reason_concept_id")
    values <- c(values, if (is.null(stop_reason_concept_id)) "NULL" else if (is(stop_reason_concept_id, "subQuery")) paste0("(", as.character(stop_reason_concept_id), ")") else paste0("'", as.character(stop_reason_concept_id), "'"))
  }

  if (!missing(stop_reason_source_value)) {
    fields <- c(fields, "stop_reason_source_value")
    values <- c(values, if (is.null(stop_reason_source_value)) "NULL" else if (is(stop_reason_source_value, "subQuery")) paste0("(", as.character(stop_reason_source_value), ")") else paste0("'", as.character(stop_reason_source_value), "'"))
  }

  if (!missing(stop_reason_source_concept_id)) {
    fields <- c(fields, "stop_reason_source_concept_id")
    values <- c(values, if (is.null(stop_reason_source_concept_id)) "NULL" else if (is(stop_reason_source_concept_id, "subQuery")) paste0("(", as.character(stop_reason_source_concept_id), ")") else paste0("'", as.character(stop_reason_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "payer_plan_period", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_location <- function(rowCount, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  fields <- c()
  values <- c()
  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    fields <- c(fields, "address_1")
    values <- c(values, if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    fields <- c(fields, "address_2")
    values <- c(values, if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    fields <- c(fields, "city")
    values <- c(values, if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    fields <- c(fields, "state")
    values <- c(values, if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    fields <- c(fields, "zip")
    values <- c(values, if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    fields <- c(fields, "county")
    values <- c(values, if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    fields <- c(fields, "location_source_value")
    values <- c(values, if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "location", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cdm_source <- function(rowCount, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  fields <- c()
  values <- c()
  if (!missing(cdm_source_name)) {
    fields <- c(fields, "cdm_source_name")
    values <- c(values, if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    fields <- c(fields, "cdm_source_abbreviation")
    values <- c(values, if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    fields <- c(fields, "cdm_holder")
    values <- c(values, if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    fields <- c(fields, "source_description")
    values <- c(values, if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    fields <- c(fields, "source_documentation_reference")
    values <- c(values, if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    fields <- c(fields, "[cdm_etl _reference]")
    values <- c(values, if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    fields <- c(fields, "source_release_date")
    values <- c(values, if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    fields <- c(fields, "cdm_release_date")
    values <- c(values, if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    fields <- c(fields, "cdm_version")
    values <- c(values, if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cdm_source", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_metadata <- function(rowCount, metadata_concept_id, metadata_type_concept_id, name, value_as_string, value_as_concept_id, metadata_date, metadata_datetime) {
  fields <- c()
  values <- c()
  if (!missing(metadata_concept_id)) {
    fields <- c(fields, "metadata_concept_id")
    values <- c(values, if (is.null(metadata_concept_id)) "NULL" else if (is(metadata_concept_id, "subQuery")) paste0("(", as.character(metadata_concept_id), ")") else paste0("'", as.character(metadata_concept_id), "'"))
  }

  if (!missing(metadata_type_concept_id)) {
    fields <- c(fields, "metadata_type_concept_id")
    values <- c(values, if (is.null(metadata_type_concept_id)) "NULL" else if (is(metadata_type_concept_id, "subQuery")) paste0("(", as.character(metadata_type_concept_id), ")") else paste0("'", as.character(metadata_type_concept_id), "'"))
  }

  if (!missing(name)) {
    fields <- c(fields, "name")
    values <- c(values, if (is.null(name)) "NULL" else if (is(name, "subQuery")) paste0("(", as.character(name), ")") else paste0("'", as.character(name), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(metadata_date)) {
    fields <- c(fields, "[metadata date]")
    values <- c(values, if (is.null(metadata_date)) "NULL" else if (is(metadata_date, "subQuery")) paste0("(", as.character(metadata_date), ")") else paste0("'", as.character(metadata_date), "'"))
  }

  if (!missing(metadata_datetime)) {
    fields <- c(fields, "metadata_datetime")
    values <- c(values, if (is.null(metadata_datetime)) "NULL" else if (is(metadata_datetime, "subQuery")) paste0("(", as.character(metadata_datetime), ")") else paste0("'", as.character(metadata_datetime), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "metadata", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_attribute_definition <- function(rowCount, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  fields <- c()
  values <- c()
  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    fields <- c(fields, "attribute_name")
    values <- c(values, if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    fields <- c(fields, "attribute_description")
    values <- c(values, if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    fields <- c(fields, "attribute_type_concept_id")
    values <- c(values, if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    fields <- c(fields, "attribute_syntax")
    values <- c(values, if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "attribute_definition", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cohort_definition <- function(rowCount, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    fields <- c(fields, "cohort_definition_name")
    values <- c(values, if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    fields <- c(fields, "cohort_definition_description")
    values <- c(values, if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    fields <- c(fields, "definition_type_concept_id")
    values <- c(values, if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    fields <- c(fields, "cohort_definition_syntax")
    values <- c(values, if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    fields <- c(fields, "subject_concept_id")
    values <- c(values, if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    fields <- c(fields, "cohort_instantiation_date")
    values <- c(values, if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cohort_definition", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_concept <- function(rowCount, concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(concept_id)) {
    fields <- c(fields, "concept_id")
    values <- c(values, if (is.null(concept_id)) "NULL" else if (is(concept_id, "subQuery")) paste0("(", as.character(concept_id), ")") else paste0("'", as.character(concept_id), "'"))
  }

  if (!missing(concept_name)) {
    fields <- c(fields, "concept_name")
    values <- c(values, if (is.null(concept_name)) "NULL" else if (is(concept_name, "subQuery")) paste0("(", as.character(concept_name), ")") else paste0("'", as.character(concept_name), "'"))
  }

  if (!missing(domain_id)) {
    fields <- c(fields, "domain_id")
    values <- c(values, if (is.null(domain_id)) "NULL" else if (is(domain_id, "subQuery")) paste0("(", as.character(domain_id), ")") else paste0("'", as.character(domain_id), "'"))
  }

  if (!missing(vocabulary_id)) {
    fields <- c(fields, "vocabulary_id")
    values <- c(values, if (is.null(vocabulary_id)) "NULL" else if (is(vocabulary_id, "subQuery")) paste0("(", as.character(vocabulary_id), ")") else paste0("'", as.character(vocabulary_id), "'"))
  }

  if (!missing(concept_class_id)) {
    fields <- c(fields, "concept_class_id")
    values <- c(values, if (is.null(concept_class_id)) "NULL" else if (is(concept_class_id, "subQuery")) paste0("(", as.character(concept_class_id), ")") else paste0("'", as.character(concept_class_id), "'"))
  }

  if (!missing(standard_concept)) {
    fields <- c(fields, "standard_concept")
    values <- c(values, if (is.null(standard_concept)) "NULL" else if (is(standard_concept, "subQuery")) paste0("(", as.character(standard_concept), ")") else paste0("'", as.character(standard_concept), "'"))
  }

  if (!missing(concept_code)) {
    fields <- c(fields, "concept_code")
    values <- c(values, if (is.null(concept_code)) "NULL" else if (is(concept_code, "subQuery")) paste0("(", as.character(concept_code), ")") else paste0("'", as.character(concept_code), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "concept", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_concept_ancestor <- function(rowCount, ancestor_concept_id, descendant_concept_id, min_levels_of_separation, max_levels_of_separation) {
  fields <- c()
  values <- c()
  if (!missing(ancestor_concept_id)) {
    fields <- c(fields, "ancestor_concept_id")
    values <- c(values, if (is.null(ancestor_concept_id)) "NULL" else if (is(ancestor_concept_id, "subQuery")) paste0("(", as.character(ancestor_concept_id), ")") else paste0("'", as.character(ancestor_concept_id), "'"))
  }

  if (!missing(descendant_concept_id)) {
    fields <- c(fields, "descendant_concept_id")
    values <- c(values, if (is.null(descendant_concept_id)) "NULL" else if (is(descendant_concept_id, "subQuery")) paste0("(", as.character(descendant_concept_id), ")") else paste0("'", as.character(descendant_concept_id), "'"))
  }

  if (!missing(min_levels_of_separation)) {
    fields <- c(fields, "min_levels_of_separation")
    values <- c(values, if (is.null(min_levels_of_separation)) "NULL" else if (is(min_levels_of_separation, "subQuery")) paste0("(", as.character(min_levels_of_separation), ")") else paste0("'", as.character(min_levels_of_separation), "'"))
  }

  if (!missing(max_levels_of_separation)) {
    fields <- c(fields, "max_levels_of_separation")
    values <- c(values, if (is.null(max_levels_of_separation)) "NULL" else if (is(max_levels_of_separation, "subQuery")) paste0("(", as.character(max_levels_of_separation), ")") else paste0("'", as.character(max_levels_of_separation), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "concept_ancestor", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_concept_class <- function(rowCount, concept_class_id, concept_class_name, concept_class_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(concept_class_id)) {
    fields <- c(fields, "concept_class_id")
    values <- c(values, if (is.null(concept_class_id)) "NULL" else if (is(concept_class_id, "subQuery")) paste0("(", as.character(concept_class_id), ")") else paste0("'", as.character(concept_class_id), "'"))
  }

  if (!missing(concept_class_name)) {
    fields <- c(fields, "concept_class_name")
    values <- c(values, if (is.null(concept_class_name)) "NULL" else if (is(concept_class_name, "subQuery")) paste0("(", as.character(concept_class_name), ")") else paste0("'", as.character(concept_class_name), "'"))
  }

  if (!missing(concept_class_concept_id)) {
    fields <- c(fields, "concept_class_concept_id")
    values <- c(values, if (is.null(concept_class_concept_id)) "NULL" else if (is(concept_class_concept_id, "subQuery")) paste0("(", as.character(concept_class_concept_id), ")") else paste0("'", as.character(concept_class_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "concept_class", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_concept_relationship <- function(rowCount, concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(concept_id_1)) {
    fields <- c(fields, "concept_id_1")
    values <- c(values, if (is.null(concept_id_1)) "NULL" else if (is(concept_id_1, "subQuery")) paste0("(", as.character(concept_id_1), ")") else paste0("'", as.character(concept_id_1), "'"))
  }

  if (!missing(concept_id_2)) {
    fields <- c(fields, "concept_id_2")
    values <- c(values, if (is.null(concept_id_2)) "NULL" else if (is(concept_id_2, "subQuery")) paste0("(", as.character(concept_id_2), ")") else paste0("'", as.character(concept_id_2), "'"))
  }

  if (!missing(relationship_id)) {
    fields <- c(fields, "relationship_id")
    values <- c(values, if (is.null(relationship_id)) "NULL" else if (is(relationship_id, "subQuery")) paste0("(", as.character(relationship_id), ")") else paste0("'", as.character(relationship_id), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "concept_relationship", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_concept_synonym <- function(rowCount, concept_id, concept_synonym_name, language_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(concept_id)) {
    fields <- c(fields, "concept_id")
    values <- c(values, if (is.null(concept_id)) "NULL" else if (is(concept_id, "subQuery")) paste0("(", as.character(concept_id), ")") else paste0("'", as.character(concept_id), "'"))
  }

  if (!missing(concept_synonym_name)) {
    fields <- c(fields, "concept_synonym_name")
    values <- c(values, if (is.null(concept_synonym_name)) "NULL" else if (is(concept_synonym_name, "subQuery")) paste0("(", as.character(concept_synonym_name), ")") else paste0("'", as.character(concept_synonym_name), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "concept_synonym", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_domain <- function(rowCount, domain_id, domain_name, domain_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_id)) {
    fields <- c(fields, "domain_id")
    values <- c(values, if (is.null(domain_id)) "NULL" else if (is(domain_id, "subQuery")) paste0("(", as.character(domain_id), ")") else paste0("'", as.character(domain_id), "'"))
  }

  if (!missing(domain_name)) {
    fields <- c(fields, "domain_name")
    values <- c(values, if (is.null(domain_name)) "NULL" else if (is(domain_name, "subQuery")) paste0("(", as.character(domain_name), ")") else paste0("'", as.character(domain_name), "'"))
  }

  if (!missing(domain_concept_id)) {
    fields <- c(fields, "domain_concept_id")
    values <- c(values, if (is.null(domain_concept_id)) "NULL" else if (is(domain_concept_id, "subQuery")) paste0("(", as.character(domain_concept_id), ")") else paste0("'", as.character(domain_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "domain", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_drug_strength <- function(rowCount, drug_concept_id, ingredient_concept_id, amount_value, amount_unit_concept_id, numerator_value, numerator_unit_concept_id, denominator_value, denominator_unit_concept_id, box_size, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(ingredient_concept_id)) {
    fields <- c(fields, "ingredient_concept_id")
    values <- c(values, if (is.null(ingredient_concept_id)) "NULL" else if (is(ingredient_concept_id, "subQuery")) paste0("(", as.character(ingredient_concept_id), ")") else paste0("'", as.character(ingredient_concept_id), "'"))
  }

  if (!missing(amount_value)) {
    fields <- c(fields, "amount_value")
    values <- c(values, if (is.null(amount_value)) "NULL" else if (is(amount_value, "subQuery")) paste0("(", as.character(amount_value), ")") else paste0("'", as.character(amount_value), "'"))
  }

  if (!missing(amount_unit_concept_id)) {
    fields <- c(fields, "amount_unit_concept_id")
    values <- c(values, if (is.null(amount_unit_concept_id)) "NULL" else if (is(amount_unit_concept_id, "subQuery")) paste0("(", as.character(amount_unit_concept_id), ")") else paste0("'", as.character(amount_unit_concept_id), "'"))
  }

  if (!missing(numerator_value)) {
    fields <- c(fields, "numerator_value")
    values <- c(values, if (is.null(numerator_value)) "NULL" else if (is(numerator_value, "subQuery")) paste0("(", as.character(numerator_value), ")") else paste0("'", as.character(numerator_value), "'"))
  }

  if (!missing(numerator_unit_concept_id)) {
    fields <- c(fields, "numerator_unit_concept_id")
    values <- c(values, if (is.null(numerator_unit_concept_id)) "NULL" else if (is(numerator_unit_concept_id, "subQuery")) paste0("(", as.character(numerator_unit_concept_id), ")") else paste0("'", as.character(numerator_unit_concept_id), "'"))
  }

  if (!missing(denominator_value)) {
    fields <- c(fields, "denominator_value")
    values <- c(values, if (is.null(denominator_value)) "NULL" else if (is(denominator_value, "subQuery")) paste0("(", as.character(denominator_value), ")") else paste0("'", as.character(denominator_value), "'"))
  }

  if (!missing(denominator_unit_concept_id)) {
    fields <- c(fields, "denominator_unit_concept_id")
    values <- c(values, if (is.null(denominator_unit_concept_id)) "NULL" else if (is(denominator_unit_concept_id, "subQuery")) paste0("(", as.character(denominator_unit_concept_id), ")") else paste0("'", as.character(denominator_unit_concept_id), "'"))
  }

  if (!missing(box_size)) {
    fields <- c(fields, "box_size")
    values <- c(values, if (is.null(box_size)) "NULL" else if (is(box_size, "subQuery")) paste0("(", as.character(box_size), ")") else paste0("'", as.character(box_size), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "drug_strength", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_relationship <- function(rowCount, relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(relationship_id)) {
    fields <- c(fields, "relationship_id")
    values <- c(values, if (is.null(relationship_id)) "NULL" else if (is(relationship_id, "subQuery")) paste0("(", as.character(relationship_id), ")") else paste0("'", as.character(relationship_id), "'"))
  }

  if (!missing(relationship_name)) {
    fields <- c(fields, "relationship_name")
    values <- c(values, if (is.null(relationship_name)) "NULL" else if (is(relationship_name, "subQuery")) paste0("(", as.character(relationship_name), ")") else paste0("'", as.character(relationship_name), "'"))
  }

  if (!missing(is_hierarchical)) {
    fields <- c(fields, "is_hierarchical")
    values <- c(values, if (is.null(is_hierarchical)) "NULL" else if (is(is_hierarchical, "subQuery")) paste0("(", as.character(is_hierarchical), ")") else paste0("'", as.character(is_hierarchical), "'"))
  }

  if (!missing(defines_ancestry)) {
    fields <- c(fields, "defines_ancestry")
    values <- c(values, if (is.null(defines_ancestry)) "NULL" else if (is(defines_ancestry, "subQuery")) paste0("(", as.character(defines_ancestry), ")") else paste0("'", as.character(defines_ancestry), "'"))
  }

  if (!missing(reverse_relationship_id)) {
    fields <- c(fields, "reverse_relationship_id")
    values <- c(values, if (is.null(reverse_relationship_id)) "NULL" else if (is(reverse_relationship_id, "subQuery")) paste0("(", as.character(reverse_relationship_id), ")") else paste0("'", as.character(reverse_relationship_id), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "relationship", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_source_to_concept_map <- function(rowCount, source_code, source_concept_id, source_vocabulary_id, source_code_description, target_concept_id, target_vocabulary_id, valid_start_date, valid_end_date, invalid_reason) {
  fields <- c()
  values <- c()
  if (!missing(source_code)) {
    fields <- c(fields, "source_code")
    values <- c(values, if (is.null(source_code)) "NULL" else if (is(source_code, "subQuery")) paste0("(", as.character(source_code), ")") else paste0("'", as.character(source_code), "'"))
  }

  if (!missing(source_concept_id)) {
    fields <- c(fields, "source_concept_id")
    values <- c(values, if (is.null(source_concept_id)) "NULL" else if (is(source_concept_id, "subQuery")) paste0("(", as.character(source_concept_id), ")") else paste0("'", as.character(source_concept_id), "'"))
  }

  if (!missing(source_vocabulary_id)) {
    fields <- c(fields, "source_vocabulary_id")
    values <- c(values, if (is.null(source_vocabulary_id)) "NULL" else if (is(source_vocabulary_id, "subQuery")) paste0("(", as.character(source_vocabulary_id), ")") else paste0("'", as.character(source_vocabulary_id), "'"))
  }

  if (!missing(source_code_description)) {
    fields <- c(fields, "source_code_description")
    values <- c(values, if (is.null(source_code_description)) "NULL" else if (is(source_code_description, "subQuery")) paste0("(", as.character(source_code_description), ")") else paste0("'", as.character(source_code_description), "'"))
  }

  if (!missing(target_concept_id)) {
    fields <- c(fields, "target_concept_id")
    values <- c(values, if (is.null(target_concept_id)) "NULL" else if (is(target_concept_id, "subQuery")) paste0("(", as.character(target_concept_id), ")") else paste0("'", as.character(target_concept_id), "'"))
  }

  if (!missing(target_vocabulary_id)) {
    fields <- c(fields, "target_vocabulary_id")
    values <- c(values, if (is.null(target_vocabulary_id)) "NULL" else if (is(target_vocabulary_id, "subQuery")) paste0("(", as.character(target_vocabulary_id), ")") else paste0("'", as.character(target_vocabulary_id), "'"))
  }

  if (!missing(valid_start_date)) {
    fields <- c(fields, "valid_start_date")
    values <- c(values, if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    fields <- c(fields, "valid_end_date")
    values <- c(values, if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    fields <- c(fields, "invalid_reason")
    values <- c(values, if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "source_to_concept_map", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_vocabulary <- function(rowCount, vocabulary_id, vocabulary_name, vocabulary_reference, vocabulary_version, vocabulary_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(vocabulary_id)) {
    fields <- c(fields, "vocabulary_id")
    values <- c(values, if (is.null(vocabulary_id)) "NULL" else if (is(vocabulary_id, "subQuery")) paste0("(", as.character(vocabulary_id), ")") else paste0("'", as.character(vocabulary_id), "'"))
  }

  if (!missing(vocabulary_name)) {
    fields <- c(fields, "vocabulary_name")
    values <- c(values, if (is.null(vocabulary_name)) "NULL" else if (is(vocabulary_name, "subQuery")) paste0("(", as.character(vocabulary_name), ")") else paste0("'", as.character(vocabulary_name), "'"))
  }

  if (!missing(vocabulary_reference)) {
    fields <- c(fields, "vocabulary_reference")
    values <- c(values, if (is.null(vocabulary_reference)) "NULL" else if (is(vocabulary_reference, "subQuery")) paste0("(", as.character(vocabulary_reference), ")") else paste0("'", as.character(vocabulary_reference), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  if (!missing(vocabulary_concept_id)) {
    fields <- c(fields, "vocabulary_concept_id")
    values <- c(values, if (is.null(vocabulary_concept_id)) "NULL" else if (is(vocabulary_concept_id, "subQuery")) paste0("(", as.character(vocabulary_concept_id), ")") else paste0("'", as.character(vocabulary_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "vocabulary", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

lookup_cost <- function(fetchField, cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cost WHERE')
  first <- TRUE
  if (!missing(cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_id = ", if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_event_id = ", if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_domain_id = ", if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_type_concept_id = ", if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " currency_concept_id = ", if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " total_charge = ", if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " total_cost = ", if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " total_paid = ", if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_by_payer = ", if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_by_patient = ", if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_patient_copay = ", if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_patient_coinsurance = ", if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_patient_deductible = ", if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_by_primary = ", if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_ingredient_cost = ", if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_dispensing_fee = ", if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_id = ", if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " amount_allowed = ", if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " revenue_code_concept_id = ", if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " revenue_code_source_value = ", if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drg_concept_id = ", if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drg_source_value = ", if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_visit_occurrence <- function(fetchField, visit_occurrence_id, person_id, visit_concept_id, visit_source_value, visit_start_date, visit_end_date, care_site_id, visit_start_datetime, visit_end_datetime, visit_type_concept_id, provider_id, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.visit_occurrence WHERE')
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_concept_id = ", if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_value = ", if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_date = ", if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_date = ", if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_datetime = ", if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_datetime = ", if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_type_concept_id = ", if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_concept_id = ", if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_concept_id = ", if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_value = ", if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_concept_id = ", if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_source_value = ", if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " preceding_visit_occurrence_id = ", if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_person <- function(fetchField, person_id, person_source_value, year_of_birth, month_of_birth, gender_concept_id, gender_source_value, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.person WHERE')
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_source_value = ", if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " year_of_birth = ", if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " month_of_birth = ", if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_concept_id = ", if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_value = ", if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " day_of_birth = ", if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " birth_datetime = ", if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " race_concept_id = ", if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " ethnicity_concept_id = ", if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_id = ", if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_concept_id = ", if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " race_source_value = ", if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " race_source_concept_id = ", if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " ethnicity_source_value = ", if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " ethnicity_source_concept_id = ", if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_observation_period <- function(fetchField, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.observation_period WHERE')
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_period_id = ", if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_period_start_date = ", if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_period_end_date = ", if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " period_type_concept_id = ", if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_death <- function(fetchField, person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.death WHERE')
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " death_date = ", if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " death_datetime = ", if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " death_type_concept_id = ", if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cause_concept_id = ", if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cause_source_value = ", if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cause_source_concept_id = ", if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_condition_occurrence <- function(fetchField, condition_occurrence_id, person_id, visit_occurrence_id, condition_type_concept_id, condition_start_date, condition_end_date, condition_concept_id, condition_source_value, condition_source_concept_id, provider_id, condition_start_datetime, condition_end_datetime, stop_reason, visit_detail_id, condition_status_source_value, condition_status_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.condition_occurrence WHERE')
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_occurrence_id = ", if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_type_concept_id = ", if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_start_date = ", if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_end_date = ", if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_concept_id = ", if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_source_value = ", if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_source_concept_id = ", if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(condition_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_start_datetime = ", if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_end_datetime = ", if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " stop_reason = ", if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_status_source_value = ", if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_status_concept_id = ", if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_measurement <- function(fetchField, measurement_id, visit_occurrence_id, person_id, measurement_type_concept_id, measurement_date, measurement_concept_id, measurement_source_value, measurement_source_concept_id, provider_id, measurement_datetime, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, visit_detail_id, unit_source_value, value_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.measurement WHERE')
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_id = ", if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_type_concept_id = ", if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_date = ", if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_concept_id = ", if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_source_value = ", if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_source_concept_id = ", if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(measurement_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_datetime = ", if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " operator_concept_id = ", if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_number = ", if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_concept_id = ", if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " range_low = ", if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " range_high = ", if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_source_value = ", if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_source_value = ", if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_observation <- function(fetchField, observation_id, visit_occurrence_id, person_id, observation_type_concept_id, observation_date, observation_concept_id, observation_source_concept_id, observation_source_value, provider_id, observation_datetime, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, visit_detail_id, unit_source_value, qualifier_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.observation WHERE')
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_id = ", if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_type_concept_id = ", if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_date = ", if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_concept_id = ", if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_source_concept_id = ", if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_source_value = ", if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(observation_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_datetime = ", if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_number = ", if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_string = ", if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_concept_id = ", if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " qualifier_concept_id = ", if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_source_value = ", if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " qualifier_source_value = ", if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_procedure_occurrence <- function(fetchField, procedure_occurrence_id, visit_occurrence_id, person_id, procedure_type_concept_id, procedure_date, procedure_concept_id, procedure_source_concept_id, procedure_source_value, provider_id, procedure_datetime, modifier_concept_id, quantity, visit_detail_id, modifier_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.procedure_occurrence WHERE')
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_occurrence_id = ", if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_type_concept_id = ", if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_date = ", if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_concept_id = ", if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_source_concept_id = ", if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_source_value = ", if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(procedure_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_datetime = ", if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " modifier_concept_id = ", if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(modifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " modifier_source_value = ", if (is.null(modifier_source_value)) "NULL" else if (is(modifier_source_value, "subQuery")) paste0("(", as.character(modifier_source_value), ")") else paste0("'", as.character(modifier_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_drug_exposure <- function(fetchField, drug_exposure_id, visit_occurrence_id, person_id, drug_type_concept_id, drug_exposure_start_date, drug_exposure_end_date, days_supply, drug_concept_id, drug_source_value, sig, provider_id, quantity, dose_unit_source_value, drug_source_concept_id, drug_exposure_end_datetime, verbatim_end_date, stop_reason, refills, drug_exposure_start_datetime, route_concept_id, lot_number, visit_detail_id, route_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.drug_exposure WHERE')
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_id = ", if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_type_concept_id = ", if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_start_date = ", if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_end_date = ", if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " days_supply = ", if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_concept_id = ", if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_source_value = ", if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " sig = ", if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_unit_source_value = ", if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_source_concept_id = ", if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_end_datetime = ", if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " verbatim_end_date = ", if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " stop_reason = ", if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " refills = ", if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_start_datetime = ", if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " route_concept_id = ", if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " lot_number = ", if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " route_source_value = ", if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_care_site <- function(fetchField, care_site_id, care_site_source_value, care_site_name, place_of_service_concept_id, location_id, place_of_service_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.care_site WHERE')
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_source_value = ", if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_name = ", if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " place_of_service_concept_id = ", if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_id = ", if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " place_of_service_source_value = ", if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_provider <- function(fetchField, provider_id, provider_source_value, specialty_concept_id, specialty_source_value, provider_name, npi, dea, care_site_id, year_of_birth, gender_concept_id, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.provider WHERE')
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_source_value = ", if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specialty_concept_id = ", if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specialty_source_value = ", if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_name = ", if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " npi = ", if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dea = ", if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " year_of_birth = ", if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_concept_id = ", if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specialty_source_concept_id = ", if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_value = ", if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_concept_id = ", if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_device_exposure <- function(fetchField, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, visit_detail_id, device_source_value, device_source__concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.device_exposure WHERE')
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_id = ", if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_concept_id = ", if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_start_date = ", if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_start_datetime = ", if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_end_date = ", if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_end_datetime = ", if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_type_concept_id = ", if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unique_device_id = ", if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_source_value = ", if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " [device_source_ concept_id] = ", if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_fact_relationship <- function(fetchField, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.fact_relationship WHERE')
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " domain_concept_id_1 = ", if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " fact_id_1 = ", if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " domain_concept_id_2 = ", if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " fact_id_2 = ", if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " relationship_concept_id = ", if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_note <- function(fetchField, note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, visit_occurrence_id, visit_detail_id, note_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.note WHERE')
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_id = ", if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_date = ", if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_datetime = ", if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_type_concept_id = ", if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_class_concept_id = ", if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_title = ", if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_text = ", if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " encoding_concept_id = ", if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " language_concept_id = ", if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_source_value = ", if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_note_nlp <- function(fetchField, note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.note_nlp WHERE')
  first <- TRUE
  if (!missing(note_nlp_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_nlp_id = ", if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_id = ", if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " section_concept_id = ", if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " snippet = ", if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " offset = ", if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " lexical_variant = ", if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_nlp_concept_id = ", if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_nlp_source_concept_id = ", if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " nlp_system = ", if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " nlp_date = ", if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " nlp_date_time = ", if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " term_exists = ", if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " term_temporal = ", if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " term_modifiers = ", if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_specimen <- function(fetchField, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.specimen WHERE')
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_id = ", if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_concept_id = ", if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_type_concept_id = ", if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_date = ", if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_datetime = ", if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " anatomic_site_concept_id = ", if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " disease_status_concept_id = ", if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_source_id = ", if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_source_value = ", if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_source_value = ", if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " anatomic_site_source_value = ", if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " disease_status_source_value = ", if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_visit_detail <- function(fetchField, visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.visit_detail WHERE')
  first <- TRUE
  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_concept_id = ", if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_date = ", if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_datetime = ", if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_date = ", if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_datetime = ", if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_type_concept_id = ", if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_value = ", if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_concept_id = ", if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_value = ", if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_concept_id = ", if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_source_value = ", if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_concept_id = ", if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " preceding_visit_detail_id = ", if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_parent_id = ", if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort <- function(fetchField, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cohort WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_id = ", if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " subject_id = ", if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_start_date = ", if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_end_date = ", if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort_attribute <- function(fetchField, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cohort_attribute WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_id = ", if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " subject_id = ", if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_start_date = ", if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_end_date = ", if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_definition_id = ", if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_number = ", if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_concept_id = ", if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_condition_era <- function(fetchField, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.condition_era WHERE')
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_era_id = ", if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_concept_id = ", if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_era_start_date = ", if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_era_end_date = ", if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_occurrence_count = ", if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_dose_era <- function(fetchField, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.dose_era WHERE')
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_era_id = ", if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_concept_id = ", if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_value = ", if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_era_start_date = ", if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_era_end_date = ", if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_drug_era <- function(fetchField, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.drug_era WHERE')
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_era_id = ", if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_concept_id = ", if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_era_start_date = ", if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_era_end_date = ", if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_count = ", if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gap_days = ", if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_payer_plan_period <- function(fetchField, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_concept_id, payer_source_value, payer_source_concept_id, plan_concept_id, plan_source_value, plan_source_concept_id, sponsor_concept_id, sponsor_source_value, sponsor_source_concept_id, family_source_value, stop_reason_concept_id, stop_reason_source_value, stop_reason_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.payer_plan_period WHERE')
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_id = ", if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_start_date = ", if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_end_date = ", if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_concept_id = ", if (is.null(payer_concept_id)) "NULL" else if (is(payer_concept_id, "subQuery")) paste0("(", as.character(payer_concept_id), ")") else paste0("'", as.character(payer_concept_id), "'"))
  }

  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_source_value = ", if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(payer_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_source_concept_id = ", if (is.null(payer_source_concept_id)) "NULL" else if (is(payer_source_concept_id, "subQuery")) paste0("(", as.character(payer_source_concept_id), ")") else paste0("'", as.character(payer_source_concept_id), "'"))
  }

  if (!missing(plan_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " plan_concept_id = ", if (is.null(plan_concept_id)) "NULL" else if (is(plan_concept_id, "subQuery")) paste0("(", as.character(plan_concept_id), ")") else paste0("'", as.character(plan_concept_id), "'"))
  }

  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " plan_source_value = ", if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(plan_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " plan_source_concept_id = ", if (is.null(plan_source_concept_id)) "NULL" else if (is(plan_source_concept_id, "subQuery")) paste0("(", as.character(plan_source_concept_id), ")") else paste0("'", as.character(plan_source_concept_id), "'"))
  }

  if (!missing(sponsor_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " sponsor_concept_id = ", if (is.null(sponsor_concept_id)) "NULL" else if (is(sponsor_concept_id, "subQuery")) paste0("(", as.character(sponsor_concept_id), ")") else paste0("'", as.character(sponsor_concept_id), "'"))
  }

  if (!missing(sponsor_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " sponsor_source_value = ", if (is.null(sponsor_source_value)) "NULL" else if (is(sponsor_source_value, "subQuery")) paste0("(", as.character(sponsor_source_value), ")") else paste0("'", as.character(sponsor_source_value), "'"))
  }

  if (!missing(sponsor_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " sponsor_source_concept_id = ", if (is.null(sponsor_source_concept_id)) "NULL" else if (is(sponsor_source_concept_id, "subQuery")) paste0("(", as.character(sponsor_source_concept_id), ")") else paste0("'", as.character(sponsor_source_concept_id), "'"))
  }

  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " family_source_value = ", if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  if (!missing(stop_reason_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " stop_reason_concept_id = ", if (is.null(stop_reason_concept_id)) "NULL" else if (is(stop_reason_concept_id, "subQuery")) paste0("(", as.character(stop_reason_concept_id), ")") else paste0("'", as.character(stop_reason_concept_id), "'"))
  }

  if (!missing(stop_reason_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " stop_reason_source_value = ", if (is.null(stop_reason_source_value)) "NULL" else if (is(stop_reason_source_value, "subQuery")) paste0("(", as.character(stop_reason_source_value), ")") else paste0("'", as.character(stop_reason_source_value), "'"))
  }

  if (!missing(stop_reason_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " stop_reason_source_concept_id = ", if (is.null(stop_reason_source_concept_id)) "NULL" else if (is(stop_reason_source_concept_id, "subQuery")) paste0("(", as.character(stop_reason_source_concept_id), ")") else paste0("'", as.character(stop_reason_source_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_location <- function(fetchField, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.location WHERE')
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_id = ", if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " address_1 = ", if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " address_2 = ", if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " city = ", if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " state = ", if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " zip = ", if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " county = ", if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_source_value = ", if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cdm_source <- function(fetchField, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cdm_source WHERE')
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_source_name = ", if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_source_abbreviation = ", if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_holder = ", if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_description = ", if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_documentation_reference = ", if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " [cdm_etl _reference] = ", if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_release_date = ", if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_release_date = ", if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_version = ", if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " vocabulary_version = ", if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_metadata <- function(fetchField, metadata_concept_id, metadata_type_concept_id, name, value_as_string, value_as_concept_id, metadata_date, metadata_datetime) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.metadata WHERE')
  first <- TRUE
  if (!missing(metadata_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " metadata_concept_id = ", if (is.null(metadata_concept_id)) "NULL" else if (is(metadata_concept_id, "subQuery")) paste0("(", as.character(metadata_concept_id), ")") else paste0("'", as.character(metadata_concept_id), "'"))
  }

  if (!missing(metadata_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " metadata_type_concept_id = ", if (is.null(metadata_type_concept_id)) "NULL" else if (is(metadata_type_concept_id, "subQuery")) paste0("(", as.character(metadata_type_concept_id), ")") else paste0("'", as.character(metadata_type_concept_id), "'"))
  }

  if (!missing(name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " name = ", if (is.null(name)) "NULL" else if (is(name, "subQuery")) paste0("(", as.character(name), ")") else paste0("'", as.character(name), "'"))
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_string = ", if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_concept_id = ", if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(metadata_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " [metadata date] = ", if (is.null(metadata_date)) "NULL" else if (is(metadata_date, "subQuery")) paste0("(", as.character(metadata_date), ")") else paste0("'", as.character(metadata_date), "'"))
  }

  if (!missing(metadata_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " metadata_datetime = ", if (is.null(metadata_datetime)) "NULL" else if (is(metadata_datetime, "subQuery")) paste0("(", as.character(metadata_datetime), ")") else paste0("'", as.character(metadata_datetime), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_attribute_definition <- function(fetchField, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.attribute_definition WHERE')
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_definition_id = ", if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_name = ", if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_description = ", if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_type_concept_id = ", if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_syntax = ", if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort_definition <- function(fetchField, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cohort_definition WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_id = ", if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_name = ", if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_description = ", if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " definition_type_concept_id = ", if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_syntax = ", if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " subject_concept_id = ", if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_instantiation_date = ", if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_concept <- function(fetchField, concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.concept WHERE')
  first <- TRUE
  if (!missing(concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " concept_id = ", if (is.null(concept_id)) "NULL" else if (is(concept_id, "subQuery")) paste0("(", as.character(concept_id), ")") else paste0("'", as.character(concept_id), "'"))
  }

  if (!missing(concept_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " concept_name = ", if (is.null(concept_name)) "NULL" else if (is(concept_name, "subQuery")) paste0("(", as.character(concept_name), ")") else paste0("'", as.character(concept_name), "'"))
  }

  if (!missing(domain_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " domain_id = ", if (is.null(domain_id)) "NULL" else if (is(domain_id, "subQuery")) paste0("(", as.character(domain_id), ")") else paste0("'", as.character(domain_id), "'"))
  }

  if (!missing(vocabulary_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " vocabulary_id = ", if (is.null(vocabulary_id)) "NULL" else if (is(vocabulary_id, "subQuery")) paste0("(", as.character(vocabulary_id), ")") else paste0("'", as.character(vocabulary_id), "'"))
  }

  if (!missing(concept_class_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " concept_class_id = ", if (is.null(concept_class_id)) "NULL" else if (is(concept_class_id, "subQuery")) paste0("(", as.character(concept_class_id), ")") else paste0("'", as.character(concept_class_id), "'"))
  }

  if (!missing(standard_concept)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " standard_concept = ", if (is.null(standard_concept)) "NULL" else if (is(standard_concept, "subQuery")) paste0("(", as.character(standard_concept), ")") else paste0("'", as.character(standard_concept), "'"))
  }

  if (!missing(concept_code)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " concept_code = ", if (is.null(concept_code)) "NULL" else if (is(concept_code, "subQuery")) paste0("(", as.character(concept_code), ")") else paste0("'", as.character(concept_code), "'"))
  }

  if (!missing(valid_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " valid_start_date = ", if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " valid_end_date = ", if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " invalid_reason = ", if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_concept_ancestor <- function(fetchField, ancestor_concept_id, descendant_concept_id, min_levels_of_separation, max_levels_of_separation) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.concept_ancestor WHERE')
  first <- TRUE
  if (!missing(ancestor_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " ancestor_concept_id = ", if (is.null(ancestor_concept_id)) "NULL" else if (is(ancestor_concept_id, "subQuery")) paste0("(", as.character(ancestor_concept_id), ")") else paste0("'", as.character(ancestor_concept_id), "'"))
  }

  if (!missing(descendant_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " descendant_concept_id = ", if (is.null(descendant_concept_id)) "NULL" else if (is(descendant_concept_id, "subQuery")) paste0("(", as.character(descendant_concept_id), ")") else paste0("'", as.character(descendant_concept_id), "'"))
  }

  if (!missing(min_levels_of_separation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " min_levels_of_separation = ", if (is.null(min_levels_of_separation)) "NULL" else if (is(min_levels_of_separation, "subQuery")) paste0("(", as.character(min_levels_of_separation), ")") else paste0("'", as.character(min_levels_of_separation), "'"))
  }

  if (!missing(max_levels_of_separation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " max_levels_of_separation = ", if (is.null(max_levels_of_separation)) "NULL" else if (is(max_levels_of_separation, "subQuery")) paste0("(", as.character(max_levels_of_separation), ")") else paste0("'", as.character(max_levels_of_separation), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_concept_class <- function(fetchField, concept_class_id, concept_class_name, concept_class_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.concept_class WHERE')
  first <- TRUE
  if (!missing(concept_class_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " concept_class_id = ", if (is.null(concept_class_id)) "NULL" else if (is(concept_class_id, "subQuery")) paste0("(", as.character(concept_class_id), ")") else paste0("'", as.character(concept_class_id), "'"))
  }

  if (!missing(concept_class_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " concept_class_name = ", if (is.null(concept_class_name)) "NULL" else if (is(concept_class_name, "subQuery")) paste0("(", as.character(concept_class_name), ")") else paste0("'", as.character(concept_class_name), "'"))
  }

  if (!missing(concept_class_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " concept_class_concept_id = ", if (is.null(concept_class_concept_id)) "NULL" else if (is(concept_class_concept_id, "subQuery")) paste0("(", as.character(concept_class_concept_id), ")") else paste0("'", as.character(concept_class_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_concept_relationship <- function(fetchField, concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.concept_relationship WHERE')
  first <- TRUE
  if (!missing(concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " concept_id_1 = ", if (is.null(concept_id_1)) "NULL" else if (is(concept_id_1, "subQuery")) paste0("(", as.character(concept_id_1), ")") else paste0("'", as.character(concept_id_1), "'"))
  }

  if (!missing(concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " concept_id_2 = ", if (is.null(concept_id_2)) "NULL" else if (is(concept_id_2, "subQuery")) paste0("(", as.character(concept_id_2), ")") else paste0("'", as.character(concept_id_2), "'"))
  }

  if (!missing(relationship_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " relationship_id = ", if (is.null(relationship_id)) "NULL" else if (is(relationship_id, "subQuery")) paste0("(", as.character(relationship_id), ")") else paste0("'", as.character(relationship_id), "'"))
  }

  if (!missing(valid_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " valid_start_date = ", if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " valid_end_date = ", if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " invalid_reason = ", if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_concept_synonym <- function(fetchField, concept_id, concept_synonym_name, language_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.concept_synonym WHERE')
  first <- TRUE
  if (!missing(concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " concept_id = ", if (is.null(concept_id)) "NULL" else if (is(concept_id, "subQuery")) paste0("(", as.character(concept_id), ")") else paste0("'", as.character(concept_id), "'"))
  }

  if (!missing(concept_synonym_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " concept_synonym_name = ", if (is.null(concept_synonym_name)) "NULL" else if (is(concept_synonym_name, "subQuery")) paste0("(", as.character(concept_synonym_name), ")") else paste0("'", as.character(concept_synonym_name), "'"))
  }

  if (!missing(language_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " language_concept_id = ", if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_domain <- function(fetchField, domain_id, domain_name, domain_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.domain WHERE')
  first <- TRUE
  if (!missing(domain_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " domain_id = ", if (is.null(domain_id)) "NULL" else if (is(domain_id, "subQuery")) paste0("(", as.character(domain_id), ")") else paste0("'", as.character(domain_id), "'"))
  }

  if (!missing(domain_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " domain_name = ", if (is.null(domain_name)) "NULL" else if (is(domain_name, "subQuery")) paste0("(", as.character(domain_name), ")") else paste0("'", as.character(domain_name), "'"))
  }

  if (!missing(domain_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " domain_concept_id = ", if (is.null(domain_concept_id)) "NULL" else if (is(domain_concept_id, "subQuery")) paste0("(", as.character(domain_concept_id), ")") else paste0("'", as.character(domain_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_drug_strength <- function(fetchField, drug_concept_id, ingredient_concept_id, amount_value, amount_unit_concept_id, numerator_value, numerator_unit_concept_id, denominator_value, denominator_unit_concept_id, box_size, valid_start_date, valid_end_date, invalid_reason) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.drug_strength WHERE')
  first <- TRUE
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_concept_id = ", if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(ingredient_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " ingredient_concept_id = ", if (is.null(ingredient_concept_id)) "NULL" else if (is(ingredient_concept_id, "subQuery")) paste0("(", as.character(ingredient_concept_id), ")") else paste0("'", as.character(ingredient_concept_id), "'"))
  }

  if (!missing(amount_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " amount_value = ", if (is.null(amount_value)) "NULL" else if (is(amount_value, "subQuery")) paste0("(", as.character(amount_value), ")") else paste0("'", as.character(amount_value), "'"))
  }

  if (!missing(amount_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " amount_unit_concept_id = ", if (is.null(amount_unit_concept_id)) "NULL" else if (is(amount_unit_concept_id, "subQuery")) paste0("(", as.character(amount_unit_concept_id), ")") else paste0("'", as.character(amount_unit_concept_id), "'"))
  }

  if (!missing(numerator_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " numerator_value = ", if (is.null(numerator_value)) "NULL" else if (is(numerator_value, "subQuery")) paste0("(", as.character(numerator_value), ")") else paste0("'", as.character(numerator_value), "'"))
  }

  if (!missing(numerator_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " numerator_unit_concept_id = ", if (is.null(numerator_unit_concept_id)) "NULL" else if (is(numerator_unit_concept_id, "subQuery")) paste0("(", as.character(numerator_unit_concept_id), ")") else paste0("'", as.character(numerator_unit_concept_id), "'"))
  }

  if (!missing(denominator_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " denominator_value = ", if (is.null(denominator_value)) "NULL" else if (is(denominator_value, "subQuery")) paste0("(", as.character(denominator_value), ")") else paste0("'", as.character(denominator_value), "'"))
  }

  if (!missing(denominator_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " denominator_unit_concept_id = ", if (is.null(denominator_unit_concept_id)) "NULL" else if (is(denominator_unit_concept_id, "subQuery")) paste0("(", as.character(denominator_unit_concept_id), ")") else paste0("'", as.character(denominator_unit_concept_id), "'"))
  }

  if (!missing(box_size)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " box_size = ", if (is.null(box_size)) "NULL" else if (is(box_size, "subQuery")) paste0("(", as.character(box_size), ")") else paste0("'", as.character(box_size), "'"))
  }

  if (!missing(valid_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " valid_start_date = ", if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " valid_end_date = ", if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " invalid_reason = ", if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_relationship <- function(fetchField, relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.relationship WHERE')
  first <- TRUE
  if (!missing(relationship_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " relationship_id = ", if (is.null(relationship_id)) "NULL" else if (is(relationship_id, "subQuery")) paste0("(", as.character(relationship_id), ")") else paste0("'", as.character(relationship_id), "'"))
  }

  if (!missing(relationship_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " relationship_name = ", if (is.null(relationship_name)) "NULL" else if (is(relationship_name, "subQuery")) paste0("(", as.character(relationship_name), ")") else paste0("'", as.character(relationship_name), "'"))
  }

  if (!missing(is_hierarchical)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " is_hierarchical = ", if (is.null(is_hierarchical)) "NULL" else if (is(is_hierarchical, "subQuery")) paste0("(", as.character(is_hierarchical), ")") else paste0("'", as.character(is_hierarchical), "'"))
  }

  if (!missing(defines_ancestry)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " defines_ancestry = ", if (is.null(defines_ancestry)) "NULL" else if (is(defines_ancestry, "subQuery")) paste0("(", as.character(defines_ancestry), ")") else paste0("'", as.character(defines_ancestry), "'"))
  }

  if (!missing(reverse_relationship_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " reverse_relationship_id = ", if (is.null(reverse_relationship_id)) "NULL" else if (is(reverse_relationship_id, "subQuery")) paste0("(", as.character(reverse_relationship_id), ")") else paste0("'", as.character(reverse_relationship_id), "'"))
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " relationship_concept_id = ", if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_source_to_concept_map <- function(fetchField, source_code, source_concept_id, source_vocabulary_id, source_code_description, target_concept_id, target_vocabulary_id, valid_start_date, valid_end_date, invalid_reason) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.source_to_concept_map WHERE')
  first <- TRUE
  if (!missing(source_code)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_code = ", if (is.null(source_code)) "NULL" else if (is(source_code, "subQuery")) paste0("(", as.character(source_code), ")") else paste0("'", as.character(source_code), "'"))
  }

  if (!missing(source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_concept_id = ", if (is.null(source_concept_id)) "NULL" else if (is(source_concept_id, "subQuery")) paste0("(", as.character(source_concept_id), ")") else paste0("'", as.character(source_concept_id), "'"))
  }

  if (!missing(source_vocabulary_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_vocabulary_id = ", if (is.null(source_vocabulary_id)) "NULL" else if (is(source_vocabulary_id, "subQuery")) paste0("(", as.character(source_vocabulary_id), ")") else paste0("'", as.character(source_vocabulary_id), "'"))
  }

  if (!missing(source_code_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_code_description = ", if (is.null(source_code_description)) "NULL" else if (is(source_code_description, "subQuery")) paste0("(", as.character(source_code_description), ")") else paste0("'", as.character(source_code_description), "'"))
  }

  if (!missing(target_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " target_concept_id = ", if (is.null(target_concept_id)) "NULL" else if (is(target_concept_id, "subQuery")) paste0("(", as.character(target_concept_id), ")") else paste0("'", as.character(target_concept_id), "'"))
  }

  if (!missing(target_vocabulary_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " target_vocabulary_id = ", if (is.null(target_vocabulary_id)) "NULL" else if (is(target_vocabulary_id, "subQuery")) paste0("(", as.character(target_vocabulary_id), ")") else paste0("'", as.character(target_vocabulary_id), "'"))
  }

  if (!missing(valid_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " valid_start_date = ", if (is.null(valid_start_date)) "NULL" else if (is(valid_start_date, "subQuery")) paste0("(", as.character(valid_start_date), ")") else paste0("'", as.character(valid_start_date), "'"))
  }

  if (!missing(valid_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " valid_end_date = ", if (is.null(valid_end_date)) "NULL" else if (is(valid_end_date, "subQuery")) paste0("(", as.character(valid_end_date), ")") else paste0("'", as.character(valid_end_date), "'"))
  }

  if (!missing(invalid_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " invalid_reason = ", if (is.null(invalid_reason)) "NULL" else if (is(invalid_reason, "subQuery")) paste0("(", as.character(invalid_reason), ")") else paste0("'", as.character(invalid_reason), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_vocabulary <- function(fetchField, vocabulary_id, vocabulary_name, vocabulary_reference, vocabulary_version, vocabulary_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.vocabulary WHERE')
  first <- TRUE
  if (!missing(vocabulary_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " vocabulary_id = ", if (is.null(vocabulary_id)) "NULL" else if (is(vocabulary_id, "subQuery")) paste0("(", as.character(vocabulary_id), ")") else paste0("'", as.character(vocabulary_id), "'"))
  }

  if (!missing(vocabulary_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " vocabulary_name = ", if (is.null(vocabulary_name)) "NULL" else if (is(vocabulary_name, "subQuery")) paste0("(", as.character(vocabulary_name), ")") else paste0("'", as.character(vocabulary_name), "'"))
  }

  if (!missing(vocabulary_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " vocabulary_reference = ", if (is.null(vocabulary_reference)) "NULL" else if (is(vocabulary_reference, "subQuery")) paste0("(", as.character(vocabulary_reference), ")") else paste0("'", as.character(vocabulary_reference), "'"))
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " vocabulary_version = ", if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  if (!missing(vocabulary_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " vocabulary_concept_id = ", if (is.null(vocabulary_concept_id)) "NULL" else if (is(vocabulary_concept_id, "subQuery")) paste0("(", as.character(vocabulary_concept_id), ")") else paste0("'", as.character(vocabulary_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

generateInsertSql <- function(databaseSchema = NULL) {
  insertSql <- c()
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.claim;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.enrollment;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.diagnosis;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.diagnosis_master;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.[procedure];")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.procedure_master;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.annual_health_checkup;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.drug;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.drug_master;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.medical_facility;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.material;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.material_master;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema._version;")
  createInsertStatement <- function(insert, env) {
    s <- c()
    if (env$testId != insert$testId) {
      s <- c(s, paste0('-- ', insert$testId, ': ', insert$testDescription))
      env$testId <- insert$testId
    }
    s <- c(s, paste0("INSERT INTO @cdm_database_schema.",
                     insert$table,
                     "(",
                     paste(insert$fields, collapse = ", "),
                     ") VALUES (",
                     paste(insert$values, collapse = ", "), 
                     ");"))
    return(s)
  }
  env <- new.env()
  env$testId <- -1
  insertSql <- c(insertSql, do.call(c, lapply(frameworkContext$inserts, createInsertStatement, env)))
  if (is.null(databaseSchema)) {
  	insertSql <- gsub('@cdm_database_schema.', '', insertSql)
  } else {
  	insertSql <- gsub('@cdm_database_schema', databaseSchema, insertSql)
  }
  return(insertSql)
}

generateTestSql <- function(databaseSchema = NULL) {
  testSql <- c()
  testSql <- c(testSql, "IF OBJECT_ID('@cdm_database_schema.test_results', 'U') IS NOT NULL DROP TABLE @cdm_database_schema.test_results;")
  testSql <- c(testSql, "CREATE TABLE @cdm_database_schema.test_results (id INT, description VARCHAR(512), test VARCHAR(256), status VARCHAR(5));")
  createExpectStatement <- function(expect, env) {
    s <- c()
    if (env$testId != expect$testId) {
      s <- c(s, paste0('-- ', expect$testId, ': ', expect$testDescription))
      env$testId <- expect$testId
    }
    operators <- rep("=", length(expect$fields))
    operators[expect$values == "NULL"] <- rep("IS", sum(expect$values == "NULL"))
    s <- c(s, paste0("INSERT INTO @cdm_database_schema.test_results SELECT ",
                     expect$testId,
                     " AS id, '",
                     expect$testDescription,
                     "' AS description, 'Expect ",
                     expect$table,
                     "' AS test, CASE WHEN (SELECT COUNT(*) FROM @cdm_database_schema.",
                     expect$table,
                     " WHERE ",
                     paste(paste(expect$fields, operators, expect$values), collapse = " AND "),
                     ") ",
                     if (expect$type == 0) "= 0" else if (expect$type == 1) "!= 0" else paste("!=", expect$rowCount),
                     " THEN 'FAIL' ELSE 'PASS' END AS status;"))
    return(s)
  }
  env <- new.env()
  env$testId <- -1
  testSql <- c(testSql, do.call(c, lapply(frameworkContext$expects, createExpectStatement, env)))
  if (is.null(databaseSchema)) {
  	testSql <- gsub('@cdm_database_schema.', '', testSql)
  } else {
  	testSql <- gsub('@cdm_database_schema', databaseSchema, testSql)
  }
  return(testSql)
}

