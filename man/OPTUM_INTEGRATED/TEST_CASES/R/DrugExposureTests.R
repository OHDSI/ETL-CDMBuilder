createDrugExposureTests <- function()
{
  
  # Execute Optum SES/DOD Tests ----
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has 2 RX records, the first within the enrollment period, the second outside of enrollment.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_rx_claims(ptid = patient$ptid, pat_planid = patient$pat_planid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  add_rx_claims(ptid = patient$ptid, pat_planid = patient$pat_planid, clmid = claim$clmid, ndc = '58487000102', fill_dt = '12/01/2013')
  expect_drug_exposure(person_id = patient$person_id, drug_source_value = '55111067101')
  expect_no_drug_exposure(person_id = patient$person_id, drug_source_value = '58487000102')
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has multiple RX records, all within enrollment period, but have the same patid, pat_planid, ndc.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_rx_claims(ptid = patient$ptid, pat_planid = patient$pat_planid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  add_rx_claims(ptid = patient$ptid, pat_planid = patient$pat_planid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  add_rx_claims(ptid = patient$ptid, pat_planid = patient$pat_planid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  expect_count_drug_exposure(rowCount = 1, person_id = patient$person_id)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has multiple RX records, all within enrollment period, but have the same patid, pat_planid, ndc, but different claims which should be collapsed.",
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_rx_claims(ptid = patient$ptid, pat_planid = patient$pat_planid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  claim <- createClaim();
  add_rx_claims(ptid = patient$ptid, pat_planid = patient$pat_planid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  claim <- createClaim();
  add_rx_claims(ptid = patient$ptid, pat_planid = patient$pat_planid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  expect_count_drug_exposure(rowCount = 1, person_id = patient$person_id)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has series of drug exposures with the same claim ID, but different fill dates.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_rx_claims(ptid = patient$ptid, pat_planid = patient$pat_planid, clmid = , ndc = '55111067101', fill_dt = '10/01/2013')
  claim <- createClaim();
  add_rx_claims(ptid = patient$ptid, pat_planid = patient$pat_planid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/02/2013')
  claim <- createClaim();
  add_rx_claims(ptid = patient$ptid, pat_planid = patient$pat_planid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/03/2013')
  expect_count_drug_exposure(rowCount = 2, person_id = patient$person_id)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient procedure codes from Medical translate to Drug Exposure, and no Procedure Occurrence", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc1 = '90651', lst_dt = '2013-07-01',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_drug_exposure(person_id = patient$person_id, drug_source_value = '90651')
  expect_no_procedure_occurrence(person_id = patient$person_id, procedure_source_value = '90651')
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("NDC codes from Medical map to drug exposure", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', ndc = '55111067101', lst_dt = '2013-07-01',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = 1322189, drug_source_value = '55111067101')
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Proc codes from lab results map to drug exposure", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_lab_results(labclmid = claim$clmid, pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', proc_cd = '90651')
  expect_drug_exposure(person_id = patient$person_id, drug_source_value = '90651')
  
  
  
  # Execute Optum Oncology Tests ----

  ######################################
  # MEDICATION_ADMINISTRATIONS
  ######################################
  patient <- createPatient();
  declareTest("Patient has 1 valid MEDICATION_ADMINISTRATIONS record within the enrollment period.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201412')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2011-01-07')
  expect_drug_exposure(person_id = patient$person_id, drug_source_value = '55111067101', drug_exposure_start_date = '2011-01-07', drug_type_concept_id = 38000180)
  
  patient <- createPatient();
  declareTest("Patient has 2 MEDICATION_ADMINISTRATIONS records, the first within the enrollment period, the second outside of enrollment.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2011-01-07')
  add_medication_administrations(ptid=patient$ptid, ndc="58487000102", order_date='2013-01-07')
  expect_drug_exposure(person_id = patient$person_id, drug_source_value = '55111067101')
  expect_no_drug_exposure(person_id = patient$person_id, drug_source_value = '58487000102')
  
  patient <- createPatient();
  enc <- createEncounter();
  declareTest("Patient has multiple MEDICATION_ADMINISTRATIONS records, all within enrollment period, but have the same encounter_id, ndc and order_date.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_encounter(encid = enc$encid, ptid = patient$ptid, interaction_type = 'Inpatient', interaction_date = '2011-01-07')
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2011-01-07', encid=enc$encid)
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2011-01-07', encid=enc$encid)
  expect_count_drug_exposure(rowCount = 2, person_id = patient$person_id, visit_occurrence_id=enc$visit_occurrence_id, drug_exposure_start_date = '2011-01-07', drug_source_value = '55111067101')
  
  patient <- createPatient();
  enc <- createEncounter();
  enc2 <- createEncounter();
  declareTest("Patient has multiple MEDICATION_ADMINISTRATIONS records, all within enrollment period, that have the same ndc on the same day, but different encounters.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_encounter(encid = enc$encid, ptid = patient$ptid, interaction_type = 'Inpatient', interaction_date = '2011-01-07')
  add_encounter(encid = enc2$encid, ptid = patient$ptid, interaction_type = 'Inpatient', interaction_date = '2011-01-07')
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medication_administrations(ptid=patient$ptid, encid=enc$encid, ndc="55111067101", order_date='2011-01-07')
  add_medication_administrations(ptid=patient$ptid, encid=enc2$encid, ndc="55111067101", order_date='2011-01-07')
  expect_count_drug_exposure(rowCount = 2, person_id = patient$person_id)
  
  patient <- createPatient();
  enc <- createEncounter();
  declareTest("Patient has series of MEDICATION_ADMINISTRATIONS with the same encounter_id, but different order_date", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_encounter(encid = enc$encid, ptid = patient$ptid, interaction_type = 'Inpatient', interaction_date = '2011-01-07')
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medication_administrations(ptid=patient$ptid, encid=enc$encid, ndc="55111067101", order_date='2011-01-07')
  add_medication_administrations(ptid=patient$ptid, encid=enc$encid, ndc="55111067101", order_date='2011-01-08')
  expect_count_drug_exposure(rowCount = 2, person_id = patient$person_id)
  
  ### Commented out due to native schema not allowing null order dates
  # patient <- createPatient();
  # enc <- createEncounter();
  # declareTest("Patient has MEDICATION_ADMINISTRATIONS with order_date that is NULL")
  # add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  # add_medication_administrations(ptid=patient$ptid, encid=enc$encid, ndc="55111067101", order_date='')
  # expect_count_drug_exposure(rowCount = 0, person_id = patient$person_id)
  
  patient <- createPatient();
  enc <- createEncounter();
  provider <- createProvider();
  declareTest("Patient has MEDICATION_ADMINISTRATIONS with provid that is NULL but the encounter has a valid provider id specified", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_provider(provid = provider$provid, specialty = "Internal Medicine", prim_spec_ind = "1")
  add_encounter(encid = enc$encid, ptid = patient$ptid, interaction_type = 'Inpatient', interaction_date = '2012-01-08')
  add_encounter_provider(encid=enc$encid, provid=provider$provid)
  add_medication_administrations(ptid=patient$ptid, encid=enc$encid, ndc="55111067101", order_date='2012-01-08', provid=NULL)
  expect_drug_exposure(person_id = patient$person_id, drug_exposure_start_date = '2012-01-08', provider_id = provider$provid, visit_occurrence_id = enc$visit_occurrence_id)
  
  patient <- createPatient();
  declareTest("Patient has MEDICATION_ADMINISTRATIONS with an NDC that is properly mapped to the source_concept_id and standard concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2012-01-08')
  expect_drug_exposure(person_id = patient$person_id, drug_source_concept_id = 45071548, drug_source_value="55111067101", drug_concept_id=1322189)
  
  patient <- createPatient();
  declareTest("Patient has MEDICATION_ADMINISTRATIONS with a valid quantity_of_dose", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2012-01-08', quantity_of_dose=.5)
  expect_drug_exposure(person_id = patient$person_id, quantity=.5)
  
  patient <- createPatient();
  declareTest("Patient has MEDICATION_ADMINISTRATIONS and the route value is found in the source-to-concept-map and assigned the proper concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2012-01-08', route="Oral")
  expect_drug_exposure(person_id = patient$person_id, route_concept_id=4128794, route_source_value="Oral")
  
  patient <- createPatient();
  declareTest("Patient has MEDICATION_ADMINISTRATIONS and the route value is NOT found in the source-to-concept-map and assigned concept_id of 0", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2012-01-08', route="Osmosis")
  expect_drug_exposure(person_id = patient$person_id, route_concept_id=0, route_source_value="Osmosis")
  
  patient <- createPatient();
  declareTest("Patient has MEDICATION_ADMINISTRATIONS with a strength_unit that maps to dose_unit_source_value", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2012-01-08', strength_unit="mg/mL")
  expect_drug_exposure(person_id = patient$person_id, dose_unit_source_value = "mg/mL")
  
  ######################################
  # PRESCRIPTIONS_WRITTEN
  ######################################
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with valid information", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, rxdate='2012-01-08')
  expect_drug_exposure(person_id = patient$person_id, drug_type_concept_id = 38000177)
  
  patient <- createPatient();
  declareTest("Patient has multiple PRESCRIPTIONS_WRITTEN with the first within the enrollment period, the second outside of enrollment.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, rxdate='2012-01-08')
  add_prescriptions_written(ptid=patient$ptid, rxdate='2014-01-08')
  expect_count_drug_exposure(rowCount = 1, person_id = patient$person_id)
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN and the NDC is properly mapped to the source_concept_id and standard concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, ndc="55111067101", rxdate='2012-01-08')
  expect_drug_exposure(person_id = patient$person_id, drug_source_concept_id = 45071548, drug_source_value="55111067101", drug_concept_id=1322189)
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains non-numeric values", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, ndc="55111067101", rxdate='2012-01-08', quantity_per_fill = "90 Tab")
  expect_drug_exposure(person_id = patient$person_id, quantity = "90")
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains only numerics", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, ndc="55111067101", rxdate='2012-01-08', quantity_per_fill = "90")
  expect_drug_exposure(person_id = patient$person_id, quantity = "90")
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains NULL AND quantity_of_dose is NOT NULL", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, ndc="55111067101", rxdate='2012-01-08', quantity_per_fill = NULL, quantity_of_dose="1")
  expect_drug_exposure(person_id = patient$person_id, quantity = "1")
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains NULL AND quantity_of_dose is NOT NULL with text", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, ndc="55111067101", rxdate='2012-01-08', quantity_per_fill = NULL, quantity_of_dose="1 tablet")
  expect_drug_exposure(person_id = patient$person_id, quantity = "1")
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with num_refils that contains only numerics", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, ndc="55111067101", rxdate='2012-01-08', num_refills="0")
  expect_drug_exposure(person_id = patient$person_id, refills = "0")
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with quantity_per_fill that contains an empty value", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, ndc="55111067101", rxdate='2012-01-08', quantity_per_fill=NULL)
  expect_drug_exposure(person_id = patient$person_id, refills = "0")
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with days_supply that contains only numerics", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, ndc="55111067101", rxdate='2012-01-08', days_supply="1")
  expect_drug_exposure(person_id = patient$person_id, days_supply = "1")
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with days_supply that contains an empty value", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, ndc="55111067101", rxdate='2012-01-08', days_supply=NULL)
  expect_drug_exposure(person_id = patient$person_id, days_supply = NULL)
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with provid specified", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, ndc="55111067101", rxdate='2012-01-08', provid="843801")
  expect_drug_exposure(person_id = patient$person_id, provider_id="843801")
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with a route that is specified in the route source-to-concept map.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, rxdate='2012-01-08', ndc="55111067101", route="Oral")
  expect_drug_exposure(person_id = patient$person_id, route_concept_id=4128794, route_source_value="Oral")
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN with strength + strength_unit + dosefreq + dosage_form that should be concatenated", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_prescriptions_written(ptid=patient$ptid, ndc="55111067101", rxdate='2012-01-08', strength="20 - 25", strength_unit = "15 MG", dose_frequency = "1 time a day", dosage_form = "Capsule Delayed Release")
  expect_drug_exposure(person_id = patient$person_id, dose_unit_source_value = "20 - 25;15 MG;Capsule Delayed Release;1 time a day")
  
  
  ######################################
  # PATIENT_REPORTED_MEDS
  ######################################
  patient <- createPatient();
  declareTest("Patient has PATIENT_REPORTED_MEDS with valid information", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_patient_reported_medications(ptid=patient$ptid, reported_date='2012-01-08', ndc="55111067101")
  expect_count_drug_exposure(rowCount = 1, person_id = patient$person_id)
  
  patient <- createPatient();
  declareTest("Patient has multiple PATIENT_REPORTED_MEDS with the first within the enrollment period, the second outside of enrollment.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_patient_reported_medications(ptid=patient$ptid, reported_date='2012-01-08', ndc="55111067101")
  add_patient_reported_medications(ptid=patient$ptid, reported_date='2014-01-08', ndc="55111067101")
  expect_count_drug_exposure(rowCount = 1, person_id = patient$person_id)
  
  patient <- createPatient();
  declareTest("Patient has PATIENT_REPORTED_MEDS with valid reported_date and drug_type_concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_patient_reported_medications(ptid=patient$ptid, reported_date='2012-01-08', ndc="55111067101")
  expect_drug_exposure(person_id = patient$person_id, drug_exposure_start_date = "01-08-2012", drug_type_concept_id = 44787730)
  
  patient <- createPatient();
  declareTest("Patient has PRESCRIPTIONS_WRITTEN and the NDC is properly mapped to the source_concept_id and standard concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_patient_reported_medications(ptid=patient$ptid, reported_date='2012-01-08', ndc="55111067101")
  expect_drug_exposure(person_id = patient$person_id, drug_source_concept_id = 45071548, drug_source_value="55111067101", drug_concept_id=1322189)
  
  patient <- createPatient();
  declareTest("Patient has PATIENT_REPORTED_MEDS with provid mapped", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_patient_reported_medications(ptid=patient$ptid, reported_date='2012-01-08', ndc="55111067101", provid="179865")
  expect_drug_exposure(person_id = patient$person_id, provid="179865")
  
  ### Commented out since native schema doesn't allow null reported date
  # patient <- createPatient();
  # declareTest("Patient has PATIENT_REPORTED_MEDS record with a NULL reported_date.")
  # add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  # add_patient_reported_medications(ptid=patient$ptid, reported_date=NULL, ndc="55111067101")
  # expect_count_drug_exposure(rowCount = 0, person_id = patient$person_id)
  
  patient <- createPatient();
  declareTest("Patient has PATIENT_REPORTED_MEDS with a route that is specified in the route source-to-concept map.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_patient_reported_medications(ptid=patient$ptid, reported_date='2012-01-08', ndc="55111067101", route="Oral")
  expect_drug_exposure(person_id = patient$person_id, route_concept_id=4128794, route_source_value="Oral")
  
  patient <- createPatient();
  declareTest("Patient has PATIENT_REPORTED_MEDS with a quantity_of_dose that maps to quantity.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_patient_reported_medications(ptid=patient$ptid, reported_date='2012-01-08', ndc="55111067101", quantity_of_dose="6")
  expect_drug_exposure(person_id = patient$person_id, quantity="6")
  
  ###################################################
  # IMMUNIZATION - OPTUM INTEGRATED LACKS THIS TABLE!
  ###################################################
  # patient <- createPatient();
  # declareTest("Patient has IMMUNIZATION with valid information", source_pid = patient$ptid, cdm_pid = patient$person_id)
  # add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  # add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  # add_immunization(ptid = patient$ptid, immunization_date="2011-10-12", ndc="66521011710", pt_reported="N")
  # expect_count_drug_exposure(rowCount = 1, person_id = patient$person_id)
  # 
  # patient <- createPatient();
  # declareTest("Patient has multiple IMMUNIZATION with the first within the enrollment period, the second outside of enrollment.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  # add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  # add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  # add_immunization(ptid = patient$ptid, immunization_date="2011-10-12", ndc="66521011710", pt_reported="N")
  # add_immunization(ptid = patient$ptid, immunization_date="2013-10-12", ndc="66521011710", pt_reported="N")
  # expect_count_drug_exposure(rowCount = 1, person_id = patient$person_id)
  # 
  # patient <- createPatient();
  # declareTest("Patient has multiple IMMUNIZATION records, all within enrollment period, but have the same immunization_date and ndc", source_pid = patient$ptid, cdm_pid = patient$person_id)
  # add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  # add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  # add_immunization(ptid = patient$ptid, immunization_date="2011-10-12", ndc="66521011710", pt_reported="N")
  # add_immunization(ptid = patient$ptid, immunization_date="2011-10-12", ndc="66521011710", pt_reported="N")
  # expect_count_drug_exposure(rowCount = 2, person_id = patient$person_id)
  # 
  # patient <- createPatient();
  # declareTest("Patient has IMMUNIZATION with immunization_date that is NULL", source_pid = patient$ptid, cdm_pid = patient$person_id)
  # add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  # add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  # add_immunization(ptid = patient$ptid, immunization_date=NULL, ndc="66521011710", pt_reported="N")
  # expect_count_drug_exposure(rowCount = 0, person_id = patient$person_id)
  # 
  # patient <- createPatient();
  # declareTest("Patient has IMMUNIZATION with pt_reported =''Y''", source_pid = patient$ptid, cdm_pid = patient$person_id)
  # add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  # add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  # add_immunization(ptid = patient$ptid, immunization_date="2011-10-12", ndc="66521011710", pt_reported="Y")
  # expect_count_drug_exposure(rowCount = 0, person_id = patient$person_id)
  # 
  # patient <- createPatient();
  # declareTest("Patient has IMMUNIZATION and the NDC is properly mapped to the source_concept_id and standard concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  # add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  # add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  # add_immunization(ptid = patient$ptid, immunization_date="2011-10-12", ndc="66521011710", pt_reported="N")
  # expect_drug_exposure(person_id = patient$person_id, drug_source_concept_id = 46255929, drug_source_value="66521011710", drug_concept_id=44818419)
  # 
  # patient <- createPatient();
  # declareTest("Patient has IMMUNIZATION with pt_reported =''N'' with a valid drug_type_concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  # add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  # add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  # add_immunization(ptid = patient$ptid, immunization_date="2011-10-12", ndc="66521011710", pt_reported="N")
  # expect_drug_exposure(person_id = patient$person_id, drug_type_concept_id="43542358")
  
  ######################################
  # PROCEDURE
  ######################################
  patient <- createPatient();
  declareTest("Procedure has PROC_CODE that is a drug with valid information and valid drug_type_concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid = patient$ptid, proc_code="J9310", proc_code_type="HCPCS", proc_date="2011-02-11")
  expect_drug_exposure(person_id = patient$person_id, drug_type_concept_id = 38000275)
  
  patient <- createPatient();
  declareTest("Patient has multiple PROCEDURE records with the first within the enrollment period, the second outside of enrollment.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid = patient$ptid, proc_date="2011-10-12", proc_code="J9310", proc_code_type="HCPCS")
  add_procedure(ptid = patient$ptid, proc_date="2013-10-12", proc_code="J9310", proc_code_type="HCPCS")
  expect_count_drug_exposure(rowCount = 1, person_id = patient$person_id)
  
  patient <- createPatient();
  declareTest("Patient has multiple PROCEDURE records, all within enrollment period, but have the same PROC_DATE and proc_code.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid = patient$ptid, proc_date="2011-10-12", proc_code="J9310", proc_code_type="HCPCS")
  add_procedure(ptid = patient$ptid, proc_date="2011-10-12", proc_code="J9310", proc_code_type="HCPCS")
  expect_count_drug_exposure(rowCount = 2, person_id = patient$person_id)
  
  ### Commented out due to native schema not allowing null proc date
  # patient <- createPatient();
  # declareTest("Patient has PROCEDURE with PROC_DATE that is NULL")
  # add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  # add_procedure(ptid = patient$ptid, proc_date=NULL, proc_code="J9310", proc_code_type="HCPCS")
  # expect_count_drug_exposure(rowCount = 0, person_id = patient$person_id)
  
  patient <- createPatient();
  declareTest("Patient has PROCEDURE with HCPCS proc_code that maps to a standard concept", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid = patient$ptid, proc_date="2011-10-12", proc_code="J9310", proc_code_type="HCPCS")
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id="46275076", drug_source_value="J9310", drug_source_concept_id="2718907")
  
  patient <- createPatient();
  provider <- createProvider();
  declareTest("Patient has PROCEDURE with provid_perform that maps to provid", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_provider(provid = provider$provid, specialty = "Internal Medicine", prim_spec_ind = "1")
  add_procedure(ptid = patient$ptid, proc_date="2011-10-12", proc_code="J9310", proc_code_type="HCPCS", provid_perform = provider$provid)
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id="46275076", drug_source_value="J9310", drug_source_concept_id="2718907", provider_id = provider$provider_id)
  
  ######################################
  # NLP_DRUG_RATIONALE
  ######################################
  patient <- createPatient();
  enc <- createEncounter();
  declareTest("NLP_DRUG_RATIONALE has valid note_date and other valid information with a valid drug_type_concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_encounter(encid = enc$encid, ptid = patient$ptid, interaction_type = 'Inpatient', interaction_date = '2011-01-07')
  add_nlp_drug_rationale(ptid = patient$ptid, encid = enc$encid, note_date='2011-01-07', drug_name='COUMADIN', drug_action = NULL, sentiment = NULL, reason_general = 'stop')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id="1310149", drug_source_value="COUMADIN", drug_exposure_start_date="2011-01-07", drug_type_concept_id="38000281", visit_occurrence_id=enc$visit_occurrence_id, stop_reason = 'stop')
  
  patient <- createPatient();
  enc <- createEncounter();
  declareTest("Patient has NLP_DRUG_RATIONALE with drug_action = STOP which should prevent it from being imported.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_encounter(encid = enc$encid, ptid = patient$ptid, interaction_type = 'Inpatient', interaction_date = '2011-01-07')
  add_nlp_drug_rationale(ptid = patient$ptid, encid = enc$encid, note_date='2011-01-07', drug_name='COUMADIN', drug_action = 'STOP', sentiment = NULL, reason_general = 'stop')
  expect_count_drug_exposure(rowCount = 0, person_id = patient$person_id)
  
  patient <- createPatient();
  enc <- createEncounter();
  declareTest("Patient has NLP_DRUG_RATIONALE with sentiment = NEED.NOT which should prevent it from being imported.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201212')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_encounter(encid = enc$encid, ptid = patient$ptid, interaction_type = 'Inpatient', interaction_date = '2011-01-07')
  add_nlp_drug_rationale(ptid = patient$ptid, encid = enc$encid, note_date='2011-01-07', drug_name='COUMADIN', drug_action = NULL, sentiment = 'NEED.NOT', reason_general = 'stop')
  expect_count_drug_exposure(rowCount = 0, person_id = patient$person_id)

}
