createMeasurementTests <- function () {

  
  if (Sys.getenv("truvenType") != "MDCD")
  {
    
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest(id = patient$person_id, "LOINC code does not have a dash in the second to last character, record is dropped. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2012-03-07', loinccd = '99999')
  expect_no_measurement(person_id = patient$person_id)
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest(id = patient$person_id, "Svcdate is outside of observation period, record is dropped. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2013-07-09', loinccd = '56773-5')
  expect_no_measurement(person_id = patient$person_id)
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest(id = patient$person_id, "Patient has abnormal=L; value as concept_id = 4267416. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2012-12-20', loinccd = '56784-2', abnormal = 'L')
  expect_measurement(person_id = patient$person_id, value_as_concept_id = '4267416')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest(id = patient$person_id, "Patient has result ne 0 and > neg 99999, result listed in value as number field. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2012-08-24', loinccd = '56789-1', result = '120')
  expect_measurement(person_id = patient$person_id, value_as_number = '120')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest(id = patient$person_id, "Patient lowercase units, maps to unit_concept_id 8840 (HIX-1183). Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2012-04-06', loinccd = '56789-1', result = '100', resunit = 'mg/dl')
  expect_measurement(person_id = patient$person_id, value_as_number = '100', unit_concept_id = '8840')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest(id = patient$person_id, "If you do not get a map from UCUM for UNIT_CONCEPT_ID then try JNJ_UNITS (HIX-1419). Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2012-04-06', loinccd = '56789-1', result = '100', resunit = 'lbs.')
  expect_measurement(person_id = patient$person_id, unit_concept_id = '8739')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest(id = patient$person_id, "for LOINCs 3142-7, 29463-7, 3141-9 sometimes padded with 0000, strip padding (HIX-1418). Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2012-04-06', loinccd = '29463-7', result = '1500000', resunit = 'lbs.')
  expect_measurement(person_id = patient$person_id, value_as_number = '150', unit_concept_id = '8739')
  
  }
  
  
  if (Sys.getenv("truvenType") == "CCAE")
  {
  
    patient <- createPatient()
    encounter <- createEncounter()  
    declareTest(id = patient$person_id, "Patient has 2 in CGTPKAMT column, value_as_number=1 pack per day or more. Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
    add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2012-03-14', cgtpkamt = '2')
    expect_measurement(person_id = patient$person_id, measurement_source_value = 'CGTPKAMT', value_as_number = '2', measurement_date = '2012-03-14', value_source_value = '1 pack per day or more')
    
    patient <- createPatient()
    encounter <- createEncounter()  
    declareTest(id = patient$person_id, "Patient has weight 201, value_as_string = null, value_as_number=201. Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
    add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2012-07-16', weight = '201')
    expect_measurement(person_id = patient$person_id, measurement_source_value = 'WEIGHT', value_as_number = '201', measurement_date = '2012-07-16')
      
    patient <- createPatient()
    encounter <- createEncounter()  
    declareTest(id = patient$person_id, "BMI is only question answered bmi is only record created in observation . Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
    add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2012-09-22', bmi = '28.6')
    expect_measurement(person_id = patient$person_id, measurement_source_value = 'BMI', value_as_number = '28.6', measurement_date = '2012-09-22')
  
  }
  
}
