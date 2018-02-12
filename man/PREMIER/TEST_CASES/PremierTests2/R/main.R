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

createPatient <- function() {
  personId = sequencer$nextSequence();
  return (list(medrec_key = personId, person_id = personId));
}

createVisit <- function() {
  visitId = sequencer$nextSequence();
  return (list(pat_key = visitId, visit_occurrence_id = visitId));
}

createProvider <- function() {
  providerId = sequencer$nextSequence();
  return (list(adm_phy = providerId, provider_id = providerId));
}

getTests <- function() {
  source('R/ConditionOccurrenceTests.R')
  source('R/CostTests.R')
  source('R/DeathTests.R')
  source('R/DeviceExposureTests.R')
  source('R/DrugExposureTests.R')
  source('R/LocationTests.R')
  source('R/MeasurementTests.R')
  source('R/ObservationPeriodTests.R')
  source('R/ObservationTests.R')
  source('R/PayerPlanPeriodTests.R')
  source('R/PersonTests.R')
  source('R/ProcedureOccurrenceTests.R')
  source('R/ProviderTests.R')
  source('R/VisitOccurrenceTest.R')
}

source("R/PremierUnitTests.R")

getInsertSql <- function(connectionDetails) {
  return(frameworkContext$insertSql);
}

getTestSql <- function(connectionDetails) {
  return(frameworkContext$testSql);
}
