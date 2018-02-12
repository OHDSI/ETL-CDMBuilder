# Copyright 2017 Observational Health Data Sciences and Informatics
#
# This file is part of the CernerTesting package
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#' Write the visit occurrence tests
#'
#' @export

createVisitOccurrenceTests <- function () {

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  encounter2 <- createEncounter()
  declareTest("Patient has two IP encounters 0 days apart, one visit created", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-16 10:23:00", discharged_dt_tm = "2010-01-20 10:23:00", patient_type_id = "87")
  add_hf_f_encounter(encounter_id = encounter2$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-20 10:23:00", discharged_dt_tm = "2010-01-22 10:23:00", patient_type_id = "87")
  expect_visit_occurrence(person_id = patientSk$person_id, visit_start_date = '1/16/2010', visit_end_date = '1/22/2010', visit_concept_id = 9201)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  encounter2 <- createEncounter()
  declareTest("Patient has two IP encounters >0 days apart, two visits created", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-16 10:23:00", discharged_dt_tm = "2010-01-20 10:23:00", patient_type_id = "87")
  add_hf_f_encounter(encounter_id = encounter2$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-25 10:23:00", discharged_dt_tm = "2010-01-27 10:23:00", patient_type_id = "87")
  expect_visit_occurrence(person_id = patientSk$person_id, visit_start_date = '1/16/2010', visit_end_date = '1/20/2010', visit_concept_id = 9201)
  expect_visit_occurrence(person_id = patientSk$person_id, visit_start_date = '1/25/2010', visit_end_date = '1/27/2010', visit_concept_id = 9201)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  encounter2 <- createEncounter()
  provider1 <- createProvider()
  provider2 <- createProvider()
  declareTest("Patient has two IP encounters 0 days apart, one visit created with the earlier physician id", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_d_physician(physician_id = provider1$physician_id)
  add_hf_d_physician(physician_id = provider2$physician_id)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-16 10:23:00", discharged_dt_tm = "2010-01-20 10:23:00", patient_type_id = "87", admitting_physician_id = provider1$physician_id)
  add_hf_f_encounter(encounter_id = encounter2$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-20 10:23:00", discharged_dt_tm = "2010-01-22 10:23:00", patient_type_id = "87", admitting_physician_id = provider2$physician_id)
  expect_visit_occurrence(person_id = patientSk$person_id, visit_start_date = '1/16/2010', visit_end_date = '1/22/2010', visit_concept_id = 9201, provider_id = provider1$provider_id)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  encounter2 <- createEncounter()
  declareTest("Patient has one IP encounter with an OP visit in the middle, one IP visit created", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-02-16 10:23:00", discharged_dt_tm = "2010-02-20 10:23:00", patient_type_id = "87")
  add_hf_f_encounter(encounter_id = encounter2$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-02-18 10:23:00", discharged_dt_tm = "2010-02-18 10:23:00", patient_type_id = "98")
  expect_visit_occurrence(person_id = patientSk$person_id, visit_start_date = '2/16/2010', visit_end_date = '2/20/2010', visit_concept_id = 9201)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  encounter2 <- createEncounter()
  declareTest("Patient has one IP encounter with an ER visit at the beginning, one IP visit and one ER visit created", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-03-02 10:23:00", discharged_dt_tm = "2010-03-05 10:23:00", patient_type_id = "87")
  add_hf_f_encounter(encounter_id = encounter2$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-03-02 10:23:00", discharged_dt_tm = "2010-03-02 10:23:00", patient_type_id = "84")
  expect_visit_occurrence(person_id = patientSk$person_id, visit_start_date = '03/02/2010', visit_end_date = '3/05/2010', visit_concept_id = 9201)
  expect_visit_occurrence(person_id = patientSk$person_id, visit_start_date = '03/02/2010', visit_end_date = '3/02/2010', visit_concept_id = 9203)

}
