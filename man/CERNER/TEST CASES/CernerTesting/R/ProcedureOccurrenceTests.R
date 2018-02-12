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

#' Run the procedure occurrence tests
#'
#' @export


createProcedureOccurrenceTests <- function () {

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has ICD10PCS code in hf_f_procedure and procedure priority = 1", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_d_procedure(procedure_id = '108701', procedure_type = 'ICD10-PCS', procedure_code = '04QW3ZZ', procedure_description = 'Repair Left Foot Artery, Percutaneous Approach')
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "87", admitted_dt_tm = "2012-05-07 10:23:00", discharged_dt_tm = "2012-05-07 10:23:00")
  add_hf_f_procedure(encounter_id = encounter$encounter_id, procedure_id = "108701", procedure_dt_tm = "2012-05-07 10:58:00", procedure_priority = "1")
  expect_procedure_occurrence(person_id = patientSk$person_id, procedure_concept_id = 2729909, procedure_date = "2012-05-07", procedure_type_concept_id = 38000251)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has CPT4 code in hf_f_procedure and procedure priority = 3", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_d_procedure(procedure_id = '9160', procedure_type = 'CPT4', procedure_code = '37200', procedure_description = 'Transcatheter biopsy')
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "98", admitted_dt_tm = "2012-05-12 10:23:00", discharged_dt_tm = "2012-05-12 20:23:00")
  add_hf_f_procedure(encounter_id = encounter$encounter_id, procedure_id = "9160", procedure_dt_tm = "2012-05-12 10:30:00", procedure_priority = "3")
  expect_procedure_occurrence(person_id = patientSk$person_id, procedure_concept_id = 2108329, procedure_date = "2012-05-12", procedure_type_concept_id = 38000271)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has procedure code in hf_f_clinical_event", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id,  patient_type_id = "98", admitted_dt_tm = "2000-08-29 10:00:00", discharged_dt_tm = "2000-08-29 10:50:00")
  add_hf_f_clinical_event(encounter_id = encounter$encounter_id, event_code_id = "742", event_start_dt_tm = "2000-08-29 10:23:00")
  expect_procedure_occurrence(person_id = patientSk$person_id, procedure_concept_id = 2007077, procedure_type_concept_id = 45754805)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has procedure code in hf_f_diagnosis", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_diagnosis(diagnosis_id = "15110", diagnosis_type = "ICD9-CM", diagnosis_code = "V73.4", diagnosis_description = "Yellow Fever Screening")
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "98", admitted_dt_tm = "2000-08-29 10:23:00", discharged_dt_tm = "2000-08-29 10:23:00")
  add_hf_f_diagnosis(encounter_id = encounter$encounter_id, diagnosis_id = "15110")
  expect_procedure_occurrence(person_id = patientSk$person_id, procedure_concept_id = 4064902)

}
