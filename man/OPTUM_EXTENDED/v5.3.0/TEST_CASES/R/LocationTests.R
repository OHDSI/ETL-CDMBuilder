createLocationTests <- function()
{
  if (tolower(Sys.getenv("extendedType")) == "ses")
  {
    patient <- createPatient()
    declareTest("Person location test (SES)", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2000-12-31', division = 'MIDDLE ATLANTIC',
                      gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1987)
    expect_location(location_source_value = 'MIDDLE ATLANTIC')
  }
  else if (tolower(Sys.getenv("extendedType")) == "dod")
  {
    patient <- createPatient()
    declareTest("Person location test (DOD)", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2000-12-31', state = 'PA',
                      gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1987)
    expect_location(location_source_value = 'PA')
  }
}