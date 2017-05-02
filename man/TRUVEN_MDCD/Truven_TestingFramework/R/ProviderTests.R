createProviderTests <- function () {
  
  if (Sys.getenv("truvenType") != "MDCD")
  {
    declareTest("Provider in facility header table with stdprov=220, specialty = emergency medicine")
    provider<-createProvider();
    patient<-createPatient();
    add_facility_header(enrolid=patient$enrolid, provid=patient$provid, stdprov="220")
    expect_provider(specialty_concept_id="38004510", specialty_source_value="220")
  
    declareTest("Provider in outpatient_services table with stdprov=285, specialty = infectious disease")
    provider<-createProvider();
    patient<-createPatient();
    add_outpatient_services(enrolid=patient$enrolid, provid=provider$provid, stdprov="285")
    expect_provider(specialty_concept_id="38004484", specialty_source_value="285")
  
    declareTest("provider in inpatient_services table with stdprov=540, specialty = cardiac surgery")
    provider<-createProvider();
    patient<-createPatient();
    add_inpatient_services(enrolid=patient$enrolid, provid=provider$provid, stdprov="540")
    expect_provider(specialty_concept_id="38004497", specialty_source_value="540")
  
    declareTest("provider in lab table with stdprov =22, specialty = addiction medicine")
    provider<-createProvider();
    patient<-createPatient();
    add_lab(enrolid=patient$enrolid, provid=provider$provid, stdprov="22")
    expect_provider(specialty_concept_id="38004498", specialty_source_value="22")
  }
  
  if (Sys.getenv("truvenType") == "MDCD")
  {
    declareTest("Provider in facility header table with stdprov=220, specialty = emergency medicine")
    provider<-createProvider();
    patient<-createPatient();
    add_facility_header(enrolid=patient$enrolid, prov_id=patient$provid, stdprov="220")
    expect_provider(specialty_concept_id="38004510", specialty_source_value="220")
    
    declareTest("Provider in outpatient_services table with stdprov=285, specialty = infectious disease")
    provider<-createProvider();
    patient<-createPatient();
    add_outpatient_services(enrolid=patient$enrolid, prov_id=provider$provid, stdprov="285")
    expect_provider(specialty_concept_id="38004484", specialty_source_value="285")
    
    declareTest("provider in inpatient_services table with stdprov=540, specialty = cardiac surgery")
    provider<-createProvider();
    patient<-createPatient();
    add_inpatient_services(enrolid=patient$enrolid, prov_id=provider$provid, stdprov="540")
    expect_provider(specialty_concept_id="38004497", specialty_source_value="540")
    
    declareTest("provider in long_term_care table with stdprov=22, specialty = addiction medicine")
    provider<-createProvider();
    patient<-createPatient();
    add_long_term_care(enrolid = patient$enrolid, prov_id=provider$provid, stdprov="22")
    expect_provider(specialty_concept_id="38004498", specialty_source_value="22")
  }
}
