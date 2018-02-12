#Use this to set pertinent default values for the test cases

  set_defaults_drug_claims(metqty = '0', daysupp = '30')
  set_defaults_inpatient_admissions(admdate = '2012-01-01', disdate = '2012-12-31', year = '2012', proc2 = NULL)
  
  
  if (Sys.getenv("truvenType") == "MDCD")
  {
    set_defaults_enrollment_detail(drugcovg = '1')
  }