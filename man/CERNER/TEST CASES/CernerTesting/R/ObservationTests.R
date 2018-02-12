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

#' Run the observation tests
#'
#' @export


createObservationTests <- function () {

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has observation code in hf_f_clinical_event", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "98", admitted_dt_tm = "2000-08-29 10:23:00", discharged_dt_tm = "2000-08-29 11:23:00")
  add_hf_f_clinical_event(encounter_id = encounter$encounter_id, event_code_id = "274", event_start_dt_tm = "2000-08-29 10:50:00", event_end_dt_tm = "2000-08-29 10:59:00")
  expect_observation(person_id = patientSk$person_id, observation_concept_id = 21494887)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has code in hf_f_clinical_event that maps to domain = Observation", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "98", admitted_dt_tm = "2000-08-29 09:23:00", discharged_dt_tm = "2000-08-29 11:23:00")
  add_hf_f_clinical_event(encounter_id = encounter$encounter_id, event_code_id = "159", event_start_dt_tm = "2000-08-29 10:23:00", event_end_dt_tm = "2000-08-29 10:23:00")
  expect_observation(person_id = patientSk$person_id, observation_concept_id = 4201235)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has observation code in hf_f_diagnosis", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_diagnosis(diagnosis_id = "15110", diagnosis_type = "ICD10-CM", diagnosis_code = "V41.2", diagnosis_description = "Problems with Hearing")
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "98", admitted_dt_tm = "2000-08-29 10:23:00", discharged_dt_tm = "2000-08-29 10:23:00")
  add_hf_f_diagnosis(encounter_id = encounter$encounter_id, diagnosis_id = "15110")
  expect_observation(person_id = patientSk$person_id, observation_concept_id = 435134)


}
