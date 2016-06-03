----------------------
-- QUERY TEST CASES --
----------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CTEs for testing dates in OBSERVATION_PERIOD, PAYER_PLAN_PERIOD, MEASUREMENT, DRUG_EXPOSURE, CONDITION_OCCURRENCE, PROCEDURE_OCCURRENCE, DEVICE_EXPOSURE --
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--OBSERVATION_PERIOD
WITH o1 AS
(
  SELECT person_id,
         ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY person_id,observation_period_start_date) period_num1,
         observation_period_start_date,
         observation_period_end_date
  FROM CDM_Premier_41.dbo.observation_period
  WHERE person_id = 501
),
o2 AS
(
  SELECT person_id,
         ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY person_id,observation_period_start_date) -1 period_num2,
         observation_period_start_date,
         observation_period_end_date
  FROM CDM_Premier_41.dbo.observation_period
  WHERE person_id = 501
),
test_op AS
(
  SELECT o1.person_id,
         DATEDIFF(d,o1.observation_period_end_date,o2.observation_period_start_date) gap
  FROM o1 o1
    JOIN o2 o2
      ON o1.person_id = o2.person_id
     AND o1.period_num1 = o2.period_num2
),
--PAYER_PLAN_PERIOD
p1 AS
(
  SELECT person_id,
         ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY person_id,payer_plan_period_start_date) period_num1,
         payer_plan_period_start_date,
         payer_plan_period_end_date
  FROM CDM_Premier_41.dbo.payer_plan_period
  WHERE person_id = 601
),
p2 AS
(
  SELECT person_id,
         ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY person_id,payer_plan_period_start_date) -1 period_num2,
         payer_plan_period_start_date,
         payer_plan_period_end_date
  FROM CDM_Premier_41.dbo.payer_plan_period
  WHERE person_id = 601
),
test_ppp AS
(
  SELECT p1.person_id,
         DATEDIFF(d,p1.payer_plan_period_end_date,p2.payer_plan_period_start_date) gap
  FROM p1 p1
    JOIN p2 p2
      ON p1.person_id = p2.person_id
     AND p1.period_num1 = p2.period_num2
),
--MEASUREMENT
cte_raw_m AS
(
  SELECT DISTINCT m.measurement_id,
         m.visit_occurrence_id,
         CASE
           WHEN pb.serv_day = 0 THEN vo.visit_start_date
           WHEN DATEADD(dd,pb.serv_day -1,vo.visit_start_date) < vo.visit_end_date THEN DATEADD(dd,pb.serv_day -1,vo.visit_start_date)
           ELSE vo.visit_end_date
         END measurement_date
  FROM CDM_Premier_41.dbo.measurement m
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON m.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.patbill pb
      ON m.visit_occurrence_id = pb.pat_key
     AND m.measurement_date = (CASE WHEN pb.serv_day = 0 THEN vo.visit_start_date WHEN DATEADD (dd,pb.serv_day -1,vo.visit_start_date) < vo.visit_end_date THEN DATEADD (dd,pb.serv_day -1,vo.visit_start_date) ELSE vo.visit_end_date END)
    JOIN rndusrdhit02.premier.dbo.CHGMSTR B ON pb.STD_CHG_CODE = B.STD_CHG_CODE
    JOIN rndusrdhit02.premier.dbo.hospchg C ON pb.hosp_chg_id = C.hosp_chg_id
  WHERE CONCAT(b.STD_CHG_DESC,' / ',c.HOSP_CHG_DESC) = m.measurement_source_value
  AND   m.person_id = 1001
),
cte_cdm_m AS
(
  SELECT DISTINCT m.measurement_id,
         m.visit_occurrence_id,
         measurement_date--from build
         FROM CDM_Premier_41.dbo.measurement m
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON m.visit_occurrence_id = vo.visit_occurrence_id
  WHERE m.person_id = 1001
),
test_m AS
(
  SELECT *
  FROM (SELECT * FROM cte_raw_m EXCEPT SELECT* FROM cte_cdm_m) a
  UNION ALL
  SELECT *
  FROM (SELECT * FROM cte_cdm_m EXCEPT SELECT* FROM cte_raw_m) b
),
--DRUG_EXPOSURE, patbill
cte_raw_de1 AS
(
  SELECT DISTINCT de.visit_occurrence_id,
         de.drug_exposure_id,
         CASE
           WHEN pb.serv_day = 0 THEN vo.visit_start_date
           WHEN DATEADD(dd,pb.serv_day -1,vo.visit_start_date) < vo.visit_end_date THEN DATEADD(dd,pb.serv_day -1,vo.visit_start_date)
           ELSE vo.visit_end_date
         END drug_exposure_start_date
  FROM CDM_Premier_41.dbo.drug_exposure de
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON de.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.patbill pb
      ON de.visit_occurrence_id = pb.pat_key
     AND de.drug_exposure_start_date = (CASE WHEN pb.serv_day = 0 THEN vo.visit_start_date WHEN DATEADD (dd,pb.serv_day -1,vo.visit_start_date) < vo.visit_end_date THEN DATEADD (dd,pb.serv_day -1,vo.visit_start_date) ELSE vo.visit_end_date END)
    JOIN rndusrdhit02.premier.dbo.CHGMSTR B ON pb.STD_CHG_CODE = B.STD_CHG_CODE
    JOIN rndusrdhit02.premier.dbo.hospchg C ON pb.hosp_chg_id = C.hosp_chg_id
  WHERE CONCAT(b.STD_CHG_DESC,' / ',c.HOSP_CHG_DESC) = de.drug_source_value
  AND   de.person_id = 1103
),
cte_cdm_de1 AS
(
  SELECT DISTINCT de.visit_occurrence_id,
         de.drug_exposure_id,
         de.drug_exposure_start_date
         FROM CDM_Premier_41.dbo.drug_exposure de
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON de.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.patbill pb ON de.visit_occurrence_id = pb.pat_key
    JOIN rndusrdhit02.premier.dbo.CHGMSTR B ON pb.STD_CHG_CODE = B.STD_CHG_CODE
    JOIN rndusrdhit02.premier.dbo.hospchg C ON pb.hosp_chg_id = C.hosp_chg_id
  WHERE CONCAT(b.STD_CHG_DESC,' / ',c.HOSP_CHG_DESC) = de.drug_source_value
  AND   de.person_id = 1103
),
test_de1 AS
(
  SELECT *
  FROM (SELECT * FROM cte_raw_de1 EXCEPT SELECT* FROM cte_cdm_de1) a
  UNION ALL
  SELECT *
  FROM (SELECT * FROM cte_cdm_de1 EXCEPT SELECT* FROM cte_raw_de1) b
),
--DRUG_EXPOSURE, patcpt
cte_de2 AS
(
  SELECT DISTINCT de.visit_occurrence_id,
         de.drug_exposure_id,
         CASE
           WHEN de.drug_exposure_start_date = vo.visit_end_date THEN 'Pass'
           ELSE 'Fail'
         END AS pass_test
  FROM CDM_Premier_41.dbo.drug_exposure de
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON de.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.patcpt pc
      ON de.visit_occurrence_id = pc.pat_key
     AND de.drug_exposure_start_date = vo.visit_end_date
     AND de.drug_source_value = pc.cpt_code
  WHERE de.person_id = 1103
),
test_de2 AS
(
  SELECT * FROM cte_de2 WHERE pass_test = 'Fail'
),
--CONDITION_OCCURRENCE
cte_co AS
(
  SELECT DISTINCT co.visit_occurrence_id,
         co.condition_occurrence_id,
         co.condition_start_date,
         vo.visit_end_date,
         CASE
           WHEN co.condition_start_date = vo.visit_end_date THEN 'Pass'
           ELSE 'Fail'
         END AS pass_test
  FROM CDM_Premier_41.dbo.condition_occurrence co
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON co.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.paticd pic
      ON co.visit_occurrence_id = pic.pat_key
     AND co.condition_start_date = vo.visit_end_date
     AND co.condition_source_value = pic.icd_code
  WHERE co.person_id = 1308
),
test_co AS
(
  SELECT * FROM cte_de2 WHERE pass_test = 'Fail'
),
--PROCEDURE_OCCURRENCE, patbill
cte_raw_po1 AS
(
  SELECT DISTINCT po.procedure_occurrence_id,
         po.visit_occurrence_id,
         po.procedure_concept_id,
         CASE
           WHEN pb.serv_day = 0 THEN vo.visit_start_date
           WHEN DATEADD(dd,pb.serv_day -1,vo.visit_start_date) < vo.visit_end_date THEN DATEADD(dd,pb.serv_day -1,vo.visit_start_date)
           ELSE vo.visit_end_date
         END procedure_date
  FROM CDM_Premier_41.dbo.procedure_occurrence po
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON po.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.patbill pb
      ON po.visit_occurrence_id = pb.pat_key
     AND po.procedure_date = (CASE WHEN pb.serv_day = 0 THEN vo.visit_start_date WHEN DATEADD (dd,pb.serv_day -1,vo.visit_start_date) < vo.visit_end_date THEN DATEADD (dd,pb.serv_day -1,vo.visit_start_date) ELSE vo.visit_end_date END)
    JOIN rndusrdhit02.premier.dbo.CHGMSTR B ON pb.STD_CHG_CODE = B.STD_CHG_CODE
    JOIN rndusrdhit02.premier.dbo.hospchg C ON pb.hosp_chg_id = C.hosp_chg_id
  WHERE CONCAT(b.STD_CHG_DESC,' / ',c.HOSP_CHG_DESC) = po.procedure_source_value
  AND   po.person_id = 1405
),
cte_cdm_po1 AS
(
  SELECT DISTINCT po.procedure_occurrence_id,
         po.visit_occurrence_id,
         po.procedure_concept_id,
         po.procedure_date
  FROM CDM_Premier_41.dbo.procedure_occurrence po
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON po.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.patbill pb ON po.visit_occurrence_id = pb.pat_key
    JOIN rndusrdhit02.premier.dbo.CHGMSTR B ON pb.STD_CHG_CODE = B.STD_CHG_CODE
    JOIN rndusrdhit02.premier.dbo.hospchg C ON pb.hosp_chg_id = C.hosp_chg_id
  WHERE CONCAT(b.STD_CHG_DESC,' / ',c.HOSP_CHG_DESC) = po.procedure_source_value
  AND   po.person_id = 1405
),
test_po1 AS
(
  SELECT *
  FROM (SELECT * FROM cte_raw_po1 EXCEPT SELECT* FROM cte_cdm_po1) a
  UNION ALL
  SELECT *
  FROM (SELECT * FROM cte_cdm_po1 EXCEPT SELECT* FROM cte_raw_po1) b
),
--PROCEDURE_OCCURRENCE, patcpt
cte_po2 AS
(
  SELECT DISTINCT po.procedure_occurrence_id,
         po.visit_occurrence_id,
         po.procedure_concept_id,
         CASE
           WHEN po.procedure_date = vo.visit_end_date THEN 'Pass'
           ELSE 'Fail'
         END AS pass_test
  FROM CDM_Premier_41.dbo.procedure_occurrence po
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON po.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.patcpt pc
      ON po.visit_occurrence_id = pc.pat_key
     AND po.procedure_date = vo.visit_end_date
     AND po.procedure_source_value = pc.cpt_code
  WHERE po.person_id = 1405
),
test_po2 AS
(
  SELECT * FROM cte_po2 WHERE pass_test = 'Fail'
),
--PROCEDURE_OCCURRENCE, paticd
cte_po3 AS
(
  SELECT DISTINCT po.procedure_occurrence_id,
         po.visit_occurrence_id,
         po.procedure_concept_id,
         CASE
           WHEN po.procedure_date = vo.visit_end_date THEN 'Pass'
           ELSE 'Fail'
         END AS pass_test
  FROM CDM_Premier_41.dbo.procedure_occurrence po
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON po.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.paticd pic
      ON po.visit_occurrence_id = pic.pat_key
     AND po.procedure_date = vo.visit_end_date
     AND po.procedure_source_value = pic.icd_code
  WHERE po.person_id = 1405
),
test_po3 AS
(
  SELECT * FROM cte_po3 WHERE pass_test = 'Fail'
),
--DEVICE_EXPOSURE, patbill
cte_raw_dv1 AS
(
  SELECT DISTINCT dv.device_exposure_id,
         dv.visit_occurrence_id,
         dv.device_concept_id,
         CASE
           WHEN pb.serv_day = 0 THEN vo.visit_start_date
           WHEN DATEADD(dd,pb.serv_day -1,vo.visit_start_date) < vo.visit_end_date THEN DATEADD(dd,pb.serv_day -1,vo.visit_start_date)
           ELSE vo.visit_end_date
         END device_exposure_st_date
  FROM CDM_Premier_41.dbo.device_exposure dv
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON dv.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.patbill pb
      ON dv.visit_occurrence_id = pb.pat_key
     AND dv.device_exposure_start_date = (CASE WHEN pb.serv_day = 0 THEN vo.visit_start_date WHEN DATEADD (dd,pb.serv_day -1,vo.visit_start_date) < vo.visit_end_date THEN DATEADD (dd,pb.serv_day -1,vo.visit_start_date) ELSE vo.visit_end_date END)
    JOIN rndusrdhit02.premier.dbo.CHGMSTR B ON pb.STD_CHG_CODE = B.STD_CHG_CODE
    JOIN rndusrdhit02.premier.dbo.hospchg C ON pb.hosp_chg_id = C.hosp_chg_id
  WHERE CONCAT(b.STD_CHG_DESC,' / ',c.HOSP_CHG_DESC) = dv.device_source_value
  AND   dv.person_id = 1603
),
cte_cdm_dv1 AS
(
  SELECT DISTINCT dv.device_exposure_id,
         dv.visit_occurrence_id,
         dv.device_concept_id,
         dv.device_exposure_start_date
  FROM CDM_Premier_41.dbo.device_exposure dv
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON dv.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.patbill pb ON dv.visit_occurrence_id = pb.pat_key
    JOIN rndusrdhit02.premier.dbo.CHGMSTR B ON pb.STD_CHG_CODE = B.STD_CHG_CODE
    JOIN rndusrdhit02.premier.dbo.hospchg C ON pb.hosp_chg_id = C.hosp_chg_id
  WHERE CONCAT(b.STD_CHG_DESC,' / ',c.HOSP_CHG_DESC) = dv.device_source_value
  AND   dv.person_id = 1603
),
test_dv1 AS
(
  SELECT *
  FROM (SELECT * FROM cte_raw_dv1 EXCEPT SELECT* FROM cte_cdm_dv1) a
  UNION ALL
  SELECT *
  FROM (SELECT * FROM cte_cdm_dv1 EXCEPT SELECT* FROM cte_raw_dv1) b
),
cte_dv2 AS
(
  SELECT DISTINCT dv.device_exposure_id,
         dv.visit_occurrence_id,
         dv.device_concept_id,
         CASE
           WHEN dv.device_exposure_start_date = vo.visit_end_date THEN 'Pass'
           ELSE 'Fail'
         END AS pass_test
  FROM CDM_Premier_41.dbo.device_exposure dv
    JOIN CDM_Premier_41.dbo.visit_occurrence vo ON dv.visit_occurrence_id = vo.visit_occurrence_id
    JOIN rndusrdhit02.premier.dbo.patcpt pc
      ON dv.visit_occurrence_id = pc.pat_key
     AND dv.device_exposure_start_date = vo.visit_end_date
     AND dv.device_source_value = pc.cpt_code
  WHERE dv.person_id = 1603
),
test_dv2 AS
(
  SELECT * FROM cte_dv2 WHERE pass_test = 'Fail'
)
--------------------
-- 01. CDM_SOURCE -- N/A
--------------------
----------------
-- 02. PERSON --
----------------
-- Invalid gender
SELECT DISTINCT tc.*,
       CASE
         WHEN p.person_id = 201 AND p.gender_concept_id = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.person p ON tc.person_id = p.person_id
