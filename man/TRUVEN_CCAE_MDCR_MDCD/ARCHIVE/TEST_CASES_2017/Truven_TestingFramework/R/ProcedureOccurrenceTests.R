createProcedureOccurrenceTests <- function () {
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has two PPROC values, PPROC from inpatient_admissions is used", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_inpatient_services(caseid = encounter$caseid, enrolid = patient$enrolid, pproc = '65779', svcdate = '2012-06-11', tsvcdat = '2012-06-12', year = '2012')
  add_inpatient_admissions(caseid = encounter$caseid, enrolid = patient$enrolid, pproc = '29914', year = '2012')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = '40757126', procedure_date = '2012-06-12')
  
  if (Sys.getenv("truvenType") != "MDCD") {
    patient <- createPatient()
    encounter <- createEncounter()
    declareTest("Patient has two different providers for the same procedure, the provider on the first line (ascending) is chosen", source_pid = patient$enrolid, cdm_pid = patient$person_id)
    add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
    add_inpatient_admissions(enrolid = patient$enrolid, caseid = encounter$caseid, year = '2012')
    add_inpatient_services(enrolid = patient$enrolid, caseid = encounter$caseid, svcdate = '2012-10-20', tsvcdat = '2012-10-22', provid = '3456789', proc1 = '50760', stdprov = '220', year = '2012')
    add_inpatient_services(enrolid = patient$enrolid, caseid = encounter$caseid, svcdate = '2012-10-20', tsvcdat = '2012-10-22', provid = '1234567', proc1 = '50760', stdprov = '540', year = '2012')
    expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = '2109659', procedure_date = '2012-10-20')
    
    patient <- createPatient()
    encounter <- createEncounter()
    declareTest("Patient has HCPCS procedure code with value in PROCMOD, only HCPCS comes across in record since PROCMOD associated with CPT4 only", source_pid = patient$enrolid, cdm_pid = patient$person_id)
    add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
    add_outpatient_services(enrolid = patient$enrolid, proc1 = 'C9727', procmod = 'P1',svcdate = '2012-05-12', tsvcdat = '2012-05-12')
    expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = '2616464', procedure_date = '2012-05-12', modifier_concept_id = '0')
    
  } 
  
  if (Sys.getenv("truvenType") == "MDCD") {
    patient <- createPatient()
    encounter <- createEncounter()
    declareTest("Patient has two different providers for the same procedure, the provider on the first line (ascending) is chosen", source_pid = patient$enrolid, cdm_pid = patient$person_id)
    add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
    add_inpatient_admissions(enrolid = patient$enrolid, caseid = encounter$caseid, year = '2012')
    add_inpatient_services(enrolid = patient$enrolid, caseid = encounter$caseid, svcdate = '2012-10-20', tsvcdat = '2012-10-22', prov_id = '3456789', proc1 = '50760', stdprov = '220', year = '2012')
    add_inpatient_services(enrolid = patient$enrolid, caseid = encounter$caseid, svcdate = '2012-10-20', tsvcdat = '2012-10-22', prov_id = '1234567', proc1 = '50760', stdprov = '540', year = '2012')
    expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = '2109659', procedure_date = '2012-10-20')
    
    
    patient <- createPatient()
    encounter <- createEncounter()
    declareTest("Patient has procedure in proc1 field in long_term_care table", source_pid = patient$enrolid, cdm_pid = patient$person_id)
    add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
    add_long_term_care(enrolid = patient$enrolid, svcdate = '2012-09-15', tsvcdat = '2012-10-30', proc1 = '92568' )
    expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = '2313736', procedure_date = '2012-09-15')
  }
    
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has two records for the same procedure, procedure in outpatient_services prioritized", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_outpatient_services(enrolid = patient$enrolid, fachdid = encounter$caseid, proc1 = '54861', svcdate = '2012-02-15', tsvcdat = '2012-02-15', year = '2012')
  add_facility_header(enrolid = patient$enrolid, fachdid = encounter$caseid, proc1 = '54861', svcdate = '2012-02-15', tsvcdat = '2012-02-15', year = '2012')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = '2109995', procedure_date = '2012-02-15', procedure_type_concept_id = '38000267')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has procedure in proc5 position in facility header, procedure_type_concept_id = 38000273", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_outpatient_services(enrolid = patient$enrolid, fachdid = encounter$caseid, svcdate = '2012-03-03', tsvcdat = '2012-03-03', year = '2012')
  add_facility_header(enrolid = patient$enrolid, fachdid = encounter$caseid, proc5 = '93042', svcdate = '2012-03-03', tsvcdat = '2012-03-03', year = '2012')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = '2313827', procedure_type_concept_id = '38000273' )
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has procedure with domain = device, device record created", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_outpatient_services(enrolid = patient$enrolid, fachdid = encounter$caseid, proc1 = 'E0304', svcdate = '2012-04-03', tsvcdat = '2012-04-03', year = '2012')
  add_facility_header(enrolid = patient$enrolid, fachdid = encounter$caseid, svcdate = '2012-04-03', tsvcdat = '2012-04-03', year = '2012')
  expect_device_exposure(person_id = patient$person_id, device_concept_id = '2616599', device_exposure_start_date = '2012-04-03')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has procedure with domain = drug, drug record created", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_outpatient_services(enrolid = patient$enrolid, proc1 = '90686', svcdate = '2012-05-03', tsvcdat = '2012-05-03')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = '44816520', drug_exposure_start_date = '2012-05-03')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has procedure with domain = measurement, measurement record created", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_outpatient_services(enrolid = patient$enrolid, proc1 = '82985', svcdate = '2012-05-03', tsvcdat = '2012-05-03')
  expect_measurement(person_id = patient$person_id, measurement_concept_id = '2212375', measurement_date = '2012-05-03')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has procedure with domain = observation, observation record created", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_outpatient_services(enrolid = patient$enrolid, proc1 = 'S9368', svcdate = '2012-05-03', tsvcdat = '2012-05-03')
  expect_observation(person_id = patient$person_id, observation_concept_id = '2721503', observation_date = '2012-05-03')
  
  #Test case to address issue HIX-1255
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has an ICD10PCS value in inpatient_admissions field PPROC, PPROC is correctly mapped and a procedure_occurrence record created", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_inpatient_admissions(caseid = encounter$caseid, enrolid = patient$enrolid, pproc = 'DB025ZZ', year = '2012', admdate = '2012-05-30', disdate = '2012-06-05')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = '2789746', procedure_date = '2012-06-05')
  
}
