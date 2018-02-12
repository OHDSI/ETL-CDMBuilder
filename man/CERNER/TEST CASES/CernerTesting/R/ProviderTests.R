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

#' Run the provider tests
#'
#' @export

createProviderTests <- function () {

  provider <- createProvider()
  declareTest("Provider has medical specialty Internal Medicine")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Internal Medicine")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004456, specialty_source_value = "Internal Medicine")

  provider <- createProvider()
  declareTest("Provider has medical specialty Not a Medical Speciality")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Not a Medical Speciality")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004514, specialty_source_value = "Not a Medical Speciality")

  provider <- createProvider()
  declareTest("Provider has medical specialty Family/General Practice")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Family/General Practice")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004453, specialty_source_value = "Family/General Practice")

  provider <- createProvider()
  declareTest("Provider has medical specialty Other")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Other")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004514, specialty_source_value = "Other")

  provider <- createProvider()
  declareTest("Provider has medical specialty Undefined / Unknown")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Undefined / Unknown")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004514, specialty_source_value = "Undefined / Unknown")

  provider <- createProvider()
  declareTest("Provider has medical specialty Pediatrics")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Pediatrics")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004477, specialty_source_value = "Pediatrics")

  provider <- createProvider()
  declareTest("Provider has medical specialty Emergency/Trauma")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Emergency/Trauma")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004510, specialty_source_value = "Emergency/Trauma")

  provider <- createProvider()
  declareTest("Provider has medical specialty Radiology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Radiology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 45756825, specialty_source_value = "Radiology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Obstetrics and Gynecology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Obstetrics and Gynecology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004461, specialty_source_value = "Obstetrics and Gynecology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Anesthesiology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Anesthesiology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004450, specialty_source_value = "Anesthesiology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Surgery, General")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Surgery, General")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004447, specialty_source_value = "Surgery, General")

  provider <- createProvider()
  declareTest("Provider has medical specialty DCPTEAM")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "DCPTEAM")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004514, specialty_source_value = "DCPTEAM")

  provider <- createProvider()
  declareTest("Provider has medical specialty Orthopedics")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Orthopedics")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004465, specialty_source_value = "Orthopedics")

  provider <- createProvider()
  declareTest("Provider has medical specialty Cardiology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Cardiology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004451, specialty_source_value = "Cardiology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Radiologist")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Radiologist")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 45756825, specialty_source_value = "Radiologist")

  provider <- createProvider()
  declareTest("Provider has medical specialty Psychiatry")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Psychiatry")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004469, specialty_source_value = "Psychiatry")

  provider <- createProvider()
  declareTest("Provider has medical specialty Gastroenterology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Gastroenterology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004455, specialty_source_value = "Gastroenterology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Ophthalmology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Ophthalmology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004463, specialty_source_value = "Ophthalmology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Neurology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Neurology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004458, specialty_source_value = "Neurology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Dentistry") #can't find a standard concept for this in the provider table'
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Dentistry")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 43125856, specialty_source_value = "Dentistry")

  provider <- createProvider()
  declareTest("Provider has medical specialty Urology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Urology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004474, specialty_source_value = "Urology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Family Practice")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Family Practice")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004453, specialty_source_value = "Family Practice")

  provider <- createProvider()
  declareTest("Provider has medical specialty Gynecology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Gynecology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004461, specialty_source_value = "Gynecology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Otolaryngology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Otolaryngology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004449, specialty_source_value = "Otolaryngology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Obstetrics")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Obstetrics")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004461, specialty_source_value = "Obstetrics")

  provider <- createProvider()
  declareTest("Provider has medical specialty Hematology/Oncology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Hematology/Oncology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004502, specialty_source_value = "Hematology/Oncology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Pulmonology")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Pulmonology")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004472, specialty_source_value = "Pulmonology")

  provider <- createProvider()
  declareTest("Provider has medical specialty Student")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Student")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 4277918, specialty_source_value = "Student")

  provider <- createProvider()
  declareTest("Provider has medical specialty Podiatry")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Podiatry")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004486, specialty_source_value = "Podiatry")

  provider <- createProvider()
  declareTest("Provider has medical specialty Surgeon")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Surgeon")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004447, specialty_source_value = "Surgeon")

  provider <- createProvider()
  declareTest("Provider has medical specialty Orthopedics, Reconstructive")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Orthopedics, Reconstructive")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004465, specialty_source_value = "Orthopedics, Reconstructive")

  provider <- createProvider()
  declareTest("Provider has medical specialty Surgery, Plastic") #couldn't find specialty provider concept
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Surgery, Plastic")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004467, specialty_source_value = "Surgery, Plastic")

  provider <- createProvider()
  declareTest("Provider has medical specialty Hospitalist")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Hospitalist")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004515, specialty_source_value = "Hospitalist")

  provider <- createProvider()
  declareTest("Provider has medical specialty Health Care Provider")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Health Care Provider") #not sure this is the best option
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004514, specialty_source_value = "Health Care Provider")


  provider <- createProvider()
  declareTest("Provider has medical specialty Surgery, Neuro")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Surgery, Neuro")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004459, specialty_source_value = "Surgery, Neuro")

  provider <- createProvider()
  declareTest("Provider has medical Physical Medicine and Rehabilitation")
  add_hf_d_physician(physician_id = provider$physician_id, medical_specialty = "Physical Medicine and Rehabilitation")
  expect_provider(provider_id = provider$provider_id, specialty_concept_id = 38004468, specialty_source_value = "Physical Medicine And Rehabilitation")

}
