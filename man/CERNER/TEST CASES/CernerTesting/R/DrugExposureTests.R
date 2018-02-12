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

#' Run the drug exposure tests
#'
#' @export


createDrugExposureTests <- function () {

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has drug in hf_f_medication", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_d_medication(medication_id = '118619', ndc_code = '52604520002', brand_name = "Levoxyl", generic_name = "levothyroxine", product_strength_description = "0.2 mg", route_description = "oral", dose_form_description = "tablet")
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2011-03-29 10:23:00", discharged_dt_tm = "2011-03-29 12:23:00", patient_type_id = "87")
  add_hf_f_medication(encounter_id= encounter$encounter_id, medication_id = "118619", med_started_dt_tm = "2011-03-29 11:09:00", med_stopped_dt_tm = "2011-03-29 11:09:00")
  expect_drug_exposure(person_id = patientSk$person_id, drug_concept_id = 40175105, drug_exposure_start_date = "2011-03-29", drug_source_value = "52604520002", drug_source_concept_id = 44900017 )

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter <- createEncounter()
  declareTest("Patient has drug code in hf_f_procedure", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_d_procedure(procedure_id = '20522', procedure_type = 'HCPCS', procedure_code = 'J7640', procedure_description = 'FORMOTEROL, INHALATION SOLUTION, COMPOUNDED PRODUCT, ADMINISTERED THROUGH DME, UNIT DOSE FORM, 12 MICROGRAMS')
  add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, patient_type_id = "87", admitted_dt_tm = "2012-05-07 08:23:00", discharged_dt_tm = "2012-05-07 20:23:00")
  add_hf_f_procedure(encounter_id = encounter$encounter_id, procedure_id = "20522", procedure_dt_tm = "2012-05-07 10:58:00", procedure_priority = "1")
  expect_drug_exposure(person_id = patientSk$person_id, drug_concept_id = 42479709, drug_exposure_start_date = "2012-05-07")



}


