createTests <- function() {
  declareTestGroup("Care Site")
  createCareSiteTests()
  declareTestGroup("Condition Era")
  createConditionEraTests();
  declareTestGroup("Condition Occurrence")
  createConditionOccurrenceTests();
  declareTestGroup("Death")
  createDeathTests();
  declareTestGroup("Drug Era")
  createDrugEraTests();
  declareTestGroup("Drug Exposure")
  createDrugExposureTests();
  # declareTestGroup("Location")
  # createLocationTests();
  declareTestGroup("Measurement")
  createMeasurementTests();
  declareTestGroup("Observation Period")
  createObservationPeriodTests();
  declareTestGroup("Observation")
  createObservationTests();
  declareTestGroup("Person")
  createPersonTests();
  declareTestGroup("Procedure Occurrence")
  createProcedureOccurrenceTests();
  declareTestGroup("Provider")
  createProviderTests();
  declareTestGroup("Visit Occurrence")
  createVisitOccurrenceTests();
}
