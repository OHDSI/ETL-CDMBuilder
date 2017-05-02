createLocationTests <- function () {

if (Sys.getenv("truvenType") != "MDCD")  {
  
  patient<-createPatient()
  declareTest("Location record generated for egeoloc 11", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, egeoloc = "11")
  expect_location(state="NJ",location_source_value="11")

  patient<-createPatient()
  declareTest("No location record generated for egeoloc 89", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, egeoloc = "89")
  expect_count_location(location_source_value = "89", rowCount = 0)

  patient<-createPatient()
  declareTest("Only one location record generated for 38", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, egeoloc = "38", dtend="2012-07-31", dtstart="2012-07-01")
  add_enrollment_detail(enrolid=patient$enrolid, egeoloc = "38", dtend="2012-06-30", dtstart="2012-06-01")
  expect_location(state="VA",location_source_value="38")
  
  }
}
