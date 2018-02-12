createProviderTests <- function () {
  
  if (Sys.getenv("truvenType") != "MDCD")
  {
    provider<-createProvider();
    declareTest(id = provider$provid, description = "Provider in facility header table with stdprov=220, specialty = emergency medicine. Id is PROVIDER_SOURCE_VALUE")
    patient<-createPatient();
    add_facility_header(enrolid=patient$enrolid, provid=provider$provid, stdprov="220")
    expect_provider(specialty_concept_id="38004510", specialty_source_value="220")
  
    provider<-createProvider();
    declareTest(id = provider$provid, description = "Provider in outpatient_services table with stdprov=285, specialty = infectious disease. Id is PROVIDER_SOURCE_VALUE")
    patient<-createPatient();
    add_outpatient_services(enrolid=patient$enrolid, provid=provider$provid, stdprov="285")
    expect_provider(specialty_concept_id="38004484", specialty_source_value="285")
  
    provider<-createProvider();
    declareTest(id = provider$provid, description = "provider in inpatient_services table with stdprov=540, specialty = cardiac surgery. Id is PROVIDER_SOURCE_VALUE")
    patient<-createPatient();
    add_inpatient_services(enrolid=patient$enrolid, provid=provider$provid, stdprov="540")
    expect_provider(specialty_concept_id="38004497", specialty_source_value="540")
  
    provider<-createProvider();
    declareTest(id = provider$provid, description = "provider in lab table with stdprov =22, specialty = addiction medicine. Id is PROVIDER_SOURCE_VALUE")
    patient<-createPatient();
    add_lab(enrolid=patient$enrolid, provid=provider$provid, stdprov="22")
    expect_provider(specialty_concept_id="38004498", specialty_source_value="22")
    
    provider<-createProvider();
    declareTest(id = provider$provid, description = "Even when PROVID IS NULL create a PROVIDER (HIX-1404). Id is PROVIDER_SOURCE_VALUE")
    patient<-createPatient();
    add_facility_header(enrolid=patient$enrolid, provid=NULL, stdprov="220")
    expect_provider( provider_source_value = '', specialty_source_value="220")
  }
  
  if (Sys.getenv("truvenType") == "MDCD")
  {
    provider<-createProvider();
    declareTest(id = provider$provid, description = "Provider in facility header table with stdprov=220, specialty = emergency medicine. Id is PROVIDER_SOURCE_VALUE")
    patient<-createPatient();
    add_facility_header(enrolid=patient$enrolid, prov_id=provider$provid, stdprov="220")
    expect_provider(specialty_concept_id="38004510", specialty_source_value="220")
    
    provider<-createProvider();
    declareTest(id = provider$provid, description = "Provider in outpatient_services table with stdprov=285, specialty = infectious disease. Id is PROVIDER_SOURCE_VALUE")
    patient<-createPatient();
    add_outpatient_services(enrolid=patient$enrolid, prov_id=provider$provid, stdprov="285")
    expect_provider(specialty_concept_id="38004484", specialty_source_value="285")
    
    provider<-createProvider();
    declareTest(id = provider$provid, description = "provider in inpatient_services table with stdprov=540, specialty = cardiac surgery. Id is PROVIDER_SOURCE_VALUE")
    patient<-createPatient();
    add_inpatient_services(enrolid=patient$enrolid, prov_id=provider$provid, stdprov="540")
    expect_provider(specialty_concept_id="38004497", specialty_source_value="540")
    
    provider<-createProvider();
    declareTest(id = provider$provid, description = "provider in long_term_care table with stdprov=22, specialty = addiction medicine. Id is PROVIDER_SOURCE_VALUE")
    patient<-createPatient();
    add_long_term_care(enrolid = patient$enrolid, prov_id=provider$provid, stdprov="22")
    expect_provider(specialty_concept_id="38004498", specialty_source_value="22")
    
    provider<-createProvider();
    declareTest(id = provider$provid, description = "Even when PROVID IS NULL create a PROVIDER (HIX-1404)")
    patient<-createPatient();
    add_facility_header(enrolid=patient$enrolid, prov_id=NULL, stdprov="220")
    expect_provider( provider_source_value = '', specialty_source_value="220")
  }
  
}