WHERE tc.person_id = 201
UNION
-- Multiple genders
-- Year of birth before 1900
-- Year of birth after current year 
-- Year of birth spans > 2 years
SELECT DISTINCT tc.*,
       CASE
         WHEN p.person_id IN (202,203,204,205) THEN 'Fail'
         ELSE 'Pass'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.person p ON tc.person_id = p.person_id
WHERE tc.person_id IN (202,203,204,205)
UNION
-- Invalid race
SELECT DISTINCT tc.*,
       CASE
         WHEN p.person_id = 206 AND p.race_concept_id = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.person p ON tc.person_id = p.person_id
WHERE tc.person_id = 206
UNION
-- Multiple races
SELECT DISTINCT tc.*,
       CASE
         WHEN p.person_id = 207 AND p.race_concept_id = 8527 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.person p ON tc.person_id = p.person_id
WHERE tc.person_id = 207
UNION
-- Valid ethnicity
SELECT DISTINCT tc.*,
       CASE
         WHEN p.person_id = 208 AND p.race_concept_id = 8522 AND p.ethnicity_concept_id = 38003563 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.person p ON tc.person_id = p.person_id
WHERE tc.person_id = 208
UNION
-- TODO!
-- Invalid ethnicity, A person with CDM ethnicity Hispanic and source race not Hispanic'
-- Year of birth after observation start by > 2 years 
--------------------------
-- 03. VISIT_OCCURRENCE --
--------------------------
-- Valid visit type, ER 1
-- Valid visit type, ER 2
-- Valid visit type, ER 3
SELECT DISTINCT tc.*,
       CASE
         WHEN v.person_id IN (301,302,303) AND v.visit_concept_id = 9203 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.visit_occurrence v ON tc.person_id = v.person_id
