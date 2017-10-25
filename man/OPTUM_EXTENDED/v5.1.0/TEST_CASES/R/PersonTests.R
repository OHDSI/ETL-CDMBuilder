createPersonTests <- function()
{
  patient <- createPatient()
  declareTest("A person defined with year of birth is 0", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'Y', bus = 'COM', eligeff = '2000-09-01', eligend = '2000-11-30',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'PPO', yrdob = 0)
  expect_no_person(person_id = patient$person_id)

  
  patient <- createPatient()
  declareTest("A person defined with year of birth > 1 year after the earliest coverage start from patient history", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2006-08-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'PPO', yrdob = 2003)
  expect_no_person(person_id = patient$person_id)


  patient <- createPatient()
  declareTest("Person with a Gender source value of M", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2000-07-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1994)
  expect_person(person_id = patient$person_id, gender_concept_id = 8507)


  patient <- createPatient()
  declareTest("Person with a Gender source value of F", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2000-07-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1994)
  expect_person(person_id = patient$person_id, gender_concept_id = 8532)


  patient <- createPatient()
  declareTest("Person with a Gender source value of U", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2000-07-31',
                    gdr_cd = 'U', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1994)
  expect_no_person(person_id = patient$person_id)


  patient <- createPatient()
  declareTest("Person with 2 YOBs that are have a MIN/MAX(YOB) > 2 years apart", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'Y', bus = 'COM', eligeff = '2011-01-01', eligend = '2011-04-30',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'POS', yrdob = 1974)
  add_member_detail(aso = 'Y', bus = 'COM', eligeff = '01/01/2008', eligend = '2010-04-30',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'POS', yrdob = 1989)
  expect_no_person(person_id = patient$person_id)


  patient <- createPatient()
  declareTest("Person who flips gender across different OPs", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'MCR', eligeff = '2010-03-01', eligend = '2012-12-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1943)
  add_member_detail(aso = 'N', bus = 'MCR', eligeff = '2015-01-01', eligend = '2015-02-28',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1943)
  expect_no_person(person_id = patient$person_id)
  
  
  patient <- createPatient()
  declareTest("Month of birth test: Month should be mapped", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'MCR', eligeff = '2010-03-01', eligend = '2012-12-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 2010)
  expect_person(person_id = patient$person_id, month_of_birth = 10)
  
  patient <- createPatient()
  declareTest("Month of birth test: Month should NOT be mapped", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'MCR', eligeff = '2010-03-01', eligend = '2012-12-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 2008)
  expect_person(person_id = patient$person_id, month_of_birth = NULL)
  
  patient <- createPatient()
  declareTest("Day of birth test: Day should be mapped", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'MCR', eligeff = '2010-03-01', eligend = '2012-12-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 2010)
  expect_person(person_id = patient$person_id, day_of_birth = 3)
  
  patient <- createPatient()
  declareTest("Day of birth test: Day should NOT be mapped", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'MCR', eligeff = '2010-03-01', eligend = '2012-12-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 2008)
  expect_person(person_id = patient$person_id, day_of_birth = NULL)

  
  if (tolower(Sys.getenv("extendedType")) == "ses")
  {
    patient <- createPatient()
    declareTest("Person who has Asian race", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2000-12-31',
                      gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1987)
    add_ses(patid = patient$patid, d_race_code = 'A')
    expect_person(person_id = patient$person_id, ethnicity_concept_id = 0, race_concept_id = 8515)


    patient <- createPatient()
    declareTest("Person who has Black race", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2000-12-31',
                      gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1987)
    add_ses(patid = patient$patid, d_race_code = 'B')
    expect_person(person_id = patient$person_id, ethnicity_concept_id = 0, race_concept_id = 8516)


    patient <- createPatient()
    declareTest("Person who has White race", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2000-12-31',
                      gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1987)
    add_ses(patid = patient$patid, d_race_code = 'W')
    expect_person(person_id = patient$person_id, ethnicity_concept_id = 0, race_concept_id = 8527)


    patient <- createPatient()
    declareTest("Person who has Unknown race", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2000-12-31',
                      gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1987)
    add_ses(patid = patient$patid, d_race_code = 'U')
    expect_person(person_id = patient$person_id, ethnicity_concept_id = 0, race_concept_id = 0)


    patient <- createPatient()
    declareTest("Person who has Hispanic ethnicity", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2000-12-31',
                      gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1987)
    add_ses(patid = patient$patid, d_race_code = 'H')
    expect_person(person_id = patient$person_id, ethnicity_concept_id = 38003563, race_concept_id = 0)
  }
}
