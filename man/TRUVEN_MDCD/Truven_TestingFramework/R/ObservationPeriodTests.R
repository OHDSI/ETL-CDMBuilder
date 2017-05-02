createObservationPeriodTests <- function () {

  patient<-createPatient();
  declareTest("Subsumed enrollment test where two enrollment durations with the second subsumed by the first results in a single observation", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-01-01", dtend="2012-12-31");
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-06-01", dtend="2012-07-31");
  expect_observation_period(person_id=patient$person_id, observation_period_start_date="2012-01-01", observation_period_end_date="2012-12-31")

  patient<-createPatient();
  declareTest("Combine enrollment test where two enrollment durations with the second within 30 days of the first results in a single observation", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-05-01", dtend="2012-05-31")
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-06-15", dtend="2012-12-31")
  expect_observation_period(person_id=patient$person_id, observation_period_start_date="2012-05-01", observation_period_end_date="2012-12-31")

  patient<-createPatient();
  declareTest("Gap enrollment test where two enrollment durations are 33 days apart results in two observations", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-01-01", dtend="2012-06-01")
  add_enrollment_detail(enrolid=patient$enrolid, dtstart="2012-08-02", dtend="2012-12-31")
  expect_observation_period(person_id=patient$person_id, observation_period_start_date="2012-01-01", observation_period_end_date="2012-06-01")
  expect_observation_period(person_id=patient$person_id, observation_period_start_date="2012-08-02", observation_period_end_date="2012-12-31")

}
