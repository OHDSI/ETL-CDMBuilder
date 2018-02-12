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

#' Run the measurement tests
#'
#' @export

createMeasurementTests <- function () {

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has measurement in lab procedure table", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_d_lab_procedure(lab_procedure_id = '1149', lab_procedure_mnemonic = 'Lipid Panel', lab_procedure_name = 'Lipid Panel', lab_procedure_group = 'Lipids Test', lab_super_group = 'General Test', loinc_code = '57698-3')
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "87", admitted_dt_tm = "2012-05-07 10:23:00", discharged_dt_tm = "2012-05-07 10:50:00")
  add_hf_f_lab_procedure(encounter_id = encounter$encounter_id, order_lab_procedure_id = "1149", lab_drawn_dt_tm = "2012-05-07 10:40:00")
  expect_measurement(person_id = patientSk$person_id, measurement_concept_id = 40760809, measurement_date = "2012-05-07", measurement_type_concept_id = 44818702)

 }
