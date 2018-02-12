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

#' Set up the functions to be used later
#'
#' @export

getSequence <- function (startValue = 1) {
  counterInstance <- new.env(parent = emptyenv());
  counterInstance$currentValue <- startValue;
  counterInstance$nextSequence <- function()
  {
    nextValue <- counterInstance$currentValue;
    counterInstance$currentValue = counterInstance$currentValue + 1;
    return(nextValue)
  }
  return (counterInstance);
}

sequencer <- getSequence()

#' @export
createPatient <- function() {
  personId = sequencer$nextSequence();
  return (list(patient_sk = personId, person_id = personId));
}

#' @export
createPatientId <- function() {
  personId = sequencer$nextSequence();
  return (list(patient_id = personId));
}

#' @export
createEncounter <- function() {
  encounterId = sequencer$nextSequence();
  return (list(encounter_id = encounterId, visit_occurrence_id = encounterId));
}

#' @export
createProvider <- function() {
  providerId = sequencer$nextSequence();
  return (list(physician_id = providerId, provider_id = providerId));
}

#' @export
createHospital <- function() {
  hospitalId = sequencer$nextSequence();
  return (list(hospital_id = hospitalId));
}

# Use this function to test build errors
# It's challenging to debug errors when a package loads, so disable onLoad
# and export the below when debugging.
#' # export
# testInit <- function() {
#   initFramework()
#   createTests()
# }
#
 .onLoad <- function(libname, pkgname) {
   source('R/CernerTestingFramework_v3.R')
   initFramework()
   #createTests()
 }
