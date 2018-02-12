# Copyright 2017 Observational Health Data Sciences and Informatics
#
# This file is part of the CernerTesting package
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#' Run the location tests
#'
#' @export

createLocationTests <- function () {

    census_division <- list(
      list(source = "1", value = "(CT, ME, MA, NH, RI, VT)"),
      list(source = "2", value = "(NJ, NY, PA)"),
      list(source = "3", value = "(IA, KS, MN, MO, ND, SD)"),
      list(source = "4", value = "(IL, IN, MI, OH, WI)"),
      list(source = "5", value = "(AL, KY, MS, TN)"),
      list(source = "6", value = "(DE, DC, FL, GA, MD, NC, SC, VA, WV)"),
      list(source = "7", value = "(AR, LA, OK, TX)"),
      list(source = "8", value = "(AZ, CO, ID, MT, NV, NM, UT, WY)"),
      list(source = "9", value = "(AK, CA, HI, OR, WA)")
    )

    for (cd in census_division)
    {
      hospital <- createHospital()
      declareTest(paste("Hospital has census_division code", cd$source, sep = " "))
      add_hf_d_hospital(hospital_id = hospital$hospital_id, census_division = cd$source)
      expect_location(location_source_value = cd$value)
    }

}
