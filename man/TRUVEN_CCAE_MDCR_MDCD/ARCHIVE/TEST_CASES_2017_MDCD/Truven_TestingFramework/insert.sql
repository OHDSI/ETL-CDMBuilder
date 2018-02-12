TRUNCATE TABLE @source_schema.drug_claims;
TRUNCATE TABLE @source_schema.enrollment_detail;
TRUNCATE TABLE @source_schema.enrollment_summary;
TRUNCATE TABLE @source_schema.facility_header;
TRUNCATE TABLE @source_schema.icd9;
TRUNCATE TABLE @source_schema.inpatient_admissions;
TRUNCATE TABLE @source_schema.inpatient_services;
TRUNCATE TABLE @source_schema.long_term_care;
TRUNCATE TABLE @source_schema.outpatient_services;

-- 1. Condition Occurrence
--
-- 1.0 Patient has two different primary diagnoses between inpatient_services and inpatient_admissions, the inpatient_admissions PDX is used [Test ID: 1]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '1', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '2', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '9', '1', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', '2500', '2', '1', '2', '21', '1', '1', '50', '2012-08-09', '20226', '2012-08-12', '01', '2012');
INSERT INTO @source_schema.inpatient_admissions (admdate, admtyp, boe, cap, caseid, days, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx2, dxver, enrolid, hospnet, hosppay, mas, mdc, medicare, mhsacovg, pddate, pdx, physnet, physpay, plantyp, sex, stdrace, totcob, totcoins, totcopay, totded, totnet, totpay, version, year) VALUES ('2012-01-01', '3', '2', '0', '2', '2', '2012-12-31', '2014', '795', '1', '01', 'V3000  ', '25000  ', '9', '1', '0.0', '0.0', '9', '14', '0', '1', '2008-05-12', '0092', '0.0', '0.0', '2', '2', '1', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '01', '2012');
--
-- 1.1 Patient has the same diagnosis code in outpatient_services and facility_header but in different positions, outpatient_services dx is prioritized [Test ID: 2]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '3', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, dx1, dxver, enrolid, fachdid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '1024', '9', '3', '4', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '1', '2', '11', '1', '1', '2012-10-16', '12220', '2012-10-16', '01', '2015');
INSERT INTO @source_schema.facility_header (billtyp, boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dstatus, dx1, dx9, dxver, enrolid, fachdid, mas, mdc, medicare, mhsacovg, netpay, pddate, plantyp, sex, stdplac, stdprov, stdrace, svcdate, tsvcdat, version, year) VALUES ('131', '2', '0', '0.0', '0.0', '0.0', '0.0', '2007', '1', '01', 'V221   ', '1024', '9', '3', '4', '9', '23', '0', '1', '0.0', '2013-07-12', '2', '2', '22', '1', '1', '2012-10-16', '2012-10-16', '01', '2015');
--
-- 1.2 Patient has diagnosis in dx4 field in inpatient_services, condition_type_concept_id = 38000187 [Test ID: 3]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '5', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx4, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '57411', '9', '5', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-07-23', '20226', '2012-07-23', '01', '2014');
--
-- 1.3 Patient has diagnosis in dx9 field in facility_header, condition_type_concept_id = 38000208 [Test ID: 4]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '7', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, fachdid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '7', '8', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-07-23', '20226', '2012-07-23', '01', '2014');
INSERT INTO @source_schema.facility_header (billtyp, boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dstatus, dx1, dx9, dxver, enrolid, fachdid, mas, mdc, medicare, mhsacovg, netpay, pddate, plantyp, sex, stdplac, stdprov, stdrace, svcdate, tsvcdat, version, year) VALUES ('131', '2', '0', '0.0', '0.0', '0.0', '0.0', '2007', '1', '01', 'V221   ', '4760', '9', '7', '8', '9', '23', '0', '1', '0.0', '2013-07-12', '2', '2', '22', '1', '1', '2012-07-23', '2012-07-23', '01', '2015');
--
-- 1.4 Patient has revcode 0450 and diagnosis codes in the pdx and dx1 fields, ER record created and conditions have condition_type_concept_id = 38000215 [Test ID: 5]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '9', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, revcode, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', '57411', '9', '9', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', '4760', '2', '1', '0450', '2', '21', '1', '1', '50', '2012-04-14', '20226', '2012-04-14', '01', '2014');
--
-- 1.5 Patient has diagnosis in a dx field that has domain=procedure, condition record moved to procedure_occurrence [Test ID: 6]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '11', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '9', '11', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V755', '2', '1', '2', '21', '1', '1', '50', '2012-10-15', '20226', '2012-10-17', '01', '2014');
--
-- 1.6 Patient has diagnosis in a dx field that has domain=observation, condition record moved to observation [Test ID: 7]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '13', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '9', '13', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'E0152', '2', '1', '2', '21', '1', '1', '50', '2012-02-04', '20226', '2012-02-08', '01', '2014');
--
-- 1.7 Patient has diagnosis in a dx field that has domain=measurement, condition record moved to measurement [Test ID: 8]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '15', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '9', '15', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V726', '2', '1', '2', '21', '1', '1', '50', '2012-08-21', '20226', '2012-08-25', '01', '2014');
--
-- 1.8 Patient has icd10 diagnosis in a dx field with dxver=0, condition record created with icd10 mapped to snomed [Test ID: 9]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '17', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'S42241S', '0', '17', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-08-09', '20226', '2012-08-12', '01', '2014');
--
-- 1.9 patient has icd10cm diagnosis in a dx field that overlaps with an icd10 diagnosis, condition record created with icd10cm mapped to snomed [Test ID: 10]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '19', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V9001', '0', '19', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-08-09', '20226', '2012-08-12', '01', '2014');
--
-- 1.10 Patient has icd10 diagnosis after 10/1/2015 in a dx field with dxver=null, condition record created with icd10 mapped to snomed [Test ID: 11]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2015-12-31', '2015-01-01', '21', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-11-09', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'S42241S', '', '21', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2015-11-09', '20226', '2015-11-12', '01', '2014');
--
-- 1.11 Patient has icd10 diagnosis before 10/1/2015 in a dx field with dxver=null, used ICD9 [Test ID: 12]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '23', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V9001', '', '23', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-08-09', '20226', '2012-08-12', '01', '2014');
--
-- 1.12 Patient has diagnosis in dx1 in ltc, condition_type_concept_id = 38000215 [Test ID: 13]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '25', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.long_term_care (boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, qty, revcode, sex, stdplac, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('1', '0', '0.0', '0.0', '0.0', '0.0', '1925', '0', 'v9001', '9', '25', 'F', '9', '01', '1', '1', '0.0', '0.0', '2010-08-30', '2', '1', '0190', '2', '31', '1', '11-05-2012', '10210', '11-10-2012', '01', '2014');

-- 2. Condition Era
--
-- 2.0 Patient condition_concept_id of 0, no condition_era record created [Test ID: 14]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '27', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', '71978', '9', '27', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', '71978', '2', '1', '2', '21', '1', '1', '50', '2012-04-21', '20226', '2012-04-22', '01', '2014');
--
-- 2.1 Two records with same condition_concept_id are less than 30 days apart, one condition_era record created [Test ID: 15]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '29', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '37613', '9', '29', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '1', '2', '11', '1', '1', '2012-07-01', '12220', '2015-04-30', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '37613', '9', '29', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '1', '2', '11', '1', '1', '2012-07-12', '12220', '2015-04-30', '01', '2015');
--
-- 2.2 Two records with same condition_concept_id are more than 30 days apart, two condition_era records created [Test ID: 16]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2013-12-31', '2012-01-01', '31', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '37613', '9', '31', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '1', '2', '11', '1', '1', '2012-07-01', '12220', '2015-04-30', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '37613', '9', '31', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '1', '2', '11', '1', '1', '2012-08-12', '12220', '2015-04-30', '01', '2015');

