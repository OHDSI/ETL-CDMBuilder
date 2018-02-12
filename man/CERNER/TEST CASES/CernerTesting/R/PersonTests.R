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

#' Run the person tests
#'
#' @export

createPersonTests <- function () {

  # Gender

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  declareTest("Patient has gender = Male", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk, gender = "Male")
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-16 10:23:00", discharged_dt_tm = "2010-01-20 10:23:00", patient_type_id = "87")
  expect_person(person_id = patientSk$person_id, gender_concept_id = 8507, gender_source_value = "Male")

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  declareTest("Patient has gender = Female", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk, gender = "Female")
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-16 10:23:00", discharged_dt_tm = "2010-01-20 10:23:00", patient_type_id = "87")
  expect_person(person_id = patientSk$person_id, gender_concept_id = 8532, gender_source_value = "Female")

  patientSk <- createPatient()
  patientId1 <- createPatientId()
  patientId2 <- createPatientId()
  encounter1 <- createEncounter()
  encounter2 <- createEncounter()
  declareTest("Patient has an unknown gender on their most recent record", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId1$patient_id, patient_sk = patientSk$patient_sk, gender = "Male")
  add_hf_d_patient(patient_id = patientId2$patient_id, patient_sk = patientSk$patient_sk, gender = "Unknown")
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId1$patient_id, admitted_dt_tm = "2010-01-16 10:23:00", discharged_dt_tm = "2010-01-20 10:23:00", patient_type_id = "87")
  add_hf_f_encounter(encounter_id = encounter2$encounter_id, patient_id = patientId2$patient_id, admitted_dt_tm = "2010-01-22 10:23:00", discharged_dt_tm = "2010-01-22 10:23:00")
  expect_no_person(person_id = patientSk$person_id)

  # Race

  race <- list(
    list(source = "Caucasian", race_concept_id = 8527),
    list(source = "African American", race_concept_id = 8516),
    list(source = "Hispanic", race_concept_id = 0),
    list(source = "Asian", race_concept_id = 8515),
    list(source = "Native American", race_concept_id = 8657),
    list(source = "Biracial", race_concept_id = 0),
    list(source = "Pacific Islander", race_concept_id = 38003613),
    list(source = "Asian/Pacific Islander", race_concept_id = 38003613),
    list(source = "Mid Eastern Indian", race_concept_id = 38003615),
    list(source = "Other", race_concept_id = 0)
  )

  for (r in race)
  {
    patientSk <- createPatient()
    patientId <- createPatientId()
    encounter <- createEncounter()
    declareTest(paste0("Patient has race value ",r$source), cdm_pid = patientSk$person_id, source_pid = patientSk$patient_sk)
    add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk, race = r$source)
    add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-16 10:23:00", discharged_dt_tm = "2010-01-20 10:23:00", patient_type_id = "87")
    expect_person(person_id = patientSk$person_id, race_concept_id = r$race_concept_id, race_source_value = r$source)
  }

  # Ethnicity

  ethnicity <- list(
    list(source = "Caucasian", ethnicity_concept_id = 38003564),
    list(source = "African American", ethnicity_concept_id = 38003564),
    list(source = "Hispanic", ethnicity_concept_id = 38003563),
    list(source = "Asian", ethnicity_concept_id = 38003564),
    list(source = "Native American", ethnicity_concept_id = 38003564),
    list(source = "Biracial", ethnicity_concept_id = 38003564),
    list(source = "Pacific Islander", ethnicity_concept_id = 38003564),
    list(source = "Asian/Pacific Islander", ethnicity_concept_id = 38003564),
    list(source = "Mid Eastern Indian", ethnicity_concept_id = 38003564),
    list(source = "Other", ethnicity_concept_id =  38003564)
  )

  for (e in ethnicity)
  {
    patientSk <- createPatient()
    patientId <- createPatientId()
    encounter <- createEncounter()
    declareTest(paste0("Patient has ethnicity value ",e$source), cdm_pid = patientSk$person_id, source_pid = patientSk$patient_sk)
    add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk, race = e$source)
    add_hf_f_encounter(encounter_id = encounter$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-16 10:23:00", discharged_dt_tm = "2010-01-20 10:23:00", patient_type_id = "87")
    expect_person(person_id = patientSk$person_id, ethnicity_concept_id = e$ethnicity_concept_id, ethnicity_source_value = e$source)
  }
}
