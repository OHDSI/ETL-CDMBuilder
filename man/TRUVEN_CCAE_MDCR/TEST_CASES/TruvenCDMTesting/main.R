## Function to source the correct testing framework

getSource <- function() {
  if (Sys.getenv("truvenType") =="CCAE") {
    source('R/TruvenCCAE_TestingFramework.R')
  }
  if (Sys.getenv("truvenType") =="MDCR") {
    source('R/TruvenMDCR_TestingFramework.R') 
  }
  else if (Sys.getenv("truvenType")=="MDCD") {
    source('R/TruvenMDCD_TestingFramework.R') 
  }
}

## Functions to create unique patient, encounter and provider ids

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
  return (list(enrolid = personId, person_id = personId));
}

createEncounter <- function() {
  encounterId = sequencer$nextSequence();
  return (list(caseid = encounterId, visit_occurrence_id = encounterId));
}

createProvider <- function() {
  providerId = sequencer$nextSequence();
  return (list(provid = providerId, provider_id = providerId));
}

## Function to source all tests

  getTests <- function() {
  source('R/ConditionOccurrenceTests.R')
  source('R/ConditionEraTests.R')
  source('R/CostTests.R')
  source('R/DeathTests.R')
  source('R/DeviceExposureTests.R')
  source('R/DrugExposureTests.R')
  source('R/DrugEraTests.R')
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
  
  source('R/UnitTests.R')
  
  
## Function to get insertsql statement
  getInsertSql <- function(connectionDetails) {
    return(frameworkContext$insertSql);
  }
  
  ## Function to get testsql statement
  getTestSql <- function(connectionDetails) {
    return(frameworkContext$testSql);
  }
  
  
  
  