-- 3. Cost
--
-- 3.0 Patient has values in ingcost and and dispfee [Test ID: 17]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '33', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '20', '01', '30', '6', '0.0', '25', '1957', '1', '33', '111273', '4', '50', '2', '9', '0', '0', '1', '00378510501', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '2012-02-09', '69', '08', '01', '2015');
--
-- 3.1 Patient has cost values, cost is correctly associated with cost_domain_id = 10 [Test ID: 18]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '35', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, proc1, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '36', '0.0', '0.0', '40', '120', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '35', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '65779', '1', '2', '21', '1', '1', '50', '2012-06-11', '20226', '2012-06-30', '01', '2012');
INSERT INTO @source_schema.inpatient_admissions (admdate, admtyp, boe, cap, caseid, days, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx2, enrolid, hospnet, hosppay, mas, mdc, medicare, mhsacovg, pddate, pdx, physnet, physpay, plantyp, sex, stdrace, totcob, totcoins, totcopay, totded, totnet, totpay, version, year) VALUES ('2012-01-01', '3', '2', '0', '36', '2', '2012-12-31', '2014', '795', '1', '01', 'V3000  ', '25000  ', '35', '0.0', '0.0', '9', '14', '0', '1', '2008-05-12', 'V3000  ', '0.0', '0.0', '2', '2', '1', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '01', '2012');
--
-- 3.2 Patient has procedure with domain = measurement, measurement record created [Test ID: 19]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '37', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '37', '0.0', '0', '2006', '1', '37', 'P', '9', '23', '0', '1', '120', '0.0', '2014-05-28', '2', '82985', '104', '1', '1', '2', '11', '1', '1', '2012-05-07', '12220', '2012-05-07', '01', '2015');
--
-- 3.3 Patient has procedure with domain = observation, observation record created [Test ID: 20]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '39', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '52', '100', '0.0', '0.0', '0', '2006', '1', '39', 'P', '9', '23', '0', '1', '75', '0.0', '2014-05-28', '2', 'S9368', '104', '1', '1', '2', '11', '1', '1', '2012-10-03', '12220', '2012-10-03', '01', '2015');
--
-- 3.4 Patient has cost values and revenue code, cost is correctly associated with cost_domain_id = 10 [Test ID: 21]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '41', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, revcode, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '42', '0.0', '0.0', '80', '20', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '41', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '0420', '2', '21', '1', '1', '50', '2012-06-05', '20226', '2012-06-05', '01', '2012');
INSERT INTO @source_schema.inpatient_admissions (admdate, admtyp, boe, cap, caseid, days, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx2, enrolid, hospnet, hosppay, mas, mdc, medicare, mhsacovg, pddate, pdx, physnet, physpay, plantyp, sex, stdrace, totcob, totcoins, totcopay, totded, totnet, totpay, version, year) VALUES ('2012-01-01', '3', '2', '0', '42', '2', '2012-12-31', '2014', '795', '1', '01', 'V3000  ', '25000  ', '41', '0.0', '0.0', '9', '14', '0', '1', '2008-05-12', 'V3000  ', '0.0', '0.0', '2', '2', '1', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '01', '2012');
--
-- 3.5 Patient has record with costs in ltc, cost record created [Test ID: 22]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '43', '9', '0', '31', '1', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.long_term_care (boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, qty, revcode, sex, stdplac, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('1', '0', '20', '88', '62', '0.0', '1925', '0', 'v9001', '9', '43', 'F', '9', '01', '1', '1', '90', '0.0', '2010-08-30', '2', '65779', '1', '0190', '2', '31', '1', '11-12-2012', '10210', '11-22-2012', '01', '2014');

-- 4. Death
--
-- 4.0 Date of death visit end date [Test ID: 23]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2015-12-31', '2012-01-01', '45', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '45', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2013-01-06', '20226', '2013-01-09', '01', '2013');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, dx1, dxver, enrolid, fachdid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '7981', '9', '45', '46', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '1', '2', '11', '1', '1', '2013-01-07', '12220', '2013-01-07', '01', '2013');
INSERT INTO @source_schema.facility_header (billtyp, boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dstatus, dx1, dx9, dxver, enrolid, fachdid, mas, mdc, medicare, mhsacovg, netpay, pddate, plantyp, sex, stdplac, stdprov, stdrace, svcdate, tsvcdat, version, year) VALUES ('131', '2', '0', '0.0', '0.0', '0.0', '0.0', '2007', '1', '01', 'V221   ', '7981', '9', '45', '46', '9', '23', '0', '1', '0.0', '2013-07-12', '2', '2', '22', '1', '1', '2013-01-07', '2013-01-07', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2016-12-31', '2012-01-01', '47', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 4.1 ICD10 Death and Death Type Correct [Test ID: 24]
--
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'I461', '0', '47', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2016-01-06', '20226', '2016-01-09', '01', '2016');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2015-12-31', '2012-01-01', '49', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 4.2 ICD9 Death and Death Type Correct [Test ID: 25]
--
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', '798', '9', '49', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2013-01-06', '20226', '2013-01-09', '01', '2013');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2013-02-01', '2012-01-01', '51', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 4.3 Discharge Status and Death Type Correct [Test ID: 26]
--
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '20', 'V3000  ', '51', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2013-01-06', '20226', '2013-01-09', '01', '2013');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2015-12-31', '2012-01-01', '53', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 4.4 Death by ICD9 and Death by Discharge, Keep the Discharge [Test ID: 27]
--
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '20', '798', '9', '53', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2013-01-06', '20226', '2013-01-09', '01', '2013');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2015-12-31', '2012-01-01', '55', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 4.5 Death and then contined Activity Cancels Death [Test ID: 28]
--
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '20', 'V3000  ', '55', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2013-01-06', '20226', '2013-01-09', '01', '2013');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '55', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '1', '2', '11', '1', '1', '2013-03-12', '12220', '2015-04-30', '01', '2013');
--
-- 4.6 Patient has icd9 death cord in ltc, death record created [Test ID: 29]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '57', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.long_term_care (boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, qty, revcode, sex, stdplac, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('1', '0', '0.0', '0.0', '0.0', '0.0', '1925', '0', '798', '9', '57', 'F', '9', '01', '1', '1', '0.0', '0.0', '2010-08-30', '2', '1', '0190', '2', '31', '1', '11-02-2012', '10210', '11-22-2012', '01', '2014');

-- 5. Device Exposure

-- 6. Drug Exposure
--
-- 6.0 Duplicate drug records become one record in the CDM [Test ID: 30]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '59', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '30', '6', '0.0', '0.0', '1957', '1', '59', '111273', '4', '0.0', '2', '9', '0', '0', '1', '36987257801', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '02-01-2012', '69', '08', '01', '2012');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '30', '6', '0.0', '0.0', '1957', '1', '59', '111273', '4', '0.0', '2', '9', '0', '0', '1', '36987257801', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '02-01-2012', '69', '08', '01', '2012');
--
-- 6.1 Negative daysupp should be 0 in cdm [Test ID: 31]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '61', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '-30', '6', '0.0', '0.0', '1957', '1', '61', '111273', '4', '0.0', '2', '9', '0', '0', '1', '58864060830', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '06-12-2012', '69', '08', '01', '2012');
--
-- 6.2 Daysupp >365 should be 365 in cdm [Test ID: 32]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '63', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '432', '6', '0.0', '0.0', '1957', '1', '63', '111273', '4', '0.0', '2', '9', '0', '0', '1', '58864060830', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '08-07-2012', '69', '08', '01', '2012');
--
-- 6.3 CPT4 drug code in inpatient record moves to drug_exposure [Test ID: 33]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '65', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, proc1, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '66', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '65', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '90376', '1', '2', '21', '1', '1', '50', '2012-08-09', '20226', '2012-08-12', '01', '2012');
--
-- 6.4 Patient has 11 digit NDC that doesn''t map, should use first 9 digits instead [Test ID: 34]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '67', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '30', '6', '0.0', '0.0', '1957', '1', '67', '111273', '4', '0.0', '2', '9', '0', '0', '1', '13533063670', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '01-17-2012', '69', '08', '01', '2012');
--
-- 6.5 Patient has 9 digit NDC that doesn''t map, should use first 9 digits instead, should map to DRUG_CONCEPT_ID=0 because of the date filter [Test ID: 35]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2006-12-31', '2006-01-01', '69', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '30', '6', '0.0', '0.0', '1957', '1', '69', '111273', '4', '0.0', '2', '9', '0', '0', '1', '00006000543', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '07-08-2006', '69', '08', '01', '2006');
--
-- 6.6 Patient has 9 digit NDC that doesn''t map, should use first 9 digits instead, should map to correct DRUG_CONCEPT_ID because of the date filter [Test ID: 36]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2014-12-31', '2014-01-01', '71', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '30', '6', '0.0', '0.0', '1957', '1', '71', '111273', '4', '0.0', '2', '9', '0', '0', '1', '00006032582', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '09-18-2014', '69', '08', '01', '2014');

