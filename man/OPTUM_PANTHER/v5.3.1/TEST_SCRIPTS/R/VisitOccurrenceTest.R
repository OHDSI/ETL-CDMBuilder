createVisitOccurrenceTests <- function () {

  patient <- createPatient();
  declareTest(description="Visit from Diagnosis Test", source_pid = patient$ptid, cdm_pid = patient$person_id)
  encounter1 <- createEncounter();
  encounter2 <- createEncounter();
  visitId <- sequencer$nextSequence();

  add_patient(patient$ptid);
  add_diagnosis(ptid=patient$ptid, diagnosis_cd = '4019', diagnosis_status = 'Diagnosis of', diagnosis_cd_type = 'ICD9', encid = encounter1$encid);
  add_diagnosis(ptid=patient$ptid, diagnosis_cd = '2724', diagnosis_status = 'Diagnosis of', diagnosis_cd_type = 'ICD9', encid = encounter2$encid);
  add_visit(ptid=patient$ptid, visitid = visitId, visit_start_date = "2014-03-05", visit_end_date = "2014-03-10")
  add_encounter(ptid=patient$ptid, encid = encounter1$encid, visitid = visitId, interaction_date = "2014-03-06")
  add_encounter(ptid=patient$ptid, encid = encounter2$encid, visitid = visitId, interaction_date = "2014-03-07")

  expect_count_visit_occurrence(rowCount = 1, person_id = patient$person_id, visit_start_date = "2014-03-05", visit_end_date = "2014-03-10");
  expect_no_visit_occurrence(person_id = patient$person_id, visit_start_date = "2014-03-06")
  expect_no_visit_occurrence(person_id = patient$person_id, visit_start_date = "2014-03-07")

  patient <- createPatient();
  declareTest(description="Native Visit with single encounter from Medication Administration", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  visitId <- sequencer$nextSequence();
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201412')
  add_visit(ptid=patient$ptid, visitid = visitId, visit_start_date = "2011-01-07", visit_end_date = "2011-01-08")
  add_encounter(ptid=patient$ptid, visitid = visitId, encid = enc$encid, interaction_date='2011-01-07')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2011-01-07', encid = enc$encid)
  expect_visit_occurrence(person_id = patient$person_id)
  expect_visit_detail(person_id = patient$person_id)
  expect_drug_exposure(person_id = patient$person_id, visit_occurrence_id = enc$visit_occurrence_id, visit_detail_id = enc$visit_occurrence_id)

  patient <- createPatient();
  declareTest(description="Native Visit with multiple encounters from Medication Administration", source_pid = patient$ptid, cdm_pid = patient$person_id)
  encounter1 <- createEncounter();
  encounter2 <- createEncounter();
  visitId <- sequencer$nextSequence();
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201412')
  add_visit(ptid=patient$ptid, visitid = visitId, visit_start_date = "2011-01-07", visit_end_date = "2011-01-08")
  add_encounter(ptid=patient$ptid, visitid = visitId, encid = encounter1$encid, interaction_date='2011-01-07', interaction_time='00:00:00')
  add_encounter(ptid=patient$ptid, visitid = visitId, encid = encounter2$encid, interaction_date='2011-01-07', interaction_time='21:00:00')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2011-01-07', encid = encounter1$encid)
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2011-01-07', encid = encounter2$encid)
  expect_count_visit_occurrence(rowCount = 1, person_id = patient$person_id)
  expect_count_visit_detail(rowCount = 2, person_id = patient$person_id)
  expect_count_drug_exposure(rowCount = 2, person_id = patient$person_id)

  patient <- createPatient();
  declareTest(description="Native Encounter without Visit from Medication Administration", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201412')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_date='2011-01-07', interaction_time='00:00:00')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2011-01-07', encid = enc$encid)
  expect_count_visit_occurrence(rowCount = 1, person_id = patient$person_id)
  expect_count_visit_detail(rowCount = 1, person_id = patient$person_id)
  expect_count_drug_exposure(rowCount = 1, person_id = patient$person_id)

  patient <- createPatient();
  declareTest(description="Verify visit_occurrence field mappings for single encounter", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201412')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_date='2011-01-07', interaction_time='00:00:00',
                interaction_type = 'Ambulatory patient services')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2011-01-07', encid = enc$encid)
  expect_visit_occurrence(person_id = patient$person_id, visit_occurrence_id = enc$visit_occurrence_id,
                          visit_concept_id = 9202)
  expect_visit_detail(person_id = patient$person_id, visit_occurrence_id = enc$visit_occurrence_id,
                      visit_detail_concept_id = 9202)

  patient <- createPatient();
  declareTest(description="Verify visit_occurrence field mappings for native visit with single encounter", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  visitId <- sequencer$nextSequence();
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201412')
  add_visit(ptid=patient$ptid, visitid = visitId,
            visit_type = 'Observation Patient',
            visit_start_date = '2011-01-06',
            visit_start_time = '01:02:03',
            visit_end_date = '2011-01-08',
            visit_end_time = '03:02:01',
            admission_source = 'Referred by physician or self referral; non-healthcare facility point of origin',
            discharge_disposition = '01 DISCHARGED TO HOME OR SELF CARE')
  add_encounter(ptid=patient$ptid, encid = enc$encid, visitid = visitId, interaction_date='2011-01-07', interaction_time='00:00:00',
                interaction_type = 'Ambulatory patient services')
  add_medication_administrations(ptid=patient$ptid, ndc="55111067101", order_date='2011-01-07', encid = enc$encid)
  expect_visit_occurrence(person_id = patient$person_id, visit_occurrence_id = enc$visit_occurrence_id,
                          visit_concept_id = 9201,
                          visit_start_date = '2011-01-06',
                          visit_start_datetime = '01:02:03',
                          visit_end_date = '2011-01-08',
                          visit_end_datetime = '03:02:01',
                          admitting_source_concept_id = 45884262,
                          discharge_to_concept_id = 21499184)
  expect_visit_detail(person_id = patient$person_id, visit_occurrence_id = enc$visit_occurrence_id,
                      visit_detail_concept_id = 9201)

}
