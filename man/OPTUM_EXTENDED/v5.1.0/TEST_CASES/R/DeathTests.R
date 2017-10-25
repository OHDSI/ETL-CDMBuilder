createDeathTests <- function()
{
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient is indicated dead by diag1-diag5 ICD9.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7616", clmid = claim$clmid, diag_position = 1)
  expect_death(person_id = patient$person_id)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has Medical data occurring <=30 days after death event.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7616", clmid = claim$clmid, diag_position = 1)
  
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-31',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-31', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", clmid = claim$clmid, diag_position = 1)
  expect_death(person_id = patient$person_id)


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has Medical data occurring >30 days after death event.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7616", clmid = claim$clmid, diag_position = 1)
  
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-08-02',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-08-02', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", clmid = claim$clmid, diag_position = 1)
  
  expect_no_death(person_id = patient$person_id)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has RX data occurring <=30 days after death event.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7616", clmid = claim$clmid, diag_position = 1)
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '2013-07-31')
  expect_death(person_id = patient$person_id)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has RX data occurring >30 days after death event.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7616", clmid = claim$clmid, diag_position = 1)
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '2013-08-02')
  expect_no_death(person_id = patient$person_id)
  

  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has Lab data occurring <=30 days after death event.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7616", clmid = claim$clmid, diag_position = 1)
  add_lab_results(labclmid = claim$clmid, loinc_cd = '48868-4', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-31')
  expect_death(person_id = patient$person_id)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has Lab data occurring >30 days after death event.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7616", clmid = claim$clmid, diag_position = 1)
  add_lab_results(labclmid = claim$clmid, loinc_cd = '48868-4', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-08-02')
  expect_no_death(person_id = patient$person_id)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has Observation data occurring <=30 days after death event.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7616", clmid = claim$clmid, diag_position = 1)
  
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-31', proc_cd = '64475',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-31', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "V1007", clmid = claim$clmid, diag_position = 1)
  expect_death(person_id = patient$person_id)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has Observation data occurring >30 days after death event.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7616", clmid = claim$clmid, diag_position = 1)
  
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-08-02', proc_cd = '64475',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-08-02', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "V1007", clmid = claim$clmid, diag_position = 1)
  expect_no_death(person_id = patient$person_id)
  
  if (tolower(Sys.getenv("extendedType")) == "dod")
  {
    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient has valid death record", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    expect_death(person_id = patient$person_id, death_date = '2013-07-31')
    
    
    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient has invalid death record after DOB", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2015-04-01', eligend = '2015-05-01',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 2015)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    expect_no_death(person_id = patient$person_id)
    

    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient has Medical data occurring <=30 days after death record.", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-31',
                       pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-31', prov = '111111', provcat = '5678')
    add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", clmid = claim$clmid, diag_position = 1)
    expect_death(person_id = patient$person_id)
    

    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient has Medical data occurring >30 days after death record.", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-08-02',
                       pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-08-02', prov = '111111', provcat = '5678')
    add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", clmid = claim$clmid, diag_position = 1)
    expect_no_death(person_id = patient$person_id)
    
    
    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient has RX data occurring <=30 days after death record.", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '2013-07-31')
    expect_death(person_id = patient$person_id)

    
    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient has RX data occurring >30 days after death record.", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '2013-08-02')
    expect_no_death(person_id = patient$person_id)
    
    
    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient has Lab data occurring <=30 days after death record.", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    add_lab_results(labclmid = claim$clmid, loinc_cd = '48868-4', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-31')
    expect_death(person_id = patient$person_id)

    
    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient has Lab data occurring <=30 days after death record.", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    add_lab_results(labclmid = claim$clmid, loinc_cd = '48868-4', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-31')
    expect_death(person_id = patient$person_id)
    
    
    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient has Lab data occurring >30 days after death record.", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    add_lab_results(labclmid = claim$clmid, loinc_cd = '48868-4', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-08-02')
    expect_no_death(person_id = patient$person_id)
    
    
    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient has Observation data occurring <=30 days after death record", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-31', proc_cd = '64475',
                       pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-31', prov = '111111', provcat = '5678')
    add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "V1007", clmid = claim$clmid, diag_position = 1)
    expect_death(person_id = patient$person_id)
    
    
    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient has Observation data occurring >30 days after death record", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-08-02', proc_cd = '64475',
                       pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-08-02', prov = '111111', provcat = '5678')
    add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "V1007", clmid = claim$clmid, diag_position = 1)
    expect_no_death(person_id = patient$person_id)
    
    
    patient <- createPatient()
    claim <- createClaim()
    declareTest("Patient ICD9 for death and a record in the death table", source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_death(patid = patient$patid, ymdod = '201307', extract_ym = '201606', version = '6.0')
    add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2011-08-02', proc_cd = '64475',
                       pat_planid = patient$patid, patid = patient$patid, fst_dt = '2011-08-02', prov = '111111', provcat = '5678')
    add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7616", clmid = claim$clmid, diag_position = 1)
    expect_death(person_id = patient$person_id, death_date = '2013-07-31')
  }
}
