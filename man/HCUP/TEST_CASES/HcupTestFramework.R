initFramework <- function() {
  insertSql <- c()
  insertSql <- c(insertSql, "TRUNCATE TABLE core;")
  insertSql <- c(insertSql, "TRUNCATE TABLE dx_pr_grps;")
  insertSql <- c(insertSql, "TRUNCATE TABLE hospital;")
  insertSql <- c(insertSql, "TRUNCATE TABLE severity;")
  assign("insertSql", insertSql, envir = globalenv())
  testSql <- c()
  testSql <- c(testSql, "IF OBJECT_ID('test_results', 'U') IS NOT NULL")
  testSql <- c(testSql, "  DROP TABLE test_results;")
  testSql <- c(testSql, "")
  testSql <- c(testSql, "CREATE TABLE test_results (id INT, description VARCHAR(512), test VARCHAR(256), status VARCHAR(5));")
  testSql <- c(testSql, "")
  assign("testSql", testSql, envir = globalenv())
  assign("testId", 1, envir = globalenv())
  assign("testDescription", "", envir = globalenv())

  defaultValues <- new.env(parent = globalenv())
  assign("defaultValues", defaultValues, envir = globalenv())

  defaults <- list()
  defaults$key <- "List truncated..."
  defaults$female <- "1"
  defaults$age <- "0"
  defaults$ageday <- "-99"
  defaults$race <- "1"
  defaults$year <- "2006"
  defaults$amonth <- "-9"
  defaults$asource <- "5"
  defaults$asource_x <- "   "
  defaults$atype <- "1"
  defaults$aweekend <- "0"
  defaults$los <- "2"
  defaults$died <- "0"
  defaults$discwt <- "4.6286"
  defaults$dispuniform <- "1"
  defaults$dqtr <- "1"
  defaults$drg <- "391"
  defaults$drgver <- "22"
  defaults$dshospid <- "             "
  defaults$dx1 <- "V3000"
  defaults$dx2 <- "     "
  defaults$dx3 <- "     "
  defaults$dx4 <- "     "
  defaults$dx5 <- "     "
  defaults$dx6 <- "     "
  defaults$dx7 <- "     "
  defaults$dx8 <- "     "
  defaults$dx9 <- "     "
  defaults$dx10 <- "4019"
  defaults$dx11 <- "4019"
  defaults$dx12 <- "     "
  defaults$dx13 <- "     "
  defaults$dx14 <- "     "
  defaults$dx15 <- "     "
  defaults$dxccs1 <- "218"
  defaults$dxccs2 <- "-999"
  defaults$dxccs3 <- "-999"
  defaults$dxccs4 <- "-999"
  defaults$dxccs5 <- "-999"
  defaults$dxccs6 <- "-999"
  defaults$dxccs7 <- "-999"
  defaults$dxccs8 <- "-999"
  defaults$dxccs9 <- "-999"
  defaults$dxccs10 <- "-999"
  defaults$dxccs11 <- "-999"
  defaults$dxccs12 <- "-999"
  defaults$dxccs13 <- "-999"
  defaults$dxccs14 <- "-999"
  defaults$dxccs15 <- "-999"
  defaults$hospid <- "51043"
  defaults$hospst <- "CA"
  defaults$los_x <- "2"
  defaults$mdc <- "5"
  defaults$ndx <- "9"
  defaults$neomat <- "0"
  defaults$nis_stratum <- "3033"
  defaults$npr <- "0"
  defaults$pay1 <- "1"
  defaults$pay1_x <- "C         "
  defaults$pay2 <- "-9"
  defaults$pay2_x <- "          "
  defaults$pr1 <- "    "
  defaults$pr2 <- "    "
  defaults$pr3 <- "    "
  defaults$pr4 <- "    "
  defaults$pr5 <- "    "
  defaults$pr6 <- "8853"
  defaults$pr7 <- "    "
  defaults$pr8 <- "    "
  defaults$pr9 <- "    "
  defaults$pr10 <- "    "
  defaults$pr11 <- "    "
  defaults$pr12 <- "    "
  defaults$pr13 <- "    "
  defaults$pr14 <- "    "
  defaults$pr15 <- "    "
  defaults$prccs1 <- "-99"
  defaults$prccs2 <- "-99"
  defaults$prccs3 <- "-99"
  defaults$prccs4 <- "-99"
  defaults$prccs5 <- "-99"
  defaults$prccs6 <- "-99"
  defaults$prccs7 <- "-99"
  defaults$prccs8 <- "-99"
  defaults$prccs9 <- "-99"
  defaults$prccs10 <- "-99"
  defaults$prccs11 <- "-99"
  defaults$prccs12 <- "-99"
  defaults$prccs13 <- "-99"
  defaults$prccs14 <- "-99"
  defaults$prccs15 <- "-99"
  defaults$prday1 <- "-99"
  defaults$prday2 <- "-99"
  defaults$prday3 <- "-99"
  defaults$prday4 <- "-99"
  defaults$prday5 <- "-99"
  defaults$prday6 <- "-99"
  defaults$prday7 <- "-99"
  defaults$prday8 <- "-99"
  defaults$prday9 <- "-99"
  defaults$prday10 <- "-99"
  defaults$prday11 <- "-99"
  defaults$prday12 <- "-99"
  defaults$prday13 <- "-99"
  defaults$prday14 <- "-99"
  defaults$prday15 <- "-99"
  defaults$totchg <- "-999999999"
  defaults$totchg_x <- "-99999999999.99"
  defaults$asourceub92 <- " "
  defaults$ecode1 <- "     "
  defaults$ecode2 <- "     "
  defaults$ecode3 <- "     "
  defaults$ecode4 <- "     "
  defaults$elective <- "0"
  defaults$e_ccs1 <- "-999"
  defaults$e_ccs2 <- "-999"
  defaults$e_ccs3 <- "-999"
  defaults$e_ccs4 <- "-999"
  defaults$necode <- "0"
  assign("core", defaults, envir = defaultValues)

  defaults <- list()
  defaults$hospid <- "12320"
  defaults$key <- "List truncated..."
  defaults$chron1 <- "0"
  defaults$chron2 <- "0"
  defaults$chron3 <- "1"
  defaults$chron4 <- "1"
  defaults$chron5 <- "1"
  defaults$chron6 <- "-99"
  defaults$chron7 <- "-99"
  defaults$chron8 <- "-99"
  defaults$chron9 <- "-99"
  defaults$chron10 <- "-99"
  defaults$chron11 <- "-99"
  defaults$chron12 <- "-99"
  defaults$chron13 <- "-99"
  defaults$chron14 <- "-99"
  defaults$chron15 <- "-99"
  defaults$chronb1 <- "7"
  defaults$chronb2 <- "7"
  defaults$chronb3 <- "7"
  defaults$chronb4 <- "-99"
  defaults$chronb5 <- "-99"
  defaults$chronb6 <- "-99"
  defaults$chronb7 <- "-99"
  defaults$chronb8 <- "-99"
  defaults$chronb9 <- "-99"
  defaults$chronb10 <- "-99"
  defaults$chronb11 <- "-99"
  defaults$chronb12 <- "-99"
  defaults$chronb13 <- "-99"
  defaults$chronb14 <- "-99"
  defaults$chronb15 <- "-99"
  defaults$pclass1 <- "-99"
  defaults$pclass2 <- "-99"
  defaults$pclass3 <- "-99"
  defaults$pclass4 <- "-99"
  defaults$pclass5 <- "-99"
  defaults$pclass6 <- "-99"
  defaults$pclass7 <- "-99"
  defaults$pclass8 <- "-99"
  defaults$pclass9 <- "-99"
  defaults$pclass10 <- "-99"
  defaults$pclass11 <- "-99"
  defaults$pclass12 <- "-99"
  defaults$pclass13 <- "-99"
  defaults$pclass14 <- "-99"
  defaults$pclass15 <- "-99"
  assign("dx_pr_grps", defaults, envir = defaultValues)

  defaults <- list()
  defaults$ahaid <- "       "
  defaults$discwt <- "4.4322"
  defaults$hospaddr <- "                              "
  defaults$hospcity <- "                    "
  defaults$hospid <- "List truncated..."
  defaults$hospname <- "                              "
  defaults$hospst <- "TX"
  defaults$hospwt <- "5.0000"
  defaults$hospzip <- "     "
  defaults$hosp_bedsize <- "1"
  defaults$hosp_control <- "0"
  defaults$hosp_location <- "1"
  defaults$hosp_locteach <- "2"
  defaults$hosp_region <- "3"
  defaults$hosp_teach <- "0"
  defaults$idnumber <- "      "
  defaults$nis_stratum <- "2411"
  defaults$n_disc_u <- "133443"
  defaults$n_hosp_u <- "78"
  defaults$s_disc_u <- "84786"
  defaults$s_hosp_u <- "16"
  defaults$total_disc <- "List truncated..."
  defaults$year <- "2008"
  defaults$hospstco <- "-9999"
  assign("hospital", defaults, envir = defaultValues)

  defaults <- list()
  defaults$hospid <- "51043"
  defaults$key <- "List truncated..."
  defaults$aprdrg <- "640"
  defaults$aprdrg_risk_mortality <- "1"
  defaults$aprdrg_severity <- "1"
  defaults$cm_aids <- "0"
  defaults$cm_alcohol <- "0"
  defaults$cm_anemdef <- "0"
  defaults$cm_arth <- "0"
  defaults$cm_bldloss <- "0"
  defaults$cm_chf <- "0"
  defaults$cm_chrnlung <- "0"
  defaults$cm_coag <- "0"
  defaults$cm_depress <- "0"
  defaults$cm_dm <- "0"
  defaults$cm_dmcx <- "0"
  defaults$cm_drug <- "0"
  defaults$cm_htn_c <- "0"
  defaults$cm_hypothy <- "0"
  defaults$cm_liver <- "0"
  defaults$cm_lymph <- "0"
  defaults$cm_lytes <- "0"
  defaults$cm_mets <- "0"
  defaults$cm_neuro <- "0"
  defaults$cm_obese <- "0"
  defaults$cm_para <- "0"
  defaults$cm_perivasc <- "0"
  defaults$cm_psych <- "0"
  defaults$cm_pulmcirc <- "0"
  defaults$cm_renlfail <- "0"
  defaults$cm_tumor <- "0"
  defaults$cm_ulcer <- "0"
  defaults$cm_valve <- "0"
  defaults$cm_wghtloss <- "0"
  defaults$ds_stage1 <- "1.01"
  assign("severity", defaults, envir = defaultValues)
}

initFramework()

declareTest <- function(id, description) {
  assign("testId", id, envir = globalenv()) 
  assign("testDescription", description, envir = globalenv()) 
  sql <- c("", paste0("-- ", id, ": ", description))
  assign("insertSql", c(get("insertSql", envir = globalenv()), sql), envir = globalenv())
  assign("testSql", c(get("testSql", envir = globalenv()), sql), envir = globalenv())
}

