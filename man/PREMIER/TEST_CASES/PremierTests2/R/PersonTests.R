createPersonTests <- function ()
{

  patient <- createPatient();
  visit1 <- createVisit();
  visit2 <- createVisit();
  declareTest(description="Only visits before death; keep person", id = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit1$pat_key,
          adm_date   = "2001-01-01",
          disc_date  = "2001-01-01",
          age        = 19);
  add_pat(medrec_key  = patient$medrec_key,
          pat_key     = visit2$pat_key,
          adm_date    = "2005-01-01",
          disc_date   = "2005-01-01",
          disc_status = 20,
          age         = 23);
  expect_person(person_id = patient$person_id);


  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="Year of birth < 1900; drop person", id = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit$pat_key,
          adm_date   = "1997-01-01",
          age        = 100);
  expect_no_person(person_id = patient$person_id);

  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="Year of birth > current year; drop person", id = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit$pat_key,
          adm_date   = "2030-01-01",
          age        = 8);
  expect_no_person(person_id = patient$person_id);


  patient <- createPatient();
  visit1 <- createVisit();
  visit2 <- createVisit();
  declareTest(description="First visit prior to birth year", id = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit1$pat_key,
          adm_date   = "2000-01-01",
          age        = 999);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit1$pat_key,
          adm_date   = "2010-01-01",
          age        = 5);
  expect_no_person(person_id = patient$person_id);


  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="Visits too old, prior to 1999, drop person", id = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit$pat_key,
          adm_date   = "1982-01-01",
          disc_date = "1982-01-01",
          age        = 23);
  expect_no_person(person_id = patient$person_id);


  patient <- createPatient();
  visit1 <- createVisit();
  visit2 <- createVisit();
  declareTest(description="Age changes more than 2 years, drop person", id = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit1$pat_key,
          adm_date   = "2000-01-01",
          disc_date = "2000-01-01",
          age        = 23);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit2$pat_key,
          adm_date   = "2010-01-01",
          disc_date = "2010-01-01",
          age        = 23);
  expect_no_person(person_id = patient$person_id);


  patient <- createPatient();
  visit1 <- createVisit();
  declareTest(description="Unknown Gender, drop person", id = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit1$pat_key,
          adm_date   = "2000-01-01",
          disc_date  = "2000-01-01",
          gender     = 'Z');
  expect_no_person(person_id = patient$person_id);


  patient <- createPatient();
  visit1 <- createVisit();
  visit2 <- createVisit();
  visit3 <- createVisit();
  declareTest(description="Persons first visit, age missing; age calculated from earliest visit with non-missing age",
              id = patient$person_id);
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
  expect_person(person_id     = patient$person_id,
                year_of_birth = 1984);


  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="Test HISPANTIC_IND = Y and RACE = H", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2011-01-01",
          age          = 20,
          hispanic_ind = 'Y',
          race         = 'H');
  expect_person(person_id              = patient$person_id,
                race_concept_id        = 0,
                race_source_value      = 'H',
                ethnicity_concept_id   = 38003563,
                ethnicity_source_value = 'Y');


  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="Test HISPANTIC_IND = Y and RACE = W", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2011-01-01",
          age          = 20,
          hispanic_ind = 'Y',
          race         = 'W');
  expect_person(person_id             = patient$person_id,
                race_concept_id        = 8527,
                race_source_value      = 'W',
                ethnicity_concept_id   = 38003563,
                ethnicity_source_value = 'Y');


  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="Test HISPANTIC_IND = Y and RACE = B", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2011-01-01",
          age          = 20,
          hispanic_ind = 'Y',
          race         = 'B');
  expect_person(person_id = patient$person_id,
                race_concept_id        = 8516,
                race_source_value      = 'B',
                ethnicity_concept_id   = 38003563,
                ethnicity_source_value = 'Y');


  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="Test HISPANTIC_IND = N and RACE = B", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2011-01-01",
          age          = 20,
          hispanic_ind = 'N',
          race         = 'B');
  expect_person(person_id              = patient$person_id,
                race_concept_id        = 8516,
                race_source_value      = 'B',
                ethnicity_concept_id   = 38003564,
                ethnicity_source_value = 'N');


  patient <- createPatient();
  visit1 <- createVisit();
  visit2 <- createVisit();
  visit3 <- createVisit();
  declareTest(description="Test HISPANTIC_IND = N and RACE = B/w/B", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit1$pat_key,
          adm_date     = "2011-01-01",
          disc_date    = "2011-01-01",
          age          = 20,
          hispanic_ind = 'N',
          race         = 'B');
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit2$pat_key,
          adm_date     = "2012-01-01",
          disc_date    = "2012-01-01",
          age          = 20,
          hispanic_ind = 'N',
          race         = 'W');
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit3$pat_key,
          adm_date     = "2013-01-01",
          disc_date    = "2013-01-01",
          age          = 20,
          hispanic_ind = 'N',
          race         = 'B');
  expect_person(person_id = patient$person_id, race_concept_id = 8516,
                race_source_value = 'B',ethnicity_concept_id = 38003564,
                ethnicity_source_value = 'N');


  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="Test HISPANTIC_IND = U and RACE = Z; Bad Values", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2011-01-01",
          age          = 20,
          hispanic_ind = 'U',
          race         = 'Z');
  expect_person(person_id              = patient$person_id,
                race_concept_id        = 0,
                race_source_value      = 'Z',
                ethnicity_concept_id   = 0,
                ethnicity_source_value = 'U');

}