WHERE tc.person_id IN (301,302,303)
UNION
-- Valid visit type, Inpatient
SELECT DISTINCT tc.*,
       CASE
         WHEN v.person_id = 304 AND v.visit_concept_id = 9201 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.visit_occurrence v ON tc.person_id = v.person_id
WHERE tc.person_id = 304
UNION
-- Valid visit type, Inpatient
SELECT DISTINCT tc.*,
       CASE
         WHEN v.person_id = 305 AND v.visit_concept_id = 9202 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.visit_occurrence v ON tc.person_id = v.person_id
WHERE tc.person_id = 305
UNION
-------------------
-- 4. VISIT COST --
-------------------
---------------------------
-- 5. OBSERVATION_PERIOD --
---------------------------
-- Observation periods >31 days apart (i.e. no overlapping)
SELECT DISTINCT tc.*,
       CASE
         WHEN t.gap < 31 THEN 'Fail'
         ELSE 'Pass'
       END pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  JOIN test_op t ON tc.person_id = t.person_id
UNION
--------------------------
-- 6. PAYER_PLAN_PERIOD --
--------------------------
-- Payer plan periods >1 day apart (i.e. no overlapping)
SELECT DISTINCT tc.*,
       CASE
         WHEN t.gap < 1 THEN 'Fail'
         ELSE 'Pass'
       END pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  JOIN test_ppp t ON tc.person_id = t.person_id
