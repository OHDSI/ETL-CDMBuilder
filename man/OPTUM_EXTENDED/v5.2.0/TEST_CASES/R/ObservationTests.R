createObservationTests <- function()
{
  if (tolower(Sys.getenv("extendedType")) == "ses")
  {
    education <- list(
      list(source = "A", value = "Less than 12th Grade"),
      list(source = "B", value = "High School Diploma"),
      list(source = "C", value = "Less than Bachelor Degree"),
      list(source = "D", value = "Bachelor Degree Plus"),
      list(source = "U", value = "Unknown")
    )
    
    for (e in education)
    {
      patient <- createPatient()
      claim <- createClaim()
      declareTest(paste("Patient has education level code", e$source, sep = " "), 
                  source_pid = patient$patid, cdm_pid = patient$person_id)
      add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                        gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
      add_ses(patid = patient$patid, d_education_level_code = e$source)
      expect_observation(person_id = patient$person_id, observation_concept_id = 42528763, value_as_string = e$value,
                         observation_type_concept_id = 44814721)
    }
    
    household <- list(
      list(source = 0, value = "Unknown"),
      list(source = 1, value = "<$40K"),
      list(source = 2, value = "$40K-$49K"),
      list(source = 3, value = "$50K-$59K"),
      list(source = 4, value = "$60K-$74K"),
      list(source = 5, value = "$75K-$99K"),
      list(source = 6, value = "$100K+")
    )
    
    for (h in household)
    {
      patient <- createPatient()
      claim <- createClaim()
      declareTest(paste("Patient has household income range code", h$source, sep = " "), 
                  source_pid = patient$patid, cdm_pid = patient$person_id)
      add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                        gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
      add_ses(patid = patient$patid, d_household_income_range_code = h$source)
      expect_observation(person_id = patient$person_id, observation_concept_id = 4076114, value_as_string = h$value,
                         observation_type_concept_id = 44814721)
    }
    
    ownership <- list(
      list(source = 0, value = "Unknown"),
      list(source = 1, value = "Probable Homeowner")
    )
    
    for (owner in ownership)
    {
      patient <- createPatient()
      claim <- createClaim()
      declareTest(paste("Patient has home ownership code", owner$source, sep = " "), 
                  source_pid = patient$patid, cdm_pid = patient$person_id)
      add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                        gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
      add_ses(patid = patient$patid, d_home_ownership_code = owner$source)
      expect_observation(person_id = patient$person_id, observation_concept_id = 4076206, value_as_number = owner$source,
                         value_as_string = owner$value, observation_type_concept_id = 44814721)
    }
    
    occupation <- list(
      list(source = "U", value = "Missing/Unknown"),
      list(source = 1, value = "Manager/Owner/Professional"),
      list(source = 2, value = "White Collar/Health/Civil Service/Military"),
      list(source = 3, value = "Blue Collar"),
      list(source = 4, value = "Homemaker/Retired")
    )
    
    for (occ in occupation)
    {
      patient <- createPatient()
      claim <- createClaim()
      declareTest(paste("Patient has occupation type code", occ$source, sep = " "), 
                  source_pid = patient$patid, cdm_pid = patient$person_id)
      add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                        gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
      add_ses(patid = patient$patid, d_occupation_type_code = occ$source)
      expect_observation(person_id = patient$person_id, observation_concept_id = 4033543, value_as_string = occ$value,
                         observation_type_concept_id = 44814721)
    }
  }
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has series of observations in lab_results that translates to Observation records.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_lab_results(pat_planid = patient$patid, patid = patient$patid, loinc_cd = '76345-8', labclmid = claim$clmid, fst_dt = '2013-07-01')
  add_lab_results(pat_planid = patient$patid, patid = patient$patid, loinc_cd = '75415-0', labclmid = claim$clmid, fst_dt = '2013-07-02')
  expect_observation(person_id = patient$person_id, observation_source_value = '76345-8')
  expect_observation(person_id = patient$person_id, observation_source_value = '75415-0')


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has diag source codes mapping to domain Observation and visit_place_of_service of IP does not get mapped to Condition", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "E001", clmid = claim$clmid, diag_position = 1)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9201)
  expect_observation(person_id = patient$person_id, observation_source_value = 'E001')


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has diag source codes mapping to domain Observation and visit_place_of_service of OP does not get mapped to Condition", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "E001", clmid = claim$clmid, diag_position = 1)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9202)
  expect_observation(person_id = patient$person_id, observation_source_value = 'E001')

  
  hraMappings <- read.csv(file = "inst/csv/hra_mappings.csv", header = TRUE)
  
  apply(X = hraMappings, MARGIN = 1, function(mapping)
  {
    patient <- createPatient()
    claim <- createClaim()
    fieldName <- as.character(tolower(mapping["HRA_FIELD"][[1]]))
    declareTest(sprintf("Patient has HRA record: %s", fieldName),
                source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    
    defaults <- get_defaults_hra()
    
    add_hra(patid = patient$patid,
            name = fieldName)

   
    if (mapping["DOMAIN_ID"] == "Measurement")
    {
      expect_measurement(person_id = patient$person_id,
                         measurement_concept_id = mapping["CONCEPT_ID"],
                         value_as_number = defaults[fieldName][[1]],
                         value_source_value = defaults[fieldName][[1]],
                         unit_concept_id = mapping["UNIT_CONCEPT_ID"],
                         unit_source_value = mapping["UNIT_SOURCE_VALUE"])
    }
    else
    {
      expect_observation(person_id = patient$person_id, 
                         observation_concept_id = mapping["CONCEPT_ID"],
                         value_as_string = mapping["VALUE_AS_STRING_VALUE"])
    }
  })
  
}
