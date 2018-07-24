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

  declareTest("Visit from Drug Exposure")

}
