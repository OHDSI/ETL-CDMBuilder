createProviderTests <- function()
{
  provider <- createProvider();
  declareTest('valid GP: role=2 (Partner); provider_concept_id=38004446',source_pid = provider$staffid, cdm_pid = provider$provider_id)
  add_staff(staffid = provider$staffid, role=2)
  expect_provider(provider_id = provider$provider_id, specialty_source_value = 2, specialty_concept_id = 38004446)

  provider <- createProvider();
  declareTest('valid GP: role=68 (Radiographer ); provider_concept_id=38004675',source_pid = provider$staffid, cdm_pid = provider$provider_id)
  add_staff(staffid = provider$staffid, role=68)
  expect_provider(provider_id = provider$provider_id, specialty_source_value = 68, specialty_concept_id = 38004675)

  provider <- createProvider();
  declareTest('valid GP: role=0 (Data Not Entered ) provider concept_id=38004514',source_pid = provider$staffid, cdm_pid = provider$provider_id)
  add_staff(staffid = provider$staffid, role=0)
  expect_provider(provider_id = provider$provider_id, specialty_source_value = 0, specialty_concept_id = 38004514)

  patient <- createPatient(pracid = 111)
  provider <- createProvider(providerId='A52');
  declareTest("valid hes: Provider=A52 role=950 (Not treatment functions )",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=199, mob=1, accept=0, crd='2010-01-01', deathdate=NULL, tod=NULL, pracid=patient$pracid)
  add_hes_episodes(patid =patient$patid,  pconsult = provider$provider_id, tretspef =  '950')
  expect_provider(provider_source_value = provider$provider_id, specialty_source_value = 950)

  patient <- createPatient(pracid = 111)
  provider <- createProvider(providerId='C44');
  add_patient(patid=patient$patid,gender=1, yob=199, mob=1, accept=0, crd='2010-01-01', deathdate=NULL, tod=NULL, pracid=patient$pracid)
  declareTest("role=&  mapped to 38004514",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_hes_episodes(patid =patient$patid, pconsult = provider$provider_id, tretspef =  '&')
  expect_provider(provider_source_value = provider$provider_id, specialty_source_value = '&', specialty_concept_id = 38004514)

  patient <- createPatient(pracid = 111)
  provider <- createProvider(providerId='B98');
  declareTest("role=NULL mapped to 0",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=199, mob=1, accept=0, crd='2010-01-01', deathdate=NULL, tod=NULL, pracid=patient$pracid)
  add_hes_episodes(patid =patient$patid, pconsult = provider$provider_id, tretspef =  NULL)
  expect_provider(provider_source_value = provider$provider_id, specialty_source_value = NULL, specialty_concept_id = 38004514)

  patient <- createPatient(pracid = 111)
  provider <- createProvider(providerId='&');
  declareTest("invalid provider",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=199, mob=1, accept=0, crd='2010-01-01', deathdate=NULL, tod=NULL, pracid=patient$pracid)
  add_hes_episodes(patid =patient$patid, pconsult = provider$provider_id, tretspef =  '191')
  expect_no_provider(provider_source_value = provider$provider_id)



}
