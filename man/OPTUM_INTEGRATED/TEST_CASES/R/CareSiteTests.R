createCareSiteTests <- function() {
  
  # Execute Optum SES/DOD Tests ----
  
  declareTest("Tests to ensure default care site is initialized.")
  expect_care_site(care_site_id = 0)
}