UNION
--------------
-- 7. DEATH --
--------------
-- Valid death type concept ID, from discharge status
SELECT DISTINCT tc.*,
       CASE
         WHEN d.person_id = 701 AND d.death_type_concept_id = 38003566 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.death d ON tc.person_id = d.person_id
WHERE tc.person_id = 701
UNION
-- Valid death type concept ID, from ICD code
SELECT DISTINCT tc.*,
       CASE
         WHEN d.person_id = 702 AND d.death_type_concept_id = 38003567 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.death d ON tc.person_id = d.person_id
WHERE tc.person_id = 702
UNION
--------------------
-- 8. OBSERVATION --
--------------------
-- Valid marital status record
SELECT DISTINCT tc.*,
       CASE
         WHEN o.person_id = 801 AND o.observation_concept_id = 4053609 AND o.value_as_string = 'Single' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.observation o ON tc.person_id = o.person_id
WHERE tc.person_id = 801
AND   o.observation_source_concept_id = 0
UNION
-- Valid point of origin record
SELECT DISTINCT tc.*,
       CASE
         WHEN o.person_id = 802 AND o.observation_concept_id = 40757183 AND o.value_as_string = 'Clinic' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.observation o ON tc.person_id = o.person_id
WHERE tc.person_id = 802
AND   o.observation_source_concept_id = 0
UNION
-- Valid discharge record
SELECT DISTINCT tc.*,
       CASE
         WHEN o.person_id = 803 AND o.observation_concept_id = 40757177 AND o.value_as_string = 'DISCHARGED TO HOME OR SELF CARE' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.observation o ON tc.person_id = o.person_id
