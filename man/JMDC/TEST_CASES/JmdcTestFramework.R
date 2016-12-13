initFramework <- function() {
  insertSql <- c()
  insertSql <- c(insertSql, "TRUNCATE TABLE enrollment;")
  insertSql <- c(insertSql, "TRUNCATE TABLE institution;")
  insertSql <- c(insertSql, "TRUNCATE TABLE claim;")
  insertSql <- c(insertSql, "TRUNCATE TABLE physician;")
  insertSql <- c(insertSql, "TRUNCATE TABLE diagnosis;")
  insertSql <- c(insertSql, "TRUNCATE TABLE drug;")
  insertSql <- c(insertSql, "TRUNCATE TABLE [procedure];")
  insertSql <- c(insertSql, "TRUNCATE TABLE [health checkups];")
  insertSql <- c(insertSql, "TRUNCATE TABLE material;")
  insertSql <- c(insertSql, "TRUNCATE TABLE _version;")
  assign("insertSql", insertSql, envir = globalenv())
  testSql <- c()
  testSql <- c(testSql, "IF OBJECT_ID('test_results', 'U') IS NOT NULL")
  testSql <- c(testSql, "  DROP TABLE test_results;")
  testSql <- c(testSql, "")
  testSql <- c(testSql, "CREATE TABLE test_results (id INT, description VARCHAR(512), test VARCHAR(256), status VARCHAR(5));")
  testSql <- c(testSql, "")
  assign("testSql", testSql, envir = globalenv())
  assign("testId", 1, envir = globalenv())
  assign("testDescription", "", envir = globalenv())

  defaultValues <- new.env(parent = globalenv())
  assign("defaultValues", defaultValues, envir = globalenv())

  defaults <- list()
  defaults$member_id <- "M002629711"
  defaults$year_of_birth_of_member <- "1973"
  defaults$gender_of_member <- "male"
  defaults$individual_or_family <- "Individual"
  defaults$month_and_year_of_entry <- "200804"
  defaults$month_and_year_of_contract_start <- "200801"
  defaults$death_flag <- "0"
  assign("enrollment", defaults, envir = defaultValues)

  defaults <- list()
  defaults$institution_id <- "F0034058"
  defaults$number_of_beds <- "0-19"
  defaults$large_classification_of_department <- "Internal Medicine"
  defaults$medium_classification_of_department <- "General Internal Medicine"
  assign("institution", defaults, envir = defaultValues)

  defaults <- list()
  defaults$claim_id <- "C000110366921"
  defaults$member_id <- "M001430638"
  defaults$type_of_claim <- "out-patient"
  defaults$month_and_year_of_medical_care <- "201303"
  defaults$institution_id <- "F0034824"
  defaults$actual_number_of_days_of_medical_care <- "1"
  defaults$points <- "338"
  assign("claim", defaults, envir = defaultValues)

  defaults <- list()
  defaults$physician_id <- "P0230240"
  assign("physician", defaults, envir = defaultValues)

  defaults <- list()
  defaults$claim_id <- "C000053908640"
  defaults$member_id <- "M003154708"
  defaults$type_of_claim <- "out-patient"
  defaults$month_and_year_of_medical_care <- "201303"
  defaults$month_and_year_of_start_of_medical_care <- "20110506"
  defaults$institution_id <- "F0034824"
  defaults$icd10_level4_code <- "J304"
  defaults$icd10_level1_code <- "J00-J99"
  defaults$icd10_level1_name <- "Diseases of the respiratory system"
  defaults$icd10_level2_code <- "J00-J06"
  defaults$icd10_level2_name <- "Acute upper respiratory infections"
  defaults$icd10_level3_code <- "J30"
  defaults$icd10_level3_name <- "Vasomotor and allergic rhinitis"
  defaults$icd10_level4_name <- "Allergic rhinitis, unspecified"
  defaults$standard_disease_code <- "4779004"
  defaults$standard_disease_name <- "allergic rhinitis"
  defaults$suspicion_flag <- "0"
  defaults$outcome <- "0"
  assign("diagnosis", defaults, envir = defaultValues)

  defaults <- list()
  defaults$claim_id <- "C000073628338"
  defaults$member_id <- "M001390875"
  defaults$type_of_claim <- "pharmacy"
  defaults$institution_id <- "F0017014"
  defaults$month_and_year_of_medical_care <- "201303"
  defaults$duration_per_prescription <- "1"
  defaults$administered_amount <- "1"
  defaults$drug_code <- "100000066676"
  defaults$as_needed_medication_flag <- "0"
  defaults$daily_dose_per_prescription <- "1"
  defaults$unit_of_administered_amount <- "T"
  defaults$atc_level1_code <- "R"
  defaults$atc_level1_name <- "RESPIRATORY SYSTEM"
  defaults$atc_level2_code <- "R05"
  defaults$atc_level2_name <- "COUGH AND COLD PREPARATIONS"
  defaults$atc_level3_code <- "R05C"
  defaults$atc_level3_name <- "EXPECTORANTS"
  defaults$atc_level4_code <- "R05C-"
  defaults$atc_level4_name <- "EXPECTORANTS"
  defaults$who_atc_code <- "R05CB03"
  defaults$who_atc_name <- "Carbocisteine"
  defaults$statement_id <- "1"
  defaults$general_name <- "L-carbocisteine"
  defaults$brand_name <- "Mucodyne"
  defaults$drug_name <- "Mucodyne DS 50%"
  defaults$standardized_unit <- "1g"
  defaults$generic_drug_flag <- "0"
  defaults$formulation_large_classification_name <- "oral use"
  defaults$formulation_medium_classification_name <- "tablet"
  defaults$concurrent_id <- "1"
  defaults$category_of_medical_care <- "0"
  defaults$standard_price <- "5.6000"
  defaults$actual_point <- "0"
  defaults$claim_code <- "621989901"
  assign("drug", defaults, envir = defaultValues)

  defaults <- list()
  defaults$claim_id <- "C000077972593"
  defaults$member_id <- "M007020051"
  defaults$type_of_claim <- "out-patient"
  defaults$month_and_year_of_medical_care <- "201303"
  defaults$institution_id <- "F0017014"
  defaults$statement_id <- "1"
  defaults$procedure_medical_care_category_medium_classification_name <- "検査"
  defaults$procedure_medical_care_category_small_classification_name <- "検体検査料"
  defaults$procedure_medical_care_category_subclassification_name <- "再診料"
  defaults$procedure_code <- "A001"
  defaults$standardized_procedure_id <- "112007410"
  defaults$standardized_procedure_name <- "再診"
  defaults$number_of_times <- "1"
  defaults$concurrent_id <- "1"
  defaults$category_of_medical_care <- "60"
  defaults$standard_point <- "11"
  defaults$actual_point <- "0"
  assign("procedure", defaults, envir = defaultValues)

  defaults <- list()
  defaults$member_id <- "M000271824"
  defaults$month_and_year_of_health_chechups <- "201204"
  defaults$bmi <- "22.0"
  defaults$sbp <- "120"
  defaults$dbp <- "70"
  defaults$urine_sugar <- "1"
  defaults$urine_protein <- "1"
  defaults$smoking_habits <- "2"
  defaults$eating_habit_1 <- "2"
  defaults$eating_habit_2 <- "2"
  defaults$eating_habit_3 <- "2"
  defaults$eating_habit_4 <- "2"
  defaults$drinking_habits <- "3"
  defaults$sleeping <- "1"
  assign("health_checkups", defaults, envir = defaultValues)

  defaults <- list()
  defaults$claim_id <- "C000112535600"
  defaults$statement_id <- "1"
  defaults$member_id <- "M003871013"
  defaults$type_of_claim <- "out-patient"
  defaults$month_and_year_of_medical_care <- "201205"
  defaults$institution_id <- "F0110551"
  defaults$material_category_large_classification_name <- "画像診断特定保険医療材料料"
  defaults$material_category_medium_classification_name <- "フィルム"
  defaults$material_code <- "UN100"
  defaults$standardized_material_id <- "739200000"
  defaults$standardized_material_name <- "液体酸素・定置式液化酸素貯槽（ＣＥ）"
  defaults$number_of_material <- "1"
  defaults$category_of_medical_care <- "40"
  defaults$standard_price <- "0.0000"
  assign("material", defaults, envir = defaultValues)

  defaults <- list()
  defaults$version_id <- "285"
  defaults$version_date <- "2015-09-17"
  assign("_version", defaults, envir = defaultValues)
}

initFramework()

declareTest <- function(id, description) {
  assign("testId", id, envir = globalenv()) 
  assign("testDescription", description, envir = globalenv()) 
  sql <- c("", paste0("-- ", id, ": ", description))
  assign("insertSql", c(get("insertSql", envir = globalenv()), sql), envir = globalenv())
  assign("testSql", c(get("testSql", envir = globalenv()), sql), envir = globalenv())
}

