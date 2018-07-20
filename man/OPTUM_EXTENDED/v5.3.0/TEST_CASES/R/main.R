
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
sequencer <- getSequence()
                         
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

.onLoad <- function(libname, pkgname) {
  initFramework()
  createTests()
}
