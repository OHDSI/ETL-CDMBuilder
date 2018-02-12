createTests <- function() {
  declareTestGroup("Condition Occurrence", 1)
  createConditionOccurrenceTests();
  declareTestGroup("Condition Era", 2)
  createConditionEraTests();
  declareTestGroup("Cost", 3)
  createCostTests();
  declareTestGroup("Death", 4)
  createDeathTests();
  declareTestGroup("Device Exposure", 5)
  createDeviceExposureTests();
  declareTestGroup("Drug Exposure", 6)
  createDrugExposureTests();
  declareTestGroup("Drug Era", 7)
  createDrugEraTests();
  declareTestGroup("Location", 8)
  createLocationTests();
  declareTestGroup("Measurement", 9)
  createMeasurementTests();
  declareTestGroup("Observation Period", 10)
  createObservationPeriodTests();
  declareTestGroup("Observation", 11)
  createObservationTests();
  declareTestGroup("Payer Plan Period", 12)
  createPayerPlanPeriodTests();
  declareTestGroup("Person", 13)
  createPersonTests();
  declareTestGroup("Procedure Occurrence", 14)
  createProcedureOccurrenceTests();
  declareTestGroup("Provider", 15)
  createProviderTests();
  declareTestGroup("Visit Occurrence", 16)
  createVisitOccurrenceTests();
}
