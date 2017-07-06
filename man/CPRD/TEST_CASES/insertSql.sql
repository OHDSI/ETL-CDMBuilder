TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo._version;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.additional;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.batchnumbers;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.bnfcodes;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.clinical;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.commondosages;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.consultation;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.daysupply_decodes;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.daysupply_modes;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.entity;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_acp;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_ccare;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_diagnosis_epi;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_diagnosis_hosp;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_episodes;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_fielddefinitions;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_fieldmappings;
DROP TABLE CDM_CPRD_TESTING_RAW.dbo.hes_fielddefinitions;
DROP TABLE CDM_CPRD_TESTING_RAW.dbo.hes_fieldmappings;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_hospital;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_hrg;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_linkage_coverage;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_linked_practices;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_maternity;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_patient;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_primary_diag_hosp;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.hes_procedures_epi;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.immunisation;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.lookup;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.lookuptype;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.medical;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.packtype;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.patient;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.practice;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.product;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.referral;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.scoringmethod;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.staff;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.test;
TRUNCATE TABLE CDM_CPRD_TESTING_RAW.dbo.therapy;

-- 1. Care Site
--
-- 1.0 Practice_id=301, region=13 [Test ID: 1]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.practice (pracid, region, lcd, uts) VALUES ('311', '13', '2016-12-31', '2000-01-01');