WHERE tc.person_id = 803
AND   o.observation_source_concept_id = 0
UNION
-- Valid patient type
SELECT DISTINCT tc.*,
       CASE
         WHEN o.person_id = 804 AND o.observation_concept_id = 40769091 AND o.value_as_string = 'Chemical Dependency' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.observation o ON tc.person_id = o.person_id
WHERE tc.person_id = 804
AND   o.observation_source_concept_id = 0
UNION
-- Valid DRG record
SELECT DISTINCT tc.*,
       CASE
         WHEN o.person_id = 805 AND o.observation_concept_id = 38000951 AND o.observation_source_value = '078' AND o.observation_source_concept_id = 38000951 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.observation o ON tc.person_id = o.person_id
WHERE tc.person_id = 805
UNION
-- Valid ICD9CM record
SELECT DISTINCT tc.*,
       CASE
         WHEN o.person_id = 806 AND o.observation_concept_id = 434630 AND o.observation_source_value = '327.3' AND o.observation_source_concept_id = 44819571 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.observation o ON tc.person_id = o.person_id
WHERE tc.person_id = 806
UNION
-- Valid CPT4 record
SELECT DISTINCT tc.*,
       CASE
         WHEN o.person_id = 807 AND o.observation_concept_id = 42742446 AND o.observation_source_value = '4500F' AND o.observation_source_concept_id = 42742446 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.observation o ON tc.person_id = o.person_id
