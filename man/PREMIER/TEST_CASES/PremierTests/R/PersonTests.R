createPersonTests <- function () {

  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="Year of birth < 1900; drop person", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit$pat_key,
          adm_date   = "1997-01-01",
          age        = 100);
  expect_no_person(person_id = patient$person_id);

  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="Year of birth > current year; drop person", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit$pat_key,
          adm_date   = "2030-01-01",
          age        = 8);
  expect_no_person(person_id = patient$person_id);

  patient <- createPatient();
  declareTest(description="Age > 100; drop person", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit$pat_key,
          adm_date   = "2011-01-01",
          age        = 105); #drop people over 100? 110? 115? 150?
  expect_no_person(person_id = patient$person_id);

  patient <- createPatient();
  visit1 <- createVisit();
  visit2 <- createVisit();
  visit3 <- createVisit();
  declareTest(description="Persons first visit, age missing; age calculated from earliest visit with non-missing age",
              source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit1$pat_key,
          adm_date   = "2011-01-01",
          age        = 999);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit2$pat_key,
          adm_date   = "2012-01-01",
          age        = 28);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit3$pat_key,
          adm_date   = "2013-01-01",
          age        = 29);
  expect_person(person_id = patient$person_id,
                year_of_birth = 1983);
}
