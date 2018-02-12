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

#' Run the condition occurrence tests
#'
#' @export

createConditionOccurrenceTests <- function () {

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has diagnosis in hf_f_diagnosis", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_d_diagnosis(diagnosis_id = "148", diagnosis_type = 'ICD9', diagnosis_code = '038.42', diagnosis_description = 'Septicemia Due to Escherichia Coli [E. Coli]')
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2000-02-29 10:23:00", discharged_dt_tm = "2000-02-29 10:23:00", patient_type_id = "87")
  add_hf_f_diagnosis(encounter_id= encounter$encounter_id, diagnosis_id = "148", diagnosis_priority = "1")
  expect_condition_occurrence(person_id = patientSk$person_id, condition_concept_id = 40487064, condition_type_concept_id = 38000200)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has diagnosis in hf_f_diagnosis", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_diagnosis(diagnosis_id = '103761', diagnosis_type = 'ICD10-CM', diagnosis_code = 'M87.112', diagnosis_description = 'Osteonecrosis due to drugs, left shoulder')
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2000-08-29 10:23:00", discharged_dt_tm = "2000-08-30 10:23:00", patient_type_id = "98")
  add_hf_f_diagnosis(encounter_id= encounter$encounter_id, diagnosis_id = "103761", diagnosis_priority = "1")
  expect_condition_occurrence(person_id = patientSk$person_id, condition_concept_id = 46270403, condition_type_concept_id = 38000230)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has code in hf_f_clinical_event that maps to domain = Condition midnight", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "98", admitted_dt_tm = "2000-08-29 10:23:00", discharged_dt_tm = "2000-08-29 10:23:00")
  add_hf_f_clinical_event(encounter_id = encounter$encounter_id, event_code_id = "308", event_start_dt_tm = "2000-08-29 00:00:00", event_end_dt_tm = "2000-08-29 00:00:00")
  expect_condition_occurrence(person_id = patientSk$person_id, condition_concept_id = 27674, condition_type_concept_id = 45754805)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has code in hf_f_clinical_event that maps to domain = Condition", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "98", admitted_dt_tm = "2000-08-29 09:23:00", discharged_dt_tm = "2000-08-29 11:23:00")
  add_hf_f_clinical_event(encounter_id = encounter$encounter_id, event_code_id = "308", event_start_dt_tm = "2000-08-29 10:23:00", event_end_dt_tm = "2000-08-29 10:23:00")
  expect_condition_occurrence(person_id = patientSk$person_id, condition_concept_id = 27674, condition_type_concept_id = 45754805)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has code in hf_f_clinical_event that maps to domain = Condition, lab_procedure_id is blank", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "98", admitted_dt_tm = "2000-08-29 09:23:00", discharged_dt_tm = "2000-08-29 11:23:00")
  add_hf_f_clinical_event(encounter_id = encounter$encounter_id, lab_procedure_id = NULL,  event_code_id = "308", event_start_dt_tm = "2000-08-29 10:23:00", event_end_dt_tm = "2000-08-29 10:23:00")
  expect_condition_occurrence(person_id = patientSk$person_id, condition_concept_id = 27674, condition_type_concept_id = 45754805)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has HCPCS code in hf_f_procedure that maps to domain = Condition midnight", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "87", admitted_dt_tm = "2000-08-29 10:23:00", discharged_dt_tm = "2000-08-29 10:23:00")
  add_hf_f_procedure(encounter_id = encounter$encounter_id, procedure_id = "18890", procedure_dt_tm = "2000-08-29 00:00:00", procedure_priority = "1")
  expect_condition_occurrence(person_id = patientSk$person_id, condition_concept_id = 201820, condition_start_date = "2000-08-29", condition_type_concept_id = 38000251)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has HCPCS code in hf_f_procedure that maps to domain = Condition time outside encounter", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_d_procedure(procedure_id = '18890', procedure_type = 'HCPCS', procedure_code = 'G8019', procedure_description = 'DIABETIC PATIENT WITH MOST RECENT LOW-DENSITY LIPOPROTEIN (WITHIN THE LAST 12 MONTHS) DOCUMENTED AS GREATER THAN OR EQUAL TO 100 MG/DL')
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "87", admitted_dt_tm = "2000-08-29 10:23:00", discharged_dt_tm = "2000-08-29 10:23:00")
  add_hf_f_procedure(encounter_id = encounter$encounter_id, procedure_id = "18890", procedure_dt_tm = "2000-08-29 15:28:30", procedure_priority = "1")
  expect_condition_occurrence(person_id = patientSk$person_id, condition_concept_id = 201820, condition_start_date = "2000-08-29", condition_type_concept_id = 38000251)

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has HCPCS code in hf_f_procedure that maps to domain = Condition time inside encounter", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "87", admitted_dt_tm = "2000-08-29 10:20:00", discharged_dt_tm = "2000-08-29 10:23:00")
  add_hf_f_procedure(encounter_id = encounter$encounter_id, procedure_id = "18890", procedure_dt_tm = "2000-08-29 10:21:00", procedure_priority = "1")
  expect_condition_occurrence(person_id = patientSk$person_id, condition_concept_id = 201820, condition_start_date = "2000-08-29", condition_type_concept_id = 38000251)

}