-- 7. Drug Era
--
-- 7.0 Two drugs with same ingredient within 30 days, should be one drug era [Test ID: 37]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '73', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '30', '6', '0.0', '0.0', '1957', '1', '73', '111273', '4', '0.0', '2', '9', '0', '0', '1', '00463303410', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '02-04-2012', '69', '08', '01', '2012');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '30', '6', '0.0', '0.0', '1957', '1', '73', '111273', '4', '0.0', '2', '9', '0', '0', '1', '00463303410', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '02-22-2012', '69', '08', '01', '2012');
--
-- 7.1 Two drugs with same ingredient > 30 days apart, should be two drug eras [Test ID: 38]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '75', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '30', '6', '0.0', '0.0', '1957', '1', '75', '111273', '4', '0.0', '2', '9', '0', '0', '1', '00463303410', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '09-21-2012', '69', '08', '01', '2012');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '30', '6', '0.0', '0.0', '1957', '1', '75', '111273', '4', '0.0', '2', '9', '0', '0', '1', '00463303410', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '12-08-2012', '69', '08', '01', '2012');
--
-- 7.2 Drug_era_end_date should be drug start date + days supply [Test ID: 39]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2010-01-01', '77', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '14', '6', '0.0', '0.0', '1957', '1', '77', '111273', '4', '0.0', '2', '9', '0', '0', '1', '00349835305', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '12-08-2010', '69', '08', '01', '2012');
--
-- 7.3 No drug era created from procedure drugs since they are not related to ingredients [Test ID: 40]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '79', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, proc1, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '80', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '79', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '90376', '1', '2', '21', '1', '1', '50', '2012-03-26', '20226', '2012-03-30', '01', '2012');
--
-- 7.4 Drug with two ingredients should have two drug eras [Test ID: 41]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2010-01-01', '81', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.drug_claims (awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, plantyp, qty, refill, sex, stdrace, svcdate, thercls, thergrp, version, year) VALUES ('0.0', '2', '0', '0.0', '0.0', '0.0', '01', '30', '6', '0.0', '0.0', '1957', '1', '81', '111273', '4', '0.0', '2', '9', '0', '0', '1', '00008419001', '0.0', '0.0', '2014-05-14', '2', '1', '0', '2', '1', '05-01-2010', '69', '08', '01', '2012');