WHERE tc.person_id = 807
UNION
-- Valid charge code
SELECT DISTINCT tc.*,
       CASE
         WHEN o.person_id = 808 AND o.observation_concept_id = 40268267 AND o.observation_source_value = 'RECONST CADAVER/LIVING DONOR RENAL,URETERAL ANAST / LIV CADV DONOR' AND o.observation_source_concept_id = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.observation o ON tc.person_id = o.person_id
WHERE tc.person_id = 808
UNION
-----------------
-- 9. SPECIMEN -- N/A
-----------------
--------------------
--10. MEASUREMENT --
--------------------
--from patbill
SELECT DISTINCT tc.*,
       CASE
         WHEN (SELECT COUNT(*) FROM test_m) = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
WHERE tc.person_id = 1001
UNION
-----------------------
-- 11. DRUG_EXPOSURE --
-----------------------
-- Valid drug concept, drug source value from PATBILL
SELECT DISTINCT tc.*,
       CASE
         WHEN de.person_id = 1101 AND de.visit_occurrence_id = 11001 AND de.drug_concept_id = 753626 AND de.drug_source_value = 'PROPOFOL MISC / $PROPOFOL INJ.' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.drug_exposure de ON tc.person_id = de.person_id
WHERE tc.person_id = 1101
UNION
-- Accurate drug exposure start date, patbill
SELECT DISTINCT tc.*,
       CASE
         WHEN (SELECT COUNT(*) FROM test_de1) = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
WHERE tc.person_id = 1103
AND   tc.test_description = 'Person exposed to drugs from patbill'
UNION
-- Accurate drug exposure start date, patcpt
SELECT DISTINCT tc.*,
       CASE
         WHEN (SELECT COUNT(*) FROM test_de2) = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
