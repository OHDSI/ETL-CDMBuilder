createPayerPlanPeriodTests <- function () {

  add_payor(std_payor = 360, std_payor_desc = "MANAGED CARE - NON-CAP");
  add_payor(std_payor = 330, std_payor_desc = "MEDICAID - TRADITIONAL");
  add_payor(std_payor = 300, std_payor_desc = "MEDICARE - TRADITIONAL");
  add_payor(std_payor = 380, std_payor_desc = "COMMERCIAL - INDEMNITY");

  patient <- createPatient()
  declareTest(description = "Creates two payer_plan_period records, one payer", id = patient$person_id);
  visit1 <- createVisit();
  visit2 <- createVisit();
  visit3 <- createVisit();
  visit4 <- createVisit();
  add_pat(medrec_key   = patient$medrec_key, pat_key = visit1$pat_key,
          adm_date     = "2010-10-01", disc_date = "2010-10-01", disc_mon_seq = 1, std_payor = 360);
  add_patbill(pat_key  = visit1$pat_key, serv_day = 4);

  add_pat(medrec_key   = patient$medrec_key, pat_key = visit2$pat_key,
          adm_date     = "2010-10-01", disc_date = "2010-11-01", disc_mon_seq = 1, std_payor = 360);
  add_patbill(pat_key  = visit2$pat_key, serv_day = 10);

  add_pat(medrec_key   = patient$medrec_key, pat_key = visit3$pat_key,
          adm_date     = "2011-05-01", disc_date = "2011-05-01", disc_mon_seq = 1, std_payor = 360);
  add_patbill(pat_key  = visit3$pat_key, serv_day = 8);

  add_pat(medrec_key   = patient$medrec_key, pat_key = visit4$pat_key,
          adm_date     = "2011-05-01", disc_date = "2011-05-01", disc_mon_seq = 2, std_payor = 360);
  add_patbill(pat_key  = visit4$pat_key, serv_day = 3);

  expect_payer_plan_period(person_id                    = patient$person_id,
                           payer_plan_period_start_date = "2010-10-01",
                           payer_plan_period_end_date   = "2010-11-01",
                           payer_source_value           = "MANAGED CARE - NON-CAP");
  expect_payer_plan_period(person_id                    = patient$person_id,
                           payer_plan_period_start_date = "2011-05-01",
                           payer_plan_period_end_date   = "2011-05-11",
                           payer_source_value           = "MANAGED CARE - NON-CAP");


  patient <- createPatient()
  declareTest(description = "Creates two payer_plan_period records, two payers", id = patient$person_id);
  visit1 <- createVisit();
  visit2 <- createVisit();
  visit3 <- createVisit();
  visit4 <- createVisit();
  add_pat(medrec_key   = patient$medrec_key, pat_key = visit1$pat_key,
          adm_date     = "2010-10-01", disc_date = "2010-10-01", disc_mon_seq = 1, std_payor = 360);
  add_patbill(pat_key  = visit1$pat_key, serv_day = 4);
  add_pat(medrec_key   = patient$medrec_key, pat_key = visit2$pat_key,
          adm_date     = "2010-10-01", disc_date = "2010-11-01", disc_mon_seq = 1, std_payor = 360);
  add_patbill(pat_key  = visit2$pat_key, serv_day = 10);
  add_pat(medrec_key   = patient$medrec_key, pat_key = visit3$pat_key,
          adm_date     = "2011-05-01", disc_date = "2011-05-01", disc_mon_seq = 1, std_payor = 330);
  add_patbill(pat_key  = visit3$pat_key, serv_day = 8);
  add_pat(medrec_key   = patient$medrec_key, pat_key = visit4$pat_key,
          adm_date     = "2011-05-01", disc_date = "2011-05-01", disc_mon_seq = 2, std_payor = 330);
  add_patbill(pat_key  = visit4$pat_key, serv_day = 3);
  expect_payer_plan_period(person_id                    = patient$person_id,
                           payer_plan_period_start_date = "2010-10-01",
                           payer_plan_period_end_date   = "2010-11-01",
                           payer_source_value           = "MANAGED CARE - NON-CAP");
  expect_payer_plan_period(person_id                    = patient$person_id,
                           payer_plan_period_start_date = "2011-05-01",
                           payer_plan_period_end_date   = "2011-05-11",
                           payer_source_value           = "MEDICAID - TRADITIONAL");

  patient <- createPatient()
  visit1 <- createVisit()
  visit2 <- createVisit()
  visit3 <- createVisit()
  visit4 <- createVisit()
  visit5 <- createVisit()
  declareTest(description = "Creates bad record with payer_plan_period_end_date < payer_plan_period_start_date", id = patient$person_id);
  add_pat(medrec_key = patient$medrec_key, pat_key = visit1$pat_key, adm_date = "2013-03-01", disc_date = "2013-03-01", std_payor = 360);
  add_pat(medrec_key = patient$medrec_key, pat_key = visit2$pat_key, adm_date = "2013-05-01", disc_date = "2013-05-01", std_payor = 360);
  add_pat(medrec_key = patient$medrec_key, pat_key = visit3$pat_key, adm_date = "2014-01-01", disc_date = "2014-05-01", std_payor = 360);
  add_pat(medrec_key = patient$medrec_key, pat_key = visit4$pat_key, adm_date = "2014-02-01", disc_date = "2014-07-01", std_payor = 330);
  add_pat(medrec_key = patient$medrec_key, pat_key = visit5$pat_key, adm_date = "2014-04-01", disc_date = "2014-04-01", std_payor = 330);
  add_patbill(pat_key = visit1$pat_key, serv_day = 1);
  add_patbill(pat_key = visit2$pat_key, serv_day = 1);
  add_patbill(pat_key = visit3$pat_key, serv_day = 1);
  add_patbill(pat_key = visit3$pat_key, serv_day = 107);
  add_patbill(pat_key = visit4$pat_key, serv_day = 152);
  add_patbill(pat_key = visit5$pat_key, serv_day = 1);
  expect_payer_plan_period(person_id = patient$medrec_key,
                           payer_plan_period_start_date = "2013-03-01",
                           payer_plan_period_end_date = "2013-03-01")
  expect_payer_plan_period(person_id = patient$medrec_key,
                           payer_plan_period_start_date = "2013-05-01",
                           payer_plan_period_end_date = "2013-05-01")
  expect_payer_plan_period(person_id = patient$medrec_key,
                           payer_plan_period_start_date = "2014-01-15",
                           payer_plan_period_end_date = "2014-05-01")
  expect_payer_plan_period(person_id = patient$medrec_key,
                           payer_plan_period_start_date = "2014-05-02",
                           payer_plan_period_end_date = "2014-05-02"); #produces 2014-04-01

  # patient <- createPatient()
  # visit1 <- createVisit()
  # visit2 <- createVisit()
  # visit3 <- createVisit()
  # visit4 <- createVisit()
  # visit5 <- createVisit()
  # declareTest(description = "Creates good records where payer_plan_period_end_date > payer_plan_period_start_date", id = patient$person_id);
  # add_pat(medrec_key = patient$medrec_key, pat_key = visit1$pat_key, adm_date = "2015-04-01", std_payor  = 300);
  # add_pat(medrec_key = patient$medrec_key, pat_key = visit2$pat_key, adm_date = "2015-06-01", std_payor  = 300);
  # add_pat(medrec_key = patient$medrec_key, pat_key = visit3$pat_key, adm_date = "2015-08-01", std_payor  = 300);
  # add_pat(medrec_key = patient$medrec_key, pat_key = visit4$pat_key, adm_date = "2015-09-01", std_payor  = 300);
  # add_pat(medrec_key = patient$medrec_key, pat_key = visit5$pat_key, adm_date = "2015-09-01", std_payor  = 300);
  # add_patbill(pat_key = visit1$pat_key, serv_day = 1)
  # add_patbill(pat_key = visit2$pat_key, serv_day = 1)
  # add_patbill(pat_key = visit3$pat_key, serv_day = 1)
  # add_patbill(pat_key = visit4$pat_key, serv_day = 1)
  # add_patbill(pat_key = visit4$pat_key, serv_day = 8)
  # add_patbill(pat_key = visit4$pat_key, serv_day = 14)
  # add_patbill(pat_key = visit4$pat_key, serv_day = 16)
  # add_patbill(pat_key = visit4$pat_key, serv_day = 21)
  # add_patbill(pat_key = visit4$pat_key, serv_day = 24)
  # add_patbill(pat_key = visit5$pat_key, serv_day = 1)
  # expect_payer_plan_period(person_id = patient$medrec_key, payer_plan_period_start_date = "2015-04-01", payer_plan_period_end_date = "2015-04-01")
  # expect_payer_plan_period(person_id = patient$medrec_key, payer_plan_period_start_date = "2015-06-01", payer_plan_period_end_date = "2015-06-01")
  # expect_payer_plan_period(person_id = patient$medrec_key, payer_plan_period_start_date = "2015-08-01", payer_plan_period_end_date = "2015-09-25")

}