-- 8. Location

-- 9. Measurement

-- 10. Observation Period
--
-- 10.0 Subsumed enrollment test where two enrollment durations with the second subsumed by the first results in a single observation [Test ID: 42]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '83', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-07-31', '2012-06-01', '83', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 10.1 Combine enrollment test where two enrollment durations with the second within 30 days of the first results in a single observation [Test ID: 43]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-05-31', '2012-05-01', '84', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-06-15', '84', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 10.2 Gap enrollment test where two enrollment durations are 33 days apart results in two observations [Test ID: 44]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-06-01', '2012-01-01', '85', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-08-02', '85', '9', '0', '31', '0', '4', '2', '1', '01', '2015');

-- 11. Observation
--
-- 11.0 Store Discharge Status [Test ID: 45]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2013-12-31', '2012-01-01', '86', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dxver, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '51', '57411', '9', '86', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-07-23', '20226', '2012-07-23', '01', '2014');

-- 12. Payer Plan Period
--
-- 12.0 Person has a gap of >32 days between enrollment periods with the same payer_source_value; person has two records [Test ID: 46]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2013-01-31', '2013-01-01', '88', '9', '1', '31', '0', '6', '2', '1', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2013-05-31', '2013-05-01', '88', '9', '1', '31', '0', '6', '2', '1', '01', '2015');
--
-- 12.1 Person does not have prescription benefits and is excluded [Test ID: 47]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '0', '2013-01-31', '2013-01-01', '89', '9', '0', '31', '0', '6', '2', '1', '01', '2015');
--
-- 12.2 Person switches plans in the middle of an enrollment period; person has two records with the first truncated [Test ID: 48]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-04-30', '2012-04-01', '90', '9', '1', '31', '0', '6', '2', '1', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-04-30', '2012-04-07', '90', '9', '1', '31', '0', '5', '2', '1', '01', '2015');
--
-- 12.3 Person has duplicate records, only one is brought into the cdm [Test ID: 49]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-04-30', '2012-04-01', '91', '9', '1', '31', '0', '6', '2', '1', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-04-30', '2012-04-01', '91', '9', '1', '31', '0', '6', '2', '1', '01', '2015');