WHERE tc.person_id = 1103
AND   tc.test_description = 'Person exposed to drugs from patcpt'
UNION
-- Accurate drug exposure start date, paticd
-------------------
-- 12. DRUG_COST --
-------------------
-- 12.01, Accurate drug cost
SELECT DISTINCT tc.*,
       CASE
         WHEN de.person_id = 1201 AND de.visit_occurrence_id = 12001 AND dc.total_paid IN (20.10,29.20,49.10) THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.drug_exposure de ON tc.person_id = de.person_id
  LEFT JOIN CDM_Premier_41.dbo.drug_cost dc ON de.drug_exposure_id = dc.drug_exposure_id
WHERE tc.person_id = 1201
UNION
------------------------------
-- 13. CONDITION_OCCURRENCE --
------------------------------
-- 13.01, Valid condition concept, condition source code
SELECT DISTINCT tc.*,
       CASE
         WHEN co.person_id = 1301 AND co.condition_concept_id = 4105330 AND co.condition_source_value = '295.92' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.condition_occurrence co ON tc.person_id = co.person_id
WHERE tc.person_id = 1301
UNION
--condition occurrence start date
SELECT DISTINCT tc.*,
       CASE
         WHEN (SELECT COUNT(*) FROM test_co) = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
WHERE tc.person_id = 1308
UNION
------------------------------
-- 14. PROCEDURE_OCCURRENCE --
------------------------------
-- Valid procedure concept
SELECT DISTINCT tc.*,
       CASE
         WHEN po.person_id = 1401 AND po.procedure_concept_id IN (2109141,2002908,0) THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.procedure_occurrence po ON tc.person_id = po.person_id
WHERE tc.person_id = 1401
UNION
-- Procedure source value, from billing record only
SELECT DISTINCT tc.*,
       CASE
         WHEN po.person_id = 1402 AND po.procedure_concept_id = 0 AND po.procedure_source_value = 'MRI PELVIS W/ CONTRAST / MRI PELVIS' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.procedure_occurrence po ON tc.person_id = po.person_id
WHERE tc.person_id = 1402
UNION
-- Procedure source value, from ICD9Proc only
SELECT DISTINCT tc.*,
       CASE
         WHEN po.person_id = 1403 AND po.procedure_concept_id = 2006959 AND po.procedure_source_value = '88.94' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.procedure_occurrence po ON tc.person_id = po.person_id
WHERE tc.person_id = 1403
UNION
-- Procedure source value, from CPT4 only
SELECT DISTINCT tc.*,
       CASE
         WHEN po.person_id = 1404 AND po.procedure_concept_id = 2211383 AND po.procedure_source_value = '71551' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.procedure_occurrence po ON tc.person_id = po.person_id
WHERE tc.person_id = 1404
UNION
-- Procedure start date, patbill
SELECT DISTINCT tc.*,
       CASE
         WHEN (SELECT COUNT(*) FROM test_po1) = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
WHERE tc.person_id = 1405
AND   tc.test_description = 'Procedure occurrence start date, patbill'
UNION
-- Procedure start date, patcpt
SELECT DISTINCT tc.*,
       CASE
         WHEN (SELECT COUNT(*) FROM test_po2) = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
WHERE tc.person_id = 1405
AND   tc.test_description = 'Procedure occurrence start date, patcpt'
UNION
-- Procedure start date, paticd
SELECT DISTINCT tc.*,
       CASE
         WHEN (SELECT COUNT(*) FROM test_po3) = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
WHERE tc.person_id = 1405
AND   tc.test_description = 'Procedure occurrence start date, paticd'
UNION
------------------------
-- 15. PROCEDURE_COST --
------------------------
-- 15.01, Accurate procedure cost
SELECT DISTINCT tc.*,
       CASE
         WHEN po.person_id = 1501 AND po.procedure_concept_id = 4199899 AND pc.total_paid = 50000 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.procedure_occurrence po ON tc.person_id = po.person_id
  LEFT JOIN CDM_Premier_41.dbo.procedure_cost pc ON po.procedure_occurrence_id = pc.procedure_occurrence_id
