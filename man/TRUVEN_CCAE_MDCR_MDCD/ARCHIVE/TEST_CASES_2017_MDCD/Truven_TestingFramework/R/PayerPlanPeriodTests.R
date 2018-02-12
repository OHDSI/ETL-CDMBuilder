# might not need this
createPayerPlanPeriodTests <- function () {

  if (Sys.getenv("truvenType") != "MDCD") {
  
  patient<-createPatient()
  declareTest("Person has a gap of >32 days between enrollment periods with the same payer_source_value; person has two records", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2013-01-01", dtend="2013-01-31", datatyp="1", plantyp="6")
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2013-05-01", dtend="2013-05-31", datatyp="1", plantyp="6")
  expect_payer_plan_period(person_id=patient$person_id, payer_plan_period_start_date="2013-01-01", payer_plan_period_end_date="2013-01-31", payer_source_value="N Commercial PPO")
  expect_payer_plan_period(person_id=patient$person_id, payer_plan_period_start_date="2013-05-01", payer_plan_period_end_date="2013-05-31", payer_source_value="N Commercial PPO")

  patient<-createPatient()
  declareTest("Person does not have prescription benefits and is excluded", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2013-01-01", dtend="2013-01-31", datatyp="1", plantyp="6", rx="0")
  expect_no_payer_plan_period(person_id = patient$person_id)

  patient<-createPatient()
  declareTest("Person switches plans in the middle of an enrollment period; person has two records with the first truncated", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-04-01", dtend="2012-04-30", datatyp="2", plantyp="6")
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-04-07", dtend="2012-04-30", datatyp="2", plantyp="5")
  expect_payer_plan_period(person_id=patient$person_id, payer_plan_period_start_date="2012-04-01", payer_plan_period_end_date="2012-04-06", payer_source_value="C Commercial PPO")
  expect_payer_plan_period(person_id=patient$person_id, payer_plan_period_start_date="2012-04-07", payer_plan_period_end_date="2012-04-30", payer_source_value="C Commercial POS")

  patient<-createPatient()
  declareTest("Person has duplicate records, only one is brought into the cdm", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-04-01", dtend="2012-04-30", datatyp="2", plantyp="6")
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-04-01", dtend="2012-04-30", datatyp="2", plantyp="6")
  expect_payer_plan_period(person_id=patient$person_id, payer_plan_period_start_date="2012-04-01", payer_plan_period_end_date="2012-04-30", payer_source_value="C Commercial PPO")
  }
  
  if (Sys.getenv("truvenType") == "MDCD") {
    
    patient<-createPatient()
    declareTest("Person has a gap of >32 days between enrollment periods with the same payer_source_value; person has two records", source_pid = patient$enrolid, cdm_pid = patient$person_id)
    add_enrollment_detail(enrolid=patient$enrolid, dtstart="2013-01-01", dtend="2013-01-31", medicare="1", plantyp="6", cap = "1")
    add_enrollment_detail(enrolid=patient$enrolid, dtstart="2013-05-01", dtend="2013-05-31", medicare="1", plantyp="6", cap = "1")
    expect_payer_plan_period(person_id=patient$person_id, payer_plan_period_start_date="2013-01-01", payer_plan_period_end_date="2013-01-31", payer_source_value="D N PPO")
    expect_payer_plan_period(person_id=patient$person_id, payer_plan_period_start_date="2013-05-01", payer_plan_period_end_date="2013-05-31", payer_source_value="D N PPO")
    
    patient<-createPatient()
    declareTest("Person does not have prescription benefits and is excluded", source_pid = patient$enrolid, cdm_pid = patient$person_id)
    add_enrollment_detail(enrolid=patient$enrolid, dtstart="2013-01-01", dtend="2013-01-31", plantyp="6", drugcovg ="0")
    expect_no_payer_plan_period()
    
    patient<-createPatient()
    declareTest("Person switches plans in the middle of an enrollment period; person has two records with the first truncated", source_pid = patient$enrolid, cdm_pid = patient$person_id)
    add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-04-01", dtend="2012-04-30", medicare="1", plantyp="6", cap = "1")
    add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-04-07", dtend="2012-04-30", medicare="1", plantyp="5", cap = "1")
    expect_payer_plan_period(person_id=patient$person_id, payer_plan_period_start_date="2012-04-01", payer_plan_period_end_date="2012-04-07", payer_source_value="D N PPO")
    expect_payer_plan_period(person_id=patient$person_id, payer_plan_period_start_date="2012-04-07", payer_plan_period_end_date="2012-04-30", payer_source_value="D N POS")
    
    patient<-createPatient()
    declareTest("Person has duplicate records, only one is brought into the cdm", source_pid = patient$enrolid, cdm_pid = patient$person_id)
    add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-04-01", dtend="2012-04-30", medicare="1", plantyp="6", cap="1")
    add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-04-01", dtend="2012-04-30", medicare="1", plantyp="6", cap="1")
    expect_payer_plan_period(person_id=patient$person_id, payer_plan_period_start_date="2012-04-01", payer_plan_period_end_date="2012-04-30", payer_source_value="D N PPO")
  }
}