-- 13. Person
--
-- 13.0 Person with two genders is excluded [Test ID: 50]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2015-08-31', '2015-08-01', '92', '9', '0', '31', '0', '4', '1', '1', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2015-08-31', '2015-08-01', '92', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.1 Person with two birth years >2 yrs apart is excluded [Test ID: 51]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '1970', '1', '2015-08-31', '2015-08-01', '93', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '1980', '1', '2015-08-31', '2015-08-01', '93', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.2 Person with two birth years <2 yrs apart is kept with last birth year selected [Test ID: 52]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '1970', '1', '2012-01-31', '2012-01-01', '94', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '1971', '1', '2012-02-28', '2012-02-01', '94', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.3 Person born before 1900 is excluded [Test ID: 53]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '1899', '1', '2015-08-31', '2015-08-01', '95', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.4 Person born in 2099 is excluded [Test ID: 54]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2099', '1', '2015-08-31', '2015-08-01', '96', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.5 Person born in 2014 but enrolled in 2012 is excluded [Test ID: 55]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2014', '1', '2012-01-31', '2012-01-01', '97', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.6 Person born in 2013 but enrolled in 2012 is kept, latest birth year taken [Test ID: 56]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2013', '1', '2012-01-31', '2012-01-01', '98', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.7 Person with two enrollment_detail records has one person record [Test ID: 57]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '1980', '1', '2012-01-31', '2012-01-01', '99', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '1980', '1', '2012-02-28', '2012-02-01', '99', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.8 Person with sex=3 is excluded [Test ID: 58]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2015-08-31', '2015-08-01', '100', '9', '0', '31', '0', '4', '3', '1', '01', '2015');
--
-- 13.9 Person has record with sex=3 but last record has sex=1, person is kept [Test ID: 59]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-01-31', '2012-01-01', '101', '9', '0', '31', '0', '4', '3', '1', '01', '2015');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-02-28', '2012-02-01', '101', '9', '0', '31', '0', '4', '1', '1', '01', '2015');
--
-- 13.10 Person born the same year as enrolled, use first enrollment month to impute month of birth and day of birth [Test ID: 60]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2012', '1', '2012-04-30', '2012-04-01', '102', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.11 Person with DRUGCOVG=0 and MEDICARE=0, person is excluded [Test ID: 61]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '0', '2015-08-31', '2015-08-01', '103', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.12 Person with DRUGCOVG=1 and MEDICARE=0, person is kept [Test ID: 62]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2015-08-31', '2015-08-01', '104', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.13 Person with DRUGCOVG=0 and MEDICARE=1, person is kept [Test ID: 63]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '0', '2015-08-31', '2015-08-01', '105', '9', '1', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.14 Person with stdrace=1 [Test ID: 64]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2015-08-31', '2015-08-01', '106', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 13.15 Person with stdrace=4 [Test ID: 65]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2015-08-31', '2015-08-01', '107', '9', '0', '31', '0', '4', '2', '4', '01', '2015');