WHERE tc.person_id = 1501
UNION
-------------------------
-- 16. DEVICE_EXPOSURE --
-------------------------
-- 16.01, Valid device concept, device source value from PATBILL
SELECT DISTINCT tc.*,
       CASE
         WHEN dve.person_id = 1601 AND dve.visit_occurrence_id = 16001 AND dve.device_concept_id = 4041473 AND dve.device_source_value = 'GENERATOR PACEMAKER PULSE / pacemaker' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.device_exposure dve ON tc.person_id = dve.person_id
WHERE tc.person_id = 1601
UNION
-- 16.02, Valid device concept, device source value from PATCPT
SELECT DISTINCT tc.*,
       CASE
         WHEN dve.person_id = 1602 AND dve.visit_occurrence_id = 16002 AND dve.device_concept_id = 2615859 AND dve.device_source_value = 'C1880' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.device_exposure dve ON tc.person_id = dve.person_id
WHERE tc.person_id = 1602
UNION
-- Device exposure start date, patbill
SELECT DISTINCT tc.*,
       CASE
         WHEN (SELECT COUNT(*) FROM test_dv1) = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
WHERE tc.person_id = 1603
AND   tc.test_description = 'Device exposure start date, patbill'
UNION
-- Device exposure start date, patcpt
SELECT DISTINCT tc.*,
       CASE
         WHEN (SELECT COUNT(*) FROM test_dv2) = 0 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
WHERE tc.person_id = 1405
AND   tc.test_description = 'Procedure occurrence start date, patcpt'
UNION
---------------------
-- 17. DEVICE_COST --
---------------------
-- 17.01, Accurate device cost
SELECT DISTINCT tc.*,
       CASE
         WHEN dve.person_id = 1701 AND dve.device_concept_id = 45763419 AND dvc.total_paid = 91.10 THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.device_exposure dve ON tc.person_id = dve.person_id
  LEFT JOIN CDM_Premier_41.dbo.device_cost dvc ON dve.device_exposure_id = dvc.device_exposure_id
WHERE tc.person_id = 1701
UNION
--------------
-- 18. NOTE -- N/A
--------------
------------------
-- 19. PROVIDER --
------------------
-- 19.01, Valid admitting provider and specialty
SELECT DISTINCT tc.*,
       CASE
         WHEN p.person_id = 1901 AND vo.visit_occurrence_id = 19001 AND vo.provider_id = 20787287 AND pr.provider_source_value = 4008 AND pr.specialty_source_value = 'Anesthesiology (AN)' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.person p ON tc.person_id = p.person_id
  LEFT JOIN CDM_Premier_41.dbo.visit_occurrence vo ON p.person_id = vo.person_id
  LEFT JOIN CDM_Premier_41.dbo.provider pr ON vo.provider_id = pr.provider_id
WHERE tc.person_id = 1901
UNION
-------------------
-- 20. CARE_SITE --
-------------------
-- 20.01, Valid hospital description
SELECT DISTINCT tc.*,
       CASE
         WHEN p.person_id = 2001 AND vo.visit_occurrence_id = 20001 AND vo.care_site_id = 1642 AND cs.care_site_source_value = 1642 AND cs.place_of_service_source_value = 'Urban_Rural:URBAN Teaching:YES Beds:400' THEN 'Pass'
         ELSE 'Fail'
       END AS pass_test
FROM PREMIER_TEST.dbo.test_cases tc
  LEFT JOIN CDM_Premier_41.dbo.person p ON tc.person_id = p.person_id
  LEFT JOIN CDM_Premier_41.dbo.visit_occurrence vo ON p.person_id = vo.person_id
  LEFT JOIN CDM_Premier_41.dbo.care_site cs ON vo.care_site_id = cs.care_site_id
WHERE tc.person_id = 2001
---------------------------
-- 21. FACT_RELATIONSHIP -- N/A
---------------------------
------------------
-- 22. LOCATION -- Values directly from PROVIDERS.PROV_AREA
------------------
----------------
-- 23. COHORT -- N/A
----------------
------------------
-- 24. DRUG_ERA -- N/A
------------------
-----------------------
-- 25. CONDITION_ERA -- N/A
-----------------------
------------------
-- 26. DOSE_ERA -- N/A
------------------
ORDER BY person_id;