-- 2. Condition Era
--
-- 2.0 Patient has Medical records that collapse in the Condition Era table [Test ID: 2]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('1111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('1111', '2012-01-01', '3', '1058', '1001', '0', '4', '2', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('1111', '2012-01-02', '3', '1058', '1001', '0', '4', '2', '0');

-- 3. Condition Occurrence
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('1058', 'F563500');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('898', 'K17y000');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('100895', 'N22y700');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('45999', 'J040.14');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('11531', 'P00..00');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('35968', 'PB2z.00');
--
-- 3.0 Read clinical condition with visit [Test ID: 3]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('2111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('2111', '2012-01-01', '3', '1058', '1001', '0', '4', '2', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('2111', '2012-01-01', '2007-01-15', '9', '9001', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, admimeth, admisorc, disdest, dismeth, duration) VALUES ('2111', '5', '2012-01-01', '21', '19', '19', '1', '1');
--
-- 3.1 Read clinical condition with visit [Test ID: 4]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('3111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('3111', '2012-03-01', '3', '898', '1001', '0', '4', '2', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('3111', '2012-01-01', '2007-01-15', '9', '9001', '0');
--
-- 3.2 Read clinical condition outside observation period [Test ID: 5]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('4111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('4111', '2009-03-01', '3', '100895', '1001', '0', '4', '2', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('4111', '2012-01-01', '2007-01-15', '9', '9001', '0');
--
-- 3.3 Read immunisation condition with no visit [Test ID: 6]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('5111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('5111', '2011-03-01', '3', '45999', '1001', '0', '4', '2', '0');
--
-- 3.4 Read referral condition  with no visit [Test ID: 7]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('6111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.referral (patid, eventdate, sysdate, constype, medcode, staffid, textid, source, nhsspec, fhsaspec, inpatient, attendance, urgency) VALUES ('6111', '2011-03-01', '2002-08-02', '4', '11531', '1001', '0', '1', '0', '0', '3', '0', '0');
--
-- 3.5 Read test condition  with no visit [Test ID: 8]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('7111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data3, data4, data7) VALUES ('7111', '2011-03-01', '2013-07-26', '2', '35968', '1001', '0', '165', '3', '96.000', '0.000', '0');
--
-- 3.6 ICD10 codes from HES_primary_diag_hosp, entire hosp within HES obs period [Test ID: 9]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('8111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_primary_diag_hosp (patid, spno, admidate, discharged, icd) VALUES ('8111', '10', '2012-01-01', '2012-03-01', 'S42.3');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('8111', '10', '2012-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('8111', '111', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 3.7 ICD10 condition from HES_primary_diag_hosp,part of hosp outside HES obs period [Test ID: 10]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('9111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_primary_diag_hosp (patid, spno, admidate, discharged, icd) VALUES ('9111', '11', '2012-12-31', '2012-03-01', 'S42.3');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('9111', '11', '2012-12-31', '2013-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('9111', '111', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 3.8 inside HES obs period from HES_diagnosis_epi [Test ID: 11]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('10111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('10111', '11', '2012-01-01', '2013-01-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('10111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_diagnosis_epi (patid, spno, epikey, epistart, epiend, icd, d_order) VALUES ('10111', '11', '2517497', '2012-01-31', '2012-01-31', 'H26.9', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, spno, epikey, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('10111', '11', '2517497', '2009-01-05', '2012-01-31', '2012-01-31', '1', '1', '1', '21', '19', '19', '1', '300', '250', 'T88888');
--
-- 3.9 outside HES diagnosis period HES_diagnosis_epi [Test ID: 12]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('11111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('11111', '11', '2012-12-31', '2013-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('11111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_diagnosis_epi (patid, spno, epikey, epistart, epiend, icd, d_order) VALUES ('11111', '11', '2517498', '2013-01-31', '2013-01-31', 'H26.9', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, spno, epikey, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('11111', '11', '2517498', '2009-01-05', '2013-01-31', '2013-01-31', '1', '1', '1', '21', '19', '19', '1', '300', '250', 'T88888');

-- 4. Death
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.practice (pracid, region, lcd, uts) VALUES ('888', '1', '2014-01-01', '2009-01-01');
--
-- 4.0 valid deathdate [Test ID: 13]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, deathdate, accept, pracid) VALUES ('12888', '0', '1', '169', '1', '2', '0', '0', '0', '2009-01-01', '0', '0', '0', '0', '2010-01-01', '1', '888');
--
-- 4.1 invalid: no deathdate [Test ID: 14]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('13888', '0', '1', '169', '1', '2', '0', '0', '0', '2009-01-01', '0', '0', '0', '0', '1', '888');

-- 5. Drug Era
--
-- 5.0 drug era with 2 drug records [Test ID: 15]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('14111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('14111', '2012-01-01', '2014-02-09', '2', '9001', '1', '55', '1', '2', '20', '0', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('14111', '2012-01-01', '2007-01-15', '9', '9001', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('14111', '2012-01-20', '2014-02-09', '2', '9001', '1', '55', '1', '2', '30', '0', '1', '1');
--
-- 5.1 drug era with multilex drug code  [Test ID: 16]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.product (prodcode, gemscriptcode, productname, bnf, bnf_with_dots, bnfchapter) VALUES ('2232', '48541020', 'Camcolit 250 tablets (Essential Pharma Ltd)', '00000000', '00.00.00.00', 'Unknown');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('15111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('15111', '2012-01-31', '2014-02-09', '2232', '9001', '1', '55', '1', '2', '30', '0', '1', '1');

-- 6. Drug Exposure
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.product (prodcode, gemscriptcode, bnf, bnf_with_dots, bnfchapter) VALUES ('2', '58976020', '00000000', '00.00.00.00', 'Unknown');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.product (prodcode, gemscriptcode, bnf, bnf_with_dots, bnfchapter) VALUES ('9999', '89535020', '00000000', '00.00.00.00', 'Unknown');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.product (prodcode, gemscriptcode, bnf, bnf_with_dots, bnfchapter) VALUES ('46190', '99978020', '00000000', '00.00.00.00', 'Unknown');
--
-- 6.0 testing the lookup for numdays does correct end date start+28 days [Test ID: 17]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.daysupply_decodes (prodcode, ndd, qty, numpacks, numdays) VALUES ('2', '2', '1', '0', '29');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('16111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('16111', '2012-01-01', '2014-02-09', '2', '9001', '1', '55', '1', '2', '0', '0', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('16111', '2012-01-01', '2007-01-15', '9', '9001', '0');
--
-- 6.1 testing when there is no lookup available default to start dte [Test ID: 18]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('17111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('17111', '2012-01-01', '2014-02-09', '2', '9001', '1', '55', '1', '81', '0', '0', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('17111', '2012-01-01', '2007-01-15', '9', '9001', '0');
--
-- 6.2 The drug records comes in without a valid days supply, no lookup in DAYSSUPPLY_DECODES, no lookups in DAYSSUPPLY_MODES, assume 1 day duration. [Test ID: 19]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('18111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('18111', '2012-01-01', '2014-02-09', '9999', '9001', '1', '55', '1', '81', '0', '0', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('18111', '2012-01-01', '2007-01-15', '9', '9001', '0');
--
-- 6.3 testing end date: You have a THERAPY.NUMDAYS = 40. [Test ID: 20]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('19111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('19111', '2012-01-01', '2014-02-09', '2', '9001', '1', '55', '1', '2', '40', '0', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('19111', '2012-01-01', '2007-01-15', '9', '9001', '0');
--
-- 6.4 testing end date: You have a THERAPY.NUMDAYS = 366 - show correct to 29 days using lookup. [Test ID: 21]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('20111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('20111', '2012-01-01', '2014-02-09', '2', '9001', '1', '55', '1', '2', '366', '0', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('20111', '2012-01-01', '2007-01-15', '9', '9001', '0');
--
-- 6.5 Test visit_occurrence_id: Drug is written to DRUG_EXPOSURE and the VISIT_OCCURRENCE_ID = patient$patid * 10000000000 + (2012*10000) +  (3* 100) + 12 = 91050020120312  [Test ID: 22]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('21111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('21111', '2012-03-12', '2014-02-09', '2', '9001', '1', '55', '1', '2', '366', '0', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('21111', '2012-03-12', '2007-01-15', '9', '9001', '0');
--
-- 6.6 Drug date exists in an invalid visit_occurrence (outside practice dates) [Test ID: 23]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('22111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('22111', '2016-01-01', '2014-02-09', '2', '9001', '1', '55', '1', '2', '366', '0', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('22111', '2016-01-01', '2007-01-15', '9', '9001', '0');
--
-- 6.7 Drug date does exist within a valid observation period but does not have a consultation date. [Test ID: 24]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('23111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('23111', '2012-01-01', '2014-02-09', '2', '9001', '1', '55', '1', '2', '366', '0', '1', '1');
--
-- 6.8 PRODCODE = -1 - invalid. [Test ID: 25]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('24111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('24111', '2012-01-01', '2014-02-09', '-1', '9001', '1', '55', '1', '2', '366', '0', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('24111', '2012-01-01', '2007-01-15', '9', '9001', '0');
--
-- 6.9 You have a valid PRODCODE but doesnt get an VOCAB mapping.PRODCODE = 46190. [Test ID: 26]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('25111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.therapy (patid, eventdate, sysdate, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) VALUES ('25111', '2012-01-01', '2014-02-09', '46190', '9001', '1', '55', '1', '2', '366', '0', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('25111', '2012-01-01', '2007-01-15', '9', '9001', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('72', '65F5.00');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('28', '6564.00');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('58', '65B..00');
--
-- 6.10 Invalid status [Test ID: 27]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('26111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.immunisation (patid, eventdate, sysdate, constype, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) VALUES ('26111', '2012-01-01', '2014-07-09', '4', '72', '1001', '0', '1', '2', '4', '0', '1', '3', '1', '0');
--
-- 6.11 valid immunization with visit [Test ID: 28]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('27111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.immunisation (patid, eventdate, sysdate, constype, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) VALUES ('27111', '2012-01-01', '2014-07-09', '4', '72', '1001', '0', '1', '2', '1', '0', '1', '3', '1', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('27111', '2012-01-01', '2007-01-15', '9', '9001', '0');
--
-- 6.12 valid immunization without visit - null visit_occur_id [Test ID: 29]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('28111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.immunisation (patid, eventdate, sysdate, constype, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) VALUES ('28111', '2012-01-01', '2014-07-09', '4', '28', '1001', '0', '1', '2', '1', '0', '1', '3', '1', '0');
--
-- 6.13 Read  outside observation period [Test ID: 30]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('29111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('29111', '2009-03-01', '3', '58', '1001', '0', '4', '2', '0');
--
-- 6.14 immunization read code condition goes into conditions [Test ID: 31]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('30111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.immunisation (patid, eventdate, sysdate, constype, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) VALUES ('30111', '2009-03-01', '2014-07-09', '4', '1058', '1001', '0', '1', '2', '1', '0', '1', '3', '1', '0');
--
-- 6.15 valid read from clinical [Test ID: 32]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('31111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('31111', '2010-03-01', '3', '58', '1001', '0', '4', '2', '0');
--
-- 6.16 valid read from referral [Test ID: 33]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('32111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.referral (patid, eventdate, sysdate, constype, medcode, staffid, textid, source, nhsspec, fhsaspec, inpatient, attendance, urgency) VALUES ('32111', '2010-03-01', '2002-08-02', '4', '58', '1001', '0', '1', '0', '0', '3', '0', '0');
--
-- 6.17 valid read from test [Test ID: 34]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('33111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data3, data4, data7) VALUES ('33111', '2010-03-01', '2013-07-26', '2', '58', '1001', '0', '165', '3', '96.000', '0.000', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('25159', '65B..00');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('25169', '9b20.00');
--
-- 6.18 valid entry for device exposure [Test ID: 35]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('34111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.immunisation (patid, eventdate, sysdate, constype, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) VALUES ('34111', '2012-01-01', '2014-07-09', '4', '25169', '1001', '0', '1', '2', '1', '0', '1', '3', '1', '0');
--
-- 6.19 valid entry [Test ID: 36]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('35111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('35111', '2010-03-01', '3', '25159', '1001', '0', '4', '2', '0');
--
-- 6.20 valid entry [Test ID: 37]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('36111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('36111', '2010-03-01', '3', '25159', '1001', '0', '4', '2', '0');
--
-- 6.21 valid entry [Test ID: 38]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('37111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data3, data4, data7) VALUES ('37111', '2010-03-01', '2013-07-26', '2', '25159', '1001', '0', '165', '3', '96.000', '0.000', '0');

-- 7. Measurement
--
-- 7.0 Patient has famnum [Test ID: 39]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, famnum, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('38111', '0', '1', '199', '1', '1764', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
--
-- 7.1 Patient has famnum [Test ID: 40]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('39111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
--
-- 7.2 Patient has NULL marital [Test ID: 41]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('40111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
--
-- 7.3 Patient has marital=2 [Test ID: 42]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, marital, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('41111', '0', '1', '199', '1', '2', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
--
-- 7.4 Patient has marital=7 [Test ID: 43]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, marital, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('42111', '0', '1', '199', '1', '7', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
--
-- 7.5 1) Patient has famnum and marital=5 [Test ID: 44]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, marital, famnum, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('43111', '0', '1', '199', '1', '5', '1802', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
--
-- 7.6 2) Patient has famnum and marital=5 [Test ID: 45]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('445', '8I3F.00');
--
-- 7.7 clinical procedure with visit [Test ID: 46]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('44111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('44111', '2012-01-01', '3', '445', '1001', '0', '4', '2', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('44111', '2012-01-01', '2007-01-15', '9', '9001', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, admimeth, admisorc, disdest, dismeth, duration) VALUES ('44111', '5', '2012-01-01', '21', '19', '19', '1', '1');
--
-- 7.8 testing without hes to give visit_occurrence_id is null - clinical procedure without visit [Test ID: 47]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('45111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('45111', '2012-01-01', '3', '445', '1001', '0', '4', '2', '0');
--
-- 7.9 Now test gold observation outside patient observation to exclude [Test ID: 48]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('46111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('46111', '2009-01-01', '3', '445', '1001', '0', '4', '2', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('46111', '2009-01-01', '2007-01-15', '9', '9001', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, admimeth, admisorc, disdest, dismeth, duration) VALUES ('46111', '5', '2009-01-01', '21', '19', '19', '1', '1');
--
-- 7.10 immunisation proceduret [Test ID: 49]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('47111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.immunisation (patid, eventdate, sysdate, constype, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) VALUES ('47111', '2011-03-01', '2014-07-09', '4', '445', '1001', '0', '1', '2', '1', '0', '1', '3', '1', '0');
--
-- 7.11 referral procedure [Test ID: 50]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('48111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.referral (patid, eventdate, sysdate, constype, medcode, staffid, textid, source, nhsspec, fhsaspec, inpatient, attendance, urgency) VALUES ('48111', '2011-03-01', '2002-08-02', '4', '445', '1001', '0', '1', '0', '0', '3', '0', '0');
--
-- 7.12 test procedure [Test ID: 51]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('49111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data3, data4, data7) VALUES ('49111', '2011-03-01', '2013-07-26', '2', '445', '1001', '0', '165', '3', '96.000', '0.000', '0');
--
-- 7.13 ICD10 codes from HES_primary_diag_hosp, entire hosp within HES obs period [Test ID: 52]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('50111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_primary_diag_hosp (patid, spno, admidate, discharged, icd) VALUES ('50111', '10', '2012-01-01', '2012-03-01', 'Z01.7');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('50111', '10', '2012-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('50111', '111', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 7.14 ICD10 codes from HES_primary_diag_hosp, entire hosp not within HES obs period [Test ID: 53]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('51111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_primary_diag_hosp (patid, spno, admidate, discharged, icd) VALUES ('51111', '11', '2012-12-31', '2013-03-01', 'B22.2');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('51111', '11', '2012-12-31', '2013-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('51111', '111', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 7.15 ICD10 codes from HES_primary_diag_hosp, entire hosp not within HES obs period [Test ID: 54]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('52111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_diagnosis_epi (patid, spno, epikey, epistart, epiend, icd, d_order) VALUES ('52111', '11', '2517497', '2012-01-01', '2012-03-01', 'Z01.7', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('52111', '11', '2012-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('52111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, spno, epikey, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('52111', '11', '2517497', '2009-01-05', '2012-01-01', '2012-03-01', '1', '1', '1', '21', '19', '19', '1', '300', '250', 'T88888');
--
-- 7.16 invalid - outside HES diagnosis period HES_diagnosis_epi [Test ID: 55]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('53111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_diagnosis_epi (patid, spno, epikey, epistart, epiend, icd, d_order) VALUES ('53111', '11', '2517497', '2012-12-31', '2013-03-01', 'H26.9', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('53111', '11', '2012-12-31', '2013-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('53111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, spno, epikey, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('53111', '11', '2517498', '2009-01-05', '2012-12-31', '2013-03-01', '1', '1', '1', '21', '19', '19', '1', '300', '250', 'T88888');
--
-- 7.17 invalid --HES ICD10 condition not mapped [Test ID: 56]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('54111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_diagnosis_epi (patid, spno, epikey, epistart, epiend, icd, d_order) VALUES ('54111', '11', '2517497', '2012-01-01', '2012-03-01', 'A04.3', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('54111', '11', '2012-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('54111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, spno, epikey, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('54111', '11', '2517497', '2009-01-05', '2012-01-01', '2012-03-01', '1', '1', '1', '21', '19', '19', '1', '300', '250', 'T88888');
--
-- 7.18 test observation record 4 fields [Test ID: 57]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('55111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1) VALUES ('55111', '2012-01-01', '2013-07-26', '2', '98196', '1001', '0', '209', '9');
--
-- 7.19 test observation record 7 fields [Test ID: 58]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('56111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data2, data3, data4, data5, data6, data7) VALUES ('56111', '2012-01-01', '2013-07-26', '2', '98196', '1001', '0', '190', '3', '3.7', '1', '8', '3.4', '5.1', '0');
--
-- 7.20 test observation record enttype=284 [Test ID: 59]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('57111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data2, data3, data4, data7, data8_date) VALUES ('57111', '2012-01-01', '2013-07-26', '2', '98196', '1001', '0', '284', '3', '14', '61', '0', '0', '1998-12-17');
--
-- 7.21 test observation record enttype=284 [Test ID: 60]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('58111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data7) VALUES ('58111', '2012-01-01', '2013-07-26', '2', '98196', '1001', '0', '311', '1');
--
-- 7.22 test observation record enttype=154 [Test ID: 61]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('59111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data7, data8_value) VALUES ('59111', '2012-01-01', '2013-07-26', '2', '98196', '1001', '0', '154', '0', '24');
--
-- 7.23 1) additional observation [Test ID: 62]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('60111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.additional (patid, enttype, adid, data1_value, data2_value, data3_value, data5_value) VALUES ('60111', '1', '35', '80', '160', '5', '3');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, staffid, textid, episode, enttype, adid) VALUES ('60111', '2010-01-01', '3', '0', '0', '4', '2', '35');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('60111', '2010-01-01', '2007-01-15', '9', '1001', '0');
--
-- 7.24 2) additional observation [Test ID: 63]
--
--
-- 7.25 scores mapped [Test ID: 64]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('61111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.additional (patid, enttype, adid, data1_value, data2_value, data3_value) VALUES ('61111', '372', '45', '500', '7913', '1373');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, staffid, textid, episode, enttype, adid) VALUES ('61111', '2010-01-01', '3', '0', '0', '4', '2', '45');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('61111', '2010-01-01', '2007-01-15', '9', '1001', '0');
--
-- 7.26 additional observation 114-2 [Test ID: 65]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('62111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.additional (patid, enttype, adid, data1_value, data1_date, data2_value, data3_value) VALUES ('62111', '114', '35', '1.000', '2003-12-07', '3', '1373');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, staffid, textid, episode, enttype, adid) VALUES ('62111', '2010-01-01', '3', '0', '0', '4', '2', '35');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('62111', '2010-01-01', '2007-01-15', '9', '1001', '0');
--
-- 7.27 additional observation 60-1 with SUM [Test ID: 66]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('63111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.additional (patid, enttype, adid, data1_value, data2_value, data3_value) VALUES ('63111', '60', '35', '8', '147', '1373');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, staffid, textid, episode, enttype, adid) VALUES ('63111', '2010-01-01', '3', '0', '0', '4', '2', '35');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('63111', '2010-01-01', '2007-01-15', '9', '1001', '0');

-- 8. Observation Period
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.practice (pracid, region, lcd, uts) VALUES ('222', '5', '2011-11-11', '2001-02-12');
--
-- 8.0 201222: obs_period start should be uts and obs_period_end should be tod. [Test ID: 67]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, tod, toreason, accept, pracid) VALUES ('64222', '0', '1', '169', '0', '2', '0', '0', '0', '2000-10-26', '0', '0', '0', '2010-01-01', '0', '1', '222');
--
-- 8.1 202222: obs_period start should be crd and obs_period_end should be deathdate. [Test ID: 68]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, deathdate, accept, pracid) VALUES ('65222', '0', '1', '169', '0', '2', '0', '0', '0', '2005-10-26', '0', '0', '0', '0', '2010-12-31', '1', '222');
--
-- 8.2 203222: patient deleted tod<uts. [Test ID: 69]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, tod, toreason, accept, pracid) VALUES ('66222', '0', '1', '169', '0', '2', '0', '0', '0', '2000-10-26', '0', '0', '0', '1997-01-01', '0', '1', '222');

-- 9. Observation
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('98196', '65PT.11');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('35209', 'Q116.00');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('1137', 'R100.00');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('70038', 'Z5A6200');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('14612', '657E.00');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code, description) VALUES ('1942', 'M240012', 'Hair loss');
--
-- 9.0  clinical procedure with visit [Test ID: 70]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('67111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('67111', '2012-01-01', '3', '98196', '1001', '0', '4', '2', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('67111', '2012-01-01', '2007-01-15', '9', '9001', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, admimeth, admisorc, disdest, dismeth, duration) VALUES ('67111', '5', '2012-01-01', '21', '19', '19', '1', '1');
--
-- 9.1  clinical procedure without visit [Test ID: 71]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('68111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('68111', '2012-03-01', '3', '98196', '1001', '0', '4', '2', '0');
--
-- 9.2  clinical procedure outside observation period [Test ID: 72]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('69111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('69111', '2009-03-01', '3', '1137', '1001', '0', '4', '2', '0');
--
-- 9.3 immunisation procedure [Test ID: 73]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('70111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.immunisation (patid, eventdate, sysdate, constype, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) VALUES ('70111', '2011-03-01', '2014-07-09', '4', '1137', '1001', '0', '1', '2', '1', '0', '1', '3', '1', '0');
--
-- 9.4 referral procedure [Test ID: 74]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('71111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.referral (patid, eventdate, sysdate, constype, medcode, staffid, textid, source, nhsspec, fhsaspec, inpatient, attendance, urgency) VALUES ('71111', '2011-03-01', '2002-08-02', '4', '1137', '1001', '0', '1', '0', '0', '3', '0', '0');
--
-- 9.5 test procedure [Test ID: 75]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('72111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data3, data4, data7) VALUES ('72111', '2011-03-01', '2013-07-26', '2', '1137', '1001', '0', '165', '3', '96.000', '0.000', '0');
--
-- 9.6 observation not mapped [Test ID: 76]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('73111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data3, data4, data7) VALUES ('73111', '2011-03-01', '2013-07-26', '2', '70038', '1001', '0', '165', '3', '96.000', '0.000', '0');
--
-- 9.7 Read clinical medical history condition [Test ID: 77]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('74111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('74111', '2005-01-01', '3', '1058', '1001', '0', '4', '2', '0');
--
-- 9.8 Read referral medical history procedure [Test ID: 78]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('75111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.referral (patid, eventdate, sysdate, constype, medcode, staffid, textid, source, nhsspec, fhsaspec, inpatient, attendance, urgency) VALUES ('75111', '2005-01-01', '2002-08-02', '4', '69651', '1001', '0', '1', '0', '0', '3', '0', '0');
--
-- 9.9 Read test medical history procedure [Test ID: 79]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('76111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data3, data4, data7) VALUES ('76111', '2005-01-01', '2013-07-26', '2', '1137', '1001', '0', '165', '3', '96.000', '0.000', '0');
--
-- 9.10 Read immunisation medical history drug [Test ID: 80]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('77111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.immunisation (patid, eventdate, sysdate, constype, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) VALUES ('77111', '2005-01-01', '2014-07-09', '4', '14612', '1001', '0', '1', '2', '1', '0', '1', '3', '1', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('10584', '13JW.00');
--
-- 9.11 Read clinical non-medical history condition on observation_period_start_date [Test ID: 81]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('78111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('78111', '2010-01-01', '3', '10584', '1001', '0', '4', '2', '0');
--
-- 9.12 Read clinical medical history condition non-mapped [Test ID: 82]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('79111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('79111', '2005-01-01', '3', '70038', '1001', '0', '4', '2', '0');
--
-- 9.13 Read referral medical history condition non-mapped [Test ID: 83]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('80111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.referral (patid, eventdate, sysdate, constype, medcode, staffid, textid, source, nhsspec, fhsaspec, inpatient, attendance, urgency) VALUES ('80111', '2005-01-01', '2002-08-02', '4', '70038', '1001', '0', '1', '0', '0', '3', '0', '0');
--
-- 9.14 Read test medical history condition non-mapped [Test ID: 84]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('81111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data3, data4, data7) VALUES ('81111', '2005-01-01', '2013-07-26', '2', '70038', '1001', '0', '165', '3', '96.000', '0.000', '0');
--
-- 9.15 Read immunisatoin medical history condition non-mapped [Test ID: 85]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('82111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.immunisation (patid, eventdate, sysdate, constype, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) VALUES ('82111', '2005-01-01', '2014-07-09', '4', '70038', '1001', '0', '1', '2', '1', '0', '1', '3', '1', '0');
--
-- 9.16 1) HES acp record [Test ID: 86]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('83111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('83111', '10', '2012-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('83111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_acp (patid, spno, epikey, epistart, epiend, eorder, epidur, numacp, acpn, acpstar, acpdur, depdays, acploc, acpsour, acpdisp, acpout, acpplan, acpspef, orgsup, acpdqind) VALUES ('83111', '10', '39200477', '2001-02-05', '2000-06-06', '1', '1', '1', '1', '2012-01-01', '2', '2', '1', '5', '4', '1', '2', '190', '0', ' ');
--
-- 9.17 2) HES acp record [Test ID: 87]
--
--
-- 9.18 3) HES acp record [Test ID: 88]
--
--
-- 9.19 5) HES acp record [Test ID: 89]
--
--
-- 9.20 6) HES acp record [Test ID: 90]
--
--
-- 9.21 8) HES acp record [Test ID: 91]
--
--
-- 9.22 9) HES acp record [Test ID: 92]
--
--
-- 9.23 10) HES acp record [Test ID: 93]
--
--
-- 9.24 1) HES hospital record [Test ID: 94]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('84111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration, elecdate, elecdur) VALUES ('84111', '10', '2012-01-01', '2012-03-01', '11', '19', '19', '1', '1', '2011-01-01', '68');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('84111', '111', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 9.25 2) HES hospital record [Test ID: 95]
--
--
-- 9.26 3) HES hospital record [Test ID: 96]
--
--
-- 9.27 4) HES hospital record [Test ID: 97]
--
--
-- 9.28 1) HES maternity record [Test ID: 98]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('85111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_maternity (patid, spno, epikey, epistart, epiend, eorder, epidur, numbaby, matordr, neocare, wellbaby, anasdate, birordr, birstat, biresus, sexbaby, birweit, delmeth, delonset, delinten, delchang, delprean, delposan, numpreg, matage, antedur) VALUES ('85111', '10', '5555', '2012-01-01', '2012-01-03', '1', '1', '1', '1', '8', 'N', '2012-01-01', '1', '1', '1', ' ', '3660', ' ', '1', '9', '6', '9', '9', '99', '0', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration, elecdate, elecdur) VALUES ('85111', '10', '2012-01-01', '2012-03-01', '11', '19', '19', '1', '1', '2011-01-01', '68');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('85111', '111', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 9.29 2) HES maternity record [Test ID: 99]
--
--
-- 9.30 ICD10 codes from HES_primary_diag_hosp [Test ID: 100]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('86111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_primary_diag_hosp (patid, spno, admidate, discharged, icd) VALUES ('86111', '10', '2012-01-01', '2012-03-01', 'V38.7');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('86111', '10', '2012-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('86111', '111', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 9.31 inside HES obs period from HES_diagnosis_epi [Test ID: 101]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('87111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('87111', '11', '2012-12-31', '2013-01-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('87111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_diagnosis_epi (patid, spno, epikey, epistart, epiend, icd, d_order) VALUES ('87111', '11', '2517497', '2012-01-31', '2012-01-31', 'R71', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, spno, epikey, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('87111', '11', '2517497', '2009-01-05', '2012-01-31', '2012-01-31', '1', '1', '1', '21', '19', '19', '1', '300', '250', 'T88888');
--
-- 9.32 ICD10 not mapped primary diag [Test ID: 102]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('88111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('88111', '10', '2012-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('88111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_primary_diag_hosp (patid, spno, admidate, discharged, icd) VALUES ('88111', '10', '2012-01-01', '2012-03-01', 'W12.5');
--
-- 9.33 ICD10 not mapped diag epi [Test ID: 103]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('89111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('89111', '11', '2012-12-31', '2013-01-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('89111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_diagnosis_epi (patid, spno, epikey, epistart, epiend, icd, d_order) VALUES ('89111', '11', '2517497', '2012-01-31', '2012-01-31', 'X86.5', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, spno, epikey, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('89111', '11', '2517497', '2009-01-05', '2012-01-31', '2012-01-31', '1', '1', '1', '21', '19', '19', '1', '300', '250', 'T88888');
--
-- 9.34 test observation record 4 fields [Test ID: 104]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('90111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data2, data3, data4, data7) VALUES ('90111', '2012-01-01', '2013-07-26', '2', '98196', '1001', '0', '215', '9', '28.8', '114', '0', '0');
--
-- 9.35 test observation record 4 fields [Test ID: 105]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('91111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data2, data3, data4, data5, data6, data7) VALUES ('91111', '2012-01-01', '2013-07-26', '2', '98196', '1001', '0', '288', '3', '3.7', '1', '8', '3.4', '5.1', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.product (prodcode, gemscriptcode, productname, bnf, bnf_with_dots, bnfchapter) VALUES ('42', '72487020', 'Simvastatin 10mg tablets', '00000000', '00.00.00.00', 'Unknown');
--
-- 9.36 1) additional observation  [Test ID: 106]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('92111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.additional (patid, enttype, adid, data1_value, data2_value, data3_value, data4_value, data5_value) VALUES ('92111', '21', '35', '42', '2', '3', '3', '1942');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, staffid, textid, episode, enttype, adid) VALUES ('92111', '2010-01-01', '3', '0', '0', '4', '2', '35');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('92111', '2010-01-01', '2007-01-15', '9', '1001', '0');
--
-- 9.37 2) additional observation  [Test ID: 107]
--
--
-- 9.38 3) additional observation  [Test ID: 108]
--
--
-- 9.39 1) dates  [Test ID: 109]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('93111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.additional (patid, enttype, adid, data1_value, data1_date, data2_value, data3_date, data4_date) VALUES ('93111', '461', '42', '1.000', '2007-07-08', '0.000', '2007-01-08', '2007-07-09');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, staffid, textid, episode, enttype, adid) VALUES ('93111', '2010-01-01', '3', '0', '0', '4', '2', '42');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('93111', '2010-01-01', '2007-01-15', '9', '1001', '0');
--
-- 9.40 2) dates [Test ID: 110]
--
--
-- 9.41 scores with 0 mapping [Test ID: 111]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('94111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.additional (patid, enttype, adid, data1_value, data2_value, data3_value, data4_value) VALUES ('94111', '372', '45', '15', '100977', '2', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, staffid, textid, episode, enttype, adid) VALUES ('94111', '2010-01-01', '3', '0', '0', '4', '2', '45');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('94111', '2010-01-01', '2007-01-15', '9', '1001', '0');
--
-- 9.42 scores mapped [Test ID: 112]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('95111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.additional (patid, enttype, adid, data1_value, data2_value, data3_value) VALUES ('95111', '372', '45', '500', '10302', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, staffid, textid, episode, enttype, adid) VALUES ('95111', '2010-01-01', '3', '0', '0', '4', '2', '45');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('95111', '2010-01-01', '2007-01-15', '9', '1001', '0');

-- 10. Person
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.practice (pracid, region, lcd, uts) VALUES ('111', '5', '2013-01-01', '2010-01-01');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.practice (pracid, region, lcd, uts) VALUES ('112', '5', '2014-01-01', '2008-01-01');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.practice (pracid, region, lcd, uts) VALUES ('113', '5', '2012-12-01', '2013-01-01');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.practice (pracid, region, lcd, uts) VALUES ('114', '5', '2012-12-01', '2001-01-01');
--
-- 10.0 accept is 0 so should be deleted [Test ID: 113]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('96111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '0', '111');
--
-- 10.1 valid [Test ID: 114]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('97111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
--
-- 10.2 invalid: delete because crd 2013-01-01 > deathdate 2012-01-01 [Test ID: 115]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, deathdate, accept, pracid) VALUES ('98112', '0', '1', '199', '1', '2', '0', '0', '0', '2013-01-01', '0', '0', '0', '0', '2012-01-01', '1', '112');
--
-- 10.3 invalid: delete because crd 2013-01-01 > todate 2011-05-03 [Test ID: 116]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, tod, toreason, accept, pracid) VALUES ('99112', '0', '1', '199', '1', '2', '0', '0', '0', '2013-01-01', '0', '0', '0', '2011-05-03', '0', '1', '112');
--
-- 10.4 invalid: delete because uts 2013-01-01 < lcd 2012-12-01 [Test ID: 117]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, deathdate, accept, pracid) VALUES ('100113', '0', '1', '199', '1', '2', '0', '0', '0', '2008-01-01', '0', '0', '0', '0', '2014-01-01', '1', '113');
--
-- 10.5 valid but mob =0 then MONTH_OF_BIRTH=NULL [Test ID: 118]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, deathdate, accept, pracid) VALUES ('101111', '0', '1', '199', '0', '2', '0', '0', '0', '2008-01-01', '0', '0', '0', '0', '2014-01-01', '1', '111');
--
-- 10.6 invalid year of birth 99 [Test ID: 119]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, deathdate, accept, pracid) VALUES ('102112', '0', '1', '99', '0', '2', '0', '0', '0', '2008-01-01', '0', '0', '0', '0', '2014-01-01', '1', '112');
--
-- 10.7 valid gender female [Test ID: 120]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('103114', '0', '2', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
--
-- 10.8 valid not entered gender [Test ID: 121]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('104114', '0', '0', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
--
-- 10.9 valid Indeterminate gender [Test ID: 122]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('105114', '0', '3', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
--
-- 10.10 valid unknown gender [Test ID: 123]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('106114', '0', '4', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
--
-- 10.11 valid chinese race [Test ID: 124]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('107114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('107114', '670', 'Chinese', '1', '1');
--
-- 10.12 valid Bangladesi race [Test ID: 125]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('108114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('108114', '670', 'Bangladesi', '1', '1');
--
-- 10.13 valid Pakistani race [Test ID: 126]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('109114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('109114', '670', 'Pakistani', '1', '1');
--
-- 10.14 valid Unknown race [Test ID: 127]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('110114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('110114', '670', 'Unknown', '1', '1');
--
-- 10.15 valid Oth_Asian race [Test ID: 128]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('111114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('111114', '670', 'Oth_Asian', '1', '1');
--
-- 10.16 valid Mixed race [Test ID: 129]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('112114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('112114', '670', 'Mixed', '1', '1');
--
-- 10.17 valid White race [Test ID: 130]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('113114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('113114', '670', 'White', '1', '1');
--
-- 10.18 valid Bl_Afric race [Test ID: 131]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('114114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('114114', '670', 'Bl_Afric', '1', '1');
--
-- 10.19 valid Indian race [Test ID: 132]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('115114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('115114', '670', 'Indian', '1', '1');
--
-- 10.20 valid Bl_Other race [Test ID: 133]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('116114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('116114', '670', 'Bl_Other', '1', '1');
--
-- 10.21 valid Bl_Carib race [Test ID: 134]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('117114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('117114', '670', 'Bl_Carib', '1', '1');
--
-- 10.22 valid Other race [Test ID: 135]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('118114', '0', '1', '195', '6', '2', '0', '0', '0', '2006-01-01', '0', '0', '0', '0', '1', '114');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_patient (patid, pracid, ethnos, n_patid_hes, match_rank) VALUES ('118114', '670', 'Other', '1', '1');

-- 11. Procedure Occurrence
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('48653', '7J46z00');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('45832', '7414200');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.medical (medcode, read_code) VALUES ('69651', '744C.00');
--
-- 11.0 Read clinical procedure with visit [Test ID: 136]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('119111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('119111', '2012-01-01', '3', '48653', '1001', '0', '4', '2', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, staffid, duration) VALUES ('119111', '2012-01-01', '2007-01-15', '9', '1001', '0');
--
-- 11.1 clinical procedure without visit [Test ID: 137]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('120111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('120111', '2012-03-01', '3', '45832', '1001', '0', '4', '2', '0');
--
-- 11.2 clinical procedure outside observation period [Test ID: 138]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('121111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.clinical (patid, eventdate, constype, medcode, staffid, textid, episode, enttype, adid) VALUES ('121111', '2009-03-01', '3', '69651', '1001', '0', '4', '2', '0');
--
-- 11.3 immunisation procedure [Test ID: 139]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('122111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.immunisation (patid, eventdate, sysdate, constype, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) VALUES ('122111', '2011-03-01', '2014-07-09', '4', '69651', '1001', '0', '1', '2', '1', '0', '1', '3', '1', '0');
--
-- 11.4 referral procedure [Test ID: 140]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('123111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.referral (patid, eventdate, sysdate, constype, medcode, staffid, textid, source, nhsspec, fhsaspec, inpatient, attendance, urgency) VALUES ('123111', '2011-03-01', '2002-08-02', '4', '69651', '1001', '0', '1', '0', '0', '3', '0', '0');
--
-- 11.5 test procedure [Test ID: 141]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('124111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.test (patid, eventdate, sysdate, constype, medcode, staffid, textid, enttype, data1, data3, data4, data7) VALUES ('124111', '2011-03-01', '2013-07-26', '2', '69651', '1001', '0', '165', '3', '96.000', '0.000', '0');
--
-- 11.6 ICD10 codes from HES_primary_diag_hosp, entire hosp not within HES obs period [Test ID: 142]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('125111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_primary_diag_hosp (patid, spno, admidate, discharged, icd) VALUES ('125111', '10', '2012-01-01', '2013-03-01', 'Z30.2');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('125111', '10', '2012-01-01', '2013-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('125111', '111', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 11.7 ICD10 codes from HES_primary_diag_hosp, entire hosp  within HES obs period [Test ID: 143]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('126111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_primary_diag_hosp (patid, spno, admidate, discharged, icd) VALUES ('126111', '10', '2011-12-31', '2012-03-01', 'Z30.2');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('126111', '10', '2011-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('126111', '111', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 11.8 inside HES obs period from HES_diagnosis_epi [Test ID: 144]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('127111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_diagnosis_epi (patid, spno, epikey, epistart, epiend, icd, d_order) VALUES ('127111', '11', '2517497', '2012-01-31', '2012-01-31', 'Z70.1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('127111', '11', '2012-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('127111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, spno, epikey, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('127111', '11', '2517497', '2009-01-05', '2012-01-31', '2012-01-31', '1', '1', '1', '21', '19', '19', '1', '300', '250', 'T88888');
--
-- 11.9 outside HES diagnosis period HES_diagnosis_epi [Test ID: 145]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('128111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_diagnosis_epi (patid, spno, epikey, epistart, epiend, icd, d_order) VALUES ('128111', '11', '2517498', '2013-01-31', '2013-01-31', 'Z36.5', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('128111', '11', '2012-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('128111', '111', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 11.10 inside HES diagnosis period HES_procedures_epi [Test ID: 146]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('129111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_procedures_epi (patid, spno, epikey, admidate, epistart, epiend, opcs, evdate, p_order) VALUES ('129111', '11', '2517496', '2014-03-11', '2012-01-31', '2012-01-31', 'A032', '2012-01-31', '2');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('129111', '11', '2012-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('129111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, spno, epikey, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('129111', '11', '2517496', '2009-01-05', '2012-01-31', '2012-01-31', '1', '1', '1', '21', '19', '19', '1', '300', '250', 'T88888');
--
-- 11.11 outside HES diagnosis period HES_procedures_epi [Test ID: 147]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('130111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '1', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_procedures_epi (patid, spno, epikey, admidate, epistart, epiend, opcs, evdate, p_order) VALUES ('130111', '11', '2517495', '2014-03-11', '2013-01-31', '2013-01-31', 'T903', '2013-01-31', '3');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('130111', '11', '2012-01-01', '2012-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('130111', '111', '2013-01-01', '1', '1', '1', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, spno, epikey, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('130111', '11', '2517495', '2009-01-05', '2013-01-31', '2013-01-31', '1', '1', '1', '21', '19', '19', '1', '300', '250', 'T88888');

-- 12. Provider
--
-- 12.0 valid GP: role=2 (Partner); provider_concept_id=38004446 [Test ID: 148]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.staff (staffid, gender, role) VALUES ('131', '0', '2');
--
-- 12.1 valid GP: role=68 (Radiographer ); provider_concept_id=38004675 [Test ID: 149]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.staff (staffid, gender, role) VALUES ('132', '0', '68');
--
-- 12.2 valid GP: role=0 (Data Not Entered ) provider concept_id=38004514 [Test ID: 150]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.staff (staffid, gender, role) VALUES ('133', '0', '0');
--
-- 12.3 valid hes: Provider=A52 role=950 (Not treatment functions ) [Test ID: 151]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('134111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '0', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('134111', '2009-01-05', '2009-05-11', '2013-06-18', '1', '1', '1', '21', '19', '19', '1', '300', '950', 'A52');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('135111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '0', '111');
--
-- 12.4 role=&  mapped to 38004514 [Test ID: 152]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('135111', '2009-01-05', '2009-05-11', '2013-06-18', '1', '1', '1', '21', '19', '19', '1', '300', '&', 'C44');
--
-- 12.5 role=NULL mapped to 0 [Test ID: 153]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('136111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '0', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, pconsult) VALUES ('136111', '2009-01-05', '2009-05-11', '2013-06-18', '1', '1', '1', '21', '19', '19', '1', '300', 'B98');
--
-- 12.6 invalid provider [Test ID: 154]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, toreason, accept, pracid) VALUES ('137111', '0', '1', '199', '1', '2', '0', '0', '0', '2010-01-01', '0', '0', '0', '0', '0', '111');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_episodes (patid, admidate, epistart, epiend, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult) VALUES ('137111', '2009-01-05', '2009-05-11', '2013-06-18', '1', '1', '1', '21', '19', '19', '1', '300', '191', '&');

-- 13. Visit Occurrence
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.practice (pracid, region, lcd, uts) VALUES ('555', '11', '2013-12-31', '2013-01-01');
--
-- 13.0 hes cohort	check the hes cohort is created [Test ID: 155]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_coverage (data_source, start, [end]) VALUES ('hes', '1990-01-01', '2014-12-31');
--
-- 13.1 Same event date in CONSULTATION has multiple consids	One VISIT_OCCURRENCE record is created [Test ID: 156]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, tod, toreason, accept, pracid) VALUES ('138555', '0', '1', '172', '0', '2', '0', '0', '0', '2013-01-01', '0', '0', '0', '2013-12-31', '0', '1', '555');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, consid, staffid, duration) VALUES ('138555', '2013-02-01', '2007-01-15', '9', '1', '500', '0');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, consid, staffid, duration) VALUES ('138555', '2013-02-01', '2007-01-15', '9', '2', '600', '0');
--
-- 13.2 eventdate in CONSULTATION is NULL	No VISIT_OCCURRENCE record created [Test ID: 157]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, tod, toreason, accept, pracid) VALUES ('139555', '0', '1', '172', '0', '2', '0', '0', '0', '2013-01-01', '0', '0', '0', '2013-12-31', '0', '1', '555');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, sysdate, constype, consid, duration) VALUES ('139555', '2007-01-15', '9', '1', '0');
--
-- 13.3 CONSULTATION record occurs outside of a valid OBSERVATION_PERIOD	No VISIT_OCCURRENCE record created [Test ID: 158]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, tod, toreason, accept, pracid) VALUES ('140555', '0', '1', '172', '0', '2', '0', '0', '0', '2013-01-01', '0', '0', '0', '2013-12-31', '0', '1', '555');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.consultation (patid, eventdate, sysdate, constype, consid, duration) VALUES ('140555', '2012-01-01', '2007-01-15', '9', '1', '0');
--
-- 13.4 HES hospitalization record has null admidate	No VISIT_OCCURRENCE record created [Test ID: 159]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, tod, toreason, accept, pracid) VALUES ('141555', '0', '1', '172', '0', '2', '0', '0', '0', '2013-01-01', '0', '0', '0', '2013-12-31', '0', '1', '555');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('141555', '1', '2013-03-01', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('141555', '555', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 13.5 HES cohort created [Test ID: 160]
--
--
-- 13.6 HES hospitalization record has null discharge date	No VISIT_OCCURRENCE record created [Test ID: 161]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, tod, toreason, accept, pracid) VALUES ('142555', '0', '1', '172', '0', '2', '0', '0', '0', '2013-01-01', '0', '0', '0', '2013-12-31', '0', '1', '555');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, admimeth, admisorc, disdest, dismeth, duration) VALUES ('142555', '1', '2013-03-03', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('142555', '555', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 13.7 HES cohort created [Test ID: 162]
--
--
-- 13.8 HES hospitalization record outside of HES observation period	No VISIT_OCCURRENCE record created [Test ID: 163]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, tod, toreason, accept, pracid) VALUES ('143555', '0', '1', '172', '0', '2', '0', '0', '0', '2013-01-01', '0', '0', '0', '2013-12-31', '0', '1', '555');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('143555', '1', '2011-04-15', '2011-04-20', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('143555', '555', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 13.9 HES cohort created [Test ID: 164]
--
--
-- 13.10 HES hospitalization record inside of HES observation period [Test ID: 165]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, tod, toreason, accept, pracid) VALUES ('144555', '0', '1', '172', '0', '2', '0', '0', '0', '2013-01-01', '0', '0', '0', '2013-12-31', '0', '1', '555');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('144555', '1', '2013-05-05', '2013-05-12', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('144555', '555', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 13.11 HES cohort created [Test ID: 166]
--
--
-- 13.12 Cohort_start_date after cohort_end_date  [Test ID: 167]
--
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.patient (patid, vmid, gender, yob, mob, chsreg, prescr, capsup, ses, crd, regstat, reggap, internal, tod, toreason, accept, pracid) VALUES ('145555', '0', '1', '172', '0', '2', '0', '0', '0', '2014-10-31', '0', '0', '0', '2014-12-31', '0', '1', '555');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_hospital (patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration) VALUES ('145555', '1', '2014-11-05', '2014-11-12', '21', '19', '19', '1', '1');
INSERT INTO CDM_CPRD_TESTING_RAW.dbo.hes_linkage_eligibility (patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) VALUES ('145555', '555', '2013-01-01', '1', '1', '1', '1', '1');
--
-- 13.13 HES cohort created [Test ID: 168]
--