-- 14. Procedure Occurrence
--
-- 14.0 Patient has two PPROC values, PPROC from inpatient_admissions is used [Test ID: 66]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '108', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, pproc, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '109', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '108', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '65779', '1', '2', '21', '1', '1', '50', '2012-06-11', '20226', '2012-06-12', '01', '2012');
INSERT INTO @source_schema.inpatient_admissions (admdate, admtyp, boe, cap, caseid, days, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx2, enrolid, hospnet, hosppay, mas, mdc, medicare, mhsacovg, pddate, pdx, physnet, physpay, plantyp, pproc, sex, stdrace, totcob, totcoins, totcopay, totded, totnet, totpay, version, year) VALUES ('2012-01-01', '3', '2', '0', '109', '2', '2012-12-31', '2014', '795', '1', '01', 'V3000  ', '25000  ', '108', '0.0', '0.0', '9', '14', '0', '1', '2008-05-12', 'V3000  ', '0.0', '0.0', '2', '29914', '2', '1', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '01', '2012');
--
-- 14.1 Patient has two different providers for the same procedure, the provider on the first line (ascending) is chosen [Test ID: 67]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '110', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_admissions (admdate, admtyp, boe, cap, caseid, days, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx2, enrolid, hospnet, hosppay, mas, mdc, medicare, mhsacovg, pddate, pdx, physnet, physpay, plantyp, sex, stdrace, totcob, totcoins, totcopay, totded, totnet, totpay, version, year) VALUES ('2012-01-01', '3', '2', '0', '111', '2', '2012-12-31', '2014', '795', '1', '01', 'V3000  ', '25000  ', '110', '0.0', '0.0', '9', '14', '0', '1', '2008-05-12', 'V3000  ', '0.0', '0.0', '2', '2', '1', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '01', '2012');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, proc1, prov_id, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '111', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '110', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '50760', '3456789', '1', '2', '21', '220', '1', '50', '2012-10-20', '20226', '2012-10-22', '01', '2012');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, proc1, prov_id, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '111', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '110', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '50760', '1234567', '1', '2', '21', '540', '1', '50', '2012-10-20', '20226', '2012-10-22', '01', '2012');
--
-- 14.2 Patient has procedure in proc1 field in long_term_care table [Test ID: 68]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '112', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.long_term_care (boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, qty, revcode, sex, stdplac, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('1', '0', '0.0', '0.0', '0.0', '0.0', '1925', '0', '112', 'F', '9', '01', '1', '1', '0.0', '0.0', '2010-08-30', '2', '92568', '1', '0190', '2', '31', '1', '2012-09-15', '10210', '2012-10-30', '01', '2014');
--
-- 14.3 Patient has two records for the same procedure, procedure in outpatient_services prioritized [Test ID: 69]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '114', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, fachdid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '114', '115', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '54861', '104', '1', '1', '2', '11', '1', '1', '2012-02-15', '12220', '2012-02-15', '01', '2012');
INSERT INTO @source_schema.facility_header (billtyp, boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dstatus, dx1, enrolid, fachdid, mas, mdc, medicare, mhsacovg, netpay, pddate, plantyp, proc1, sex, stdplac, stdprov, stdrace, svcdate, tsvcdat, version, year) VALUES ('131', '2', '0', '0.0', '0.0', '0.0', '0.0', '2007', '1', '01', 'V221   ', '114', '115', '9', '23', '0', '1', '0.0', '2013-07-12', '2', '54861', '2', '22', '1', '1', '2012-02-15', '2012-02-15', '01', '2012');
--
-- 14.4 Patient has procedure in proc5 position in facility header, procedure_type_concept_id = 38000273 [Test ID: 70]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '116', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, fachdid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '116', '117', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '1', '2', '11', '1', '1', '2012-03-03', '12220', '2012-03-03', '01', '2012');
INSERT INTO @source_schema.facility_header (billtyp, boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dstatus, dx1, enrolid, fachdid, mas, mdc, medicare, mhsacovg, netpay, pddate, plantyp, proc5, sex, stdplac, stdprov, stdrace, svcdate, tsvcdat, version, year) VALUES ('131', '2', '0', '0.0', '0.0', '0.0', '0.0', '2007', '1', '01', 'V221   ', '116', '117', '9', '23', '0', '1', '0.0', '2013-07-12', '2', '93042', '2', '22', '1', '1', '2012-03-03', '2012-03-03', '01', '2012');
--
-- 14.5 Patient has procedure with domain = device, device record created [Test ID: 71]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '118', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, fachdid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '118', '119', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', 'E0304', '104', '1', '1', '2', '11', '1', '1', '2012-04-03', '12220', '2012-04-03', '01', '2012');
INSERT INTO @source_schema.facility_header (billtyp, boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dstatus, dx1, enrolid, fachdid, mas, mdc, medicare, mhsacovg, netpay, pddate, plantyp, sex, stdplac, stdprov, stdrace, svcdate, tsvcdat, version, year) VALUES ('131', '2', '0', '0.0', '0.0', '0.0', '0.0', '2007', '1', '01', 'V221   ', '118', '119', '9', '23', '0', '1', '0.0', '2013-07-12', '2', '2', '22', '1', '1', '2012-04-03', '2012-04-03', '01', '2012');
--
-- 14.6 Patient has procedure with domain = drug, drug record created [Test ID: 72]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '120', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '120', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '90686', '104', '1', '1', '2', '11', '1', '1', '2012-05-03', '12220', '2012-05-03', '01', '2015');
--
-- 14.7 Patient has procedure with domain = measurement, measurement record created [Test ID: 73]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '122', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '122', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '82985', '104', '1', '1', '2', '11', '1', '1', '2012-05-03', '12220', '2012-05-03', '01', '2015');
--
-- 14.8 Patient has procedure with domain = observation, observation record created [Test ID: 74]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '124', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '124', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', 'S9368', '104', '1', '1', '2', '11', '1', '1', '2012-05-03', '12220', '2012-05-03', '01', '2015');

