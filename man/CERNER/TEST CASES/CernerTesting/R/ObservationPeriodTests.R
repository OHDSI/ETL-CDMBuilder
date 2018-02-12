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

#' Run the observation period tests
#'
#' @export


createObservationPeriodTests <- function () {

  #patient_type_id = 87 = Inpatient
  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  encounter2 <- createEncounter()
  declareTest("Patient has two encounters 0 days apart, one observation_period created", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-16 10:23:00", discharged_dt_tm = "2010-01-20 10:23:00", patient_type_id = "87")
  add_hf_f_encounter(encounter_id = encounter2$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-20 10:23:00", discharged_dt_tm = "2010-01-22 10:23:00", patient_type_id = "87")
  expect_observation_period(person_id = patientSk$person_id, observation_period_start_date = '1/16/2010', observation_period_end_date = '1/22/2010')

  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  encounter2 <- createEncounter()
  declareTest("Patient has two encounters 3 days apart, two observation_periods created", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-16 10:23:00", discharged_dt_tm = "2010-01-20 10:23:00", patient_type_id = "87")
  add_hf_f_encounter(encounter_id = encounter2$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-01-23 10:23:00", discharged_dt_tm = "2010-01-25 10:23:00", patient_type_id = "87")
  expect_observation_period(person_id = patientSk$person_id, observation_period_start_date = '1/16/2010', observation_period_end_date = '1/20/2010')
  expect_observation_period(person_id = patientSk$person_id, observation_period_start_date = '1/23/2010', observation_period_end_date = '1/25/2010')

  #patient_type_id = 90 = long term care, 1 observation period
  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  declareTest("Patient has one encounter across the end of a year, one observation_period created", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2015-12-14 19:58:00", discharged_dt_tm = "2016-01-07 18:30:00", patient_type_id = "90")
  expect_observation_period(person_id = patientSk$person_id, observation_period_start_date = '12/14/2015', observation_period_end_date = '1/07/2016')

  #patient_type_id = 90 = long term care, 3 observation periods
  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  encounter2 <- createEncounter()
  encounter3 <- createEncounter()
  declareTest("Patient has 3 encounters 3 across 3 months, 3 observation_periods created", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-05-05 20:41:00", discharged_dt_tm = "2010-05-16 09:05:00", patient_type_id = "90")
  add_hf_f_encounter(encounter_id = encounter2$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-07-02 15:57:00", discharged_dt_tm = "2010-07-16 11:40:00", patient_type_id = "90")
  add_hf_f_encounter(encounter_id = encounter3$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2010-06-03 15:14:00", discharged_dt_tm = "2010-07-01 10:15:00", patient_type_id = "90")
  expect_observation_period(person_id = patientSk$person_id, observation_period_start_date = '05/05/2010', observation_period_end_date = '05/16/2010')
  expect_observation_period(person_id = patientSk$person_id, observation_period_start_date = '07/02/2010', observation_period_end_date = '07/16/2010')
  expect_observation_period(person_id = patientSk$person_id, observation_period_start_date = '06/03/2010', observation_period_end_date = '07/01/2010')

  #patient_type_id = 99 = outpatient surgery, 1 observation period
  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  declareTest("Patient has one encounter 0 days apart, one observation_period created", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2000-02-02 06:26:00", discharged_dt_tm = "2000-02-02 06:26:00", patient_type_id = "90")
  expect_observation_period(person_id = patientSk$person_id, observation_period_start_date = '02/02/2000', observation_period_end_date = '02/02/2000')

  #patient_type_id = 82 = Dialysis, 1 observation period
  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  declareTest("Patient has one encounter 1 day apart, one observation_period created", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2002-03-22 13:16:00", discharged_dt_tm = "2002-03-22 13:16:00", patient_type_id = "90")
  expect_observation_period(person_id = patientSk$person_id, observation_period_start_date = '03/22/2002', observation_period_end_date = '03/22/2002')

  #hospice patient with 2 observation periods - june and september
  patientSk <- createPatient()
  patientId <- createPatientId()
  encounter1 <- createEncounter()
  encounter2 <- createEncounter()
  declareTest("Patient has two encounters 3 months apart, two observation_periods created", source_pid = patientSk$patient_sk, cdm_pid = patientSk$person_id)
  add_hf_d_patient(patient_id = patientId$patient_id, patient_sk = patientSk$patient_sk)
  add_hf_f_encounter(encounter_id = encounter1$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2006-09-08 18:10:00", discharged_dt_tm = "2006-09-10 11:00:00", patient_type_id = "86")
  add_hf_f_encounter(encounter_id = encounter2$encounter_id, patient_id = patientId$patient_id, admitted_dt_tm = "2006-06-02 19:10:00", discharged_dt_tm = "2006-06-06 19:00:00", patient_type_id = "86")
  expect_observation_period(person_id = patientSk$person_id, observation_period_start_date = '09/08/2006', observation_period_end_date = '09/10/2006')
  expect_observation_period(person_id = patientSk$person_id, observation_period_start_date = '06/02/2006', observation_period_end_date = '06/06/2006')


}
