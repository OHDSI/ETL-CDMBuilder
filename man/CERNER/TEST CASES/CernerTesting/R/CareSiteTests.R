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

#' Run the care site tests
#'
#' @export

createCareSiteTests <- function () {

  care_setting <- list(
    list(caresetting_id = "47", place_of_service_concept_id = 0, place_of_service_source_value = "Hepatology - Outpatient"),
    list(caresetting_id = "86", place_of_service_concept_id = 8676, place_of_service_source_value = "Nursing Home (LTC)"),
    list(caresetting_id = "140", place_of_service_concept_id = 4305525, place_of_service_source_value = "Step-Down Unit"),
    list(caresetting_id = "14", place_of_service_concept_id = 45756805, place_of_service_source_value = "Cardiology - Pediatrics")
  )

  for (cs in care_setting)
  {
    hospital <- createHospital()
    patientSk <- createPatient()
    patientId <- createPatientId()
    encounter <- createEncounter()
    declareTest(paste("Hospital has caresetting_id ", cs$caresetting_id, sep = " "))
    add_hf_d_hospital(hospital_id = hospital$hospital_id)
    add_hf_d_caresetting(caresetting_id = cs$caresetting_id, caresetting_desc = cs$place_of_service_source_value)
    add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
    add_hf_f_encounter(encounter_id = encounter$encounter_id, hospital_id = hospital$hospital_id, discharge_caresetting_id = cs$caresetting_id)
    expect_care_site(care_site_source_value = hospital$hospital_id, place_of_service_concept_id = cs$place_of_service_concept_id, place_of_service_source_value = cs$caresetting_id)

  }
}