-- 15. Provider
--
-- 15.0 Provider in facility header table with stdprov=220, specialty = emergency medicine [Test ID: 75]
--
INSERT INTO @source_schema.facility_header (billtyp, boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dstatus, dx1, enrolid, mas, mdc, medicare, mhsacovg, netpay, pddate, plantyp, sex, stdplac, stdprov, stdrace, svcdate, tsvcdat, version, year) VALUES ('131', '2', '0', '0.0', '0.0', '0.0', '0.0', '2007', '1', '01', 'V221   ', '127', '9', '23', '0', '1', '0.0', '2013-07-12', '2', '2', '22', '220', '1', '2014-08-01', '2014-01-31', '01', '2015');
--
-- 15.1 Provider in outpatient_services table with stdprov=285, specialty = infectious disease [Test ID: 76]
--
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, prov_id, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '129', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '128', '1', '2', '11', '285', '1', '2015-07-01', '12220', '2015-04-30', '01', '2015');
--
-- 15.2 provider in inpatient_services table with stdprov=540, specialty = cardiac surgery [Test ID: 77]
--
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, prov_id, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '131', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '130', '1', '2', '21', '540', '1', '50', '2015-02-24', '20226', '2015-02-19', '01', '2014');
--
-- 15.3 provider in long_term_care table with stdprov=22, specialty = addiction medicine [Test ID: 78]
--
INSERT INTO @source_schema.long_term_care (boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, prov_id, qty, revcode, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('1', '0', '0.0', '0.0', '0.0', '0.0', '1925', '0', '133', 'F', '9', '01', '1', '1', '0.0', '0.0', '2010-08-30', '2', '132', '1', '0190', '2', '31', '22', '1', '2015-05-01', '10210', '2014-06-30', '01', '2014');

-- 16. Visit Occurrence
--
-- 16.0 Patient with visit that starts before the observation period, start date trimmed to beginning of observation period [Test ID: 79]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '134', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '135', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '134', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2011-12-05', '20226', '2012-01-06', '01', '2014');
--
-- 16.1 svcdate>tsvcdate, visit_end_date is svcdate [Test ID: 80]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '136', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '136', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-03-21', '20226', '2012-03-19', '01', '2014');
--
-- 16.2 Service falls during observation period but ends after the period ends, visit_end_date is the observation_period_end_date [Test ID: 81]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '138', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '138', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-12-30', '20226', '2013-01-08', '01', '2014');
--
-- 16.3 service in inpatient_services with revcode of 0450, visit classified as ER [Test ID: 82]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '140', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, revcode, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '140', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '0450', '2', '21', '1', '1', '50', '2012-04-12', '20226', '2012-04-12', '01', '2014');
--
-- 16.4 service in outpatient_services with revcode of 0450, visit classified as ER [Test ID: 83]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '142', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, qty, revcode, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '142', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '1', '0450', '2', '11', '1', '1', '2012-05-01', '12220', '2012-05-01', '01', '2015');
--
-- 16.5 service in outpatient_services with revcode of 0100, visit classified as IP [Test ID: 84]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '144', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, qty, revcode, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '144', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '1', '0100', '2', '11', '1', '1', '2012-10-17', '12220', '2012-10-20', '01', '2015');
--
-- 16.6 patient has two lines in the inpatient_services table where the end_date of one line and the start_date of the next >1, two visits created [Test ID: 85]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '146', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '146', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-08-08', '20226', '2012-08-12', '01', '2014');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '146', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-10-01', '20226', '2012-10-05', '01', '2014');
--
-- 16.7 Patient has an ER record that starts and ends on the first day of the IP visit, separate ER visit created [Test ID: 86]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '148', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, revcode, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '148', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '0450', '2', '21', '1', '1', '50', '2012-09-03', '20226', '2012-09-03', '01', '2014');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, revcode, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '148', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '0100', '2', '21', '1', '1', '50', '2012-09-03', '20226', '2012-09-10', '01', '2014');
--
-- 16.8 Patient has two lines in the inpatient_services table where the difference between the end_date of one line and the start_date of the next is <= 1, one visit created [Test ID: 87]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '150', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '150', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-05-15', '20226', '2012-05-16', '01', '2014');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '150', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '1', '2', '21', '1', '1', '50', '2012-05-16', '20226', '2012-05-17', '01', '2014');
--
-- 16.9 Patient has record in outpatient_services table but no rx benefits, visit dropped [Test ID: 88]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '0', '2012-12-31', '2012-01-01', '152', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.outpatient_services (boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, enrolid, fachdid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, procgrp, proctyp, qty, sex, stdplac, stdprov, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('2', '0', '0.0', '0.0', '0.0', '0.0', '0', '2006', '1', '152', '153', 'P', '9', '23', '0', '1', '0.0', '0.0', '2014-05-28', '2', '104', '1', '1', '2', '11', '1', '1', '2012-01-06', '12220', '2012-01-06', '01', '2015');
--
-- 16.10 Patient has two records in the same visit with different prov_id and provstd [Test ID: 89]
--
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '154', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, prov_id, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '154', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '156', '1', '2', '21', '220', '1', '50', '2012-08-08', '20226', '2012-08-12', '01', '2014');
INSERT INTO @source_schema.inpatient_services (admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, prov_id, qty, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year) VALUES ('2015-04-08', '2', '2', '0', '532786', '0.0', '0.0', '0.0', '0.0', '2015-02-27', '2014', '775', '1', '01', 'V3000  ', '154', 'F', '9', '14', '0', '1', '0.0', '0.0', '2015-03-31', 'V3000  ', '2', '157', '1', '2', '21', '540', '1', '50', '2012-08-08', '20226', '2012-08-12', '01', '2014');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '158', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 16.11 Patient has two LTC claims where the end_date of the first is within one day of the start_date of the second, one visit created [Test ID: 90]
--
INSERT INTO @source_schema.long_term_care (boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, qty, revcode, sex, stdplac, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('1', '0', '0.0', '0.0', '0.0', '0.0', '1925', '0', '158', 'F', '9', '01', '1', '1', '0.0', '0.0', '2010-08-30', '2', '1', '0190', '2', '31', '1', '2012-06-18', '10210', '2012-06-30', '01', '2012');
INSERT INTO @source_schema.long_term_care (boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, qty, revcode, sex, stdplac, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('1', '0', '0.0', '0.0', '0.0', '0.0', '1925', '0', '158', 'F', '9', '01', '1', '1', '0.0', '0.0', '2010-08-30', '2', '1', '0190', '2', '31', '1', '2012-07-01', '10210', '2012-07-31', '01', '2012');
INSERT INTO @source_schema.enrollment_detail (boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, medicare, memdays, mhsacovg, plantyp, sex, stdrace, version, year) VALUES ('4', '1', '2006', '1', '2012-12-31', '2012-01-01', '160', '9', '0', '31', '0', '4', '2', '1', '01', '2015');
--
-- 16.12 Patient has LTC claim where the end_date = the start_date [Test ID: 91]
--
INSERT INTO @source_schema.long_term_care (boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, enrolid, facprof, mas, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, qty, revcode, sex, stdplac, stdrace, svcdate, svcscat, tsvcdat, version, year) VALUES ('1', '0', '0.0', '0.0', '0.0', '0.0', '1925', '0', '160', 'F', '9', '01', '1', '1', '0.0', '0.0', '2010-08-30', '2', '1', '0190', '2', '31', '1', '2012-08-03', '10210', '2012-08-03', '01', '2012');