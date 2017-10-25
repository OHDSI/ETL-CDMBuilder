#' Clean native DB
#'
#' @details
#' Removes all test case data (truncates native tables)
#'
#' @return
#' none
#'
#' @export
clean <- function(connectionDetails) {
  writeLines("Clean Executed")
  
}

#' Get insert SQL
#'
#' @details
#' Returns insert Sql for native DB.
#'
#' @return
#' list of sql statements
#'
#' @export
getInsertSql <- function(connectionDetails) {
  return(frameworkContext$insertSql)
}

#' Get testing SQL
#'
#' @details
#' Returns testing Sql for the CDM DB.
#'
#' @return
#' list of sql statements
#'
#' @export
getTestSql <- function(connectionDetails) {
  return(frameworkContext$testSql)
}

getSequence <- function (startValue = 1) {
  counterInstance <- new.env(parent = emptyenv())
  counterInstance$currentValue <- startValue
  counterInstance$nextSequence <- function()
  {
    nextValue <- counterInstance$currentValue
    counterInstance$currentValue = counterInstance$currentValue + 1
    return(nextValue)
  }
  return (counterInstance)
}

createPatient <- function() {
  personId = sequencer$nextSequence()
  return (list(patid = personId, person_id = personId))
}

createClaim <- function() {
  claimId = sequencer$nextSequence()
  return (list(clmid = paste0("CLM", claimId)))
}

createProvider <- function() {
  providerId = sequencer$nextSequence()
  return (list(provid = providerId, provider_id = providerId))
}


# Use this function to test build errors
# It's challenging to debug errors when a package loads, so disable onLoad
# and export the below when debugging.
#' @export
testInit <- function() {
  initFramework()
  createTests()
}

sequencer <- getSequence()

.onLoad <- function(libname, pkgname) {
  initFramework()
  createTests()
}