set_defaults_core <- function(key, female, age, ageday, race, year, amonth, asource, asource_x, atype, aweekend, los, died, discwt, dispub92, dispuniform, dqtr, drg, drg18, drgver, dshospid, dx1, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dx10, dx11, dx12, dx13, dx14, dx15, dxccs1, dxccs2, dxccs3, dxccs4, dxccs5, dxccs6, dxccs7, dxccs8, dxccs9, dxccs10, dxccs11, dxccs12, dxccs13, dxccs14, dxccs15, hospid, hospst, hospstco, los_x, mdc, mdc18, mdnum1_s, mdnum2_s, ndx, neomat, nis_stratum, npr, pay1, pay1_x, pay2, pay2_x, pr1, pr2, pr3, pr4, pr5, pr6, pr7, pr8, pr9, pr10, pr11, pr12, pr13, pr14, pr15, prccs1, prccs2, prccs3, prccs4, prccs5, prccs6, prccs7, prccs8, prccs9, prccs10, prccs11, prccs12, prccs13, prccs14, prccs15, prday1, prday2, prday3, prday4, prday5, prday6, prday7, prday8, prday9, prday10, prday11, prday12, prday13, prday14, prday15, totchg, totchg_x, zipinc, discwtcharge, mdid_s, surgid_s, asourceub92, dispub04, dqtr_x, drg24, drg_nopoa, dx16, dx17, dx18, dx19, dx20, dx21, dx22, dx23, dx24, dx25, dxccs16, dxccs17, dxccs18, dxccs19, dxccs20, dxccs21, dxccs22, dxccs23, dxccs24, dxccs25, ecode1, ecode2, ecode3, ecode4, elective, e_ccs1, e_ccs2, e_ccs3, e_ccs4, hcup_ed, hospbrth, mdc24, mdc_nopoa, nchronic, necode, orproc, pl_nchs2006, pointoforiginub04, pointoforigin_x, tran_in, tran_out, zipinc_qrtl, mdnum1_r, mdnum2_r, pl_ur_cat4) {
  defaults <- get("core", envir = defaultValues)
  if (!missing(key)) {
    defaults$key <- key
  }
  if (!missing(female)) {
    defaults$female <- female
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(ageday)) {
    defaults$ageday <- ageday
  }
  if (!missing(race)) {
    defaults$race <- race
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(amonth)) {
    defaults$amonth <- amonth
  }
  if (!missing(asource)) {
    defaults$asource <- asource
  }
  if (!missing(asource_x)) {
    defaults$asource_x <- asource_x
  }
  if (!missing(atype)) {
    defaults$atype <- atype
  }
  if (!missing(aweekend)) {
    defaults$aweekend <- aweekend
  }
  if (!missing(los)) {
    defaults$los <- los
  }
  if (!missing(died)) {
    defaults$died <- died
  }
  if (!missing(discwt)) {
    defaults$discwt <- discwt
  }
  if (!missing(dispub92)) {
    defaults$dispub92 <- dispub92
  }
  if (!missing(dispuniform)) {
    defaults$dispuniform <- dispuniform
  }
  if (!missing(dqtr)) {
    defaults$dqtr <- dqtr
  }
  if (!missing(drg)) {
    defaults$drg <- drg
  }
  if (!missing(drg18)) {
    defaults$drg18 <- drg18
  }
  if (!missing(drgver)) {
    defaults$drgver <- drgver
  }
  if (!missing(dshospid)) {
    defaults$dshospid <- dshospid
  }
  if (!missing(dx1)) {
    defaults$dx1 <- dx1
  }
  if (!missing(dx2)) {
    defaults$dx2 <- dx2
  }
  if (!missing(dx3)) {
    defaults$dx3 <- dx3
  }
  if (!missing(dx4)) {
    defaults$dx4 <- dx4
  }
  if (!missing(dx5)) {
    defaults$dx5 <- dx5
  }
  if (!missing(dx6)) {
    defaults$dx6 <- dx6
  }
  if (!missing(dx7)) {
    defaults$dx7 <- dx7
  }
  if (!missing(dx8)) {
    defaults$dx8 <- dx8
  }
  if (!missing(dx9)) {
    defaults$dx9 <- dx9
  }
  if (!missing(dx10)) {
    defaults$dx10 <- dx10
  }
  if (!missing(dx11)) {
    defaults$dx11 <- dx11
  }
  if (!missing(dx12)) {
    defaults$dx12 <- dx12
  }
  if (!missing(dx13)) {
    defaults$dx13 <- dx13
  }
  if (!missing(dx14)) {
    defaults$dx14 <- dx14
  }
  if (!missing(dx15)) {
    defaults$dx15 <- dx15
  }
  if (!missing(dxccs1)) {
    defaults$dxccs1 <- dxccs1
  }
  if (!missing(dxccs2)) {
    defaults$dxccs2 <- dxccs2
  }
  if (!missing(dxccs3)) {
    defaults$dxccs3 <- dxccs3
  }
  if (!missing(dxccs4)) {
    defaults$dxccs4 <- dxccs4
  }
  if (!missing(dxccs5)) {
    defaults$dxccs5 <- dxccs5
  }
  if (!missing(dxccs6)) {
    defaults$dxccs6 <- dxccs6
  }
  if (!missing(dxccs7)) {
    defaults$dxccs7 <- dxccs7
  }
  if (!missing(dxccs8)) {
    defaults$dxccs8 <- dxccs8
  }
  if (!missing(dxccs9)) {
    defaults$dxccs9 <- dxccs9
  }
  if (!missing(dxccs10)) {
    defaults$dxccs10 <- dxccs10
  }
  if (!missing(dxccs11)) {
    defaults$dxccs11 <- dxccs11
  }
  if (!missing(dxccs12)) {
    defaults$dxccs12 <- dxccs12
  }
  if (!missing(dxccs13)) {
    defaults$dxccs13 <- dxccs13
  }
  if (!missing(dxccs14)) {
    defaults$dxccs14 <- dxccs14
  }
  if (!missing(dxccs15)) {
    defaults$dxccs15 <- dxccs15
  }
  if (!missing(hospid)) {
    defaults$hospid <- hospid
  }
  if (!missing(hospst)) {
    defaults$hospst <- hospst
  }
  if (!missing(hospstco)) {
    defaults$hospstco <- hospstco
  }
  if (!missing(los_x)) {
    defaults$los_x <- los_x
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(mdc18)) {
    defaults$mdc18 <- mdc18
  }
  if (!missing(mdnum1_s)) {
    defaults$mdnum1_s <- mdnum1_s
  }
  if (!missing(mdnum2_s)) {
    defaults$mdnum2_s <- mdnum2_s
  }
  if (!missing(ndx)) {
    defaults$ndx <- ndx
  }
  if (!missing(neomat)) {
    defaults$neomat <- neomat
  }
  if (!missing(nis_stratum)) {
    defaults$nis_stratum <- nis_stratum
  }
  if (!missing(npr)) {
    defaults$npr <- npr
  }
  if (!missing(pay1)) {
    defaults$pay1 <- pay1
  }
  if (!missing(pay1_x)) {
    defaults$pay1_x <- pay1_x
  }
  if (!missing(pay2)) {
    defaults$pay2 <- pay2
  }
  if (!missing(pay2_x)) {
    defaults$pay2_x <- pay2_x
  }
  if (!missing(pr1)) {
    defaults$pr1 <- pr1
  }
  if (!missing(pr2)) {
    defaults$pr2 <- pr2
  }
  if (!missing(pr3)) {
    defaults$pr3 <- pr3
  }
  if (!missing(pr4)) {
    defaults$pr4 <- pr4
  }
  if (!missing(pr5)) {
    defaults$pr5 <- pr5
  }
  if (!missing(pr6)) {
    defaults$pr6 <- pr6
  }
  if (!missing(pr7)) {
    defaults$pr7 <- pr7
  }
  if (!missing(pr8)) {
    defaults$pr8 <- pr8
  }
  if (!missing(pr9)) {
    defaults$pr9 <- pr9
  }
  if (!missing(pr10)) {
    defaults$pr10 <- pr10
  }
  if (!missing(pr11)) {
    defaults$pr11 <- pr11
  }
  if (!missing(pr12)) {
    defaults$pr12 <- pr12
  }
  if (!missing(pr13)) {
    defaults$pr13 <- pr13
  }
  if (!missing(pr14)) {
    defaults$pr14 <- pr14
  }
  if (!missing(pr15)) {
    defaults$pr15 <- pr15
  }
  if (!missing(prccs1)) {
    defaults$prccs1 <- prccs1
  }
  if (!missing(prccs2)) {
    defaults$prccs2 <- prccs2
  }
  if (!missing(prccs3)) {
    defaults$prccs3 <- prccs3
  }
  if (!missing(prccs4)) {
    defaults$prccs4 <- prccs4
  }
  if (!missing(prccs5)) {
    defaults$prccs5 <- prccs5
  }
  if (!missing(prccs6)) {
    defaults$prccs6 <- prccs6
  }
  if (!missing(prccs7)) {
    defaults$prccs7 <- prccs7
  }
  if (!missing(prccs8)) {
    defaults$prccs8 <- prccs8
  }
  if (!missing(prccs9)) {
    defaults$prccs9 <- prccs9
  }
  if (!missing(prccs10)) {
    defaults$prccs10 <- prccs10
  }
  if (!missing(prccs11)) {
    defaults$prccs11 <- prccs11
  }
  if (!missing(prccs12)) {
    defaults$prccs12 <- prccs12
  }
  if (!missing(prccs13)) {
    defaults$prccs13 <- prccs13
  }
  if (!missing(prccs14)) {
    defaults$prccs14 <- prccs14
  }
  if (!missing(prccs15)) {
    defaults$prccs15 <- prccs15
  }
  if (!missing(prday1)) {
    defaults$prday1 <- prday1
  }
  if (!missing(prday2)) {
    defaults$prday2 <- prday2
  }
  if (!missing(prday3)) {
    defaults$prday3 <- prday3
  }
  if (!missing(prday4)) {
    defaults$prday4 <- prday4
  }
  if (!missing(prday5)) {
    defaults$prday5 <- prday5
  }
  if (!missing(prday6)) {
    defaults$prday6 <- prday6
  }
  if (!missing(prday7)) {
    defaults$prday7 <- prday7
  }
  if (!missing(prday8)) {
    defaults$prday8 <- prday8
  }
  if (!missing(prday9)) {
    defaults$prday9 <- prday9
  }
  if (!missing(prday10)) {
    defaults$prday10 <- prday10
  }
  if (!missing(prday11)) {
    defaults$prday11 <- prday11
  }
  if (!missing(prday12)) {
    defaults$prday12 <- prday12
  }
  if (!missing(prday13)) {
    defaults$prday13 <- prday13
  }
  if (!missing(prday14)) {
    defaults$prday14 <- prday14
  }
  if (!missing(prday15)) {
    defaults$prday15 <- prday15
  }
  if (!missing(totchg)) {
    defaults$totchg <- totchg
  }
  if (!missing(totchg_x)) {
    defaults$totchg_x <- totchg_x
  }
  if (!missing(zipinc)) {
    defaults$zipinc <- zipinc
  }
  if (!missing(discwtcharge)) {
    defaults$discwtcharge <- discwtcharge
  }
  if (!missing(mdid_s)) {
    defaults$mdid_s <- mdid_s
  }
  if (!missing(surgid_s)) {
    defaults$surgid_s <- surgid_s
  }
  if (!missing(asourceub92)) {
    defaults$asourceub92 <- asourceub92
  }
  if (!missing(dispub04)) {
    defaults$dispub04 <- dispub04
  }
  if (!missing(dqtr_x)) {
    defaults$dqtr_x <- dqtr_x
  }
  if (!missing(drg24)) {
    defaults$drg24 <- drg24
  }
  if (!missing(drg_nopoa)) {
    defaults$drg_nopoa <- drg_nopoa
  }
  if (!missing(dx16)) {
    defaults$dx16 <- dx16
  }
  if (!missing(dx17)) {
    defaults$dx17 <- dx17
  }
  if (!missing(dx18)) {
    defaults$dx18 <- dx18
  }
  if (!missing(dx19)) {
    defaults$dx19 <- dx19
  }
  if (!missing(dx20)) {
    defaults$dx20 <- dx20
  }
  if (!missing(dx21)) {
    defaults$dx21 <- dx21
  }
  if (!missing(dx22)) {
    defaults$dx22 <- dx22
  }
  if (!missing(dx23)) {
    defaults$dx23 <- dx23
  }
  if (!missing(dx24)) {
    defaults$dx24 <- dx24
  }
  if (!missing(dx25)) {
    defaults$dx25 <- dx25
  }
  if (!missing(dxccs16)) {
    defaults$dxccs16 <- dxccs16
  }
  if (!missing(dxccs17)) {
    defaults$dxccs17 <- dxccs17
  }
  if (!missing(dxccs18)) {
    defaults$dxccs18 <- dxccs18
  }
  if (!missing(dxccs19)) {
    defaults$dxccs19 <- dxccs19
  }
  if (!missing(dxccs20)) {
    defaults$dxccs20 <- dxccs20
  }
  if (!missing(dxccs21)) {
    defaults$dxccs21 <- dxccs21
  }
  if (!missing(dxccs22)) {
    defaults$dxccs22 <- dxccs22
  }
  if (!missing(dxccs23)) {
    defaults$dxccs23 <- dxccs23
  }
  if (!missing(dxccs24)) {
    defaults$dxccs24 <- dxccs24
  }
  if (!missing(dxccs25)) {
    defaults$dxccs25 <- dxccs25
  }
  if (!missing(ecode1)) {
    defaults$ecode1 <- ecode1
  }
  if (!missing(ecode2)) {
    defaults$ecode2 <- ecode2
  }
  if (!missing(ecode3)) {
    defaults$ecode3 <- ecode3
  }
  if (!missing(ecode4)) {
    defaults$ecode4 <- ecode4
  }
  if (!missing(elective)) {
    defaults$elective <- elective
  }
  if (!missing(e_ccs1)) {
    defaults$e_ccs1 <- e_ccs1
  }
  if (!missing(e_ccs2)) {
    defaults$e_ccs2 <- e_ccs2
  }
  if (!missing(e_ccs3)) {
    defaults$e_ccs3 <- e_ccs3
  }
  if (!missing(e_ccs4)) {
    defaults$e_ccs4 <- e_ccs4
  }
  if (!missing(hcup_ed)) {
    defaults$hcup_ed <- hcup_ed
  }
  if (!missing(hospbrth)) {
    defaults$hospbrth <- hospbrth
  }
  if (!missing(mdc24)) {
    defaults$mdc24 <- mdc24
  }
  if (!missing(mdc_nopoa)) {
    defaults$mdc_nopoa <- mdc_nopoa
  }
  if (!missing(nchronic)) {
    defaults$nchronic <- nchronic
  }
  if (!missing(necode)) {
    defaults$necode <- necode
  }
  if (!missing(orproc)) {
    defaults$orproc <- orproc
  }
  if (!missing(pl_nchs2006)) {
    defaults$pl_nchs2006 <- pl_nchs2006
  }
  if (!missing(pointoforiginub04)) {
    defaults$pointoforiginub04 <- pointoforiginub04
  }
  if (!missing(pointoforigin_x)) {
    defaults$pointoforigin_x <- pointoforigin_x
  }
  if (!missing(tran_in)) {
    defaults$tran_in <- tran_in
  }
  if (!missing(tran_out)) {
    defaults$tran_out <- tran_out
  }
  if (!missing(zipinc_qrtl)) {
    defaults$zipinc_qrtl <- zipinc_qrtl
  }
  if (!missing(mdnum1_r)) {
    defaults$mdnum1_r <- mdnum1_r
  }
  if (!missing(mdnum2_r)) {
    defaults$mdnum2_r <- mdnum2_r
  }
  if (!missing(pl_ur_cat4)) {
    defaults$pl_ur_cat4 <- pl_ur_cat4
  }
  assign("core", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_dx_pr_grps <- function(hospid, key, chron1, chron2, chron3, chron4, chron5, chron6, chron7, chron8, chron9, chron10, chron11, chron12, chron13, chron14, chron15, chron16, chron17, chron18, chron19, chron20, chron21, chron22, chron23, chron24, chron25, chronb1, chronb2, chronb3, chronb4, chronb5, chronb6, chronb7, chronb8, chronb9, chronb10, chronb11, chronb12, chronb13, chronb14, chronb15, chronb16, chronb17, chronb18, chronb19, chronb20, chronb21, chronb22, chronb23, chronb24, chronb25, dxmccs1, e_mccs1, pclass1, pclass2, pclass3, pclass4, pclass5, pclass6, pclass7, pclass8, pclass9, pclass10, pclass11, pclass12, pclass13, pclass14, pclass15, prmccs1, ccsmgn1, ccsmgn2, ccsmgn3, ccsmgn4, ccsmgn5, ccsmgn6, ccsmgn7, ccsmgn8, ccsmgn9, ccsmgn10, ccsmgn11, ccsmgn12, ccsmgn13, ccsmgn14, ccsmgn15, ccsmsp1, ccsmsp2, ccsmsp3, ccsmsp4, ccsmsp5, ccsmsp6, ccsmsp7, ccsmsp8, ccsmsp9, ccsmsp10, ccsmsp11, ccsmsp12, ccsmsp13, ccsmsp14, ccsmsp15, eccsmgn1, eccsmgn2, eccsmgn3, eccsmgn4) {
  defaults <- get("dx_pr_grps", envir = defaultValues)
  if (!missing(hospid)) {
    defaults$hospid <- hospid
  }
  if (!missing(key)) {
    defaults$key <- key
  }
  if (!missing(chron1)) {
    defaults$chron1 <- chron1
  }
  if (!missing(chron2)) {
    defaults$chron2 <- chron2
  }
  if (!missing(chron3)) {
    defaults$chron3 <- chron3
  }
  if (!missing(chron4)) {
    defaults$chron4 <- chron4
  }
  if (!missing(chron5)) {
    defaults$chron5 <- chron5
  }
  if (!missing(chron6)) {
    defaults$chron6 <- chron6
  }
  if (!missing(chron7)) {
    defaults$chron7 <- chron7
  }
  if (!missing(chron8)) {
    defaults$chron8 <- chron8
  }
  if (!missing(chron9)) {
    defaults$chron9 <- chron9
  }
  if (!missing(chron10)) {
    defaults$chron10 <- chron10
  }
  if (!missing(chron11)) {
    defaults$chron11 <- chron11
  }
  if (!missing(chron12)) {
    defaults$chron12 <- chron12
  }
  if (!missing(chron13)) {
    defaults$chron13 <- chron13
  }
  if (!missing(chron14)) {
    defaults$chron14 <- chron14
  }
  if (!missing(chron15)) {
    defaults$chron15 <- chron15
  }
  if (!missing(chron16)) {
    defaults$chron16 <- chron16
  }
  if (!missing(chron17)) {
    defaults$chron17 <- chron17
  }
  if (!missing(chron18)) {
    defaults$chron18 <- chron18
  }
  if (!missing(chron19)) {
    defaults$chron19 <- chron19
  }
  if (!missing(chron20)) {
    defaults$chron20 <- chron20
  }
  if (!missing(chron21)) {
    defaults$chron21 <- chron21
  }
  if (!missing(chron22)) {
    defaults$chron22 <- chron22
  }
  if (!missing(chron23)) {
    defaults$chron23 <- chron23
  }
  if (!missing(chron24)) {
    defaults$chron24 <- chron24
  }
  if (!missing(chron25)) {
    defaults$chron25 <- chron25
  }
  if (!missing(chronb1)) {
    defaults$chronb1 <- chronb1
  }
  if (!missing(chronb2)) {
    defaults$chronb2 <- chronb2
  }
  if (!missing(chronb3)) {
    defaults$chronb3 <- chronb3
  }
  if (!missing(chronb4)) {
    defaults$chronb4 <- chronb4
  }
  if (!missing(chronb5)) {
    defaults$chronb5 <- chronb5
  }
  if (!missing(chronb6)) {
    defaults$chronb6 <- chronb6
  }
  if (!missing(chronb7)) {
    defaults$chronb7 <- chronb7
  }
  if (!missing(chronb8)) {
    defaults$chronb8 <- chronb8
  }
  if (!missing(chronb9)) {
    defaults$chronb9 <- chronb9
  }
  if (!missing(chronb10)) {
    defaults$chronb10 <- chronb10
  }
  if (!missing(chronb11)) {
    defaults$chronb11 <- chronb11
  }
  if (!missing(chronb12)) {
    defaults$chronb12 <- chronb12
  }
  if (!missing(chronb13)) {
    defaults$chronb13 <- chronb13
  }
  if (!missing(chronb14)) {
    defaults$chronb14 <- chronb14
  }
  if (!missing(chronb15)) {
    defaults$chronb15 <- chronb15
  }
  if (!missing(chronb16)) {
    defaults$chronb16 <- chronb16
  }
  if (!missing(chronb17)) {
    defaults$chronb17 <- chronb17
  }
  if (!missing(chronb18)) {
    defaults$chronb18 <- chronb18
  }
  if (!missing(chronb19)) {
    defaults$chronb19 <- chronb19
  }
  if (!missing(chronb20)) {
    defaults$chronb20 <- chronb20
  }
  if (!missing(chronb21)) {
    defaults$chronb21 <- chronb21
  }
  if (!missing(chronb22)) {
    defaults$chronb22 <- chronb22
  }
  if (!missing(chronb23)) {
    defaults$chronb23 <- chronb23
  }
  if (!missing(chronb24)) {
    defaults$chronb24 <- chronb24
  }
  if (!missing(chronb25)) {
    defaults$chronb25 <- chronb25
  }
  if (!missing(dxmccs1)) {
    defaults$dxmccs1 <- dxmccs1
  }
  if (!missing(e_mccs1)) {
    defaults$e_mccs1 <- e_mccs1
  }
  if (!missing(pclass1)) {
    defaults$pclass1 <- pclass1
  }
  if (!missing(pclass2)) {
    defaults$pclass2 <- pclass2
  }
  if (!missing(pclass3)) {
    defaults$pclass3 <- pclass3
  }
  if (!missing(pclass4)) {
    defaults$pclass4 <- pclass4
  }
  if (!missing(pclass5)) {
    defaults$pclass5 <- pclass5
  }
  if (!missing(pclass6)) {
    defaults$pclass6 <- pclass6
  }
  if (!missing(pclass7)) {
    defaults$pclass7 <- pclass7
  }
  if (!missing(pclass8)) {
    defaults$pclass8 <- pclass8
  }
  if (!missing(pclass9)) {
    defaults$pclass9 <- pclass9
  }
  if (!missing(pclass10)) {
    defaults$pclass10 <- pclass10
  }
  if (!missing(pclass11)) {
    defaults$pclass11 <- pclass11
  }
  if (!missing(pclass12)) {
    defaults$pclass12 <- pclass12
  }
  if (!missing(pclass13)) {
    defaults$pclass13 <- pclass13
  }
  if (!missing(pclass14)) {
    defaults$pclass14 <- pclass14
  }
  if (!missing(pclass15)) {
    defaults$pclass15 <- pclass15
  }
  if (!missing(prmccs1)) {
    defaults$prmccs1 <- prmccs1
  }
  if (!missing(ccsmgn1)) {
    defaults$ccsmgn1 <- ccsmgn1
  }
  if (!missing(ccsmgn2)) {
    defaults$ccsmgn2 <- ccsmgn2
  }
  if (!missing(ccsmgn3)) {
    defaults$ccsmgn3 <- ccsmgn3
  }
  if (!missing(ccsmgn4)) {
    defaults$ccsmgn4 <- ccsmgn4
  }
  if (!missing(ccsmgn5)) {
    defaults$ccsmgn5 <- ccsmgn5
  }
  if (!missing(ccsmgn6)) {
    defaults$ccsmgn6 <- ccsmgn6
  }
  if (!missing(ccsmgn7)) {
    defaults$ccsmgn7 <- ccsmgn7
  }
  if (!missing(ccsmgn8)) {
    defaults$ccsmgn8 <- ccsmgn8
  }
  if (!missing(ccsmgn9)) {
    defaults$ccsmgn9 <- ccsmgn9
  }
  if (!missing(ccsmgn10)) {
    defaults$ccsmgn10 <- ccsmgn10
  }
  if (!missing(ccsmgn11)) {
    defaults$ccsmgn11 <- ccsmgn11
  }
  if (!missing(ccsmgn12)) {
    defaults$ccsmgn12 <- ccsmgn12
  }
  if (!missing(ccsmgn13)) {
    defaults$ccsmgn13 <- ccsmgn13
  }
  if (!missing(ccsmgn14)) {
    defaults$ccsmgn14 <- ccsmgn14
  }
  if (!missing(ccsmgn15)) {
    defaults$ccsmgn15 <- ccsmgn15
  }
  if (!missing(ccsmsp1)) {
    defaults$ccsmsp1 <- ccsmsp1
  }
  if (!missing(ccsmsp2)) {
    defaults$ccsmsp2 <- ccsmsp2
  }
  if (!missing(ccsmsp3)) {
    defaults$ccsmsp3 <- ccsmsp3
  }
  if (!missing(ccsmsp4)) {
    defaults$ccsmsp4 <- ccsmsp4
  }
  if (!missing(ccsmsp5)) {
    defaults$ccsmsp5 <- ccsmsp5
  }
  if (!missing(ccsmsp6)) {
    defaults$ccsmsp6 <- ccsmsp6
  }
  if (!missing(ccsmsp7)) {
    defaults$ccsmsp7 <- ccsmsp7
  }
  if (!missing(ccsmsp8)) {
    defaults$ccsmsp8 <- ccsmsp8
  }
  if (!missing(ccsmsp9)) {
    defaults$ccsmsp9 <- ccsmsp9
  }
  if (!missing(ccsmsp10)) {
    defaults$ccsmsp10 <- ccsmsp10
  }
  if (!missing(ccsmsp11)) {
    defaults$ccsmsp11 <- ccsmsp11
  }
  if (!missing(ccsmsp12)) {
    defaults$ccsmsp12 <- ccsmsp12
  }
  if (!missing(ccsmsp13)) {
    defaults$ccsmsp13 <- ccsmsp13
  }
  if (!missing(ccsmsp14)) {
    defaults$ccsmsp14 <- ccsmsp14
  }
  if (!missing(ccsmsp15)) {
    defaults$ccsmsp15 <- ccsmsp15
  }
  if (!missing(eccsmgn1)) {
    defaults$eccsmgn1 <- eccsmgn1
  }
  if (!missing(eccsmgn2)) {
    defaults$eccsmgn2 <- eccsmgn2
  }
  if (!missing(eccsmgn3)) {
    defaults$eccsmgn3 <- eccsmgn3
  }
  if (!missing(eccsmgn4)) {
    defaults$eccsmgn4 <- eccsmgn4
  }
  assign("dx_pr_grps", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_hospital <- function(ahaid, discwt, hospaddr, hospcity, hospid, hospname, hospst, hospwt, hospzip, hosp_bedsize, hosp_control, hosp_location, hosp_locteach, hosp_region, hosp_teach, idnumber, nis_stratum, n_disc_u, n_hosp_u, s_disc_u, s_hosp_u, total_disc, year, discwtcharge, hfipsstco, h_contrl, hospstco, hosp_rnpct, hosp_rnfteapd, hosp_lpnfteapd, hosp_nafteapd, hosp_opsurgpct, hosp_mhsmember, hosp_mhscluster) {
  defaults <- get("hospital", envir = defaultValues)
  if (!missing(ahaid)) {
    defaults$ahaid <- ahaid
  }
  if (!missing(discwt)) {
    defaults$discwt <- discwt
  }
  if (!missing(hospaddr)) {
    defaults$hospaddr <- hospaddr
  }
  if (!missing(hospcity)) {
    defaults$hospcity <- hospcity
  }
  if (!missing(hospid)) {
    defaults$hospid <- hospid
  }
  if (!missing(hospname)) {
    defaults$hospname <- hospname
  }
  if (!missing(hospst)) {
    defaults$hospst <- hospst
  }
  if (!missing(hospwt)) {
    defaults$hospwt <- hospwt
  }
  if (!missing(hospzip)) {
    defaults$hospzip <- hospzip
  }
  if (!missing(hosp_bedsize)) {
    defaults$hosp_bedsize <- hosp_bedsize
  }
  if (!missing(hosp_control)) {
    defaults$hosp_control <- hosp_control
  }
  if (!missing(hosp_location)) {
    defaults$hosp_location <- hosp_location
  }
  if (!missing(hosp_locteach)) {
    defaults$hosp_locteach <- hosp_locteach
  }
  if (!missing(hosp_region)) {
    defaults$hosp_region <- hosp_region
  }
  if (!missing(hosp_teach)) {
    defaults$hosp_teach <- hosp_teach
  }
  if (!missing(idnumber)) {
    defaults$idnumber <- idnumber
  }
  if (!missing(nis_stratum)) {
    defaults$nis_stratum <- nis_stratum
  }
  if (!missing(n_disc_u)) {
    defaults$n_disc_u <- n_disc_u
  }
  if (!missing(n_hosp_u)) {
    defaults$n_hosp_u <- n_hosp_u
  }
  if (!missing(s_disc_u)) {
    defaults$s_disc_u <- s_disc_u
  }
  if (!missing(s_hosp_u)) {
    defaults$s_hosp_u <- s_hosp_u
  }
  if (!missing(total_disc)) {
    defaults$total_disc <- total_disc
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(discwtcharge)) {
    defaults$discwtcharge <- discwtcharge
  }
  if (!missing(hfipsstco)) {
    defaults$hfipsstco <- hfipsstco
  }
  if (!missing(h_contrl)) {
    defaults$h_contrl <- h_contrl
  }
  if (!missing(hospstco)) {
    defaults$hospstco <- hospstco
  }
  if (!missing(hosp_rnpct)) {
    defaults$hosp_rnpct <- hosp_rnpct
  }
  if (!missing(hosp_rnfteapd)) {
    defaults$hosp_rnfteapd <- hosp_rnfteapd
  }
  if (!missing(hosp_lpnfteapd)) {
    defaults$hosp_lpnfteapd <- hosp_lpnfteapd
  }
  if (!missing(hosp_nafteapd)) {
    defaults$hosp_nafteapd <- hosp_nafteapd
  }
  if (!missing(hosp_opsurgpct)) {
    defaults$hosp_opsurgpct <- hosp_opsurgpct
  }
  if (!missing(hosp_mhsmember)) {
    defaults$hosp_mhsmember <- hosp_mhsmember
  }
  if (!missing(hosp_mhscluster)) {
    defaults$hosp_mhscluster <- hosp_mhscluster
  }
  assign("hospital", defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_severity <- function(hospid, key, aprdrg, aprdrg_risk_mortality, aprdrg_severity, cm_aids, cm_alcohol, cm_anemdef, cm_arth, cm_bldloss, cm_chf, cm_chrnlung, cm_coag, cm_depress, cm_dm, cm_dmcx, cm_drug, cm_htn_c, cm_hypothy, cm_liver, cm_lymph, cm_lytes, cm_mets, cm_neuro, cm_obese, cm_para, cm_perivasc, cm_psych, cm_pulmcirc, cm_renlfail, cm_tumor, cm_ulcer, cm_valve, cm_wghtloss, ds_dx_category1, ds_stage1, apsdrg, apsdrg_charge_weight, apsdrg_los_weight, apsdrg_mortality_weight, ds_los_level, ds_los_scale, ds_mrt_level, ds_mrt_scale, ds_rd_level, ds_rd_scale) {
  defaults <- get("severity", envir = defaultValues)
  if (!missing(hospid)) {
    defaults$hospid <- hospid
  }
  if (!missing(key)) {
    defaults$key <- key
  }
  if (!missing(aprdrg)) {
    defaults$aprdrg <- aprdrg
  }
  if (!missing(aprdrg_risk_mortality)) {
    defaults$aprdrg_risk_mortality <- aprdrg_risk_mortality
  }
  if (!missing(aprdrg_severity)) {
    defaults$aprdrg_severity <- aprdrg_severity
  }
  if (!missing(cm_aids)) {
    defaults$cm_aids <- cm_aids
  }
  if (!missing(cm_alcohol)) {
    defaults$cm_alcohol <- cm_alcohol
  }
  if (!missing(cm_anemdef)) {
    defaults$cm_anemdef <- cm_anemdef
  }
  if (!missing(cm_arth)) {
    defaults$cm_arth <- cm_arth
  }
  if (!missing(cm_bldloss)) {
    defaults$cm_bldloss <- cm_bldloss
  }
  if (!missing(cm_chf)) {
    defaults$cm_chf <- cm_chf
  }
  if (!missing(cm_chrnlung)) {
    defaults$cm_chrnlung <- cm_chrnlung
  }
  if (!missing(cm_coag)) {
    defaults$cm_coag <- cm_coag
  }
  if (!missing(cm_depress)) {
    defaults$cm_depress <- cm_depress
  }
  if (!missing(cm_dm)) {
    defaults$cm_dm <- cm_dm
  }
  if (!missing(cm_dmcx)) {
    defaults$cm_dmcx <- cm_dmcx
  }
  if (!missing(cm_drug)) {
    defaults$cm_drug <- cm_drug
  }
  if (!missing(cm_htn_c)) {
    defaults$cm_htn_c <- cm_htn_c
  }
  if (!missing(cm_hypothy)) {
    defaults$cm_hypothy <- cm_hypothy
  }
  if (!missing(cm_liver)) {
    defaults$cm_liver <- cm_liver
  }
  if (!missing(cm_lymph)) {
    defaults$cm_lymph <- cm_lymph
  }
  if (!missing(cm_lytes)) {
    defaults$cm_lytes <- cm_lytes
  }
  if (!missing(cm_mets)) {
    defaults$cm_mets <- cm_mets
  }
  if (!missing(cm_neuro)) {
    defaults$cm_neuro <- cm_neuro
  }
  if (!missing(cm_obese)) {
    defaults$cm_obese <- cm_obese
  }
  if (!missing(cm_para)) {
    defaults$cm_para <- cm_para
  }
  if (!missing(cm_perivasc)) {
    defaults$cm_perivasc <- cm_perivasc
  }
  if (!missing(cm_psych)) {
    defaults$cm_psych <- cm_psych
  }
  if (!missing(cm_pulmcirc)) {
    defaults$cm_pulmcirc <- cm_pulmcirc
  }
  if (!missing(cm_renlfail)) {
    defaults$cm_renlfail <- cm_renlfail
  }
  if (!missing(cm_tumor)) {
    defaults$cm_tumor <- cm_tumor
  }
  if (!missing(cm_ulcer)) {
    defaults$cm_ulcer <- cm_ulcer
  }
  if (!missing(cm_valve)) {
    defaults$cm_valve <- cm_valve
  }
  if (!missing(cm_wghtloss)) {
    defaults$cm_wghtloss <- cm_wghtloss
  }
  if (!missing(ds_dx_category1)) {
    defaults$ds_dx_category1 <- ds_dx_category1
  }
  if (!missing(ds_stage1)) {
    defaults$ds_stage1 <- ds_stage1
  }
  if (!missing(apsdrg)) {
    defaults$apsdrg <- apsdrg
  }
  if (!missing(apsdrg_charge_weight)) {
    defaults$apsdrg_charge_weight <- apsdrg_charge_weight
  }
  if (!missing(apsdrg_los_weight)) {
    defaults$apsdrg_los_weight <- apsdrg_los_weight
  }
  if (!missing(apsdrg_mortality_weight)) {
    defaults$apsdrg_mortality_weight <- apsdrg_mortality_weight
  }
  if (!missing(ds_los_level)) {
    defaults$ds_los_level <- ds_los_level
  }
  if (!missing(ds_los_scale)) {
    defaults$ds_los_scale <- ds_los_scale
  }
  if (!missing(ds_mrt_level)) {
    defaults$ds_mrt_level <- ds_mrt_level
  }
  if (!missing(ds_mrt_scale)) {
    defaults$ds_mrt_scale <- ds_mrt_scale
  }
  if (!missing(ds_rd_level)) {
    defaults$ds_rd_level <- ds_rd_level
  }
  if (!missing(ds_rd_scale)) {
    defaults$ds_rd_scale <- ds_rd_scale
  }
  assign("severity", defaults, envir = defaultValues)
  invisible(defaults)
}

get_defaults_core <- function() {
  defaults <- get("core", envir = defaultValues)
  return(defaults)
}

get_defaults_dx_pr_grps <- function() {
  defaults <- get("dx_pr_grps", envir = defaultValues)
  return(defaults)
}

get_defaults_hospital <- function() {
  defaults <- get("hospital", envir = defaultValues)
  return(defaults)
}

get_defaults_severity <- function() {
  defaults <- get("severity", envir = defaultValues)
  return(defaults)
}

add_core <- function(key, female, age, ageday, race, year, amonth, asource, asource_x, atype, aweekend, los, died, discwt, dispub92, dispuniform, dqtr, drg, drg18, drgver, dshospid, dx1, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dx10, dx11, dx12, dx13, dx14, dx15, dxccs1, dxccs2, dxccs3, dxccs4, dxccs5, dxccs6, dxccs7, dxccs8, dxccs9, dxccs10, dxccs11, dxccs12, dxccs13, dxccs14, dxccs15, hospid, hospst, hospstco, los_x, mdc, mdc18, mdnum1_s, mdnum2_s, ndx, neomat, nis_stratum, npr, pay1, pay1_x, pay2, pay2_x, pr1, pr2, pr3, pr4, pr5, pr6, pr7, pr8, pr9, pr10, pr11, pr12, pr13, pr14, pr15, prccs1, prccs2, prccs3, prccs4, prccs5, prccs6, prccs7, prccs8, prccs9, prccs10, prccs11, prccs12, prccs13, prccs14, prccs15, prday1, prday2, prday3, prday4, prday5, prday6, prday7, prday8, prday9, prday10, prday11, prday12, prday13, prday14, prday15, totchg, totchg_x, zipinc, discwtcharge, mdid_s, surgid_s, asourceub92, dispub04, dqtr_x, drg24, drg_nopoa, dx16, dx17, dx18, dx19, dx20, dx21, dx22, dx23, dx24, dx25, dxccs16, dxccs17, dxccs18, dxccs19, dxccs20, dxccs21, dxccs22, dxccs23, dxccs24, dxccs25, ecode1, ecode2, ecode3, ecode4, elective, e_ccs1, e_ccs2, e_ccs3, e_ccs4, hcup_ed, hospbrth, mdc24, mdc_nopoa, nchronic, necode, orproc, pl_nchs2006, pointoforiginub04, pointoforigin_x, tran_in, tran_out, zipinc_qrtl, mdnum1_r, mdnum2_r, pl_ur_cat4) {
  defaults <- get("core", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(key)) {
    key <- defaults$key
  }
  if (!is.null(key)) {
    insertFields <- c(insertFields, "[key]")
    insertValues <- c(insertValues, key)
  }

  if (missing(female)) {
    female <- defaults$female
  }
  if (!is.null(female)) {
    insertFields <- c(insertFields, "female")
    insertValues <- c(insertValues, female)
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    insertFields <- c(insertFields, "age")
    insertValues <- c(insertValues, age)
  }

  if (missing(ageday)) {
    ageday <- defaults$ageday
  }
  if (!is.null(ageday)) {
    insertFields <- c(insertFields, "ageday")
    insertValues <- c(insertValues, ageday)
  }

  if (missing(race)) {
    race <- defaults$race
  }
  if (!is.null(race)) {
    insertFields <- c(insertFields, "race")
    insertValues <- c(insertValues, race)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  if (missing(amonth)) {
    amonth <- defaults$amonth
  }
  if (!is.null(amonth)) {
    insertFields <- c(insertFields, "amonth")
    insertValues <- c(insertValues, amonth)
  }

  if (missing(asource)) {
    asource <- defaults$asource
  }
  if (!is.null(asource)) {
    insertFields <- c(insertFields, "asource")
    insertValues <- c(insertValues, asource)
  }

  if (missing(asource_x)) {
    asource_x <- defaults$asource_x
  }
  if (!is.null(asource_x)) {
    insertFields <- c(insertFields, "asource_x")
    insertValues <- c(insertValues, asource_x)
  }

  if (missing(atype)) {
    atype <- defaults$atype
  }
  if (!is.null(atype)) {
    insertFields <- c(insertFields, "atype")
    insertValues <- c(insertValues, atype)
  }

  if (missing(aweekend)) {
    aweekend <- defaults$aweekend
  }
  if (!is.null(aweekend)) {
    insertFields <- c(insertFields, "aweekend")
    insertValues <- c(insertValues, aweekend)
  }

  if (missing(los)) {
    los <- defaults$los
  }
  if (!is.null(los)) {
    insertFields <- c(insertFields, "los")
    insertValues <- c(insertValues, los)
  }

  if (missing(died)) {
    died <- defaults$died
  }
  if (!is.null(died)) {
    insertFields <- c(insertFields, "died")
    insertValues <- c(insertValues, died)
  }

  if (missing(discwt)) {
    discwt <- defaults$discwt
  }
  if (!is.null(discwt)) {
    insertFields <- c(insertFields, "discwt")
    insertValues <- c(insertValues, discwt)
  }

  if (missing(dispub92)) {
    dispub92 <- defaults$dispub92
  }
  if (!is.null(dispub92)) {
    insertFields <- c(insertFields, "dispub92")
    insertValues <- c(insertValues, dispub92)
  }

  if (missing(dispuniform)) {
    dispuniform <- defaults$dispuniform
  }
  if (!is.null(dispuniform)) {
    insertFields <- c(insertFields, "dispuniform")
    insertValues <- c(insertValues, dispuniform)
  }

  if (missing(dqtr)) {
    dqtr <- defaults$dqtr
  }
  if (!is.null(dqtr)) {
    insertFields <- c(insertFields, "dqtr")
    insertValues <- c(insertValues, dqtr)
  }

  if (missing(drg)) {
    drg <- defaults$drg
  }
  if (!is.null(drg)) {
    insertFields <- c(insertFields, "drg")
    insertValues <- c(insertValues, drg)
  }

  if (missing(drg18)) {
    drg18 <- defaults$drg18
  }
  if (!is.null(drg18)) {
    insertFields <- c(insertFields, "drg18")
    insertValues <- c(insertValues, drg18)
  }

  if (missing(drgver)) {
    drgver <- defaults$drgver
  }
  if (!is.null(drgver)) {
    insertFields <- c(insertFields, "drgver")
    insertValues <- c(insertValues, drgver)
  }

  if (missing(dshospid)) {
    dshospid <- defaults$dshospid
  }
  if (!is.null(dshospid)) {
    insertFields <- c(insertFields, "dshospid")
    insertValues <- c(insertValues, dshospid)
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    insertFields <- c(insertFields, "dx1")
    insertValues <- c(insertValues, dx1)
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    insertFields <- c(insertFields, "dx2")
    insertValues <- c(insertValues, dx2)
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    insertFields <- c(insertFields, "dx3")
    insertValues <- c(insertValues, dx3)
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    insertFields <- c(insertFields, "dx4")
    insertValues <- c(insertValues, dx4)
  }

  if (missing(dx5)) {
    dx5 <- defaults$dx5
  }
  if (!is.null(dx5)) {
    insertFields <- c(insertFields, "dx5")
    insertValues <- c(insertValues, dx5)
  }

  if (missing(dx6)) {
    dx6 <- defaults$dx6
  }
  if (!is.null(dx6)) {
    insertFields <- c(insertFields, "dx6")
    insertValues <- c(insertValues, dx6)
  }

  if (missing(dx7)) {
    dx7 <- defaults$dx7
  }
  if (!is.null(dx7)) {
    insertFields <- c(insertFields, "dx7")
    insertValues <- c(insertValues, dx7)
  }

  if (missing(dx8)) {
    dx8 <- defaults$dx8
  }
  if (!is.null(dx8)) {
    insertFields <- c(insertFields, "dx8")
    insertValues <- c(insertValues, dx8)
  }

  if (missing(dx9)) {
    dx9 <- defaults$dx9
  }
  if (!is.null(dx9)) {
    insertFields <- c(insertFields, "dx9")
    insertValues <- c(insertValues, dx9)
  }

  if (missing(dx10)) {
    dx10 <- defaults$dx10
  }
  if (!is.null(dx10)) {
    insertFields <- c(insertFields, "dx10")
    insertValues <- c(insertValues, dx10)
  }

  if (missing(dx11)) {
    dx11 <- defaults$dx11
  }
  if (!is.null(dx11)) {
    insertFields <- c(insertFields, "dx11")
    insertValues <- c(insertValues, dx11)
  }

  if (missing(dx12)) {
    dx12 <- defaults$dx12
  }
  if (!is.null(dx12)) {
    insertFields <- c(insertFields, "dx12")
    insertValues <- c(insertValues, dx12)
  }

  if (missing(dx13)) {
    dx13 <- defaults$dx13
  }
  if (!is.null(dx13)) {
    insertFields <- c(insertFields, "dx13")
    insertValues <- c(insertValues, dx13)
  }

  if (missing(dx14)) {
    dx14 <- defaults$dx14
  }
  if (!is.null(dx14)) {
    insertFields <- c(insertFields, "dx14")
    insertValues <- c(insertValues, dx14)
  }

  if (missing(dx15)) {
    dx15 <- defaults$dx15
  }
  if (!is.null(dx15)) {
    insertFields <- c(insertFields, "dx15")
    insertValues <- c(insertValues, dx15)
  }

  if (missing(dxccs1)) {
    dxccs1 <- defaults$dxccs1
  }
  if (!is.null(dxccs1)) {
    insertFields <- c(insertFields, "dxccs1")
    insertValues <- c(insertValues, dxccs1)
  }

  if (missing(dxccs2)) {
    dxccs2 <- defaults$dxccs2
  }
  if (!is.null(dxccs2)) {
    insertFields <- c(insertFields, "dxccs2")
    insertValues <- c(insertValues, dxccs2)
  }

  if (missing(dxccs3)) {
    dxccs3 <- defaults$dxccs3
  }
  if (!is.null(dxccs3)) {
    insertFields <- c(insertFields, "dxccs3")
    insertValues <- c(insertValues, dxccs3)
  }

  if (missing(dxccs4)) {
    dxccs4 <- defaults$dxccs4
  }
  if (!is.null(dxccs4)) {
    insertFields <- c(insertFields, "dxccs4")
    insertValues <- c(insertValues, dxccs4)
  }

  if (missing(dxccs5)) {
    dxccs5 <- defaults$dxccs5
  }
  if (!is.null(dxccs5)) {
    insertFields <- c(insertFields, "dxccs5")
    insertValues <- c(insertValues, dxccs5)
  }

  if (missing(dxccs6)) {
    dxccs6 <- defaults$dxccs6
  }
  if (!is.null(dxccs6)) {
    insertFields <- c(insertFields, "dxccs6")
    insertValues <- c(insertValues, dxccs6)
  }

  if (missing(dxccs7)) {
    dxccs7 <- defaults$dxccs7
  }
  if (!is.null(dxccs7)) {
    insertFields <- c(insertFields, "dxccs7")
    insertValues <- c(insertValues, dxccs7)
  }

  if (missing(dxccs8)) {
    dxccs8 <- defaults$dxccs8
  }
  if (!is.null(dxccs8)) {
    insertFields <- c(insertFields, "dxccs8")
    insertValues <- c(insertValues, dxccs8)
  }

  if (missing(dxccs9)) {
    dxccs9 <- defaults$dxccs9
  }
  if (!is.null(dxccs9)) {
    insertFields <- c(insertFields, "dxccs9")
    insertValues <- c(insertValues, dxccs9)
  }

  if (missing(dxccs10)) {
    dxccs10 <- defaults$dxccs10
  }
  if (!is.null(dxccs10)) {
    insertFields <- c(insertFields, "dxccs10")
    insertValues <- c(insertValues, dxccs10)
  }

  if (missing(dxccs11)) {
    dxccs11 <- defaults$dxccs11
  }
  if (!is.null(dxccs11)) {
    insertFields <- c(insertFields, "dxccs11")
    insertValues <- c(insertValues, dxccs11)
  }

  if (missing(dxccs12)) {
    dxccs12 <- defaults$dxccs12
  }
  if (!is.null(dxccs12)) {
    insertFields <- c(insertFields, "dxccs12")
    insertValues <- c(insertValues, dxccs12)
  }

  if (missing(dxccs13)) {
    dxccs13 <- defaults$dxccs13
  }
  if (!is.null(dxccs13)) {
    insertFields <- c(insertFields, "dxccs13")
    insertValues <- c(insertValues, dxccs13)
  }

  if (missing(dxccs14)) {
    dxccs14 <- defaults$dxccs14
  }
  if (!is.null(dxccs14)) {
    insertFields <- c(insertFields, "dxccs14")
    insertValues <- c(insertValues, dxccs14)
  }

  if (missing(dxccs15)) {
    dxccs15 <- defaults$dxccs15
  }
  if (!is.null(dxccs15)) {
    insertFields <- c(insertFields, "dxccs15")
    insertValues <- c(insertValues, dxccs15)
  }

  if (missing(hospid)) {
    hospid <- defaults$hospid
  }
  if (!is.null(hospid)) {
    insertFields <- c(insertFields, "hospid")
    insertValues <- c(insertValues, hospid)
  }

  if (missing(hospst)) {
    hospst <- defaults$hospst
  }
  if (!is.null(hospst)) {
    insertFields <- c(insertFields, "hospst")
    insertValues <- c(insertValues, hospst)
  }

  if (missing(hospstco)) {
    hospstco <- defaults$hospstco
  }
  if (!is.null(hospstco)) {
    insertFields <- c(insertFields, "hospstco")
    insertValues <- c(insertValues, hospstco)
  }

  if (missing(los_x)) {
    los_x <- defaults$los_x
  }
  if (!is.null(los_x)) {
    insertFields <- c(insertFields, "los_x")
    insertValues <- c(insertValues, los_x)
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    insertFields <- c(insertFields, "mdc")
    insertValues <- c(insertValues, mdc)
  }

  if (missing(mdc18)) {
    mdc18 <- defaults$mdc18
  }
  if (!is.null(mdc18)) {
    insertFields <- c(insertFields, "mdc18")
    insertValues <- c(insertValues, mdc18)
  }

  if (missing(mdnum1_s)) {
    mdnum1_s <- defaults$mdnum1_s
  }
  if (!is.null(mdnum1_s)) {
    insertFields <- c(insertFields, "mdnum1_s")
    insertValues <- c(insertValues, mdnum1_s)
  }

  if (missing(mdnum2_s)) {
    mdnum2_s <- defaults$mdnum2_s
  }
  if (!is.null(mdnum2_s)) {
    insertFields <- c(insertFields, "mdnum2_s")
    insertValues <- c(insertValues, mdnum2_s)
  }

  if (missing(ndx)) {
    ndx <- defaults$ndx
  }
  if (!is.null(ndx)) {
    insertFields <- c(insertFields, "ndx")
    insertValues <- c(insertValues, ndx)
  }

  if (missing(neomat)) {
    neomat <- defaults$neomat
  }
  if (!is.null(neomat)) {
    insertFields <- c(insertFields, "neomat")
    insertValues <- c(insertValues, neomat)
  }

  if (missing(nis_stratum)) {
    nis_stratum <- defaults$nis_stratum
  }
  if (!is.null(nis_stratum)) {
    insertFields <- c(insertFields, "nis_stratum")
    insertValues <- c(insertValues, nis_stratum)
  }

  if (missing(npr)) {
    npr <- defaults$npr
  }
  if (!is.null(npr)) {
    insertFields <- c(insertFields, "npr")
    insertValues <- c(insertValues, npr)
  }

  if (missing(pay1)) {
    pay1 <- defaults$pay1
  }
  if (!is.null(pay1)) {
    insertFields <- c(insertFields, "pay1")
    insertValues <- c(insertValues, pay1)
  }

  if (missing(pay1_x)) {
    pay1_x <- defaults$pay1_x
  }
  if (!is.null(pay1_x)) {
    insertFields <- c(insertFields, "pay1_x")
    insertValues <- c(insertValues, pay1_x)
  }

  if (missing(pay2)) {
    pay2 <- defaults$pay2
  }
  if (!is.null(pay2)) {
    insertFields <- c(insertFields, "pay2")
    insertValues <- c(insertValues, pay2)
  }

  if (missing(pay2_x)) {
    pay2_x <- defaults$pay2_x
  }
  if (!is.null(pay2_x)) {
    insertFields <- c(insertFields, "pay2_x")
    insertValues <- c(insertValues, pay2_x)
  }

  if (missing(pr1)) {
    pr1 <- defaults$pr1
  }
  if (!is.null(pr1)) {
    insertFields <- c(insertFields, "pr1")
    insertValues <- c(insertValues, pr1)
  }

  if (missing(pr2)) {
    pr2 <- defaults$pr2
  }
  if (!is.null(pr2)) {
    insertFields <- c(insertFields, "pr2")
    insertValues <- c(insertValues, pr2)
  }

  if (missing(pr3)) {
    pr3 <- defaults$pr3
  }
  if (!is.null(pr3)) {
    insertFields <- c(insertFields, "pr3")
    insertValues <- c(insertValues, pr3)
  }

  if (missing(pr4)) {
    pr4 <- defaults$pr4
  }
  if (!is.null(pr4)) {
    insertFields <- c(insertFields, "pr4")
    insertValues <- c(insertValues, pr4)
  }

  if (missing(pr5)) {
    pr5 <- defaults$pr5
  }
  if (!is.null(pr5)) {
    insertFields <- c(insertFields, "pr5")
    insertValues <- c(insertValues, pr5)
  }

  if (missing(pr6)) {
    pr6 <- defaults$pr6
  }
  if (!is.null(pr6)) {
    insertFields <- c(insertFields, "pr6")
    insertValues <- c(insertValues, pr6)
  }

  if (missing(pr7)) {
    pr7 <- defaults$pr7
  }
  if (!is.null(pr7)) {
    insertFields <- c(insertFields, "pr7")
    insertValues <- c(insertValues, pr7)
  }

  if (missing(pr8)) {
    pr8 <- defaults$pr8
  }
  if (!is.null(pr8)) {
    insertFields <- c(insertFields, "pr8")
    insertValues <- c(insertValues, pr8)
  }

  if (missing(pr9)) {
    pr9 <- defaults$pr9
  }
  if (!is.null(pr9)) {
    insertFields <- c(insertFields, "pr9")
    insertValues <- c(insertValues, pr9)
  }

  if (missing(pr10)) {
    pr10 <- defaults$pr10
  }
  if (!is.null(pr10)) {
    insertFields <- c(insertFields, "pr10")
    insertValues <- c(insertValues, pr10)
  }

  if (missing(pr11)) {
    pr11 <- defaults$pr11
  }
  if (!is.null(pr11)) {
    insertFields <- c(insertFields, "pr11")
    insertValues <- c(insertValues, pr11)
  }

  if (missing(pr12)) {
    pr12 <- defaults$pr12
  }
  if (!is.null(pr12)) {
    insertFields <- c(insertFields, "pr12")
    insertValues <- c(insertValues, pr12)
  }

  if (missing(pr13)) {
    pr13 <- defaults$pr13
  }
  if (!is.null(pr13)) {
    insertFields <- c(insertFields, "pr13")
    insertValues <- c(insertValues, pr13)
  }

  if (missing(pr14)) {
    pr14 <- defaults$pr14
  }
  if (!is.null(pr14)) {
    insertFields <- c(insertFields, "pr14")
    insertValues <- c(insertValues, pr14)
  }

  if (missing(pr15)) {
    pr15 <- defaults$pr15
  }
  if (!is.null(pr15)) {
    insertFields <- c(insertFields, "pr15")
    insertValues <- c(insertValues, pr15)
  }

  if (missing(prccs1)) {
    prccs1 <- defaults$prccs1
  }
  if (!is.null(prccs1)) {
    insertFields <- c(insertFields, "prccs1")
    insertValues <- c(insertValues, prccs1)
  }

  if (missing(prccs2)) {
    prccs2 <- defaults$prccs2
  }
  if (!is.null(prccs2)) {
    insertFields <- c(insertFields, "prccs2")
    insertValues <- c(insertValues, prccs2)
  }

  if (missing(prccs3)) {
    prccs3 <- defaults$prccs3
  }
  if (!is.null(prccs3)) {
    insertFields <- c(insertFields, "prccs3")
    insertValues <- c(insertValues, prccs3)
  }

  if (missing(prccs4)) {
    prccs4 <- defaults$prccs4
  }
  if (!is.null(prccs4)) {
    insertFields <- c(insertFields, "prccs4")
    insertValues <- c(insertValues, prccs4)
  }

  if (missing(prccs5)) {
    prccs5 <- defaults$prccs5
  }
  if (!is.null(prccs5)) {
    insertFields <- c(insertFields, "prccs5")
    insertValues <- c(insertValues, prccs5)
  }

  if (missing(prccs6)) {
    prccs6 <- defaults$prccs6
  }
  if (!is.null(prccs6)) {
    insertFields <- c(insertFields, "prccs6")
    insertValues <- c(insertValues, prccs6)
  }

  if (missing(prccs7)) {
    prccs7 <- defaults$prccs7
  }
  if (!is.null(prccs7)) {
    insertFields <- c(insertFields, "prccs7")
    insertValues <- c(insertValues, prccs7)
  }

  if (missing(prccs8)) {
    prccs8 <- defaults$prccs8
  }
  if (!is.null(prccs8)) {
    insertFields <- c(insertFields, "prccs8")
    insertValues <- c(insertValues, prccs8)
  }

  if (missing(prccs9)) {
    prccs9 <- defaults$prccs9
  }
  if (!is.null(prccs9)) {
    insertFields <- c(insertFields, "prccs9")
    insertValues <- c(insertValues, prccs9)
  }

  if (missing(prccs10)) {
    prccs10 <- defaults$prccs10
  }
  if (!is.null(prccs10)) {
    insertFields <- c(insertFields, "prccs10")
    insertValues <- c(insertValues, prccs10)
  }

  if (missing(prccs11)) {
    prccs11 <- defaults$prccs11
  }
  if (!is.null(prccs11)) {
    insertFields <- c(insertFields, "prccs11")
    insertValues <- c(insertValues, prccs11)
  }

  if (missing(prccs12)) {
    prccs12 <- defaults$prccs12
  }
  if (!is.null(prccs12)) {
    insertFields <- c(insertFields, "prccs12")
    insertValues <- c(insertValues, prccs12)
  }

  if (missing(prccs13)) {
    prccs13 <- defaults$prccs13
  }
  if (!is.null(prccs13)) {
    insertFields <- c(insertFields, "prccs13")
    insertValues <- c(insertValues, prccs13)
  }

  if (missing(prccs14)) {
    prccs14 <- defaults$prccs14
  }
  if (!is.null(prccs14)) {
    insertFields <- c(insertFields, "prccs14")
    insertValues <- c(insertValues, prccs14)
  }

  if (missing(prccs15)) {
    prccs15 <- defaults$prccs15
  }
  if (!is.null(prccs15)) {
    insertFields <- c(insertFields, "prccs15")
    insertValues <- c(insertValues, prccs15)
  }

  if (missing(prday1)) {
    prday1 <- defaults$prday1
  }
  if (!is.null(prday1)) {
    insertFields <- c(insertFields, "prday1")
    insertValues <- c(insertValues, prday1)
  }

  if (missing(prday2)) {
    prday2 <- defaults$prday2
  }
  if (!is.null(prday2)) {
    insertFields <- c(insertFields, "prday2")
    insertValues <- c(insertValues, prday2)
  }

  if (missing(prday3)) {
    prday3 <- defaults$prday3
  }
  if (!is.null(prday3)) {
    insertFields <- c(insertFields, "prday3")
    insertValues <- c(insertValues, prday3)
  }

  if (missing(prday4)) {
    prday4 <- defaults$prday4
  }
  if (!is.null(prday4)) {
    insertFields <- c(insertFields, "prday4")
    insertValues <- c(insertValues, prday4)
  }

  if (missing(prday5)) {
    prday5 <- defaults$prday5
  }
  if (!is.null(prday5)) {
    insertFields <- c(insertFields, "prday5")
    insertValues <- c(insertValues, prday5)
  }

  if (missing(prday6)) {
    prday6 <- defaults$prday6
  }
  if (!is.null(prday6)) {
    insertFields <- c(insertFields, "prday6")
    insertValues <- c(insertValues, prday6)
  }

  if (missing(prday7)) {
    prday7 <- defaults$prday7
  }
  if (!is.null(prday7)) {
    insertFields <- c(insertFields, "prday7")
    insertValues <- c(insertValues, prday7)
  }

  if (missing(prday8)) {
    prday8 <- defaults$prday8
  }
  if (!is.null(prday8)) {
    insertFields <- c(insertFields, "prday8")
    insertValues <- c(insertValues, prday8)
  }

  if (missing(prday9)) {
    prday9 <- defaults$prday9
  }
  if (!is.null(prday9)) {
    insertFields <- c(insertFields, "prday9")
    insertValues <- c(insertValues, prday9)
  }

  if (missing(prday10)) {
    prday10 <- defaults$prday10
  }
  if (!is.null(prday10)) {
    insertFields <- c(insertFields, "prday10")
    insertValues <- c(insertValues, prday10)
  }

  if (missing(prday11)) {
    prday11 <- defaults$prday11
  }
  if (!is.null(prday11)) {
    insertFields <- c(insertFields, "prday11")
    insertValues <- c(insertValues, prday11)
  }

  if (missing(prday12)) {
    prday12 <- defaults$prday12
  }
  if (!is.null(prday12)) {
    insertFields <- c(insertFields, "prday12")
    insertValues <- c(insertValues, prday12)
  }

  if (missing(prday13)) {
    prday13 <- defaults$prday13
  }
  if (!is.null(prday13)) {
    insertFields <- c(insertFields, "prday13")
    insertValues <- c(insertValues, prday13)
  }

  if (missing(prday14)) {
    prday14 <- defaults$prday14
  }
  if (!is.null(prday14)) {
    insertFields <- c(insertFields, "prday14")
    insertValues <- c(insertValues, prday14)
  }

  if (missing(prday15)) {
    prday15 <- defaults$prday15
  }
  if (!is.null(prday15)) {
    insertFields <- c(insertFields, "prday15")
    insertValues <- c(insertValues, prday15)
  }

  if (missing(totchg)) {
    totchg <- defaults$totchg
  }
  if (!is.null(totchg)) {
    insertFields <- c(insertFields, "totchg")
    insertValues <- c(insertValues, totchg)
  }

  if (missing(totchg_x)) {
    totchg_x <- defaults$totchg_x
  }
  if (!is.null(totchg_x)) {
    insertFields <- c(insertFields, "totchg_x")
    insertValues <- c(insertValues, totchg_x)
  }

  if (missing(zipinc)) {
    zipinc <- defaults$zipinc
  }
  if (!is.null(zipinc)) {
    insertFields <- c(insertFields, "zipinc")
    insertValues <- c(insertValues, zipinc)
  }

  if (missing(discwtcharge)) {
    discwtcharge <- defaults$discwtcharge
  }
  if (!is.null(discwtcharge)) {
    insertFields <- c(insertFields, "discwtcharge")
    insertValues <- c(insertValues, discwtcharge)
  }

  if (missing(mdid_s)) {
    mdid_s <- defaults$mdid_s
  }
  if (!is.null(mdid_s)) {
    insertFields <- c(insertFields, "mdid_s")
    insertValues <- c(insertValues, mdid_s)
  }

  if (missing(surgid_s)) {
    surgid_s <- defaults$surgid_s
  }
  if (!is.null(surgid_s)) {
    insertFields <- c(insertFields, "surgid_s")
    insertValues <- c(insertValues, surgid_s)
  }

  if (missing(asourceub92)) {
    asourceub92 <- defaults$asourceub92
  }
  if (!is.null(asourceub92)) {
    insertFields <- c(insertFields, "asourceub92")
    insertValues <- c(insertValues, asourceub92)
  }

  if (missing(dispub04)) {
    dispub04 <- defaults$dispub04
  }
  if (!is.null(dispub04)) {
    insertFields <- c(insertFields, "dispub04")
    insertValues <- c(insertValues, dispub04)
  }

  if (missing(dqtr_x)) {
    dqtr_x <- defaults$dqtr_x
  }
  if (!is.null(dqtr_x)) {
    insertFields <- c(insertFields, "dqtr_x")
    insertValues <- c(insertValues, dqtr_x)
  }

  if (missing(drg24)) {
    drg24 <- defaults$drg24
  }
  if (!is.null(drg24)) {
    insertFields <- c(insertFields, "drg24")
    insertValues <- c(insertValues, drg24)
  }

  if (missing(drg_nopoa)) {
    drg_nopoa <- defaults$drg_nopoa
  }
  if (!is.null(drg_nopoa)) {
    insertFields <- c(insertFields, "drg_nopoa")
    insertValues <- c(insertValues, drg_nopoa)
  }

  if (missing(dx16)) {
    dx16 <- defaults$dx16
  }
  if (!is.null(dx16)) {
    insertFields <- c(insertFields, "dx16")
    insertValues <- c(insertValues, dx16)
  }

  if (missing(dx17)) {
    dx17 <- defaults$dx17
  }
  if (!is.null(dx17)) {
    insertFields <- c(insertFields, "dx17")
    insertValues <- c(insertValues, dx17)
  }

  if (missing(dx18)) {
    dx18 <- defaults$dx18
  }
  if (!is.null(dx18)) {
    insertFields <- c(insertFields, "dx18")
    insertValues <- c(insertValues, dx18)
  }

  if (missing(dx19)) {
    dx19 <- defaults$dx19
  }
  if (!is.null(dx19)) {
    insertFields <- c(insertFields, "dx19")
    insertValues <- c(insertValues, dx19)
  }

  if (missing(dx20)) {
    dx20 <- defaults$dx20
  }
  if (!is.null(dx20)) {
    insertFields <- c(insertFields, "dx20")
    insertValues <- c(insertValues, dx20)
  }

  if (missing(dx21)) {
    dx21 <- defaults$dx21
  }
  if (!is.null(dx21)) {
    insertFields <- c(insertFields, "dx21")
    insertValues <- c(insertValues, dx21)
  }

  if (missing(dx22)) {
    dx22 <- defaults$dx22
  }
  if (!is.null(dx22)) {
    insertFields <- c(insertFields, "dx22")
    insertValues <- c(insertValues, dx22)
  }

  if (missing(dx23)) {
    dx23 <- defaults$dx23
  }
  if (!is.null(dx23)) {
    insertFields <- c(insertFields, "dx23")
    insertValues <- c(insertValues, dx23)
  }

  if (missing(dx24)) {
    dx24 <- defaults$dx24
  }
  if (!is.null(dx24)) {
    insertFields <- c(insertFields, "dx24")
    insertValues <- c(insertValues, dx24)
  }

  if (missing(dx25)) {
    dx25 <- defaults$dx25
  }
  if (!is.null(dx25)) {
    insertFields <- c(insertFields, "dx25")
    insertValues <- c(insertValues, dx25)
  }

  if (missing(dxccs16)) {
    dxccs16 <- defaults$dxccs16
  }
  if (!is.null(dxccs16)) {
    insertFields <- c(insertFields, "dxccs16")
    insertValues <- c(insertValues, dxccs16)
  }

  if (missing(dxccs17)) {
    dxccs17 <- defaults$dxccs17
  }
  if (!is.null(dxccs17)) {
    insertFields <- c(insertFields, "dxccs17")
    insertValues <- c(insertValues, dxccs17)
  }

  if (missing(dxccs18)) {
    dxccs18 <- defaults$dxccs18
  }
  if (!is.null(dxccs18)) {
    insertFields <- c(insertFields, "dxccs18")
    insertValues <- c(insertValues, dxccs18)
  }

  if (missing(dxccs19)) {
    dxccs19 <- defaults$dxccs19
  }
  if (!is.null(dxccs19)) {
    insertFields <- c(insertFields, "dxccs19")
    insertValues <- c(insertValues, dxccs19)
  }

  if (missing(dxccs20)) {
    dxccs20 <- defaults$dxccs20
  }
  if (!is.null(dxccs20)) {
    insertFields <- c(insertFields, "dxccs20")
    insertValues <- c(insertValues, dxccs20)
  }

  if (missing(dxccs21)) {
    dxccs21 <- defaults$dxccs21
  }
  if (!is.null(dxccs21)) {
    insertFields <- c(insertFields, "dxccs21")
    insertValues <- c(insertValues, dxccs21)
  }

  if (missing(dxccs22)) {
    dxccs22 <- defaults$dxccs22
  }
  if (!is.null(dxccs22)) {
    insertFields <- c(insertFields, "dxccs22")
    insertValues <- c(insertValues, dxccs22)
  }

  if (missing(dxccs23)) {
    dxccs23 <- defaults$dxccs23
  }
  if (!is.null(dxccs23)) {
    insertFields <- c(insertFields, "dxccs23")
    insertValues <- c(insertValues, dxccs23)
  }

  if (missing(dxccs24)) {
    dxccs24 <- defaults$dxccs24
  }
  if (!is.null(dxccs24)) {
    insertFields <- c(insertFields, "dxccs24")
    insertValues <- c(insertValues, dxccs24)
  }

  if (missing(dxccs25)) {
    dxccs25 <- defaults$dxccs25
  }
  if (!is.null(dxccs25)) {
    insertFields <- c(insertFields, "dxccs25")
    insertValues <- c(insertValues, dxccs25)
  }

  if (missing(ecode1)) {
    ecode1 <- defaults$ecode1
  }
  if (!is.null(ecode1)) {
    insertFields <- c(insertFields, "ecode1")
    insertValues <- c(insertValues, ecode1)
  }

  if (missing(ecode2)) {
    ecode2 <- defaults$ecode2
  }
  if (!is.null(ecode2)) {
    insertFields <- c(insertFields, "ecode2")
    insertValues <- c(insertValues, ecode2)
  }

  if (missing(ecode3)) {
    ecode3 <- defaults$ecode3
  }
  if (!is.null(ecode3)) {
    insertFields <- c(insertFields, "ecode3")
    insertValues <- c(insertValues, ecode3)
  }

  if (missing(ecode4)) {
    ecode4 <- defaults$ecode4
  }
  if (!is.null(ecode4)) {
    insertFields <- c(insertFields, "ecode4")
    insertValues <- c(insertValues, ecode4)
  }

  if (missing(elective)) {
    elective <- defaults$elective
  }
  if (!is.null(elective)) {
    insertFields <- c(insertFields, "elective")
    insertValues <- c(insertValues, elective)
  }

  if (missing(e_ccs1)) {
    e_ccs1 <- defaults$e_ccs1
  }
  if (!is.null(e_ccs1)) {
    insertFields <- c(insertFields, "e_ccs1")
    insertValues <- c(insertValues, e_ccs1)
  }

  if (missing(e_ccs2)) {
    e_ccs2 <- defaults$e_ccs2
  }
  if (!is.null(e_ccs2)) {
    insertFields <- c(insertFields, "e_ccs2")
    insertValues <- c(insertValues, e_ccs2)
  }

  if (missing(e_ccs3)) {
    e_ccs3 <- defaults$e_ccs3
  }
  if (!is.null(e_ccs3)) {
    insertFields <- c(insertFields, "e_ccs3")
    insertValues <- c(insertValues, e_ccs3)
  }

  if (missing(e_ccs4)) {
    e_ccs4 <- defaults$e_ccs4
  }
  if (!is.null(e_ccs4)) {
    insertFields <- c(insertFields, "e_ccs4")
    insertValues <- c(insertValues, e_ccs4)
  }

  if (missing(hcup_ed)) {
    hcup_ed <- defaults$hcup_ed
  }
  if (!is.null(hcup_ed)) {
    insertFields <- c(insertFields, "hcup_ed")
    insertValues <- c(insertValues, hcup_ed)
  }

  if (missing(hospbrth)) {
    hospbrth <- defaults$hospbrth
  }
  if (!is.null(hospbrth)) {
    insertFields <- c(insertFields, "hospbrth")
    insertValues <- c(insertValues, hospbrth)
  }

  if (missing(mdc24)) {
    mdc24 <- defaults$mdc24
  }
  if (!is.null(mdc24)) {
    insertFields <- c(insertFields, "mdc24")
    insertValues <- c(insertValues, mdc24)
  }

  if (missing(mdc_nopoa)) {
    mdc_nopoa <- defaults$mdc_nopoa
  }
  if (!is.null(mdc_nopoa)) {
    insertFields <- c(insertFields, "mdc_nopoa")
    insertValues <- c(insertValues, mdc_nopoa)
  }

  if (missing(nchronic)) {
    nchronic <- defaults$nchronic
  }
  if (!is.null(nchronic)) {
    insertFields <- c(insertFields, "nchronic")
    insertValues <- c(insertValues, nchronic)
  }

  if (missing(necode)) {
    necode <- defaults$necode
  }
  if (!is.null(necode)) {
    insertFields <- c(insertFields, "necode")
    insertValues <- c(insertValues, necode)
  }

  if (missing(orproc)) {
    orproc <- defaults$orproc
  }
  if (!is.null(orproc)) {
    insertFields <- c(insertFields, "orproc")
    insertValues <- c(insertValues, orproc)
  }

  if (missing(pl_nchs2006)) {
    pl_nchs2006 <- defaults$pl_nchs2006
  }
  if (!is.null(pl_nchs2006)) {
    insertFields <- c(insertFields, "pl_nchs2006")
    insertValues <- c(insertValues, pl_nchs2006)
  }

  if (missing(pointoforiginub04)) {
    pointoforiginub04 <- defaults$pointoforiginub04
  }
  if (!is.null(pointoforiginub04)) {
    insertFields <- c(insertFields, "pointoforiginub04")
    insertValues <- c(insertValues, pointoforiginub04)
  }

  if (missing(pointoforigin_x)) {
    pointoforigin_x <- defaults$pointoforigin_x
  }
  if (!is.null(pointoforigin_x)) {
    insertFields <- c(insertFields, "pointoforigin_x")
    insertValues <- c(insertValues, pointoforigin_x)
  }

  if (missing(tran_in)) {
    tran_in <- defaults$tran_in
  }
  if (!is.null(tran_in)) {
    insertFields <- c(insertFields, "tran_in")
    insertValues <- c(insertValues, tran_in)
  }

  if (missing(tran_out)) {
    tran_out <- defaults$tran_out
  }
  if (!is.null(tran_out)) {
    insertFields <- c(insertFields, "tran_out")
    insertValues <- c(insertValues, tran_out)
  }

  if (missing(zipinc_qrtl)) {
    zipinc_qrtl <- defaults$zipinc_qrtl
  }
  if (!is.null(zipinc_qrtl)) {
    insertFields <- c(insertFields, "zipinc_qrtl")
    insertValues <- c(insertValues, zipinc_qrtl)
  }

  if (missing(mdnum1_r)) {
    mdnum1_r <- defaults$mdnum1_r
  }
  if (!is.null(mdnum1_r)) {
    insertFields <- c(insertFields, "mdnum1_r")
    insertValues <- c(insertValues, mdnum1_r)
  }

  if (missing(mdnum2_r)) {
    mdnum2_r <- defaults$mdnum2_r
  }
  if (!is.null(mdnum2_r)) {
    insertFields <- c(insertFields, "mdnum2_r")
    insertValues <- c(insertValues, mdnum2_r)
  }

  if (missing(pl_ur_cat4)) {
    pl_ur_cat4 <- defaults$pl_ur_cat4
  }
  if (!is.null(pl_ur_cat4)) {
    insertFields <- c(insertFields, "pl_ur_cat4")
    insertValues <- c(insertValues, pl_ur_cat4)
  }

  statement <- paste0("INSERT INTO core (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add_dx_pr_grps <- function(hospid, key, chron1, chron2, chron3, chron4, chron5, chron6, chron7, chron8, chron9, chron10, chron11, chron12, chron13, chron14, chron15, chron16, chron17, chron18, chron19, chron20, chron21, chron22, chron23, chron24, chron25, chronb1, chronb2, chronb3, chronb4, chronb5, chronb6, chronb7, chronb8, chronb9, chronb10, chronb11, chronb12, chronb13, chronb14, chronb15, chronb16, chronb17, chronb18, chronb19, chronb20, chronb21, chronb22, chronb23, chronb24, chronb25, dxmccs1, e_mccs1, pclass1, pclass2, pclass3, pclass4, pclass5, pclass6, pclass7, pclass8, pclass9, pclass10, pclass11, pclass12, pclass13, pclass14, pclass15, prmccs1, ccsmgn1, ccsmgn2, ccsmgn3, ccsmgn4, ccsmgn5, ccsmgn6, ccsmgn7, ccsmgn8, ccsmgn9, ccsmgn10, ccsmgn11, ccsmgn12, ccsmgn13, ccsmgn14, ccsmgn15, ccsmsp1, ccsmsp2, ccsmsp3, ccsmsp4, ccsmsp5, ccsmsp6, ccsmsp7, ccsmsp8, ccsmsp9, ccsmsp10, ccsmsp11, ccsmsp12, ccsmsp13, ccsmsp14, ccsmsp15, eccsmgn1, eccsmgn2, eccsmgn3, eccsmgn4) {
  defaults <- get("dx_pr_grps", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(hospid)) {
    hospid <- defaults$hospid
  }
  if (!is.null(hospid)) {
    insertFields <- c(insertFields, "hospid")
    insertValues <- c(insertValues, hospid)
  }

  if (missing(key)) {
    key <- defaults$key
  }
  if (!is.null(key)) {
    insertFields <- c(insertFields, "[key]")
    insertValues <- c(insertValues, key)
  }

  if (missing(chron1)) {
    chron1 <- defaults$chron1
  }
  if (!is.null(chron1)) {
    insertFields <- c(insertFields, "chron1")
    insertValues <- c(insertValues, chron1)
  }

  if (missing(chron2)) {
    chron2 <- defaults$chron2
  }
  if (!is.null(chron2)) {
    insertFields <- c(insertFields, "chron2")
    insertValues <- c(insertValues, chron2)
  }

  if (missing(chron3)) {
    chron3 <- defaults$chron3
  }
  if (!is.null(chron3)) {
    insertFields <- c(insertFields, "chron3")
    insertValues <- c(insertValues, chron3)
  }

  if (missing(chron4)) {
    chron4 <- defaults$chron4
  }
  if (!is.null(chron4)) {
    insertFields <- c(insertFields, "chron4")
    insertValues <- c(insertValues, chron4)
  }

  if (missing(chron5)) {
    chron5 <- defaults$chron5
  }
  if (!is.null(chron5)) {
    insertFields <- c(insertFields, "chron5")
    insertValues <- c(insertValues, chron5)
  }

  if (missing(chron6)) {
    chron6 <- defaults$chron6
  }
  if (!is.null(chron6)) {
    insertFields <- c(insertFields, "chron6")
    insertValues <- c(insertValues, chron6)
  }

  if (missing(chron7)) {
    chron7 <- defaults$chron7
  }
  if (!is.null(chron7)) {
    insertFields <- c(insertFields, "chron7")
    insertValues <- c(insertValues, chron7)
  }

  if (missing(chron8)) {
    chron8 <- defaults$chron8
  }
  if (!is.null(chron8)) {
    insertFields <- c(insertFields, "chron8")
    insertValues <- c(insertValues, chron8)
  }

  if (missing(chron9)) {
    chron9 <- defaults$chron9
  }
  if (!is.null(chron9)) {
    insertFields <- c(insertFields, "chron9")
    insertValues <- c(insertValues, chron9)
  }

  if (missing(chron10)) {
    chron10 <- defaults$chron10
  }
  if (!is.null(chron10)) {
    insertFields <- c(insertFields, "chron10")
    insertValues <- c(insertValues, chron10)
  }

  if (missing(chron11)) {
    chron11 <- defaults$chron11
  }
  if (!is.null(chron11)) {
    insertFields <- c(insertFields, "chron11")
    insertValues <- c(insertValues, chron11)
  }

  if (missing(chron12)) {
    chron12 <- defaults$chron12
  }
  if (!is.null(chron12)) {
    insertFields <- c(insertFields, "chron12")
    insertValues <- c(insertValues, chron12)
  }

  if (missing(chron13)) {
    chron13 <- defaults$chron13
  }
  if (!is.null(chron13)) {
    insertFields <- c(insertFields, "chron13")
    insertValues <- c(insertValues, chron13)
  }

  if (missing(chron14)) {
    chron14 <- defaults$chron14
  }
  if (!is.null(chron14)) {
    insertFields <- c(insertFields, "chron14")
    insertValues <- c(insertValues, chron14)
  }

  if (missing(chron15)) {
    chron15 <- defaults$chron15
  }
  if (!is.null(chron15)) {
    insertFields <- c(insertFields, "chron15")
    insertValues <- c(insertValues, chron15)
  }

  if (missing(chron16)) {
    chron16 <- defaults$chron16
  }
  if (!is.null(chron16)) {
    insertFields <- c(insertFields, "chron16")
    insertValues <- c(insertValues, chron16)
  }

  if (missing(chron17)) {
    chron17 <- defaults$chron17
  }
  if (!is.null(chron17)) {
    insertFields <- c(insertFields, "chron17")
    insertValues <- c(insertValues, chron17)
  }

  if (missing(chron18)) {
    chron18 <- defaults$chron18
  }
  if (!is.null(chron18)) {
    insertFields <- c(insertFields, "chron18")
    insertValues <- c(insertValues, chron18)
  }

  if (missing(chron19)) {
    chron19 <- defaults$chron19
  }
  if (!is.null(chron19)) {
    insertFields <- c(insertFields, "chron19")
    insertValues <- c(insertValues, chron19)
  }

  if (missing(chron20)) {
    chron20 <- defaults$chron20
  }
  if (!is.null(chron20)) {
    insertFields <- c(insertFields, "chron20")
    insertValues <- c(insertValues, chron20)
  }

  if (missing(chron21)) {
    chron21 <- defaults$chron21
  }
  if (!is.null(chron21)) {
    insertFields <- c(insertFields, "chron21")
    insertValues <- c(insertValues, chron21)
  }

  if (missing(chron22)) {
    chron22 <- defaults$chron22
  }
  if (!is.null(chron22)) {
    insertFields <- c(insertFields, "chron22")
    insertValues <- c(insertValues, chron22)
  }

  if (missing(chron23)) {
    chron23 <- defaults$chron23
  }
  if (!is.null(chron23)) {
    insertFields <- c(insertFields, "chron23")
    insertValues <- c(insertValues, chron23)
  }

  if (missing(chron24)) {
    chron24 <- defaults$chron24
  }
  if (!is.null(chron24)) {
    insertFields <- c(insertFields, "chron24")
    insertValues <- c(insertValues, chron24)
  }

  if (missing(chron25)) {
    chron25 <- defaults$chron25
  }
  if (!is.null(chron25)) {
    insertFields <- c(insertFields, "chron25")
    insertValues <- c(insertValues, chron25)
  }

  if (missing(chronb1)) {
    chronb1 <- defaults$chronb1
  }
  if (!is.null(chronb1)) {
    insertFields <- c(insertFields, "chronb1")
    insertValues <- c(insertValues, chronb1)
  }

  if (missing(chronb2)) {
    chronb2 <- defaults$chronb2
  }
  if (!is.null(chronb2)) {
    insertFields <- c(insertFields, "chronb2")
    insertValues <- c(insertValues, chronb2)
  }

  if (missing(chronb3)) {
    chronb3 <- defaults$chronb3
  }
  if (!is.null(chronb3)) {
    insertFields <- c(insertFields, "chronb3")
    insertValues <- c(insertValues, chronb3)
  }

  if (missing(chronb4)) {
    chronb4 <- defaults$chronb4
  }
  if (!is.null(chronb4)) {
    insertFields <- c(insertFields, "chronb4")
    insertValues <- c(insertValues, chronb4)
  }

  if (missing(chronb5)) {
    chronb5 <- defaults$chronb5
  }
  if (!is.null(chronb5)) {
    insertFields <- c(insertFields, "chronb5")
    insertValues <- c(insertValues, chronb5)
  }

  if (missing(chronb6)) {
    chronb6 <- defaults$chronb6
  }
  if (!is.null(chronb6)) {
    insertFields <- c(insertFields, "chronb6")
    insertValues <- c(insertValues, chronb6)
  }

  if (missing(chronb7)) {
    chronb7 <- defaults$chronb7
  }
  if (!is.null(chronb7)) {
    insertFields <- c(insertFields, "chronb7")
    insertValues <- c(insertValues, chronb7)
  }

  if (missing(chronb8)) {
    chronb8 <- defaults$chronb8
  }
  if (!is.null(chronb8)) {
    insertFields <- c(insertFields, "chronb8")
    insertValues <- c(insertValues, chronb8)
  }

  if (missing(chronb9)) {
    chronb9 <- defaults$chronb9
  }
  if (!is.null(chronb9)) {
    insertFields <- c(insertFields, "chronb9")
    insertValues <- c(insertValues, chronb9)
  }

  if (missing(chronb10)) {
    chronb10 <- defaults$chronb10
  }
  if (!is.null(chronb10)) {
    insertFields <- c(insertFields, "chronb10")
    insertValues <- c(insertValues, chronb10)
  }

  if (missing(chronb11)) {
    chronb11 <- defaults$chronb11
  }
  if (!is.null(chronb11)) {
    insertFields <- c(insertFields, "chronb11")
    insertValues <- c(insertValues, chronb11)
  }

  if (missing(chronb12)) {
    chronb12 <- defaults$chronb12
  }
  if (!is.null(chronb12)) {
    insertFields <- c(insertFields, "chronb12")
    insertValues <- c(insertValues, chronb12)
  }

  if (missing(chronb13)) {
    chronb13 <- defaults$chronb13
  }
  if (!is.null(chronb13)) {
    insertFields <- c(insertFields, "chronb13")
    insertValues <- c(insertValues, chronb13)
  }

  if (missing(chronb14)) {
    chronb14 <- defaults$chronb14
  }
  if (!is.null(chronb14)) {
    insertFields <- c(insertFields, "chronb14")
    insertValues <- c(insertValues, chronb14)
  }

  if (missing(chronb15)) {
    chronb15 <- defaults$chronb15
  }
  if (!is.null(chronb15)) {
    insertFields <- c(insertFields, "chronb15")
    insertValues <- c(insertValues, chronb15)
  }

  if (missing(chronb16)) {
    chronb16 <- defaults$chronb16
  }
  if (!is.null(chronb16)) {
    insertFields <- c(insertFields, "chronb16")
    insertValues <- c(insertValues, chronb16)
  }

  if (missing(chronb17)) {
    chronb17 <- defaults$chronb17
  }
  if (!is.null(chronb17)) {
    insertFields <- c(insertFields, "chronb17")
    insertValues <- c(insertValues, chronb17)
  }

  if (missing(chronb18)) {
    chronb18 <- defaults$chronb18
  }
  if (!is.null(chronb18)) {
    insertFields <- c(insertFields, "chronb18")
    insertValues <- c(insertValues, chronb18)
  }

  if (missing(chronb19)) {
    chronb19 <- defaults$chronb19
  }
  if (!is.null(chronb19)) {
    insertFields <- c(insertFields, "chronb19")
    insertValues <- c(insertValues, chronb19)
  }

  if (missing(chronb20)) {
    chronb20 <- defaults$chronb20
  }
  if (!is.null(chronb20)) {
    insertFields <- c(insertFields, "chronb20")
    insertValues <- c(insertValues, chronb20)
  }

  if (missing(chronb21)) {
    chronb21 <- defaults$chronb21
  }
  if (!is.null(chronb21)) {
    insertFields <- c(insertFields, "chronb21")
    insertValues <- c(insertValues, chronb21)
  }

  if (missing(chronb22)) {
    chronb22 <- defaults$chronb22
  }
  if (!is.null(chronb22)) {
    insertFields <- c(insertFields, "chronb22")
    insertValues <- c(insertValues, chronb22)
  }

  if (missing(chronb23)) {
    chronb23 <- defaults$chronb23
  }
  if (!is.null(chronb23)) {
    insertFields <- c(insertFields, "chronb23")
    insertValues <- c(insertValues, chronb23)
  }

  if (missing(chronb24)) {
    chronb24 <- defaults$chronb24
  }
  if (!is.null(chronb24)) {
    insertFields <- c(insertFields, "chronb24")
    insertValues <- c(insertValues, chronb24)
  }

  if (missing(chronb25)) {
    chronb25 <- defaults$chronb25
  }
  if (!is.null(chronb25)) {
    insertFields <- c(insertFields, "chronb25")
    insertValues <- c(insertValues, chronb25)
  }

  if (missing(dxmccs1)) {
    dxmccs1 <- defaults$dxmccs1
  }
  if (!is.null(dxmccs1)) {
    insertFields <- c(insertFields, "dxmccs1")
    insertValues <- c(insertValues, dxmccs1)
  }

  if (missing(e_mccs1)) {
    e_mccs1 <- defaults$e_mccs1
  }
  if (!is.null(e_mccs1)) {
    insertFields <- c(insertFields, "e_mccs1")
    insertValues <- c(insertValues, e_mccs1)
  }

  if (missing(pclass1)) {
    pclass1 <- defaults$pclass1
  }
  if (!is.null(pclass1)) {
    insertFields <- c(insertFields, "pclass1")
    insertValues <- c(insertValues, pclass1)
  }

  if (missing(pclass2)) {
    pclass2 <- defaults$pclass2
  }
  if (!is.null(pclass2)) {
    insertFields <- c(insertFields, "pclass2")
    insertValues <- c(insertValues, pclass2)
  }

  if (missing(pclass3)) {
    pclass3 <- defaults$pclass3
  }
  if (!is.null(pclass3)) {
    insertFields <- c(insertFields, "pclass3")
    insertValues <- c(insertValues, pclass3)
  }

  if (missing(pclass4)) {
    pclass4 <- defaults$pclass4
  }
  if (!is.null(pclass4)) {
    insertFields <- c(insertFields, "pclass4")
    insertValues <- c(insertValues, pclass4)
  }

  if (missing(pclass5)) {
    pclass5 <- defaults$pclass5
  }
  if (!is.null(pclass5)) {
    insertFields <- c(insertFields, "pclass5")
    insertValues <- c(insertValues, pclass5)
  }

  if (missing(pclass6)) {
    pclass6 <- defaults$pclass6
  }
  if (!is.null(pclass6)) {
    insertFields <- c(insertFields, "pclass6")
    insertValues <- c(insertValues, pclass6)
  }

  if (missing(pclass7)) {
    pclass7 <- defaults$pclass7
  }
  if (!is.null(pclass7)) {
    insertFields <- c(insertFields, "pclass7")
    insertValues <- c(insertValues, pclass7)
  }

  if (missing(pclass8)) {
    pclass8 <- defaults$pclass8
  }
  if (!is.null(pclass8)) {
    insertFields <- c(insertFields, "pclass8")
    insertValues <- c(insertValues, pclass8)
  }

  if (missing(pclass9)) {
    pclass9 <- defaults$pclass9
  }
  if (!is.null(pclass9)) {
    insertFields <- c(insertFields, "pclass9")
    insertValues <- c(insertValues, pclass9)
  }

  if (missing(pclass10)) {
    pclass10 <- defaults$pclass10
  }
  if (!is.null(pclass10)) {
    insertFields <- c(insertFields, "pclass10")
    insertValues <- c(insertValues, pclass10)
  }

  if (missing(pclass11)) {
    pclass11 <- defaults$pclass11
  }
  if (!is.null(pclass11)) {
    insertFields <- c(insertFields, "pclass11")
    insertValues <- c(insertValues, pclass11)
  }

  if (missing(pclass12)) {
    pclass12 <- defaults$pclass12
  }
  if (!is.null(pclass12)) {
    insertFields <- c(insertFields, "pclass12")
    insertValues <- c(insertValues, pclass12)
  }

  if (missing(pclass13)) {
    pclass13 <- defaults$pclass13
  }
  if (!is.null(pclass13)) {
    insertFields <- c(insertFields, "pclass13")
    insertValues <- c(insertValues, pclass13)
  }

  if (missing(pclass14)) {
    pclass14 <- defaults$pclass14
  }
  if (!is.null(pclass14)) {
    insertFields <- c(insertFields, "pclass14")
    insertValues <- c(insertValues, pclass14)
  }

  if (missing(pclass15)) {
    pclass15 <- defaults$pclass15
  }
  if (!is.null(pclass15)) {
    insertFields <- c(insertFields, "pclass15")
    insertValues <- c(insertValues, pclass15)
  }

  if (missing(prmccs1)) {
    prmccs1 <- defaults$prmccs1
  }
  if (!is.null(prmccs1)) {
    insertFields <- c(insertFields, "prmccs1")
    insertValues <- c(insertValues, prmccs1)
  }

  if (missing(ccsmgn1)) {
    ccsmgn1 <- defaults$ccsmgn1
  }
  if (!is.null(ccsmgn1)) {
    insertFields <- c(insertFields, "ccsmgn1")
    insertValues <- c(insertValues, ccsmgn1)
  }

  if (missing(ccsmgn2)) {
    ccsmgn2 <- defaults$ccsmgn2
  }
  if (!is.null(ccsmgn2)) {
    insertFields <- c(insertFields, "ccsmgn2")
    insertValues <- c(insertValues, ccsmgn2)
  }

  if (missing(ccsmgn3)) {
    ccsmgn3 <- defaults$ccsmgn3
  }
  if (!is.null(ccsmgn3)) {
    insertFields <- c(insertFields, "ccsmgn3")
    insertValues <- c(insertValues, ccsmgn3)
  }

  if (missing(ccsmgn4)) {
    ccsmgn4 <- defaults$ccsmgn4
  }
  if (!is.null(ccsmgn4)) {
    insertFields <- c(insertFields, "ccsmgn4")
    insertValues <- c(insertValues, ccsmgn4)
  }

  if (missing(ccsmgn5)) {
    ccsmgn5 <- defaults$ccsmgn5
  }
  if (!is.null(ccsmgn5)) {
    insertFields <- c(insertFields, "ccsmgn5")
    insertValues <- c(insertValues, ccsmgn5)
  }

  if (missing(ccsmgn6)) {
    ccsmgn6 <- defaults$ccsmgn6
  }
  if (!is.null(ccsmgn6)) {
    insertFields <- c(insertFields, "ccsmgn6")
    insertValues <- c(insertValues, ccsmgn6)
  }

  if (missing(ccsmgn7)) {
    ccsmgn7 <- defaults$ccsmgn7
  }
  if (!is.null(ccsmgn7)) {
    insertFields <- c(insertFields, "ccsmgn7")
    insertValues <- c(insertValues, ccsmgn7)
  }

  if (missing(ccsmgn8)) {
    ccsmgn8 <- defaults$ccsmgn8
  }
  if (!is.null(ccsmgn8)) {
    insertFields <- c(insertFields, "ccsmgn8")
    insertValues <- c(insertValues, ccsmgn8)
  }

  if (missing(ccsmgn9)) {
    ccsmgn9 <- defaults$ccsmgn9
  }
  if (!is.null(ccsmgn9)) {
    insertFields <- c(insertFields, "ccsmgn9")
    insertValues <- c(insertValues, ccsmgn9)
  }

  if (missing(ccsmgn10)) {
    ccsmgn10 <- defaults$ccsmgn10
  }
  if (!is.null(ccsmgn10)) {
    insertFields <- c(insertFields, "ccsmgn10")
    insertValues <- c(insertValues, ccsmgn10)
  }

  if (missing(ccsmgn11)) {
    ccsmgn11 <- defaults$ccsmgn11
  }
  if (!is.null(ccsmgn11)) {
    insertFields <- c(insertFields, "ccsmgn11")
    insertValues <- c(insertValues, ccsmgn11)
  }

  if (missing(ccsmgn12)) {
    ccsmgn12 <- defaults$ccsmgn12
  }
  if (!is.null(ccsmgn12)) {
    insertFields <- c(insertFields, "ccsmgn12")
    insertValues <- c(insertValues, ccsmgn12)
  }

  if (missing(ccsmgn13)) {
    ccsmgn13 <- defaults$ccsmgn13
  }
  if (!is.null(ccsmgn13)) {
    insertFields <- c(insertFields, "ccsmgn13")
    insertValues <- c(insertValues, ccsmgn13)
  }

  if (missing(ccsmgn14)) {
    ccsmgn14 <- defaults$ccsmgn14
  }
  if (!is.null(ccsmgn14)) {
    insertFields <- c(insertFields, "ccsmgn14")
    insertValues <- c(insertValues, ccsmgn14)
  }

  if (missing(ccsmgn15)) {
    ccsmgn15 <- defaults$ccsmgn15
  }
  if (!is.null(ccsmgn15)) {
    insertFields <- c(insertFields, "ccsmgn15")
    insertValues <- c(insertValues, ccsmgn15)
  }

  if (missing(ccsmsp1)) {
    ccsmsp1 <- defaults$ccsmsp1
  }
  if (!is.null(ccsmsp1)) {
    insertFields <- c(insertFields, "ccsmsp1")
    insertValues <- c(insertValues, ccsmsp1)
  }

  if (missing(ccsmsp2)) {
    ccsmsp2 <- defaults$ccsmsp2
  }
  if (!is.null(ccsmsp2)) {
    insertFields <- c(insertFields, "ccsmsp2")
    insertValues <- c(insertValues, ccsmsp2)
  }

  if (missing(ccsmsp3)) {
    ccsmsp3 <- defaults$ccsmsp3
  }
  if (!is.null(ccsmsp3)) {
    insertFields <- c(insertFields, "ccsmsp3")
    insertValues <- c(insertValues, ccsmsp3)
  }

  if (missing(ccsmsp4)) {
    ccsmsp4 <- defaults$ccsmsp4
  }
  if (!is.null(ccsmsp4)) {
    insertFields <- c(insertFields, "ccsmsp4")
    insertValues <- c(insertValues, ccsmsp4)
  }

  if (missing(ccsmsp5)) {
    ccsmsp5 <- defaults$ccsmsp5
  }
  if (!is.null(ccsmsp5)) {
    insertFields <- c(insertFields, "ccsmsp5")
    insertValues <- c(insertValues, ccsmsp5)
  }

  if (missing(ccsmsp6)) {
    ccsmsp6 <- defaults$ccsmsp6
  }
  if (!is.null(ccsmsp6)) {
    insertFields <- c(insertFields, "ccsmsp6")
    insertValues <- c(insertValues, ccsmsp6)
  }

  if (missing(ccsmsp7)) {
    ccsmsp7 <- defaults$ccsmsp7
  }
  if (!is.null(ccsmsp7)) {
    insertFields <- c(insertFields, "ccsmsp7")
    insertValues <- c(insertValues, ccsmsp7)
  }

  if (missing(ccsmsp8)) {
    ccsmsp8 <- defaults$ccsmsp8
  }
  if (!is.null(ccsmsp8)) {
    insertFields <- c(insertFields, "ccsmsp8")
    insertValues <- c(insertValues, ccsmsp8)
  }

  if (missing(ccsmsp9)) {
    ccsmsp9 <- defaults$ccsmsp9
  }
  if (!is.null(ccsmsp9)) {
    insertFields <- c(insertFields, "ccsmsp9")
    insertValues <- c(insertValues, ccsmsp9)
  }

  if (missing(ccsmsp10)) {
    ccsmsp10 <- defaults$ccsmsp10
  }
  if (!is.null(ccsmsp10)) {
    insertFields <- c(insertFields, "ccsmsp10")
    insertValues <- c(insertValues, ccsmsp10)
  }

  if (missing(ccsmsp11)) {
    ccsmsp11 <- defaults$ccsmsp11
  }
  if (!is.null(ccsmsp11)) {
    insertFields <- c(insertFields, "ccsmsp11")
    insertValues <- c(insertValues, ccsmsp11)
  }

  if (missing(ccsmsp12)) {
    ccsmsp12 <- defaults$ccsmsp12
  }
  if (!is.null(ccsmsp12)) {
    insertFields <- c(insertFields, "ccsmsp12")
    insertValues <- c(insertValues, ccsmsp12)
  }

  if (missing(ccsmsp13)) {
    ccsmsp13 <- defaults$ccsmsp13
  }
  if (!is.null(ccsmsp13)) {
    insertFields <- c(insertFields, "ccsmsp13")
    insertValues <- c(insertValues, ccsmsp13)
  }

  if (missing(ccsmsp14)) {
    ccsmsp14 <- defaults$ccsmsp14
  }
  if (!is.null(ccsmsp14)) {
    insertFields <- c(insertFields, "ccsmsp14")
    insertValues <- c(insertValues, ccsmsp14)
  }

  if (missing(ccsmsp15)) {
    ccsmsp15 <- defaults$ccsmsp15
  }
  if (!is.null(ccsmsp15)) {
    insertFields <- c(insertFields, "ccsmsp15")
    insertValues <- c(insertValues, ccsmsp15)
  }

  if (missing(eccsmgn1)) {
    eccsmgn1 <- defaults$eccsmgn1
  }
  if (!is.null(eccsmgn1)) {
    insertFields <- c(insertFields, "eccsmgn1")
    insertValues <- c(insertValues, eccsmgn1)
  }

  if (missing(eccsmgn2)) {
    eccsmgn2 <- defaults$eccsmgn2
  }
  if (!is.null(eccsmgn2)) {
    insertFields <- c(insertFields, "eccsmgn2")
    insertValues <- c(insertValues, eccsmgn2)
  }

  if (missing(eccsmgn3)) {
    eccsmgn3 <- defaults$eccsmgn3
  }
  if (!is.null(eccsmgn3)) {
    insertFields <- c(insertFields, "eccsmgn3")
    insertValues <- c(insertValues, eccsmgn3)
  }

  if (missing(eccsmgn4)) {
    eccsmgn4 <- defaults$eccsmgn4
  }
  if (!is.null(eccsmgn4)) {
    insertFields <- c(insertFields, "eccsmgn4")
    insertValues <- c(insertValues, eccsmgn4)
  }

  statement <- paste0("INSERT INTO dx_pr_grps (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add_hospital <- function(ahaid, discwt, hospaddr, hospcity, hospid, hospname, hospst, hospwt, hospzip, hosp_bedsize, hosp_control, hosp_location, hosp_locteach, hosp_region, hosp_teach, idnumber, nis_stratum, n_disc_u, n_hosp_u, s_disc_u, s_hosp_u, total_disc, year, discwtcharge, hfipsstco, h_contrl, hospstco, hosp_rnpct, hosp_rnfteapd, hosp_lpnfteapd, hosp_nafteapd, hosp_opsurgpct, hosp_mhsmember, hosp_mhscluster) {
  defaults <- get("hospital", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(ahaid)) {
    ahaid <- defaults$ahaid
  }
  if (!is.null(ahaid)) {
    insertFields <- c(insertFields, "ahaid")
    insertValues <- c(insertValues, ahaid)
  }

  if (missing(discwt)) {
    discwt <- defaults$discwt
  }
  if (!is.null(discwt)) {
    insertFields <- c(insertFields, "discwt")
    insertValues <- c(insertValues, discwt)
  }

  if (missing(hospaddr)) {
    hospaddr <- defaults$hospaddr
  }
  if (!is.null(hospaddr)) {
    insertFields <- c(insertFields, "hospaddr")
    insertValues <- c(insertValues, hospaddr)
  }

  if (missing(hospcity)) {
    hospcity <- defaults$hospcity
  }
  if (!is.null(hospcity)) {
    insertFields <- c(insertFields, "hospcity")
    insertValues <- c(insertValues, hospcity)
  }

  if (missing(hospid)) {
    hospid <- defaults$hospid
  }
  if (!is.null(hospid)) {
    insertFields <- c(insertFields, "hospid")
    insertValues <- c(insertValues, hospid)
  }

  if (missing(hospname)) {
    hospname <- defaults$hospname
  }
  if (!is.null(hospname)) {
    insertFields <- c(insertFields, "hospname")
    insertValues <- c(insertValues, hospname)
  }

  if (missing(hospst)) {
    hospst <- defaults$hospst
  }
  if (!is.null(hospst)) {
    insertFields <- c(insertFields, "hospst")
    insertValues <- c(insertValues, hospst)
  }

  if (missing(hospwt)) {
    hospwt <- defaults$hospwt
  }
  if (!is.null(hospwt)) {
    insertFields <- c(insertFields, "hospwt")
    insertValues <- c(insertValues, hospwt)
  }

  if (missing(hospzip)) {
    hospzip <- defaults$hospzip
  }
  if (!is.null(hospzip)) {
    insertFields <- c(insertFields, "hospzip")
    insertValues <- c(insertValues, hospzip)
  }

  if (missing(hosp_bedsize)) {
    hosp_bedsize <- defaults$hosp_bedsize
  }
  if (!is.null(hosp_bedsize)) {
    insertFields <- c(insertFields, "hosp_bedsize")
    insertValues <- c(insertValues, hosp_bedsize)
  }

  if (missing(hosp_control)) {
    hosp_control <- defaults$hosp_control
  }
  if (!is.null(hosp_control)) {
    insertFields <- c(insertFields, "hosp_control")
    insertValues <- c(insertValues, hosp_control)
  }

  if (missing(hosp_location)) {
    hosp_location <- defaults$hosp_location
  }
  if (!is.null(hosp_location)) {
    insertFields <- c(insertFields, "hosp_location")
    insertValues <- c(insertValues, hosp_location)
  }

  if (missing(hosp_locteach)) {
    hosp_locteach <- defaults$hosp_locteach
  }
  if (!is.null(hosp_locteach)) {
    insertFields <- c(insertFields, "hosp_locteach")
    insertValues <- c(insertValues, hosp_locteach)
  }

  if (missing(hosp_region)) {
    hosp_region <- defaults$hosp_region
  }
  if (!is.null(hosp_region)) {
    insertFields <- c(insertFields, "hosp_region")
    insertValues <- c(insertValues, hosp_region)
  }

  if (missing(hosp_teach)) {
    hosp_teach <- defaults$hosp_teach
  }
  if (!is.null(hosp_teach)) {
    insertFields <- c(insertFields, "hosp_teach")
    insertValues <- c(insertValues, hosp_teach)
  }

  if (missing(idnumber)) {
    idnumber <- defaults$idnumber
  }
  if (!is.null(idnumber)) {
    insertFields <- c(insertFields, "idnumber")
    insertValues <- c(insertValues, idnumber)
  }

  if (missing(nis_stratum)) {
    nis_stratum <- defaults$nis_stratum
  }
  if (!is.null(nis_stratum)) {
    insertFields <- c(insertFields, "nis_stratum")
    insertValues <- c(insertValues, nis_stratum)
  }

  if (missing(n_disc_u)) {
    n_disc_u <- defaults$n_disc_u
  }
  if (!is.null(n_disc_u)) {
    insertFields <- c(insertFields, "n_disc_u")
    insertValues <- c(insertValues, n_disc_u)
  }

  if (missing(n_hosp_u)) {
    n_hosp_u <- defaults$n_hosp_u
  }
  if (!is.null(n_hosp_u)) {
    insertFields <- c(insertFields, "n_hosp_u")
    insertValues <- c(insertValues, n_hosp_u)
  }

  if (missing(s_disc_u)) {
    s_disc_u <- defaults$s_disc_u
  }
  if (!is.null(s_disc_u)) {
    insertFields <- c(insertFields, "s_disc_u")
    insertValues <- c(insertValues, s_disc_u)
  }

  if (missing(s_hosp_u)) {
    s_hosp_u <- defaults$s_hosp_u
  }
  if (!is.null(s_hosp_u)) {
    insertFields <- c(insertFields, "s_hosp_u")
    insertValues <- c(insertValues, s_hosp_u)
  }

  if (missing(total_disc)) {
    total_disc <- defaults$total_disc
  }
  if (!is.null(total_disc)) {
    insertFields <- c(insertFields, "total_disc")
    insertValues <- c(insertValues, total_disc)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  if (missing(discwtcharge)) {
    discwtcharge <- defaults$discwtcharge
  }
  if (!is.null(discwtcharge)) {
    insertFields <- c(insertFields, "discwtcharge")
    insertValues <- c(insertValues, discwtcharge)
  }

  if (missing(hfipsstco)) {
    hfipsstco <- defaults$hfipsstco
  }
  if (!is.null(hfipsstco)) {
    insertFields <- c(insertFields, "hfipsstco")
    insertValues <- c(insertValues, hfipsstco)
  }

  if (missing(h_contrl)) {
    h_contrl <- defaults$h_contrl
  }
  if (!is.null(h_contrl)) {
    insertFields <- c(insertFields, "h_contrl")
    insertValues <- c(insertValues, h_contrl)
  }

  if (missing(hospstco)) {
    hospstco <- defaults$hospstco
  }
  if (!is.null(hospstco)) {
    insertFields <- c(insertFields, "hospstco")
    insertValues <- c(insertValues, hospstco)
  }

  if (missing(hosp_rnpct)) {
    hosp_rnpct <- defaults$hosp_rnpct
  }
  if (!is.null(hosp_rnpct)) {
    insertFields <- c(insertFields, "hosp_rnpct")
    insertValues <- c(insertValues, hosp_rnpct)
  }

  if (missing(hosp_rnfteapd)) {
    hosp_rnfteapd <- defaults$hosp_rnfteapd
  }
  if (!is.null(hosp_rnfteapd)) {
    insertFields <- c(insertFields, "hosp_rnfteapd")
    insertValues <- c(insertValues, hosp_rnfteapd)
  }

  if (missing(hosp_lpnfteapd)) {
    hosp_lpnfteapd <- defaults$hosp_lpnfteapd
  }
  if (!is.null(hosp_lpnfteapd)) {
    insertFields <- c(insertFields, "hosp_lpnfteapd")
    insertValues <- c(insertValues, hosp_lpnfteapd)
  }

  if (missing(hosp_nafteapd)) {
    hosp_nafteapd <- defaults$hosp_nafteapd
  }
  if (!is.null(hosp_nafteapd)) {
    insertFields <- c(insertFields, "hosp_nafteapd")
    insertValues <- c(insertValues, hosp_nafteapd)
  }

  if (missing(hosp_opsurgpct)) {
    hosp_opsurgpct <- defaults$hosp_opsurgpct
  }
  if (!is.null(hosp_opsurgpct)) {
    insertFields <- c(insertFields, "hosp_opsurgpct")
    insertValues <- c(insertValues, hosp_opsurgpct)
  }

  if (missing(hosp_mhsmember)) {
    hosp_mhsmember <- defaults$hosp_mhsmember
  }
  if (!is.null(hosp_mhsmember)) {
    insertFields <- c(insertFields, "hosp_mhsmember")
    insertValues <- c(insertValues, hosp_mhsmember)
  }

  if (missing(hosp_mhscluster)) {
    hosp_mhscluster <- defaults$hosp_mhscluster
  }
  if (!is.null(hosp_mhscluster)) {
    insertFields <- c(insertFields, "hosp_mhscluster")
    insertValues <- c(insertValues, hosp_mhscluster)
  }

  statement <- paste0("INSERT INTO hospital (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

add_severity <- function(hospid, key, aprdrg, aprdrg_risk_mortality, aprdrg_severity, cm_aids, cm_alcohol, cm_anemdef, cm_arth, cm_bldloss, cm_chf, cm_chrnlung, cm_coag, cm_depress, cm_dm, cm_dmcx, cm_drug, cm_htn_c, cm_hypothy, cm_liver, cm_lymph, cm_lytes, cm_mets, cm_neuro, cm_obese, cm_para, cm_perivasc, cm_psych, cm_pulmcirc, cm_renlfail, cm_tumor, cm_ulcer, cm_valve, cm_wghtloss, ds_dx_category1, ds_stage1, apsdrg, apsdrg_charge_weight, apsdrg_los_weight, apsdrg_mortality_weight, ds_los_level, ds_los_scale, ds_mrt_level, ds_mrt_scale, ds_rd_level, ds_rd_scale) {
  defaults <- get("severity", envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(hospid)) {
    hospid <- defaults$hospid
  }
  if (!is.null(hospid)) {
    insertFields <- c(insertFields, "hospid")
    insertValues <- c(insertValues, hospid)
  }

  if (missing(key)) {
    key <- defaults$key
  }
  if (!is.null(key)) {
    insertFields <- c(insertFields, "[key]")
    insertValues <- c(insertValues, key)
  }

  if (missing(aprdrg)) {
    aprdrg <- defaults$aprdrg
  }
  if (!is.null(aprdrg)) {
    insertFields <- c(insertFields, "aprdrg")
    insertValues <- c(insertValues, aprdrg)
  }

  if (missing(aprdrg_risk_mortality)) {
    aprdrg_risk_mortality <- defaults$aprdrg_risk_mortality
  }
  if (!is.null(aprdrg_risk_mortality)) {
    insertFields <- c(insertFields, "aprdrg_risk_mortality")
    insertValues <- c(insertValues, aprdrg_risk_mortality)
  }

  if (missing(aprdrg_severity)) {
    aprdrg_severity <- defaults$aprdrg_severity
  }
  if (!is.null(aprdrg_severity)) {
    insertFields <- c(insertFields, "aprdrg_severity")
    insertValues <- c(insertValues, aprdrg_severity)
  }

  if (missing(cm_aids)) {
    cm_aids <- defaults$cm_aids
  }
  if (!is.null(cm_aids)) {
    insertFields <- c(insertFields, "cm_aids")
    insertValues <- c(insertValues, cm_aids)
  }

  if (missing(cm_alcohol)) {
    cm_alcohol <- defaults$cm_alcohol
  }
  if (!is.null(cm_alcohol)) {
    insertFields <- c(insertFields, "cm_alcohol")
    insertValues <- c(insertValues, cm_alcohol)
  }

  if (missing(cm_anemdef)) {
    cm_anemdef <- defaults$cm_anemdef
  }
  if (!is.null(cm_anemdef)) {
    insertFields <- c(insertFields, "cm_anemdef")
    insertValues <- c(insertValues, cm_anemdef)
  }

  if (missing(cm_arth)) {
    cm_arth <- defaults$cm_arth
  }
  if (!is.null(cm_arth)) {
    insertFields <- c(insertFields, "cm_arth")
    insertValues <- c(insertValues, cm_arth)
  }

  if (missing(cm_bldloss)) {
    cm_bldloss <- defaults$cm_bldloss
  }
  if (!is.null(cm_bldloss)) {
    insertFields <- c(insertFields, "cm_bldloss")
    insertValues <- c(insertValues, cm_bldloss)
  }

  if (missing(cm_chf)) {
    cm_chf <- defaults$cm_chf
  }
  if (!is.null(cm_chf)) {
    insertFields <- c(insertFields, "cm_chf")
    insertValues <- c(insertValues, cm_chf)
  }

  if (missing(cm_chrnlung)) {
    cm_chrnlung <- defaults$cm_chrnlung
  }
  if (!is.null(cm_chrnlung)) {
    insertFields <- c(insertFields, "cm_chrnlung")
    insertValues <- c(insertValues, cm_chrnlung)
  }

  if (missing(cm_coag)) {
    cm_coag <- defaults$cm_coag
  }
  if (!is.null(cm_coag)) {
    insertFields <- c(insertFields, "cm_coag")
    insertValues <- c(insertValues, cm_coag)
  }

  if (missing(cm_depress)) {
    cm_depress <- defaults$cm_depress
  }
  if (!is.null(cm_depress)) {
    insertFields <- c(insertFields, "cm_depress")
    insertValues <- c(insertValues, cm_depress)
  }

  if (missing(cm_dm)) {
    cm_dm <- defaults$cm_dm
  }
  if (!is.null(cm_dm)) {
    insertFields <- c(insertFields, "cm_dm")
    insertValues <- c(insertValues, cm_dm)
  }

  if (missing(cm_dmcx)) {
    cm_dmcx <- defaults$cm_dmcx
  }
  if (!is.null(cm_dmcx)) {
    insertFields <- c(insertFields, "cm_dmcx")
    insertValues <- c(insertValues, cm_dmcx)
  }

  if (missing(cm_drug)) {
    cm_drug <- defaults$cm_drug
  }
  if (!is.null(cm_drug)) {
    insertFields <- c(insertFields, "cm_drug")
    insertValues <- c(insertValues, cm_drug)
  }

  if (missing(cm_htn_c)) {
    cm_htn_c <- defaults$cm_htn_c
  }
  if (!is.null(cm_htn_c)) {
    insertFields <- c(insertFields, "cm_htn_c")
    insertValues <- c(insertValues, cm_htn_c)
  }

  if (missing(cm_hypothy)) {
    cm_hypothy <- defaults$cm_hypothy
  }
  if (!is.null(cm_hypothy)) {
    insertFields <- c(insertFields, "cm_hypothy")
    insertValues <- c(insertValues, cm_hypothy)
  }

  if (missing(cm_liver)) {
    cm_liver <- defaults$cm_liver
  }
  if (!is.null(cm_liver)) {
    insertFields <- c(insertFields, "cm_liver")
    insertValues <- c(insertValues, cm_liver)
  }

  if (missing(cm_lymph)) {
    cm_lymph <- defaults$cm_lymph
  }
  if (!is.null(cm_lymph)) {
    insertFields <- c(insertFields, "cm_lymph")
    insertValues <- c(insertValues, cm_lymph)
  }

  if (missing(cm_lytes)) {
    cm_lytes <- defaults$cm_lytes
  }
  if (!is.null(cm_lytes)) {
    insertFields <- c(insertFields, "cm_lytes")
    insertValues <- c(insertValues, cm_lytes)
  }

  if (missing(cm_mets)) {
    cm_mets <- defaults$cm_mets
  }
  if (!is.null(cm_mets)) {
    insertFields <- c(insertFields, "cm_mets")
    insertValues <- c(insertValues, cm_mets)
  }

  if (missing(cm_neuro)) {
    cm_neuro <- defaults$cm_neuro
  }
  if (!is.null(cm_neuro)) {
    insertFields <- c(insertFields, "cm_neuro")
    insertValues <- c(insertValues, cm_neuro)
  }

  if (missing(cm_obese)) {
    cm_obese <- defaults$cm_obese
  }
  if (!is.null(cm_obese)) {
    insertFields <- c(insertFields, "cm_obese")
    insertValues <- c(insertValues, cm_obese)
  }

  if (missing(cm_para)) {
    cm_para <- defaults$cm_para
  }
  if (!is.null(cm_para)) {
    insertFields <- c(insertFields, "cm_para")
    insertValues <- c(insertValues, cm_para)
  }

  if (missing(cm_perivasc)) {
    cm_perivasc <- defaults$cm_perivasc
  }
  if (!is.null(cm_perivasc)) {
    insertFields <- c(insertFields, "cm_perivasc")
    insertValues <- c(insertValues, cm_perivasc)
  }

  if (missing(cm_psych)) {
    cm_psych <- defaults$cm_psych
  }
  if (!is.null(cm_psych)) {
    insertFields <- c(insertFields, "cm_psych")
    insertValues <- c(insertValues, cm_psych)
  }

  if (missing(cm_pulmcirc)) {
    cm_pulmcirc <- defaults$cm_pulmcirc
  }
  if (!is.null(cm_pulmcirc)) {
    insertFields <- c(insertFields, "cm_pulmcirc")
    insertValues <- c(insertValues, cm_pulmcirc)
  }

  if (missing(cm_renlfail)) {
    cm_renlfail <- defaults$cm_renlfail
  }
  if (!is.null(cm_renlfail)) {
    insertFields <- c(insertFields, "cm_renlfail")
    insertValues <- c(insertValues, cm_renlfail)
  }

  if (missing(cm_tumor)) {
    cm_tumor <- defaults$cm_tumor
  }
  if (!is.null(cm_tumor)) {
    insertFields <- c(insertFields, "cm_tumor")
    insertValues <- c(insertValues, cm_tumor)
  }

  if (missing(cm_ulcer)) {
    cm_ulcer <- defaults$cm_ulcer
  }
  if (!is.null(cm_ulcer)) {
    insertFields <- c(insertFields, "cm_ulcer")
    insertValues <- c(insertValues, cm_ulcer)
  }

  if (missing(cm_valve)) {
    cm_valve <- defaults$cm_valve
  }
  if (!is.null(cm_valve)) {
    insertFields <- c(insertFields, "cm_valve")
    insertValues <- c(insertValues, cm_valve)
  }

  if (missing(cm_wghtloss)) {
    cm_wghtloss <- defaults$cm_wghtloss
  }
  if (!is.null(cm_wghtloss)) {
    insertFields <- c(insertFields, "cm_wghtloss")
    insertValues <- c(insertValues, cm_wghtloss)
  }

  if (missing(ds_dx_category1)) {
    ds_dx_category1 <- defaults$ds_dx_category1
  }
  if (!is.null(ds_dx_category1)) {
    insertFields <- c(insertFields, "ds_dx_category1")
    insertValues <- c(insertValues, ds_dx_category1)
  }

  if (missing(ds_stage1)) {
    ds_stage1 <- defaults$ds_stage1
  }
  if (!is.null(ds_stage1)) {
    insertFields <- c(insertFields, "ds_stage1")
    insertValues <- c(insertValues, ds_stage1)
  }

  if (missing(apsdrg)) {
    apsdrg <- defaults$apsdrg
  }
  if (!is.null(apsdrg)) {
    insertFields <- c(insertFields, "apsdrg")
    insertValues <- c(insertValues, apsdrg)
  }

  if (missing(apsdrg_charge_weight)) {
    apsdrg_charge_weight <- defaults$apsdrg_charge_weight
  }
  if (!is.null(apsdrg_charge_weight)) {
    insertFields <- c(insertFields, "apsdrg_charge_weight")
    insertValues <- c(insertValues, apsdrg_charge_weight)
  }

  if (missing(apsdrg_los_weight)) {
    apsdrg_los_weight <- defaults$apsdrg_los_weight
  }
  if (!is.null(apsdrg_los_weight)) {
    insertFields <- c(insertFields, "apsdrg_los_weight")
    insertValues <- c(insertValues, apsdrg_los_weight)
  }

  if (missing(apsdrg_mortality_weight)) {
    apsdrg_mortality_weight <- defaults$apsdrg_mortality_weight
  }
  if (!is.null(apsdrg_mortality_weight)) {
    insertFields <- c(insertFields, "apsdrg_mortality_weight")
    insertValues <- c(insertValues, apsdrg_mortality_weight)
  }

  if (missing(ds_los_level)) {
    ds_los_level <- defaults$ds_los_level
  }
  if (!is.null(ds_los_level)) {
    insertFields <- c(insertFields, "ds_los_level")
    insertValues <- c(insertValues, ds_los_level)
  }

  if (missing(ds_los_scale)) {
    ds_los_scale <- defaults$ds_los_scale
  }
  if (!is.null(ds_los_scale)) {
    insertFields <- c(insertFields, "ds_los_scale")
    insertValues <- c(insertValues, ds_los_scale)
  }

  if (missing(ds_mrt_level)) {
    ds_mrt_level <- defaults$ds_mrt_level
  }
  if (!is.null(ds_mrt_level)) {
    insertFields <- c(insertFields, "ds_mrt_level")
    insertValues <- c(insertValues, ds_mrt_level)
  }

  if (missing(ds_mrt_scale)) {
    ds_mrt_scale <- defaults$ds_mrt_scale
  }
  if (!is.null(ds_mrt_scale)) {
    insertFields <- c(insertFields, "ds_mrt_scale")
    insertValues <- c(insertValues, ds_mrt_scale)
  }

  if (missing(ds_rd_level)) {
    ds_rd_level <- defaults$ds_rd_level
  }
  if (!is.null(ds_rd_level)) {
    insertFields <- c(insertFields, "ds_rd_level")
    insertValues <- c(insertValues, ds_rd_level)
  }

  if (missing(ds_rd_scale)) {
    ds_rd_scale <- defaults$ds_rd_scale
  }
  if (!is.null(ds_rd_scale)) {
    insertFields <- c(insertFields, "ds_rd_scale")
    insertValues <- c(insertValues, ds_rd_scale)
  }

  statement <- paste0("INSERT INTO severity (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  assign("insertSql", c(get("insertSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_person <- function(person_id, person_source_value, gender_concept_id, gender_source_value, year_of_birth, month_of_birth, day_of_birth, race_concept_id, race_source_value, ethnicity_concept_id, ethnicity_source_value, time_of_birth, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_concept_id, ethnicity_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM person WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, " person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      statement <- paste0(statement, " person_source_value = (", as.character(person_source_value), ")")
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, " month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      statement <- paste0(statement, " month_of_birth = (", as.character(month_of_birth), ")")
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }

  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, " day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      statement <- paste0(statement, " day_of_birth = (", as.character(day_of_birth), ")")
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }

  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, " race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      statement <- paste0(statement, " race_concept_id = (", as.character(race_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }

  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, " race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      statement <- paste0(statement, " race_source_value = (", as.character(race_source_value), ")")
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, " ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, " ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_value = (", as.character(ethnicity_source_value), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }

  if (!missing(time_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(time_of_birth)) {
      statement <- paste0(statement, " time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      statement <- paste0(statement, " time_of_birth = (", as.character(time_of_birth), ")")
    } else {
      statement <- paste0(statement, " time_of_birth = '", time_of_birth,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, " race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      statement <- paste0(statement, " race_source_concept_id = (", as.character(race_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, " ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_occurrence WHERE")
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, " visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_concept_id = (", as.character(visit_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, " visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      statement <- paste0(statement, " visit_start_date = (", as.character(visit_start_date), ")")
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }

  if (!missing(visit_start_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_time)) {
      statement <- paste0(statement, " visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      statement <- paste0(statement, " visit_start_time = (", as.character(visit_start_time), ")")
    } else {
      statement <- paste0(statement, " visit_start_time = '", visit_start_time,"'")
    }
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, " visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      statement <- paste0(statement, " visit_end_date = (", as.character(visit_end_date), ")")
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }

  if (!missing(visit_end_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_time)) {
      statement <- paste0(statement, " visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      statement <- paste0(statement, " visit_end_time = (", as.character(visit_end_time), ")")
    } else {
      statement <- paste0(statement, " visit_end_time = '", visit_end_time,"'")
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, " visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_type_concept_id = (", as.character(visit_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, " visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      statement <- paste0(statement, " visit_source_value = (", as.character(visit_source_value), ")")
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, " visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_source_concept_id = (", as.character(visit_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) FROM observation_period WHERE")
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, " observation_period_id IS NULL")
    } else if (is(observation_period_id, "subQuery")){
      statement <- paste0(statement, " observation_period_id = (", as.character(observation_period_id), ")")
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, " observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      statement <- paste0(statement, " observation_period_start_date = (", as.character(observation_period_start_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }

  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, " observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      statement <- paste0(statement, " observation_period_end_date = (", as.character(observation_period_end_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }

  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, " period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      statement <- paste0(statement, " period_type_concept_id = (", as.character(period_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect location' AS test, CASE WHEN(SELECT COUNT(*) FROM location WHERE")
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, " address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      statement <- paste0(statement, " address_1 = (", as.character(address_1), ")")
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }

  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, " address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      statement <- paste0(statement, " address_2 = (", as.character(address_2), ")")
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }

  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(city)) {
      statement <- paste0(statement, " city IS NULL")
    } else if (is(city, "subQuery")){
      statement <- paste0(statement, " city = (", as.character(city), ")")
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }

  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(state)) {
      statement <- paste0(statement, " state IS NULL")
    } else if (is(state, "subQuery")){
      statement <- paste0(statement, " state = (", as.character(state), ")")
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }

  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(zip)) {
      statement <- paste0(statement, " zip IS NULL")
    } else if (is(zip, "subQuery")){
      statement <- paste0(statement, " zip = (", as.character(zip), ")")
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }

  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(county)) {
      statement <- paste0(statement, " county IS NULL")
    } else if (is(county, "subQuery")){
      statement <- paste0(statement, " county = (", as.character(county), ")")
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }

  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, " location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      statement <- paste0(statement, " location_source_value = (", as.character(location_source_value), ")")
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect care_site' AS test, CASE WHEN(SELECT COUNT(*) FROM care_site WHERE")
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, " care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      statement <- paste0(statement, " care_site_name = (", as.character(care_site_name), ")")
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, " place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      statement <- paste0(statement, " place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")")
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, " care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      statement <- paste0(statement, " care_site_source_value = (", as.character(care_site_source_value), ")")
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, " place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      statement <- paste0(statement, " place_of_service_source_value = (", as.character(place_of_service_source_value), ")")
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_occurrence WHERE")
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, " condition_occurrence_id IS NULL")
    } else if (is(condition_occurrence_id, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_id = (", as.character(condition_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, " condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      statement <- paste0(statement, " condition_start_date = (", as.character(condition_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }

  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, " condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      statement <- paste0(statement, " condition_end_date = (", as.character(condition_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, " condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_type_concept_id = (", as.character(condition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, " condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      statement <- paste0(statement, " condition_source_value = (", as.character(condition_source_value), ")")
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, " condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_source_concept_id = (", as.character(condition_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_death <- function(person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM death WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, " death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      statement <- paste0(statement, " death_date = (", as.character(death_date), ")")
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }

  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, " death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      statement <- paste0(statement, " death_type_concept_id = (", as.character(death_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }

  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, " cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_concept_id = (", as.character(cause_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }

  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, " cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      statement <- paste0(statement, " cause_source_value = (", as.character(cause_source_value), ")")
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, " cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_source_concept_id = (", as.character(cause_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_drug_exposure <- function(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_exposure WHERE")
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, " drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, " drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, " drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_type_concept_id = (", as.character(drug_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(refills)) {
      statement <- paste0(statement, " refills IS NULL")
    } else if (is(refills, "subQuery")){
      statement <- paste0(statement, " refills = (", as.character(refills), ")")
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, " days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      statement <- paste0(statement, " days_supply = (", as.character(days_supply), ")")
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }

  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(sig)) {
      statement <- paste0(statement, " sig IS NULL")
    } else if (is(sig, "subQuery")){
      statement <- paste0(statement, " sig = (", as.character(sig), ")")
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }

  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, " route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      statement <- paste0(statement, " route_concept_id = (", as.character(route_concept_id), ")")
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }

  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, " effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      statement <- paste0(statement, " effective_drug_dose = (", as.character(effective_drug_dose), ")")
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, " dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      statement <- paste0(statement, " dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }

  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, " lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      statement <- paste0(statement, " lot_number = (", as.character(lot_number), ")")
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, " drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      statement <- paste0(statement, " drug_source_value = (", as.character(drug_source_value), ")")
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, " drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_source_concept_id = (", as.character(drug_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }

  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, " route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      statement <- paste0(statement, " route_source_value = (", as.character(route_source_value), ")")
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, " dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      statement <- paste0(statement, " dose_unit_source_value = (", as.character(dose_unit_source_value), ")")
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM device_exposure WHERE")
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, " device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      statement <- paste0(statement, " device_concept_id = (", as.character(device_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, " device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_start_date = (", as.character(device_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, " device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_end_date = (", as.character(device_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }

  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, " device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      statement <- paste0(statement, " device_type_concept_id = (", as.character(device_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }

  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, " unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      statement <- paste0(statement, " unique_device_id = (", as.character(unique_device_id), ")")
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, " device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      statement <- paste0(statement, " device_source_value = (", as.character(device_source_value), ")")
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }

  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, " device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      statement <- paste0(statement, " device_source_concept_id = (", as.character(device_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_procedure_occurrence <- function(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_occurrence WHERE")
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, " procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_concept_id = (", as.character(procedure_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }

  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, " procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      statement <- paste0(statement, " procedure_date = (", as.character(procedure_date), ")")
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, " procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }

  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, " modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      statement <- paste0(statement, " modifier_concept_id = (", as.character(modifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, " procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      statement <- paste0(statement, " procedure_source_value = (", as.character(procedure_source_value), ")")
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, " procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_measurement <- function(measurement_id, person_id, measurement_concept_id, measurement_date, measurement_time, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect measurement' AS test, CASE WHEN(SELECT COUNT(*) FROM measurement WHERE")
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, " measurement_id IS NULL")
    } else if (is(measurement_id, "subQuery")){
      statement <- paste0(statement, " measurement_id = (", as.character(measurement_id), ")")
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, " measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_concept_id = (", as.character(measurement_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }

  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, " measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      statement <- paste0(statement, " measurement_date = (", as.character(measurement_date), ")")
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }

  if (!missing(measurement_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_time)) {
      statement <- paste0(statement, " measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      statement <- paste0(statement, " measurement_time = (", as.character(measurement_time), ")")
    } else {
      statement <- paste0(statement, " measurement_time = '", measurement_time,"'")
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, " measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }

  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, " operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      statement <- paste0(statement, " operator_concept_id = (", as.character(operator_concept_id), ")")
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, " range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      statement <- paste0(statement, " range_low = (", as.character(range_low), ")")
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }

  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, " range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      statement <- paste0(statement, " range_high = (", as.character(range_high), ")")
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, " measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      statement <- paste0(statement, " measurement_source_value = (", as.character(measurement_source_value), ")")
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, " measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, " value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      statement <- paste0(statement, " value_source_value = (", as.character(value_source_value), ")")
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_observation <- function(observation_id, person_id, observation_concept_id, observation_date, observation_time, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM observation WHERE")
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, " observation_id IS NULL")
    } else if (is(observation_id, "subQuery")){
      statement <- paste0(statement, " observation_id = (", as.character(observation_id), ")")
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, " observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_concept_id = (", as.character(observation_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }

  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, " observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      statement <- paste0(statement, " observation_date = (", as.character(observation_date), ")")
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }

  if (!missing(observation_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_time)) {
      statement <- paste0(statement, " observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      statement <- paste0(statement, " observation_time = (", as.character(observation_time), ")")
    } else {
      statement <- paste0(statement, " observation_time = '", observation_time,"'")
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, " observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_type_concept_id = (", as.character(observation_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, " value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      statement <- paste0(statement, " value_as_string = (", as.character(value_as_string), ")")
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, " qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      statement <- paste0(statement, " qualifier_concept_id = (", as.character(qualifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, " observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      statement <- paste0(statement, " observation_source_value = (", as.character(observation_source_value), ")")
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, " observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_source_concept_id = (", as.character(observation_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_provider <- function(provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) FROM provider WHERE")
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, " provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      statement <- paste0(statement, " provider_name = (", as.character(provider_name), ")")
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }

  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(npi)) {
      statement <- paste0(statement, " npi IS NULL")
    } else if (is(npi, "subQuery")){
      statement <- paste0(statement, " npi = (", as.character(npi), ")")
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }

  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dea)) {
      statement <- paste0(statement, " dea IS NULL")
    } else if (is(dea, "subQuery")){
      statement <- paste0(statement, " dea = (", as.character(dea), ")")
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }

  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, " specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_concept_id = (", as.character(specialty_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, " provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      statement <- paste0(statement, " provider_source_value = (", as.character(provider_source_value), ")")
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }

  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, " specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      statement <- paste0(statement, " specialty_source_value = (", as.character(specialty_source_value), ")")
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, " specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_note <- function(note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect note' AS test, CASE WHEN(SELECT COUNT(*) FROM note WHERE")
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, " note_id IS NULL")
    } else if (is(note_id, "subQuery")){
      statement <- paste0(statement, " note_id = (", as.character(note_id), ")")
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, " note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      statement <- paste0(statement, " note_date = (", as.character(note_date), ")")
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }

  if (!missing(note_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_time)) {
      statement <- paste0(statement, " note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      statement <- paste0(statement, " note_time = (", as.character(note_time), ")")
    } else {
      statement <- paste0(statement, " note_time = '", note_time,"'")
    }
  }

  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, " note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      statement <- paste0(statement, " note_type_concept_id = (", as.character(note_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }

  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, " note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      statement <- paste0(statement, " note_text = (", as.character(note_text), ")")
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, " note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      statement <- paste0(statement, " note_source_value = (", as.character(note_source_value), ")")
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect specimen' AS test, CASE WHEN(SELECT COUNT(*) FROM specimen WHERE")
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, " specimen_id IS NULL")
    } else if (is(specimen_id, "subQuery")){
      statement <- paste0(statement, " specimen_id = (", as.character(specimen_id), ")")
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, " specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_concept_id = (", as.character(specimen_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, " specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }

  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, " specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      statement <- paste0(statement, " specimen_date = (", as.character(specimen_date), ")")
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }

  if (!missing(specimen_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_time)) {
      statement <- paste0(statement, " specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      statement <- paste0(statement, " specimen_time = (", as.character(specimen_time), ")")
    } else {
      statement <- paste0(statement, " specimen_time = '", specimen_time,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, " anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      statement <- paste0(statement, " anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, " disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      statement <- paste0(statement, " disease_status_concept_id = (", as.character(disease_status_concept_id), ")")
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }

  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, " specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      statement <- paste0(statement, " specimen_source_id = (", as.character(specimen_source_id), ")")
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }

  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, " specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      statement <- paste0(statement, " specimen_source_value = (", as.character(specimen_source_value), ")")
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, " anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      statement <- paste0(statement, " anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }

  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, " disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      statement <- paste0(statement, " disease_status_source_value = (", as.character(disease_status_source_value), ")")
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect fact_relationship' AS test, CASE WHEN(SELECT COUNT(*) FROM fact_relationship WHERE")
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, " domain_concept_id_1 IS NULL")
    } else if (is(domain_concept_id_1, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_1 = (", as.character(domain_concept_id_1), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }

  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, " fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      statement <- paste0(statement, " fact_id_1 = (", as.character(fact_id_1), ")")
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, " domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_2 = (", as.character(domain_concept_id_2), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }

  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, " fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      statement <- paste0(statement, " fact_id_2 = (", as.character(fact_id_2), ")")
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, " relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      statement <- paste0(statement, " relationship_concept_id = (", as.character(relationship_concept_id), ")")
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_procedure_cost <- function(procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_cost WHERE")
  first <- TRUE
  if (!missing(procedure_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_cost_id)) {
      statement <- paste0(statement, " procedure_cost_id IS NULL")
    } else if (is(procedure_cost_id, "subQuery")){
      statement <- paste0(statement, " procedure_cost_id = (", as.character(procedure_cost_id), ")")
    } else {
      statement <- paste0(statement, " procedure_cost_id = '", procedure_cost_id,"'")
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, " revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      statement <- paste0(statement, " revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")")
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, " revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      statement <- paste0(statement, " revenue_code_source_value = (", as.character(revenue_code_source_value), ")")
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_visit_cost <- function(visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_cost WHERE")
  first <- TRUE
  if (!missing(visit_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_cost_id)) {
      statement <- paste0(statement, " visit_cost_id IS NULL")
    } else if (is(visit_cost_id, "subQuery")){
      statement <- paste0(statement, " visit_cost_id = (", as.character(visit_cost_id), ")")
    } else {
      statement <- paste0(statement, " visit_cost_id = '", visit_cost_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_drug_cost <- function(drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_cost WHERE")
  first <- TRUE
  if (!missing(drug_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_cost_id)) {
      statement <- paste0(statement, " drug_cost_id IS NULL")
    } else if (is(drug_cost_id, "subQuery")){
      statement <- paste0(statement, " drug_cost_id = (", as.character(drug_cost_id), ")")
    } else {
      statement <- paste0(statement, " drug_cost_id = '", drug_cost_id,"'")
    }
  }

  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ingredient_cost)) {
      statement <- paste0(statement, " ingredient_cost IS NULL")
    } else if (is(ingredient_cost, "subQuery")){
      statement <- paste0(statement, " ingredient_cost = (", as.character(ingredient_cost), ")")
    } else {
      statement <- paste0(statement, " ingredient_cost = '", ingredient_cost,"'")
    }
  }

  if (!missing(dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dispensing_fee)) {
      statement <- paste0(statement, " dispensing_fee IS NULL")
    } else if (is(dispensing_fee, "subQuery")){
      statement <- paste0(statement, " dispensing_fee = (", as.character(dispensing_fee), ")")
    } else {
      statement <- paste0(statement, " dispensing_fee = '", dispensing_fee,"'")
    }
  }

  if (!missing(average_wholesale_price)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(average_wholesale_price)) {
      statement <- paste0(statement, " average_wholesale_price IS NULL")
    } else if (is(average_wholesale_price, "subQuery")){
      statement <- paste0(statement, " average_wholesale_price = (", as.character(average_wholesale_price), ")")
    } else {
      statement <- paste0(statement, " average_wholesale_price = '", average_wholesale_price,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect payer_plan_period' AS test, CASE WHEN(SELECT COUNT(*) FROM payer_plan_period WHERE")
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, " payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, " payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }

  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, " payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      statement <- paste0(statement, " payer_source_value = (", as.character(payer_source_value), ")")
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }

  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, " plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      statement <- paste0(statement, " plan_source_value = (", as.character(plan_source_value), ")")
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }

  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, " family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      statement <- paste0(statement, " family_source_value = (", as.character(family_source_value), ")")
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_device_cost <- function(device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM device_cost WHERE")
  first <- TRUE
  if (!missing(device_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_cost_id)) {
      statement <- paste0(statement, " device_cost_id IS NULL")
    } else if (is(device_cost_id, "subQuery")){
      statement <- paste0(statement, " device_cost_id = (", as.character(device_cost_id), ")")
    } else {
      statement <- paste0(statement, " device_cost_id = '", device_cost_id,"'")
    }
  }

  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_era' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_era WHERE")
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, " drug_era_id IS NULL")
    } else if (is(drug_era_id, "subQuery")){
      statement <- paste0(statement, " drug_era_id = (", as.character(drug_era_id), ")")
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, " drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      statement <- paste0(statement, " drug_era_start_date = (", as.character(drug_era_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }

  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, " drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      statement <- paste0(statement, " drug_era_end_date = (", as.character(drug_era_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }

  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, " drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      statement <- paste0(statement, " drug_exposure_count = (", as.character(drug_exposure_count), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }

  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, " gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      statement <- paste0(statement, " gap_days = (", as.character(gap_days), ")")
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect dose_era' AS test, CASE WHEN(SELECT COUNT(*) FROM dose_era WHERE")
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, " dose_era_id IS NULL")
    } else if (is(dose_era_id, "subQuery")){
      statement <- paste0(statement, " dose_era_id = (", as.character(dose_era_id), ")")
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, " dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      statement <- paste0(statement, " dose_value = (", as.character(dose_value), ")")
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }

  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, " dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      statement <- paste0(statement, " dose_era_start_date = (", as.character(dose_era_start_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }

  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, " dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      statement <- paste0(statement, " dose_era_end_date = (", as.character(dose_era_end_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_era' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_era WHERE")
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, " condition_era_id IS NULL")
    } else if (is(condition_era_id, "subQuery")){
      statement <- paste0(statement, " condition_era_id = (", as.character(condition_era_id), ")")
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, " condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      statement <- paste0(statement, " condition_era_start_date = (", as.character(condition_era_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }

  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, " condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      statement <- paste0(statement, " condition_era_end_date = (", as.character(condition_era_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, " condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_count = (", as.character(condition_occurrence_count), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cdm_source' AS test, CASE WHEN(SELECT COUNT(*) FROM cdm_source WHERE")
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, " cdm_source_name IS NULL")
    } else if (is(cdm_source_name, "subQuery")){
      statement <- paste0(statement, " cdm_source_name = (", as.character(cdm_source_name), ")")
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, " cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      statement <- paste0(statement, " cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")")
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }

  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, " cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      statement <- paste0(statement, " cdm_holder = (", as.character(cdm_holder), ")")
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }

  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, " source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      statement <- paste0(statement, " source_description = (", as.character(source_description), ")")
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }

  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, " source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      statement <- paste0(statement, " source_documentation_reference = (", as.character(source_documentation_reference), ")")
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, " cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      statement <- paste0(statement, " cdm_etl_reference = (", as.character(cdm_etl_reference), ")")
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }

  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, " source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      statement <- paste0(statement, " source_release_date = (", as.character(source_release_date), ")")
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }

  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, " cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      statement <- paste0(statement, " cdm_release_date = (", as.character(cdm_release_date), ")")
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }

  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, " cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      statement <- paste0(statement, " cdm_version = (", as.character(cdm_version), ")")
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, " vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      statement <- paste0(statement, " vocabulary_version = (", as.character(vocabulary_version), ")")
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_definition WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, " cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      statement <- paste0(statement, " cohort_definition_name = (", as.character(cohort_definition_name), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }

  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, " cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      statement <- paste0(statement, " cohort_definition_description = (", as.character(cohort_definition_description), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, " definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " definition_type_concept_id = (", as.character(definition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, " cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      statement <- paste0(statement, " cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }

  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, " subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      statement <- paste0(statement, " subject_concept_id = (", as.character(subject_concept_id), ")")
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, " cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      statement <- paste0(statement, " cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")")
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_cohort_attribute <- function(cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_attribute' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_attribute WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect attribute_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM attribute_definition WHERE")
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, " attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      statement <- paste0(statement, " attribute_name = (", as.character(attribute_name), ")")
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }

  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, " attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      statement <- paste0(statement, " attribute_description = (", as.character(attribute_description), ")")
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, " attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      statement <- paste0(statement, " attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }

  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, " attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      statement <- paste0(statement, " attribute_syntax = (", as.character(attribute_syntax), ")")
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }

  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_person <- function(person_id, person_source_value, gender_concept_id, gender_source_value, year_of_birth, month_of_birth, day_of_birth, race_concept_id, race_source_value, ethnicity_concept_id, ethnicity_source_value, time_of_birth, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_concept_id, ethnicity_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM person WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, " person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      statement <- paste0(statement, " person_source_value = (", as.character(person_source_value), ")")
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, " month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      statement <- paste0(statement, " month_of_birth = (", as.character(month_of_birth), ")")
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }

  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, " day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      statement <- paste0(statement, " day_of_birth = (", as.character(day_of_birth), ")")
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }

  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, " race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      statement <- paste0(statement, " race_concept_id = (", as.character(race_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }

  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, " race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      statement <- paste0(statement, " race_source_value = (", as.character(race_source_value), ")")
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, " ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, " ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_value = (", as.character(ethnicity_source_value), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }

  if (!missing(time_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(time_of_birth)) {
      statement <- paste0(statement, " time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      statement <- paste0(statement, " time_of_birth = (", as.character(time_of_birth), ")")
    } else {
      statement <- paste0(statement, " time_of_birth = '", time_of_birth,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, " race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      statement <- paste0(statement, " race_source_concept_id = (", as.character(race_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, " ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_occurrence WHERE")
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, " visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_concept_id = (", as.character(visit_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, " visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      statement <- paste0(statement, " visit_start_date = (", as.character(visit_start_date), ")")
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }

  if (!missing(visit_start_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_time)) {
      statement <- paste0(statement, " visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      statement <- paste0(statement, " visit_start_time = (", as.character(visit_start_time), ")")
    } else {
      statement <- paste0(statement, " visit_start_time = '", visit_start_time,"'")
    }
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, " visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      statement <- paste0(statement, " visit_end_date = (", as.character(visit_end_date), ")")
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }

  if (!missing(visit_end_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_time)) {
      statement <- paste0(statement, " visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      statement <- paste0(statement, " visit_end_time = (", as.character(visit_end_time), ")")
    } else {
      statement <- paste0(statement, " visit_end_time = '", visit_end_time,"'")
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, " visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_type_concept_id = (", as.character(visit_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, " visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      statement <- paste0(statement, " visit_source_value = (", as.character(visit_source_value), ")")
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, " visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_source_concept_id = (", as.character(visit_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) FROM observation_period WHERE")
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, " observation_period_id IS NULL")
    } else if (is(observation_period_id, "subQuery")){
      statement <- paste0(statement, " observation_period_id = (", as.character(observation_period_id), ")")
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, " observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      statement <- paste0(statement, " observation_period_start_date = (", as.character(observation_period_start_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }

  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, " observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      statement <- paste0(statement, " observation_period_end_date = (", as.character(observation_period_end_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }

  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, " period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      statement <- paste0(statement, " period_type_concept_id = (", as.character(period_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect location' AS test, CASE WHEN(SELECT COUNT(*) FROM location WHERE")
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, " address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      statement <- paste0(statement, " address_1 = (", as.character(address_1), ")")
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }

  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, " address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      statement <- paste0(statement, " address_2 = (", as.character(address_2), ")")
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }

  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(city)) {
      statement <- paste0(statement, " city IS NULL")
    } else if (is(city, "subQuery")){
      statement <- paste0(statement, " city = (", as.character(city), ")")
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }

  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(state)) {
      statement <- paste0(statement, " state IS NULL")
    } else if (is(state, "subQuery")){
      statement <- paste0(statement, " state = (", as.character(state), ")")
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }

  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(zip)) {
      statement <- paste0(statement, " zip IS NULL")
    } else if (is(zip, "subQuery")){
      statement <- paste0(statement, " zip = (", as.character(zip), ")")
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }

  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(county)) {
      statement <- paste0(statement, " county IS NULL")
    } else if (is(county, "subQuery")){
      statement <- paste0(statement, " county = (", as.character(county), ")")
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }

  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, " location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      statement <- paste0(statement, " location_source_value = (", as.character(location_source_value), ")")
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect care_site' AS test, CASE WHEN(SELECT COUNT(*) FROM care_site WHERE")
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, " care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      statement <- paste0(statement, " care_site_name = (", as.character(care_site_name), ")")
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, " place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      statement <- paste0(statement, " place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")")
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, " care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      statement <- paste0(statement, " care_site_source_value = (", as.character(care_site_source_value), ")")
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, " place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      statement <- paste0(statement, " place_of_service_source_value = (", as.character(place_of_service_source_value), ")")
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_occurrence WHERE")
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, " condition_occurrence_id IS NULL")
    } else if (is(condition_occurrence_id, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_id = (", as.character(condition_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, " condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      statement <- paste0(statement, " condition_start_date = (", as.character(condition_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }

  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, " condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      statement <- paste0(statement, " condition_end_date = (", as.character(condition_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, " condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_type_concept_id = (", as.character(condition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, " condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      statement <- paste0(statement, " condition_source_value = (", as.character(condition_source_value), ")")
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, " condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_source_concept_id = (", as.character(condition_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_death <- function(person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM death WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, " death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      statement <- paste0(statement, " death_date = (", as.character(death_date), ")")
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }

  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, " death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      statement <- paste0(statement, " death_type_concept_id = (", as.character(death_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }

  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, " cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_concept_id = (", as.character(cause_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }

  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, " cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      statement <- paste0(statement, " cause_source_value = (", as.character(cause_source_value), ")")
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, " cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_source_concept_id = (", as.character(cause_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_drug_exposure <- function(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_exposure WHERE")
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, " drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, " drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, " drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_type_concept_id = (", as.character(drug_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(refills)) {
      statement <- paste0(statement, " refills IS NULL")
    } else if (is(refills, "subQuery")){
      statement <- paste0(statement, " refills = (", as.character(refills), ")")
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, " days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      statement <- paste0(statement, " days_supply = (", as.character(days_supply), ")")
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }

  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(sig)) {
      statement <- paste0(statement, " sig IS NULL")
    } else if (is(sig, "subQuery")){
      statement <- paste0(statement, " sig = (", as.character(sig), ")")
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }

  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, " route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      statement <- paste0(statement, " route_concept_id = (", as.character(route_concept_id), ")")
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }

  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, " effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      statement <- paste0(statement, " effective_drug_dose = (", as.character(effective_drug_dose), ")")
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, " dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      statement <- paste0(statement, " dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }

  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, " lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      statement <- paste0(statement, " lot_number = (", as.character(lot_number), ")")
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, " drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      statement <- paste0(statement, " drug_source_value = (", as.character(drug_source_value), ")")
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, " drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_source_concept_id = (", as.character(drug_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }

  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, " route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      statement <- paste0(statement, " route_source_value = (", as.character(route_source_value), ")")
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, " dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      statement <- paste0(statement, " dose_unit_source_value = (", as.character(dose_unit_source_value), ")")
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM device_exposure WHERE")
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, " device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      statement <- paste0(statement, " device_concept_id = (", as.character(device_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, " device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_start_date = (", as.character(device_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, " device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_end_date = (", as.character(device_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }

  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, " device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      statement <- paste0(statement, " device_type_concept_id = (", as.character(device_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }

  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, " unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      statement <- paste0(statement, " unique_device_id = (", as.character(unique_device_id), ")")
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, " device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      statement <- paste0(statement, " device_source_value = (", as.character(device_source_value), ")")
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }

  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, " device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      statement <- paste0(statement, " device_source_concept_id = (", as.character(device_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_procedure_occurrence <- function(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_occurrence WHERE")
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, " procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_concept_id = (", as.character(procedure_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }

  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, " procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      statement <- paste0(statement, " procedure_date = (", as.character(procedure_date), ")")
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, " procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }

  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, " modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      statement <- paste0(statement, " modifier_concept_id = (", as.character(modifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, " procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      statement <- paste0(statement, " procedure_source_value = (", as.character(procedure_source_value), ")")
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, " procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_measurement <- function(measurement_id, person_id, measurement_concept_id, measurement_date, measurement_time, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect measurement' AS test, CASE WHEN(SELECT COUNT(*) FROM measurement WHERE")
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, " measurement_id IS NULL")
    } else if (is(measurement_id, "subQuery")){
      statement <- paste0(statement, " measurement_id = (", as.character(measurement_id), ")")
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, " measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_concept_id = (", as.character(measurement_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }

  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, " measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      statement <- paste0(statement, " measurement_date = (", as.character(measurement_date), ")")
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }

  if (!missing(measurement_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_time)) {
      statement <- paste0(statement, " measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      statement <- paste0(statement, " measurement_time = (", as.character(measurement_time), ")")
    } else {
      statement <- paste0(statement, " measurement_time = '", measurement_time,"'")
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, " measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }

  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, " operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      statement <- paste0(statement, " operator_concept_id = (", as.character(operator_concept_id), ")")
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, " range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      statement <- paste0(statement, " range_low = (", as.character(range_low), ")")
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }

  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, " range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      statement <- paste0(statement, " range_high = (", as.character(range_high), ")")
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, " measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      statement <- paste0(statement, " measurement_source_value = (", as.character(measurement_source_value), ")")
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, " measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, " value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      statement <- paste0(statement, " value_source_value = (", as.character(value_source_value), ")")
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_observation <- function(observation_id, person_id, observation_concept_id, observation_date, observation_time, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM observation WHERE")
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, " observation_id IS NULL")
    } else if (is(observation_id, "subQuery")){
      statement <- paste0(statement, " observation_id = (", as.character(observation_id), ")")
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, " observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_concept_id = (", as.character(observation_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }

  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, " observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      statement <- paste0(statement, " observation_date = (", as.character(observation_date), ")")
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }

  if (!missing(observation_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_time)) {
      statement <- paste0(statement, " observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      statement <- paste0(statement, " observation_time = (", as.character(observation_time), ")")
    } else {
      statement <- paste0(statement, " observation_time = '", observation_time,"'")
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, " observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_type_concept_id = (", as.character(observation_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, " value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      statement <- paste0(statement, " value_as_string = (", as.character(value_as_string), ")")
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, " qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      statement <- paste0(statement, " qualifier_concept_id = (", as.character(qualifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, " observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      statement <- paste0(statement, " observation_source_value = (", as.character(observation_source_value), ")")
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, " observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_source_concept_id = (", as.character(observation_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_provider <- function(provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) FROM provider WHERE")
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, " provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      statement <- paste0(statement, " provider_name = (", as.character(provider_name), ")")
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }

  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(npi)) {
      statement <- paste0(statement, " npi IS NULL")
    } else if (is(npi, "subQuery")){
      statement <- paste0(statement, " npi = (", as.character(npi), ")")
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }

  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dea)) {
      statement <- paste0(statement, " dea IS NULL")
    } else if (is(dea, "subQuery")){
      statement <- paste0(statement, " dea = (", as.character(dea), ")")
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }

  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, " specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_concept_id = (", as.character(specialty_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, " provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      statement <- paste0(statement, " provider_source_value = (", as.character(provider_source_value), ")")
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }

  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, " specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      statement <- paste0(statement, " specialty_source_value = (", as.character(specialty_source_value), ")")
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, " specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_note <- function(note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect note' AS test, CASE WHEN(SELECT COUNT(*) FROM note WHERE")
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, " note_id IS NULL")
    } else if (is(note_id, "subQuery")){
      statement <- paste0(statement, " note_id = (", as.character(note_id), ")")
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, " note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      statement <- paste0(statement, " note_date = (", as.character(note_date), ")")
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }

  if (!missing(note_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_time)) {
      statement <- paste0(statement, " note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      statement <- paste0(statement, " note_time = (", as.character(note_time), ")")
    } else {
      statement <- paste0(statement, " note_time = '", note_time,"'")
    }
  }

  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, " note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      statement <- paste0(statement, " note_type_concept_id = (", as.character(note_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }

  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, " note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      statement <- paste0(statement, " note_text = (", as.character(note_text), ")")
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, " note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      statement <- paste0(statement, " note_source_value = (", as.character(note_source_value), ")")
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect specimen' AS test, CASE WHEN(SELECT COUNT(*) FROM specimen WHERE")
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, " specimen_id IS NULL")
    } else if (is(specimen_id, "subQuery")){
      statement <- paste0(statement, " specimen_id = (", as.character(specimen_id), ")")
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, " specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_concept_id = (", as.character(specimen_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, " specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }

  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, " specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      statement <- paste0(statement, " specimen_date = (", as.character(specimen_date), ")")
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }

  if (!missing(specimen_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_time)) {
      statement <- paste0(statement, " specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      statement <- paste0(statement, " specimen_time = (", as.character(specimen_time), ")")
    } else {
      statement <- paste0(statement, " specimen_time = '", specimen_time,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, " anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      statement <- paste0(statement, " anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, " disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      statement <- paste0(statement, " disease_status_concept_id = (", as.character(disease_status_concept_id), ")")
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }

  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, " specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      statement <- paste0(statement, " specimen_source_id = (", as.character(specimen_source_id), ")")
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }

  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, " specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      statement <- paste0(statement, " specimen_source_value = (", as.character(specimen_source_value), ")")
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, " anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      statement <- paste0(statement, " anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }

  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, " disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      statement <- paste0(statement, " disease_status_source_value = (", as.character(disease_status_source_value), ")")
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect fact_relationship' AS test, CASE WHEN(SELECT COUNT(*) FROM fact_relationship WHERE")
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, " domain_concept_id_1 IS NULL")
    } else if (is(domain_concept_id_1, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_1 = (", as.character(domain_concept_id_1), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }

  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, " fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      statement <- paste0(statement, " fact_id_1 = (", as.character(fact_id_1), ")")
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, " domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_2 = (", as.character(domain_concept_id_2), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }

  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, " fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      statement <- paste0(statement, " fact_id_2 = (", as.character(fact_id_2), ")")
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, " relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      statement <- paste0(statement, " relationship_concept_id = (", as.character(relationship_concept_id), ")")
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_procedure_cost <- function(procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_cost WHERE")
  first <- TRUE
  if (!missing(procedure_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_cost_id)) {
      statement <- paste0(statement, " procedure_cost_id IS NULL")
    } else if (is(procedure_cost_id, "subQuery")){
      statement <- paste0(statement, " procedure_cost_id = (", as.character(procedure_cost_id), ")")
    } else {
      statement <- paste0(statement, " procedure_cost_id = '", procedure_cost_id,"'")
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, " revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      statement <- paste0(statement, " revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")")
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, " revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      statement <- paste0(statement, " revenue_code_source_value = (", as.character(revenue_code_source_value), ")")
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_visit_cost <- function(visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_cost WHERE")
  first <- TRUE
  if (!missing(visit_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_cost_id)) {
      statement <- paste0(statement, " visit_cost_id IS NULL")
    } else if (is(visit_cost_id, "subQuery")){
      statement <- paste0(statement, " visit_cost_id = (", as.character(visit_cost_id), ")")
    } else {
      statement <- paste0(statement, " visit_cost_id = '", visit_cost_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_drug_cost <- function(drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_cost WHERE")
  first <- TRUE
  if (!missing(drug_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_cost_id)) {
      statement <- paste0(statement, " drug_cost_id IS NULL")
    } else if (is(drug_cost_id, "subQuery")){
      statement <- paste0(statement, " drug_cost_id = (", as.character(drug_cost_id), ")")
    } else {
      statement <- paste0(statement, " drug_cost_id = '", drug_cost_id,"'")
    }
  }

  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ingredient_cost)) {
      statement <- paste0(statement, " ingredient_cost IS NULL")
    } else if (is(ingredient_cost, "subQuery")){
      statement <- paste0(statement, " ingredient_cost = (", as.character(ingredient_cost), ")")
    } else {
      statement <- paste0(statement, " ingredient_cost = '", ingredient_cost,"'")
    }
  }

  if (!missing(dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dispensing_fee)) {
      statement <- paste0(statement, " dispensing_fee IS NULL")
    } else if (is(dispensing_fee, "subQuery")){
      statement <- paste0(statement, " dispensing_fee = (", as.character(dispensing_fee), ")")
    } else {
      statement <- paste0(statement, " dispensing_fee = '", dispensing_fee,"'")
    }
  }

  if (!missing(average_wholesale_price)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(average_wholesale_price)) {
      statement <- paste0(statement, " average_wholesale_price IS NULL")
    } else if (is(average_wholesale_price, "subQuery")){
      statement <- paste0(statement, " average_wholesale_price = (", as.character(average_wholesale_price), ")")
    } else {
      statement <- paste0(statement, " average_wholesale_price = '", average_wholesale_price,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect payer_plan_period' AS test, CASE WHEN(SELECT COUNT(*) FROM payer_plan_period WHERE")
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, " payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, " payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }

  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, " payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      statement <- paste0(statement, " payer_source_value = (", as.character(payer_source_value), ")")
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }

  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, " plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      statement <- paste0(statement, " plan_source_value = (", as.character(plan_source_value), ")")
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }

  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, " family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      statement <- paste0(statement, " family_source_value = (", as.character(family_source_value), ")")
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_device_cost <- function(device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM device_cost WHERE")
  first <- TRUE
  if (!missing(device_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_cost_id)) {
      statement <- paste0(statement, " device_cost_id IS NULL")
    } else if (is(device_cost_id, "subQuery")){
      statement <- paste0(statement, " device_cost_id = (", as.character(device_cost_id), ")")
    } else {
      statement <- paste0(statement, " device_cost_id = '", device_cost_id,"'")
    }
  }

  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_era' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_era WHERE")
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, " drug_era_id IS NULL")
    } else if (is(drug_era_id, "subQuery")){
      statement <- paste0(statement, " drug_era_id = (", as.character(drug_era_id), ")")
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, " drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      statement <- paste0(statement, " drug_era_start_date = (", as.character(drug_era_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }

  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, " drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      statement <- paste0(statement, " drug_era_end_date = (", as.character(drug_era_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }

  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, " drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      statement <- paste0(statement, " drug_exposure_count = (", as.character(drug_exposure_count), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }

  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, " gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      statement <- paste0(statement, " gap_days = (", as.character(gap_days), ")")
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect dose_era' AS test, CASE WHEN(SELECT COUNT(*) FROM dose_era WHERE")
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, " dose_era_id IS NULL")
    } else if (is(dose_era_id, "subQuery")){
      statement <- paste0(statement, " dose_era_id = (", as.character(dose_era_id), ")")
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, " dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      statement <- paste0(statement, " dose_value = (", as.character(dose_value), ")")
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }

  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, " dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      statement <- paste0(statement, " dose_era_start_date = (", as.character(dose_era_start_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }

  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, " dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      statement <- paste0(statement, " dose_era_end_date = (", as.character(dose_era_end_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_era' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_era WHERE")
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, " condition_era_id IS NULL")
    } else if (is(condition_era_id, "subQuery")){
      statement <- paste0(statement, " condition_era_id = (", as.character(condition_era_id), ")")
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, " condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      statement <- paste0(statement, " condition_era_start_date = (", as.character(condition_era_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }

  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, " condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      statement <- paste0(statement, " condition_era_end_date = (", as.character(condition_era_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, " condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_count = (", as.character(condition_occurrence_count), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cdm_source' AS test, CASE WHEN(SELECT COUNT(*) FROM cdm_source WHERE")
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, " cdm_source_name IS NULL")
    } else if (is(cdm_source_name, "subQuery")){
      statement <- paste0(statement, " cdm_source_name = (", as.character(cdm_source_name), ")")
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, " cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      statement <- paste0(statement, " cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")")
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }

  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, " cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      statement <- paste0(statement, " cdm_holder = (", as.character(cdm_holder), ")")
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }

  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, " source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      statement <- paste0(statement, " source_description = (", as.character(source_description), ")")
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }

  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, " source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      statement <- paste0(statement, " source_documentation_reference = (", as.character(source_documentation_reference), ")")
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, " cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      statement <- paste0(statement, " cdm_etl_reference = (", as.character(cdm_etl_reference), ")")
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }

  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, " source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      statement <- paste0(statement, " source_release_date = (", as.character(source_release_date), ")")
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }

  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, " cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      statement <- paste0(statement, " cdm_release_date = (", as.character(cdm_release_date), ")")
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }

  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, " cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      statement <- paste0(statement, " cdm_version = (", as.character(cdm_version), ")")
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, " vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      statement <- paste0(statement, " vocabulary_version = (", as.character(vocabulary_version), ")")
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_definition WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, " cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      statement <- paste0(statement, " cohort_definition_name = (", as.character(cohort_definition_name), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }

  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, " cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      statement <- paste0(statement, " cohort_definition_description = (", as.character(cohort_definition_description), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, " definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " definition_type_concept_id = (", as.character(definition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, " cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      statement <- paste0(statement, " cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }

  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, " subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      statement <- paste0(statement, " subject_concept_id = (", as.character(subject_concept_id), ")")
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, " cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      statement <- paste0(statement, " cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")")
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_cohort_attribute <- function(cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_attribute' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_attribute WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_no_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect attribute_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM attribute_definition WHERE")
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, " attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      statement <- paste0(statement, " attribute_name = (", as.character(attribute_name), ")")
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }

  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, " attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      statement <- paste0(statement, " attribute_description = (", as.character(attribute_description), ")")
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, " attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      statement <- paste0(statement, " attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }

  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, " attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      statement <- paste0(statement, " attribute_syntax = (", as.character(attribute_syntax), ")")
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }

  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_person <- function(rowCount, person_id, person_source_value, gender_concept_id, gender_source_value, year_of_birth, month_of_birth, day_of_birth, race_concept_id, race_source_value, ethnicity_concept_id, ethnicity_source_value, time_of_birth, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_concept_id, ethnicity_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) FROM person WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, " person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      statement <- paste0(statement, " person_source_value = (", as.character(person_source_value), ")")
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, " month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      statement <- paste0(statement, " month_of_birth = (", as.character(month_of_birth), ")")
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }

  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, " day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      statement <- paste0(statement, " day_of_birth = (", as.character(day_of_birth), ")")
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }

  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, " race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      statement <- paste0(statement, " race_concept_id = (", as.character(race_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }

  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, " race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      statement <- paste0(statement, " race_source_value = (", as.character(race_source_value), ")")
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, " ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, " ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_value = (", as.character(ethnicity_source_value), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }

  if (!missing(time_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(time_of_birth)) {
      statement <- paste0(statement, " time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      statement <- paste0(statement, " time_of_birth = (", as.character(time_of_birth), ")")
    } else {
      statement <- paste0(statement, " time_of_birth = '", time_of_birth,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, " race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      statement <- paste0(statement, " race_source_concept_id = (", as.character(race_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, " ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_visit_occurrence <- function(rowCount, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_occurrence WHERE")
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, " visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_concept_id = (", as.character(visit_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, " visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      statement <- paste0(statement, " visit_start_date = (", as.character(visit_start_date), ")")
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }

  if (!missing(visit_start_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_time)) {
      statement <- paste0(statement, " visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      statement <- paste0(statement, " visit_start_time = (", as.character(visit_start_time), ")")
    } else {
      statement <- paste0(statement, " visit_start_time = '", visit_start_time,"'")
    }
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, " visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      statement <- paste0(statement, " visit_end_date = (", as.character(visit_end_date), ")")
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }

  if (!missing(visit_end_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_time)) {
      statement <- paste0(statement, " visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      statement <- paste0(statement, " visit_end_time = (", as.character(visit_end_time), ")")
    } else {
      statement <- paste0(statement, " visit_end_time = '", visit_end_time,"'")
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, " visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_type_concept_id = (", as.character(visit_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, " visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      statement <- paste0(statement, " visit_source_value = (", as.character(visit_source_value), ")")
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, " visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_source_concept_id = (", as.character(visit_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_observation_period <- function(rowCount, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) FROM observation_period WHERE")
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, " observation_period_id IS NULL")
    } else if (is(observation_period_id, "subQuery")){
      statement <- paste0(statement, " observation_period_id = (", as.character(observation_period_id), ")")
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, " observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      statement <- paste0(statement, " observation_period_start_date = (", as.character(observation_period_start_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }

  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, " observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      statement <- paste0(statement, " observation_period_end_date = (", as.character(observation_period_end_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }

  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, " period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      statement <- paste0(statement, " period_type_concept_id = (", as.character(period_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_location <- function(rowCount, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect location' AS test, CASE WHEN(SELECT COUNT(*) FROM location WHERE")
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, " address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      statement <- paste0(statement, " address_1 = (", as.character(address_1), ")")
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }

  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, " address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      statement <- paste0(statement, " address_2 = (", as.character(address_2), ")")
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }

  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(city)) {
      statement <- paste0(statement, " city IS NULL")
    } else if (is(city, "subQuery")){
      statement <- paste0(statement, " city = (", as.character(city), ")")
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }

  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(state)) {
      statement <- paste0(statement, " state IS NULL")
    } else if (is(state, "subQuery")){
      statement <- paste0(statement, " state = (", as.character(state), ")")
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }

  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(zip)) {
      statement <- paste0(statement, " zip IS NULL")
    } else if (is(zip, "subQuery")){
      statement <- paste0(statement, " zip = (", as.character(zip), ")")
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }

  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(county)) {
      statement <- paste0(statement, " county IS NULL")
    } else if (is(county, "subQuery")){
      statement <- paste0(statement, " county = (", as.character(county), ")")
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }

  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, " location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      statement <- paste0(statement, " location_source_value = (", as.character(location_source_value), ")")
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_care_site <- function(rowCount, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect care_site' AS test, CASE WHEN(SELECT COUNT(*) FROM care_site WHERE")
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, " care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      statement <- paste0(statement, " care_site_name = (", as.character(care_site_name), ")")
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, " place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      statement <- paste0(statement, " place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")")
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, " care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      statement <- paste0(statement, " care_site_source_value = (", as.character(care_site_source_value), ")")
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, " place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      statement <- paste0(statement, " place_of_service_source_value = (", as.character(place_of_service_source_value), ")")
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_condition_occurrence <- function(rowCount, condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_occurrence WHERE")
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, " condition_occurrence_id IS NULL")
    } else if (is(condition_occurrence_id, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_id = (", as.character(condition_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, " condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      statement <- paste0(statement, " condition_start_date = (", as.character(condition_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }

  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, " condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      statement <- paste0(statement, " condition_end_date = (", as.character(condition_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, " condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_type_concept_id = (", as.character(condition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, " condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      statement <- paste0(statement, " condition_source_value = (", as.character(condition_source_value), ")")
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, " condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_source_concept_id = (", as.character(condition_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_death <- function(rowCount, person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) FROM death WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, " death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      statement <- paste0(statement, " death_date = (", as.character(death_date), ")")
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }

  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, " death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      statement <- paste0(statement, " death_type_concept_id = (", as.character(death_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }

  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, " cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_concept_id = (", as.character(cause_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }

  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, " cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      statement <- paste0(statement, " cause_source_value = (", as.character(cause_source_value), ")")
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, " cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_source_concept_id = (", as.character(cause_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_drug_exposure <- function(rowCount, drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_exposure WHERE")
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, " drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, " drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, " drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_type_concept_id = (", as.character(drug_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(refills)) {
      statement <- paste0(statement, " refills IS NULL")
    } else if (is(refills, "subQuery")){
      statement <- paste0(statement, " refills = (", as.character(refills), ")")
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, " days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      statement <- paste0(statement, " days_supply = (", as.character(days_supply), ")")
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }

  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(sig)) {
      statement <- paste0(statement, " sig IS NULL")
    } else if (is(sig, "subQuery")){
      statement <- paste0(statement, " sig = (", as.character(sig), ")")
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }

  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, " route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      statement <- paste0(statement, " route_concept_id = (", as.character(route_concept_id), ")")
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }

  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, " effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      statement <- paste0(statement, " effective_drug_dose = (", as.character(effective_drug_dose), ")")
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, " dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      statement <- paste0(statement, " dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }

  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, " lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      statement <- paste0(statement, " lot_number = (", as.character(lot_number), ")")
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, " drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      statement <- paste0(statement, " drug_source_value = (", as.character(drug_source_value), ")")
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, " drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_source_concept_id = (", as.character(drug_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }

  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, " route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      statement <- paste0(statement, " route_source_value = (", as.character(route_source_value), ")")
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, " dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      statement <- paste0(statement, " dose_unit_source_value = (", as.character(dose_unit_source_value), ")")
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_device_exposure <- function(rowCount, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_exposure' AS test, CASE WHEN(SELECT COUNT(*) FROM device_exposure WHERE")
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, " device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      statement <- paste0(statement, " device_concept_id = (", as.character(device_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, " device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_start_date = (", as.character(device_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, " device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_end_date = (", as.character(device_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }

  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, " device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      statement <- paste0(statement, " device_type_concept_id = (", as.character(device_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }

  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, " unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      statement <- paste0(statement, " unique_device_id = (", as.character(unique_device_id), ")")
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, " device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      statement <- paste0(statement, " device_source_value = (", as.character(device_source_value), ")")
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }

  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, " device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      statement <- paste0(statement, " device_source_concept_id = (", as.character(device_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_procedure_occurrence <- function(rowCount, procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_occurrence WHERE")
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, " procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_concept_id = (", as.character(procedure_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }

  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, " procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      statement <- paste0(statement, " procedure_date = (", as.character(procedure_date), ")")
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, " procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }

  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, " modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      statement <- paste0(statement, " modifier_concept_id = (", as.character(modifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, " procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      statement <- paste0(statement, " procedure_source_value = (", as.character(procedure_source_value), ")")
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, " procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_measurement <- function(rowCount, measurement_id, person_id, measurement_concept_id, measurement_date, measurement_time, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect measurement' AS test, CASE WHEN(SELECT COUNT(*) FROM measurement WHERE")
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, " measurement_id IS NULL")
    } else if (is(measurement_id, "subQuery")){
      statement <- paste0(statement, " measurement_id = (", as.character(measurement_id), ")")
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, " measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_concept_id = (", as.character(measurement_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }

  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, " measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      statement <- paste0(statement, " measurement_date = (", as.character(measurement_date), ")")
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }

  if (!missing(measurement_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_time)) {
      statement <- paste0(statement, " measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      statement <- paste0(statement, " measurement_time = (", as.character(measurement_time), ")")
    } else {
      statement <- paste0(statement, " measurement_time = '", measurement_time,"'")
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, " measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }

  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, " operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      statement <- paste0(statement, " operator_concept_id = (", as.character(operator_concept_id), ")")
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, " range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      statement <- paste0(statement, " range_low = (", as.character(range_low), ")")
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }

  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, " range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      statement <- paste0(statement, " range_high = (", as.character(range_high), ")")
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, " measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      statement <- paste0(statement, " measurement_source_value = (", as.character(measurement_source_value), ")")
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, " measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, " value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      statement <- paste0(statement, " value_source_value = (", as.character(value_source_value), ")")
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_observation <- function(rowCount, observation_id, person_id, observation_concept_id, observation_date, observation_time, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) FROM observation WHERE")
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, " observation_id IS NULL")
    } else if (is(observation_id, "subQuery")){
      statement <- paste0(statement, " observation_id = (", as.character(observation_id), ")")
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, " observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_concept_id = (", as.character(observation_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }

  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, " observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      statement <- paste0(statement, " observation_date = (", as.character(observation_date), ")")
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }

  if (!missing(observation_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_time)) {
      statement <- paste0(statement, " observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      statement <- paste0(statement, " observation_time = (", as.character(observation_time), ")")
    } else {
      statement <- paste0(statement, " observation_time = '", observation_time,"'")
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, " observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_type_concept_id = (", as.character(observation_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, " value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      statement <- paste0(statement, " value_as_string = (", as.character(value_as_string), ")")
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, " qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      statement <- paste0(statement, " qualifier_concept_id = (", as.character(qualifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, " observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      statement <- paste0(statement, " observation_source_value = (", as.character(observation_source_value), ")")
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, " observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_source_concept_id = (", as.character(observation_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_provider <- function(rowCount, provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) FROM provider WHERE")
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, " provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      statement <- paste0(statement, " provider_name = (", as.character(provider_name), ")")
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }

  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(npi)) {
      statement <- paste0(statement, " npi IS NULL")
    } else if (is(npi, "subQuery")){
      statement <- paste0(statement, " npi = (", as.character(npi), ")")
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }

  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dea)) {
      statement <- paste0(statement, " dea IS NULL")
    } else if (is(dea, "subQuery")){
      statement <- paste0(statement, " dea = (", as.character(dea), ")")
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }

  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, " specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_concept_id = (", as.character(specialty_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, " provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      statement <- paste0(statement, " provider_source_value = (", as.character(provider_source_value), ")")
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }

  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, " specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      statement <- paste0(statement, " specialty_source_value = (", as.character(specialty_source_value), ")")
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, " specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_note <- function(rowCount, note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect note' AS test, CASE WHEN(SELECT COUNT(*) FROM note WHERE")
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, " note_id IS NULL")
    } else if (is(note_id, "subQuery")){
      statement <- paste0(statement, " note_id = (", as.character(note_id), ")")
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, " note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      statement <- paste0(statement, " note_date = (", as.character(note_date), ")")
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }

  if (!missing(note_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_time)) {
      statement <- paste0(statement, " note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      statement <- paste0(statement, " note_time = (", as.character(note_time), ")")
    } else {
      statement <- paste0(statement, " note_time = '", note_time,"'")
    }
  }

  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, " note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      statement <- paste0(statement, " note_type_concept_id = (", as.character(note_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }

  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, " note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      statement <- paste0(statement, " note_text = (", as.character(note_text), ")")
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, " note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      statement <- paste0(statement, " note_source_value = (", as.character(note_source_value), ")")
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_specimen <- function(rowCount, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect specimen' AS test, CASE WHEN(SELECT COUNT(*) FROM specimen WHERE")
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, " specimen_id IS NULL")
    } else if (is(specimen_id, "subQuery")){
      statement <- paste0(statement, " specimen_id = (", as.character(specimen_id), ")")
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, " specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_concept_id = (", as.character(specimen_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, " specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }

  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, " specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      statement <- paste0(statement, " specimen_date = (", as.character(specimen_date), ")")
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }

  if (!missing(specimen_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_time)) {
      statement <- paste0(statement, " specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      statement <- paste0(statement, " specimen_time = (", as.character(specimen_time), ")")
    } else {
      statement <- paste0(statement, " specimen_time = '", specimen_time,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, " anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      statement <- paste0(statement, " anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, " disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      statement <- paste0(statement, " disease_status_concept_id = (", as.character(disease_status_concept_id), ")")
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }

  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, " specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      statement <- paste0(statement, " specimen_source_id = (", as.character(specimen_source_id), ")")
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }

  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, " specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      statement <- paste0(statement, " specimen_source_value = (", as.character(specimen_source_value), ")")
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, " anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      statement <- paste0(statement, " anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }

  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, " disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      statement <- paste0(statement, " disease_status_source_value = (", as.character(disease_status_source_value), ")")
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_fact_relationship <- function(rowCount, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect fact_relationship' AS test, CASE WHEN(SELECT COUNT(*) FROM fact_relationship WHERE")
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, " domain_concept_id_1 IS NULL")
    } else if (is(domain_concept_id_1, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_1 = (", as.character(domain_concept_id_1), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }

  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, " fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      statement <- paste0(statement, " fact_id_1 = (", as.character(fact_id_1), ")")
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, " domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_2 = (", as.character(domain_concept_id_2), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }

  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, " fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      statement <- paste0(statement, " fact_id_2 = (", as.character(fact_id_2), ")")
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, " relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      statement <- paste0(statement, " relationship_concept_id = (", as.character(relationship_concept_id), ")")
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_procedure_cost <- function(rowCount, procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM procedure_cost WHERE")
  first <- TRUE
  if (!missing(procedure_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_cost_id)) {
      statement <- paste0(statement, " procedure_cost_id IS NULL")
    } else if (is(procedure_cost_id, "subQuery")){
      statement <- paste0(statement, " procedure_cost_id = (", as.character(procedure_cost_id), ")")
    } else {
      statement <- paste0(statement, " procedure_cost_id = '", procedure_cost_id,"'")
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, " revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      statement <- paste0(statement, " revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")")
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, " revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      statement <- paste0(statement, " revenue_code_source_value = (", as.character(revenue_code_source_value), ")")
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_visit_cost <- function(rowCount, visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM visit_cost WHERE")
  first <- TRUE
  if (!missing(visit_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_cost_id)) {
      statement <- paste0(statement, " visit_cost_id IS NULL")
    } else if (is(visit_cost_id, "subQuery")){
      statement <- paste0(statement, " visit_cost_id = (", as.character(visit_cost_id), ")")
    } else {
      statement <- paste0(statement, " visit_cost_id = '", visit_cost_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_drug_cost <- function(rowCount, drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_cost WHERE")
  first <- TRUE
  if (!missing(drug_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_cost_id)) {
      statement <- paste0(statement, " drug_cost_id IS NULL")
    } else if (is(drug_cost_id, "subQuery")){
      statement <- paste0(statement, " drug_cost_id = (", as.character(drug_cost_id), ")")
    } else {
      statement <- paste0(statement, " drug_cost_id = '", drug_cost_id,"'")
    }
  }

  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ingredient_cost)) {
      statement <- paste0(statement, " ingredient_cost IS NULL")
    } else if (is(ingredient_cost, "subQuery")){
      statement <- paste0(statement, " ingredient_cost = (", as.character(ingredient_cost), ")")
    } else {
      statement <- paste0(statement, " ingredient_cost = '", ingredient_cost,"'")
    }
  }

  if (!missing(dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dispensing_fee)) {
      statement <- paste0(statement, " dispensing_fee IS NULL")
    } else if (is(dispensing_fee, "subQuery")){
      statement <- paste0(statement, " dispensing_fee = (", as.character(dispensing_fee), ")")
    } else {
      statement <- paste0(statement, " dispensing_fee = '", dispensing_fee,"'")
    }
  }

  if (!missing(average_wholesale_price)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(average_wholesale_price)) {
      statement <- paste0(statement, " average_wholesale_price IS NULL")
    } else if (is(average_wholesale_price, "subQuery")){
      statement <- paste0(statement, " average_wholesale_price = (", as.character(average_wholesale_price), ")")
    } else {
      statement <- paste0(statement, " average_wholesale_price = '", average_wholesale_price,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_payer_plan_period <- function(rowCount, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect payer_plan_period' AS test, CASE WHEN(SELECT COUNT(*) FROM payer_plan_period WHERE")
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, " payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, " payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }

  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, " payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      statement <- paste0(statement, " payer_source_value = (", as.character(payer_source_value), ")")
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }

  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, " plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      statement <- paste0(statement, " plan_source_value = (", as.character(plan_source_value), ")")
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }

  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, " family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      statement <- paste0(statement, " family_source_value = (", as.character(family_source_value), ")")
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_device_cost <- function(rowCount, device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_cost' AS test, CASE WHEN(SELECT COUNT(*) FROM device_cost WHERE")
  first <- TRUE
  if (!missing(device_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_cost_id)) {
      statement <- paste0(statement, " device_cost_id IS NULL")
    } else if (is(device_cost_id, "subQuery")){
      statement <- paste0(statement, " device_cost_id = (", as.character(device_cost_id), ")")
    } else {
      statement <- paste0(statement, " device_cost_id = '", device_cost_id,"'")
    }
  }

  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_drug_era <- function(rowCount, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_era' AS test, CASE WHEN(SELECT COUNT(*) FROM drug_era WHERE")
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, " drug_era_id IS NULL")
    } else if (is(drug_era_id, "subQuery")){
      statement <- paste0(statement, " drug_era_id = (", as.character(drug_era_id), ")")
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, " drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      statement <- paste0(statement, " drug_era_start_date = (", as.character(drug_era_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }

  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, " drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      statement <- paste0(statement, " drug_era_end_date = (", as.character(drug_era_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }

  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, " drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      statement <- paste0(statement, " drug_exposure_count = (", as.character(drug_exposure_count), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }

  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, " gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      statement <- paste0(statement, " gap_days = (", as.character(gap_days), ")")
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_dose_era <- function(rowCount, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect dose_era' AS test, CASE WHEN(SELECT COUNT(*) FROM dose_era WHERE")
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, " dose_era_id IS NULL")
    } else if (is(dose_era_id, "subQuery")){
      statement <- paste0(statement, " dose_era_id = (", as.character(dose_era_id), ")")
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, " dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      statement <- paste0(statement, " dose_value = (", as.character(dose_value), ")")
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }

  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, " dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      statement <- paste0(statement, " dose_era_start_date = (", as.character(dose_era_start_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }

  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, " dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      statement <- paste0(statement, " dose_era_end_date = (", as.character(dose_era_end_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_condition_era <- function(rowCount, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_era' AS test, CASE WHEN(SELECT COUNT(*) FROM condition_era WHERE")
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, " condition_era_id IS NULL")
    } else if (is(condition_era_id, "subQuery")){
      statement <- paste0(statement, " condition_era_id = (", as.character(condition_era_id), ")")
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, " condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      statement <- paste0(statement, " condition_era_start_date = (", as.character(condition_era_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }

  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, " condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      statement <- paste0(statement, " condition_era_end_date = (", as.character(condition_era_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, " condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_count = (", as.character(condition_occurrence_count), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_cdm_source <- function(rowCount, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cdm_source' AS test, CASE WHEN(SELECT COUNT(*) FROM cdm_source WHERE")
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, " cdm_source_name IS NULL")
    } else if (is(cdm_source_name, "subQuery")){
      statement <- paste0(statement, " cdm_source_name = (", as.character(cdm_source_name), ")")
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, " cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      statement <- paste0(statement, " cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")")
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }

  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, " cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      statement <- paste0(statement, " cdm_holder = (", as.character(cdm_holder), ")")
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }

  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, " source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      statement <- paste0(statement, " source_description = (", as.character(source_description), ")")
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }

  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, " source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      statement <- paste0(statement, " source_documentation_reference = (", as.character(source_documentation_reference), ")")
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, " cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      statement <- paste0(statement, " cdm_etl_reference = (", as.character(cdm_etl_reference), ")")
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }

  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, " source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      statement <- paste0(statement, " source_release_date = (", as.character(source_release_date), ")")
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }

  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, " cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      statement <- paste0(statement, " cdm_release_date = (", as.character(cdm_release_date), ")")
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }

  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, " cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      statement <- paste0(statement, " cdm_version = (", as.character(cdm_version), ")")
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, " vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      statement <- paste0(statement, " vocabulary_version = (", as.character(vocabulary_version), ")")
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_cohort <- function(rowCount, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_cohort_definition <- function(rowCount, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_definition WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, " cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      statement <- paste0(statement, " cohort_definition_name = (", as.character(cohort_definition_name), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }

  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, " cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      statement <- paste0(statement, " cohort_definition_description = (", as.character(cohort_definition_description), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, " definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " definition_type_concept_id = (", as.character(definition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, " cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      statement <- paste0(statement, " cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }

  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, " subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      statement <- paste0(statement, " subject_concept_id = (", as.character(subject_concept_id), ")")
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, " cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      statement <- paste0(statement, " cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")")
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_cohort_attribute <- function(rowCount, cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_attribute' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_attribute WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

expect_count_attribute_definition <- function(rowCount, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0("INSERT INTO test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect attribute_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM attribute_definition WHERE")
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, " attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      statement <- paste0(statement, " attribute_name = (", as.character(attribute_name), ")")
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }

  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, " attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      statement <- paste0(statement, " attribute_description = (", as.character(attribute_description), ")")
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, " attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      statement <- paste0(statement, " attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }

  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, " attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      statement <- paste0(statement, " attribute_syntax = (", as.character(attribute_syntax), ")")
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }

  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  assign("testSql", c(get("testSql", envir = globalenv()), statement), envir = globalenv())
  invisible(statement)
}

lookup_person <- function(fetchField, person_id, person_source_value, gender_concept_id, gender_source_value, year_of_birth, month_of_birth, day_of_birth, race_concept_id, race_source_value, ethnicity_concept_id, ethnicity_source_value, time_of_birth, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_concept_id, ethnicity_source_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM person WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, " person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      statement <- paste0(statement, " person_source_value = (", as.character(person_source_value), ")")
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, " month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      statement <- paste0(statement, " month_of_birth = (", as.character(month_of_birth), ")")
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }

  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, " day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      statement <- paste0(statement, " day_of_birth = (", as.character(day_of_birth), ")")
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }

  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, " race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      statement <- paste0(statement, " race_concept_id = (", as.character(race_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }

  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, " race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      statement <- paste0(statement, " race_source_value = (", as.character(race_source_value), ")")
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, " ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, " ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_value = (", as.character(ethnicity_source_value), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }

  if (!missing(time_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(time_of_birth)) {
      statement <- paste0(statement, " time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      statement <- paste0(statement, " time_of_birth = (", as.character(time_of_birth), ")")
    } else {
      statement <- paste0(statement, " time_of_birth = '", time_of_birth,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, " race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      statement <- paste0(statement, " race_source_concept_id = (", as.character(race_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, " ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      statement <- paste0(statement, " ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_visit_occurrence <- function(fetchField, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM visit_occurrence WHERE")
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, " visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_concept_id = (", as.character(visit_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, " visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      statement <- paste0(statement, " visit_start_date = (", as.character(visit_start_date), ")")
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }

  if (!missing(visit_start_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_start_time)) {
      statement <- paste0(statement, " visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      statement <- paste0(statement, " visit_start_time = (", as.character(visit_start_time), ")")
    } else {
      statement <- paste0(statement, " visit_start_time = '", visit_start_time,"'")
    }
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, " visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      statement <- paste0(statement, " visit_end_date = (", as.character(visit_end_date), ")")
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }

  if (!missing(visit_end_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_end_time)) {
      statement <- paste0(statement, " visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      statement <- paste0(statement, " visit_end_time = (", as.character(visit_end_time), ")")
    } else {
      statement <- paste0(statement, " visit_end_time = '", visit_end_time,"'")
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, " visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_type_concept_id = (", as.character(visit_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, " visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      statement <- paste0(statement, " visit_source_value = (", as.character(visit_source_value), ")")
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, " visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      statement <- paste0(statement, " visit_source_concept_id = (", as.character(visit_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_observation_period <- function(fetchField, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM observation_period WHERE")
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, " observation_period_id IS NULL")
    } else if (is(observation_period_id, "subQuery")){
      statement <- paste0(statement, " observation_period_id = (", as.character(observation_period_id), ")")
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, " observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      statement <- paste0(statement, " observation_period_start_date = (", as.character(observation_period_start_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }

  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, " observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      statement <- paste0(statement, " observation_period_end_date = (", as.character(observation_period_end_date), ")")
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }

  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, " period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      statement <- paste0(statement, " period_type_concept_id = (", as.character(period_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_location <- function(fetchField, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM location WHERE")
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, " address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      statement <- paste0(statement, " address_1 = (", as.character(address_1), ")")
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }

  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, " address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      statement <- paste0(statement, " address_2 = (", as.character(address_2), ")")
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }

  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(city)) {
      statement <- paste0(statement, " city IS NULL")
    } else if (is(city, "subQuery")){
      statement <- paste0(statement, " city = (", as.character(city), ")")
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }

  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(state)) {
      statement <- paste0(statement, " state IS NULL")
    } else if (is(state, "subQuery")){
      statement <- paste0(statement, " state = (", as.character(state), ")")
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }

  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(zip)) {
      statement <- paste0(statement, " zip IS NULL")
    } else if (is(zip, "subQuery")){
      statement <- paste0(statement, " zip = (", as.character(zip), ")")
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }

  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(county)) {
      statement <- paste0(statement, " county IS NULL")
    } else if (is(county, "subQuery")){
      statement <- paste0(statement, " county = (", as.character(county), ")")
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }

  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, " location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      statement <- paste0(statement, " location_source_value = (", as.character(location_source_value), ")")
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_care_site <- function(fetchField, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM care_site WHERE")
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, " care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      statement <- paste0(statement, " care_site_name = (", as.character(care_site_name), ")")
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, " place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      statement <- paste0(statement, " place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")")
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, " location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      statement <- paste0(statement, " location_id = (", as.character(location_id), ")")
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }

  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, " care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      statement <- paste0(statement, " care_site_source_value = (", as.character(care_site_source_value), ")")
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, " place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      statement <- paste0(statement, " place_of_service_source_value = (", as.character(place_of_service_source_value), ")")
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_condition_occurrence <- function(fetchField, condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM condition_occurrence WHERE")
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, " condition_occurrence_id IS NULL")
    } else if (is(condition_occurrence_id, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_id = (", as.character(condition_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, " condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      statement <- paste0(statement, " condition_start_date = (", as.character(condition_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }

  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, " condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      statement <- paste0(statement, " condition_end_date = (", as.character(condition_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, " condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_type_concept_id = (", as.character(condition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, " condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      statement <- paste0(statement, " condition_source_value = (", as.character(condition_source_value), ")")
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, " condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_source_concept_id = (", as.character(condition_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_death <- function(fetchField, person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM death WHERE")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, " death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      statement <- paste0(statement, " death_date = (", as.character(death_date), ")")
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }

  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, " death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      statement <- paste0(statement, " death_type_concept_id = (", as.character(death_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }

  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, " cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_concept_id = (", as.character(cause_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }

  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, " cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      statement <- paste0(statement, " cause_source_value = (", as.character(cause_source_value), ")")
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, " cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      statement <- paste0(statement, " cause_source_concept_id = (", as.character(cause_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_drug_exposure <- function(fetchField, drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM drug_exposure WHERE")
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, " drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, " drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, " drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_type_concept_id = (", as.character(drug_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, " stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      statement <- paste0(statement, " stop_reason = (", as.character(stop_reason), ")")
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(refills)) {
      statement <- paste0(statement, " refills IS NULL")
    } else if (is(refills, "subQuery")){
      statement <- paste0(statement, " refills = (", as.character(refills), ")")
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, " days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      statement <- paste0(statement, " days_supply = (", as.character(days_supply), ")")
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }

  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(sig)) {
      statement <- paste0(statement, " sig IS NULL")
    } else if (is(sig, "subQuery")){
      statement <- paste0(statement, " sig = (", as.character(sig), ")")
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }

  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, " route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      statement <- paste0(statement, " route_concept_id = (", as.character(route_concept_id), ")")
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }

  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, " effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      statement <- paste0(statement, " effective_drug_dose = (", as.character(effective_drug_dose), ")")
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, " dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      statement <- paste0(statement, " dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }

  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, " lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      statement <- paste0(statement, " lot_number = (", as.character(lot_number), ")")
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, " drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      statement <- paste0(statement, " drug_source_value = (", as.character(drug_source_value), ")")
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, " drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_source_concept_id = (", as.character(drug_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }

  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, " route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      statement <- paste0(statement, " route_source_value = (", as.character(route_source_value), ")")
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, " dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      statement <- paste0(statement, " dose_unit_source_value = (", as.character(dose_unit_source_value), ")")
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_device_exposure <- function(fetchField, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM device_exposure WHERE")
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, " device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      statement <- paste0(statement, " device_concept_id = (", as.character(device_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, " device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_start_date = (", as.character(device_exposure_start_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, " device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      statement <- paste0(statement, " device_exposure_end_date = (", as.character(device_exposure_end_date), ")")
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }

  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, " device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      statement <- paste0(statement, " device_type_concept_id = (", as.character(device_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }

  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, " unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      statement <- paste0(statement, " unique_device_id = (", as.character(unique_device_id), ")")
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, " device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      statement <- paste0(statement, " device_source_value = (", as.character(device_source_value), ")")
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }

  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, " device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      statement <- paste0(statement, " device_source_concept_id = (", as.character(device_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_procedure_occurrence <- function(fetchField, procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM procedure_occurrence WHERE")
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, " procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_concept_id = (", as.character(procedure_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }

  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, " procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      statement <- paste0(statement, " procedure_date = (", as.character(procedure_date), ")")
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, " procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }

  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, " modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      statement <- paste0(statement, " modifier_concept_id = (", as.character(modifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, " procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      statement <- paste0(statement, " procedure_source_value = (", as.character(procedure_source_value), ")")
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, " procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      statement <- paste0(statement, " procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_measurement <- function(fetchField, measurement_id, person_id, measurement_concept_id, measurement_date, measurement_time, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM measurement WHERE")
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, " measurement_id IS NULL")
    } else if (is(measurement_id, "subQuery")){
      statement <- paste0(statement, " measurement_id = (", as.character(measurement_id), ")")
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, " measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_concept_id = (", as.character(measurement_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }

  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, " measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      statement <- paste0(statement, " measurement_date = (", as.character(measurement_date), ")")
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }

  if (!missing(measurement_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_time)) {
      statement <- paste0(statement, " measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      statement <- paste0(statement, " measurement_time = (", as.character(measurement_time), ")")
    } else {
      statement <- paste0(statement, " measurement_time = '", measurement_time,"'")
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, " measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }

  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, " operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      statement <- paste0(statement, " operator_concept_id = (", as.character(operator_concept_id), ")")
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, " range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      statement <- paste0(statement, " range_low = (", as.character(range_low), ")")
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }

  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, " range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      statement <- paste0(statement, " range_high = (", as.character(range_high), ")")
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, " measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      statement <- paste0(statement, " measurement_source_value = (", as.character(measurement_source_value), ")")
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, " measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      statement <- paste0(statement, " measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, " value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      statement <- paste0(statement, " value_source_value = (", as.character(value_source_value), ")")
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_observation <- function(fetchField, observation_id, person_id, observation_concept_id, observation_date, observation_time, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM observation WHERE")
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, " observation_id IS NULL")
    } else if (is(observation_id, "subQuery")){
      statement <- paste0(statement, " observation_id = (", as.character(observation_id), ")")
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, " observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_concept_id = (", as.character(observation_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }

  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, " observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      statement <- paste0(statement, " observation_date = (", as.character(observation_date), ")")
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }

  if (!missing(observation_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_time)) {
      statement <- paste0(statement, " observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      statement <- paste0(statement, " observation_time = (", as.character(observation_time), ")")
    } else {
      statement <- paste0(statement, " observation_time = '", observation_time,"'")
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, " observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_type_concept_id = (", as.character(observation_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, " value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      statement <- paste0(statement, " value_as_string = (", as.character(value_as_string), ")")
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, " qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      statement <- paste0(statement, " qualifier_concept_id = (", as.character(qualifier_concept_id), ")")
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, " observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      statement <- paste0(statement, " observation_source_value = (", as.character(observation_source_value), ")")
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, " observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      statement <- paste0(statement, " observation_source_concept_id = (", as.character(observation_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, " qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      statement <- paste0(statement, " qualifier_source_value = (", as.character(qualifier_source_value), ")")
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_provider <- function(fetchField, provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM provider WHERE")
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, " provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      statement <- paste0(statement, " provider_name = (", as.character(provider_name), ")")
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }

  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(npi)) {
      statement <- paste0(statement, " npi IS NULL")
    } else if (is(npi, "subQuery")){
      statement <- paste0(statement, " npi = (", as.character(npi), ")")
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }

  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dea)) {
      statement <- paste0(statement, " dea IS NULL")
    } else if (is(dea, "subQuery")){
      statement <- paste0(statement, " dea = (", as.character(dea), ")")
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }

  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, " specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_concept_id = (", as.character(specialty_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, " care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      statement <- paste0(statement, " care_site_id = (", as.character(care_site_id), ")")
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, " year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      statement <- paste0(statement, " year_of_birth = (", as.character(year_of_birth), ")")
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, " gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_concept_id = (", as.character(gender_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, " provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      statement <- paste0(statement, " provider_source_value = (", as.character(provider_source_value), ")")
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }

  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, " specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      statement <- paste0(statement, " specialty_source_value = (", as.character(specialty_source_value), ")")
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, " specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      statement <- paste0(statement, " specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, " gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      statement <- paste0(statement, " gender_source_value = (", as.character(gender_source_value), ")")
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, " gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      statement <- paste0(statement, " gender_source_concept_id = (", as.character(gender_source_concept_id), ")")
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_note <- function(fetchField, note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM note WHERE")
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, " note_id IS NULL")
    } else if (is(note_id, "subQuery")){
      statement <- paste0(statement, " note_id = (", as.character(note_id), ")")
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, " note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      statement <- paste0(statement, " note_date = (", as.character(note_date), ")")
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }

  if (!missing(note_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_time)) {
      statement <- paste0(statement, " note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      statement <- paste0(statement, " note_time = (", as.character(note_time), ")")
    } else {
      statement <- paste0(statement, " note_time = '", note_time,"'")
    }
  }

  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, " note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      statement <- paste0(statement, " note_type_concept_id = (", as.character(note_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }

  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, " note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      statement <- paste0(statement, " note_text = (", as.character(note_text), ")")
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, " provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      statement <- paste0(statement, " provider_id = (", as.character(provider_id), ")")
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, " note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      statement <- paste0(statement, " note_source_value = (", as.character(note_source_value), ")")
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_specimen <- function(fetchField, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM specimen WHERE")
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, " specimen_id IS NULL")
    } else if (is(specimen_id, "subQuery")){
      statement <- paste0(statement, " specimen_id = (", as.character(specimen_id), ")")
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, " specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_concept_id = (", as.character(specimen_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, " specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      statement <- paste0(statement, " specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }

  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, " specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      statement <- paste0(statement, " specimen_date = (", as.character(specimen_date), ")")
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }

  if (!missing(specimen_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_time)) {
      statement <- paste0(statement, " specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      statement <- paste0(statement, " specimen_time = (", as.character(specimen_time), ")")
    } else {
      statement <- paste0(statement, " specimen_time = '", specimen_time,"'")
    }
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, " quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      statement <- paste0(statement, " quantity = (", as.character(quantity), ")")
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, " anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      statement <- paste0(statement, " anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, " disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      statement <- paste0(statement, " disease_status_concept_id = (", as.character(disease_status_concept_id), ")")
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }

  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, " specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      statement <- paste0(statement, " specimen_source_id = (", as.character(specimen_source_id), ")")
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }

  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, " specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      statement <- paste0(statement, " specimen_source_value = (", as.character(specimen_source_value), ")")
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, " unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      statement <- paste0(statement, " unit_source_value = (", as.character(unit_source_value), ")")
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, " anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      statement <- paste0(statement, " anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")")
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }

  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, " disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      statement <- paste0(statement, " disease_status_source_value = (", as.character(disease_status_source_value), ")")
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_fact_relationship <- function(fetchField, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM fact_relationship WHERE")
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, " domain_concept_id_1 IS NULL")
    } else if (is(domain_concept_id_1, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_1 = (", as.character(domain_concept_id_1), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }

  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, " fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      statement <- paste0(statement, " fact_id_1 = (", as.character(fact_id_1), ")")
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, " domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      statement <- paste0(statement, " domain_concept_id_2 = (", as.character(domain_concept_id_2), ")")
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }

  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, " fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      statement <- paste0(statement, " fact_id_2 = (", as.character(fact_id_2), ")")
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, " relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      statement <- paste0(statement, " relationship_concept_id = (", as.character(relationship_concept_id), ")")
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_procedure_cost <- function(fetchField, procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM procedure_cost WHERE")
  first <- TRUE
  if (!missing(procedure_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_cost_id)) {
      statement <- paste0(statement, " procedure_cost_id IS NULL")
    } else if (is(procedure_cost_id, "subQuery")){
      statement <- paste0(statement, " procedure_cost_id = (", as.character(procedure_cost_id), ")")
    } else {
      statement <- paste0(statement, " procedure_cost_id = '", procedure_cost_id,"'")
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, " procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      statement <- paste0(statement, " procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, " revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      statement <- paste0(statement, " revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")")
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, " revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      statement <- paste0(statement, " revenue_code_source_value = (", as.character(revenue_code_source_value), ")")
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_visit_cost <- function(fetchField, visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("SELECT ", fetchField , " FROM visit_cost WHERE")
  first <- TRUE
  if (!missing(visit_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_cost_id)) {
      statement <- paste0(statement, " visit_cost_id IS NULL")
    } else if (is(visit_cost_id, "subQuery")){
      statement <- paste0(statement, " visit_cost_id = (", as.character(visit_cost_id), ")")
    } else {
      statement <- paste0(statement, " visit_cost_id = '", visit_cost_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, " visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      statement <- paste0(statement, " visit_occurrence_id = (", as.character(visit_occurrence_id), ")")
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_drug_cost <- function(fetchField, drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {
  statement <- paste0("SELECT ", fetchField , " FROM drug_cost WHERE")
  first <- TRUE
  if (!missing(drug_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_cost_id)) {
      statement <- paste0(statement, " drug_cost_id IS NULL")
    } else if (is(drug_cost_id, "subQuery")){
      statement <- paste0(statement, " drug_cost_id = (", as.character(drug_cost_id), ")")
    } else {
      statement <- paste0(statement, " drug_cost_id = '", drug_cost_id,"'")
    }
  }

  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, " drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      statement <- paste0(statement, " drug_exposure_id = (", as.character(drug_exposure_id), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(ingredient_cost)) {
      statement <- paste0(statement, " ingredient_cost IS NULL")
    } else if (is(ingredient_cost, "subQuery")){
      statement <- paste0(statement, " ingredient_cost = (", as.character(ingredient_cost), ")")
    } else {
      statement <- paste0(statement, " ingredient_cost = '", ingredient_cost,"'")
    }
  }

  if (!missing(dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dispensing_fee)) {
      statement <- paste0(statement, " dispensing_fee IS NULL")
    } else if (is(dispensing_fee, "subQuery")){
      statement <- paste0(statement, " dispensing_fee = (", as.character(dispensing_fee), ")")
    } else {
      statement <- paste0(statement, " dispensing_fee = '", dispensing_fee,"'")
    }
  }

  if (!missing(average_wholesale_price)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(average_wholesale_price)) {
      statement <- paste0(statement, " average_wholesale_price IS NULL")
    } else if (is(average_wholesale_price, "subQuery")){
      statement <- paste0(statement, " average_wholesale_price = (", as.character(average_wholesale_price), ")")
    } else {
      statement <- paste0(statement, " average_wholesale_price = '", average_wholesale_price,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_payer_plan_period <- function(fetchField, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  statement <- paste0("SELECT ", fetchField , " FROM payer_plan_period WHERE")
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, " payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, " payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }

  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, " payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      statement <- paste0(statement, " payer_source_value = (", as.character(payer_source_value), ")")
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }

  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, " plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      statement <- paste0(statement, " plan_source_value = (", as.character(plan_source_value), ")")
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }

  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, " family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      statement <- paste0(statement, " family_source_value = (", as.character(family_source_value), ")")
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_device_cost <- function(fetchField, device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  statement <- paste0("SELECT ", fetchField , " FROM device_cost WHERE")
  first <- TRUE
  if (!missing(device_cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_cost_id)) {
      statement <- paste0(statement, " device_cost_id IS NULL")
    } else if (is(device_cost_id, "subQuery")){
      statement <- paste0(statement, " device_cost_id = (", as.character(device_cost_id), ")")
    } else {
      statement <- paste0(statement, " device_cost_id = '", device_cost_id,"'")
    }
  }

  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, " device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      statement <- paste0(statement, " device_exposure_id = (", as.character(device_exposure_id), ")")
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, " currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      statement <- paste0(statement, " currency_concept_id = (", as.character(currency_concept_id), ")")
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_copay)) {
      statement <- paste0(statement, " paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      statement <- paste0(statement, " paid_copay = (", as.character(paid_copay), ")")
    } else {
      statement <- paste0(statement, " paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_coinsurance)) {
      statement <- paste0(statement, " paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      statement <- paste0(statement, " paid_coinsurance = (", as.character(paid_coinsurance), ")")
    } else {
      statement <- paste0(statement, " paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_toward_deductible)) {
      statement <- paste0(statement, " paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      statement <- paste0(statement, " paid_toward_deductible = (", as.character(paid_toward_deductible), ")")
    } else {
      statement <- paste0(statement, " paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, " paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      statement <- paste0(statement, " paid_by_payer = (", as.character(paid_by_payer), ")")
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(paid_by_coordination_benefits)) {
      statement <- paste0(statement, " paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      statement <- paste0(statement, " paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")")
    } else {
      statement <- paste0(statement, " paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_out_of_pocket)) {
      statement <- paste0(statement, " total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      statement <- paste0(statement, " total_out_of_pocket = (", as.character(total_out_of_pocket), ")")
    } else {
      statement <- paste0(statement, " total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, " total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      statement <- paste0(statement, " total_paid = (", as.character(total_paid), ")")
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, " payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      statement <- paste0(statement, " payer_plan_period_id = (", as.character(payer_plan_period_id), ")")
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_drug_era <- function(fetchField, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0("SELECT ", fetchField , " FROM drug_era WHERE")
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, " drug_era_id IS NULL")
    } else if (is(drug_era_id, "subQuery")){
      statement <- paste0(statement, " drug_era_id = (", as.character(drug_era_id), ")")
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, " drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      statement <- paste0(statement, " drug_era_start_date = (", as.character(drug_era_start_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }

  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, " drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      statement <- paste0(statement, " drug_era_end_date = (", as.character(drug_era_end_date), ")")
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }

  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, " drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      statement <- paste0(statement, " drug_exposure_count = (", as.character(drug_exposure_count), ")")
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }

  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, " gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      statement <- paste0(statement, " gap_days = (", as.character(gap_days), ")")
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_dose_era <- function(fetchField, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0("SELECT ", fetchField , " FROM dose_era WHERE")
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, " dose_era_id IS NULL")
    } else if (is(dose_era_id, "subQuery")){
      statement <- paste0(statement, " dose_era_id = (", as.character(dose_era_id), ")")
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, " drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      statement <- paste0(statement, " drug_concept_id = (", as.character(drug_concept_id), ")")
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, " unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      statement <- paste0(statement, " unit_concept_id = (", as.character(unit_concept_id), ")")
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, " dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      statement <- paste0(statement, " dose_value = (", as.character(dose_value), ")")
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }

  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, " dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      statement <- paste0(statement, " dose_era_start_date = (", as.character(dose_era_start_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }

  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, " dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      statement <- paste0(statement, " dose_era_end_date = (", as.character(dose_era_end_date), ")")
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_condition_era <- function(fetchField, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0("SELECT ", fetchField , " FROM condition_era WHERE")
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, " condition_era_id IS NULL")
    } else if (is(condition_era_id, "subQuery")){
      statement <- paste0(statement, " condition_era_id = (", as.character(condition_era_id), ")")
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, " person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      statement <- paste0(statement, " person_id = (", as.character(person_id), ")")
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, " condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      statement <- paste0(statement, " condition_concept_id = (", as.character(condition_concept_id), ")")
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, " condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      statement <- paste0(statement, " condition_era_start_date = (", as.character(condition_era_start_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }

  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, " condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      statement <- paste0(statement, " condition_era_end_date = (", as.character(condition_era_end_date), ")")
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, " condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      statement <- paste0(statement, " condition_occurrence_count = (", as.character(condition_occurrence_count), ")")
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_cdm_source <- function(fetchField, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0("SELECT ", fetchField , " FROM cdm_source WHERE")
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, " cdm_source_name IS NULL")
    } else if (is(cdm_source_name, "subQuery")){
      statement <- paste0(statement, " cdm_source_name = (", as.character(cdm_source_name), ")")
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, " cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      statement <- paste0(statement, " cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")")
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }

  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, " cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      statement <- paste0(statement, " cdm_holder = (", as.character(cdm_holder), ")")
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }

  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, " source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      statement <- paste0(statement, " source_description = (", as.character(source_description), ")")
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }

  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, " source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      statement <- paste0(statement, " source_documentation_reference = (", as.character(source_documentation_reference), ")")
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, " cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      statement <- paste0(statement, " cdm_etl_reference = (", as.character(cdm_etl_reference), ")")
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }

  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, " source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      statement <- paste0(statement, " source_release_date = (", as.character(source_release_date), ")")
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }

  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, " cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      statement <- paste0(statement, " cdm_release_date = (", as.character(cdm_release_date), ")")
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }

  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, " cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      statement <- paste0(statement, " cdm_version = (", as.character(cdm_version), ")")
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, " vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      statement <- paste0(statement, " vocabulary_version = (", as.character(vocabulary_version), ")")
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_cohort <- function(fetchField, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0("SELECT ", fetchField , " FROM cohort WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_cohort_definition <- function(fetchField, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0("SELECT ", fetchField , " FROM cohort_definition WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, " cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      statement <- paste0(statement, " cohort_definition_name = (", as.character(cohort_definition_name), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }

  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, " cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      statement <- paste0(statement, " cohort_definition_description = (", as.character(cohort_definition_description), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, " definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      statement <- paste0(statement, " definition_type_concept_id = (", as.character(definition_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, " cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      statement <- paste0(statement, " cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }

  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, " subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      statement <- paste0(statement, " subject_concept_id = (", as.character(subject_concept_id), ")")
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, " cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      statement <- paste0(statement, " cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")")
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_cohort_attribute <- function(fetchField, cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0("SELECT ", fetchField , " FROM cohort_attribute WHERE")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, " cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      statement <- paste0(statement, " cohort_definition_id = (", as.character(cohort_definition_id), ")")
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, " cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      statement <- paste0(statement, " cohort_start_date = (", as.character(cohort_start_date), ")")
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, " cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      statement <- paste0(statement, " cohort_end_date = (", as.character(cohort_end_date), ")")
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, " subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      statement <- paste0(statement, " subject_id = (", as.character(subject_id), ")")
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }

  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, " value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      statement <- paste0(statement, " value_as_number = (", as.character(value_as_number), ")")
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, " value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      statement <- paste0(statement, " value_as_concept_id = (", as.character(value_as_concept_id), ")")
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

lookup_attribute_definition <- function(fetchField, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0("SELECT ", fetchField , " FROM attribute_definition WHERE")
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, " attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      statement <- paste0(statement, " attribute_definition_id = (", as.character(attribute_definition_id), ")")
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, " attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      statement <- paste0(statement, " attribute_name = (", as.character(attribute_name), ")")
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }

  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, " attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      statement <- paste0(statement, " attribute_description = (", as.character(attribute_description), ")")
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, " attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      statement <- paste0(statement, " attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")")
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }

  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, " attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      statement <- paste0(statement, " attribute_syntax = (", as.character(attribute_syntax), ")")
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }

  class(statement) <- "subQuery"
  return(statement)
}

