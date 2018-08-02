createTests <- function() {
  declareTestGroup("Condition Occurrence")
  createConditionOccurrenceTests();
  declareTestGroup("Condition Era")
  createConditionEraTests();
  declareTestGroup("Cost")
  createCostTests();
  declareTestGroup("Death")
  createDeathTests();
  declareTestGroup("Device Exposure")
  createDeviceExposureTests();
  declareTestGroup("Drug Exposure")
  createDrugExposureTests();
  declareTestGroup("Drug Era")
  createDrugEraTests();
  declareTestGroup("Location")
  createLocationTests();
  declareTestGroup("Measurement")
  createMeasurementTests();
  declareTestGroup("Observation Period")
  createObservationPeriodTests();
  declareTestGroup("Observation")
  createObservationTests();
  declareTestGroup("Payer Plan Period")
  createPayerPlanPeriodTests();
  declareTestGroup("Person")
  createPersonTests();
  declareTestGroup("Procedure Occurrence")
  createProcedureOccurrenceTests();
  declareTestGroup("Provider")
  createProviderTests();
  declareTestGroup("Visit Occurrence")
  createVisitOccurrenceTests();
}
