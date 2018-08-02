createCareSiteTests <- function()
{
  caresite <- createCareSite(claimId=3);
  declareTest(description = 'Practice_id=301, region=13', source_pid = caresite$pracid,
              cdm_pid = caresite$care_site_id)
  add_practice(pracid = caresite$pracid, region = 13, uts='2000-01-01', lcd='2016-12-31')
  expect_care_site(care_site_id = caresite$care_site_id, location_id = 13)

}