set_defaults_enrollment <- function(member_id, year_of_birth_of_member, gender_of_member, individual_or_family, month_and_year_of_entry, month_and_year_of_withdrawal, month_and_year_of_contract_start, month_and_year_of_contract_end, death_flag) {
  defaults <- get("enrollment", envir = defaultValues)
  if (!missing(member_id)) {
    defaults$member_id <- member_id
  }
  if (!missing(year_of_birth_of_member)) {
    defaults$year_of_birth_of_member <- year_of_birth_of_member
  }
  if (!missing(gender_of_member)) {
    defaults$gender_of_member <- gender_of_member
  }
  if (!missing(individual_or_family)) {
    defaults$individual_or_family <- individual_or_family
  }
  if (!missing(month_and_year_of_entry)) {
    defaults$month_and_year_of_entry <- month_and_year_of_entry
  }
  if (!missing(month_and_year_of_withdrawal)) {
    defaults$month_and_year_of_withdrawal <- month_and_year_of_withdrawal
  }
  if (!missing(month_and_year_of_contract_start)) {
    defaults$month_and_year_of_contract_start <- month_and_year_of_contract_start
  }
  if (!missing(month_and_year_of_contract_end)) {
    defaults$month_and_year_of_contract_end <- month_and_year_of_contract_end
  }
  if (!missing(death_flag)) {
    defaults$death_flag <- death_flag
  }
  assign("enrollment", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_institution <- function(institution_id, number_of_beds, large_classification_of_department, medium_classification_of_department) {
  defaults <- get("institution", envir = defaultValues)
  if (!missing(institution_id)) {
    defaults$institution_id <- institution_id
  }
  if (!missing(number_of_beds)) {
    defaults$number_of_beds <- number_of_beds
  }
  if (!missing(large_classification_of_department)) {
    defaults$large_classification_of_department <- large_classification_of_department
  }
  if (!missing(medium_classification_of_department)) {
    defaults$medium_classification_of_department <- medium_classification_of_department
  }
  assign("institution", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_claim <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, institution_id, large_classification_of_department, medium_classification_of_department, actual_number_of_days_of_medical_care, points) {
  defaults <- get("claim", envir = defaultValues)
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
  if (!missing(institution_id)) {
    defaults$institution_id <- institution_id
  }
  if (!missing(large_classification_of_department)) {
    defaults$large_classification_of_department <- large_classification_of_department
  }
  if (!missing(medium_classification_of_department)) {
    defaults$medium_classification_of_department <- medium_classification_of_department
  }
  if (!missing(actual_number_of_days_of_medical_care)) {
    defaults$actual_number_of_days_of_medical_care <- actual_number_of_days_of_medical_care
  }
  if (!missing(points)) {
    defaults$points <- points
  }
  assign("claim", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_physician <- function(physician_id, large_classification_of_department, medium_classification_of_department) {
  defaults <- get("physician", envir = defaultValues)
  if (!missing(physician_id)) {
    defaults$physician_id <- physician_id
  }
  if (!missing(large_classification_of_department)) {
    defaults$large_classification_of_department <- large_classification_of_department
  }
  if (!missing(medium_classification_of_department)) {
    defaults$medium_classification_of_department <- medium_classification_of_department
  }
  assign("physician", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_diagnosis <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, admission_date, month_and_year_of_start_of_medical_care, institution_id, icd10_level4_code, icd10_level1_code, icd10_level1_name, icd10_level2_code, icd10_level2_name, icd10_level3_code, icd10_level3_name, icd10_level4_name, standard_disease_code, standard_disease_name, suspicion_flag, discharge_date, outcome) {
  defaults <- get("diagnosis", envir = defaultValues)
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
  if (!missing(month_and_year_of_start_of_medical_care)) {
    defaults$month_and_year_of_start_of_medical_care <- month_and_year_of_start_of_medical_care
  }
  if (!missing(institution_id)) {
    defaults$institution_id <- institution_id
  }
  if (!missing(icd10_level4_code)) {
    defaults$icd10_level4_code <- icd10_level4_code
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
  if (!missing(icd10_level4_name)) {
    defaults$icd10_level4_name <- icd10_level4_name
  }
  if (!missing(standard_disease_code)) {
    defaults$standard_disease_code <- standard_disease_code
  }
  if (!missing(standard_disease_name)) {
    defaults$standard_disease_name <- standard_disease_name
  }
  if (!missing(suspicion_flag)) {
    defaults$suspicion_flag <- suspicion_flag
  }
  if (!missing(discharge_date)) {
    defaults$discharge_date <- discharge_date
  }
  if (!missing(outcome)) {
    defaults$outcome <- outcome
  }
  assign("diagnosis", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_drug <- function(claim_id, member_id, type_of_claim, institution_id, physician_id, month_and_year_of_medical_care, date_of_prescription, duration_per_prescription, administered_amount, drug_code, as_needed_medication_flag, daily_dose_per_prescription, unit_of_administered_amount, atc_level1_code, atc_level1_name, atc_level2_code, atc_level2_name, atc_level3_code, atc_level3_name, atc_level4_code, atc_level4_name, who_atc_code, who_atc_name, statement_id, general_name, brand_name, drug_name, standardized_unit, generic_drug_flag, formulation_large_classification_name, formulation_medium_classification_name, concurrent_id, category_of_medical_care, standard_price, actual_point, claim_code) {
  defaults <- get("drug", envir = defaultValues)
  if (!missing(claim_id)) {
    defaults$claim_id <- claim_id
  }
  if (!missing(member_id)) {
    defaults$member_id <- member_id
  }
  if (!missing(type_of_claim)) {
    defaults$type_of_claim <- type_of_claim
  }
  if (!missing(institution_id)) {
    defaults$institution_id <- institution_id
  }
  if (!missing(physician_id)) {
    defaults$physician_id <- physician_id
  }
  if (!missing(month_and_year_of_medical_care)) {
    defaults$month_and_year_of_medical_care <- month_and_year_of_medical_care
  }
  if (!missing(date_of_prescription)) {
    defaults$date_of_prescription <- date_of_prescription
  }
  if (!missing(duration_per_prescription)) {
    defaults$duration_per_prescription <- duration_per_prescription
  }
  if (!missing(administered_amount)) {
    defaults$administered_amount <- administered_amount
  }
  if (!missing(drug_code)) {
    defaults$drug_code <- drug_code
  }
  if (!missing(as_needed_medication_flag)) {
    defaults$as_needed_medication_flag <- as_needed_medication_flag
  }
  if (!missing(daily_dose_per_prescription)) {
    defaults$daily_dose_per_prescription <- daily_dose_per_prescription
  }
  if (!missing(unit_of_administered_amount)) {
    defaults$unit_of_administered_amount <- unit_of_administered_amount
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
  if (!missing(statement_id)) {
    defaults$statement_id <- statement_id
  }
  if (!missing(general_name)) {
    defaults$general_name <- general_name
  }
  if (!missing(brand_name)) {
    defaults$brand_name <- brand_name
  }
  if (!missing(drug_name)) {
    defaults$drug_name <- drug_name
  }
  if (!missing(standardized_unit)) {
    defaults$standardized_unit <- standardized_unit
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
  if (!missing(concurrent_id)) {
    defaults$concurrent_id <- concurrent_id
  }
  if (!missing(category_of_medical_care)) {
    defaults$category_of_medical_care <- category_of_medical_care
  }
  if (!missing(standard_price)) {
    defaults$standard_price <- standard_price
  }
  if (!missing(actual_point)) {
    defaults$actual_point <- actual_point
  }
  if (!missing(claim_code)) {
    defaults$claim_code <- claim_code
  }
  assign("drug", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_procedure <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, date_of_procedure, institution_id, icd9cm_level1, statement_id, procedure_medical_care_category_medium_classification_name, procedure_medical_care_category_small_classification_name, procedure_medical_care_category_subclassification_name, icd9cm_level2, icd9cm_level3, icd9cm_level4, icd9cm_level5, procedure_code, standardized_procedure_id, standardized_procedure_name, number_of_times, concurrent_id, category_of_medical_care, standard_point, actual_point) {
  defaults <- get("procedure", envir = defaultValues)
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
  if (!missing(institution_id)) {
    defaults$institution_id <- institution_id
  }
  if (!missing(icd9cm_level1)) {
    defaults$icd9cm_level1 <- icd9cm_level1
  }
  if (!missing(statement_id)) {
    defaults$statement_id <- statement_id
  }
  if (!missing(procedure_medical_care_category_medium_classification_name)) {
    defaults$procedure_medical_care_category_medium_classification_name <- procedure_medical_care_category_medium_classification_name
  }
  if (!missing(procedure_medical_care_category_small_classification_name)) {
    defaults$procedure_medical_care_category_small_classification_name <- procedure_medical_care_category_small_classification_name
  }
  if (!missing(procedure_medical_care_category_subclassification_name)) {
    defaults$procedure_medical_care_category_subclassification_name <- procedure_medical_care_category_subclassification_name
  }
  if (!missing(icd9cm_level2)) {
    defaults$icd9cm_level2 <- icd9cm_level2
  }
  if (!missing(icd9cm_level3)) {
    defaults$icd9cm_level3 <- icd9cm_level3
  }
  if (!missing(icd9cm_level4)) {
    defaults$icd9cm_level4 <- icd9cm_level4
  }
  if (!missing(icd9cm_level5)) {
    defaults$icd9cm_level5 <- icd9cm_level5
  }
  if (!missing(procedure_code)) {
    defaults$procedure_code <- procedure_code
  }
  if (!missing(standardized_procedure_id)) {
    defaults$standardized_procedure_id <- standardized_procedure_id
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
  if (!missing(standard_point)) {
    defaults$standard_point <- standard_point
  }
  if (!missing(actual_point)) {
    defaults$actual_point <- actual_point
  }
  assign("procedure", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_health_checkups <- function(member_id, month_and_year_of_health_chechups, bmi, amount_of_visceral_fat, abdominal_girth, sbp, dbp, tc, tg, hdl_c, ldl_c, gpt, g_gt, fasting_blood_sugar, casual_blood_sugar, hba1c, urine_sugar, urine_protein, hematocrit, hemoglobin, red_blood_cell_count, serum_uric_acid, serum_creatinine, electrocardiogram, ophthalmoscopy_k_w_classificatio, ophthalmoscopy_scheie_classifica, ophthalmoscopy_scheie_classific0, ophthalmoscopy_scott_classificat, smoking_habits, eating_habit_1, eating_habit_2, eating_habit_3, eating_habit_4, drinking_habits, sleeping) {
  defaults <- get("health_checkups", envir = defaultValues)
  if (!missing(member_id)) {
    defaults$member_id <- member_id
  }
  if (!missing(month_and_year_of_health_chechups)) {
    defaults$month_and_year_of_health_chechups <- month_and_year_of_health_chechups
  }
  if (!missing(bmi)) {
    defaults$bmi <- bmi
  }
  if (!missing(amount_of_visceral_fat)) {
    defaults$amount_of_visceral_fat <- amount_of_visceral_fat
  }
  if (!missing(abdominal_girth)) {
    defaults$abdominal_girth <- abdominal_girth
  }
  if (!missing(sbp)) {
    defaults$sbp <- sbp
  }
  if (!missing(dbp)) {
    defaults$dbp <- dbp
  }
  if (!missing(tc)) {
    defaults$tc <- tc
  }
  if (!missing(tg)) {
    defaults$tg <- tg
  }
  if (!missing(hdl_c)) {
    defaults$hdl_c <- hdl_c
  }
  if (!missing(ldl_c)) {
    defaults$ldl_c <- ldl_c
  }
  if (!missing(gpt)) {
    defaults$gpt <- gpt
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
  if (!missing(urine_sugar)) {
    defaults$urine_sugar <- urine_sugar
  }
  if (!missing(urine_protein)) {
    defaults$urine_protein <- urine_protein
  }
  if (!missing(hematocrit)) {
    defaults$hematocrit <- hematocrit
  }
  if (!missing(hemoglobin)) {
    defaults$hemoglobin <- hemoglobin
  }
  if (!missing(red_blood_cell_count)) {
    defaults$red_blood_cell_count <- red_blood_cell_count
  }
  if (!missing(serum_uric_acid)) {
    defaults$serum_uric_acid <- serum_uric_acid
  }
  if (!missing(serum_creatinine)) {
    defaults$serum_creatinine <- serum_creatinine
  }
  if (!missing(electrocardiogram)) {
    defaults$electrocardiogram <- electrocardiogram
  }
  if (!missing(ophthalmoscopy_k_w_classificatio)) {
    defaults$ophthalmoscopy_k_w_classificatio <- ophthalmoscopy_k_w_classificatio
  }
  if (!missing(ophthalmoscopy_scheie_classifica)) {
    defaults$ophthalmoscopy_scheie_classifica <- ophthalmoscopy_scheie_classifica
  }
  if (!missing(ophthalmoscopy_scheie_classific0)) {
    defaults$ophthalmoscopy_scheie_classific0 <- ophthalmoscopy_scheie_classific0
  }
  if (!missing(ophthalmoscopy_scott_classificat)) {
    defaults$ophthalmoscopy_scott_classificat <- ophthalmoscopy_scott_classificat
  }
  if (!missing(smoking_habits)) {
    defaults$smoking_habits <- smoking_habits
  }
  if (!missing(eating_habit_1)) {
    defaults$eating_habit_1 <- eating_habit_1
  }
  if (!missing(eating_habit_2)) {
    defaults$eating_habit_2 <- eating_habit_2
  }
  if (!missing(eating_habit_3)) {
    defaults$eating_habit_3 <- eating_habit_3
  }
  if (!missing(eating_habit_4)) {
    defaults$eating_habit_4 <- eating_habit_4
  }
  if (!missing(drinking_habits)) {
    defaults$drinking_habits <- drinking_habits
  }
  if (!missing(sleeping)) {
    defaults$sleeping <- sleeping
  }
  assign("health_checkups", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_material <- function(claim_id, statement_id, member_id, type_of_claim, month_and_year_of_medical_care, date_of_procedure, institution_id, material_category_large_classification_name, material_category_medium_classification_name, material_code, standardized_material_id, standardized_material_name, unit, number_of_material, concurrent_id, category_of_medical_care, standard_price, actual_point) {
  defaults <- get("material", envir = defaultValues)
  if (!missing(claim_id)) {
    defaults$claim_id <- claim_id
  }
  if (!missing(statement_id)) {
    defaults$statement_id <- statement_id
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
  if (!missing(institution_id)) {
    defaults$institution_id <- institution_id
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
  if (!missing(standardized_material_id)) {
    defaults$standardized_material_id <- standardized_material_id
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
  if (!missing(standard_price)) {
    defaults$standard_price <- standard_price
  }
  if (!missing(actual_point)) {
    defaults$actual_point <- actual_point
  }
  assign("material", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults__version <- function(version_id, version_date) {
  defaults <- get("_version", envir = defaultValues)
  if (!missing(version_id)) {
    defaults$version_id <- version_id
  }
  if (!missing(version_date)) {
    defaults$version_date <- version_date
  }
  assign("_version", defaults, envir = defaultValues)
  invisible(defaults)
}

get_defaults_enrollment <- function() {
  defaults <- get("enrollment", envir = defaultValues)
  return(defaults)
}

get_defaults_institution <- function() {
  defaults <- get("institution", envir = defaultValues)
  return(defaults)
}

get_defaults_claim <- function() {
  defaults <- get("claim", envir = defaultValues)
  return(defaults)
}

get_defaults_physician <- function() {
  defaults <- get("physician", envir = defaultValues)
  return(defaults)
}

get_defaults_diagnosis <- function() {
  defaults <- get("diagnosis", envir = defaultValues)
  return(defaults)
}

get_defaults_drug <- function() {
  defaults <- get("drug", envir = defaultValues)
  return(defaults)
}

get_defaults_procedure <- function() {
  defaults <- get("procedure", envir = defaultValues)
  return(defaults)
}

get_defaults_health_checkups <- function() {
  defaults <- get("health_checkups", envir = defaultValues)
  return(defaults)
}

get_defaults_material <- function() {
  defaults <- get("material", envir = defaultValues)
  return(defaults)
}

get_defaults__version <- function() {
  defaults <- get("_version", envir = defaultValues)
  return(defaults)
}

add_enrollment <- function(member_id, year_of_birth_of_member, gender_of_member, individual_or_family, month_and_year_of_entry, month_and_year_of_withdrawal, month_and_year_of_contract_start, month_and_year_of_contract_end, death_flag) {
  defaults <- get("enrollment", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    insertFields <- c(insertFields, "[member id]")
    insertValues <- c(insertValues, member_id)
  }

  if (missing(year_of_birth_of_member)) {
    year_of_birth_of_member <- defaults$year_of_birth_of_member
  }
  if (!is.null(year_of_birth_of_member)) {
    insertFields <- c(insertFields, "[year of birth of member]")
    insertValues <- c(insertValues, year_of_birth_of_member)
  }

  if (missing(gender_of_member)) {
    gender_of_member <- defaults$gender_of_member
  }
  if (!is.null(gender_of_member)) {
    insertFields <- c(insertFields, "[gender of member]")
    insertValues <- c(insertValues, gender_of_member)
  }

  if (missing(individual_or_family)) {
    individual_or_family <- defaults$individual_or_family
  }
  if (!is.null(individual_or_family)) {
    insertFields <- c(insertFields, "[individual or family]")
    insertValues <- c(insertValues, individual_or_family)
  }

  if (missing(month_and_year_of_entry)) {
    month_and_year_of_entry <- defaults$month_and_year_of_entry
  }
  if (!is.null(month_and_year_of_entry)) {
    insertFields <- c(insertFields, "[month and year of entry]")
    insertValues <- c(insertValues, month_and_year_of_entry)
  }

  if (missing(month_and_year_of_withdrawal)) {
    month_and_year_of_withdrawal <- defaults$month_and_year_of_withdrawal
  }
  if (!is.null(month_and_year_of_withdrawal)) {
    insertFields <- c(insertFields, "[month and year of withdrawal]")
    insertValues <- c(insertValues, month_and_year_of_withdrawal)
  }

  if (missing(month_and_year_of_contract_start)) {
    month_and_year_of_contract_start <- defaults$month_and_year_of_contract_start
  }
  if (!is.null(month_and_year_of_contract_start)) {
    insertFields <- c(insertFields, "[month and year of contract start]")
    insertValues <- c(insertValues, month_and_year_of_contract_start)
  }

  if (missing(month_and_year_of_contract_end)) {
    month_and_year_of_contract_end <- defaults$month_and_year_of_contract_end
  }
  if (!is.null(month_and_year_of_contract_end)) {
    insertFields <- c(insertFields, "[month and year of contract end]")
    insertValues <- c(insertValues, month_and_year_of_contract_end)
  }

  if (missing(death_flag)) {
    death_flag <- defaults$death_flag
  }
  if (!is.null(death_flag)) {
    insertFields <- c(insertFields, "[death flag]")
    insertValues <- c(insertValues, death_flag)
  }

  statement <- paste0("INSERT INTO enrollment (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add_institution <- function(institution_id, number_of_beds, large_classification_of_department, medium_classification_of_department) {
  defaults <- get("institution", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(institution_id)) {
    institution_id <- defaults$institution_id
  }
  if (!is.null(institution_id)) {
    insertFields <- c(insertFields, "[institution id]")
    insertValues <- c(insertValues, institution_id)
  }

  if (missing(number_of_beds)) {
    number_of_beds <- defaults$number_of_beds
  }
  if (!is.null(number_of_beds)) {
    insertFields <- c(insertFields, "[number of beds]")
    insertValues <- c(insertValues, number_of_beds)
  }

  if (missing(large_classification_of_department)) {
    large_classification_of_department <- defaults$large_classification_of_department
  }
  if (!is.null(large_classification_of_department)) {
    insertFields <- c(insertFields, "[large classification of department]")
    insertValues <- c(insertValues, large_classification_of_department)
  }

  if (missing(medium_classification_of_department)) {
    medium_classification_of_department <- defaults$medium_classification_of_department
  }
  if (!is.null(medium_classification_of_department)) {
    insertFields <- c(insertFields, "[medium classification of department]")
    insertValues <- c(insertValues, medium_classification_of_department)
  }

  statement <- paste0("INSERT INTO institution (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add_claim <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, institution_id, large_classification_of_department, medium_classification_of_department, actual_number_of_days_of_medical_care, points) {
  defaults <- get("claim", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(claim_id)) {
    claim_id <- defaults$claim_id
  }
  if (!is.null(claim_id)) {
    insertFields <- c(insertFields, "[claim id]")
    insertValues <- c(insertValues, claim_id)
  }

  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    insertFields <- c(insertFields, "[member id]")
    insertValues <- c(insertValues, member_id)
  }

  if (missing(type_of_claim)) {
    type_of_claim <- defaults$type_of_claim
  }
  if (!is.null(type_of_claim)) {
    insertFields <- c(insertFields, "[type of claim]")
    insertValues <- c(insertValues, type_of_claim)
  }

  if (missing(month_and_year_of_medical_care)) {
    month_and_year_of_medical_care <- defaults$month_and_year_of_medical_care
  }
  if (!is.null(month_and_year_of_medical_care)) {
    insertFields <- c(insertFields, "[month and year of medical care]")
    insertValues <- c(insertValues, month_and_year_of_medical_care)
  }

  if (missing(institution_id)) {
    institution_id <- defaults$institution_id
  }
  if (!is.null(institution_id)) {
    insertFields <- c(insertFields, "[institution id]")
    insertValues <- c(insertValues, institution_id)
  }

  if (missing(large_classification_of_department)) {
    large_classification_of_department <- defaults$large_classification_of_department
  }
  if (!is.null(large_classification_of_department)) {
    insertFields <- c(insertFields, "[large classification of department]")
    insertValues <- c(insertValues, large_classification_of_department)
  }

  if (missing(medium_classification_of_department)) {
    medium_classification_of_department <- defaults$medium_classification_of_department
  }
  if (!is.null(medium_classification_of_department)) {
    insertFields <- c(insertFields, "[medium classification of department]")
    insertValues <- c(insertValues, medium_classification_of_department)
  }

  if (missing(actual_number_of_days_of_medical_care)) {
    actual_number_of_days_of_medical_care <- defaults$actual_number_of_days_of_medical_care
  }
  if (!is.null(actual_number_of_days_of_medical_care)) {
    insertFields <- c(insertFields, "[actual number of days of medical care]")
    insertValues <- c(insertValues, actual_number_of_days_of_medical_care)
  }

  if (missing(points)) {
    points <- defaults$points
  }
  if (!is.null(points)) {
    insertFields <- c(insertFields, "points")
    insertValues <- c(insertValues, points)
  }

  statement <- paste0("INSERT INTO claim (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add_physician <- function(physician_id, large_classification_of_department, medium_classification_of_department) {
  defaults <- get("physician", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(physician_id)) {
    physician_id <- defaults$physician_id
  }
  if (!is.null(physician_id)) {
    insertFields <- c(insertFields, "[physician id]")
    insertValues <- c(insertValues, physician_id)
  }

  if (missing(large_classification_of_department)) {
    large_classification_of_department <- defaults$large_classification_of_department
  }
  if (!is.null(large_classification_of_department)) {
    insertFields <- c(insertFields, "[large classification of department]")
    insertValues <- c(insertValues, large_classification_of_department)
  }

  if (missing(medium_classification_of_department)) {
    medium_classification_of_department <- defaults$medium_classification_of_department
  }
  if (!is.null(medium_classification_of_department)) {
    insertFields <- c(insertFields, "[medium classification of department]")
    insertValues <- c(insertValues, medium_classification_of_department)
  }

  statement <- paste0("INSERT INTO physician (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add_diagnosis <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, admission_date, month_and_year_of_start_of_medical_care, institution_id, icd10_level4_code, icd10_level1_code, icd10_level1_name, icd10_level2_code, icd10_level2_name, icd10_level3_code, icd10_level3_name, icd10_level4_name, standard_disease_code, standard_disease_name, suspicion_flag, discharge_date, outcome) {
  defaults <- get("diagnosis", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(claim_id)) {
    claim_id <- defaults$claim_id
  }
  if (!is.null(claim_id)) {
    insertFields <- c(insertFields, "[claim id]")
    insertValues <- c(insertValues, claim_id)
  }

  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    insertFields <- c(insertFields, "[member id]")
    insertValues <- c(insertValues, member_id)
  }

  if (missing(type_of_claim)) {
    type_of_claim <- defaults$type_of_claim
  }
  if (!is.null(type_of_claim)) {
    insertFields <- c(insertFields, "[type of claim]")
    insertValues <- c(insertValues, type_of_claim)
  }

  if (missing(month_and_year_of_medical_care)) {
    month_and_year_of_medical_care <- defaults$month_and_year_of_medical_care
  }
  if (!is.null(month_and_year_of_medical_care)) {
    insertFields <- c(insertFields, "[month and year of medical care]")
    insertValues <- c(insertValues, month_and_year_of_medical_care)
  }

  if (missing(admission_date)) {
    admission_date <- defaults$admission_date
  }
  if (!is.null(admission_date)) {
    insertFields <- c(insertFields, "[admission date]")
    insertValues <- c(insertValues, admission_date)
  }

  if (missing(month_and_year_of_start_of_medical_care)) {
    month_and_year_of_start_of_medical_care <- defaults$month_and_year_of_start_of_medical_care
  }
  if (!is.null(month_and_year_of_start_of_medical_care)) {
    insertFields <- c(insertFields, "[month and year of start of medical care]")
    insertValues <- c(insertValues, month_and_year_of_start_of_medical_care)
  }

  if (missing(institution_id)) {
    institution_id <- defaults$institution_id
  }
  if (!is.null(institution_id)) {
    insertFields <- c(insertFields, "[institution id]")
    insertValues <- c(insertValues, institution_id)
  }

  if (missing(icd10_level4_code)) {
    icd10_level4_code <- defaults$icd10_level4_code
  }
  if (!is.null(icd10_level4_code)) {
    insertFields <- c(insertFields, "[icd10 level4 code]")
    insertValues <- c(insertValues, icd10_level4_code)
  }

  if (missing(icd10_level1_code)) {
    icd10_level1_code <- defaults$icd10_level1_code
  }
  if (!is.null(icd10_level1_code)) {
    insertFields <- c(insertFields, "[icd10 level1 code]")
    insertValues <- c(insertValues, icd10_level1_code)
  }

  if (missing(icd10_level1_name)) {
    icd10_level1_name <- defaults$icd10_level1_name
  }
  if (!is.null(icd10_level1_name)) {
    insertFields <- c(insertFields, "[icd10 level1 name]")
    insertValues <- c(insertValues, icd10_level1_name)
  }

  if (missing(icd10_level2_code)) {
    icd10_level2_code <- defaults$icd10_level2_code
  }
  if (!is.null(icd10_level2_code)) {
    insertFields <- c(insertFields, "[icd10 level2 code]")
    insertValues <- c(insertValues, icd10_level2_code)
  }

  if (missing(icd10_level2_name)) {
    icd10_level2_name <- defaults$icd10_level2_name
  }
  if (!is.null(icd10_level2_name)) {
    insertFields <- c(insertFields, "[icd10 level2 name]")
    insertValues <- c(insertValues, icd10_level2_name)
  }

  if (missing(icd10_level3_code)) {
    icd10_level3_code <- defaults$icd10_level3_code
  }
  if (!is.null(icd10_level3_code)) {
    insertFields <- c(insertFields, "[icd10 level3 code]")
    insertValues <- c(insertValues, icd10_level3_code)
  }

  if (missing(icd10_level3_name)) {
    icd10_level3_name <- defaults$icd10_level3_name
  }
  if (!is.null(icd10_level3_name)) {
    insertFields <- c(insertFields, "[icd10 level3 name]")
    insertValues <- c(insertValues, icd10_level3_name)
  }

  if (missing(icd10_level4_name)) {
    icd10_level4_name <- defaults$icd10_level4_name
  }
  if (!is.null(icd10_level4_name)) {
    insertFields <- c(insertFields, "[icd10 level4 name]")
    insertValues <- c(insertValues, icd10_level4_name)
  }

  if (missing(standard_disease_code)) {
    standard_disease_code <- defaults$standard_disease_code
  }
  if (!is.null(standard_disease_code)) {
    insertFields <- c(insertFields, "[standard disease code]")
    insertValues <- c(insertValues, standard_disease_code)
  }

  if (missing(standard_disease_name)) {
    standard_disease_name <- defaults$standard_disease_name
  }
  if (!is.null(standard_disease_name)) {
    insertFields <- c(insertFields, "[standard disease name]")
    insertValues <- c(insertValues, standard_disease_name)
  }

  if (missing(suspicion_flag)) {
    suspicion_flag <- defaults$suspicion_flag
  }
  if (!is.null(suspicion_flag)) {
    insertFields <- c(insertFields, "[suspicion flag]")
    insertValues <- c(insertValues, suspicion_flag)
  }

  if (missing(discharge_date)) {
    discharge_date <- defaults$discharge_date
  }
  if (!is.null(discharge_date)) {
    insertFields <- c(insertFields, "[discharge date]")
    insertValues <- c(insertValues, discharge_date)
  }

  if (missing(outcome)) {
    outcome <- defaults$outcome
  }
  if (!is.null(outcome)) {
    insertFields <- c(insertFields, "outcome")
    insertValues <- c(insertValues, outcome)
  }

  statement <- paste0("INSERT INTO diagnosis (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add_drug <- function(claim_id, member_id, type_of_claim, institution_id, physician_id, month_and_year_of_medical_care, date_of_prescription, duration_per_prescription, administered_amount, drug_code, as_needed_medication_flag, daily_dose_per_prescription, unit_of_administered_amount, atc_level1_code, atc_level1_name, atc_level2_code, atc_level2_name, atc_level3_code, atc_level3_name, atc_level4_code, atc_level4_name, who_atc_code, who_atc_name, statement_id, general_name, brand_name, drug_name, standardized_unit, generic_drug_flag, formulation_large_classification_name, formulation_medium_classification_name, concurrent_id, category_of_medical_care, standard_price, actual_point, claim_code) {
  defaults <- get("drug", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(claim_id)) {
    claim_id <- defaults$claim_id
  }
  if (!is.null(claim_id)) {
    insertFields <- c(insertFields, "[claim id]")
    insertValues <- c(insertValues, claim_id)
  }

  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    insertFields <- c(insertFields, "[member id]")
    insertValues <- c(insertValues, member_id)
  }

  if (missing(type_of_claim)) {
    type_of_claim <- defaults$type_of_claim
  }
  if (!is.null(type_of_claim)) {
    insertFields <- c(insertFields, "[type of claim]")
    insertValues <- c(insertValues, type_of_claim)
  }

  if (missing(institution_id)) {
    institution_id <- defaults$institution_id
  }
  if (!is.null(institution_id)) {
    insertFields <- c(insertFields, "[institution id]")
    insertValues <- c(insertValues, institution_id)
  }

  if (missing(physician_id)) {
    physician_id <- defaults$physician_id
  }
  if (!is.null(physician_id)) {
    insertFields <- c(insertFields, "[physician id]")
    insertValues <- c(insertValues, physician_id)
  }

  if (missing(month_and_year_of_medical_care)) {
    month_and_year_of_medical_care <- defaults$month_and_year_of_medical_care
  }
  if (!is.null(month_and_year_of_medical_care)) {
    insertFields <- c(insertFields, "[month and year of medical care]")
    insertValues <- c(insertValues, month_and_year_of_medical_care)
  }

  if (missing(date_of_prescription)) {
    date_of_prescription <- defaults$date_of_prescription
  }
  if (!is.null(date_of_prescription)) {
    insertFields <- c(insertFields, "[date of prescription]")
    insertValues <- c(insertValues, date_of_prescription)
  }

  if (missing(duration_per_prescription)) {
    duration_per_prescription <- defaults$duration_per_prescription
  }
  if (!is.null(duration_per_prescription)) {
    insertFields <- c(insertFields, "[duration per prescription]")
    insertValues <- c(insertValues, duration_per_prescription)
  }

  if (missing(administered_amount)) {
    administered_amount <- defaults$administered_amount
  }
  if (!is.null(administered_amount)) {
    insertFields <- c(insertFields, "[administered amount]")
    insertValues <- c(insertValues, administered_amount)
  }

  if (missing(drug_code)) {
    drug_code <- defaults$drug_code
  }
  if (!is.null(drug_code)) {
    insertFields <- c(insertFields, "[drug code]")
    insertValues <- c(insertValues, drug_code)
  }

  if (missing(as_needed_medication_flag)) {
    as_needed_medication_flag <- defaults$as_needed_medication_flag
  }
  if (!is.null(as_needed_medication_flag)) {
    insertFields <- c(insertFields, "[as-needed medication flag]")
    insertValues <- c(insertValues, as_needed_medication_flag)
  }

  if (missing(daily_dose_per_prescription)) {
    daily_dose_per_prescription <- defaults$daily_dose_per_prescription
  }
  if (!is.null(daily_dose_per_prescription)) {
    insertFields <- c(insertFields, "[daily dose per prescription]")
    insertValues <- c(insertValues, daily_dose_per_prescription)
  }

  if (missing(unit_of_administered_amount)) {
    unit_of_administered_amount <- defaults$unit_of_administered_amount
  }
  if (!is.null(unit_of_administered_amount)) {
    insertFields <- c(insertFields, "[unit of administered amount]")
    insertValues <- c(insertValues, unit_of_administered_amount)
  }

  if (missing(atc_level1_code)) {
    atc_level1_code <- defaults$atc_level1_code
  }
  if (!is.null(atc_level1_code)) {
    insertFields <- c(insertFields, "[atc level1 code]")
    insertValues <- c(insertValues, atc_level1_code)
  }

  if (missing(atc_level1_name)) {
    atc_level1_name <- defaults$atc_level1_name
  }
  if (!is.null(atc_level1_name)) {
    insertFields <- c(insertFields, "[atc level1 name]")
    insertValues <- c(insertValues, atc_level1_name)
  }

  if (missing(atc_level2_code)) {
    atc_level2_code <- defaults$atc_level2_code
  }
  if (!is.null(atc_level2_code)) {
    insertFields <- c(insertFields, "[atc level2 code]")
    insertValues <- c(insertValues, atc_level2_code)
  }

  if (missing(atc_level2_name)) {
    atc_level2_name <- defaults$atc_level2_name
  }
  if (!is.null(atc_level2_name)) {
    insertFields <- c(insertFields, "[atc level2 name]")
    insertValues <- c(insertValues, atc_level2_name)
  }

  if (missing(atc_level3_code)) {
    atc_level3_code <- defaults$atc_level3_code
  }
  if (!is.null(atc_level3_code)) {
    insertFields <- c(insertFields, "[atc level3 code]")
    insertValues <- c(insertValues, atc_level3_code)
  }

  if (missing(atc_level3_name)) {
    atc_level3_name <- defaults$atc_level3_name
  }
  if (!is.null(atc_level3_name)) {
    insertFields <- c(insertFields, "[atc level3 name]")
    insertValues <- c(insertValues, atc_level3_name)
  }

  if (missing(atc_level4_code)) {
    atc_level4_code <- defaults$atc_level4_code
  }
  if (!is.null(atc_level4_code)) {
    insertFields <- c(insertFields, "[atc level4 code]")
    insertValues <- c(insertValues, atc_level4_code)
  }

  if (missing(atc_level4_name)) {
    atc_level4_name <- defaults$atc_level4_name
  }
  if (!is.null(atc_level4_name)) {
    insertFields <- c(insertFields, "[atc level4 name]")
    insertValues <- c(insertValues, atc_level4_name)
  }

  if (missing(who_atc_code)) {
    who_atc_code <- defaults$who_atc_code
  }
  if (!is.null(who_atc_code)) {
    insertFields <- c(insertFields, "[who-atc code]")
    insertValues <- c(insertValues, who_atc_code)
  }

  if (missing(who_atc_name)) {
    who_atc_name <- defaults$who_atc_name
  }
  if (!is.null(who_atc_name)) {
    insertFields <- c(insertFields, "[who-atc name]")
    insertValues <- c(insertValues, who_atc_name)
  }

  if (missing(statement_id)) {
    statement_id <- defaults$statement_id
  }
  if (!is.null(statement_id)) {
    insertFields <- c(insertFields, "[statement id]")
    insertValues <- c(insertValues, statement_id)
  }

  if (missing(general_name)) {
    general_name <- defaults$general_name
  }
  if (!is.null(general_name)) {
    insertFields <- c(insertFields, "[general name]")
    insertValues <- c(insertValues, general_name)
  }

  if (missing(brand_name)) {
    brand_name <- defaults$brand_name
  }
  if (!is.null(brand_name)) {
    insertFields <- c(insertFields, "[brand name]")
    insertValues <- c(insertValues, brand_name)
  }

  if (missing(drug_name)) {
    drug_name <- defaults$drug_name
  }
  if (!is.null(drug_name)) {
    insertFields <- c(insertFields, "[drug name]")
    insertValues <- c(insertValues, drug_name)
  }

  if (missing(standardized_unit)) {
    standardized_unit <- defaults$standardized_unit
  }
  if (!is.null(standardized_unit)) {
    insertFields <- c(insertFields, "[standardized unit]")
    insertValues <- c(insertValues, standardized_unit)
  }

  if (missing(generic_drug_flag)) {
    generic_drug_flag <- defaults$generic_drug_flag
  }
  if (!is.null(generic_drug_flag)) {
    insertFields <- c(insertFields, "[generic drug flag]")
    insertValues <- c(insertValues, generic_drug_flag)
  }

  if (missing(formulation_large_classification_name)) {
    formulation_large_classification_name <- defaults$formulation_large_classification_name
  }
  if (!is.null(formulation_large_classification_name)) {
    insertFields <- c(insertFields, "[formulation large classification name]")
    insertValues <- c(insertValues, formulation_large_classification_name)
  }

  if (missing(formulation_medium_classification_name)) {
    formulation_medium_classification_name <- defaults$formulation_medium_classification_name
  }
  if (!is.null(formulation_medium_classification_name)) {
    insertFields <- c(insertFields, "[formulation medium classification name]")
    insertValues <- c(insertValues, formulation_medium_classification_name)
  }

  if (missing(concurrent_id)) {
    concurrent_id <- defaults$concurrent_id
  }
  if (!is.null(concurrent_id)) {
    insertFields <- c(insertFields, "[concurrent id]")
    insertValues <- c(insertValues, concurrent_id)
  }

  if (missing(category_of_medical_care)) {
    category_of_medical_care <- defaults$category_of_medical_care
  }
  if (!is.null(category_of_medical_care)) {
    insertFields <- c(insertFields, "[category of medical care]")
    insertValues <- c(insertValues, category_of_medical_care)
  }

  if (missing(standard_price)) {
    standard_price <- defaults$standard_price
  }
  if (!is.null(standard_price)) {
    insertFields <- c(insertFields, "[standard price]")
    insertValues <- c(insertValues, standard_price)
  }

  if (missing(actual_point)) {
    actual_point <- defaults$actual_point
  }
  if (!is.null(actual_point)) {
    insertFields <- c(insertFields, "[actual point]")
    insertValues <- c(insertValues, actual_point)
  }

  if (missing(claim_code)) {
    claim_code <- defaults$claim_code
  }
  if (!is.null(claim_code)) {
    insertFields <- c(insertFields, "[claim code]")
    insertValues <- c(insertValues, claim_code)
  }

  statement <- paste0("INSERT INTO drug (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add_procedure <- function(claim_id, member_id, type_of_claim, month_and_year_of_medical_care, date_of_procedure, institution_id, icd9cm_level1, statement_id, procedure_medical_care_category_medium_classification_name, procedure_medical_care_category_small_classification_name, procedure_medical_care_category_subclassification_name, icd9cm_level2, icd9cm_level3, icd9cm_level4, icd9cm_level5, procedure_code, standardized_procedure_id, standardized_procedure_name, number_of_times, concurrent_id, category_of_medical_care, standard_point, actual_point) {
  defaults <- get("procedure", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(claim_id)) {
    claim_id <- defaults$claim_id
  }
  if (!is.null(claim_id)) {
    insertFields <- c(insertFields, "[claim id]")
    insertValues <- c(insertValues, claim_id)
  }

  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    insertFields <- c(insertFields, "[member id]")
    insertValues <- c(insertValues, member_id)
  }

  if (missing(type_of_claim)) {
    type_of_claim <- defaults$type_of_claim
  }
  if (!is.null(type_of_claim)) {
    insertFields <- c(insertFields, "[type of claim]")
    insertValues <- c(insertValues, type_of_claim)
  }

  if (missing(month_and_year_of_medical_care)) {
    month_and_year_of_medical_care <- defaults$month_and_year_of_medical_care
  }
  if (!is.null(month_and_year_of_medical_care)) {
    insertFields <- c(insertFields, "[month and year of medical care]")
    insertValues <- c(insertValues, month_and_year_of_medical_care)
  }

  if (missing(date_of_procedure)) {
    date_of_procedure <- defaults$date_of_procedure
  }
  if (!is.null(date_of_procedure)) {
    insertFields <- c(insertFields, "[date of procedure]")
    insertValues <- c(insertValues, date_of_procedure)
  }

  if (missing(institution_id)) {
    institution_id <- defaults$institution_id
  }
  if (!is.null(institution_id)) {
    insertFields <- c(insertFields, "[institution id]")
    insertValues <- c(insertValues, institution_id)
  }

  if (missing(icd9cm_level1)) {
    icd9cm_level1 <- defaults$icd9cm_level1
  }
  if (!is.null(icd9cm_level1)) {
    insertFields <- c(insertFields, "icd9cm_level1")
    insertValues <- c(insertValues, icd9cm_level1)
  }

  if (missing(statement_id)) {
    statement_id <- defaults$statement_id
  }
  if (!is.null(statement_id)) {
    insertFields <- c(insertFields, "[statement id]")
    insertValues <- c(insertValues, statement_id)
  }

  if (missing(procedure_medical_care_category_medium_classification_name)) {
    procedure_medical_care_category_medium_classification_name <- defaults$procedure_medical_care_category_medium_classification_name
  }
  if (!is.null(procedure_medical_care_category_medium_classification_name)) {
    insertFields <- c(insertFields, "[procedure medical care category medium classification name]")
    insertValues <- c(insertValues, procedure_medical_care_category_medium_classification_name)
  }

  if (missing(procedure_medical_care_category_small_classification_name)) {
    procedure_medical_care_category_small_classification_name <- defaults$procedure_medical_care_category_small_classification_name
  }
  if (!is.null(procedure_medical_care_category_small_classification_name)) {
    insertFields <- c(insertFields, "[procedure medical care category small classification name]")
    insertValues <- c(insertValues, procedure_medical_care_category_small_classification_name)
  }

  if (missing(procedure_medical_care_category_subclassification_name)) {
    procedure_medical_care_category_subclassification_name <- defaults$procedure_medical_care_category_subclassification_name
  }
  if (!is.null(procedure_medical_care_category_subclassification_name)) {
    insertFields <- c(insertFields, "[procedure medical care category subclassification name]")
    insertValues <- c(insertValues, procedure_medical_care_category_subclassification_name)
  }

  if (missing(icd9cm_level2)) {
    icd9cm_level2 <- defaults$icd9cm_level2
  }
  if (!is.null(icd9cm_level2)) {
    insertFields <- c(insertFields, "icd9cm_level2")
    insertValues <- c(insertValues, icd9cm_level2)
  }

  if (missing(icd9cm_level3)) {
    icd9cm_level3 <- defaults$icd9cm_level3
  }
  if (!is.null(icd9cm_level3)) {
    insertFields <- c(insertFields, "icd9cm_level3")
    insertValues <- c(insertValues, icd9cm_level3)
  }

  if (missing(icd9cm_level4)) {
    icd9cm_level4 <- defaults$icd9cm_level4
  }
  if (!is.null(icd9cm_level4)) {
    insertFields <- c(insertFields, "icd9cm_level4")
    insertValues <- c(insertValues, icd9cm_level4)
  }

  if (missing(icd9cm_level5)) {
    icd9cm_level5 <- defaults$icd9cm_level5
  }
  if (!is.null(icd9cm_level5)) {
    insertFields <- c(insertFields, "icd9cm_level5")
    insertValues <- c(insertValues, icd9cm_level5)
  }

  if (missing(procedure_code)) {
    procedure_code <- defaults$procedure_code
  }
  if (!is.null(procedure_code)) {
    insertFields <- c(insertFields, "[procedure code]")
    insertValues <- c(insertValues, procedure_code)
  }

  if (missing(standardized_procedure_id)) {
    standardized_procedure_id <- defaults$standardized_procedure_id
  }
  if (!is.null(standardized_procedure_id)) {
    insertFields <- c(insertFields, "[standardized procedure id]")
    insertValues <- c(insertValues, standardized_procedure_id)
  }

  if (missing(standardized_procedure_name)) {
    standardized_procedure_name <- defaults$standardized_procedure_name
  }
  if (!is.null(standardized_procedure_name)) {
    insertFields <- c(insertFields, "[standardized procedure name]")
    insertValues <- c(insertValues, standardized_procedure_name)
  }

  if (missing(number_of_times)) {
    number_of_times <- defaults$number_of_times
  }
  if (!is.null(number_of_times)) {
    insertFields <- c(insertFields, "[number of times]")
    insertValues <- c(insertValues, number_of_times)
  }

  if (missing(concurrent_id)) {
    concurrent_id <- defaults$concurrent_id
  }
  if (!is.null(concurrent_id)) {
    insertFields <- c(insertFields, "[concurrent id]")
    insertValues <- c(insertValues, concurrent_id)
  }

  if (missing(category_of_medical_care)) {
    category_of_medical_care <- defaults$category_of_medical_care
  }
  if (!is.null(category_of_medical_care)) {
    insertFields <- c(insertFields, "[category of medical care]")
    insertValues <- c(insertValues, category_of_medical_care)
  }

  if (missing(standard_point)) {
    standard_point <- defaults$standard_point
  }
  if (!is.null(standard_point)) {
    insertFields <- c(insertFields, "[standard point]")
    insertValues <- c(insertValues, standard_point)
  }

  if (missing(actual_point)) {
    actual_point <- defaults$actual_point
  }
  if (!is.null(actual_point)) {
    insertFields <- c(insertFields, "[actual point]")
    insertValues <- c(insertValues, actual_point)
  }

  statement <- paste0("INSERT INTO [procedure] (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add_health_checkups <- function(member_id, month_and_year_of_health_chechups, bmi, amount_of_visceral_fat, abdominal_girth, sbp, dbp, tc, tg, hdl_c, ldl_c, gpt, g_gt, fasting_blood_sugar, casual_blood_sugar, hba1c, urine_sugar, urine_protein, hematocrit, hemoglobin, red_blood_cell_count, serum_uric_acid, serum_creatinine, electrocardiogram, ophthalmoscopy_k_w_classificatio, ophthalmoscopy_scheie_classifica, ophthalmoscopy_scheie_classific0, ophthalmoscopy_scott_classificat, smoking_habits, eating_habit_1, eating_habit_2, eating_habit_3, eating_habit_4, drinking_habits, sleeping) {
  defaults <- get("health_checkups", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    insertFields <- c(insertFields, "[member id]")
    insertValues <- c(insertValues, member_id)
  }

  if (missing(month_and_year_of_health_chechups)) {
    month_and_year_of_health_chechups <- defaults$month_and_year_of_health_chechups
  }
  if (!is.null(month_and_year_of_health_chechups)) {
    insertFields <- c(insertFields, "[month and year of health chechups]")
    insertValues <- c(insertValues, month_and_year_of_health_chechups)
  }

  if (missing(bmi)) {
    bmi <- defaults$bmi
  }
  if (!is.null(bmi)) {
    insertFields <- c(insertFields, "bmi")
    insertValues <- c(insertValues, bmi)
  }

  if (missing(amount_of_visceral_fat)) {
    amount_of_visceral_fat <- defaults$amount_of_visceral_fat
  }
  if (!is.null(amount_of_visceral_fat)) {
    insertFields <- c(insertFields, "[amount of visceral fat]")
    insertValues <- c(insertValues, amount_of_visceral_fat)
  }

  if (missing(abdominal_girth)) {
    abdominal_girth <- defaults$abdominal_girth
  }
  if (!is.null(abdominal_girth)) {
    insertFields <- c(insertFields, "[abdominal girth]")
    insertValues <- c(insertValues, abdominal_girth)
  }

  if (missing(sbp)) {
    sbp <- defaults$sbp
  }
  if (!is.null(sbp)) {
    insertFields <- c(insertFields, "sbp")
    insertValues <- c(insertValues, sbp)
  }

  if (missing(dbp)) {
    dbp <- defaults$dbp
  }
  if (!is.null(dbp)) {
    insertFields <- c(insertFields, "dbp")
    insertValues <- c(insertValues, dbp)
  }

  if (missing(tc)) {
    tc <- defaults$tc
  }
  if (!is.null(tc)) {
    insertFields <- c(insertFields, "tc")
    insertValues <- c(insertValues, tc)
  }

  if (missing(tg)) {
    tg <- defaults$tg
  }
  if (!is.null(tg)) {
    insertFields <- c(insertFields, "tg")
    insertValues <- c(insertValues, tg)
  }

  if (missing(hdl_c)) {
    hdl_c <- defaults$hdl_c
  }
  if (!is.null(hdl_c)) {
    insertFields <- c(insertFields, "[hdl c]")
    insertValues <- c(insertValues, hdl_c)
  }

  if (missing(ldl_c)) {
    ldl_c <- defaults$ldl_c
  }
  if (!is.null(ldl_c)) {
    insertFields <- c(insertFields, "[ldl c]")
    insertValues <- c(insertValues, ldl_c)
  }

  if (missing(gpt)) {
    gpt <- defaults$gpt
  }
  if (!is.null(gpt)) {
    insertFields <- c(insertFields, "gpt")
    insertValues <- c(insertValues, gpt)
  }

  if (missing(g_gt)) {
    g_gt <- defaults$g_gt
  }
  if (!is.null(g_gt)) {
    insertFields <- c(insertFields, "[g gt]")
    insertValues <- c(insertValues, g_gt)
  }

  if (missing(fasting_blood_sugar)) {
    fasting_blood_sugar <- defaults$fasting_blood_sugar
  }
  if (!is.null(fasting_blood_sugar)) {
    insertFields <- c(insertFields, "[fasting blood sugar]")
    insertValues <- c(insertValues, fasting_blood_sugar)
  }

  if (missing(casual_blood_sugar)) {
    casual_blood_sugar <- defaults$casual_blood_sugar
  }
  if (!is.null(casual_blood_sugar)) {
    insertFields <- c(insertFields, "[casual blood sugar]")
    insertValues <- c(insertValues, casual_blood_sugar)
  }

  if (missing(hba1c)) {
    hba1c <- defaults$hba1c
  }
  if (!is.null(hba1c)) {
    insertFields <- c(insertFields, "hba1c")
    insertValues <- c(insertValues, hba1c)
  }

  if (missing(urine_sugar)) {
    urine_sugar <- defaults$urine_sugar
  }
  if (!is.null(urine_sugar)) {
    insertFields <- c(insertFields, "[urine sugar]")
    insertValues <- c(insertValues, urine_sugar)
  }

  if (missing(urine_protein)) {
    urine_protein <- defaults$urine_protein
  }
  if (!is.null(urine_protein)) {
    insertFields <- c(insertFields, "[urine protein]")
    insertValues <- c(insertValues, urine_protein)
  }

  if (missing(hematocrit)) {
    hematocrit <- defaults$hematocrit
  }
  if (!is.null(hematocrit)) {
    insertFields <- c(insertFields, "hematocrit")
    insertValues <- c(insertValues, hematocrit)
  }

  if (missing(hemoglobin)) {
    hemoglobin <- defaults$hemoglobin
  }
  if (!is.null(hemoglobin)) {
    insertFields <- c(insertFields, "hemoglobin")
    insertValues <- c(insertValues, hemoglobin)
  }

  if (missing(red_blood_cell_count)) {
    red_blood_cell_count <- defaults$red_blood_cell_count
  }
  if (!is.null(red_blood_cell_count)) {
    insertFields <- c(insertFields, "[red blood cell count]")
    insertValues <- c(insertValues, red_blood_cell_count)
  }

  if (missing(serum_uric_acid)) {
    serum_uric_acid <- defaults$serum_uric_acid
  }
  if (!is.null(serum_uric_acid)) {
    insertFields <- c(insertFields, "[serum uric acid]")
    insertValues <- c(insertValues, serum_uric_acid)
  }

  if (missing(serum_creatinine)) {
    serum_creatinine <- defaults$serum_creatinine
  }
  if (!is.null(serum_creatinine)) {
    insertFields <- c(insertFields, "[serum creatinine]")
    insertValues <- c(insertValues, serum_creatinine)
  }

  if (missing(electrocardiogram)) {
    electrocardiogram <- defaults$electrocardiogram
  }
  if (!is.null(electrocardiogram)) {
    insertFields <- c(insertFields, "electrocardiogram")
    insertValues <- c(insertValues, electrocardiogram)
  }

  if (missing(ophthalmoscopy_k_w_classificatio)) {
    ophthalmoscopy_k_w_classificatio <- defaults$ophthalmoscopy_k_w_classificatio
  }
  if (!is.null(ophthalmoscopy_k_w_classificatio)) {
    insertFields <- c(insertFields, "[ophthalmoscopy k w classificatio]")
    insertValues <- c(insertValues, ophthalmoscopy_k_w_classificatio)
  }

  if (missing(ophthalmoscopy_scheie_classifica)) {
    ophthalmoscopy_scheie_classifica <- defaults$ophthalmoscopy_scheie_classifica
  }
  if (!is.null(ophthalmoscopy_scheie_classifica)) {
    insertFields <- c(insertFields, "[ophthalmoscopy scheie classifica]")
    insertValues <- c(insertValues, ophthalmoscopy_scheie_classifica)
  }

  if (missing(ophthalmoscopy_scheie_classific0)) {
    ophthalmoscopy_scheie_classific0 <- defaults$ophthalmoscopy_scheie_classific0
  }
  if (!is.null(ophthalmoscopy_scheie_classific0)) {
    insertFields <- c(insertFields, "[ophthalmoscopy scheie classific0]")
    insertValues <- c(insertValues, ophthalmoscopy_scheie_classific0)
  }

  if (missing(ophthalmoscopy_scott_classificat)) {
    ophthalmoscopy_scott_classificat <- defaults$ophthalmoscopy_scott_classificat
  }
  if (!is.null(ophthalmoscopy_scott_classificat)) {
    insertFields <- c(insertFields, "[ophthalmoscopy scott classificat]")
    insertValues <- c(insertValues, ophthalmoscopy_scott_classificat)
  }

  if (missing(smoking_habits)) {
    smoking_habits <- defaults$smoking_habits
  }
  if (!is.null(smoking_habits)) {
    insertFields <- c(insertFields, "[smoking habits]")
    insertValues <- c(insertValues, smoking_habits)
  }

  if (missing(eating_habit_1)) {
    eating_habit_1 <- defaults$eating_habit_1
  }
  if (!is.null(eating_habit_1)) {
    insertFields <- c(insertFields, "[eating habit 1]")
    insertValues <- c(insertValues, eating_habit_1)
  }

  if (missing(eating_habit_2)) {
    eating_habit_2 <- defaults$eating_habit_2
  }
  if (!is.null(eating_habit_2)) {
    insertFields <- c(insertFields, "[eating habit 2]")
    insertValues <- c(insertValues, eating_habit_2)
  }

  if (missing(eating_habit_3)) {
    eating_habit_3 <- defaults$eating_habit_3
  }
  if (!is.null(eating_habit_3)) {
    insertFields <- c(insertFields, "[eating habit 3]")
    insertValues <- c(insertValues, eating_habit_3)
  }

  if (missing(eating_habit_4)) {
    eating_habit_4 <- defaults$eating_habit_4
  }
  if (!is.null(eating_habit_4)) {
    insertFields <- c(insertFields, "[eating habit 4]")
    insertValues <- c(insertValues, eating_habit_4)
  }

  if (missing(drinking_habits)) {
    drinking_habits <- defaults$drinking_habits
  }
  if (!is.null(drinking_habits)) {
    insertFields <- c(insertFields, "[drinking habits]")
    insertValues <- c(insertValues, drinking_habits)
  }

  if (missing(sleeping)) {
    sleeping <- defaults$sleeping
  }
  if (!is.null(sleeping)) {
    insertFields <- c(insertFields, "sleeping")
    insertValues <- c(insertValues, sleeping)
  }

  statement <- paste0("INSERT INTO [health checkups] (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add_material <- function(claim_id, statement_id, member_id, type_of_claim, month_and_year_of_medical_care, date_of_procedure, institution_id, material_category_large_classification_name, material_category_medium_classification_name, material_code, standardized_material_id, standardized_material_name, unit, number_of_material, concurrent_id, category_of_medical_care, standard_price, actual_point) {
  defaults <- get("material", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(claim_id)) {
    claim_id <- defaults$claim_id
  }
  if (!is.null(claim_id)) {
    insertFields <- c(insertFields, "[claim id]")
    insertValues <- c(insertValues, claim_id)
  }

  if (missing(statement_id)) {
    statement_id <- defaults$statement_id
  }
  if (!is.null(statement_id)) {
    insertFields <- c(insertFields, "[statement id]")
    insertValues <- c(insertValues, statement_id)
  }

  if (missing(member_id)) {
    member_id <- defaults$member_id
  }
  if (!is.null(member_id)) {
    insertFields <- c(insertFields, "[member id]")
    insertValues <- c(insertValues, member_id)
  }

  if (missing(type_of_claim)) {
    type_of_claim <- defaults$type_of_claim
  }
  if (!is.null(type_of_claim)) {
    insertFields <- c(insertFields, "[type of claim]")
    insertValues <- c(insertValues, type_of_claim)
  }

  if (missing(month_and_year_of_medical_care)) {
    month_and_year_of_medical_care <- defaults$month_and_year_of_medical_care
  }
  if (!is.null(month_and_year_of_medical_care)) {
    insertFields <- c(insertFields, "[month and year of medical care]")
    insertValues <- c(insertValues, month_and_year_of_medical_care)
  }

  if (missing(date_of_procedure)) {
    date_of_procedure <- defaults$date_of_procedure
  }
  if (!is.null(date_of_procedure)) {
    insertFields <- c(insertFields, "[date of procedure]")
    insertValues <- c(insertValues, date_of_procedure)
  }

  if (missing(institution_id)) {
    institution_id <- defaults$institution_id
  }
  if (!is.null(institution_id)) {
    insertFields <- c(insertFields, "[institution id]")
    insertValues <- c(insertValues, institution_id)
  }

  if (missing(material_category_large_classification_name)) {
    material_category_large_classification_name <- defaults$material_category_large_classification_name
  }
  if (!is.null(material_category_large_classification_name)) {
    insertFields <- c(insertFields, "[material category large classification name]")
    insertValues <- c(insertValues, material_category_large_classification_name)
  }

  if (missing(material_category_medium_classification_name)) {
    material_category_medium_classification_name <- defaults$material_category_medium_classification_name
  }
  if (!is.null(material_category_medium_classification_name)) {
    insertFields <- c(insertFields, "[material category medium classification name]")
    insertValues <- c(insertValues, material_category_medium_classification_name)
  }

  if (missing(material_code)) {
    material_code <- defaults$material_code
  }
  if (!is.null(material_code)) {
    insertFields <- c(insertFields, "[material code]")
    insertValues <- c(insertValues, material_code)
  }

  if (missing(standardized_material_id)) {
    standardized_material_id <- defaults$standardized_material_id
  }
  if (!is.null(standardized_material_id)) {
    insertFields <- c(insertFields, "[standardized material id]")
    insertValues <- c(insertValues, standardized_material_id)
  }

  if (missing(standardized_material_name)) {
    standardized_material_name <- defaults$standardized_material_name
  }
  if (!is.null(standardized_material_name)) {
    insertFields <- c(insertFields, "[standardized material name]")
    insertValues <- c(insertValues, standardized_material_name)
  }

  if (missing(unit)) {
    unit <- defaults$unit
  }
  if (!is.null(unit)) {
    insertFields <- c(insertFields, "unit")
    insertValues <- c(insertValues, unit)
  }

  if (missing(number_of_material)) {
    number_of_material <- defaults$number_of_material
  }
  if (!is.null(number_of_material)) {
    insertFields <- c(insertFields, "[number of material]")
    insertValues <- c(insertValues, number_of_material)
  }

  if (missing(concurrent_id)) {
    concurrent_id <- defaults$concurrent_id
  }
  if (!is.null(concurrent_id)) {
    insertFields <- c(insertFields, "[concurrent id]")
    insertValues <- c(insertValues, concurrent_id)
  }

  if (missing(category_of_medical_care)) {
    category_of_medical_care <- defaults$category_of_medical_care
  }
  if (!is.null(category_of_medical_care)) {
    insertFields <- c(insertFields, "[category of medical care]")
    insertValues <- c(insertValues, category_of_medical_care)
  }

  if (missing(standard_price)) {
    standard_price <- defaults$standard_price
  }
  if (!is.null(standard_price)) {
    insertFields <- c(insertFields, "[standard price]")
    insertValues <- c(insertValues, standard_price)
  }

  if (missing(actual_point)) {
    actual_point <- defaults$actual_point
  }
  if (!is.null(actual_point)) {
    insertFields <- c(insertFields, "[actual point]")
    insertValues <- c(insertValues, actual_point)
  }

  statement <- paste0("INSERT INTO material (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add__version <- function(version_id, version_date) {
  defaults <- get("_version", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(version_id)) {
    version_id <- defaults$version_id
  }
  if (!is.null(version_id)) {
    insertFields <- c(insertFields, "version_id")
    insertValues <- c(insertValues, version_id)
  }

  if (missing(version_date)) {
    version_date <- defaults$version_date
  }
  if (!is.null(version_date)) {
    insertFields <- c(insertFields, "version_date")
    insertValues <- c(insertValues, version_date)
  }

  statement <- paste0("INSERT INTO _version (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_person <- function(person_id, year_of_birth, gender_concept_id, month_of_birth, day_of_birth, time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM person WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, " month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      statement <- paste0(statement, " month_of_birth = (", as.character(month_of_birth), ")")
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }

  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, " day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      statement <- paste0(statement, " day_of_birth = (", as.character(day_of_birth), ")")
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }

  if (!missing(time_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(time_of_birth)) {
      statement <- paste0(statement, " time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      statement <- paste0(statement, " time_of_birth = (", as.character(time_of_birth), ")")
    } else {
      statement <- paste0(statement, " time_of_birth = '", time_of_birth,"'")
    }
  }

  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, " race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      statement <- paste0(statement, " race_concept_id = (", as.character(race_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, " ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, " person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      statement <- paste0(statement, " person_source_value = (", as.character(person_source_value), ")")
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, " race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      statement <- paste0(statement, " race_source_value = (", as.character(race_source_value), ")")
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }

  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, " race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      statement <- paste0(statement, " race_source_concept_id = (", as.character(race_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, " ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_value = (", as.character(ethnicity_source_value), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, " ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) FROM observation_period WHERE")
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, " observation_period_id IS NULL")
    } else if (is(observation_period_id, "subQuery")){
      statement <- paste0(statement, " observation_period_id = (", as.character(observation_period_id), ")")
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, " observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      statement <- paste0(statement, " observation_period_start_date = (", as.character(observation_period_start_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }

  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, " observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      statement <- paste0(statement, " observation_period_end_date = (", as.character(observation_period_end_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }

  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, " period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      statement <- paste0(statement, " period_type_concept_id = (", as.character(period_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect care_site' AS test, CASE WHEN(SELECT COUNT(*) FROM care_site WHERE")
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, " care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      statement <- paste0(statement, " care_site_name = (", as.character(care_site_name), ")")
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, " place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      statement <- paste0(statement, " place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")")
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, " care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      statement <- paste0(statement, " care_site_source_value = (", as.character(care_site_source_value), ")")
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, " place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      statement <- paste0(statement, " place_of_service_source_value = (", as.character(place_of_service_source_value), ")")
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_occurrence WHERE")
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, " visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_concept_id = (", as.character(visit_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, " visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      statement <- paste0(statement, " visit_start_date = (", as.character(visit_start_date), ")")
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }

  if (!missing(visit_start_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_time)) {
      statement <- paste0(statement, " visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      statement <- paste0(statement, " visit_start_time = (", as.character(visit_start_time), ")")
    } else {
      statement <- paste0(statement, " visit_start_time = '", visit_start_time,"'")
    }
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, " visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      statement <- paste0(statement, " visit_end_date = (", as.character(visit_end_date), ")")
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }

  if (!missing(visit_end_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_time)) {
      statement <- paste0(statement, " visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      statement <- paste0(statement, " visit_end_time = (", as.character(visit_end_time), ")")
    } else {
      statement <- paste0(statement, " visit_end_time = '", visit_end_time,"'")
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, " visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_type_concept_id = (", as.character(visit_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, " visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      statement <- paste0(statement, " visit_source_value = (", as.character(visit_source_value), ")")
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, " visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_source_concept_id = (", as.character(visit_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_provider <- function(provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) FROM provider WHERE")
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, " provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      statement <- paste0(statement, " provider_name = (", as.character(provider_name), ")")
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }

  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(npi)) {
      statement <- paste0(statement, " npi IS NULL")
    } else if (is(npi, "subQuery")){
      statement <- paste0(statement, " npi = (", as.character(npi), ")")
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }

  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dea)) {
      statement <- paste0(statement, " dea IS NULL")
    } else if (is(dea, "subQuery")){
      statement <- paste0(statement, " dea = (", as.character(dea), ")")
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }

  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, " specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_concept_id = (", as.character(specialty_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, " provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      statement <- paste0(statement, " provider_source_value = (", as.character(provider_source_value), ")")
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }

  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, " specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      statement <- paste0(statement, " specialty_source_value = (", as.character(specialty_source_value), ")")
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, " specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_death <- function(person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM death WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, " death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      statement <- paste0(statement, " death_date = (", as.character(death_date), ")")
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }

  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, " death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      statement <- paste0(statement, " death_type_concept_id = (", as.character(death_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }

  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, " cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_concept_id = (", as.character(cause_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }

  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, " cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      statement <- paste0(statement, " cause_source_value = (", as.character(cause_source_value), ")")
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, " cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_source_concept_id = (", as.character(cause_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_condition_occurrence <- function(condition_occurrence_id, visit_occurrence_id, person_id, condition_type_concept_id, condition_start_date, condition_end_date, provider_id, condition_concept_id, condition_source_value, condition_source_concept_id, stop_reason) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_occurrence WHERE")
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, " condition_occurrence_id IS NULL")
    } else if (is(condition_occurrence_id, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_id = (", as.character(condition_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, " condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_type_concept_id = (", as.character(condition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }

  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, " condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      statement <- paste0(statement, " condition_start_date = (", as.character(condition_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }

  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, " condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      statement <- paste0(statement, " condition_end_date = (", as.character(condition_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, " condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      statement <- paste0(statement, " condition_source_value = (", as.character(condition_source_value), ")")
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, " condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_source_concept_id = (", as.character(condition_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_drug_exposure <- function(drug_exposure_id, visit_occurrence_id, person_id, drug_type_concept_id, provider_id, drug_exposure_start_date, drug_exposure_end_date, days_supply, quantity, drug_concept_id, drug_source_value, sig, stop_reason, refills, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_exposure WHERE")
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, " drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_type_concept_id = (", as.character(drug_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, " drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, " drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }

  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, " days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      statement <- paste0(statement, " days_supply = (", as.character(days_supply), ")")
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, " drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      statement <- paste0(statement, " drug_source_value = (", as.character(drug_source_value), ")")
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }

  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(sig)) {
      statement <- paste0(statement, " sig IS NULL")
    } else if (is(sig, "subQuery")){
      statement <- paste0(statement, " sig = (", as.character(sig), ")")
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(refills)) {
      statement <- paste0(statement, " refills IS NULL")
    } else if (is(refills, "subQuery")){
      statement <- paste0(statement, " refills = (", as.character(refills), ")")
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }

  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, " route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      statement <- paste0(statement, " route_concept_id = (", as.character(route_concept_id), ")")
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }

  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, " effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      statement <- paste0(statement, " effective_drug_dose = (", as.character(effective_drug_dose), ")")
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, " dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      statement <- paste0(statement, " dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }

  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, " lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      statement <- paste0(statement, " lot_number = (", as.character(lot_number), ")")
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, " drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_source_concept_id = (", as.character(drug_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }

  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, " route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      statement <- paste0(statement, " route_source_value = (", as.character(route_source_value), ")")
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, " dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      statement <- paste0(statement, " dose_unit_source_value = (", as.character(dose_unit_source_value), ")")
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_procedure_occurrence <- function(procedure_occurrence_id, visit_occurrence_id, person_id, procedure_type_concept_id, procedure_date, provider_id, procedure_concept_id, procedure_source_value, procedure_source_concept_id, modifier_concept_id, quantity, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_occurrence WHERE")
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, " procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }

  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, " procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      statement <- paste0(statement, " procedure_date = (", as.character(procedure_date), ")")
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, " procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_concept_id = (", as.character(procedure_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }

  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, " procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      statement <- paste0(statement, " procedure_source_value = (", as.character(procedure_source_value), ")")
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, " procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }

  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, " modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      statement <- paste0(statement, " modifier_concept_id = (", as.character(modifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_measurement <- function(measurement_id, visit_occurrence_id, person_id, measurement_type_concept_id, measurement_time, measurement_date, provider_id, measurement_concept_id, measurement_source_value, measurement_source_concept_id, operator_concept_id, value_as_number, value_source_value, value_as_concept_id, unit_concept_id, unit_source_value, range_low, range_high) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect measurement' AS test, CASE WHEN(SELECT COUNT(*) FROM measurement WHERE")
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, " measurement_id IS NULL")
    } else if (is(measurement_id, "subQuery")){
      statement <- paste0(statement, " measurement_id = (", as.character(measurement_id), ")")
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, " measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }

  if (!missing(measurement_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_time)) {
      statement <- paste0(statement, " measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      statement <- paste0(statement, " measurement_time = (", as.character(measurement_time), ")")
    } else {
      statement <- paste0(statement, " measurement_time = '", measurement_time,"'")
    }
  }

  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, " measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      statement <- paste0(statement, " measurement_date = (", as.character(measurement_date), ")")
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, " measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_concept_id = (", as.character(measurement_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }

  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, " measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      statement <- paste0(statement, " measurement_source_value = (", as.character(measurement_source_value), ")")
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, " measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }

  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, " operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      statement <- paste0(statement, " operator_concept_id = (", as.character(operator_concept_id), ")")
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, " value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      statement <- paste0(statement, " value_source_value = (", as.character(value_source_value), ")")
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, " range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      statement <- paste0(statement, " range_low = (", as.character(range_low), ")")
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }

  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, " range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      statement <- paste0(statement, " range_high = (", as.character(range_high), ")")
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_observation <- function(observation_id, visit_occurrence_id, person_id, observation_type_concept_id, observation_date, provider_id, observation_concept_id, observation_source_value, observation_source_concept_id, value_as_concept_id, observation_time, value_as_number, value_as_string, qualifier_concept_id, unit_concept_id, unit_source_value, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM observation WHERE")
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, " observation_id IS NULL")
    } else if (is(observation_id, "subQuery")){
      statement <- paste0(statement, " observation_id = (", as.character(observation_id), ")")
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, " observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_type_concept_id = (", as.character(observation_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }

  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, " observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      statement <- paste0(statement, " observation_date = (", as.character(observation_date), ")")
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, " observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_concept_id = (", as.character(observation_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }

  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, " observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      statement <- paste0(statement, " observation_source_value = (", as.character(observation_source_value), ")")
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, " observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_source_concept_id = (", as.character(observation_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(observation_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_time)) {
      statement <- paste0(statement, " observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      statement <- paste0(statement, " observation_time = (", as.character(observation_time), ")")
    } else {
      statement <- paste0(statement, " observation_time = '", observation_time,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, " value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      statement <- paste0(statement, " value_as_string = (", as.character(value_as_string), ")")
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, " qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      statement <- paste0(statement, " qualifier_concept_id = (", as.character(qualifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_drug_cost <- function(drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_cost WHERE")
  first <- TRUE
  if (!missing(drug_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_cost_id)) {
      statement <- paste0(statement, " drug_cost_id IS NULL")
    } else if (is(drug_cost_id, "subQuery")){
      statement <- paste0(statement, " drug_cost_id = (", as.character(drug_cost_id), ")")
    } else {
      statement <- paste0(statement, " drug_cost_id = '", drug_cost_id,"'")
    }
  }

  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ingredient_cost)) {
      statement <- paste0(statement, " ingredient_cost IS NULL")
    } else if (is(ingredient_cost, "subQuery")){
      statement <- paste0(statement, " ingredient_cost = (", as.character(ingredient_cost), ")")
    } else {
      statement <- paste0(statement, " ingredient_cost = '", ingredient_cost,"'")
    }
  }

  if (!missing(dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dispensing_fee)) {
      statement <- paste0(statement, " dispensing_fee IS NULL")
    } else if (is(dispensing_fee, "subQuery")){
      statement <- paste0(statement, " dispensing_fee = (", as.character(dispensing_fee), ")")
    } else {
      statement <- paste0(statement, " dispensing_fee = '", dispensing_fee,"'")
    }
  }

  if (!missing(average_wholesale_price)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(average_wholesale_price)) {
      statement <- paste0(statement, " average_wholesale_price IS NULL")
    } else if (is(average_wholesale_price, "subQuery")){
      statement <- paste0(statement, " average_wholesale_price = (", as.character(average_wholesale_price), ")")
    } else {
      statement <- paste0(statement, " average_wholesale_price = '", average_wholesale_price,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_procedure_cost <- function(procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_cost WHERE")
  first <- TRUE
  if (!missing(procedure_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_cost_id)) {
      statement <- paste0(statement, " procedure_cost_id IS NULL")
    } else if (is(procedure_cost_id, "subQuery")){
      statement <- paste0(statement, " procedure_cost_id = (", as.character(procedure_cost_id), ")")
    } else {
      statement <- paste0(statement, " procedure_cost_id = '", procedure_cost_id,"'")
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, " revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      statement <- paste0(statement, " revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")")
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, " revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      statement <- paste0(statement, " revenue_code_source_value = (", as.character(revenue_code_source_value), ")")
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM device_exposure WHERE")
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, " device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      statement <- paste0(statement, " device_concept_id = (", as.character(device_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, " device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_start_date = (", as.character(device_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, " device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_end_date = (", as.character(device_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }

  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, " device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      statement <- paste0(statement, " device_type_concept_id = (", as.character(device_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }

  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, " unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      statement <- paste0(statement, " unique_device_id = (", as.character(unique_device_id), ")")
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, " device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      statement <- paste0(statement, " device_source_value = (", as.character(device_source_value), ")")
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }

  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, " device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      statement <- paste0(statement, " device_source_concept_id = (", as.character(device_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_note <- function(note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect note' AS test, CASE WHEN(SELECT COUNT(*) FROM note WHERE")
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, " note_id IS NULL")
    } else if (is(note_id, "subQuery")){
      statement <- paste0(statement, " note_id = (", as.character(note_id), ")")
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, " note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      statement <- paste0(statement, " note_date = (", as.character(note_date), ")")
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }

  if (!missing(note_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_time)) {
      statement <- paste0(statement, " note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      statement <- paste0(statement, " note_time = (", as.character(note_time), ")")
    } else {
      statement <- paste0(statement, " note_time = '", note_time,"'")
    }
  }

  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, " note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      statement <- paste0(statement, " note_type_concept_id = (", as.character(note_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }

  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, " note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      statement <- paste0(statement, " note_text = (", as.character(note_text), ")")
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, " note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      statement <- paste0(statement, " note_source_value = (", as.character(note_source_value), ")")
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect specimen' AS test, CASE WHEN(SELECT COUNT(*) FROM specimen WHERE")
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, " specimen_id IS NULL")
    } else if (is(specimen_id, "subQuery")){
      statement <- paste0(statement, " specimen_id = (", as.character(specimen_id), ")")
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, " specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_concept_id = (", as.character(specimen_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, " specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }

  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, " specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      statement <- paste0(statement, " specimen_date = (", as.character(specimen_date), ")")
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }

  if (!missing(specimen_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_time)) {
      statement <- paste0(statement, " specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      statement <- paste0(statement, " specimen_time = (", as.character(specimen_time), ")")
    } else {
      statement <- paste0(statement, " specimen_time = '", specimen_time,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, " anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      statement <- paste0(statement, " anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, " disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      statement <- paste0(statement, " disease_status_concept_id = (", as.character(disease_status_concept_id), ")")
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }

  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, " specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      statement <- paste0(statement, " specimen_source_id = (", as.character(specimen_source_id), ")")
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }

  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, " specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      statement <- paste0(statement, " specimen_source_value = (", as.character(specimen_source_value), ")")
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, " anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      statement <- paste0(statement, " anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }

  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, " disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      statement <- paste0(statement, " disease_status_source_value = (", as.character(disease_status_source_value), ")")
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect fact_relationship' AS test, CASE WHEN(SELECT COUNT(*) FROM fact_relationship WHERE")
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, " domain_concept_id_1 IS NULL")
    } else if (is(domain_concept_id_1, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_1 = (", as.character(domain_concept_id_1), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }

  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, " fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      statement <- paste0(statement, " fact_id_1 = (", as.character(fact_id_1), ")")
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, " domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_2 = (", as.character(domain_concept_id_2), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }

  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, " fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      statement <- paste0(statement, " fact_id_2 = (", as.character(fact_id_2), ")")
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, " relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      statement <- paste0(statement, " relationship_concept_id = (", as.character(relationship_concept_id), ")")
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect location' AS test, CASE WHEN(SELECT COUNT(*) FROM location WHERE")
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, " address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      statement <- paste0(statement, " address_1 = (", as.character(address_1), ")")
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }

  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, " address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      statement <- paste0(statement, " address_2 = (", as.character(address_2), ")")
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }

  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(city)) {
      statement <- paste0(statement, " city IS NULL")
    } else if (is(city, "subQuery")){
      statement <- paste0(statement, " city = (", as.character(city), ")")
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }

  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(state)) {
      statement <- paste0(statement, " state IS NULL")
    } else if (is(state, "subQuery")){
      statement <- paste0(statement, " state = (", as.character(state), ")")
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }

  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(zip)) {
      statement <- paste0(statement, " zip IS NULL")
    } else if (is(zip, "subQuery")){
      statement <- paste0(statement, " zip = (", as.character(zip), ")")
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }

  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(county)) {
      statement <- paste0(statement, " county IS NULL")
    } else if (is(county, "subQuery")){
      statement <- paste0(statement, " county = (", as.character(county), ")")
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }

  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, " location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      statement <- paste0(statement, " location_source_value = (", as.character(location_source_value), ")")
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_visit_cost <- function(visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_cost WHERE")
  first <- TRUE
  if (!missing(visit_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_cost_id)) {
      statement <- paste0(statement, " visit_cost_id IS NULL")
    } else if (is(visit_cost_id, "subQuery")){
      statement <- paste0(statement, " visit_cost_id = (", as.character(visit_cost_id), ")")
    } else {
      statement <- paste0(statement, " visit_cost_id = '", visit_cost_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect payer_plan_period' AS test, CASE WHEN(SELECT COUNT(*) FROM payer_plan_period WHERE")
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, " payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, " payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }

  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, " payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      statement <- paste0(statement, " payer_source_value = (", as.character(payer_source_value), ")")
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }

  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, " plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      statement <- paste0(statement, " plan_source_value = (", as.character(plan_source_value), ")")
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }

  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, " family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      statement <- paste0(statement, " family_source_value = (", as.character(family_source_value), ")")
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_device_cost <- function(device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM device_cost WHERE")
  first <- TRUE
  if (!missing(device_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_cost_id)) {
      statement <- paste0(statement, " device_cost_id IS NULL")
    } else if (is(device_cost_id, "subQuery")){
      statement <- paste0(statement, " device_cost_id = (", as.character(device_cost_id), ")")
    } else {
      statement <- paste0(statement, " device_cost_id = '", device_cost_id,"'")
    }
  }

  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_era' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_era WHERE")
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, " drug_era_id IS NULL")
    } else if (is(drug_era_id, "subQuery")){
      statement <- paste0(statement, " drug_era_id = (", as.character(drug_era_id), ")")
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, " drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      statement <- paste0(statement, " drug_era_start_date = (", as.character(drug_era_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }

  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, " drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      statement <- paste0(statement, " drug_era_end_date = (", as.character(drug_era_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }

  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, " drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      statement <- paste0(statement, " drug_exposure_count = (", as.character(drug_exposure_count), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }

  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, " gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      statement <- paste0(statement, " gap_days = (", as.character(gap_days), ")")
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect dose_era' AS test, CASE WHEN(SELECT COUNT(*) FROM dose_era WHERE")
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, " dose_era_id IS NULL")
    } else if (is(dose_era_id, "subQuery")){
      statement <- paste0(statement, " dose_era_id = (", as.character(dose_era_id), ")")
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, " dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      statement <- paste0(statement, " dose_value = (", as.character(dose_value), ")")
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }

  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, " dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      statement <- paste0(statement, " dose_era_start_date = (", as.character(dose_era_start_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }

  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, " dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      statement <- paste0(statement, " dose_era_end_date = (", as.character(dose_era_end_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_era' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_era WHERE")
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, " condition_era_id IS NULL")
    } else if (is(condition_era_id, "subQuery")){
      statement <- paste0(statement, " condition_era_id = (", as.character(condition_era_id), ")")
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, " condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      statement <- paste0(statement, " condition_era_start_date = (", as.character(condition_era_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }

  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, " condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      statement <- paste0(statement, " condition_era_end_date = (", as.character(condition_era_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, " condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_count = (", as.character(condition_occurrence_count), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cdm_source' AS test, CASE WHEN(SELECT COUNT(*) FROM cdm_source WHERE")
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, " cdm_source_name IS NULL")
    } else if (is(cdm_source_name, "subQuery")){
      statement <- paste0(statement, " cdm_source_name = (", as.character(cdm_source_name), ")")
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, " cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      statement <- paste0(statement, " cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")")
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }

  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, " cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      statement <- paste0(statement, " cdm_holder = (", as.character(cdm_holder), ")")
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }

  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, " source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      statement <- paste0(statement, " source_description = (", as.character(source_description), ")")
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }

  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, " source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      statement <- paste0(statement, " source_documentation_reference = (", as.character(source_documentation_reference), ")")
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, " cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      statement <- paste0(statement, " cdm_etl_reference = (", as.character(cdm_etl_reference), ")")
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }

  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, " source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      statement <- paste0(statement, " source_release_date = (", as.character(source_release_date), ")")
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }

  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, " cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      statement <- paste0(statement, " cdm_release_date = (", as.character(cdm_release_date), ")")
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }

  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, " cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      statement <- paste0(statement, " cdm_version = (", as.character(cdm_version), ")")
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, " vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      statement <- paste0(statement, " vocabulary_version = (", as.character(vocabulary_version), ")")
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_definition WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, " cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      statement <- paste0(statement, " cohort_definition_name = (", as.character(cohort_definition_name), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }

  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, " cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      statement <- paste0(statement, " cohort_definition_description = (", as.character(cohort_definition_description), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, " definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " definition_type_concept_id = (", as.character(definition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, " cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      statement <- paste0(statement, " cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }

  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, " subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      statement <- paste0(statement, " subject_concept_id = (", as.character(subject_concept_id), ")")
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, " cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      statement <- paste0(statement, " cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")")
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_cohort_attribute <- function(cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_attribute' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_attribute WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect attribute_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM attribute_definition WHERE")
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, " attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      statement <- paste0(statement, " attribute_name = (", as.character(attribute_name), ")")
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }

  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, " attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      statement <- paste0(statement, " attribute_description = (", as.character(attribute_description), ")")
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, " attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      statement <- paste0(statement, " attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }

  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, " attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      statement <- paste0(statement, " attribute_syntax = (", as.character(attribute_syntax), ")")
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_person <- function(person_id, year_of_birth, gender_concept_id, month_of_birth, day_of_birth, time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM person WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, " month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      statement <- paste0(statement, " month_of_birth = (", as.character(month_of_birth), ")")
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }

  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, " day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      statement <- paste0(statement, " day_of_birth = (", as.character(day_of_birth), ")")
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }

  if (!missing(time_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(time_of_birth)) {
      statement <- paste0(statement, " time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      statement <- paste0(statement, " time_of_birth = (", as.character(time_of_birth), ")")
    } else {
      statement <- paste0(statement, " time_of_birth = '", time_of_birth,"'")
    }
  }

  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, " race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      statement <- paste0(statement, " race_concept_id = (", as.character(race_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, " ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, " person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      statement <- paste0(statement, " person_source_value = (", as.character(person_source_value), ")")
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, " race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      statement <- paste0(statement, " race_source_value = (", as.character(race_source_value), ")")
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }

  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, " race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      statement <- paste0(statement, " race_source_concept_id = (", as.character(race_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, " ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_value = (", as.character(ethnicity_source_value), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, " ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) FROM observation_period WHERE")
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, " observation_period_id IS NULL")
    } else if (is(observation_period_id, "subQuery")){
      statement <- paste0(statement, " observation_period_id = (", as.character(observation_period_id), ")")
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, " observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      statement <- paste0(statement, " observation_period_start_date = (", as.character(observation_period_start_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }

  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, " observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      statement <- paste0(statement, " observation_period_end_date = (", as.character(observation_period_end_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }

  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, " period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      statement <- paste0(statement, " period_type_concept_id = (", as.character(period_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect care_site' AS test, CASE WHEN(SELECT COUNT(*) FROM care_site WHERE")
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, " care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      statement <- paste0(statement, " care_site_name = (", as.character(care_site_name), ")")
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, " place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      statement <- paste0(statement, " place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")")
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, " care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      statement <- paste0(statement, " care_site_source_value = (", as.character(care_site_source_value), ")")
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, " place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      statement <- paste0(statement, " place_of_service_source_value = (", as.character(place_of_service_source_value), ")")
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_occurrence WHERE")
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, " visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_concept_id = (", as.character(visit_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, " visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      statement <- paste0(statement, " visit_start_date = (", as.character(visit_start_date), ")")
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }

  if (!missing(visit_start_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_time)) {
      statement <- paste0(statement, " visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      statement <- paste0(statement, " visit_start_time = (", as.character(visit_start_time), ")")
    } else {
      statement <- paste0(statement, " visit_start_time = '", visit_start_time,"'")
    }
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, " visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      statement <- paste0(statement, " visit_end_date = (", as.character(visit_end_date), ")")
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }

  if (!missing(visit_end_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_time)) {
      statement <- paste0(statement, " visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      statement <- paste0(statement, " visit_end_time = (", as.character(visit_end_time), ")")
    } else {
      statement <- paste0(statement, " visit_end_time = '", visit_end_time,"'")
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, " visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_type_concept_id = (", as.character(visit_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, " visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      statement <- paste0(statement, " visit_source_value = (", as.character(visit_source_value), ")")
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, " visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_source_concept_id = (", as.character(visit_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_provider <- function(provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) FROM provider WHERE")
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, " provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      statement <- paste0(statement, " provider_name = (", as.character(provider_name), ")")
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }

  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(npi)) {
      statement <- paste0(statement, " npi IS NULL")
    } else if (is(npi, "subQuery")){
      statement <- paste0(statement, " npi = (", as.character(npi), ")")
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }

  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dea)) {
      statement <- paste0(statement, " dea IS NULL")
    } else if (is(dea, "subQuery")){
      statement <- paste0(statement, " dea = (", as.character(dea), ")")
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }

  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, " specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_concept_id = (", as.character(specialty_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, " provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      statement <- paste0(statement, " provider_source_value = (", as.character(provider_source_value), ")")
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }

  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, " specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      statement <- paste0(statement, " specialty_source_value = (", as.character(specialty_source_value), ")")
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, " specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_death <- function(person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM death WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, " death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      statement <- paste0(statement, " death_date = (", as.character(death_date), ")")
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }

  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, " death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      statement <- paste0(statement, " death_type_concept_id = (", as.character(death_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }

  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, " cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_concept_id = (", as.character(cause_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }

  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, " cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      statement <- paste0(statement, " cause_source_value = (", as.character(cause_source_value), ")")
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, " cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_source_concept_id = (", as.character(cause_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_condition_occurrence <- function(condition_occurrence_id, visit_occurrence_id, person_id, condition_type_concept_id, condition_start_date, condition_end_date, provider_id, condition_concept_id, condition_source_value, condition_source_concept_id, stop_reason) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_occurrence WHERE")
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, " condition_occurrence_id IS NULL")
    } else if (is(condition_occurrence_id, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_id = (", as.character(condition_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, " condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_type_concept_id = (", as.character(condition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }

  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, " condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      statement <- paste0(statement, " condition_start_date = (", as.character(condition_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }

  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, " condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      statement <- paste0(statement, " condition_end_date = (", as.character(condition_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, " condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      statement <- paste0(statement, " condition_source_value = (", as.character(condition_source_value), ")")
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, " condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_source_concept_id = (", as.character(condition_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_drug_exposure <- function(drug_exposure_id, visit_occurrence_id, person_id, drug_type_concept_id, provider_id, drug_exposure_start_date, drug_exposure_end_date, days_supply, quantity, drug_concept_id, drug_source_value, sig, stop_reason, refills, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_exposure WHERE")
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, " drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_type_concept_id = (", as.character(drug_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, " drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, " drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }

  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, " days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      statement <- paste0(statement, " days_supply = (", as.character(days_supply), ")")
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, " drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      statement <- paste0(statement, " drug_source_value = (", as.character(drug_source_value), ")")
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }

  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(sig)) {
      statement <- paste0(statement, " sig IS NULL")
    } else if (is(sig, "subQuery")){
      statement <- paste0(statement, " sig = (", as.character(sig), ")")
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(refills)) {
      statement <- paste0(statement, " refills IS NULL")
    } else if (is(refills, "subQuery")){
      statement <- paste0(statement, " refills = (", as.character(refills), ")")
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }

  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, " route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      statement <- paste0(statement, " route_concept_id = (", as.character(route_concept_id), ")")
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }

  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, " effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      statement <- paste0(statement, " effective_drug_dose = (", as.character(effective_drug_dose), ")")
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, " dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      statement <- paste0(statement, " dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }

  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, " lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      statement <- paste0(statement, " lot_number = (", as.character(lot_number), ")")
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, " drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_source_concept_id = (", as.character(drug_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }

  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, " route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      statement <- paste0(statement, " route_source_value = (", as.character(route_source_value), ")")
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, " dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      statement <- paste0(statement, " dose_unit_source_value = (", as.character(dose_unit_source_value), ")")
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_procedure_occurrence <- function(procedure_occurrence_id, visit_occurrence_id, person_id, procedure_type_concept_id, procedure_date, provider_id, procedure_concept_id, procedure_source_value, procedure_source_concept_id, modifier_concept_id, quantity, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_occurrence WHERE")
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, " procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }

  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, " procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      statement <- paste0(statement, " procedure_date = (", as.character(procedure_date), ")")
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, " procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_concept_id = (", as.character(procedure_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }

  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, " procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      statement <- paste0(statement, " procedure_source_value = (", as.character(procedure_source_value), ")")
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, " procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }

  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, " modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      statement <- paste0(statement, " modifier_concept_id = (", as.character(modifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_measurement <- function(measurement_id, visit_occurrence_id, person_id, measurement_type_concept_id, measurement_time, measurement_date, provider_id, measurement_concept_id, measurement_source_value, measurement_source_concept_id, operator_concept_id, value_as_number, value_source_value, value_as_concept_id, unit_concept_id, unit_source_value, range_low, range_high) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect measurement' AS test, CASE WHEN(SELECT COUNT(*) FROM measurement WHERE")
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, " measurement_id IS NULL")
    } else if (is(measurement_id, "subQuery")){
      statement <- paste0(statement, " measurement_id = (", as.character(measurement_id), ")")
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, " measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }

  if (!missing(measurement_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_time)) {
      statement <- paste0(statement, " measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      statement <- paste0(statement, " measurement_time = (", as.character(measurement_time), ")")
    } else {
      statement <- paste0(statement, " measurement_time = '", measurement_time,"'")
    }
  }

  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, " measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      statement <- paste0(statement, " measurement_date = (", as.character(measurement_date), ")")
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, " measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_concept_id = (", as.character(measurement_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }

  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, " measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      statement <- paste0(statement, " measurement_source_value = (", as.character(measurement_source_value), ")")
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, " measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }

  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, " operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      statement <- paste0(statement, " operator_concept_id = (", as.character(operator_concept_id), ")")
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, " value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      statement <- paste0(statement, " value_source_value = (", as.character(value_source_value), ")")
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, " range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      statement <- paste0(statement, " range_low = (", as.character(range_low), ")")
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }

  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, " range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      statement <- paste0(statement, " range_high = (", as.character(range_high), ")")
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_observation <- function(observation_id, visit_occurrence_id, person_id, observation_type_concept_id, observation_date, provider_id, observation_concept_id, observation_source_value, observation_source_concept_id, value_as_concept_id, observation_time, value_as_number, value_as_string, qualifier_concept_id, unit_concept_id, unit_source_value, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM observation WHERE")
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, " observation_id IS NULL")
    } else if (is(observation_id, "subQuery")){
      statement <- paste0(statement, " observation_id = (", as.character(observation_id), ")")
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, " observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_type_concept_id = (", as.character(observation_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }

  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, " observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      statement <- paste0(statement, " observation_date = (", as.character(observation_date), ")")
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, " observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_concept_id = (", as.character(observation_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }

  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, " observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      statement <- paste0(statement, " observation_source_value = (", as.character(observation_source_value), ")")
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, " observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_source_concept_id = (", as.character(observation_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(observation_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_time)) {
      statement <- paste0(statement, " observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      statement <- paste0(statement, " observation_time = (", as.character(observation_time), ")")
    } else {
      statement <- paste0(statement, " observation_time = '", observation_time,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, " value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      statement <- paste0(statement, " value_as_string = (", as.character(value_as_string), ")")
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, " qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      statement <- paste0(statement, " qualifier_concept_id = (", as.character(qualifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_drug_cost <- function(drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_cost WHERE")
  first <- TRUE
  if (!missing(drug_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_cost_id)) {
      statement <- paste0(statement, " drug_cost_id IS NULL")
    } else if (is(drug_cost_id, "subQuery")){
      statement <- paste0(statement, " drug_cost_id = (", as.character(drug_cost_id), ")")
    } else {
      statement <- paste0(statement, " drug_cost_id = '", drug_cost_id,"'")
    }
  }

  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ingredient_cost)) {
      statement <- paste0(statement, " ingredient_cost IS NULL")
    } else if (is(ingredient_cost, "subQuery")){
      statement <- paste0(statement, " ingredient_cost = (", as.character(ingredient_cost), ")")
    } else {
      statement <- paste0(statement, " ingredient_cost = '", ingredient_cost,"'")
    }
  }

  if (!missing(dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dispensing_fee)) {
      statement <- paste0(statement, " dispensing_fee IS NULL")
    } else if (is(dispensing_fee, "subQuery")){
      statement <- paste0(statement, " dispensing_fee = (", as.character(dispensing_fee), ")")
    } else {
      statement <- paste0(statement, " dispensing_fee = '", dispensing_fee,"'")
    }
  }

  if (!missing(average_wholesale_price)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(average_wholesale_price)) {
      statement <- paste0(statement, " average_wholesale_price IS NULL")
    } else if (is(average_wholesale_price, "subQuery")){
      statement <- paste0(statement, " average_wholesale_price = (", as.character(average_wholesale_price), ")")
    } else {
      statement <- paste0(statement, " average_wholesale_price = '", average_wholesale_price,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_procedure_cost <- function(procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_cost WHERE")
  first <- TRUE
  if (!missing(procedure_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_cost_id)) {
      statement <- paste0(statement, " procedure_cost_id IS NULL")
    } else if (is(procedure_cost_id, "subQuery")){
      statement <- paste0(statement, " procedure_cost_id = (", as.character(procedure_cost_id), ")")
    } else {
      statement <- paste0(statement, " procedure_cost_id = '", procedure_cost_id,"'")
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, " revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      statement <- paste0(statement, " revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")")
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, " revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      statement <- paste0(statement, " revenue_code_source_value = (", as.character(revenue_code_source_value), ")")
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM device_exposure WHERE")
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, " device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      statement <- paste0(statement, " device_concept_id = (", as.character(device_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, " device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_start_date = (", as.character(device_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, " device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_end_date = (", as.character(device_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }

  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, " device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      statement <- paste0(statement, " device_type_concept_id = (", as.character(device_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }

  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, " unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      statement <- paste0(statement, " unique_device_id = (", as.character(unique_device_id), ")")
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, " device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      statement <- paste0(statement, " device_source_value = (", as.character(device_source_value), ")")
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }

  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, " device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      statement <- paste0(statement, " device_source_concept_id = (", as.character(device_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_note <- function(note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect note' AS test, CASE WHEN(SELECT COUNT(*) FROM note WHERE")
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, " note_id IS NULL")
    } else if (is(note_id, "subQuery")){
      statement <- paste0(statement, " note_id = (", as.character(note_id), ")")
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, " note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      statement <- paste0(statement, " note_date = (", as.character(note_date), ")")
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }

  if (!missing(note_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_time)) {
      statement <- paste0(statement, " note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      statement <- paste0(statement, " note_time = (", as.character(note_time), ")")
    } else {
      statement <- paste0(statement, " note_time = '", note_time,"'")
    }
  }

  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, " note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      statement <- paste0(statement, " note_type_concept_id = (", as.character(note_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }

  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, " note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      statement <- paste0(statement, " note_text = (", as.character(note_text), ")")
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, " note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      statement <- paste0(statement, " note_source_value = (", as.character(note_source_value), ")")
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect specimen' AS test, CASE WHEN(SELECT COUNT(*) FROM specimen WHERE")
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, " specimen_id IS NULL")
    } else if (is(specimen_id, "subQuery")){
      statement <- paste0(statement, " specimen_id = (", as.character(specimen_id), ")")
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, " specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_concept_id = (", as.character(specimen_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, " specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }

  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, " specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      statement <- paste0(statement, " specimen_date = (", as.character(specimen_date), ")")
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }

  if (!missing(specimen_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_time)) {
      statement <- paste0(statement, " specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      statement <- paste0(statement, " specimen_time = (", as.character(specimen_time), ")")
    } else {
      statement <- paste0(statement, " specimen_time = '", specimen_time,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, " anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      statement <- paste0(statement, " anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, " disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      statement <- paste0(statement, " disease_status_concept_id = (", as.character(disease_status_concept_id), ")")
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }

  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, " specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      statement <- paste0(statement, " specimen_source_id = (", as.character(specimen_source_id), ")")
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }

  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, " specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      statement <- paste0(statement, " specimen_source_value = (", as.character(specimen_source_value), ")")
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, " anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      statement <- paste0(statement, " anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }

  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, " disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      statement <- paste0(statement, " disease_status_source_value = (", as.character(disease_status_source_value), ")")
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect fact_relationship' AS test, CASE WHEN(SELECT COUNT(*) FROM fact_relationship WHERE")
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, " domain_concept_id_1 IS NULL")
    } else if (is(domain_concept_id_1, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_1 = (", as.character(domain_concept_id_1), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }

  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, " fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      statement <- paste0(statement, " fact_id_1 = (", as.character(fact_id_1), ")")
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, " domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_2 = (", as.character(domain_concept_id_2), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }

  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, " fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      statement <- paste0(statement, " fact_id_2 = (", as.character(fact_id_2), ")")
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, " relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      statement <- paste0(statement, " relationship_concept_id = (", as.character(relationship_concept_id), ")")
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect location' AS test, CASE WHEN(SELECT COUNT(*) FROM location WHERE")
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, " address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      statement <- paste0(statement, " address_1 = (", as.character(address_1), ")")
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }

  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, " address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      statement <- paste0(statement, " address_2 = (", as.character(address_2), ")")
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }

  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(city)) {
      statement <- paste0(statement, " city IS NULL")
    } else if (is(city, "subQuery")){
      statement <- paste0(statement, " city = (", as.character(city), ")")
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }

  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(state)) {
      statement <- paste0(statement, " state IS NULL")
    } else if (is(state, "subQuery")){
      statement <- paste0(statement, " state = (", as.character(state), ")")
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }

  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(zip)) {
      statement <- paste0(statement, " zip IS NULL")
    } else if (is(zip, "subQuery")){
      statement <- paste0(statement, " zip = (", as.character(zip), ")")
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }

  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(county)) {
      statement <- paste0(statement, " county IS NULL")
    } else if (is(county, "subQuery")){
      statement <- paste0(statement, " county = (", as.character(county), ")")
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }

  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, " location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      statement <- paste0(statement, " location_source_value = (", as.character(location_source_value), ")")
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_visit_cost <- function(visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_cost WHERE")
  first <- TRUE
  if (!missing(visit_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_cost_id)) {
      statement <- paste0(statement, " visit_cost_id IS NULL")
    } else if (is(visit_cost_id, "subQuery")){
      statement <- paste0(statement, " visit_cost_id = (", as.character(visit_cost_id), ")")
    } else {
      statement <- paste0(statement, " visit_cost_id = '", visit_cost_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect payer_plan_period' AS test, CASE WHEN(SELECT COUNT(*) FROM payer_plan_period WHERE")
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, " payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, " payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }

  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, " payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      statement <- paste0(statement, " payer_source_value = (", as.character(payer_source_value), ")")
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }

  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, " plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      statement <- paste0(statement, " plan_source_value = (", as.character(plan_source_value), ")")
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }

  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, " family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      statement <- paste0(statement, " family_source_value = (", as.character(family_source_value), ")")
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_device_cost <- function(device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM device_cost WHERE")
  first <- TRUE
  if (!missing(device_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_cost_id)) {
      statement <- paste0(statement, " device_cost_id IS NULL")
    } else if (is(device_cost_id, "subQuery")){
      statement <- paste0(statement, " device_cost_id = (", as.character(device_cost_id), ")")
    } else {
      statement <- paste0(statement, " device_cost_id = '", device_cost_id,"'")
    }
  }

  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_era' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_era WHERE")
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, " drug_era_id IS NULL")
    } else if (is(drug_era_id, "subQuery")){
      statement <- paste0(statement, " drug_era_id = (", as.character(drug_era_id), ")")
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, " drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      statement <- paste0(statement, " drug_era_start_date = (", as.character(drug_era_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }

  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, " drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      statement <- paste0(statement, " drug_era_end_date = (", as.character(drug_era_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }

  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, " drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      statement <- paste0(statement, " drug_exposure_count = (", as.character(drug_exposure_count), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }

  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, " gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      statement <- paste0(statement, " gap_days = (", as.character(gap_days), ")")
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect dose_era' AS test, CASE WHEN(SELECT COUNT(*) FROM dose_era WHERE")
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, " dose_era_id IS NULL")
    } else if (is(dose_era_id, "subQuery")){
      statement <- paste0(statement, " dose_era_id = (", as.character(dose_era_id), ")")
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, " dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      statement <- paste0(statement, " dose_value = (", as.character(dose_value), ")")
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }

  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, " dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      statement <- paste0(statement, " dose_era_start_date = (", as.character(dose_era_start_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }

  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, " dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      statement <- paste0(statement, " dose_era_end_date = (", as.character(dose_era_end_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_era' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_era WHERE")
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, " condition_era_id IS NULL")
    } else if (is(condition_era_id, "subQuery")){
      statement <- paste0(statement, " condition_era_id = (", as.character(condition_era_id), ")")
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, " condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      statement <- paste0(statement, " condition_era_start_date = (", as.character(condition_era_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }

  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, " condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      statement <- paste0(statement, " condition_era_end_date = (", as.character(condition_era_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, " condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_count = (", as.character(condition_occurrence_count), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cdm_source' AS test, CASE WHEN(SELECT COUNT(*) FROM cdm_source WHERE")
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, " cdm_source_name IS NULL")
    } else if (is(cdm_source_name, "subQuery")){
      statement <- paste0(statement, " cdm_source_name = (", as.character(cdm_source_name), ")")
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, " cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      statement <- paste0(statement, " cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")")
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }

  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, " cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      statement <- paste0(statement, " cdm_holder = (", as.character(cdm_holder), ")")
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }

  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, " source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      statement <- paste0(statement, " source_description = (", as.character(source_description), ")")
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }

  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, " source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      statement <- paste0(statement, " source_documentation_reference = (", as.character(source_documentation_reference), ")")
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, " cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      statement <- paste0(statement, " cdm_etl_reference = (", as.character(cdm_etl_reference), ")")
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }

  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, " source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      statement <- paste0(statement, " source_release_date = (", as.character(source_release_date), ")")
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }

  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, " cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      statement <- paste0(statement, " cdm_release_date = (", as.character(cdm_release_date), ")")
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }

  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, " cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      statement <- paste0(statement, " cdm_version = (", as.character(cdm_version), ")")
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, " vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      statement <- paste0(statement, " vocabulary_version = (", as.character(vocabulary_version), ")")
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_definition WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, " cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      statement <- paste0(statement, " cohort_definition_name = (", as.character(cohort_definition_name), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }

  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, " cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      statement <- paste0(statement, " cohort_definition_description = (", as.character(cohort_definition_description), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, " definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " definition_type_concept_id = (", as.character(definition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, " cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      statement <- paste0(statement, " cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }

  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, " subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      statement <- paste0(statement, " subject_concept_id = (", as.character(subject_concept_id), ")")
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, " cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      statement <- paste0(statement, " cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")")
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_cohort_attribute <- function(cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_attribute' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_attribute WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect attribute_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM attribute_definition WHERE")
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, " attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      statement <- paste0(statement, " attribute_name = (", as.character(attribute_name), ")")
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }

  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, " attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      statement <- paste0(statement, " attribute_description = (", as.character(attribute_description), ")")
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, " attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      statement <- paste0(statement, " attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }

  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, " attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      statement <- paste0(statement, " attribute_syntax = (", as.character(attribute_syntax), ")")
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_person <- function(rowCount, person_id, year_of_birth, gender_concept_id, month_of_birth, day_of_birth, time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM person WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, " month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      statement <- paste0(statement, " month_of_birth = (", as.character(month_of_birth), ")")
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }

  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, " day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      statement <- paste0(statement, " day_of_birth = (", as.character(day_of_birth), ")")
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }

  if (!missing(time_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(time_of_birth)) {
      statement <- paste0(statement, " time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      statement <- paste0(statement, " time_of_birth = (", as.character(time_of_birth), ")")
    } else {
      statement <- paste0(statement, " time_of_birth = '", time_of_birth,"'")
    }
  }

  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, " race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      statement <- paste0(statement, " race_concept_id = (", as.character(race_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, " ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, " person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      statement <- paste0(statement, " person_source_value = (", as.character(person_source_value), ")")
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, " race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      statement <- paste0(statement, " race_source_value = (", as.character(race_source_value), ")")
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }

  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, " race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      statement <- paste0(statement, " race_source_concept_id = (", as.character(race_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, " ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_value = (", as.character(ethnicity_source_value), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, " ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_observation_period <- function(rowCount, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) FROM observation_period WHERE")
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, " observation_period_id IS NULL")
    } else if (is(observation_period_id, "subQuery")){
      statement <- paste0(statement, " observation_period_id = (", as.character(observation_period_id), ")")
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, " observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      statement <- paste0(statement, " observation_period_start_date = (", as.character(observation_period_start_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }

  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, " observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      statement <- paste0(statement, " observation_period_end_date = (", as.character(observation_period_end_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }

  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, " period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      statement <- paste0(statement, " period_type_concept_id = (", as.character(period_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_care_site <- function(rowCount, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect care_site' AS test, CASE WHEN(SELECT COUNT(*) FROM care_site WHERE")
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, " care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      statement <- paste0(statement, " care_site_name = (", as.character(care_site_name), ")")
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, " place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      statement <- paste0(statement, " place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")")
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, " care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      statement <- paste0(statement, " care_site_source_value = (", as.character(care_site_source_value), ")")
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, " place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      statement <- paste0(statement, " place_of_service_source_value = (", as.character(place_of_service_source_value), ")")
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_visit_occurrence <- function(rowCount, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_occurrence WHERE")
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, " visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_concept_id = (", as.character(visit_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, " visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      statement <- paste0(statement, " visit_start_date = (", as.character(visit_start_date), ")")
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }

  if (!missing(visit_start_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_time)) {
      statement <- paste0(statement, " visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      statement <- paste0(statement, " visit_start_time = (", as.character(visit_start_time), ")")
    } else {
      statement <- paste0(statement, " visit_start_time = '", visit_start_time,"'")
    }
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, " visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      statement <- paste0(statement, " visit_end_date = (", as.character(visit_end_date), ")")
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }

  if (!missing(visit_end_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_time)) {
      statement <- paste0(statement, " visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      statement <- paste0(statement, " visit_end_time = (", as.character(visit_end_time), ")")
    } else {
      statement <- paste0(statement, " visit_end_time = '", visit_end_time,"'")
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, " visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_type_concept_id = (", as.character(visit_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, " visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      statement <- paste0(statement, " visit_source_value = (", as.character(visit_source_value), ")")
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, " visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_source_concept_id = (", as.character(visit_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_provider <- function(rowCount, provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) FROM provider WHERE")
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, " provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      statement <- paste0(statement, " provider_name = (", as.character(provider_name), ")")
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }

  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(npi)) {
      statement <- paste0(statement, " npi IS NULL")
    } else if (is(npi, "subQuery")){
      statement <- paste0(statement, " npi = (", as.character(npi), ")")
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }

  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dea)) {
      statement <- paste0(statement, " dea IS NULL")
    } else if (is(dea, "subQuery")){
      statement <- paste0(statement, " dea = (", as.character(dea), ")")
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }

  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, " specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_concept_id = (", as.character(specialty_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, " provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      statement <- paste0(statement, " provider_source_value = (", as.character(provider_source_value), ")")
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }

  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, " specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      statement <- paste0(statement, " specialty_source_value = (", as.character(specialty_source_value), ")")
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, " specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_death <- function(rowCount, person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM death WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, " death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      statement <- paste0(statement, " death_date = (", as.character(death_date), ")")
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }

  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, " death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      statement <- paste0(statement, " death_type_concept_id = (", as.character(death_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }

  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, " cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_concept_id = (", as.character(cause_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }

  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, " cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      statement <- paste0(statement, " cause_source_value = (", as.character(cause_source_value), ")")
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, " cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_source_concept_id = (", as.character(cause_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_condition_occurrence <- function(rowCount, condition_occurrence_id, visit_occurrence_id, person_id, condition_type_concept_id, condition_start_date, condition_end_date, provider_id, condition_concept_id, condition_source_value, condition_source_concept_id, stop_reason) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_occurrence WHERE")
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, " condition_occurrence_id IS NULL")
    } else if (is(condition_occurrence_id, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_id = (", as.character(condition_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, " condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_type_concept_id = (", as.character(condition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }

  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, " condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      statement <- paste0(statement, " condition_start_date = (", as.character(condition_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }

  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, " condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      statement <- paste0(statement, " condition_end_date = (", as.character(condition_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, " condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      statement <- paste0(statement, " condition_source_value = (", as.character(condition_source_value), ")")
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, " condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_source_concept_id = (", as.character(condition_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_drug_exposure <- function(rowCount, drug_exposure_id, visit_occurrence_id, person_id, drug_type_concept_id, provider_id, drug_exposure_start_date, drug_exposure_end_date, days_supply, quantity, drug_concept_id, drug_source_value, sig, stop_reason, refills, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_exposure WHERE")
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, " drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_type_concept_id = (", as.character(drug_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, " drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, " drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }

  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, " days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      statement <- paste0(statement, " days_supply = (", as.character(days_supply), ")")
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, " drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      statement <- paste0(statement, " drug_source_value = (", as.character(drug_source_value), ")")
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }

  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(sig)) {
      statement <- paste0(statement, " sig IS NULL")
    } else if (is(sig, "subQuery")){
      statement <- paste0(statement, " sig = (", as.character(sig), ")")
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(refills)) {
      statement <- paste0(statement, " refills IS NULL")
    } else if (is(refills, "subQuery")){
      statement <- paste0(statement, " refills = (", as.character(refills), ")")
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }

  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, " route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      statement <- paste0(statement, " route_concept_id = (", as.character(route_concept_id), ")")
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }

  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, " effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      statement <- paste0(statement, " effective_drug_dose = (", as.character(effective_drug_dose), ")")
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, " dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      statement <- paste0(statement, " dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }

  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, " lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      statement <- paste0(statement, " lot_number = (", as.character(lot_number), ")")
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, " drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_source_concept_id = (", as.character(drug_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }

  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, " route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      statement <- paste0(statement, " route_source_value = (", as.character(route_source_value), ")")
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, " dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      statement <- paste0(statement, " dose_unit_source_value = (", as.character(dose_unit_source_value), ")")
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_procedure_occurrence <- function(rowCount, procedure_occurrence_id, visit_occurrence_id, person_id, procedure_type_concept_id, procedure_date, provider_id, procedure_concept_id, procedure_source_value, procedure_source_concept_id, modifier_concept_id, quantity, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_occurrence WHERE")
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, " procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }

  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, " procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      statement <- paste0(statement, " procedure_date = (", as.character(procedure_date), ")")
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, " procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_concept_id = (", as.character(procedure_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }

  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, " procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      statement <- paste0(statement, " procedure_source_value = (", as.character(procedure_source_value), ")")
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, " procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }

  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, " modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      statement <- paste0(statement, " modifier_concept_id = (", as.character(modifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_measurement <- function(rowCount, measurement_id, visit_occurrence_id, person_id, measurement_type_concept_id, measurement_time, measurement_date, provider_id, measurement_concept_id, measurement_source_value, measurement_source_concept_id, operator_concept_id, value_as_number, value_source_value, value_as_concept_id, unit_concept_id, unit_source_value, range_low, range_high) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect measurement' AS test, CASE WHEN(SELECT COUNT(*) FROM measurement WHERE")
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, " measurement_id IS NULL")
    } else if (is(measurement_id, "subQuery")){
      statement <- paste0(statement, " measurement_id = (", as.character(measurement_id), ")")
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, " measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }

  if (!missing(measurement_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_time)) {
      statement <- paste0(statement, " measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      statement <- paste0(statement, " measurement_time = (", as.character(measurement_time), ")")
    } else {
      statement <- paste0(statement, " measurement_time = '", measurement_time,"'")
    }
  }

  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, " measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      statement <- paste0(statement, " measurement_date = (", as.character(measurement_date), ")")
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, " measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_concept_id = (", as.character(measurement_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }

  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, " measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      statement <- paste0(statement, " measurement_source_value = (", as.character(measurement_source_value), ")")
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, " measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }

  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, " operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      statement <- paste0(statement, " operator_concept_id = (", as.character(operator_concept_id), ")")
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, " value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      statement <- paste0(statement, " value_source_value = (", as.character(value_source_value), ")")
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, " range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      statement <- paste0(statement, " range_low = (", as.character(range_low), ")")
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }

  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, " range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      statement <- paste0(statement, " range_high = (", as.character(range_high), ")")
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_observation <- function(rowCount, observation_id, visit_occurrence_id, person_id, observation_type_concept_id, observation_date, provider_id, observation_concept_id, observation_source_value, observation_source_concept_id, value_as_concept_id, observation_time, value_as_number, value_as_string, qualifier_concept_id, unit_concept_id, unit_source_value, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM observation WHERE")
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, " observation_id IS NULL")
    } else if (is(observation_id, "subQuery")){
      statement <- paste0(statement, " observation_id = (", as.character(observation_id), ")")
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, " observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_type_concept_id = (", as.character(observation_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }

  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, " observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      statement <- paste0(statement, " observation_date = (", as.character(observation_date), ")")
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, " observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_concept_id = (", as.character(observation_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }

  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, " observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      statement <- paste0(statement, " observation_source_value = (", as.character(observation_source_value), ")")
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, " observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_source_concept_id = (", as.character(observation_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(observation_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_time)) {
      statement <- paste0(statement, " observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      statement <- paste0(statement, " observation_time = (", as.character(observation_time), ")")
    } else {
      statement <- paste0(statement, " observation_time = '", observation_time,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, " value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      statement <- paste0(statement, " value_as_string = (", as.character(value_as_string), ")")
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, " qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      statement <- paste0(statement, " qualifier_concept_id = (", as.character(qualifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_drug_cost <- function(rowCount, drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_cost WHERE")
  first <- TRUE
  if (!missing(drug_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_cost_id)) {
      statement <- paste0(statement, " drug_cost_id IS NULL")
    } else if (is(drug_cost_id, "subQuery")){
      statement <- paste0(statement, " drug_cost_id = (", as.character(drug_cost_id), ")")
    } else {
      statement <- paste0(statement, " drug_cost_id = '", drug_cost_id,"'")
    }
  }

  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ingredient_cost)) {
      statement <- paste0(statement, " ingredient_cost IS NULL")
    } else if (is(ingredient_cost, "subQuery")){
      statement <- paste0(statement, " ingredient_cost = (", as.character(ingredient_cost), ")")
    } else {
      statement <- paste0(statement, " ingredient_cost = '", ingredient_cost,"'")
    }
  }

  if (!missing(dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dispensing_fee)) {
      statement <- paste0(statement, " dispensing_fee IS NULL")
    } else if (is(dispensing_fee, "subQuery")){
      statement <- paste0(statement, " dispensing_fee = (", as.character(dispensing_fee), ")")
    } else {
      statement <- paste0(statement, " dispensing_fee = '", dispensing_fee,"'")
    }
  }

  if (!missing(average_wholesale_price)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(average_wholesale_price)) {
      statement <- paste0(statement, " average_wholesale_price IS NULL")
    } else if (is(average_wholesale_price, "subQuery")){
      statement <- paste0(statement, " average_wholesale_price = (", as.character(average_wholesale_price), ")")
    } else {
      statement <- paste0(statement, " average_wholesale_price = '", average_wholesale_price,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_procedure_cost <- function(rowCount, procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_cost WHERE")
  first <- TRUE
  if (!missing(procedure_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_cost_id)) {
      statement <- paste0(statement, " procedure_cost_id IS NULL")
    } else if (is(procedure_cost_id, "subQuery")){
      statement <- paste0(statement, " procedure_cost_id = (", as.character(procedure_cost_id), ")")
    } else {
      statement <- paste0(statement, " procedure_cost_id = '", procedure_cost_id,"'")
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, " revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      statement <- paste0(statement, " revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")")
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, " revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      statement <- paste0(statement, " revenue_code_source_value = (", as.character(revenue_code_source_value), ")")
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_device_exposure <- function(rowCount, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM device_exposure WHERE")
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, " device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      statement <- paste0(statement, " device_concept_id = (", as.character(device_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, " device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_start_date = (", as.character(device_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, " device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_end_date = (", as.character(device_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }

  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, " device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      statement <- paste0(statement, " device_type_concept_id = (", as.character(device_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }

  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, " unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      statement <- paste0(statement, " unique_device_id = (", as.character(unique_device_id), ")")
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, " device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      statement <- paste0(statement, " device_source_value = (", as.character(device_source_value), ")")
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }

  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, " device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      statement <- paste0(statement, " device_source_concept_id = (", as.character(device_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_note <- function(rowCount, note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect note' AS test, CASE WHEN(SELECT COUNT(*) FROM note WHERE")
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, " note_id IS NULL")
    } else if (is(note_id, "subQuery")){
      statement <- paste0(statement, " note_id = (", as.character(note_id), ")")
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, " note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      statement <- paste0(statement, " note_date = (", as.character(note_date), ")")
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }

  if (!missing(note_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_time)) {
      statement <- paste0(statement, " note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      statement <- paste0(statement, " note_time = (", as.character(note_time), ")")
    } else {
      statement <- paste0(statement, " note_time = '", note_time,"'")
    }
  }

  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, " note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      statement <- paste0(statement, " note_type_concept_id = (", as.character(note_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }

  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, " note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      statement <- paste0(statement, " note_text = (", as.character(note_text), ")")
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, " note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      statement <- paste0(statement, " note_source_value = (", as.character(note_source_value), ")")
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_specimen <- function(rowCount, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect specimen' AS test, CASE WHEN(SELECT COUNT(*) FROM specimen WHERE")
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, " specimen_id IS NULL")
    } else if (is(specimen_id, "subQuery")){
      statement <- paste0(statement, " specimen_id = (", as.character(specimen_id), ")")
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, " specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_concept_id = (", as.character(specimen_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, " specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }

  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, " specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      statement <- paste0(statement, " specimen_date = (", as.character(specimen_date), ")")
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }

  if (!missing(specimen_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_time)) {
      statement <- paste0(statement, " specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      statement <- paste0(statement, " specimen_time = (", as.character(specimen_time), ")")
    } else {
      statement <- paste0(statement, " specimen_time = '", specimen_time,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, " anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      statement <- paste0(statement, " anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, " disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      statement <- paste0(statement, " disease_status_concept_id = (", as.character(disease_status_concept_id), ")")
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }

  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, " specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      statement <- paste0(statement, " specimen_source_id = (", as.character(specimen_source_id), ")")
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }

  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, " specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      statement <- paste0(statement, " specimen_source_value = (", as.character(specimen_source_value), ")")
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, " anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      statement <- paste0(statement, " anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }

  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, " disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      statement <- paste0(statement, " disease_status_source_value = (", as.character(disease_status_source_value), ")")
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_fact_relationship <- function(rowCount, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect fact_relationship' AS test, CASE WHEN(SELECT COUNT(*) FROM fact_relationship WHERE")
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, " domain_concept_id_1 IS NULL")
    } else if (is(domain_concept_id_1, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_1 = (", as.character(domain_concept_id_1), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }

  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, " fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      statement <- paste0(statement, " fact_id_1 = (", as.character(fact_id_1), ")")
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, " domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_2 = (", as.character(domain_concept_id_2), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }

  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, " fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      statement <- paste0(statement, " fact_id_2 = (", as.character(fact_id_2), ")")
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, " relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      statement <- paste0(statement, " relationship_concept_id = (", as.character(relationship_concept_id), ")")
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_location <- function(rowCount, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect location' AS test, CASE WHEN(SELECT COUNT(*) FROM location WHERE")
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, " address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      statement <- paste0(statement, " address_1 = (", as.character(address_1), ")")
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }

  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, " address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      statement <- paste0(statement, " address_2 = (", as.character(address_2), ")")
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }

  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(city)) {
      statement <- paste0(statement, " city IS NULL")
    } else if (is(city, "subQuery")){
      statement <- paste0(statement, " city = (", as.character(city), ")")
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }

  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(state)) {
      statement <- paste0(statement, " state IS NULL")
    } else if (is(state, "subQuery")){
      statement <- paste0(statement, " state = (", as.character(state), ")")
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }

  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(zip)) {
      statement <- paste0(statement, " zip IS NULL")
    } else if (is(zip, "subQuery")){
      statement <- paste0(statement, " zip = (", as.character(zip), ")")
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }

  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(county)) {
      statement <- paste0(statement, " county IS NULL")
    } else if (is(county, "subQuery")){
      statement <- paste0(statement, " county = (", as.character(county), ")")
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }

  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, " location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      statement <- paste0(statement, " location_source_value = (", as.character(location_source_value), ")")
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_visit_cost <- function(rowCount, visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_cost WHERE")
  first <- TRUE
  if (!missing(visit_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_cost_id)) {
      statement <- paste0(statement, " visit_cost_id IS NULL")
    } else if (is(visit_cost_id, "subQuery")){
      statement <- paste0(statement, " visit_cost_id = (", as.character(visit_cost_id), ")")
    } else {
      statement <- paste0(statement, " visit_cost_id = '", visit_cost_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_payer_plan_period <- function(rowCount, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect payer_plan_period' AS test, CASE WHEN(SELECT COUNT(*) FROM payer_plan_period WHERE")
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, " payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, " payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }

  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, " payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      statement <- paste0(statement, " payer_source_value = (", as.character(payer_source_value), ")")
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }

  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, " plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      statement <- paste0(statement, " plan_source_value = (", as.character(plan_source_value), ")")
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }

  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, " family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      statement <- paste0(statement, " family_source_value = (", as.character(family_source_value), ")")
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_device_cost <- function(rowCount, device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM device_cost WHERE")
  first <- TRUE
  if (!missing(device_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_cost_id)) {
      statement <- paste0(statement, " device_cost_id IS NULL")
    } else if (is(device_cost_id, "subQuery")){
      statement <- paste0(statement, " device_cost_id = (", as.character(device_cost_id), ")")
    } else {
      statement <- paste0(statement, " device_cost_id = '", device_cost_id,"'")
    }
  }

  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_drug_era <- function(rowCount, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_era' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_era WHERE")
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, " drug_era_id IS NULL")
    } else if (is(drug_era_id, "subQuery")){
      statement <- paste0(statement, " drug_era_id = (", as.character(drug_era_id), ")")
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, " drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      statement <- paste0(statement, " drug_era_start_date = (", as.character(drug_era_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }

  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, " drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      statement <- paste0(statement, " drug_era_end_date = (", as.character(drug_era_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }

  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, " drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      statement <- paste0(statement, " drug_exposure_count = (", as.character(drug_exposure_count), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }

  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, " gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      statement <- paste0(statement, " gap_days = (", as.character(gap_days), ")")
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_dose_era <- function(rowCount, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect dose_era' AS test, CASE WHEN(SELECT COUNT(*) FROM dose_era WHERE")
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, " dose_era_id IS NULL")
    } else if (is(dose_era_id, "subQuery")){
      statement <- paste0(statement, " dose_era_id = (", as.character(dose_era_id), ")")
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, " dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      statement <- paste0(statement, " dose_value = (", as.character(dose_value), ")")
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }

  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, " dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      statement <- paste0(statement, " dose_era_start_date = (", as.character(dose_era_start_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }

  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, " dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      statement <- paste0(statement, " dose_era_end_date = (", as.character(dose_era_end_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_condition_era <- function(rowCount, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_era' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_era WHERE")
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, " condition_era_id IS NULL")
    } else if (is(condition_era_id, "subQuery")){
      statement <- paste0(statement, " condition_era_id = (", as.character(condition_era_id), ")")
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, " condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      statement <- paste0(statement, " condition_era_start_date = (", as.character(condition_era_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }

  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, " condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      statement <- paste0(statement, " condition_era_end_date = (", as.character(condition_era_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, " condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_count = (", as.character(condition_occurrence_count), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_cdm_source <- function(rowCount, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cdm_source' AS test, CASE WHEN(SELECT COUNT(*) FROM cdm_source WHERE")
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, " cdm_source_name IS NULL")
    } else if (is(cdm_source_name, "subQuery")){
      statement <- paste0(statement, " cdm_source_name = (", as.character(cdm_source_name), ")")
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, " cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      statement <- paste0(statement, " cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")")
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }

  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, " cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      statement <- paste0(statement, " cdm_holder = (", as.character(cdm_holder), ")")
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }

  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, " source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      statement <- paste0(statement, " source_description = (", as.character(source_description), ")")
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }

  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, " source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      statement <- paste0(statement, " source_documentation_reference = (", as.character(source_documentation_reference), ")")
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, " cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      statement <- paste0(statement, " cdm_etl_reference = (", as.character(cdm_etl_reference), ")")
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }

  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, " source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      statement <- paste0(statement, " source_release_date = (", as.character(source_release_date), ")")
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }

  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, " cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      statement <- paste0(statement, " cdm_release_date = (", as.character(cdm_release_date), ")")
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }

  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, " cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      statement <- paste0(statement, " cdm_version = (", as.character(cdm_version), ")")
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, " vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      statement <- paste0(statement, " vocabulary_version = (", as.character(vocabulary_version), ")")
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_cohort <- function(rowCount, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_cohort_definition <- function(rowCount, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_definition WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, " cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      statement <- paste0(statement, " cohort_definition_name = (", as.character(cohort_definition_name), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }

  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, " cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      statement <- paste0(statement, " cohort_definition_description = (", as.character(cohort_definition_description), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, " definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " definition_type_concept_id = (", as.character(definition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, " cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      statement <- paste0(statement, " cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }

  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, " subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      statement <- paste0(statement, " subject_concept_id = (", as.character(subject_concept_id), ")")
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, " cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      statement <- paste0(statement, " cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")")
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_cohort_attribute <- function(rowCount, cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_attribute' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_attribute WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_attribute_definition <- function(rowCount, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect attribute_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM attribute_definition WHERE")
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, " attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      statement <- paste0(statement, " attribute_name = (", as.character(attribute_name), ")")
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }

  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, " attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      statement <- paste0(statement, " attribute_description = (", as.character(attribute_description), ")")
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, " attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      statement <- paste0(statement, " attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }

  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, " attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      statement <- paste0(statement, " attribute_syntax = (", as.character(attribute_syntax), ")")
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

lookup_person <- function(fetchField, person_id, year_of_birth, gender_concept_id, month_of_birth, day_of_birth, time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM person WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, " month_of_birth IS NULL")
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }

  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, " day_of_birth IS NULL")
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }

  if (!missing(time_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(time_of_birth)) {
      statement <- paste0(statement, " time_of_birth IS NULL")
    } else {
      statement <- paste0(statement, " time_of_birth = '", time_of_birth,"'")
    }
  }

  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, " race_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, " ethnicity_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, " person_source_value IS NULL")
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, " race_source_value IS NULL")
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }

  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, " race_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, " ethnicity_source_value IS NULL")
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, " ethnicity_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_observation_period <- function(fetchField, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM observation_period WHERE")
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, " observation_period_id IS NULL")
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, " observation_period_start_date IS NULL")
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }

  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, " observation_period_end_date IS NULL")
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }

  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, " period_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_care_site <- function(fetchField, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM care_site WHERE")
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, " care_site_name IS NULL")
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, " place_of_service_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, " care_site_source_value IS NULL")
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, " place_of_service_source_value IS NULL")
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_visit_occurrence <- function(fetchField, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM visit_occurrence WHERE")
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, " visit_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, " visit_start_date IS NULL")
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }

  if (!missing(visit_start_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_time)) {
      statement <- paste0(statement, " visit_start_time IS NULL")
    } else {
      statement <- paste0(statement, " visit_start_time = '", visit_start_time,"'")
    }
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, " visit_end_date IS NULL")
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }

  if (!missing(visit_end_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_time)) {
      statement <- paste0(statement, " visit_end_time IS NULL")
    } else {
      statement <- paste0(statement, " visit_end_time = '", visit_end_time,"'")
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, " visit_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, " visit_source_value IS NULL")
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, " visit_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_provider <- function(fetchField, provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM provider WHERE")
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, " provider_name IS NULL")
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }

  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(npi)) {
      statement <- paste0(statement, " npi IS NULL")
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }

  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dea)) {
      statement <- paste0(statement, " dea IS NULL")
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }

  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, " specialty_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, " provider_source_value IS NULL")
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }

  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, " specialty_source_value IS NULL")
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, " specialty_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_death <- function(fetchField, person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM death WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, " death_date IS NULL")
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }

  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, " death_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }

  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, " cause_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }

  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, " cause_source_value IS NULL")
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, " cause_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_condition_occurrence <- function(fetchField, condition_occurrence_id, visit_occurrence_id, person_id, condition_type_concept_id, condition_start_date, condition_end_date, provider_id, condition_concept_id, condition_source_value, condition_source_concept_id, stop_reason) {
  statement <- paste0("SELECT ", fetchField , " FROM condition_occurrence WHERE")
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, " condition_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, " condition_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }

  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, " condition_start_date IS NULL")
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }

  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, " condition_end_date IS NULL")
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, " condition_source_value IS NULL")
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, " condition_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_drug_exposure <- function(fetchField, drug_exposure_id, visit_occurrence_id, person_id, drug_type_concept_id, provider_id, drug_exposure_start_date, drug_exposure_end_date, days_supply, quantity, drug_concept_id, drug_source_value, sig, stop_reason, refills, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM drug_exposure WHERE")
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, " drug_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, " drug_exposure_start_date IS NULL")
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, " drug_exposure_end_date IS NULL")
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }

  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, " days_supply IS NULL")
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, " drug_source_value IS NULL")
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }

  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(sig)) {
      statement <- paste0(statement, " sig IS NULL")
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(refills)) {
      statement <- paste0(statement, " refills IS NULL")
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }

  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, " route_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }

  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, " effective_drug_dose IS NULL")
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, " dose_unit_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }

  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, " lot_number IS NULL")
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, " drug_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }

  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, " route_source_value IS NULL")
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, " dose_unit_source_value IS NULL")
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_procedure_occurrence <- function(fetchField, procedure_occurrence_id, visit_occurrence_id, person_id, procedure_type_concept_id, procedure_date, provider_id, procedure_concept_id, procedure_source_value, procedure_source_concept_id, modifier_concept_id, quantity, qualifier_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM procedure_occurrence WHERE")
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, " procedure_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }

  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, " procedure_date IS NULL")
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, " procedure_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }

  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, " procedure_source_value IS NULL")
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, " procedure_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }

  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, " modifier_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_measurement <- function(fetchField, measurement_id, visit_occurrence_id, person_id, measurement_type_concept_id, measurement_time, measurement_date, provider_id, measurement_concept_id, measurement_source_value, measurement_source_concept_id, operator_concept_id, value_as_number, value_source_value, value_as_concept_id, unit_concept_id, unit_source_value, range_low, range_high) {
  statement <- paste0("SELECT ", fetchField , " FROM measurement WHERE")
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, " measurement_id IS NULL")
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, " measurement_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }

  if (!missing(measurement_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_time)) {
      statement <- paste0(statement, " measurement_time IS NULL")
    } else {
      statement <- paste0(statement, " measurement_time = '", measurement_time,"'")
    }
  }

  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, " measurement_date IS NULL")
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, " measurement_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }

  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, " measurement_source_value IS NULL")
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, " measurement_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }

  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, " operator_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, " value_source_value IS NULL")
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, " range_low IS NULL")
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }

  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, " range_high IS NULL")
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_observation <- function(fetchField, observation_id, visit_occurrence_id, person_id, observation_type_concept_id, observation_date, provider_id, observation_concept_id, observation_source_value, observation_source_concept_id, value_as_concept_id, observation_time, value_as_number, value_as_string, qualifier_concept_id, unit_concept_id, unit_source_value, qualifier_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM observation WHERE")
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, " observation_id IS NULL")
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, " observation_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }

  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, " observation_date IS NULL")
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, " observation_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }

  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, " observation_source_value IS NULL")
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, " observation_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(observation_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_time)) {
      statement <- paste0(statement, " observation_time IS NULL")
    } else {
      statement <- paste0(statement, " observation_time = '", observation_time,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, " value_as_string IS NULL")
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, " qualifier_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_drug_cost <- function(fetchField, drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {
  statement <- paste0("SELECT ", fetchField , " FROM drug_cost WHERE")
  first <- TRUE
  if (!missing(drug_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_cost_id)) {
      statement <- paste0(statement, " drug_cost_id IS NULL")
    } else {
      statement <- paste0(statement, " drug_cost_id = '", drug_cost_id,"'")
    }
  }

  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ingredient_cost)) {
      statement <- paste0(statement, " ingredient_cost IS NULL")
    } else {
      statement <- paste0(statement, " ingredient_cost = '", ingredient_cost,"'")
    }
  }

  if (!missing(dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dispensing_fee)) {
      statement <- paste0(statement, " dispensing_fee IS NULL")
    } else {
      statement <- paste0(statement, " dispensing_fee = '", dispensing_fee,"'")
    }
  }

  if (!missing(average_wholesale_price)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(average_wholesale_price)) {
      statement <- paste0(statement, " average_wholesale_price IS NULL")
    } else {
      statement <- paste0(statement, " average_wholesale_price = '", average_wholesale_price,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_procedure_cost <- function(fetchField, procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM procedure_cost WHERE")
  first <- TRUE
  if (!missing(procedure_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_cost_id)) {
      statement <- paste0(statement, " procedure_cost_id IS NULL")
    } else {
      statement <- paste0(statement, " procedure_cost_id = '", procedure_cost_id,"'")
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, " revenue_code_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, " revenue_code_source_value IS NULL")
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_device_exposure <- function(fetchField, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM device_exposure WHERE")
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, " device_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, " device_exposure_start_date IS NULL")
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, " device_exposure_end_date IS NULL")
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }

  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, " device_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }

  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, " unique_device_id IS NULL")
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, " device_source_value IS NULL")
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }

  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, " device_source_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_note <- function(fetchField, note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM note WHERE")
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, " note_id IS NULL")
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, " note_date IS NULL")
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }

  if (!missing(note_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_time)) {
      statement <- paste0(statement, " note_time IS NULL")
    } else {
      statement <- paste0(statement, " note_time = '", note_time,"'")
    }
  }

  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, " note_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }

  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, " note_text IS NULL")
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, " note_source_value IS NULL")
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_specimen <- function(fetchField, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM specimen WHERE")
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, " specimen_id IS NULL")
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, " specimen_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, " specimen_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }

  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, " specimen_date IS NULL")
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }

  if (!missing(specimen_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_time)) {
      statement <- paste0(statement, " specimen_time IS NULL")
    } else {
      statement <- paste0(statement, " specimen_time = '", specimen_time,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, " anatomic_site_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, " disease_status_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }

  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, " specimen_source_id IS NULL")
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }

  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, " specimen_source_value IS NULL")
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, " anatomic_site_source_value IS NULL")
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }

  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, " disease_status_source_value IS NULL")
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_fact_relationship <- function(fetchField, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM fact_relationship WHERE")
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, " domain_concept_id_1 IS NULL")
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }

  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, " fact_id_1 IS NULL")
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, " domain_concept_id_2 IS NULL")
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }

  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, " fact_id_2 IS NULL")
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, " relationship_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_location <- function(fetchField, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM location WHERE")
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, " address_1 IS NULL")
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }

  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, " address_2 IS NULL")
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }

  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(city)) {
      statement <- paste0(statement, " city IS NULL")
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }

  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(state)) {
      statement <- paste0(statement, " state IS NULL")
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }

  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(zip)) {
      statement <- paste0(statement, " zip IS NULL")
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }

  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(county)) {
      statement <- paste0(statement, " county IS NULL")
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }

  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, " location_source_value IS NULL")
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_visit_cost <- function(fetchField, visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("SELECT ", fetchField , " FROM visit_cost WHERE")
  first <- TRUE
  if (!missing(visit_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_cost_id)) {
      statement <- paste0(statement, " visit_cost_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_cost_id = '", visit_cost_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_payer_plan_period <- function(fetchField, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM payer_plan_period WHERE")
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, " payer_plan_period_start_date IS NULL")
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, " payer_plan_period_end_date IS NULL")
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }

  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, " payer_source_value IS NULL")
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }

  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, " plan_source_value IS NULL")
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }

  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, " family_source_value IS NULL")
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_device_cost <- function(fetchField, device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("SELECT ", fetchField , " FROM device_cost WHERE")
  first <- TRUE
  if (!missing(device_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_cost_id)) {
      statement <- paste0(statement, " device_cost_id IS NULL")
    } else {
      statement <- paste0(statement, " device_cost_id = '", device_cost_id,"'")
    }
  }

  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_drug_era <- function(fetchField, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0("SELECT ", fetchField , " FROM drug_era WHERE")
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, " drug_era_id IS NULL")
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, " drug_era_start_date IS NULL")
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }

  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, " drug_era_end_date IS NULL")
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }

  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, " drug_exposure_count IS NULL")
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }

  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, " gap_days IS NULL")
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_dose_era <- function(fetchField, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0("SELECT ", fetchField , " FROM dose_era WHERE")
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, " dose_era_id IS NULL")
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, " dose_value IS NULL")
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }

  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, " dose_era_start_date IS NULL")
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }

  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, " dose_era_end_date IS NULL")
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_condition_era <- function(fetchField, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0("SELECT ", fetchField , " FROM condition_era WHERE")
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, " condition_era_id IS NULL")
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, " condition_era_start_date IS NULL")
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }

  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, " condition_era_end_date IS NULL")
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, " condition_occurrence_count IS NULL")
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_cdm_source <- function(fetchField, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0("SELECT ", fetchField , " FROM cdm_source WHERE")
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, " cdm_source_name IS NULL")
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, " cdm_source_abbreviation IS NULL")
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }

  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, " cdm_holder IS NULL")
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }

  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, " source_description IS NULL")
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }

  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, " source_documentation_reference IS NULL")
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, " cdm_etl_reference IS NULL")
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }

  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, " source_release_date IS NULL")
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }

  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, " cdm_release_date IS NULL")
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }

  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, " cdm_version IS NULL")
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, " vocabulary_version IS NULL")
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_cohort <- function(fetchField, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0("SELECT ", fetchField , " FROM cohort WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_cohort_definition <- function(fetchField, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0("SELECT ", fetchField , " FROM cohort_definition WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, " cohort_definition_name IS NULL")
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }

  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, " cohort_definition_description IS NULL")
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, " definition_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, " cohort_definition_syntax IS NULL")
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }

  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, " subject_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, " cohort_instantiation_date IS NULL")
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_cohort_attribute <- function(fetchField, cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM cohort_attribute WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_attribute_definition <- function(fetchField, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0("SELECT ", fetchField , " FROM attribute_definition WHERE")
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, " attribute_name IS NULL")
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }

  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, " attribute_description IS NULL")
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, " attribute_type_concept_id IS NULL")
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }

  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, " attribute_syntax IS NULL")
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

