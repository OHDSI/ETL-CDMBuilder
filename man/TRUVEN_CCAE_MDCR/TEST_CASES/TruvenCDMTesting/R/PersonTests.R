createPersonTests <- function () {

  patient<-createPatient();
  declareTest(id = patient$person_id, "Person with two genders is excluded. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, sex="1");
  add_enrollment_detail(enrolid=patient$enrolid, sex="2");
  expect_no_person(person_id = patient$person_id);

  patient<-createPatient()
  declareTest(id = patient$person_id, "Person with two birth years >2 yrs apart is excluded. Id is PERSON_ID.") 
  add_enrollment_detail(enrolid=patient$enrolid, dobyr="1970")
  add_enrollment_detail(enrolid=patient$enrolid, dobyr="1980")
  expect_no_person(person_id = patient$person_id)

  patient<-createPatient()
  declareTest(id = patient$person_id, "Person with two birth years <2 yrs apart is kept with last birth year selected. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend="2012-01-31", dtstart="2012-01-01", dobyr="1970")
  add_enrollment_detail(enrolid=patient$enrolid, dtend="2012-02-28", dtstart="2012-02-01", dobyr="1971")
  expect_person(person_id=patient$person_id, year_of_birth="1971")

  patient<-createPatient()
  declareTest(id = patient$person_id, "Person born before 1900 is excluded. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dobyr="1899")
  expect_no_person(person_id = patient$person_id)

  patient<-createPatient()
  declareTest(id = patient$person_id, "Person born in 2099 is excluded. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dobyr="2099")
  expect_no_person(person_id = patient$person_id)

  patient<-createPatient()
  declareTest(id = patient$person_id, "Person born in 2014 but enrolled in 2012 is excluded. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend="2012-01-31", dtstart="2012-01-01", dobyr="2014")
  expect_no_person(person_id = patient$person_id)
  
  patient<-createPatient()
  declareTest(id = patient$person_id, "Person born in 2013 but enrolled in 2012 is kept, latest birth year taken. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend="2012-01-31", dtstart="2012-01-01", dobyr="2013")
  expect_person(person_id=patient$person_id, year_of_birth="2013")

  patient<-createPatient()
  declareTest(id = patient$person_id, "Person with two enrollment_detail records has one person record. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend="2012-01-31", dtstart="2012-01-01", dobyr="1980")
  add_enrollment_detail(enrolid=patient$enrolid, dtend="2012-02-28", dtstart="2012-02-01", dobyr="1980")
  expect_person(person_id=patient$person_id, year_of_birth="1980")

  patient<-createPatient()
  declareTest(id = patient$person_id, "Person with sex=3 is excluded. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, sex="3")
  expect_no_person(person_id = patient$person_id)

  patient<-createPatient()
  declareTest(id = patient$person_id, "Person has record with sex=3 but last record has sex=1, person is kept. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend="2012-01-31", dtstart="2012-01-01", sex="3")
  add_enrollment_detail(enrolid=patient$enrolid, dtend="2012-02-28", dtstart="2012-02-01", sex="1")
  expect_person(person_id=patient$person_id, gender_concept_id="8507")

  patient<-createPatient()
  declareTest(id = patient$person_id, "Person born the same year as enrolled, use first enrollment month to impute month of birth and day of birth. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend="2012-04-30", dtstart="2012-04-01", dobyr="2012")
  expect_person(person_id=patient$person_id, year_of_birth="2012", month_of_birth="4", day_of_birth="1")
  
  if (Sys.getenv("truvenType") != "MDCD")
  {
    patient<-createPatient()
    declareTest(id = patient$person_id, "Person with Rx benefits is kept. Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, rx="1")
    expect_person(person_id=patient$person_id)
    
    patient<-createPatient()
    declareTest(id = patient$person_id, "Person without Rx benefits is excluded. Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, rx="0")
    expect_no_person(person_id = patient$person_id)
    
    patient<-createPatient()
    declareTest(id = patient$person_id, "Person with last enrollment_detail record that has egeoloc=11 gets associated to NJ. Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, dtend="2012-01-31", dtstart="2012-01-01", egeoloc="89")
    add_enrollment_detail(enrolid=patient$enrolid, dtend="2012-02-28", dtstart="2012-02-01", egeoloc="11")
    expect_person(person_id=patient$person_id)
  }
  
  if (Sys.getenv("truvenType") == "MDCD")
  {
    patient <- createPatient()
    declareTest(id = patient$person_id, "Person with DRUGCOVG=0 and MEDICARE=0, person is excluded. Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, drugcovg = '0', medicare = '0')
    expect_no_person(person_id = patient$person_id)
    
    patient <- createPatient()
    declareTest(id = patient$person_id, "Person with DRUGCOVG=1 and MEDICARE=0, person is kept. Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, drugcovg = '1', medicare = '0')
    expect_person(person_id = patient$person_id)
    
    patient <- createPatient()
    declareTest(id = patient$person_id, "Person with DRUGCOVG=0 and MEDICARE=1, person is kept. Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, drugcovg = '0', medicare = '1')
    expect_person(person_id = patient$person_id)
    
    patient <- createPatient()
    declareTest(id = patient$person_id, "Person with stdrace=1. Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, stdrace = '1')
    expect_person(person_id = patient$person_id, race_concept_id = '8527', ethnicity_concept_id = '38003564')
    
    patient <- createPatient()
    declareTest(id = patient$person_id, "Person with stdrace=4. Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, stdrace = '4')
    expect_person(person_id = patient$person_id, race_concept_id = '0', ethnicity_concept_id = '38003563')
  }
}
