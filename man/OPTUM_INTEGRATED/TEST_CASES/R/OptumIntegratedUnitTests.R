createTests <- function() {
  declareTestGroup("Person")
  createPersonTests();
  declareTestGroup("Observation Period")
  createObservationPeriodTests();
  declareTestGroup("Visit Occurrence")
  createVisitOccurrenceTests();
  declareTestGroup("Payer Plan Period")
  createPayerPlanPeriodTests();
  declareTestGroup("Care Site")
  createCareSiteTests();
  declareTestGroup("Location")
  createLocationTests();
  declareTestGroup("Provider")
  createProviderTests();
  declareTestGroup("Death")
  createDeathTests();
  declareTestGroup("Condition Era")
  createConditionEraTests();
  declareTestGroup("Condition Occurrence")
  createConditionOccurrenceTests();
  declareTestGroup("Device Exposure")
  createDeviceExposureTests();
  declareTestGroup("Drug Exposure")
  createDrugExposureTests();
  declareTestGroup("Measurement")
  createMeasurementTests();
  declareTestGroup("Observation")
  createObservationTests();
  declareTestGroup("Procedure Occurrence")
  createProcedureOccurrenceTests();
}
