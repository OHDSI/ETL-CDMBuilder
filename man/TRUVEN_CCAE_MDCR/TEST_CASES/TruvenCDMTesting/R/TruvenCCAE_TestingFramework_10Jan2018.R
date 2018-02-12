initFramework <- function() {
  frameworkContext <- new.env(parent = globalenv())
  assign('frameworkContext', frameworkContext, envir = globalenv())
  frameworkContext$inserts <- list()
  frameworkContext$expects <- list()
  frameworkContext$testId <- -1
  frameworkContext$testDescription <- ""
  frameworkContext$groupIndex <- 0;
  frameworkContext$defaultValues <- new.env(parent = frameworkContext)

  defaults <- list()
  defaults$flag <- '0'
  defaults$age <- '60'
  defaults$agegrp <- '5'
  defaults$awp <- '0.0'
  defaults$cap_svc <- 'N'
  defaults$cob <- '0.0'
  defaults$coins <- '0.0'
  defaults$copay <- '0.0'
  defaults$datatyp <- '1'
  defaults$dawind <- '01'
  defaults$daysupp <- '30'
  defaults$deaclas <- '6'
  defaults$deduct <- '0.0'
  defaults$dispfee <- '0.0'
  defaults$dobyr <- '1954'
  defaults$eeclass <- '9'
  defaults$eestatu <- '1'
  defaults$egeoloc <- '49'
  defaults$eidflag <- '1'
  defaults$emprel <- '1'
  defaults$enrflag <- '1'
  defaults$genind <- '4'
  defaults$hlthplan <- '0'
  defaults$indstry <- ' '
  defaults$ingcost <- '0.0'
  defaults$maintin <- '1'
  defaults$metqty <- '30.0'
  defaults$mhsacovg <- '1'
  defaults$msa <- '0'
  defaults$ndcnum <- '00406035705'
  defaults$netpay <- '0.0'
  defaults$ntwkprov <- 'Y'
  defaults$paidntwk <- 'Y'
  defaults$pay <- '0.0'
  defaults$phyflag <- '1'
  defaults$plantyp <- '6'
  defaults$qty <- '1'
  defaults$refill <- '0'
  defaults$region <- '3'
  defaults$rxmr <- '1'
  defaults$saletax <- '0.0'
  defaults$sex <- '2'
  defaults$svcdate <- '2011-02-07'
  defaults$thercls <- '69'
  defaults$thergrp <- '08'
  defaults$version <- '10'
  defaults$year <- '2011'
  assign('drug_claims', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$flag <- '0'
  defaults$age <- '49'
  defaults$agegrp <- '1'
  defaults$datatyp <- '1'
  defaults$dobyr <- '1957'
  defaults$dtend <- '2012-03-31'
  defaults$dtstart <- '2012-03-01'
  defaults$eeclass <- '9'
  defaults$eestatu <- '1'
  defaults$egeoloc <- '62'
  defaults$emprel <- '1'
  defaults$hlthplan <- '0'
  defaults$indstry <- ' '
  defaults$memdays <- '31'
  defaults$mhsacovg <- '1'
  defaults$msa <- '0'
  defaults$phyflag <- '1'
  defaults$plantyp <- '6'
  defaults$region <- '3'
  defaults$rx <- '1'
  defaults$sex <- '2'
  defaults$version <- '10'
  defaults$year <- '2012'
  assign('enrollment_detail', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$flag <- '0'
  defaults$age <- '0'
  defaults$agegrp <- '2'
  defaults$dattyp1 <- '1'
  defaults$dattyp10 <- '1'
  defaults$dattyp11 <- '1'
  defaults$dattyp12 <- '1'
  defaults$dattyp2 <- '1'
  defaults$dattyp3 <- '1'
  defaults$dattyp4 <- '1'
  defaults$dattyp5 <- '1'
  defaults$dattyp6 <- '1'
  defaults$dattyp7 <- '1'
  defaults$dattyp8 <- '1'
  defaults$dattyp9 <- '1'
  defaults$dobyr <- '1959'
  defaults$eeclass <- '9'
  defaults$eestatu <- '9'
  defaults$egeoloc <- '62'
  defaults$emprel <- '1'
  defaults$enrind1 <- '1'
  defaults$enrind10 <- '1'
  defaults$enrind11 <- '1'
  defaults$enrind12 <- '1'
  defaults$enrind2 <- '1'
  defaults$enrind3 <- '1'
  defaults$enrind4 <- '1'
  defaults$enrind5 <- '1'
  defaults$enrind6 <- '1'
  defaults$enrind7 <- '1'
  defaults$enrind8 <- '1'
  defaults$enrind9 <- '1'
  defaults$enrmon <- '12'
  defaults$hlthplan <- '1'
  defaults$indstry <- ' '
  defaults$memday1 <- '31'
  defaults$memday10 <- '31'
  defaults$memday11 <- '30'
  defaults$memday12 <- '31'
  defaults$memday2 <- '28'
  defaults$memday3 <- '31'
  defaults$memday4 <- '30'
  defaults$memday5 <- '31'
  defaults$memday6 <- '30'
  defaults$memday7 <- '31'
  defaults$memday8 <- '31'
  defaults$memday9 <- '30'
  defaults$memdays <- '365'
  defaults$mhsacovg <- '1'
  defaults$msa <- '0'
  defaults$phyflag <- '1'
  defaults$plntyp1 <- '6'
  defaults$plntyp10 <- '6'
  defaults$plntyp11 <- '6'
  defaults$plntyp12 <- '6'
  defaults$plntyp2 <- '6'
  defaults$plntyp3 <- '6'
  defaults$plntyp4 <- '6'
  defaults$plntyp5 <- '6'
  defaults$plntyp6 <- '6'
  defaults$plntyp7 <- '6'
  defaults$plntyp8 <- '6'
  defaults$plntyp9 <- '6'
  defaults$region <- '3'
  defaults$rx <- '1'
  defaults$sex <- '2'
  defaults$version <- '10'
  defaults$year <- '2012'
  assign('enrollment_summary', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$flag <- '0'
  defaults$age <- '61'
  defaults$agegrp <- '5'
  defaults$billtyp <- '131'
  defaults$cap_svc <- 'N'
  defaults$cob <- '0.0'
  defaults$coins <- '0.0'
  defaults$copay <- '0.0'
  defaults$datatyp <- '1'
  defaults$deduct <- '0.0'
  defaults$dobyr <- '1954'
  defaults$dstatus <- '01'
  defaults$dx1 <- '5856   '
  defaults$dx2 <- '       '
  defaults$dx3 <- '       '
  defaults$dx4 <- '       '
  defaults$dx5 <- '       '
  defaults$dx6 <- '       '
  defaults$dx7 <- '       '
  defaults$dx8 <- 'v5869'
  defaults$dx9 <- 'v5869'
  defaults$dxver <- ' '
  defaults$eeclass <- '9'
  defaults$eestatu <- '9'
  defaults$egeoloc <- '49'
  defaults$eidflag <- '1'
  defaults$emprel <- '1'
  defaults$enrflag <- '1'
  defaults$hlthplan <- '1'
  defaults$indstry <- ' '
  defaults$mdc <- '23'
  defaults$mhsacovg <- '1'
  defaults$msa <- '0'
  defaults$netpay <- '0.0'
  defaults$ntwkprov <- 'Y'
  defaults$paidntwk <- 'Y'
  defaults$phyflag <- '1'
  defaults$plantyp <- '6'
  defaults$proc1 <- '       '
  defaults$proc2 <- '7309'
  defaults$proc3 <- '8856'
  defaults$proc4 <- '9904'
  defaults$proc5 <- '8853'
  defaults$proc6 <- '       '
  defaults$region <- '3'
  defaults$rx <- '1'
  defaults$sex <- '2'
  defaults$stdplac <- '22'
  defaults$stdprov <- '1'
  defaults$svcdate <- '2012-04-02'
  defaults$tsvcdat <- '2014-01-31'
  defaults$version <- '10'
  defaults$year <- '2012'
  assign('facility_header', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$flag <- '0'
  defaults$alc_amt <- '-'
  defaults$alcdyamt <- ' '
  defaults$alcweek <- '9'
  defaults$cc_allergy <- '-'
  defaults$cc_arthritis <- '-'
  defaults$cc_asthma <- '-'
  defaults$cc_backpain <- '-'
  defaults$cc_chf <- '-'
  defaults$cc_depress <- '9'
  defaults$cc_diab <- '-'
  defaults$cc_heartdis <- '-'
  defaults$cc_highbp <- '-'
  defaults$cc_highcol <- '-'
  defaults$cc_hrtburn <- '-'
  defaults$cc_lungdis <- '-'
  defaults$cc_migraine <- '-'
  defaults$cc_nonskincan <- '-'
  defaults$cc_osteopo <- '-'
  defaults$cc_skincan <- '-'
  defaults$cgramt <- ' '
  defaults$cgrcurr <- '-'
  defaults$cgrdur <- ' '
  defaults$cgrprev <- '-'
  defaults$cgrquit <- ' '
  defaults$cgtamt <- '9'
  defaults$cgtcurr <- '0'
  defaults$cgtdur <- '9'
  defaults$cgtpkamt <- '9'
  defaults$cgtprev <- '0'
  defaults$cgtqtcat <- '-'
  defaults$cgtquit <- '9'
  defaults$chewamt <- ' '
  defaults$chewcurr <- '-'
  defaults$chewdur <- ' '
  defaults$chewprev <- '-'
  defaults$chewquit <- ' '
  defaults$copestrs <- '9'
  defaults$dietfrt <- '-'
  defaults$dietfrvg <- '-'
  defaults$dietveg <- '-'
  defaults$dobyr <- '1961'
  defaults$drnkdrv <- '9'
  defaults$educ_lvl <- '-'
  defaults$exermo <- '-'
  defaults$famabscat12 <- '9'
  defaults$fireext <- '-'
  defaults$flu_shot <- '-'
  defaults$hlthplan <- ' '
  defaults$hltimpct <- '-'
  defaults$job_sat <- '-'
  defaults$life_sat <- '-'
  defaults$liftwgt <- '-'
  defaults$mh_freq <- '9'
  defaults$mh_prob <- '9'
  defaults$pipeamt <- ' '
  defaults$pipecurr <- '-'
  defaults$pipedur <- ' '
  defaults$pipeprev <- '-'
  defaults$pipequit <- ' '
  defaults$planalc <- '9'
  defaults$plandiet <- '9'
  defaults$plandrad <- '-'
  defaults$planexer <- '9'
  defaults$planslp <- ' '
  defaults$planstrs <- '9'
  defaults$plantob <- '9'
  defaults$planwgt <- '9'
  defaults$prev_mammo <- '-'
  defaults$prev_paptest <- '-'
  defaults$prev_prostex <- '-'
  defaults$prev_sigmoid <- '-'
  defaults$prodabscat <- '9'
  defaults$risk_alc <- '0'
  defaults$risk_bp <- '-'
  defaults$risk_chol <- '-'
  defaults$risk_exer <- '-'
  defaults$risk_gluc <- '9'
  defaults$risk_mh <- '-'
  defaults$risk_nutr <- '1'
  defaults$risk_safe <- '-'
  defaults$risk_sleep <- '-'
  defaults$risk_smok <- '0'
  defaults$risk_wgt <- '-'
  defaults$seatbelt <- '1'
  defaults$selfhlth <- '-'
  defaults$sex <- '2'
  defaults$sleep_hr <- ' '
  defaults$slpapnea <- '-'
  defaults$slpprob <- '-'
  defaults$smkdetect <- ' '
  defaults$stretch <- '-'
  defaults$survdate <- '2013-09-01'
  defaults$tobcurr <- '0'
  defaults$tobprev <- '9'
  defaults$version <- '1.0'
  defaults$wrkabscat <- '-'
  defaults$wrkabscat12 <- '9'
  defaults$year <- '2014'
  assign('health_risk_assessment', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$question_type_id <- '25'
  defaults$category_value <- '1'
  defaults$category_name <- 'Question not asked'
  assign('hra_question_ref', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$question_type_id <- '4.0'
  assign('hra_variable_ref', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$flag <- '0'
  defaults$admdate <- '2011-06-14'
  defaults$admtyp <- '2'
  defaults$age <- '0'
  defaults$agegrp <- '5'
  defaults$datatyp <- '1'
  defaults$days <- '2'
  defaults$disdate <- '2011-12-23'
  defaults$dobyr <- '1952'
  defaults$drg <- '775'
  defaults$dstatus <- '01'
  defaults$dx1 <- 'V3000  '
  defaults$dx10 <- '       '
  defaults$dx11 <- '       '
  defaults$dx12 <- '       '
  defaults$dx13 <- '       '
  defaults$dx14 <- '       '
  defaults$dx15 <- '       '
  defaults$dx2 <- '       '
  defaults$dx3 <- '       '
  defaults$dx4 <- '       '
  defaults$dx5 <- '       '
  defaults$dx6 <- '       '
  defaults$dx7 <- '       '
  defaults$dx8 <- '       '
  defaults$dx9 <- '       '
  defaults$dxver <- ' '
  defaults$eeclass <- '9'
  defaults$eestatu <- '9'
  defaults$egeoloc <- '49'
  defaults$eidflag <- '1'
  defaults$emprel <- '1'
  defaults$enrflag <- '1'
  defaults$hlthplan <- '0'
  defaults$hospnet <- '0.0'
  defaults$hosppay <- '0.0'
  defaults$indstry <- ' '
  defaults$mdc <- '14'
  defaults$mhsacovg <- '1'
  defaults$msa <- '0'
  defaults$pdx <- 'V3000  '
  defaults$phyflag <- '1'
  defaults$physnet <- '0.0'
  defaults$physpay <- '0.0'
  defaults$plantyp <- '6'
  defaults$pproc <- '       '
  defaults$proc1 <- '       '
  defaults$proc10 <- '       '
  defaults$proc11 <- '       '
  defaults$proc12 <- '       '
  defaults$proc13 <- '       '
  defaults$proc14 <- '       '
  defaults$proc15 <- '       '
  defaults$proc2 <- '71010  '
  defaults$proc3 <- '       '
  defaults$proc4 <- '       '
  defaults$proc5 <- '       '
  defaults$proc6 <- '       '
  defaults$proc7 <- '       '
  defaults$proc8 <- '       '
  defaults$proc9 <- '       '
  defaults$region <- '3'
  defaults$rx <- '1'
  defaults$sex <- '2'
  defaults$state <- '49'
  defaults$totcob <- '0.0'
  defaults$totcoins <- '0.0'
  defaults$totcopay <- '0.0'
  defaults$totded <- '0.0'
  defaults$totnet <- '0.0'
  defaults$totpay <- '0.0'
  defaults$version <- '10'
  defaults$year <- '2011'
  assign('inpatient_admissions', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$flag <- '0'
  defaults$admdate <- '2012-03-06'
  defaults$admtyp <- '1'
  defaults$age <- '0'
  defaults$agegrp <- '5'
  defaults$cap_svc <- 'N'
  defaults$cob <- '0.0'
  defaults$coins <- '0.0'
  defaults$copay <- '0.0'
  defaults$datatyp <- '1'
  defaults$deduct <- '0.0'
  defaults$disdate <- '2011-06-03'
  defaults$dobyr <- '1952'
  defaults$drg <- '775'
  defaults$dstatus <- '01'
  defaults$dx1 <- 'V3000  '
  defaults$dx2 <- '       '
  defaults$dx3 <- '       '
  defaults$dx4 <- '       '
  defaults$dx5 <- '       '
  defaults$dxver <- ' '
  defaults$eeclass <- '9'
  defaults$eestatu <- '9'
  defaults$egeoloc <- '49'
  defaults$eidflag <- '1'
  defaults$emprel <- '1'
  defaults$enrflag <- '1'
  defaults$facprof <- 'F'
  defaults$hlthplan <- '1'
  defaults$indstry <- ' '
  defaults$mdc <- '05'
  defaults$mhsacovg <- '1'
  defaults$msa <- '0'
  defaults$netpay <- '0.0'
  defaults$ntwkprov <- 'Y'
  defaults$paidntwk <- 'Y'
  defaults$pay <- '0.0'
  defaults$pddate <- '2010-04-30'
  defaults$pdx <- 'V3000  '
  defaults$phyflag <- '1'
  defaults$plantyp <- '6'
  defaults$pproc <- '       '
  defaults$proc1 <- '       '
  defaults$procmod <- '  '
  defaults$proctyp <- ' '
  defaults$qty <- '1'
  defaults$region <- '3'
  defaults$revcode <- '    '
  defaults$rx <- '1'
  defaults$sex <- '2'
  defaults$stdplac <- '21'
  defaults$stdprov <- '1'
  defaults$svcdate <- '2012-06-04'
  defaults$svcscat <- '     '
  defaults$tsvcdat <- '2012-08-30'
  defaults$version <- '10'
  defaults$year <- '2012'
  assign('inpatient_services', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$enrolid <- '32003457501'
  defaults$abnormal <- 'N'
  defaults$agegrp <- '5'
  defaults$eeclass <- '9'
  defaults$eestatu <- '9'
  defaults$eidflag <- '1'
  defaults$emprel <- '1'
  defaults$enrflag <- '1'
  defaults$hlthplan <- '1'
  defaults$indstry <- ' '
  defaults$mhsacovg <- '1'
  defaults$phyflag <- '1'
  defaults$proctyp <- '1'
  defaults$region <- '3'
  defaults$rx <- '1'
  defaults$sex <- '2'
  defaults$egeoloc <- '49'
  defaults$mdc <- '00'
  defaults$version <- '10'
  defaults$resltcat <- '   '
  defaults$dx1 <- '       '
  defaults$proc1 <- '       '
  defaults$svcdate <- '2012-02-03'
  defaults$msa <- '35644'
  defaults$orderid <- '6960'
  defaults$refhigh <- '0.0'
  defaults$reflow <- '0.0'
  defaults$result <- '0.0'
  defaults$testcnt <- '1'
  defaults$dobyr <- '1952'
  defaults$stdprov <- '930'
  defaults$year <- '2012'
  defaults$age <- '58'
  defaults$datatyp <- '1'
  defaults$plantyp <- '6'
  defaults$stdplac <- '81'
  defaults$dxver <- ' '
  assign('lab', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$flag <- '0'
  defaults$age <- '58'
  defaults$agegrp <- '5'
  defaults$cap_svc <- 'N'
  defaults$cob <- '0.0'
  defaults$coins <- '0.0'
  defaults$copay <- '0.0'
  defaults$datatyp <- '1'
  defaults$deduct <- '0.0'
  defaults$dobyr <- '1954'
  defaults$dx1 <- 'V202   '
  defaults$dx2 <- '       '
  defaults$dx3 <- '       '
  defaults$dx4 <- '       '
  defaults$dx5 <- '       '
  defaults$dxver <- ' '
  defaults$eeclass <- '9'
  defaults$eestatu <- '1'
  defaults$egeoloc <- '49'
  defaults$eidflag <- '1'
  defaults$emprel <- '1'
  defaults$enrflag <- '1'
  defaults$facprof <- 'P'
  defaults$hlthplan <- '0'
  defaults$indstry <- ' '
  defaults$mdc <- '23'
  defaults$mhsacovg <- '1'
  defaults$msa <- '0'
  defaults$netpay <- '0.0'
  defaults$ntwkprov <- 'Y'
  defaults$paidntwk <- 'Y'
  defaults$pay <- '0.0'
  defaults$pddate <- '2014-01-31'
  defaults$phyflag <- '1'
  defaults$plantyp <- '6'
  defaults$proc1 <- '       '
  defaults$procgrp <- '104'
  defaults$procmod <- '  '
  defaults$proctyp <- '1'
  defaults$qty <- '1'
  defaults$region <- '3'
  defaults$revcode <- '    '
  defaults$rx <- '1'
  defaults$sex <- '2'
  defaults$stdplac <- '11'
  defaults$stdprov <- '1'
  defaults$svcdate <- '2012-05-14'
  defaults$svcscat <- '40151'
  defaults$version <- '10'
  defaults$year <- '2012'
  assign('outpatient_services', defaults, envir = frameworkContext$defaultValues)
}

initFramework()

set_defaults_drug_claims <- function(flag, age, agegrp, awp, cap_svc, cob, coins, copay, datatyp, dawind, daysupp, deaclas, deduct, dispfee, dobyr, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, generid, genind, hlthplan, indstry, ingcost, maintin, metqty, mhsacovg, msa, ndcnum, netpay, ntwkprov, paidntwk, pay, pddate, pharmid, phyflag, plankey, plantyp, qty, refill, region, rxmr, saletax, seqnum, sex, svcdate, thercls, thergrp, version, wgtkey, year, gpi) {
  defaults <- get('drug_claims', envir = frameworkContext$defaultValues)
  if (!missing(flag)) {
    defaults$flag <- flag
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(awp)) {
    defaults$awp <- awp
  }
  if (!missing(cap_svc)) {
    defaults$cap_svc <- cap_svc
  }
  if (!missing(cob)) {
    defaults$cob <- cob
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(dawind)) {
    defaults$dawind <- dawind
  }
  if (!missing(daysupp)) {
    defaults$daysupp <- daysupp
  }
  if (!missing(deaclas)) {
    defaults$deaclas <- deaclas
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(dispfee)) {
    defaults$dispfee <- dispfee
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(generid)) {
    defaults$generid <- generid
  }
  if (!missing(genind)) {
    defaults$genind <- genind
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(ingcost)) {
    defaults$ingcost <- ingcost
  }
  if (!missing(maintin)) {
    defaults$maintin <- maintin
  }
  if (!missing(metqty)) {
    defaults$metqty <- metqty
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(ndcnum)) {
    defaults$ndcnum <- ndcnum
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
  }
  if (!missing(ntwkprov)) {
    defaults$ntwkprov <- ntwkprov
  }
  if (!missing(paidntwk)) {
    defaults$paidntwk <- paidntwk
  }
  if (!missing(pay)) {
    defaults$pay <- pay
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
  }
  if (!missing(pharmid)) {
    defaults$pharmid <- pharmid
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(refill)) {
    defaults$refill <- refill
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rxmr)) {
    defaults$rxmr <- rxmr
  }
  if (!missing(saletax)) {
    defaults$saletax <- saletax
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(svcdate)) {
    defaults$svcdate <- svcdate
  }
  if (!missing(thercls)) {
    defaults$thercls <- thercls
  }
  if (!missing(thergrp)) {
    defaults$thergrp <- thergrp
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(gpi)) {
    defaults$gpi <- gpi
  }
  assign('drug_claims', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_enrollment_detail <- function(flag, age, agegrp, datatyp, dobyr, dtend, dtstart, eeclass, eestatu, efamid, egeoloc, emprel, enrolid, hlthplan, indstry, memdays, mhsacovg, msa, phyflag, plankey, plantyp, region, rx, seqnum, sex, version, wgtkey, year) {
  defaults <- get('enrollment_detail', envir = frameworkContext$defaultValues)
  if (!missing(flag)) {
    defaults$flag <- flag
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(dtend)) {
    defaults$dtend <- dtend
  }
  if (!missing(dtstart)) {
    defaults$dtstart <- dtstart
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(memdays)) {
    defaults$memdays <- memdays
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  assign('enrollment_detail', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_enrollment_summary <- function(flag, age, agegrp, dattyp1, dattyp10, dattyp11, dattyp12, dattyp2, dattyp3, dattyp4, dattyp5, dattyp6, dattyp7, dattyp8, dattyp9, dobyr, eeclass, eestatu, efamid, egeoloc, emprel, enrind1, enrind10, enrind11, enrind12, enrind2, enrind3, enrind4, enrind5, enrind6, enrind7, enrind8, enrind9, enrmon, enrolid, hlthplan, indstry, memday1, memday10, memday11, memday12, memday2, memday3, memday4, memday5, memday6, memday7, memday8, memday9, memdays, mhsacovg, msa, phyflag, plnkey1, plnkey10, plnkey11, plnkey12, plnkey2, plnkey3, plnkey4, plnkey5, plnkey6, plnkey7, plnkey8, plnkey9, plntyp1, plntyp10, plntyp11, plntyp12, plntyp2, plntyp3, plntyp4, plntyp5, plntyp6, plntyp7, plntyp8, plntyp9, region, rx, seqnum, sex, version, wgtkey, year, mswgtkey) {
  defaults <- get('enrollment_summary', envir = frameworkContext$defaultValues)
  if (!missing(flag)) {
    defaults$flag <- flag
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(dattyp1)) {
    defaults$dattyp1 <- dattyp1
  }
  if (!missing(dattyp10)) {
    defaults$dattyp10 <- dattyp10
  }
  if (!missing(dattyp11)) {
    defaults$dattyp11 <- dattyp11
  }
  if (!missing(dattyp12)) {
    defaults$dattyp12 <- dattyp12
  }
  if (!missing(dattyp2)) {
    defaults$dattyp2 <- dattyp2
  }
  if (!missing(dattyp3)) {
    defaults$dattyp3 <- dattyp3
  }
  if (!missing(dattyp4)) {
    defaults$dattyp4 <- dattyp4
  }
  if (!missing(dattyp5)) {
    defaults$dattyp5 <- dattyp5
  }
  if (!missing(dattyp6)) {
    defaults$dattyp6 <- dattyp6
  }
  if (!missing(dattyp7)) {
    defaults$dattyp7 <- dattyp7
  }
  if (!missing(dattyp8)) {
    defaults$dattyp8 <- dattyp8
  }
  if (!missing(dattyp9)) {
    defaults$dattyp9 <- dattyp9
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrind1)) {
    defaults$enrind1 <- enrind1
  }
  if (!missing(enrind10)) {
    defaults$enrind10 <- enrind10
  }
  if (!missing(enrind11)) {
    defaults$enrind11 <- enrind11
  }
  if (!missing(enrind12)) {
    defaults$enrind12 <- enrind12
  }
  if (!missing(enrind2)) {
    defaults$enrind2 <- enrind2
  }
  if (!missing(enrind3)) {
    defaults$enrind3 <- enrind3
  }
  if (!missing(enrind4)) {
    defaults$enrind4 <- enrind4
  }
  if (!missing(enrind5)) {
    defaults$enrind5 <- enrind5
  }
  if (!missing(enrind6)) {
    defaults$enrind6 <- enrind6
  }
  if (!missing(enrind7)) {
    defaults$enrind7 <- enrind7
  }
  if (!missing(enrind8)) {
    defaults$enrind8 <- enrind8
  }
  if (!missing(enrind9)) {
    defaults$enrind9 <- enrind9
  }
  if (!missing(enrmon)) {
    defaults$enrmon <- enrmon
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(memday1)) {
    defaults$memday1 <- memday1
  }
  if (!missing(memday10)) {
    defaults$memday10 <- memday10
  }
  if (!missing(memday11)) {
    defaults$memday11 <- memday11
  }
  if (!missing(memday12)) {
    defaults$memday12 <- memday12
  }
  if (!missing(memday2)) {
    defaults$memday2 <- memday2
  }
  if (!missing(memday3)) {
    defaults$memday3 <- memday3
  }
  if (!missing(memday4)) {
    defaults$memday4 <- memday4
  }
  if (!missing(memday5)) {
    defaults$memday5 <- memday5
  }
  if (!missing(memday6)) {
    defaults$memday6 <- memday6
  }
  if (!missing(memday7)) {
    defaults$memday7 <- memday7
  }
  if (!missing(memday8)) {
    defaults$memday8 <- memday8
  }
  if (!missing(memday9)) {
    defaults$memday9 <- memday9
  }
  if (!missing(memdays)) {
    defaults$memdays <- memdays
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plnkey1)) {
    defaults$plnkey1 <- plnkey1
  }
  if (!missing(plnkey10)) {
    defaults$plnkey10 <- plnkey10
  }
  if (!missing(plnkey11)) {
    defaults$plnkey11 <- plnkey11
  }
  if (!missing(plnkey12)) {
    defaults$plnkey12 <- plnkey12
  }
  if (!missing(plnkey2)) {
    defaults$plnkey2 <- plnkey2
  }
  if (!missing(plnkey3)) {
    defaults$plnkey3 <- plnkey3
  }
  if (!missing(plnkey4)) {
    defaults$plnkey4 <- plnkey4
  }
  if (!missing(plnkey5)) {
    defaults$plnkey5 <- plnkey5
  }
  if (!missing(plnkey6)) {
    defaults$plnkey6 <- plnkey6
  }
  if (!missing(plnkey7)) {
    defaults$plnkey7 <- plnkey7
  }
  if (!missing(plnkey8)) {
    defaults$plnkey8 <- plnkey8
  }
  if (!missing(plnkey9)) {
    defaults$plnkey9 <- plnkey9
  }
  if (!missing(plntyp1)) {
    defaults$plntyp1 <- plntyp1
  }
  if (!missing(plntyp10)) {
    defaults$plntyp10 <- plntyp10
  }
  if (!missing(plntyp11)) {
    defaults$plntyp11 <- plntyp11
  }
  if (!missing(plntyp12)) {
    defaults$plntyp12 <- plntyp12
  }
  if (!missing(plntyp2)) {
    defaults$plntyp2 <- plntyp2
  }
  if (!missing(plntyp3)) {
    defaults$plntyp3 <- plntyp3
  }
  if (!missing(plntyp4)) {
    defaults$plntyp4 <- plntyp4
  }
  if (!missing(plntyp5)) {
    defaults$plntyp5 <- plntyp5
  }
  if (!missing(plntyp6)) {
    defaults$plntyp6 <- plntyp6
  }
  if (!missing(plntyp7)) {
    defaults$plntyp7 <- plntyp7
  }
  if (!missing(plntyp8)) {
    defaults$plntyp8 <- plntyp8
  }
  if (!missing(plntyp9)) {
    defaults$plntyp9 <- plntyp9
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(mswgtkey)) {
    defaults$mswgtkey <- mswgtkey
  }
  assign('enrollment_summary', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_facility_header <- function(flag, age, agegrp, billtyp, cap_svc, caseid, cob, coins, copay, datatyp, deduct, dobyr, dstatus, dx1, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pddate, phyflag, plankey, plantyp, poadx1, poadx2, poadx3, poadx4, poadx5, poadx6, poadx7, poadx8, poadx9, proc1, proc2, proc3, proc4, proc5, proc6, provid, region, rx, seqnum, sex, stdplac, stdprov, svcdate, tsvcdat, version, wgtkey, year, msclmid, npi) {
  defaults <- get('facility_header', envir = frameworkContext$defaultValues)
  if (!missing(flag)) {
    defaults$flag <- flag
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(billtyp)) {
    defaults$billtyp <- billtyp
  }
  if (!missing(cap_svc)) {
    defaults$cap_svc <- cap_svc
  }
  if (!missing(caseid)) {
    defaults$caseid <- caseid
  }
  if (!missing(cob)) {
    defaults$cob <- cob
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(dstatus)) {
    defaults$dstatus <- dstatus
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
  if (!missing(dxver)) {
    defaults$dxver <- dxver
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(fachdid)) {
    defaults$fachdid <- fachdid
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
  }
  if (!missing(ntwkprov)) {
    defaults$ntwkprov <- ntwkprov
  }
  if (!missing(paidntwk)) {
    defaults$paidntwk <- paidntwk
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(poadx1)) {
    defaults$poadx1 <- poadx1
  }
  if (!missing(poadx2)) {
    defaults$poadx2 <- poadx2
  }
  if (!missing(poadx3)) {
    defaults$poadx3 <- poadx3
  }
  if (!missing(poadx4)) {
    defaults$poadx4 <- poadx4
  }
  if (!missing(poadx5)) {
    defaults$poadx5 <- poadx5
  }
  if (!missing(poadx6)) {
    defaults$poadx6 <- poadx6
  }
  if (!missing(poadx7)) {
    defaults$poadx7 <- poadx7
  }
  if (!missing(poadx8)) {
    defaults$poadx8 <- poadx8
  }
  if (!missing(poadx9)) {
    defaults$poadx9 <- poadx9
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(proc2)) {
    defaults$proc2 <- proc2
  }
  if (!missing(proc3)) {
    defaults$proc3 <- proc3
  }
  if (!missing(proc4)) {
    defaults$proc4 <- proc4
  }
  if (!missing(proc5)) {
    defaults$proc5 <- proc5
  }
  if (!missing(proc6)) {
    defaults$proc6 <- proc6
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(stdplac)) {
    defaults$stdplac <- stdplac
  }
  if (!missing(stdprov)) {
    defaults$stdprov <- stdprov
  }
  if (!missing(svcdate)) {
    defaults$svcdate <- svcdate
  }
  if (!missing(tsvcdat)) {
    defaults$tsvcdat <- tsvcdat
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(msclmid)) {
    defaults$msclmid <- msclmid
  }
  if (!missing(npi)) {
    defaults$npi <- npi
  }
  assign('facility_header', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_health_risk_assessment <- function(flag, alc_amt, alcdyamt, alcweek, bmi, cc_allergy, cc_arthritis, cc_asthma, cc_backpain, cc_chf, cc_depress, cc_diab, cc_heartdis, cc_highbp, cc_highcol, cc_hrtburn, cc_lungdis, cc_migraine, cc_nonskincan, cc_osteopo, cc_skincan, cgramt, cgrcurr, cgrdur, cgrprev, cgrqtyr, cgrquit, cgtamt, cgtcurr, cgtdur, cgtpkamt, cgtprev, cgtqtcat, cgtqtyr, cgtquit, chewamt, chewcurr, chewdur, chewprev, chewqtyr, chewquit, cholestr, copestrs, diast_bp, dietfrt, dietfrvg, dietveg, dobyr, drnkdrv, educ_lvl, efamid, enrolid, exermo, exerweek, famabscat12, fireext, flu_shot, glucose, hdl, height, hlthplan, hltimpct, job_sat, ldl, life_sat, liftwgt, mh_freq, mh_prob, pipeamt, pipecurr, pipedur, pipeprev, pipeqtyr, pipequit, planalc, plandiet, plandrad, planexer, planslp, planstrs, plantob, planwgt, prev_mammo, prev_paptest, prev_prostex, prev_sigmoid, prodabscat, risk_alc, risk_bp, risk_chol, risk_exer, risk_gluc, risk_mh, risk_nutr, risk_safe, risk_sleep, risk_smok, risk_wgt, seatbelt, selfhlth, seqnum, sex, sleep_hr, slpapnea, slpprob, smkdetect, stretch, survdate, systo_bp, tobcurr, tobprev, triglycd, version, weight, workabs, wrkabscat, wrkabscat12, year) {
  defaults <- get('health_risk_assessment', envir = frameworkContext$defaultValues)
  if (!missing(flag)) {
    defaults$flag <- flag
  }
  if (!missing(alc_amt)) {
    defaults$alc_amt <- alc_amt
  }
  if (!missing(alcdyamt)) {
    defaults$alcdyamt <- alcdyamt
  }
  if (!missing(alcweek)) {
    defaults$alcweek <- alcweek
  }
  if (!missing(bmi)) {
    defaults$bmi <- bmi
  }
  if (!missing(cc_allergy)) {
    defaults$cc_allergy <- cc_allergy
  }
  if (!missing(cc_arthritis)) {
    defaults$cc_arthritis <- cc_arthritis
  }
  if (!missing(cc_asthma)) {
    defaults$cc_asthma <- cc_asthma
  }
  if (!missing(cc_backpain)) {
    defaults$cc_backpain <- cc_backpain
  }
  if (!missing(cc_chf)) {
    defaults$cc_chf <- cc_chf
  }
  if (!missing(cc_depress)) {
    defaults$cc_depress <- cc_depress
  }
  if (!missing(cc_diab)) {
    defaults$cc_diab <- cc_diab
  }
  if (!missing(cc_heartdis)) {
    defaults$cc_heartdis <- cc_heartdis
  }
  if (!missing(cc_highbp)) {
    defaults$cc_highbp <- cc_highbp
  }
  if (!missing(cc_highcol)) {
    defaults$cc_highcol <- cc_highcol
  }
  if (!missing(cc_hrtburn)) {
    defaults$cc_hrtburn <- cc_hrtburn
  }
  if (!missing(cc_lungdis)) {
    defaults$cc_lungdis <- cc_lungdis
  }
  if (!missing(cc_migraine)) {
    defaults$cc_migraine <- cc_migraine
  }
  if (!missing(cc_nonskincan)) {
    defaults$cc_nonskincan <- cc_nonskincan
  }
  if (!missing(cc_osteopo)) {
    defaults$cc_osteopo <- cc_osteopo
  }
  if (!missing(cc_skincan)) {
    defaults$cc_skincan <- cc_skincan
  }
  if (!missing(cgramt)) {
    defaults$cgramt <- cgramt
  }
  if (!missing(cgrcurr)) {
    defaults$cgrcurr <- cgrcurr
  }
  if (!missing(cgrdur)) {
    defaults$cgrdur <- cgrdur
  }
  if (!missing(cgrprev)) {
    defaults$cgrprev <- cgrprev
  }
  if (!missing(cgrqtyr)) {
    defaults$cgrqtyr <- cgrqtyr
  }
  if (!missing(cgrquit)) {
    defaults$cgrquit <- cgrquit
  }
  if (!missing(cgtamt)) {
    defaults$cgtamt <- cgtamt
  }
  if (!missing(cgtcurr)) {
    defaults$cgtcurr <- cgtcurr
  }
  if (!missing(cgtdur)) {
    defaults$cgtdur <- cgtdur
  }
  if (!missing(cgtpkamt)) {
    defaults$cgtpkamt <- cgtpkamt
  }
  if (!missing(cgtprev)) {
    defaults$cgtprev <- cgtprev
  }
  if (!missing(cgtqtcat)) {
    defaults$cgtqtcat <- cgtqtcat
  }
  if (!missing(cgtqtyr)) {
    defaults$cgtqtyr <- cgtqtyr
  }
  if (!missing(cgtquit)) {
    defaults$cgtquit <- cgtquit
  }
  if (!missing(chewamt)) {
    defaults$chewamt <- chewamt
  }
  if (!missing(chewcurr)) {
    defaults$chewcurr <- chewcurr
  }
  if (!missing(chewdur)) {
    defaults$chewdur <- chewdur
  }
  if (!missing(chewprev)) {
    defaults$chewprev <- chewprev
  }
  if (!missing(chewqtyr)) {
    defaults$chewqtyr <- chewqtyr
  }
  if (!missing(chewquit)) {
    defaults$chewquit <- chewquit
  }
  if (!missing(cholestr)) {
    defaults$cholestr <- cholestr
  }
  if (!missing(copestrs)) {
    defaults$copestrs <- copestrs
  }
  if (!missing(diast_bp)) {
    defaults$diast_bp <- diast_bp
  }
  if (!missing(dietfrt)) {
    defaults$dietfrt <- dietfrt
  }
  if (!missing(dietfrvg)) {
    defaults$dietfrvg <- dietfrvg
  }
  if (!missing(dietveg)) {
    defaults$dietveg <- dietveg
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(drnkdrv)) {
    defaults$drnkdrv <- drnkdrv
  }
  if (!missing(educ_lvl)) {
    defaults$educ_lvl <- educ_lvl
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(exermo)) {
    defaults$exermo <- exermo
  }
  if (!missing(exerweek)) {
    defaults$exerweek <- exerweek
  }
  if (!missing(famabscat12)) {
    defaults$famabscat12 <- famabscat12
  }
  if (!missing(fireext)) {
    defaults$fireext <- fireext
  }
  if (!missing(flu_shot)) {
    defaults$flu_shot <- flu_shot
  }
  if (!missing(glucose)) {
    defaults$glucose <- glucose
  }
  if (!missing(hdl)) {
    defaults$hdl <- hdl
  }
  if (!missing(height)) {
    defaults$height <- height
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(hltimpct)) {
    defaults$hltimpct <- hltimpct
  }
  if (!missing(job_sat)) {
    defaults$job_sat <- job_sat
  }
  if (!missing(ldl)) {
    defaults$ldl <- ldl
  }
  if (!missing(life_sat)) {
    defaults$life_sat <- life_sat
  }
  if (!missing(liftwgt)) {
    defaults$liftwgt <- liftwgt
  }
  if (!missing(mh_freq)) {
    defaults$mh_freq <- mh_freq
  }
  if (!missing(mh_prob)) {
    defaults$mh_prob <- mh_prob
  }
  if (!missing(pipeamt)) {
    defaults$pipeamt <- pipeamt
  }
  if (!missing(pipecurr)) {
    defaults$pipecurr <- pipecurr
  }
  if (!missing(pipedur)) {
    defaults$pipedur <- pipedur
  }
  if (!missing(pipeprev)) {
    defaults$pipeprev <- pipeprev
  }
  if (!missing(pipeqtyr)) {
    defaults$pipeqtyr <- pipeqtyr
  }
  if (!missing(pipequit)) {
    defaults$pipequit <- pipequit
  }
  if (!missing(planalc)) {
    defaults$planalc <- planalc
  }
  if (!missing(plandiet)) {
    defaults$plandiet <- plandiet
  }
  if (!missing(plandrad)) {
    defaults$plandrad <- plandrad
  }
  if (!missing(planexer)) {
    defaults$planexer <- planexer
  }
  if (!missing(planslp)) {
    defaults$planslp <- planslp
  }
  if (!missing(planstrs)) {
    defaults$planstrs <- planstrs
  }
  if (!missing(plantob)) {
    defaults$plantob <- plantob
  }
  if (!missing(planwgt)) {
    defaults$planwgt <- planwgt
  }
  if (!missing(prev_mammo)) {
    defaults$prev_mammo <- prev_mammo
  }
  if (!missing(prev_paptest)) {
    defaults$prev_paptest <- prev_paptest
  }
  if (!missing(prev_prostex)) {
    defaults$prev_prostex <- prev_prostex
  }
  if (!missing(prev_sigmoid)) {
    defaults$prev_sigmoid <- prev_sigmoid
  }
  if (!missing(prodabscat)) {
    defaults$prodabscat <- prodabscat
  }
  if (!missing(risk_alc)) {
    defaults$risk_alc <- risk_alc
  }
  if (!missing(risk_bp)) {
    defaults$risk_bp <- risk_bp
  }
  if (!missing(risk_chol)) {
    defaults$risk_chol <- risk_chol
  }
  if (!missing(risk_exer)) {
    defaults$risk_exer <- risk_exer
  }
  if (!missing(risk_gluc)) {
    defaults$risk_gluc <- risk_gluc
  }
  if (!missing(risk_mh)) {
    defaults$risk_mh <- risk_mh
  }
  if (!missing(risk_nutr)) {
    defaults$risk_nutr <- risk_nutr
  }
  if (!missing(risk_safe)) {
    defaults$risk_safe <- risk_safe
  }
  if (!missing(risk_sleep)) {
    defaults$risk_sleep <- risk_sleep
  }
  if (!missing(risk_smok)) {
    defaults$risk_smok <- risk_smok
  }
  if (!missing(risk_wgt)) {
    defaults$risk_wgt <- risk_wgt
  }
  if (!missing(seatbelt)) {
    defaults$seatbelt <- seatbelt
  }
  if (!missing(selfhlth)) {
    defaults$selfhlth <- selfhlth
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(sleep_hr)) {
    defaults$sleep_hr <- sleep_hr
  }
  if (!missing(slpapnea)) {
    defaults$slpapnea <- slpapnea
  }
  if (!missing(slpprob)) {
    defaults$slpprob <- slpprob
  }
  if (!missing(smkdetect)) {
    defaults$smkdetect <- smkdetect
  }
  if (!missing(stretch)) {
    defaults$stretch <- stretch
  }
  if (!missing(survdate)) {
    defaults$survdate <- survdate
  }
  if (!missing(systo_bp)) {
    defaults$systo_bp <- systo_bp
  }
  if (!missing(tobcurr)) {
    defaults$tobcurr <- tobcurr
  }
  if (!missing(tobprev)) {
    defaults$tobprev <- tobprev
  }
  if (!missing(triglycd)) {
    defaults$triglycd <- triglycd
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(weight)) {
    defaults$weight <- weight
  }
  if (!missing(workabs)) {
    defaults$workabs <- workabs
  }
  if (!missing(wrkabscat)) {
    defaults$wrkabscat <- wrkabscat
  }
  if (!missing(wrkabscat12)) {
    defaults$wrkabscat12 <- wrkabscat12
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  assign('health_risk_assessment', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_hra_question_ref <- function(question_type_id, category_value, category_name) {
  defaults <- get('hra_question_ref', envir = frameworkContext$defaultValues)
  if (!missing(question_type_id)) {
    defaults$question_type_id <- question_type_id
  }
  if (!missing(category_value)) {
    defaults$category_value <- category_value
  }
  if (!missing(category_name)) {
    defaults$category_name <- category_name
  }
  assign('hra_question_ref', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_hra_variable_ref <- function(variable_name, variable_longname, variable_description, notes, question_type_id) {
  defaults <- get('hra_variable_ref', envir = frameworkContext$defaultValues)
  if (!missing(variable_name)) {
    defaults$variable_name <- variable_name
  }
  if (!missing(variable_longname)) {
    defaults$variable_longname <- variable_longname
  }
  if (!missing(variable_description)) {
    defaults$variable_description <- variable_description
  }
  if (!missing(notes)) {
    defaults$notes <- notes
  }
  if (!missing(question_type_id)) {
    defaults$question_type_id <- question_type_id
  }
  assign('hra_variable_ref', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_inpatient_admissions <- function(flag, admdate, admtyp, age, agegrp, caseid, datatyp, days, disdate, dobyr, drg, dstatus, dx1, dx10, dx11, dx12, dx13, dx14, dx15, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, hlthplan, hospnet, hosppay, indstry, mdc, mhsacovg, msa, pdx, phyflag, physid, physnet, physpay, plankey, plantyp, poapdx, poadx1, poadx2, poadx3, poadx4, poadx5, poadx6, poadx7, poadx8, poadx9, poadx10, poadx11, poadx12, poadx13, poadx14, poadx15, pproc, proc1, proc10, proc11, proc12, proc13, proc14, proc15, proc2, proc3, proc4, proc5, proc6, proc7, proc8, proc9, region, rx, seqnum, sex, state, totcob, totcoins, totcopay, totded, totnet, totpay, version, wgtkey, year) {
  defaults <- get('inpatient_admissions', envir = frameworkContext$defaultValues)
  if (!missing(flag)) {
    defaults$flag <- flag
  }
  if (!missing(admdate)) {
    defaults$admdate <- admdate
  }
  if (!missing(admtyp)) {
    defaults$admtyp <- admtyp
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(caseid)) {
    defaults$caseid <- caseid
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(days)) {
    defaults$days <- days
  }
  if (!missing(disdate)) {
    defaults$disdate <- disdate
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(drg)) {
    defaults$drg <- drg
  }
  if (!missing(dstatus)) {
    defaults$dstatus <- dstatus
  }
  if (!missing(dx1)) {
    defaults$dx1 <- dx1
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
  if (!missing(dxver)) {
    defaults$dxver <- dxver
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(hospnet)) {
    defaults$hospnet <- hospnet
  }
  if (!missing(hosppay)) {
    defaults$hosppay <- hosppay
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(pdx)) {
    defaults$pdx <- pdx
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(physid)) {
    defaults$physid <- physid
  }
  if (!missing(physnet)) {
    defaults$physnet <- physnet
  }
  if (!missing(physpay)) {
    defaults$physpay <- physpay
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(poapdx)) {
    defaults$poapdx <- poapdx
  }
  if (!missing(poadx1)) {
    defaults$poadx1 <- poadx1
  }
  if (!missing(poadx2)) {
    defaults$poadx2 <- poadx2
  }
  if (!missing(poadx3)) {
    defaults$poadx3 <- poadx3
  }
  if (!missing(poadx4)) {
    defaults$poadx4 <- poadx4
  }
  if (!missing(poadx5)) {
    defaults$poadx5 <- poadx5
  }
  if (!missing(poadx6)) {
    defaults$poadx6 <- poadx6
  }
  if (!missing(poadx7)) {
    defaults$poadx7 <- poadx7
  }
  if (!missing(poadx8)) {
    defaults$poadx8 <- poadx8
  }
  if (!missing(poadx9)) {
    defaults$poadx9 <- poadx9
  }
  if (!missing(poadx10)) {
    defaults$poadx10 <- poadx10
  }
  if (!missing(poadx11)) {
    defaults$poadx11 <- poadx11
  }
  if (!missing(poadx12)) {
    defaults$poadx12 <- poadx12
  }
  if (!missing(poadx13)) {
    defaults$poadx13 <- poadx13
  }
  if (!missing(poadx14)) {
    defaults$poadx14 <- poadx14
  }
  if (!missing(poadx15)) {
    defaults$poadx15 <- poadx15
  }
  if (!missing(pproc)) {
    defaults$pproc <- pproc
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(proc10)) {
    defaults$proc10 <- proc10
  }
  if (!missing(proc11)) {
    defaults$proc11 <- proc11
  }
  if (!missing(proc12)) {
    defaults$proc12 <- proc12
  }
  if (!missing(proc13)) {
    defaults$proc13 <- proc13
  }
  if (!missing(proc14)) {
    defaults$proc14 <- proc14
  }
  if (!missing(proc15)) {
    defaults$proc15 <- proc15
  }
  if (!missing(proc2)) {
    defaults$proc2 <- proc2
  }
  if (!missing(proc3)) {
    defaults$proc3 <- proc3
  }
  if (!missing(proc4)) {
    defaults$proc4 <- proc4
  }
  if (!missing(proc5)) {
    defaults$proc5 <- proc5
  }
  if (!missing(proc6)) {
    defaults$proc6 <- proc6
  }
  if (!missing(proc7)) {
    defaults$proc7 <- proc7
  }
  if (!missing(proc8)) {
    defaults$proc8 <- proc8
  }
  if (!missing(proc9)) {
    defaults$proc9 <- proc9
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(state)) {
    defaults$state <- state
  }
  if (!missing(totcob)) {
    defaults$totcob <- totcob
  }
  if (!missing(totcoins)) {
    defaults$totcoins <- totcoins
  }
  if (!missing(totcopay)) {
    defaults$totcopay <- totcopay
  }
  if (!missing(totded)) {
    defaults$totded <- totded
  }
  if (!missing(totnet)) {
    defaults$totnet <- totnet
  }
  if (!missing(totpay)) {
    defaults$totpay <- totpay
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  assign('inpatient_admissions', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_inpatient_services <- function(flag, admdate, admtyp, age, agegrp, cap_svc, caseid, cob, coins, copay, datatyp, deduct, disdate, dobyr, drg, dstatus, dx1, dx2, dx3, dx4, dx5, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, facprof, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pay, pddate, pdx, phyflag, plankey, plantyp, pproc, proc1, procmod, proctyp, provid, qty, region, revcode, rx, seqnum, sex, stdplac, stdprov, svcdate, svcscat, tsvcdat, version, wgtkey, year, units, npi, msclmid) {
  defaults <- get('inpatient_services', envir = frameworkContext$defaultValues)
  if (!missing(flag)) {
    defaults$flag <- flag
  }
  if (!missing(admdate)) {
    defaults$admdate <- admdate
  }
  if (!missing(admtyp)) {
    defaults$admtyp <- admtyp
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(cap_svc)) {
    defaults$cap_svc <- cap_svc
  }
  if (!missing(caseid)) {
    defaults$caseid <- caseid
  }
  if (!missing(cob)) {
    defaults$cob <- cob
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(disdate)) {
    defaults$disdate <- disdate
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(drg)) {
    defaults$drg <- drg
  }
  if (!missing(dstatus)) {
    defaults$dstatus <- dstatus
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
  if (!missing(dxver)) {
    defaults$dxver <- dxver
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(fachdid)) {
    defaults$fachdid <- fachdid
  }
  if (!missing(facprof)) {
    defaults$facprof <- facprof
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
  }
  if (!missing(ntwkprov)) {
    defaults$ntwkprov <- ntwkprov
  }
  if (!missing(paidntwk)) {
    defaults$paidntwk <- paidntwk
  }
  if (!missing(pay)) {
    defaults$pay <- pay
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
  }
  if (!missing(pdx)) {
    defaults$pdx <- pdx
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(pproc)) {
    defaults$pproc <- pproc
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(procmod)) {
    defaults$procmod <- procmod
  }
  if (!missing(proctyp)) {
    defaults$proctyp <- proctyp
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(revcode)) {
    defaults$revcode <- revcode
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(stdplac)) {
    defaults$stdplac <- stdplac
  }
  if (!missing(stdprov)) {
    defaults$stdprov <- stdprov
  }
  if (!missing(svcdate)) {
    defaults$svcdate <- svcdate
  }
  if (!missing(svcscat)) {
    defaults$svcscat <- svcscat
  }
  if (!missing(tsvcdat)) {
    defaults$tsvcdat <- tsvcdat
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(units)) {
    defaults$units <- units
  }
  if (!missing(npi)) {
    defaults$npi <- npi
  }
  if (!missing(msclmid)) {
    defaults$msclmid <- msclmid
  }
  assign('inpatient_services', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_lab <- function(enrolid, seqnum, abnormal, agegrp, eeclass, eestatu, eidflag, emprel, enrflag, hlthplan, indstry, mhsacovg, phyflag, proctyp, region, rx, sex, egeoloc, mdc, version, resltcat, dx1, proc1, pddate, svcdate, msa, orderid, provid, refhigh, reflow, result, testcnt, dobyr, plankey, stdprov, wgtkey, year, age, datatyp, plantyp, stdplac, loinccd, resunit, efamid, dxver) {
  defaults <- get('lab', envir = frameworkContext$defaultValues)
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(abnormal)) {
    defaults$abnormal <- abnormal
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(proctyp)) {
    defaults$proctyp <- proctyp
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(resltcat)) {
    defaults$resltcat <- resltcat
  }
  if (!missing(dx1)) {
    defaults$dx1 <- dx1
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
  }
  if (!missing(svcdate)) {
    defaults$svcdate <- svcdate
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(orderid)) {
    defaults$orderid <- orderid
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(refhigh)) {
    defaults$refhigh <- refhigh
  }
  if (!missing(reflow)) {
    defaults$reflow <- reflow
  }
  if (!missing(result)) {
    defaults$result <- result
  }
  if (!missing(testcnt)) {
    defaults$testcnt <- testcnt
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(stdprov)) {
    defaults$stdprov <- stdprov
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(stdplac)) {
    defaults$stdplac <- stdplac
  }
  if (!missing(loinccd)) {
    defaults$loinccd <- loinccd
  }
  if (!missing(resunit)) {
    defaults$resunit <- resunit
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(dxver)) {
    defaults$dxver <- dxver
  }
  assign('lab', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_outpatient_services <- function(flag, age, agegrp, cap_svc, cob, coins, copay, datatyp, deduct, dobyr, dx1, dx2, dx3, dx4, dx5, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, facprof, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pay, pddate, phyflag, plankey, plantyp, proc1, procgrp, procmod, proctyp, provid, qty, region, revcode, rx, seqnum, sex, stdplac, stdprov, svcdate, svcscat, tsvcdat, version, wgtkey, year, units, npi, msclmid) {
  defaults <- get('outpatient_services', envir = frameworkContext$defaultValues)
  if (!missing(flag)) {
    defaults$flag <- flag
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(cap_svc)) {
    defaults$cap_svc <- cap_svc
  }
  if (!missing(cob)) {
    defaults$cob <- cob
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
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
  if (!missing(dxver)) {
    defaults$dxver <- dxver
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(fachdid)) {
    defaults$fachdid <- fachdid
  }
  if (!missing(facprof)) {
    defaults$facprof <- facprof
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
  }
  if (!missing(ntwkprov)) {
    defaults$ntwkprov <- ntwkprov
  }
  if (!missing(paidntwk)) {
    defaults$paidntwk <- paidntwk
  }
  if (!missing(pay)) {
    defaults$pay <- pay
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(procgrp)) {
    defaults$procgrp <- procgrp
  }
  if (!missing(procmod)) {
    defaults$procmod <- procmod
  }
  if (!missing(proctyp)) {
    defaults$proctyp <- proctyp
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(revcode)) {
    defaults$revcode <- revcode
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(stdplac)) {
    defaults$stdplac <- stdplac
  }
  if (!missing(stdprov)) {
    defaults$stdprov <- stdprov
  }
  if (!missing(svcdate)) {
    defaults$svcdate <- svcdate
  }
  if (!missing(svcscat)) {
    defaults$svcscat <- svcscat
  }
  if (!missing(tsvcdat)) {
    defaults$tsvcdat <- tsvcdat
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(units)) {
    defaults$units <- units
  }
  if (!missing(npi)) {
    defaults$npi <- npi
  }
  if (!missing(msclmid)) {
    defaults$msclmid <- msclmid
  }
  assign('outpatient_services', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

get_defaults_drug_claims <- function() {
  defaults <- get('drug_claims', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_enrollment_detail <- function() {
  defaults <- get('enrollment_detail', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_enrollment_summary <- function() {
  defaults <- get('enrollment_summary', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_facility_header <- function() {
  defaults <- get('facility_header', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_health_risk_assessment <- function() {
  defaults <- get('health_risk_assessment', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_hra_question_ref <- function() {
  defaults <- get('hra_question_ref', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_hra_variable_ref <- function() {
  defaults <- get('hra_variable_ref', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_inpatient_admissions <- function() {
  defaults <- get('inpatient_admissions', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_inpatient_services <- function() {
  defaults <- get('inpatient_services', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_lab <- function() {
  defaults <- get('lab', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_outpatient_services <- function() {
  defaults <- get('outpatient_services', envir = frameworkContext$defaultValues)
  return(defaults)
}

declareTestGroup <- function(groupName, id) {
  frameworkContext$groupIndex <- frameworkContext$groupIndex + 1 ;
  frameworkContext$currentGroup <- {}

  frameworkContext$currentGroup$groupName <- groupName;
  frameworkContext$currentGroup$groupItemIndex <- -1;
  sql <- c(paste0(groupName));
  frameworkContext$testId <- id
  inserts <- list(testId = frameworkContext$testId, sql = sql)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
}

declareTest <- function(id, description) {
  frameworkContext$testId <- id
  frameworkContext$testDescription <- description
}

add_drug_claims <- function(flag, age, agegrp, awp, cap_svc, cob, coins, copay, datatyp, dawind, daysupp, deaclas, deduct, dispfee, dobyr, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, generid, genind, hlthplan, indstry, ingcost, maintin, metqty, mhsacovg, msa, ndcnum, netpay, ntwkprov, paidntwk, pay, pddate, pharmid, phyflag, plankey, plantyp, qty, refill, region, rxmr, saletax, seqnum, sex, svcdate, thercls, thergrp, version, wgtkey, year, gpi) {
  defaults <- get('drug_claims', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(flag)) {
    flag <- defaults$flag
  }
  if (!is.null(flag)) {
    fields <- c(fields, "_flag")
    values <- c(values, if (is.null(flag)) "NULL" else if (is(flag, "subQuery")) paste0("(", as.character(flag), ")") else paste0("'", as.character(flag), "'"))
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    fields <- c(fields, "age")
    values <- c(values, if (is.null(age)) "NULL" else if (is(age, "subQuery")) paste0("(", as.character(age), ")") else paste0("'", as.character(age), "'"))
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    fields <- c(fields, "agegrp")
    values <- c(values, if (is.null(agegrp)) "NULL" else if (is(agegrp, "subQuery")) paste0("(", as.character(agegrp), ")") else paste0("'", as.character(agegrp), "'"))
  }

  if (missing(awp)) {
    awp <- defaults$awp
  }
  if (!is.null(awp)) {
    fields <- c(fields, "awp")
    values <- c(values, if (is.null(awp)) "NULL" else if (is(awp, "subQuery")) paste0("(", as.character(awp), ")") else paste0("'", as.character(awp), "'"))
  }

  if (missing(cap_svc)) {
    cap_svc <- defaults$cap_svc
  }
  if (!is.null(cap_svc)) {
    fields <- c(fields, "cap_svc")
    values <- c(values, if (is.null(cap_svc)) "NULL" else if (is(cap_svc, "subQuery")) paste0("(", as.character(cap_svc), ")") else paste0("'", as.character(cap_svc), "'"))
  }

  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    fields <- c(fields, "cob")
    values <- c(values, if (is.null(cob)) "NULL" else if (is(cob, "subQuery")) paste0("(", as.character(cob), ")") else paste0("'", as.character(cob), "'"))
  }

  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    fields <- c(fields, "coins")
    values <- c(values, if (is.null(coins)) "NULL" else if (is(coins, "subQuery")) paste0("(", as.character(coins), ")") else paste0("'", as.character(coins), "'"))
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    fields <- c(fields, "copay")
    values <- c(values, if (is.null(copay)) "NULL" else if (is(copay, "subQuery")) paste0("(", as.character(copay), ")") else paste0("'", as.character(copay), "'"))
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    fields <- c(fields, "datatyp")
    values <- c(values, if (is.null(datatyp)) "NULL" else if (is(datatyp, "subQuery")) paste0("(", as.character(datatyp), ")") else paste0("'", as.character(datatyp), "'"))
  }

  if (missing(dawind)) {
    dawind <- defaults$dawind
  }
  if (!is.null(dawind)) {
    fields <- c(fields, "dawind")
    values <- c(values, if (is.null(dawind)) "NULL" else if (is(dawind, "subQuery")) paste0("(", as.character(dawind), ")") else paste0("'", as.character(dawind), "'"))
  }

  if (missing(daysupp)) {
    daysupp <- defaults$daysupp
  }
  if (!is.null(daysupp)) {
    fields <- c(fields, "daysupp")
    values <- c(values, if (is.null(daysupp)) "NULL" else if (is(daysupp, "subQuery")) paste0("(", as.character(daysupp), ")") else paste0("'", as.character(daysupp), "'"))
  }

  if (missing(deaclas)) {
    deaclas <- defaults$deaclas
  }
  if (!is.null(deaclas)) {
    fields <- c(fields, "deaclas")
    values <- c(values, if (is.null(deaclas)) "NULL" else if (is(deaclas, "subQuery")) paste0("(", as.character(deaclas), ")") else paste0("'", as.character(deaclas), "'"))
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    fields <- c(fields, "deduct")
    values <- c(values, if (is.null(deduct)) "NULL" else if (is(deduct, "subQuery")) paste0("(", as.character(deduct), ")") else paste0("'", as.character(deduct), "'"))
  }

  if (missing(dispfee)) {
    dispfee <- defaults$dispfee
  }
  if (!is.null(dispfee)) {
    fields <- c(fields, "dispfee")
    values <- c(values, if (is.null(dispfee)) "NULL" else if (is(dispfee, "subQuery")) paste0("(", as.character(dispfee), ")") else paste0("'", as.character(dispfee), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    fields <- c(fields, "eeclass")
    values <- c(values, if (is.null(eeclass)) "NULL" else if (is(eeclass, "subQuery")) paste0("(", as.character(eeclass), ")") else paste0("'", as.character(eeclass), "'"))
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    fields <- c(fields, "eestatu")
    values <- c(values, if (is.null(eestatu)) "NULL" else if (is(eestatu, "subQuery")) paste0("(", as.character(eestatu), ")") else paste0("'", as.character(eestatu), "'"))
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    fields <- c(fields, "efamid")
    values <- c(values, if (is.null(efamid)) "NULL" else if (is(efamid, "subQuery")) paste0("(", as.character(efamid), ")") else paste0("'", as.character(efamid), "'"))
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    fields <- c(fields, "egeoloc")
    values <- c(values, if (is.null(egeoloc)) "NULL" else if (is(egeoloc, "subQuery")) paste0("(", as.character(egeoloc), ")") else paste0("'", as.character(egeoloc), "'"))
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    fields <- c(fields, "eidflag")
    values <- c(values, if (is.null(eidflag)) "NULL" else if (is(eidflag, "subQuery")) paste0("(", as.character(eidflag), ")") else paste0("'", as.character(eidflag), "'"))
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    fields <- c(fields, "emprel")
    values <- c(values, if (is.null(emprel)) "NULL" else if (is(emprel, "subQuery")) paste0("(", as.character(emprel), ")") else paste0("'", as.character(emprel), "'"))
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    fields <- c(fields, "enrflag")
    values <- c(values, if (is.null(enrflag)) "NULL" else if (is(enrflag, "subQuery")) paste0("(", as.character(enrflag), ")") else paste0("'", as.character(enrflag), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(generid)) {
    generid <- defaults$generid
  }
  if (!is.null(generid)) {
    fields <- c(fields, "generid")
    values <- c(values, if (is.null(generid)) "NULL" else if (is(generid, "subQuery")) paste0("(", as.character(generid), ")") else paste0("'", as.character(generid), "'"))
  }

  if (missing(genind)) {
    genind <- defaults$genind
  }
  if (!is.null(genind)) {
    fields <- c(fields, "genind")
    values <- c(values, if (is.null(genind)) "NULL" else if (is(genind, "subQuery")) paste0("(", as.character(genind), ")") else paste0("'", as.character(genind), "'"))
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    fields <- c(fields, "hlthplan")
    values <- c(values, if (is.null(hlthplan)) "NULL" else if (is(hlthplan, "subQuery")) paste0("(", as.character(hlthplan), ")") else paste0("'", as.character(hlthplan), "'"))
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    fields <- c(fields, "indstry")
    values <- c(values, if (is.null(indstry)) "NULL" else if (is(indstry, "subQuery")) paste0("(", as.character(indstry), ")") else paste0("'", as.character(indstry), "'"))
  }

  if (missing(ingcost)) {
    ingcost <- defaults$ingcost
  }
  if (!is.null(ingcost)) {
    fields <- c(fields, "ingcost")
    values <- c(values, if (is.null(ingcost)) "NULL" else if (is(ingcost, "subQuery")) paste0("(", as.character(ingcost), ")") else paste0("'", as.character(ingcost), "'"))
  }

  if (missing(maintin)) {
    maintin <- defaults$maintin
  }
  if (!is.null(maintin)) {
    fields <- c(fields, "maintin")
    values <- c(values, if (is.null(maintin)) "NULL" else if (is(maintin, "subQuery")) paste0("(", as.character(maintin), ")") else paste0("'", as.character(maintin), "'"))
  }

  if (missing(metqty)) {
    metqty <- defaults$metqty
  }
  if (!is.null(metqty)) {
    fields <- c(fields, "metqty")
    values <- c(values, if (is.null(metqty)) "NULL" else if (is(metqty, "subQuery")) paste0("(", as.character(metqty), ")") else paste0("'", as.character(metqty), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    fields <- c(fields, "msa")
    values <- c(values, if (is.null(msa)) "NULL" else if (is(msa, "subQuery")) paste0("(", as.character(msa), ")") else paste0("'", as.character(msa), "'"))
  }

  if (missing(ndcnum)) {
    ndcnum <- defaults$ndcnum
  }
  if (!is.null(ndcnum)) {
    fields <- c(fields, "ndcnum")
    values <- c(values, if (is.null(ndcnum)) "NULL" else if (is(ndcnum, "subQuery")) paste0("(", as.character(ndcnum), ")") else paste0("'", as.character(ndcnum), "'"))
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    fields <- c(fields, "netpay")
    values <- c(values, if (is.null(netpay)) "NULL" else if (is(netpay, "subQuery")) paste0("(", as.character(netpay), ")") else paste0("'", as.character(netpay), "'"))
  }

  if (missing(ntwkprov)) {
    ntwkprov <- defaults$ntwkprov
  }
  if (!is.null(ntwkprov)) {
    fields <- c(fields, "ntwkprov")
    values <- c(values, if (is.null(ntwkprov)) "NULL" else if (is(ntwkprov, "subQuery")) paste0("(", as.character(ntwkprov), ")") else paste0("'", as.character(ntwkprov), "'"))
  }

  if (missing(paidntwk)) {
    paidntwk <- defaults$paidntwk
  }
  if (!is.null(paidntwk)) {
    fields <- c(fields, "paidntwk")
    values <- c(values, if (is.null(paidntwk)) "NULL" else if (is(paidntwk, "subQuery")) paste0("(", as.character(paidntwk), ")") else paste0("'", as.character(paidntwk), "'"))
  }

  if (missing(pay)) {
    pay <- defaults$pay
  }
  if (!is.null(pay)) {
    fields <- c(fields, "pay")
    values <- c(values, if (is.null(pay)) "NULL" else if (is(pay, "subQuery")) paste0("(", as.character(pay), ")") else paste0("'", as.character(pay), "'"))
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    fields <- c(fields, "pddate")
    values <- c(values, if (is.null(pddate)) "NULL" else if (is(pddate, "subQuery")) paste0("(", as.character(pddate), ")") else paste0("'", as.character(pddate), "'"))
  }

  if (missing(pharmid)) {
    pharmid <- defaults$pharmid
  }
  if (!is.null(pharmid)) {
    fields <- c(fields, "pharmid")
    values <- c(values, if (is.null(pharmid)) "NULL" else if (is(pharmid, "subQuery")) paste0("(", as.character(pharmid), ")") else paste0("'", as.character(pharmid), "'"))
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    fields <- c(fields, "phyflag")
    values <- c(values, if (is.null(phyflag)) "NULL" else if (is(phyflag, "subQuery")) paste0("(", as.character(phyflag), ")") else paste0("'", as.character(phyflag), "'"))
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    fields <- c(fields, "plankey")
    values <- c(values, if (is.null(plankey)) "NULL" else if (is(plankey, "subQuery")) paste0("(", as.character(plankey), ")") else paste0("'", as.character(plankey), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    fields <- c(fields, "qty")
    values <- c(values, if (is.null(qty)) "NULL" else if (is(qty, "subQuery")) paste0("(", as.character(qty), ")") else paste0("'", as.character(qty), "'"))
  }

  if (missing(refill)) {
    refill <- defaults$refill
  }
  if (!is.null(refill)) {
    fields <- c(fields, "refill")
    values <- c(values, if (is.null(refill)) "NULL" else if (is(refill, "subQuery")) paste0("(", as.character(refill), ")") else paste0("'", as.character(refill), "'"))
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    fields <- c(fields, "region")
    values <- c(values, if (is.null(region)) "NULL" else if (is(region, "subQuery")) paste0("(", as.character(region), ")") else paste0("'", as.character(region), "'"))
  }

  if (missing(rxmr)) {
    rxmr <- defaults$rxmr
  }
  if (!is.null(rxmr)) {
    fields <- c(fields, "rxmr")
    values <- c(values, if (is.null(rxmr)) "NULL" else if (is(rxmr, "subQuery")) paste0("(", as.character(rxmr), ")") else paste0("'", as.character(rxmr), "'"))
  }

  if (missing(saletax)) {
    saletax <- defaults$saletax
  }
  if (!is.null(saletax)) {
    fields <- c(fields, "saletax")
    values <- c(values, if (is.null(saletax)) "NULL" else if (is(saletax, "subQuery")) paste0("(", as.character(saletax), ")") else paste0("'", as.character(saletax), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    fields <- c(fields, "svcdate")
    values <- c(values, if (is.null(svcdate)) "NULL" else if (is(svcdate, "subQuery")) paste0("(", as.character(svcdate), ")") else paste0("'", as.character(svcdate), "'"))
  }

  if (missing(thercls)) {
    thercls <- defaults$thercls
  }
  if (!is.null(thercls)) {
    fields <- c(fields, "thercls")
    values <- c(values, if (is.null(thercls)) "NULL" else if (is(thercls, "subQuery")) paste0("(", as.character(thercls), ")") else paste0("'", as.character(thercls), "'"))
  }

  if (missing(thergrp)) {
    thergrp <- defaults$thergrp
  }
  if (!is.null(thergrp)) {
    fields <- c(fields, "thergrp")
    values <- c(values, if (is.null(thergrp)) "NULL" else if (is(thergrp, "subQuery")) paste0("(", as.character(thergrp), ")") else paste0("'", as.character(thergrp), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    fields <- c(fields, "wgtkey")
    values <- c(values, if (is.null(wgtkey)) "NULL" else if (is(wgtkey, "subQuery")) paste0("(", as.character(wgtkey), ")") else paste0("'", as.character(wgtkey), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  if (missing(gpi)) {
    gpi <- defaults$gpi
  }
  if (!is.null(gpi)) {
    fields <- c(fields, "gpi")
    values <- c(values, if (is.null(gpi)) "NULL" else if (is(gpi, "subQuery")) paste0("(", as.character(gpi), ")") else paste0("'", as.character(gpi), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "drug_claims", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_enrollment_detail <- function(flag, age, agegrp, datatyp, dobyr, dtend, dtstart, eeclass, eestatu, efamid, egeoloc, emprel, enrolid, hlthplan, indstry, memdays, mhsacovg, msa, phyflag, plankey, plantyp, region, rx, seqnum, sex, version, wgtkey, year) {
  defaults <- get('enrollment_detail', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(flag)) {
    flag <- defaults$flag
  }
  if (!is.null(flag)) {
    fields <- c(fields, "_flag")
    values <- c(values, if (is.null(flag)) "NULL" else if (is(flag, "subQuery")) paste0("(", as.character(flag), ")") else paste0("'", as.character(flag), "'"))
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    fields <- c(fields, "age")
    values <- c(values, if (is.null(age)) "NULL" else if (is(age, "subQuery")) paste0("(", as.character(age), ")") else paste0("'", as.character(age), "'"))
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    fields <- c(fields, "agegrp")
    values <- c(values, if (is.null(agegrp)) "NULL" else if (is(agegrp, "subQuery")) paste0("(", as.character(agegrp), ")") else paste0("'", as.character(agegrp), "'"))
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    fields <- c(fields, "datatyp")
    values <- c(values, if (is.null(datatyp)) "NULL" else if (is(datatyp, "subQuery")) paste0("(", as.character(datatyp), ")") else paste0("'", as.character(datatyp), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(dtend)) {
    dtend <- defaults$dtend
  }
  if (!is.null(dtend)) {
    fields <- c(fields, "dtend")
    values <- c(values, if (is.null(dtend)) "NULL" else if (is(dtend, "subQuery")) paste0("(", as.character(dtend), ")") else paste0("'", as.character(dtend), "'"))
  }

  if (missing(dtstart)) {
    dtstart <- defaults$dtstart
  }
  if (!is.null(dtstart)) {
    fields <- c(fields, "dtstart")
    values <- c(values, if (is.null(dtstart)) "NULL" else if (is(dtstart, "subQuery")) paste0("(", as.character(dtstart), ")") else paste0("'", as.character(dtstart), "'"))
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    fields <- c(fields, "eeclass")
    values <- c(values, if (is.null(eeclass)) "NULL" else if (is(eeclass, "subQuery")) paste0("(", as.character(eeclass), ")") else paste0("'", as.character(eeclass), "'"))
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    fields <- c(fields, "eestatu")
    values <- c(values, if (is.null(eestatu)) "NULL" else if (is(eestatu, "subQuery")) paste0("(", as.character(eestatu), ")") else paste0("'", as.character(eestatu), "'"))
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    fields <- c(fields, "efamid")
    values <- c(values, if (is.null(efamid)) "NULL" else if (is(efamid, "subQuery")) paste0("(", as.character(efamid), ")") else paste0("'", as.character(efamid), "'"))
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    fields <- c(fields, "egeoloc")
    values <- c(values, if (is.null(egeoloc)) "NULL" else if (is(egeoloc, "subQuery")) paste0("(", as.character(egeoloc), ")") else paste0("'", as.character(egeoloc), "'"))
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    fields <- c(fields, "emprel")
    values <- c(values, if (is.null(emprel)) "NULL" else if (is(emprel, "subQuery")) paste0("(", as.character(emprel), ")") else paste0("'", as.character(emprel), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    fields <- c(fields, "hlthplan")
    values <- c(values, if (is.null(hlthplan)) "NULL" else if (is(hlthplan, "subQuery")) paste0("(", as.character(hlthplan), ")") else paste0("'", as.character(hlthplan), "'"))
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    fields <- c(fields, "indstry")
    values <- c(values, if (is.null(indstry)) "NULL" else if (is(indstry, "subQuery")) paste0("(", as.character(indstry), ")") else paste0("'", as.character(indstry), "'"))
  }

  if (missing(memdays)) {
    memdays <- defaults$memdays
  }
  if (!is.null(memdays)) {
    fields <- c(fields, "memdays")
    values <- c(values, if (is.null(memdays)) "NULL" else if (is(memdays, "subQuery")) paste0("(", as.character(memdays), ")") else paste0("'", as.character(memdays), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    fields <- c(fields, "msa")
    values <- c(values, if (is.null(msa)) "NULL" else if (is(msa, "subQuery")) paste0("(", as.character(msa), ")") else paste0("'", as.character(msa), "'"))
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    fields <- c(fields, "phyflag")
    values <- c(values, if (is.null(phyflag)) "NULL" else if (is(phyflag, "subQuery")) paste0("(", as.character(phyflag), ")") else paste0("'", as.character(phyflag), "'"))
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    fields <- c(fields, "plankey")
    values <- c(values, if (is.null(plankey)) "NULL" else if (is(plankey, "subQuery")) paste0("(", as.character(plankey), ")") else paste0("'", as.character(plankey), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    fields <- c(fields, "region")
    values <- c(values, if (is.null(region)) "NULL" else if (is(region, "subQuery")) paste0("(", as.character(region), ")") else paste0("'", as.character(region), "'"))
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    fields <- c(fields, "rx")
    values <- c(values, if (is.null(rx)) "NULL" else if (is(rx, "subQuery")) paste0("(", as.character(rx), ")") else paste0("'", as.character(rx), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    fields <- c(fields, "wgtkey")
    values <- c(values, if (is.null(wgtkey)) "NULL" else if (is(wgtkey, "subQuery")) paste0("(", as.character(wgtkey), ")") else paste0("'", as.character(wgtkey), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "enrollment_detail", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_enrollment_summary <- function(flag, age, agegrp, dattyp1, dattyp10, dattyp11, dattyp12, dattyp2, dattyp3, dattyp4, dattyp5, dattyp6, dattyp7, dattyp8, dattyp9, dobyr, eeclass, eestatu, efamid, egeoloc, emprel, enrind1, enrind10, enrind11, enrind12, enrind2, enrind3, enrind4, enrind5, enrind6, enrind7, enrind8, enrind9, enrmon, enrolid, hlthplan, indstry, memday1, memday10, memday11, memday12, memday2, memday3, memday4, memday5, memday6, memday7, memday8, memday9, memdays, mhsacovg, msa, phyflag, plnkey1, plnkey10, plnkey11, plnkey12, plnkey2, plnkey3, plnkey4, plnkey5, plnkey6, plnkey7, plnkey8, plnkey9, plntyp1, plntyp10, plntyp11, plntyp12, plntyp2, plntyp3, plntyp4, plntyp5, plntyp6, plntyp7, plntyp8, plntyp9, region, rx, seqnum, sex, version, wgtkey, year, mswgtkey) {
  defaults <- get('enrollment_summary', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(flag)) {
    flag <- defaults$flag
  }
  if (!is.null(flag)) {
    fields <- c(fields, "_flag")
    values <- c(values, if (is.null(flag)) "NULL" else if (is(flag, "subQuery")) paste0("(", as.character(flag), ")") else paste0("'", as.character(flag), "'"))
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    fields <- c(fields, "age")
    values <- c(values, if (is.null(age)) "NULL" else if (is(age, "subQuery")) paste0("(", as.character(age), ")") else paste0("'", as.character(age), "'"))
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    fields <- c(fields, "agegrp")
    values <- c(values, if (is.null(agegrp)) "NULL" else if (is(agegrp, "subQuery")) paste0("(", as.character(agegrp), ")") else paste0("'", as.character(agegrp), "'"))
  }

  if (missing(dattyp1)) {
    dattyp1 <- defaults$dattyp1
  }
  if (!is.null(dattyp1)) {
    fields <- c(fields, "dattyp1")
    values <- c(values, if (is.null(dattyp1)) "NULL" else if (is(dattyp1, "subQuery")) paste0("(", as.character(dattyp1), ")") else paste0("'", as.character(dattyp1), "'"))
  }

  if (missing(dattyp10)) {
    dattyp10 <- defaults$dattyp10
  }
  if (!is.null(dattyp10)) {
    fields <- c(fields, "dattyp10")
    values <- c(values, if (is.null(dattyp10)) "NULL" else if (is(dattyp10, "subQuery")) paste0("(", as.character(dattyp10), ")") else paste0("'", as.character(dattyp10), "'"))
  }

  if (missing(dattyp11)) {
    dattyp11 <- defaults$dattyp11
  }
  if (!is.null(dattyp11)) {
    fields <- c(fields, "dattyp11")
    values <- c(values, if (is.null(dattyp11)) "NULL" else if (is(dattyp11, "subQuery")) paste0("(", as.character(dattyp11), ")") else paste0("'", as.character(dattyp11), "'"))
  }

  if (missing(dattyp12)) {
    dattyp12 <- defaults$dattyp12
  }
  if (!is.null(dattyp12)) {
    fields <- c(fields, "dattyp12")
    values <- c(values, if (is.null(dattyp12)) "NULL" else if (is(dattyp12, "subQuery")) paste0("(", as.character(dattyp12), ")") else paste0("'", as.character(dattyp12), "'"))
  }

  if (missing(dattyp2)) {
    dattyp2 <- defaults$dattyp2
  }
  if (!is.null(dattyp2)) {
    fields <- c(fields, "dattyp2")
    values <- c(values, if (is.null(dattyp2)) "NULL" else if (is(dattyp2, "subQuery")) paste0("(", as.character(dattyp2), ")") else paste0("'", as.character(dattyp2), "'"))
  }

  if (missing(dattyp3)) {
    dattyp3 <- defaults$dattyp3
  }
  if (!is.null(dattyp3)) {
    fields <- c(fields, "dattyp3")
    values <- c(values, if (is.null(dattyp3)) "NULL" else if (is(dattyp3, "subQuery")) paste0("(", as.character(dattyp3), ")") else paste0("'", as.character(dattyp3), "'"))
  }

  if (missing(dattyp4)) {
    dattyp4 <- defaults$dattyp4
  }
  if (!is.null(dattyp4)) {
    fields <- c(fields, "dattyp4")
    values <- c(values, if (is.null(dattyp4)) "NULL" else if (is(dattyp4, "subQuery")) paste0("(", as.character(dattyp4), ")") else paste0("'", as.character(dattyp4), "'"))
  }

  if (missing(dattyp5)) {
    dattyp5 <- defaults$dattyp5
  }
  if (!is.null(dattyp5)) {
    fields <- c(fields, "dattyp5")
    values <- c(values, if (is.null(dattyp5)) "NULL" else if (is(dattyp5, "subQuery")) paste0("(", as.character(dattyp5), ")") else paste0("'", as.character(dattyp5), "'"))
  }

  if (missing(dattyp6)) {
    dattyp6 <- defaults$dattyp6
  }
  if (!is.null(dattyp6)) {
    fields <- c(fields, "dattyp6")
    values <- c(values, if (is.null(dattyp6)) "NULL" else if (is(dattyp6, "subQuery")) paste0("(", as.character(dattyp6), ")") else paste0("'", as.character(dattyp6), "'"))
  }

  if (missing(dattyp7)) {
    dattyp7 <- defaults$dattyp7
  }
  if (!is.null(dattyp7)) {
    fields <- c(fields, "dattyp7")
    values <- c(values, if (is.null(dattyp7)) "NULL" else if (is(dattyp7, "subQuery")) paste0("(", as.character(dattyp7), ")") else paste0("'", as.character(dattyp7), "'"))
  }

  if (missing(dattyp8)) {
    dattyp8 <- defaults$dattyp8
  }
  if (!is.null(dattyp8)) {
    fields <- c(fields, "dattyp8")
    values <- c(values, if (is.null(dattyp8)) "NULL" else if (is(dattyp8, "subQuery")) paste0("(", as.character(dattyp8), ")") else paste0("'", as.character(dattyp8), "'"))
  }

  if (missing(dattyp9)) {
    dattyp9 <- defaults$dattyp9
  }
  if (!is.null(dattyp9)) {
    fields <- c(fields, "dattyp9")
    values <- c(values, if (is.null(dattyp9)) "NULL" else if (is(dattyp9, "subQuery")) paste0("(", as.character(dattyp9), ")") else paste0("'", as.character(dattyp9), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    fields <- c(fields, "eeclass")
    values <- c(values, if (is.null(eeclass)) "NULL" else if (is(eeclass, "subQuery")) paste0("(", as.character(eeclass), ")") else paste0("'", as.character(eeclass), "'"))
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    fields <- c(fields, "eestatu")
    values <- c(values, if (is.null(eestatu)) "NULL" else if (is(eestatu, "subQuery")) paste0("(", as.character(eestatu), ")") else paste0("'", as.character(eestatu), "'"))
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    fields <- c(fields, "efamid")
    values <- c(values, if (is.null(efamid)) "NULL" else if (is(efamid, "subQuery")) paste0("(", as.character(efamid), ")") else paste0("'", as.character(efamid), "'"))
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    fields <- c(fields, "egeoloc")
    values <- c(values, if (is.null(egeoloc)) "NULL" else if (is(egeoloc, "subQuery")) paste0("(", as.character(egeoloc), ")") else paste0("'", as.character(egeoloc), "'"))
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    fields <- c(fields, "emprel")
    values <- c(values, if (is.null(emprel)) "NULL" else if (is(emprel, "subQuery")) paste0("(", as.character(emprel), ")") else paste0("'", as.character(emprel), "'"))
  }

  if (missing(enrind1)) {
    enrind1 <- defaults$enrind1
  }
  if (!is.null(enrind1)) {
    fields <- c(fields, "enrind1")
    values <- c(values, if (is.null(enrind1)) "NULL" else if (is(enrind1, "subQuery")) paste0("(", as.character(enrind1), ")") else paste0("'", as.character(enrind1), "'"))
  }

  if (missing(enrind10)) {
    enrind10 <- defaults$enrind10
  }
  if (!is.null(enrind10)) {
    fields <- c(fields, "enrind10")
    values <- c(values, if (is.null(enrind10)) "NULL" else if (is(enrind10, "subQuery")) paste0("(", as.character(enrind10), ")") else paste0("'", as.character(enrind10), "'"))
  }

  if (missing(enrind11)) {
    enrind11 <- defaults$enrind11
  }
  if (!is.null(enrind11)) {
    fields <- c(fields, "enrind11")
    values <- c(values, if (is.null(enrind11)) "NULL" else if (is(enrind11, "subQuery")) paste0("(", as.character(enrind11), ")") else paste0("'", as.character(enrind11), "'"))
  }

  if (missing(enrind12)) {
    enrind12 <- defaults$enrind12
  }
  if (!is.null(enrind12)) {
    fields <- c(fields, "enrind12")
    values <- c(values, if (is.null(enrind12)) "NULL" else if (is(enrind12, "subQuery")) paste0("(", as.character(enrind12), ")") else paste0("'", as.character(enrind12), "'"))
  }

  if (missing(enrind2)) {
    enrind2 <- defaults$enrind2
  }
  if (!is.null(enrind2)) {
    fields <- c(fields, "enrind2")
    values <- c(values, if (is.null(enrind2)) "NULL" else if (is(enrind2, "subQuery")) paste0("(", as.character(enrind2), ")") else paste0("'", as.character(enrind2), "'"))
  }

  if (missing(enrind3)) {
    enrind3 <- defaults$enrind3
  }
  if (!is.null(enrind3)) {
    fields <- c(fields, "enrind3")
    values <- c(values, if (is.null(enrind3)) "NULL" else if (is(enrind3, "subQuery")) paste0("(", as.character(enrind3), ")") else paste0("'", as.character(enrind3), "'"))
  }

  if (missing(enrind4)) {
    enrind4 <- defaults$enrind4
  }
  if (!is.null(enrind4)) {
    fields <- c(fields, "enrind4")
    values <- c(values, if (is.null(enrind4)) "NULL" else if (is(enrind4, "subQuery")) paste0("(", as.character(enrind4), ")") else paste0("'", as.character(enrind4), "'"))
  }

  if (missing(enrind5)) {
    enrind5 <- defaults$enrind5
  }
  if (!is.null(enrind5)) {
    fields <- c(fields, "enrind5")
    values <- c(values, if (is.null(enrind5)) "NULL" else if (is(enrind5, "subQuery")) paste0("(", as.character(enrind5), ")") else paste0("'", as.character(enrind5), "'"))
  }

  if (missing(enrind6)) {
    enrind6 <- defaults$enrind6
  }
  if (!is.null(enrind6)) {
    fields <- c(fields, "enrind6")
    values <- c(values, if (is.null(enrind6)) "NULL" else if (is(enrind6, "subQuery")) paste0("(", as.character(enrind6), ")") else paste0("'", as.character(enrind6), "'"))
  }

  if (missing(enrind7)) {
    enrind7 <- defaults$enrind7
  }
  if (!is.null(enrind7)) {
    fields <- c(fields, "enrind7")
    values <- c(values, if (is.null(enrind7)) "NULL" else if (is(enrind7, "subQuery")) paste0("(", as.character(enrind7), ")") else paste0("'", as.character(enrind7), "'"))
  }

  if (missing(enrind8)) {
    enrind8 <- defaults$enrind8
  }
  if (!is.null(enrind8)) {
    fields <- c(fields, "enrind8")
    values <- c(values, if (is.null(enrind8)) "NULL" else if (is(enrind8, "subQuery")) paste0("(", as.character(enrind8), ")") else paste0("'", as.character(enrind8), "'"))
  }

  if (missing(enrind9)) {
    enrind9 <- defaults$enrind9
  }
  if (!is.null(enrind9)) {
    fields <- c(fields, "enrind9")
    values <- c(values, if (is.null(enrind9)) "NULL" else if (is(enrind9, "subQuery")) paste0("(", as.character(enrind9), ")") else paste0("'", as.character(enrind9), "'"))
  }

  if (missing(enrmon)) {
    enrmon <- defaults$enrmon
  }
  if (!is.null(enrmon)) {
    fields <- c(fields, "enrmon")
    values <- c(values, if (is.null(enrmon)) "NULL" else if (is(enrmon, "subQuery")) paste0("(", as.character(enrmon), ")") else paste0("'", as.character(enrmon), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    fields <- c(fields, "hlthplan")
    values <- c(values, if (is.null(hlthplan)) "NULL" else if (is(hlthplan, "subQuery")) paste0("(", as.character(hlthplan), ")") else paste0("'", as.character(hlthplan), "'"))
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    fields <- c(fields, "indstry")
    values <- c(values, if (is.null(indstry)) "NULL" else if (is(indstry, "subQuery")) paste0("(", as.character(indstry), ")") else paste0("'", as.character(indstry), "'"))
  }

  if (missing(memday1)) {
    memday1 <- defaults$memday1
  }
  if (!is.null(memday1)) {
    fields <- c(fields, "memday1")
    values <- c(values, if (is.null(memday1)) "NULL" else if (is(memday1, "subQuery")) paste0("(", as.character(memday1), ")") else paste0("'", as.character(memday1), "'"))
  }

  if (missing(memday10)) {
    memday10 <- defaults$memday10
  }
  if (!is.null(memday10)) {
    fields <- c(fields, "memday10")
    values <- c(values, if (is.null(memday10)) "NULL" else if (is(memday10, "subQuery")) paste0("(", as.character(memday10), ")") else paste0("'", as.character(memday10), "'"))
  }

  if (missing(memday11)) {
    memday11 <- defaults$memday11
  }
  if (!is.null(memday11)) {
    fields <- c(fields, "memday11")
    values <- c(values, if (is.null(memday11)) "NULL" else if (is(memday11, "subQuery")) paste0("(", as.character(memday11), ")") else paste0("'", as.character(memday11), "'"))
  }

  if (missing(memday12)) {
    memday12 <- defaults$memday12
  }
  if (!is.null(memday12)) {
    fields <- c(fields, "memday12")
    values <- c(values, if (is.null(memday12)) "NULL" else if (is(memday12, "subQuery")) paste0("(", as.character(memday12), ")") else paste0("'", as.character(memday12), "'"))
  }

  if (missing(memday2)) {
    memday2 <- defaults$memday2
  }
  if (!is.null(memday2)) {
    fields <- c(fields, "memday2")
    values <- c(values, if (is.null(memday2)) "NULL" else if (is(memday2, "subQuery")) paste0("(", as.character(memday2), ")") else paste0("'", as.character(memday2), "'"))
  }

  if (missing(memday3)) {
    memday3 <- defaults$memday3
  }
  if (!is.null(memday3)) {
    fields <- c(fields, "memday3")
    values <- c(values, if (is.null(memday3)) "NULL" else if (is(memday3, "subQuery")) paste0("(", as.character(memday3), ")") else paste0("'", as.character(memday3), "'"))
  }

  if (missing(memday4)) {
    memday4 <- defaults$memday4
  }
  if (!is.null(memday4)) {
    fields <- c(fields, "memday4")
    values <- c(values, if (is.null(memday4)) "NULL" else if (is(memday4, "subQuery")) paste0("(", as.character(memday4), ")") else paste0("'", as.character(memday4), "'"))
  }

  if (missing(memday5)) {
    memday5 <- defaults$memday5
  }
  if (!is.null(memday5)) {
    fields <- c(fields, "memday5")
    values <- c(values, if (is.null(memday5)) "NULL" else if (is(memday5, "subQuery")) paste0("(", as.character(memday5), ")") else paste0("'", as.character(memday5), "'"))
  }

  if (missing(memday6)) {
    memday6 <- defaults$memday6
  }
  if (!is.null(memday6)) {
    fields <- c(fields, "memday6")
    values <- c(values, if (is.null(memday6)) "NULL" else if (is(memday6, "subQuery")) paste0("(", as.character(memday6), ")") else paste0("'", as.character(memday6), "'"))
  }

  if (missing(memday7)) {
    memday7 <- defaults$memday7
  }
  if (!is.null(memday7)) {
    fields <- c(fields, "memday7")
    values <- c(values, if (is.null(memday7)) "NULL" else if (is(memday7, "subQuery")) paste0("(", as.character(memday7), ")") else paste0("'", as.character(memday7), "'"))
  }

  if (missing(memday8)) {
    memday8 <- defaults$memday8
  }
  if (!is.null(memday8)) {
    fields <- c(fields, "memday8")
    values <- c(values, if (is.null(memday8)) "NULL" else if (is(memday8, "subQuery")) paste0("(", as.character(memday8), ")") else paste0("'", as.character(memday8), "'"))
  }

  if (missing(memday9)) {
    memday9 <- defaults$memday9
  }
  if (!is.null(memday9)) {
    fields <- c(fields, "memday9")
    values <- c(values, if (is.null(memday9)) "NULL" else if (is(memday9, "subQuery")) paste0("(", as.character(memday9), ")") else paste0("'", as.character(memday9), "'"))
  }

  if (missing(memdays)) {
    memdays <- defaults$memdays
  }
  if (!is.null(memdays)) {
    fields <- c(fields, "memdays")
    values <- c(values, if (is.null(memdays)) "NULL" else if (is(memdays, "subQuery")) paste0("(", as.character(memdays), ")") else paste0("'", as.character(memdays), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    fields <- c(fields, "msa")
    values <- c(values, if (is.null(msa)) "NULL" else if (is(msa, "subQuery")) paste0("(", as.character(msa), ")") else paste0("'", as.character(msa), "'"))
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    fields <- c(fields, "phyflag")
    values <- c(values, if (is.null(phyflag)) "NULL" else if (is(phyflag, "subQuery")) paste0("(", as.character(phyflag), ")") else paste0("'", as.character(phyflag), "'"))
  }

  if (missing(plnkey1)) {
    plnkey1 <- defaults$plnkey1
  }
  if (!is.null(plnkey1)) {
    fields <- c(fields, "plnkey1")
    values <- c(values, if (is.null(plnkey1)) "NULL" else if (is(plnkey1, "subQuery")) paste0("(", as.character(plnkey1), ")") else paste0("'", as.character(plnkey1), "'"))
  }

  if (missing(plnkey10)) {
    plnkey10 <- defaults$plnkey10
  }
  if (!is.null(plnkey10)) {
    fields <- c(fields, "plnkey10")
    values <- c(values, if (is.null(plnkey10)) "NULL" else if (is(plnkey10, "subQuery")) paste0("(", as.character(plnkey10), ")") else paste0("'", as.character(plnkey10), "'"))
  }

  if (missing(plnkey11)) {
    plnkey11 <- defaults$plnkey11
  }
  if (!is.null(plnkey11)) {
    fields <- c(fields, "plnkey11")
    values <- c(values, if (is.null(plnkey11)) "NULL" else if (is(plnkey11, "subQuery")) paste0("(", as.character(plnkey11), ")") else paste0("'", as.character(plnkey11), "'"))
  }

  if (missing(plnkey12)) {
    plnkey12 <- defaults$plnkey12
  }
  if (!is.null(plnkey12)) {
    fields <- c(fields, "plnkey12")
    values <- c(values, if (is.null(plnkey12)) "NULL" else if (is(plnkey12, "subQuery")) paste0("(", as.character(plnkey12), ")") else paste0("'", as.character(plnkey12), "'"))
  }

  if (missing(plnkey2)) {
    plnkey2 <- defaults$plnkey2
  }
  if (!is.null(plnkey2)) {
    fields <- c(fields, "plnkey2")
    values <- c(values, if (is.null(plnkey2)) "NULL" else if (is(plnkey2, "subQuery")) paste0("(", as.character(plnkey2), ")") else paste0("'", as.character(plnkey2), "'"))
  }

  if (missing(plnkey3)) {
    plnkey3 <- defaults$plnkey3
  }
  if (!is.null(plnkey3)) {
    fields <- c(fields, "plnkey3")
    values <- c(values, if (is.null(plnkey3)) "NULL" else if (is(plnkey3, "subQuery")) paste0("(", as.character(plnkey3), ")") else paste0("'", as.character(plnkey3), "'"))
  }

  if (missing(plnkey4)) {
    plnkey4 <- defaults$plnkey4
  }
  if (!is.null(plnkey4)) {
    fields <- c(fields, "plnkey4")
    values <- c(values, if (is.null(plnkey4)) "NULL" else if (is(plnkey4, "subQuery")) paste0("(", as.character(plnkey4), ")") else paste0("'", as.character(plnkey4), "'"))
  }

  if (missing(plnkey5)) {
    plnkey5 <- defaults$plnkey5
  }
  if (!is.null(plnkey5)) {
    fields <- c(fields, "plnkey5")
    values <- c(values, if (is.null(plnkey5)) "NULL" else if (is(plnkey5, "subQuery")) paste0("(", as.character(plnkey5), ")") else paste0("'", as.character(plnkey5), "'"))
  }

  if (missing(plnkey6)) {
    plnkey6 <- defaults$plnkey6
  }
  if (!is.null(plnkey6)) {
    fields <- c(fields, "plnkey6")
    values <- c(values, if (is.null(plnkey6)) "NULL" else if (is(plnkey6, "subQuery")) paste0("(", as.character(plnkey6), ")") else paste0("'", as.character(plnkey6), "'"))
  }

  if (missing(plnkey7)) {
    plnkey7 <- defaults$plnkey7
  }
  if (!is.null(plnkey7)) {
    fields <- c(fields, "plnkey7")
    values <- c(values, if (is.null(plnkey7)) "NULL" else if (is(plnkey7, "subQuery")) paste0("(", as.character(plnkey7), ")") else paste0("'", as.character(plnkey7), "'"))
  }

  if (missing(plnkey8)) {
    plnkey8 <- defaults$plnkey8
  }
  if (!is.null(plnkey8)) {
    fields <- c(fields, "plnkey8")
    values <- c(values, if (is.null(plnkey8)) "NULL" else if (is(plnkey8, "subQuery")) paste0("(", as.character(plnkey8), ")") else paste0("'", as.character(plnkey8), "'"))
  }

  if (missing(plnkey9)) {
    plnkey9 <- defaults$plnkey9
  }
  if (!is.null(plnkey9)) {
    fields <- c(fields, "plnkey9")
    values <- c(values, if (is.null(plnkey9)) "NULL" else if (is(plnkey9, "subQuery")) paste0("(", as.character(plnkey9), ")") else paste0("'", as.character(plnkey9), "'"))
  }

  if (missing(plntyp1)) {
    plntyp1 <- defaults$plntyp1
  }
  if (!is.null(plntyp1)) {
    fields <- c(fields, "plntyp1")
    values <- c(values, if (is.null(plntyp1)) "NULL" else if (is(plntyp1, "subQuery")) paste0("(", as.character(plntyp1), ")") else paste0("'", as.character(plntyp1), "'"))
  }

  if (missing(plntyp10)) {
    plntyp10 <- defaults$plntyp10
  }
  if (!is.null(plntyp10)) {
    fields <- c(fields, "plntyp10")
    values <- c(values, if (is.null(plntyp10)) "NULL" else if (is(plntyp10, "subQuery")) paste0("(", as.character(plntyp10), ")") else paste0("'", as.character(plntyp10), "'"))
  }

  if (missing(plntyp11)) {
    plntyp11 <- defaults$plntyp11
  }
  if (!is.null(plntyp11)) {
    fields <- c(fields, "plntyp11")
    values <- c(values, if (is.null(plntyp11)) "NULL" else if (is(plntyp11, "subQuery")) paste0("(", as.character(plntyp11), ")") else paste0("'", as.character(plntyp11), "'"))
  }

  if (missing(plntyp12)) {
    plntyp12 <- defaults$plntyp12
  }
  if (!is.null(plntyp12)) {
    fields <- c(fields, "plntyp12")
    values <- c(values, if (is.null(plntyp12)) "NULL" else if (is(plntyp12, "subQuery")) paste0("(", as.character(plntyp12), ")") else paste0("'", as.character(plntyp12), "'"))
  }

  if (missing(plntyp2)) {
    plntyp2 <- defaults$plntyp2
  }
  if (!is.null(plntyp2)) {
    fields <- c(fields, "plntyp2")
    values <- c(values, if (is.null(plntyp2)) "NULL" else if (is(plntyp2, "subQuery")) paste0("(", as.character(plntyp2), ")") else paste0("'", as.character(plntyp2), "'"))
  }

  if (missing(plntyp3)) {
    plntyp3 <- defaults$plntyp3
  }
  if (!is.null(plntyp3)) {
    fields <- c(fields, "plntyp3")
    values <- c(values, if (is.null(plntyp3)) "NULL" else if (is(plntyp3, "subQuery")) paste0("(", as.character(plntyp3), ")") else paste0("'", as.character(plntyp3), "'"))
  }

  if (missing(plntyp4)) {
    plntyp4 <- defaults$plntyp4
  }
  if (!is.null(plntyp4)) {
    fields <- c(fields, "plntyp4")
    values <- c(values, if (is.null(plntyp4)) "NULL" else if (is(plntyp4, "subQuery")) paste0("(", as.character(plntyp4), ")") else paste0("'", as.character(plntyp4), "'"))
  }

  if (missing(plntyp5)) {
    plntyp5 <- defaults$plntyp5
  }
  if (!is.null(plntyp5)) {
    fields <- c(fields, "plntyp5")
    values <- c(values, if (is.null(plntyp5)) "NULL" else if (is(plntyp5, "subQuery")) paste0("(", as.character(plntyp5), ")") else paste0("'", as.character(plntyp5), "'"))
  }

  if (missing(plntyp6)) {
    plntyp6 <- defaults$plntyp6
  }
  if (!is.null(plntyp6)) {
    fields <- c(fields, "plntyp6")
    values <- c(values, if (is.null(plntyp6)) "NULL" else if (is(plntyp6, "subQuery")) paste0("(", as.character(plntyp6), ")") else paste0("'", as.character(plntyp6), "'"))
  }

  if (missing(plntyp7)) {
    plntyp7 <- defaults$plntyp7
  }
  if (!is.null(plntyp7)) {
    fields <- c(fields, "plntyp7")
    values <- c(values, if (is.null(plntyp7)) "NULL" else if (is(plntyp7, "subQuery")) paste0("(", as.character(plntyp7), ")") else paste0("'", as.character(plntyp7), "'"))
  }

  if (missing(plntyp8)) {
    plntyp8 <- defaults$plntyp8
  }
  if (!is.null(plntyp8)) {
    fields <- c(fields, "plntyp8")
    values <- c(values, if (is.null(plntyp8)) "NULL" else if (is(plntyp8, "subQuery")) paste0("(", as.character(plntyp8), ")") else paste0("'", as.character(plntyp8), "'"))
  }

  if (missing(plntyp9)) {
    plntyp9 <- defaults$plntyp9
  }
  if (!is.null(plntyp9)) {
    fields <- c(fields, "plntyp9")
    values <- c(values, if (is.null(plntyp9)) "NULL" else if (is(plntyp9, "subQuery")) paste0("(", as.character(plntyp9), ")") else paste0("'", as.character(plntyp9), "'"))
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    fields <- c(fields, "region")
    values <- c(values, if (is.null(region)) "NULL" else if (is(region, "subQuery")) paste0("(", as.character(region), ")") else paste0("'", as.character(region), "'"))
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    fields <- c(fields, "rx")
    values <- c(values, if (is.null(rx)) "NULL" else if (is(rx, "subQuery")) paste0("(", as.character(rx), ")") else paste0("'", as.character(rx), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    fields <- c(fields, "wgtkey")
    values <- c(values, if (is.null(wgtkey)) "NULL" else if (is(wgtkey, "subQuery")) paste0("(", as.character(wgtkey), ")") else paste0("'", as.character(wgtkey), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  if (missing(mswgtkey)) {
    mswgtkey <- defaults$mswgtkey
  }
  if (!is.null(mswgtkey)) {
    fields <- c(fields, "mswgtkey")
    values <- c(values, if (is.null(mswgtkey)) "NULL" else if (is(mswgtkey, "subQuery")) paste0("(", as.character(mswgtkey), ")") else paste0("'", as.character(mswgtkey), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "enrollment_summary", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_facility_header <- function(flag, age, agegrp, billtyp, cap_svc, caseid, cob, coins, copay, datatyp, deduct, dobyr, dstatus, dx1, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pddate, phyflag, plankey, plantyp, poadx1, poadx2, poadx3, poadx4, poadx5, poadx6, poadx7, poadx8, poadx9, proc1, proc2, proc3, proc4, proc5, proc6, provid, region, rx, seqnum, sex, stdplac, stdprov, svcdate, tsvcdat, version, wgtkey, year, msclmid, npi) {
  defaults <- get('facility_header', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(flag)) {
    flag <- defaults$flag
  }
  if (!is.null(flag)) {
    fields <- c(fields, "_flag")
    values <- c(values, if (is.null(flag)) "NULL" else if (is(flag, "subQuery")) paste0("(", as.character(flag), ")") else paste0("'", as.character(flag), "'"))
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    fields <- c(fields, "age")
    values <- c(values, if (is.null(age)) "NULL" else if (is(age, "subQuery")) paste0("(", as.character(age), ")") else paste0("'", as.character(age), "'"))
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    fields <- c(fields, "agegrp")
    values <- c(values, if (is.null(agegrp)) "NULL" else if (is(agegrp, "subQuery")) paste0("(", as.character(agegrp), ")") else paste0("'", as.character(agegrp), "'"))
  }

  if (missing(billtyp)) {
    billtyp <- defaults$billtyp
  }
  if (!is.null(billtyp)) {
    fields <- c(fields, "billtyp")
    values <- c(values, if (is.null(billtyp)) "NULL" else if (is(billtyp, "subQuery")) paste0("(", as.character(billtyp), ")") else paste0("'", as.character(billtyp), "'"))
  }

  if (missing(cap_svc)) {
    cap_svc <- defaults$cap_svc
  }
  if (!is.null(cap_svc)) {
    fields <- c(fields, "cap_svc")
    values <- c(values, if (is.null(cap_svc)) "NULL" else if (is(cap_svc, "subQuery")) paste0("(", as.character(cap_svc), ")") else paste0("'", as.character(cap_svc), "'"))
  }

  if (missing(caseid)) {
    caseid <- defaults$caseid
  }
  if (!is.null(caseid)) {
    fields <- c(fields, "caseid")
    values <- c(values, if (is.null(caseid)) "NULL" else if (is(caseid, "subQuery")) paste0("(", as.character(caseid), ")") else paste0("'", as.character(caseid), "'"))
  }

  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    fields <- c(fields, "cob")
    values <- c(values, if (is.null(cob)) "NULL" else if (is(cob, "subQuery")) paste0("(", as.character(cob), ")") else paste0("'", as.character(cob), "'"))
  }

  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    fields <- c(fields, "coins")
    values <- c(values, if (is.null(coins)) "NULL" else if (is(coins, "subQuery")) paste0("(", as.character(coins), ")") else paste0("'", as.character(coins), "'"))
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    fields <- c(fields, "copay")
    values <- c(values, if (is.null(copay)) "NULL" else if (is(copay, "subQuery")) paste0("(", as.character(copay), ")") else paste0("'", as.character(copay), "'"))
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    fields <- c(fields, "datatyp")
    values <- c(values, if (is.null(datatyp)) "NULL" else if (is(datatyp, "subQuery")) paste0("(", as.character(datatyp), ")") else paste0("'", as.character(datatyp), "'"))
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    fields <- c(fields, "deduct")
    values <- c(values, if (is.null(deduct)) "NULL" else if (is(deduct, "subQuery")) paste0("(", as.character(deduct), ")") else paste0("'", as.character(deduct), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    fields <- c(fields, "dstatus")
    values <- c(values, if (is.null(dstatus)) "NULL" else if (is(dstatus, "subQuery")) paste0("(", as.character(dstatus), ")") else paste0("'", as.character(dstatus), "'"))
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    fields <- c(fields, "dx1")
    values <- c(values, if (is.null(dx1)) "NULL" else if (is(dx1, "subQuery")) paste0("(", as.character(dx1), ")") else paste0("'", as.character(dx1), "'"))
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    fields <- c(fields, "dx2")
    values <- c(values, if (is.null(dx2)) "NULL" else if (is(dx2, "subQuery")) paste0("(", as.character(dx2), ")") else paste0("'", as.character(dx2), "'"))
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    fields <- c(fields, "dx3")
    values <- c(values, if (is.null(dx3)) "NULL" else if (is(dx3, "subQuery")) paste0("(", as.character(dx3), ")") else paste0("'", as.character(dx3), "'"))
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    fields <- c(fields, "dx4")
    values <- c(values, if (is.null(dx4)) "NULL" else if (is(dx4, "subQuery")) paste0("(", as.character(dx4), ")") else paste0("'", as.character(dx4), "'"))
  }

  if (missing(dx5)) {
    dx5 <- defaults$dx5
  }
  if (!is.null(dx5)) {
    fields <- c(fields, "dx5")
    values <- c(values, if (is.null(dx5)) "NULL" else if (is(dx5, "subQuery")) paste0("(", as.character(dx5), ")") else paste0("'", as.character(dx5), "'"))
  }

  if (missing(dx6)) {
    dx6 <- defaults$dx6
  }
  if (!is.null(dx6)) {
    fields <- c(fields, "dx6")
    values <- c(values, if (is.null(dx6)) "NULL" else if (is(dx6, "subQuery")) paste0("(", as.character(dx6), ")") else paste0("'", as.character(dx6), "'"))
  }

  if (missing(dx7)) {
    dx7 <- defaults$dx7
  }
  if (!is.null(dx7)) {
    fields <- c(fields, "dx7")
    values <- c(values, if (is.null(dx7)) "NULL" else if (is(dx7, "subQuery")) paste0("(", as.character(dx7), ")") else paste0("'", as.character(dx7), "'"))
  }

  if (missing(dx8)) {
    dx8 <- defaults$dx8
  }
  if (!is.null(dx8)) {
    fields <- c(fields, "dx8")
    values <- c(values, if (is.null(dx8)) "NULL" else if (is(dx8, "subQuery")) paste0("(", as.character(dx8), ")") else paste0("'", as.character(dx8), "'"))
  }

  if (missing(dx9)) {
    dx9 <- defaults$dx9
  }
  if (!is.null(dx9)) {
    fields <- c(fields, "dx9")
    values <- c(values, if (is.null(dx9)) "NULL" else if (is(dx9, "subQuery")) paste0("(", as.character(dx9), ")") else paste0("'", as.character(dx9), "'"))
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    fields <- c(fields, "dxver")
    values <- c(values, if (is.null(dxver)) "NULL" else if (is(dxver, "subQuery")) paste0("(", as.character(dxver), ")") else paste0("'", as.character(dxver), "'"))
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    fields <- c(fields, "eeclass")
    values <- c(values, if (is.null(eeclass)) "NULL" else if (is(eeclass, "subQuery")) paste0("(", as.character(eeclass), ")") else paste0("'", as.character(eeclass), "'"))
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    fields <- c(fields, "eestatu")
    values <- c(values, if (is.null(eestatu)) "NULL" else if (is(eestatu, "subQuery")) paste0("(", as.character(eestatu), ")") else paste0("'", as.character(eestatu), "'"))
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    fields <- c(fields, "efamid")
    values <- c(values, if (is.null(efamid)) "NULL" else if (is(efamid, "subQuery")) paste0("(", as.character(efamid), ")") else paste0("'", as.character(efamid), "'"))
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    fields <- c(fields, "egeoloc")
    values <- c(values, if (is.null(egeoloc)) "NULL" else if (is(egeoloc, "subQuery")) paste0("(", as.character(egeoloc), ")") else paste0("'", as.character(egeoloc), "'"))
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    fields <- c(fields, "eidflag")
    values <- c(values, if (is.null(eidflag)) "NULL" else if (is(eidflag, "subQuery")) paste0("(", as.character(eidflag), ")") else paste0("'", as.character(eidflag), "'"))
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    fields <- c(fields, "emprel")
    values <- c(values, if (is.null(emprel)) "NULL" else if (is(emprel, "subQuery")) paste0("(", as.character(emprel), ")") else paste0("'", as.character(emprel), "'"))
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    fields <- c(fields, "enrflag")
    values <- c(values, if (is.null(enrflag)) "NULL" else if (is(enrflag, "subQuery")) paste0("(", as.character(enrflag), ")") else paste0("'", as.character(enrflag), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(fachdid)) {
    fachdid <- defaults$fachdid
  }
  if (!is.null(fachdid)) {
    fields <- c(fields, "fachdid")
    values <- c(values, if (is.null(fachdid)) "NULL" else if (is(fachdid, "subQuery")) paste0("(", as.character(fachdid), ")") else paste0("'", as.character(fachdid), "'"))
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    fields <- c(fields, "hlthplan")
    values <- c(values, if (is.null(hlthplan)) "NULL" else if (is(hlthplan, "subQuery")) paste0("(", as.character(hlthplan), ")") else paste0("'", as.character(hlthplan), "'"))
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    fields <- c(fields, "indstry")
    values <- c(values, if (is.null(indstry)) "NULL" else if (is(indstry, "subQuery")) paste0("(", as.character(indstry), ")") else paste0("'", as.character(indstry), "'"))
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    fields <- c(fields, "mdc")
    values <- c(values, if (is.null(mdc)) "NULL" else if (is(mdc, "subQuery")) paste0("(", as.character(mdc), ")") else paste0("'", as.character(mdc), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    fields <- c(fields, "msa")
    values <- c(values, if (is.null(msa)) "NULL" else if (is(msa, "subQuery")) paste0("(", as.character(msa), ")") else paste0("'", as.character(msa), "'"))
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    fields <- c(fields, "netpay")
    values <- c(values, if (is.null(netpay)) "NULL" else if (is(netpay, "subQuery")) paste0("(", as.character(netpay), ")") else paste0("'", as.character(netpay), "'"))
  }

  if (missing(ntwkprov)) {
    ntwkprov <- defaults$ntwkprov
  }
  if (!is.null(ntwkprov)) {
    fields <- c(fields, "ntwkprov")
    values <- c(values, if (is.null(ntwkprov)) "NULL" else if (is(ntwkprov, "subQuery")) paste0("(", as.character(ntwkprov), ")") else paste0("'", as.character(ntwkprov), "'"))
  }

  if (missing(paidntwk)) {
    paidntwk <- defaults$paidntwk
  }
  if (!is.null(paidntwk)) {
    fields <- c(fields, "paidntwk")
    values <- c(values, if (is.null(paidntwk)) "NULL" else if (is(paidntwk, "subQuery")) paste0("(", as.character(paidntwk), ")") else paste0("'", as.character(paidntwk), "'"))
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    fields <- c(fields, "pddate")
    values <- c(values, if (is.null(pddate)) "NULL" else if (is(pddate, "subQuery")) paste0("(", as.character(pddate), ")") else paste0("'", as.character(pddate), "'"))
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    fields <- c(fields, "phyflag")
    values <- c(values, if (is.null(phyflag)) "NULL" else if (is(phyflag, "subQuery")) paste0("(", as.character(phyflag), ")") else paste0("'", as.character(phyflag), "'"))
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    fields <- c(fields, "plankey")
    values <- c(values, if (is.null(plankey)) "NULL" else if (is(plankey, "subQuery")) paste0("(", as.character(plankey), ")") else paste0("'", as.character(plankey), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(poadx1)) {
    poadx1 <- defaults$poadx1
  }
  if (!is.null(poadx1)) {
    fields <- c(fields, "poadx1")
    values <- c(values, if (is.null(poadx1)) "NULL" else if (is(poadx1, "subQuery")) paste0("(", as.character(poadx1), ")") else paste0("'", as.character(poadx1), "'"))
  }

  if (missing(poadx2)) {
    poadx2 <- defaults$poadx2
  }
  if (!is.null(poadx2)) {
    fields <- c(fields, "poadx2")
    values <- c(values, if (is.null(poadx2)) "NULL" else if (is(poadx2, "subQuery")) paste0("(", as.character(poadx2), ")") else paste0("'", as.character(poadx2), "'"))
  }

  if (missing(poadx3)) {
    poadx3 <- defaults$poadx3
  }
  if (!is.null(poadx3)) {
    fields <- c(fields, "poadx3")
    values <- c(values, if (is.null(poadx3)) "NULL" else if (is(poadx3, "subQuery")) paste0("(", as.character(poadx3), ")") else paste0("'", as.character(poadx3), "'"))
  }

  if (missing(poadx4)) {
    poadx4 <- defaults$poadx4
  }
  if (!is.null(poadx4)) {
    fields <- c(fields, "poadx4")
    values <- c(values, if (is.null(poadx4)) "NULL" else if (is(poadx4, "subQuery")) paste0("(", as.character(poadx4), ")") else paste0("'", as.character(poadx4), "'"))
  }

  if (missing(poadx5)) {
    poadx5 <- defaults$poadx5
  }
  if (!is.null(poadx5)) {
    fields <- c(fields, "poadx5")
    values <- c(values, if (is.null(poadx5)) "NULL" else if (is(poadx5, "subQuery")) paste0("(", as.character(poadx5), ")") else paste0("'", as.character(poadx5), "'"))
  }

  if (missing(poadx6)) {
    poadx6 <- defaults$poadx6
  }
  if (!is.null(poadx6)) {
    fields <- c(fields, "poadx6")
    values <- c(values, if (is.null(poadx6)) "NULL" else if (is(poadx6, "subQuery")) paste0("(", as.character(poadx6), ")") else paste0("'", as.character(poadx6), "'"))
  }

  if (missing(poadx7)) {
    poadx7 <- defaults$poadx7
  }
  if (!is.null(poadx7)) {
    fields <- c(fields, "poadx7")
    values <- c(values, if (is.null(poadx7)) "NULL" else if (is(poadx7, "subQuery")) paste0("(", as.character(poadx7), ")") else paste0("'", as.character(poadx7), "'"))
  }

  if (missing(poadx8)) {
    poadx8 <- defaults$poadx8
  }
  if (!is.null(poadx8)) {
    fields <- c(fields, "poadx8")
    values <- c(values, if (is.null(poadx8)) "NULL" else if (is(poadx8, "subQuery")) paste0("(", as.character(poadx8), ")") else paste0("'", as.character(poadx8), "'"))
  }

  if (missing(poadx9)) {
    poadx9 <- defaults$poadx9
  }
  if (!is.null(poadx9)) {
    fields <- c(fields, "poadx9")
    values <- c(values, if (is.null(poadx9)) "NULL" else if (is(poadx9, "subQuery")) paste0("(", as.character(poadx9), ")") else paste0("'", as.character(poadx9), "'"))
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    fields <- c(fields, "proc1")
    values <- c(values, if (is.null(proc1)) "NULL" else if (is(proc1, "subQuery")) paste0("(", as.character(proc1), ")") else paste0("'", as.character(proc1), "'"))
  }

  if (missing(proc2)) {
    proc2 <- defaults$proc2
  }
  if (!is.null(proc2)) {
    fields <- c(fields, "proc2")
    values <- c(values, if (is.null(proc2)) "NULL" else if (is(proc2, "subQuery")) paste0("(", as.character(proc2), ")") else paste0("'", as.character(proc2), "'"))
  }

  if (missing(proc3)) {
    proc3 <- defaults$proc3
  }
  if (!is.null(proc3)) {
    fields <- c(fields, "proc3")
    values <- c(values, if (is.null(proc3)) "NULL" else if (is(proc3, "subQuery")) paste0("(", as.character(proc3), ")") else paste0("'", as.character(proc3), "'"))
  }

  if (missing(proc4)) {
    proc4 <- defaults$proc4
  }
  if (!is.null(proc4)) {
    fields <- c(fields, "proc4")
    values <- c(values, if (is.null(proc4)) "NULL" else if (is(proc4, "subQuery")) paste0("(", as.character(proc4), ")") else paste0("'", as.character(proc4), "'"))
  }

  if (missing(proc5)) {
    proc5 <- defaults$proc5
  }
  if (!is.null(proc5)) {
    fields <- c(fields, "proc5")
    values <- c(values, if (is.null(proc5)) "NULL" else if (is(proc5, "subQuery")) paste0("(", as.character(proc5), ")") else paste0("'", as.character(proc5), "'"))
  }

  if (missing(proc6)) {
    proc6 <- defaults$proc6
  }
  if (!is.null(proc6)) {
    fields <- c(fields, "proc6")
    values <- c(values, if (is.null(proc6)) "NULL" else if (is(proc6, "subQuery")) paste0("(", as.character(proc6), ")") else paste0("'", as.character(proc6), "'"))
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    fields <- c(fields, "provid")
    values <- c(values, if (is.null(provid)) "NULL" else if (is(provid, "subQuery")) paste0("(", as.character(provid), ")") else paste0("'", as.character(provid), "'"))
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    fields <- c(fields, "region")
    values <- c(values, if (is.null(region)) "NULL" else if (is(region, "subQuery")) paste0("(", as.character(region), ")") else paste0("'", as.character(region), "'"))
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    fields <- c(fields, "rx")
    values <- c(values, if (is.null(rx)) "NULL" else if (is(rx, "subQuery")) paste0("(", as.character(rx), ")") else paste0("'", as.character(rx), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    fields <- c(fields, "stdplac")
    values <- c(values, if (is.null(stdplac)) "NULL" else if (is(stdplac, "subQuery")) paste0("(", as.character(stdplac), ")") else paste0("'", as.character(stdplac), "'"))
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    fields <- c(fields, "stdprov")
    values <- c(values, if (is.null(stdprov)) "NULL" else if (is(stdprov, "subQuery")) paste0("(", as.character(stdprov), ")") else paste0("'", as.character(stdprov), "'"))
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    fields <- c(fields, "svcdate")
    values <- c(values, if (is.null(svcdate)) "NULL" else if (is(svcdate, "subQuery")) paste0("(", as.character(svcdate), ")") else paste0("'", as.character(svcdate), "'"))
  }

  if (missing(tsvcdat)) {
    tsvcdat <- defaults$tsvcdat
  }
  if (!is.null(tsvcdat)) {
    fields <- c(fields, "tsvcdat")
    values <- c(values, if (is.null(tsvcdat)) "NULL" else if (is(tsvcdat, "subQuery")) paste0("(", as.character(tsvcdat), ")") else paste0("'", as.character(tsvcdat), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    fields <- c(fields, "wgtkey")
    values <- c(values, if (is.null(wgtkey)) "NULL" else if (is(wgtkey, "subQuery")) paste0("(", as.character(wgtkey), ")") else paste0("'", as.character(wgtkey), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  if (missing(msclmid)) {
    msclmid <- defaults$msclmid
  }
  if (!is.null(msclmid)) {
    fields <- c(fields, "msclmid")
    values <- c(values, if (is.null(msclmid)) "NULL" else if (is(msclmid, "subQuery")) paste0("(", as.character(msclmid), ")") else paste0("'", as.character(msclmid), "'"))
  }

  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "facility_header", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_health_risk_assessment <- function(flag, alc_amt, alcdyamt, alcweek, bmi, cc_allergy, cc_arthritis, cc_asthma, cc_backpain, cc_chf, cc_depress, cc_diab, cc_heartdis, cc_highbp, cc_highcol, cc_hrtburn, cc_lungdis, cc_migraine, cc_nonskincan, cc_osteopo, cc_skincan, cgramt, cgrcurr, cgrdur, cgrprev, cgrqtyr, cgrquit, cgtamt, cgtcurr, cgtdur, cgtpkamt, cgtprev, cgtqtcat, cgtqtyr, cgtquit, chewamt, chewcurr, chewdur, chewprev, chewqtyr, chewquit, cholestr, copestrs, diast_bp, dietfrt, dietfrvg, dietveg, dobyr, drnkdrv, educ_lvl, efamid, enrolid, exermo, exerweek, famabscat12, fireext, flu_shot, glucose, hdl, height, hlthplan, hltimpct, job_sat, ldl, life_sat, liftwgt, mh_freq, mh_prob, pipeamt, pipecurr, pipedur, pipeprev, pipeqtyr, pipequit, planalc, plandiet, plandrad, planexer, planslp, planstrs, plantob, planwgt, prev_mammo, prev_paptest, prev_prostex, prev_sigmoid, prodabscat, risk_alc, risk_bp, risk_chol, risk_exer, risk_gluc, risk_mh, risk_nutr, risk_safe, risk_sleep, risk_smok, risk_wgt, seatbelt, selfhlth, seqnum, sex, sleep_hr, slpapnea, slpprob, smkdetect, stretch, survdate, systo_bp, tobcurr, tobprev, triglycd, version, weight, workabs, wrkabscat, wrkabscat12, year) {
  defaults <- get('health_risk_assessment', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(flag)) {
    flag <- defaults$flag
  }
  if (!is.null(flag)) {
    fields <- c(fields, "_flag")
    values <- c(values, if (is.null(flag)) "NULL" else if (is(flag, "subQuery")) paste0("(", as.character(flag), ")") else paste0("'", as.character(flag), "'"))
  }

  if (missing(alc_amt)) {
    alc_amt <- defaults$alc_amt
  }
  if (!is.null(alc_amt)) {
    fields <- c(fields, "alc_amt")
    values <- c(values, if (is.null(alc_amt)) "NULL" else if (is(alc_amt, "subQuery")) paste0("(", as.character(alc_amt), ")") else paste0("'", as.character(alc_amt), "'"))
  }

  if (missing(alcdyamt)) {
    alcdyamt <- defaults$alcdyamt
  }
  if (!is.null(alcdyamt)) {
    fields <- c(fields, "alcdyamt")
    values <- c(values, if (is.null(alcdyamt)) "NULL" else if (is(alcdyamt, "subQuery")) paste0("(", as.character(alcdyamt), ")") else paste0("'", as.character(alcdyamt), "'"))
  }

  if (missing(alcweek)) {
    alcweek <- defaults$alcweek
  }
  if (!is.null(alcweek)) {
    fields <- c(fields, "alcweek")
    values <- c(values, if (is.null(alcweek)) "NULL" else if (is(alcweek, "subQuery")) paste0("(", as.character(alcweek), ")") else paste0("'", as.character(alcweek), "'"))
  }

  if (missing(bmi)) {
    bmi <- defaults$bmi
  }
  if (!is.null(bmi)) {
    fields <- c(fields, "bmi")
    values <- c(values, if (is.null(bmi)) "NULL" else if (is(bmi, "subQuery")) paste0("(", as.character(bmi), ")") else paste0("'", as.character(bmi), "'"))
  }

  if (missing(cc_allergy)) {
    cc_allergy <- defaults$cc_allergy
  }
  if (!is.null(cc_allergy)) {
    fields <- c(fields, "cc_allergy")
    values <- c(values, if (is.null(cc_allergy)) "NULL" else if (is(cc_allergy, "subQuery")) paste0("(", as.character(cc_allergy), ")") else paste0("'", as.character(cc_allergy), "'"))
  }

  if (missing(cc_arthritis)) {
    cc_arthritis <- defaults$cc_arthritis
  }
  if (!is.null(cc_arthritis)) {
    fields <- c(fields, "cc_arthritis")
    values <- c(values, if (is.null(cc_arthritis)) "NULL" else if (is(cc_arthritis, "subQuery")) paste0("(", as.character(cc_arthritis), ")") else paste0("'", as.character(cc_arthritis), "'"))
  }

  if (missing(cc_asthma)) {
    cc_asthma <- defaults$cc_asthma
  }
  if (!is.null(cc_asthma)) {
    fields <- c(fields, "cc_asthma")
    values <- c(values, if (is.null(cc_asthma)) "NULL" else if (is(cc_asthma, "subQuery")) paste0("(", as.character(cc_asthma), ")") else paste0("'", as.character(cc_asthma), "'"))
  }

  if (missing(cc_backpain)) {
    cc_backpain <- defaults$cc_backpain
  }
  if (!is.null(cc_backpain)) {
    fields <- c(fields, "cc_backpain")
    values <- c(values, if (is.null(cc_backpain)) "NULL" else if (is(cc_backpain, "subQuery")) paste0("(", as.character(cc_backpain), ")") else paste0("'", as.character(cc_backpain), "'"))
  }

  if (missing(cc_chf)) {
    cc_chf <- defaults$cc_chf
  }
  if (!is.null(cc_chf)) {
    fields <- c(fields, "cc_chf")
    values <- c(values, if (is.null(cc_chf)) "NULL" else if (is(cc_chf, "subQuery")) paste0("(", as.character(cc_chf), ")") else paste0("'", as.character(cc_chf), "'"))
  }

  if (missing(cc_depress)) {
    cc_depress <- defaults$cc_depress
  }
  if (!is.null(cc_depress)) {
    fields <- c(fields, "cc_depress")
    values <- c(values, if (is.null(cc_depress)) "NULL" else if (is(cc_depress, "subQuery")) paste0("(", as.character(cc_depress), ")") else paste0("'", as.character(cc_depress), "'"))
  }

  if (missing(cc_diab)) {
    cc_diab <- defaults$cc_diab
  }
  if (!is.null(cc_diab)) {
    fields <- c(fields, "cc_diab")
    values <- c(values, if (is.null(cc_diab)) "NULL" else if (is(cc_diab, "subQuery")) paste0("(", as.character(cc_diab), ")") else paste0("'", as.character(cc_diab), "'"))
  }

  if (missing(cc_heartdis)) {
    cc_heartdis <- defaults$cc_heartdis
  }
  if (!is.null(cc_heartdis)) {
    fields <- c(fields, "cc_heartdis")
    values <- c(values, if (is.null(cc_heartdis)) "NULL" else if (is(cc_heartdis, "subQuery")) paste0("(", as.character(cc_heartdis), ")") else paste0("'", as.character(cc_heartdis), "'"))
  }

  if (missing(cc_highbp)) {
    cc_highbp <- defaults$cc_highbp
  }
  if (!is.null(cc_highbp)) {
    fields <- c(fields, "cc_highbp")
    values <- c(values, if (is.null(cc_highbp)) "NULL" else if (is(cc_highbp, "subQuery")) paste0("(", as.character(cc_highbp), ")") else paste0("'", as.character(cc_highbp), "'"))
  }

  if (missing(cc_highcol)) {
    cc_highcol <- defaults$cc_highcol
  }
  if (!is.null(cc_highcol)) {
    fields <- c(fields, "cc_highcol")
    values <- c(values, if (is.null(cc_highcol)) "NULL" else if (is(cc_highcol, "subQuery")) paste0("(", as.character(cc_highcol), ")") else paste0("'", as.character(cc_highcol), "'"))
  }

  if (missing(cc_hrtburn)) {
    cc_hrtburn <- defaults$cc_hrtburn
  }
  if (!is.null(cc_hrtburn)) {
    fields <- c(fields, "cc_hrtburn")
    values <- c(values, if (is.null(cc_hrtburn)) "NULL" else if (is(cc_hrtburn, "subQuery")) paste0("(", as.character(cc_hrtburn), ")") else paste0("'", as.character(cc_hrtburn), "'"))
  }

  if (missing(cc_lungdis)) {
    cc_lungdis <- defaults$cc_lungdis
  }
  if (!is.null(cc_lungdis)) {
    fields <- c(fields, "cc_lungdis")
    values <- c(values, if (is.null(cc_lungdis)) "NULL" else if (is(cc_lungdis, "subQuery")) paste0("(", as.character(cc_lungdis), ")") else paste0("'", as.character(cc_lungdis), "'"))
  }

  if (missing(cc_migraine)) {
    cc_migraine <- defaults$cc_migraine
  }
  if (!is.null(cc_migraine)) {
    fields <- c(fields, "cc_migraine")
    values <- c(values, if (is.null(cc_migraine)) "NULL" else if (is(cc_migraine, "subQuery")) paste0("(", as.character(cc_migraine), ")") else paste0("'", as.character(cc_migraine), "'"))
  }

  if (missing(cc_nonskincan)) {
    cc_nonskincan <- defaults$cc_nonskincan
  }
  if (!is.null(cc_nonskincan)) {
    fields <- c(fields, "cc_nonskincan")
    values <- c(values, if (is.null(cc_nonskincan)) "NULL" else if (is(cc_nonskincan, "subQuery")) paste0("(", as.character(cc_nonskincan), ")") else paste0("'", as.character(cc_nonskincan), "'"))
  }

  if (missing(cc_osteopo)) {
    cc_osteopo <- defaults$cc_osteopo
  }
  if (!is.null(cc_osteopo)) {
    fields <- c(fields, "cc_osteopo")
    values <- c(values, if (is.null(cc_osteopo)) "NULL" else if (is(cc_osteopo, "subQuery")) paste0("(", as.character(cc_osteopo), ")") else paste0("'", as.character(cc_osteopo), "'"))
  }

  if (missing(cc_skincan)) {
    cc_skincan <- defaults$cc_skincan
  }
  if (!is.null(cc_skincan)) {
    fields <- c(fields, "cc_skincan")
    values <- c(values, if (is.null(cc_skincan)) "NULL" else if (is(cc_skincan, "subQuery")) paste0("(", as.character(cc_skincan), ")") else paste0("'", as.character(cc_skincan), "'"))
  }

  if (missing(cgramt)) {
    cgramt <- defaults$cgramt
  }
  if (!is.null(cgramt)) {
    fields <- c(fields, "cgramt")
    values <- c(values, if (is.null(cgramt)) "NULL" else if (is(cgramt, "subQuery")) paste0("(", as.character(cgramt), ")") else paste0("'", as.character(cgramt), "'"))
  }

  if (missing(cgrcurr)) {
    cgrcurr <- defaults$cgrcurr
  }
  if (!is.null(cgrcurr)) {
    fields <- c(fields, "cgrcurr")
    values <- c(values, if (is.null(cgrcurr)) "NULL" else if (is(cgrcurr, "subQuery")) paste0("(", as.character(cgrcurr), ")") else paste0("'", as.character(cgrcurr), "'"))
  }

  if (missing(cgrdur)) {
    cgrdur <- defaults$cgrdur
  }
  if (!is.null(cgrdur)) {
    fields <- c(fields, "cgrdur")
    values <- c(values, if (is.null(cgrdur)) "NULL" else if (is(cgrdur, "subQuery")) paste0("(", as.character(cgrdur), ")") else paste0("'", as.character(cgrdur), "'"))
  }

  if (missing(cgrprev)) {
    cgrprev <- defaults$cgrprev
  }
  if (!is.null(cgrprev)) {
    fields <- c(fields, "cgrprev")
    values <- c(values, if (is.null(cgrprev)) "NULL" else if (is(cgrprev, "subQuery")) paste0("(", as.character(cgrprev), ")") else paste0("'", as.character(cgrprev), "'"))
  }

  if (missing(cgrqtyr)) {
    cgrqtyr <- defaults$cgrqtyr
  }
  if (!is.null(cgrqtyr)) {
    fields <- c(fields, "cgrqtyr")
    values <- c(values, if (is.null(cgrqtyr)) "NULL" else if (is(cgrqtyr, "subQuery")) paste0("(", as.character(cgrqtyr), ")") else paste0("'", as.character(cgrqtyr), "'"))
  }

  if (missing(cgrquit)) {
    cgrquit <- defaults$cgrquit
  }
  if (!is.null(cgrquit)) {
    fields <- c(fields, "cgrquit")
    values <- c(values, if (is.null(cgrquit)) "NULL" else if (is(cgrquit, "subQuery")) paste0("(", as.character(cgrquit), ")") else paste0("'", as.character(cgrquit), "'"))
  }

  if (missing(cgtamt)) {
    cgtamt <- defaults$cgtamt
  }
  if (!is.null(cgtamt)) {
    fields <- c(fields, "cgtamt")
    values <- c(values, if (is.null(cgtamt)) "NULL" else if (is(cgtamt, "subQuery")) paste0("(", as.character(cgtamt), ")") else paste0("'", as.character(cgtamt), "'"))
  }

  if (missing(cgtcurr)) {
    cgtcurr <- defaults$cgtcurr
  }
  if (!is.null(cgtcurr)) {
    fields <- c(fields, "cgtcurr")
    values <- c(values, if (is.null(cgtcurr)) "NULL" else if (is(cgtcurr, "subQuery")) paste0("(", as.character(cgtcurr), ")") else paste0("'", as.character(cgtcurr), "'"))
  }

  if (missing(cgtdur)) {
    cgtdur <- defaults$cgtdur
  }
  if (!is.null(cgtdur)) {
    fields <- c(fields, "cgtdur")
    values <- c(values, if (is.null(cgtdur)) "NULL" else if (is(cgtdur, "subQuery")) paste0("(", as.character(cgtdur), ")") else paste0("'", as.character(cgtdur), "'"))
  }

  if (missing(cgtpkamt)) {
    cgtpkamt <- defaults$cgtpkamt
  }
  if (!is.null(cgtpkamt)) {
    fields <- c(fields, "cgtpkamt")
    values <- c(values, if (is.null(cgtpkamt)) "NULL" else if (is(cgtpkamt, "subQuery")) paste0("(", as.character(cgtpkamt), ")") else paste0("'", as.character(cgtpkamt), "'"))
  }

  if (missing(cgtprev)) {
    cgtprev <- defaults$cgtprev
  }
  if (!is.null(cgtprev)) {
    fields <- c(fields, "cgtprev")
    values <- c(values, if (is.null(cgtprev)) "NULL" else if (is(cgtprev, "subQuery")) paste0("(", as.character(cgtprev), ")") else paste0("'", as.character(cgtprev), "'"))
  }

  if (missing(cgtqtcat)) {
    cgtqtcat <- defaults$cgtqtcat
  }
  if (!is.null(cgtqtcat)) {
    fields <- c(fields, "cgtqtcat")
    values <- c(values, if (is.null(cgtqtcat)) "NULL" else if (is(cgtqtcat, "subQuery")) paste0("(", as.character(cgtqtcat), ")") else paste0("'", as.character(cgtqtcat), "'"))
  }

  if (missing(cgtqtyr)) {
    cgtqtyr <- defaults$cgtqtyr
  }
  if (!is.null(cgtqtyr)) {
    fields <- c(fields, "cgtqtyr")
    values <- c(values, if (is.null(cgtqtyr)) "NULL" else if (is(cgtqtyr, "subQuery")) paste0("(", as.character(cgtqtyr), ")") else paste0("'", as.character(cgtqtyr), "'"))
  }

  if (missing(cgtquit)) {
    cgtquit <- defaults$cgtquit
  }
  if (!is.null(cgtquit)) {
    fields <- c(fields, "cgtquit")
    values <- c(values, if (is.null(cgtquit)) "NULL" else if (is(cgtquit, "subQuery")) paste0("(", as.character(cgtquit), ")") else paste0("'", as.character(cgtquit), "'"))
  }

  if (missing(chewamt)) {
    chewamt <- defaults$chewamt
  }
  if (!is.null(chewamt)) {
    fields <- c(fields, "chewamt")
    values <- c(values, if (is.null(chewamt)) "NULL" else if (is(chewamt, "subQuery")) paste0("(", as.character(chewamt), ")") else paste0("'", as.character(chewamt), "'"))
  }

  if (missing(chewcurr)) {
    chewcurr <- defaults$chewcurr
  }
  if (!is.null(chewcurr)) {
    fields <- c(fields, "chewcurr")
    values <- c(values, if (is.null(chewcurr)) "NULL" else if (is(chewcurr, "subQuery")) paste0("(", as.character(chewcurr), ")") else paste0("'", as.character(chewcurr), "'"))
  }

  if (missing(chewdur)) {
    chewdur <- defaults$chewdur
  }
  if (!is.null(chewdur)) {
    fields <- c(fields, "chewdur")
    values <- c(values, if (is.null(chewdur)) "NULL" else if (is(chewdur, "subQuery")) paste0("(", as.character(chewdur), ")") else paste0("'", as.character(chewdur), "'"))
  }

  if (missing(chewprev)) {
    chewprev <- defaults$chewprev
  }
  if (!is.null(chewprev)) {
    fields <- c(fields, "chewprev")
    values <- c(values, if (is.null(chewprev)) "NULL" else if (is(chewprev, "subQuery")) paste0("(", as.character(chewprev), ")") else paste0("'", as.character(chewprev), "'"))
  }

  if (missing(chewqtyr)) {
    chewqtyr <- defaults$chewqtyr
  }
  if (!is.null(chewqtyr)) {
    fields <- c(fields, "chewqtyr")
    values <- c(values, if (is.null(chewqtyr)) "NULL" else if (is(chewqtyr, "subQuery")) paste0("(", as.character(chewqtyr), ")") else paste0("'", as.character(chewqtyr), "'"))
  }

  if (missing(chewquit)) {
    chewquit <- defaults$chewquit
  }
  if (!is.null(chewquit)) {
    fields <- c(fields, "chewquit")
    values <- c(values, if (is.null(chewquit)) "NULL" else if (is(chewquit, "subQuery")) paste0("(", as.character(chewquit), ")") else paste0("'", as.character(chewquit), "'"))
  }

  if (missing(cholestr)) {
    cholestr <- defaults$cholestr
  }
  if (!is.null(cholestr)) {
    fields <- c(fields, "cholestr")
    values <- c(values, if (is.null(cholestr)) "NULL" else if (is(cholestr, "subQuery")) paste0("(", as.character(cholestr), ")") else paste0("'", as.character(cholestr), "'"))
  }

  if (missing(copestrs)) {
    copestrs <- defaults$copestrs
  }
  if (!is.null(copestrs)) {
    fields <- c(fields, "copestrs")
    values <- c(values, if (is.null(copestrs)) "NULL" else if (is(copestrs, "subQuery")) paste0("(", as.character(copestrs), ")") else paste0("'", as.character(copestrs), "'"))
  }

  if (missing(diast_bp)) {
    diast_bp <- defaults$diast_bp
  }
  if (!is.null(diast_bp)) {
    fields <- c(fields, "diast_bp")
    values <- c(values, if (is.null(diast_bp)) "NULL" else if (is(diast_bp, "subQuery")) paste0("(", as.character(diast_bp), ")") else paste0("'", as.character(diast_bp), "'"))
  }

  if (missing(dietfrt)) {
    dietfrt <- defaults$dietfrt
  }
  if (!is.null(dietfrt)) {
    fields <- c(fields, "dietfrt")
    values <- c(values, if (is.null(dietfrt)) "NULL" else if (is(dietfrt, "subQuery")) paste0("(", as.character(dietfrt), ")") else paste0("'", as.character(dietfrt), "'"))
  }

  if (missing(dietfrvg)) {
    dietfrvg <- defaults$dietfrvg
  }
  if (!is.null(dietfrvg)) {
    fields <- c(fields, "dietfrvg")
    values <- c(values, if (is.null(dietfrvg)) "NULL" else if (is(dietfrvg, "subQuery")) paste0("(", as.character(dietfrvg), ")") else paste0("'", as.character(dietfrvg), "'"))
  }

  if (missing(dietveg)) {
    dietveg <- defaults$dietveg
  }
  if (!is.null(dietveg)) {
    fields <- c(fields, "dietveg")
    values <- c(values, if (is.null(dietveg)) "NULL" else if (is(dietveg, "subQuery")) paste0("(", as.character(dietveg), ")") else paste0("'", as.character(dietveg), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(drnkdrv)) {
    drnkdrv <- defaults$drnkdrv
  }
  if (!is.null(drnkdrv)) {
    fields <- c(fields, "drnkdrv")
    values <- c(values, if (is.null(drnkdrv)) "NULL" else if (is(drnkdrv, "subQuery")) paste0("(", as.character(drnkdrv), ")") else paste0("'", as.character(drnkdrv), "'"))
  }

  if (missing(educ_lvl)) {
    educ_lvl <- defaults$educ_lvl
  }
  if (!is.null(educ_lvl)) {
    fields <- c(fields, "educ_lvl")
    values <- c(values, if (is.null(educ_lvl)) "NULL" else if (is(educ_lvl, "subQuery")) paste0("(", as.character(educ_lvl), ")") else paste0("'", as.character(educ_lvl), "'"))
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    fields <- c(fields, "efamid")
    values <- c(values, if (is.null(efamid)) "NULL" else if (is(efamid, "subQuery")) paste0("(", as.character(efamid), ")") else paste0("'", as.character(efamid), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(exermo)) {
    exermo <- defaults$exermo
  }
  if (!is.null(exermo)) {
    fields <- c(fields, "exermo")
    values <- c(values, if (is.null(exermo)) "NULL" else if (is(exermo, "subQuery")) paste0("(", as.character(exermo), ")") else paste0("'", as.character(exermo), "'"))
  }

  if (missing(exerweek)) {
    exerweek <- defaults$exerweek
  }
  if (!is.null(exerweek)) {
    fields <- c(fields, "exerweek")
    values <- c(values, if (is.null(exerweek)) "NULL" else if (is(exerweek, "subQuery")) paste0("(", as.character(exerweek), ")") else paste0("'", as.character(exerweek), "'"))
  }

  if (missing(famabscat12)) {
    famabscat12 <- defaults$famabscat12
  }
  if (!is.null(famabscat12)) {
    fields <- c(fields, "famabscat12")
    values <- c(values, if (is.null(famabscat12)) "NULL" else if (is(famabscat12, "subQuery")) paste0("(", as.character(famabscat12), ")") else paste0("'", as.character(famabscat12), "'"))
  }

  if (missing(fireext)) {
    fireext <- defaults$fireext
  }
  if (!is.null(fireext)) {
    fields <- c(fields, "fireext")
    values <- c(values, if (is.null(fireext)) "NULL" else if (is(fireext, "subQuery")) paste0("(", as.character(fireext), ")") else paste0("'", as.character(fireext), "'"))
  }

  if (missing(flu_shot)) {
    flu_shot <- defaults$flu_shot
  }
  if (!is.null(flu_shot)) {
    fields <- c(fields, "flu_shot")
    values <- c(values, if (is.null(flu_shot)) "NULL" else if (is(flu_shot, "subQuery")) paste0("(", as.character(flu_shot), ")") else paste0("'", as.character(flu_shot), "'"))
  }

  if (missing(glucose)) {
    glucose <- defaults$glucose
  }
  if (!is.null(glucose)) {
    fields <- c(fields, "glucose")
    values <- c(values, if (is.null(glucose)) "NULL" else if (is(glucose, "subQuery")) paste0("(", as.character(glucose), ")") else paste0("'", as.character(glucose), "'"))
  }

  if (missing(hdl)) {
    hdl <- defaults$hdl
  }
  if (!is.null(hdl)) {
    fields <- c(fields, "hdl")
    values <- c(values, if (is.null(hdl)) "NULL" else if (is(hdl, "subQuery")) paste0("(", as.character(hdl), ")") else paste0("'", as.character(hdl), "'"))
  }

  if (missing(height)) {
    height <- defaults$height
  }
  if (!is.null(height)) {
    fields <- c(fields, "height")
    values <- c(values, if (is.null(height)) "NULL" else if (is(height, "subQuery")) paste0("(", as.character(height), ")") else paste0("'", as.character(height), "'"))
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    fields <- c(fields, "hlthplan")
    values <- c(values, if (is.null(hlthplan)) "NULL" else if (is(hlthplan, "subQuery")) paste0("(", as.character(hlthplan), ")") else paste0("'", as.character(hlthplan), "'"))
  }

  if (missing(hltimpct)) {
    hltimpct <- defaults$hltimpct
  }
  if (!is.null(hltimpct)) {
    fields <- c(fields, "hltimpct")
    values <- c(values, if (is.null(hltimpct)) "NULL" else if (is(hltimpct, "subQuery")) paste0("(", as.character(hltimpct), ")") else paste0("'", as.character(hltimpct), "'"))
  }

  if (missing(job_sat)) {
    job_sat <- defaults$job_sat
  }
  if (!is.null(job_sat)) {
    fields <- c(fields, "job_sat")
    values <- c(values, if (is.null(job_sat)) "NULL" else if (is(job_sat, "subQuery")) paste0("(", as.character(job_sat), ")") else paste0("'", as.character(job_sat), "'"))
  }

  if (missing(ldl)) {
    ldl <- defaults$ldl
  }
  if (!is.null(ldl)) {
    fields <- c(fields, "ldl")
    values <- c(values, if (is.null(ldl)) "NULL" else if (is(ldl, "subQuery")) paste0("(", as.character(ldl), ")") else paste0("'", as.character(ldl), "'"))
  }

  if (missing(life_sat)) {
    life_sat <- defaults$life_sat
  }
  if (!is.null(life_sat)) {
    fields <- c(fields, "life_sat")
    values <- c(values, if (is.null(life_sat)) "NULL" else if (is(life_sat, "subQuery")) paste0("(", as.character(life_sat), ")") else paste0("'", as.character(life_sat), "'"))
  }

  if (missing(liftwgt)) {
    liftwgt <- defaults$liftwgt
  }
  if (!is.null(liftwgt)) {
    fields <- c(fields, "liftwgt")
    values <- c(values, if (is.null(liftwgt)) "NULL" else if (is(liftwgt, "subQuery")) paste0("(", as.character(liftwgt), ")") else paste0("'", as.character(liftwgt), "'"))
  }

  if (missing(mh_freq)) {
    mh_freq <- defaults$mh_freq
  }
  if (!is.null(mh_freq)) {
    fields <- c(fields, "mh_freq")
    values <- c(values, if (is.null(mh_freq)) "NULL" else if (is(mh_freq, "subQuery")) paste0("(", as.character(mh_freq), ")") else paste0("'", as.character(mh_freq), "'"))
  }

  if (missing(mh_prob)) {
    mh_prob <- defaults$mh_prob
  }
  if (!is.null(mh_prob)) {
    fields <- c(fields, "mh_prob")
    values <- c(values, if (is.null(mh_prob)) "NULL" else if (is(mh_prob, "subQuery")) paste0("(", as.character(mh_prob), ")") else paste0("'", as.character(mh_prob), "'"))
  }

  if (missing(pipeamt)) {
    pipeamt <- defaults$pipeamt
  }
  if (!is.null(pipeamt)) {
    fields <- c(fields, "pipeamt")
    values <- c(values, if (is.null(pipeamt)) "NULL" else if (is(pipeamt, "subQuery")) paste0("(", as.character(pipeamt), ")") else paste0("'", as.character(pipeamt), "'"))
  }

  if (missing(pipecurr)) {
    pipecurr <- defaults$pipecurr
  }
  if (!is.null(pipecurr)) {
    fields <- c(fields, "pipecurr")
    values <- c(values, if (is.null(pipecurr)) "NULL" else if (is(pipecurr, "subQuery")) paste0("(", as.character(pipecurr), ")") else paste0("'", as.character(pipecurr), "'"))
  }

  if (missing(pipedur)) {
    pipedur <- defaults$pipedur
  }
  if (!is.null(pipedur)) {
    fields <- c(fields, "pipedur")
    values <- c(values, if (is.null(pipedur)) "NULL" else if (is(pipedur, "subQuery")) paste0("(", as.character(pipedur), ")") else paste0("'", as.character(pipedur), "'"))
  }

  if (missing(pipeprev)) {
    pipeprev <- defaults$pipeprev
  }
  if (!is.null(pipeprev)) {
    fields <- c(fields, "pipeprev")
    values <- c(values, if (is.null(pipeprev)) "NULL" else if (is(pipeprev, "subQuery")) paste0("(", as.character(pipeprev), ")") else paste0("'", as.character(pipeprev), "'"))
  }

  if (missing(pipeqtyr)) {
    pipeqtyr <- defaults$pipeqtyr
  }
  if (!is.null(pipeqtyr)) {
    fields <- c(fields, "pipeqtyr")
    values <- c(values, if (is.null(pipeqtyr)) "NULL" else if (is(pipeqtyr, "subQuery")) paste0("(", as.character(pipeqtyr), ")") else paste0("'", as.character(pipeqtyr), "'"))
  }

  if (missing(pipequit)) {
    pipequit <- defaults$pipequit
  }
  if (!is.null(pipequit)) {
    fields <- c(fields, "pipequit")
    values <- c(values, if (is.null(pipequit)) "NULL" else if (is(pipequit, "subQuery")) paste0("(", as.character(pipequit), ")") else paste0("'", as.character(pipequit), "'"))
  }

  if (missing(planalc)) {
    planalc <- defaults$planalc
  }
  if (!is.null(planalc)) {
    fields <- c(fields, "planalc")
    values <- c(values, if (is.null(planalc)) "NULL" else if (is(planalc, "subQuery")) paste0("(", as.character(planalc), ")") else paste0("'", as.character(planalc), "'"))
  }

  if (missing(plandiet)) {
    plandiet <- defaults$plandiet
  }
  if (!is.null(plandiet)) {
    fields <- c(fields, "plandiet")
    values <- c(values, if (is.null(plandiet)) "NULL" else if (is(plandiet, "subQuery")) paste0("(", as.character(plandiet), ")") else paste0("'", as.character(plandiet), "'"))
  }

  if (missing(plandrad)) {
    plandrad <- defaults$plandrad
  }
  if (!is.null(plandrad)) {
    fields <- c(fields, "plandrad")
    values <- c(values, if (is.null(plandrad)) "NULL" else if (is(plandrad, "subQuery")) paste0("(", as.character(plandrad), ")") else paste0("'", as.character(plandrad), "'"))
  }

  if (missing(planexer)) {
    planexer <- defaults$planexer
  }
  if (!is.null(planexer)) {
    fields <- c(fields, "planexer")
    values <- c(values, if (is.null(planexer)) "NULL" else if (is(planexer, "subQuery")) paste0("(", as.character(planexer), ")") else paste0("'", as.character(planexer), "'"))
  }

  if (missing(planslp)) {
    planslp <- defaults$planslp
  }
  if (!is.null(planslp)) {
    fields <- c(fields, "planslp")
    values <- c(values, if (is.null(planslp)) "NULL" else if (is(planslp, "subQuery")) paste0("(", as.character(planslp), ")") else paste0("'", as.character(planslp), "'"))
  }

  if (missing(planstrs)) {
    planstrs <- defaults$planstrs
  }
  if (!is.null(planstrs)) {
    fields <- c(fields, "planstrs")
    values <- c(values, if (is.null(planstrs)) "NULL" else if (is(planstrs, "subQuery")) paste0("(", as.character(planstrs), ")") else paste0("'", as.character(planstrs), "'"))
  }

  if (missing(plantob)) {
    plantob <- defaults$plantob
  }
  if (!is.null(plantob)) {
    fields <- c(fields, "plantob")
    values <- c(values, if (is.null(plantob)) "NULL" else if (is(plantob, "subQuery")) paste0("(", as.character(plantob), ")") else paste0("'", as.character(plantob), "'"))
  }

  if (missing(planwgt)) {
    planwgt <- defaults$planwgt
  }
  if (!is.null(planwgt)) {
    fields <- c(fields, "planwgt")
    values <- c(values, if (is.null(planwgt)) "NULL" else if (is(planwgt, "subQuery")) paste0("(", as.character(planwgt), ")") else paste0("'", as.character(planwgt), "'"))
  }

  if (missing(prev_mammo)) {
    prev_mammo <- defaults$prev_mammo
  }
  if (!is.null(prev_mammo)) {
    fields <- c(fields, "prev_mammo")
    values <- c(values, if (is.null(prev_mammo)) "NULL" else if (is(prev_mammo, "subQuery")) paste0("(", as.character(prev_mammo), ")") else paste0("'", as.character(prev_mammo), "'"))
  }

  if (missing(prev_paptest)) {
    prev_paptest <- defaults$prev_paptest
  }
  if (!is.null(prev_paptest)) {
    fields <- c(fields, "prev_paptest")
    values <- c(values, if (is.null(prev_paptest)) "NULL" else if (is(prev_paptest, "subQuery")) paste0("(", as.character(prev_paptest), ")") else paste0("'", as.character(prev_paptest), "'"))
  }

  if (missing(prev_prostex)) {
    prev_prostex <- defaults$prev_prostex
  }
  if (!is.null(prev_prostex)) {
    fields <- c(fields, "prev_prostex")
    values <- c(values, if (is.null(prev_prostex)) "NULL" else if (is(prev_prostex, "subQuery")) paste0("(", as.character(prev_prostex), ")") else paste0("'", as.character(prev_prostex), "'"))
  }

  if (missing(prev_sigmoid)) {
    prev_sigmoid <- defaults$prev_sigmoid
  }
  if (!is.null(prev_sigmoid)) {
    fields <- c(fields, "prev_sigmoid")
    values <- c(values, if (is.null(prev_sigmoid)) "NULL" else if (is(prev_sigmoid, "subQuery")) paste0("(", as.character(prev_sigmoid), ")") else paste0("'", as.character(prev_sigmoid), "'"))
  }

  if (missing(prodabscat)) {
    prodabscat <- defaults$prodabscat
  }
  if (!is.null(prodabscat)) {
    fields <- c(fields, "prodabscat")
    values <- c(values, if (is.null(prodabscat)) "NULL" else if (is(prodabscat, "subQuery")) paste0("(", as.character(prodabscat), ")") else paste0("'", as.character(prodabscat), "'"))
  }

  if (missing(risk_alc)) {
    risk_alc <- defaults$risk_alc
  }
  if (!is.null(risk_alc)) {
    fields <- c(fields, "risk_alc")
    values <- c(values, if (is.null(risk_alc)) "NULL" else if (is(risk_alc, "subQuery")) paste0("(", as.character(risk_alc), ")") else paste0("'", as.character(risk_alc), "'"))
  }

  if (missing(risk_bp)) {
    risk_bp <- defaults$risk_bp
  }
  if (!is.null(risk_bp)) {
    fields <- c(fields, "risk_bp")
    values <- c(values, if (is.null(risk_bp)) "NULL" else if (is(risk_bp, "subQuery")) paste0("(", as.character(risk_bp), ")") else paste0("'", as.character(risk_bp), "'"))
  }

  if (missing(risk_chol)) {
    risk_chol <- defaults$risk_chol
  }
  if (!is.null(risk_chol)) {
    fields <- c(fields, "risk_chol")
    values <- c(values, if (is.null(risk_chol)) "NULL" else if (is(risk_chol, "subQuery")) paste0("(", as.character(risk_chol), ")") else paste0("'", as.character(risk_chol), "'"))
  }

  if (missing(risk_exer)) {
    risk_exer <- defaults$risk_exer
  }
  if (!is.null(risk_exer)) {
    fields <- c(fields, "risk_exer")
    values <- c(values, if (is.null(risk_exer)) "NULL" else if (is(risk_exer, "subQuery")) paste0("(", as.character(risk_exer), ")") else paste0("'", as.character(risk_exer), "'"))
  }

  if (missing(risk_gluc)) {
    risk_gluc <- defaults$risk_gluc
  }
  if (!is.null(risk_gluc)) {
    fields <- c(fields, "risk_gluc")
    values <- c(values, if (is.null(risk_gluc)) "NULL" else if (is(risk_gluc, "subQuery")) paste0("(", as.character(risk_gluc), ")") else paste0("'", as.character(risk_gluc), "'"))
  }

  if (missing(risk_mh)) {
    risk_mh <- defaults$risk_mh
  }
  if (!is.null(risk_mh)) {
    fields <- c(fields, "risk_mh")
    values <- c(values, if (is.null(risk_mh)) "NULL" else if (is(risk_mh, "subQuery")) paste0("(", as.character(risk_mh), ")") else paste0("'", as.character(risk_mh), "'"))
  }

  if (missing(risk_nutr)) {
    risk_nutr <- defaults$risk_nutr
  }
  if (!is.null(risk_nutr)) {
    fields <- c(fields, "risk_nutr")
    values <- c(values, if (is.null(risk_nutr)) "NULL" else if (is(risk_nutr, "subQuery")) paste0("(", as.character(risk_nutr), ")") else paste0("'", as.character(risk_nutr), "'"))
  }

  if (missing(risk_safe)) {
    risk_safe <- defaults$risk_safe
  }
  if (!is.null(risk_safe)) {
    fields <- c(fields, "risk_safe")
    values <- c(values, if (is.null(risk_safe)) "NULL" else if (is(risk_safe, "subQuery")) paste0("(", as.character(risk_safe), ")") else paste0("'", as.character(risk_safe), "'"))
  }

  if (missing(risk_sleep)) {
    risk_sleep <- defaults$risk_sleep
  }
  if (!is.null(risk_sleep)) {
    fields <- c(fields, "risk_sleep")
    values <- c(values, if (is.null(risk_sleep)) "NULL" else if (is(risk_sleep, "subQuery")) paste0("(", as.character(risk_sleep), ")") else paste0("'", as.character(risk_sleep), "'"))
  }

  if (missing(risk_smok)) {
    risk_smok <- defaults$risk_smok
  }
  if (!is.null(risk_smok)) {
    fields <- c(fields, "risk_smok")
    values <- c(values, if (is.null(risk_smok)) "NULL" else if (is(risk_smok, "subQuery")) paste0("(", as.character(risk_smok), ")") else paste0("'", as.character(risk_smok), "'"))
  }

  if (missing(risk_wgt)) {
    risk_wgt <- defaults$risk_wgt
  }
  if (!is.null(risk_wgt)) {
    fields <- c(fields, "risk_wgt")
    values <- c(values, if (is.null(risk_wgt)) "NULL" else if (is(risk_wgt, "subQuery")) paste0("(", as.character(risk_wgt), ")") else paste0("'", as.character(risk_wgt), "'"))
  }

  if (missing(seatbelt)) {
    seatbelt <- defaults$seatbelt
  }
  if (!is.null(seatbelt)) {
    fields <- c(fields, "seatbelt")
    values <- c(values, if (is.null(seatbelt)) "NULL" else if (is(seatbelt, "subQuery")) paste0("(", as.character(seatbelt), ")") else paste0("'", as.character(seatbelt), "'"))
  }

  if (missing(selfhlth)) {
    selfhlth <- defaults$selfhlth
  }
  if (!is.null(selfhlth)) {
    fields <- c(fields, "selfhlth")
    values <- c(values, if (is.null(selfhlth)) "NULL" else if (is(selfhlth, "subQuery")) paste0("(", as.character(selfhlth), ")") else paste0("'", as.character(selfhlth), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(sleep_hr)) {
    sleep_hr <- defaults$sleep_hr
  }
  if (!is.null(sleep_hr)) {
    fields <- c(fields, "sleep_hr")
    values <- c(values, if (is.null(sleep_hr)) "NULL" else if (is(sleep_hr, "subQuery")) paste0("(", as.character(sleep_hr), ")") else paste0("'", as.character(sleep_hr), "'"))
  }

  if (missing(slpapnea)) {
    slpapnea <- defaults$slpapnea
  }
  if (!is.null(slpapnea)) {
    fields <- c(fields, "slpapnea")
    values <- c(values, if (is.null(slpapnea)) "NULL" else if (is(slpapnea, "subQuery")) paste0("(", as.character(slpapnea), ")") else paste0("'", as.character(slpapnea), "'"))
  }

  if (missing(slpprob)) {
    slpprob <- defaults$slpprob
  }
  if (!is.null(slpprob)) {
    fields <- c(fields, "slpprob")
    values <- c(values, if (is.null(slpprob)) "NULL" else if (is(slpprob, "subQuery")) paste0("(", as.character(slpprob), ")") else paste0("'", as.character(slpprob), "'"))
  }

  if (missing(smkdetect)) {
    smkdetect <- defaults$smkdetect
  }
  if (!is.null(smkdetect)) {
    fields <- c(fields, "smkdetect")
    values <- c(values, if (is.null(smkdetect)) "NULL" else if (is(smkdetect, "subQuery")) paste0("(", as.character(smkdetect), ")") else paste0("'", as.character(smkdetect), "'"))
  }

  if (missing(stretch)) {
    stretch <- defaults$stretch
  }
  if (!is.null(stretch)) {
    fields <- c(fields, "stretch")
    values <- c(values, if (is.null(stretch)) "NULL" else if (is(stretch, "subQuery")) paste0("(", as.character(stretch), ")") else paste0("'", as.character(stretch), "'"))
  }

  if (missing(survdate)) {
    survdate <- defaults$survdate
  }
  if (!is.null(survdate)) {
    fields <- c(fields, "survdate")
    values <- c(values, if (is.null(survdate)) "NULL" else if (is(survdate, "subQuery")) paste0("(", as.character(survdate), ")") else paste0("'", as.character(survdate), "'"))
  }

  if (missing(systo_bp)) {
    systo_bp <- defaults$systo_bp
  }
  if (!is.null(systo_bp)) {
    fields <- c(fields, "systo_bp")
    values <- c(values, if (is.null(systo_bp)) "NULL" else if (is(systo_bp, "subQuery")) paste0("(", as.character(systo_bp), ")") else paste0("'", as.character(systo_bp), "'"))
  }

  if (missing(tobcurr)) {
    tobcurr <- defaults$tobcurr
  }
  if (!is.null(tobcurr)) {
    fields <- c(fields, "tobcurr")
    values <- c(values, if (is.null(tobcurr)) "NULL" else if (is(tobcurr, "subQuery")) paste0("(", as.character(tobcurr), ")") else paste0("'", as.character(tobcurr), "'"))
  }

  if (missing(tobprev)) {
    tobprev <- defaults$tobprev
  }
  if (!is.null(tobprev)) {
    fields <- c(fields, "tobprev")
    values <- c(values, if (is.null(tobprev)) "NULL" else if (is(tobprev, "subQuery")) paste0("(", as.character(tobprev), ")") else paste0("'", as.character(tobprev), "'"))
  }

  if (missing(triglycd)) {
    triglycd <- defaults$triglycd
  }
  if (!is.null(triglycd)) {
    fields <- c(fields, "triglycd")
    values <- c(values, if (is.null(triglycd)) "NULL" else if (is(triglycd, "subQuery")) paste0("(", as.character(triglycd), ")") else paste0("'", as.character(triglycd), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(weight)) {
    weight <- defaults$weight
  }
  if (!is.null(weight)) {
    fields <- c(fields, "weight")
    values <- c(values, if (is.null(weight)) "NULL" else if (is(weight, "subQuery")) paste0("(", as.character(weight), ")") else paste0("'", as.character(weight), "'"))
  }

  if (missing(workabs)) {
    workabs <- defaults$workabs
  }
  if (!is.null(workabs)) {
    fields <- c(fields, "workabs")
    values <- c(values, if (is.null(workabs)) "NULL" else if (is(workabs, "subQuery")) paste0("(", as.character(workabs), ")") else paste0("'", as.character(workabs), "'"))
  }

  if (missing(wrkabscat)) {
    wrkabscat <- defaults$wrkabscat
  }
  if (!is.null(wrkabscat)) {
    fields <- c(fields, "wrkabscat")
    values <- c(values, if (is.null(wrkabscat)) "NULL" else if (is(wrkabscat, "subQuery")) paste0("(", as.character(wrkabscat), ")") else paste0("'", as.character(wrkabscat), "'"))
  }

  if (missing(wrkabscat12)) {
    wrkabscat12 <- defaults$wrkabscat12
  }
  if (!is.null(wrkabscat12)) {
    fields <- c(fields, "wrkabscat12")
    values <- c(values, if (is.null(wrkabscat12)) "NULL" else if (is(wrkabscat12, "subQuery")) paste0("(", as.character(wrkabscat12), ")") else paste0("'", as.character(wrkabscat12), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "health_risk_assessment", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_hra_question_ref <- function(question_type_id, category_value, category_name) {
  defaults <- get('hra_question_ref', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(question_type_id)) {
    question_type_id <- defaults$question_type_id
  }
  if (!is.null(question_type_id)) {
    fields <- c(fields, "question_type_id")
    values <- c(values, if (is.null(question_type_id)) "NULL" else if (is(question_type_id, "subQuery")) paste0("(", as.character(question_type_id), ")") else paste0("'", as.character(question_type_id), "'"))
  }

  if (missing(category_value)) {
    category_value <- defaults$category_value
  }
  if (!is.null(category_value)) {
    fields <- c(fields, "category_value")
    values <- c(values, if (is.null(category_value)) "NULL" else if (is(category_value, "subQuery")) paste0("(", as.character(category_value), ")") else paste0("'", as.character(category_value), "'"))
  }

  if (missing(category_name)) {
    category_name <- defaults$category_name
  }
  if (!is.null(category_name)) {
    fields <- c(fields, "category_name")
    values <- c(values, if (is.null(category_name)) "NULL" else if (is(category_name, "subQuery")) paste0("(", as.character(category_name), ")") else paste0("'", as.character(category_name), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "hra_question_ref", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_hra_variable_ref <- function(variable_name, variable_longname, variable_description, notes, question_type_id) {
  defaults <- get('hra_variable_ref', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(variable_name)) {
    variable_name <- defaults$variable_name
  }
  if (!is.null(variable_name)) {
    fields <- c(fields, "variable_name")
    values <- c(values, if (is.null(variable_name)) "NULL" else if (is(variable_name, "subQuery")) paste0("(", as.character(variable_name), ")") else paste0("'", as.character(variable_name), "'"))
  }

  if (missing(variable_longname)) {
    variable_longname <- defaults$variable_longname
  }
  if (!is.null(variable_longname)) {
    fields <- c(fields, "variable_longname")
    values <- c(values, if (is.null(variable_longname)) "NULL" else if (is(variable_longname, "subQuery")) paste0("(", as.character(variable_longname), ")") else paste0("'", as.character(variable_longname), "'"))
  }

  if (missing(variable_description)) {
    variable_description <- defaults$variable_description
  }
  if (!is.null(variable_description)) {
    fields <- c(fields, "variable_description")
    values <- c(values, if (is.null(variable_description)) "NULL" else if (is(variable_description, "subQuery")) paste0("(", as.character(variable_description), ")") else paste0("'", as.character(variable_description), "'"))
  }

  if (missing(notes)) {
    notes <- defaults$notes
  }
  if (!is.null(notes)) {
    fields <- c(fields, "notes")
    values <- c(values, if (is.null(notes)) "NULL" else if (is(notes, "subQuery")) paste0("(", as.character(notes), ")") else paste0("'", as.character(notes), "'"))
  }

  if (missing(question_type_id)) {
    question_type_id <- defaults$question_type_id
  }
  if (!is.null(question_type_id)) {
    fields <- c(fields, "question_type_id")
    values <- c(values, if (is.null(question_type_id)) "NULL" else if (is(question_type_id, "subQuery")) paste0("(", as.character(question_type_id), ")") else paste0("'", as.character(question_type_id), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "hra_variable_ref", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_inpatient_admissions <- function(flag, admdate, admtyp, age, agegrp, caseid, datatyp, days, disdate, dobyr, drg, dstatus, dx1, dx10, dx11, dx12, dx13, dx14, dx15, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, hlthplan, hospnet, hosppay, indstry, mdc, mhsacovg, msa, pdx, phyflag, physid, physnet, physpay, plankey, plantyp, poapdx, poadx1, poadx2, poadx3, poadx4, poadx5, poadx6, poadx7, poadx8, poadx9, poadx10, poadx11, poadx12, poadx13, poadx14, poadx15, pproc, proc1, proc10, proc11, proc12, proc13, proc14, proc15, proc2, proc3, proc4, proc5, proc6, proc7, proc8, proc9, region, rx, seqnum, sex, state, totcob, totcoins, totcopay, totded, totnet, totpay, version, wgtkey, year) {
  defaults <- get('inpatient_admissions', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(flag)) {
    flag <- defaults$flag
  }
  if (!is.null(flag)) {
    fields <- c(fields, "_flag")
    values <- c(values, if (is.null(flag)) "NULL" else if (is(flag, "subQuery")) paste0("(", as.character(flag), ")") else paste0("'", as.character(flag), "'"))
  }

  if (missing(admdate)) {
    admdate <- defaults$admdate
  }
  if (!is.null(admdate)) {
    fields <- c(fields, "admdate")
    values <- c(values, if (is.null(admdate)) "NULL" else if (is(admdate, "subQuery")) paste0("(", as.character(admdate), ")") else paste0("'", as.character(admdate), "'"))
  }

  if (missing(admtyp)) {
    admtyp <- defaults$admtyp
  }
  if (!is.null(admtyp)) {
    fields <- c(fields, "admtyp")
    values <- c(values, if (is.null(admtyp)) "NULL" else if (is(admtyp, "subQuery")) paste0("(", as.character(admtyp), ")") else paste0("'", as.character(admtyp), "'"))
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    fields <- c(fields, "age")
    values <- c(values, if (is.null(age)) "NULL" else if (is(age, "subQuery")) paste0("(", as.character(age), ")") else paste0("'", as.character(age), "'"))
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    fields <- c(fields, "agegrp")
    values <- c(values, if (is.null(agegrp)) "NULL" else if (is(agegrp, "subQuery")) paste0("(", as.character(agegrp), ")") else paste0("'", as.character(agegrp), "'"))
  }

  if (missing(caseid)) {
    caseid <- defaults$caseid
  }
  if (!is.null(caseid)) {
    fields <- c(fields, "caseid")
    values <- c(values, if (is.null(caseid)) "NULL" else if (is(caseid, "subQuery")) paste0("(", as.character(caseid), ")") else paste0("'", as.character(caseid), "'"))
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    fields <- c(fields, "datatyp")
    values <- c(values, if (is.null(datatyp)) "NULL" else if (is(datatyp, "subQuery")) paste0("(", as.character(datatyp), ")") else paste0("'", as.character(datatyp), "'"))
  }

  if (missing(days)) {
    days <- defaults$days
  }
  if (!is.null(days)) {
    fields <- c(fields, "days")
    values <- c(values, if (is.null(days)) "NULL" else if (is(days, "subQuery")) paste0("(", as.character(days), ")") else paste0("'", as.character(days), "'"))
  }

  if (missing(disdate)) {
    disdate <- defaults$disdate
  }
  if (!is.null(disdate)) {
    fields <- c(fields, "disdate")
    values <- c(values, if (is.null(disdate)) "NULL" else if (is(disdate, "subQuery")) paste0("(", as.character(disdate), ")") else paste0("'", as.character(disdate), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(drg)) {
    drg <- defaults$drg
  }
  if (!is.null(drg)) {
    fields <- c(fields, "drg")
    values <- c(values, if (is.null(drg)) "NULL" else if (is(drg, "subQuery")) paste0("(", as.character(drg), ")") else paste0("'", as.character(drg), "'"))
  }

  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    fields <- c(fields, "dstatus")
    values <- c(values, if (is.null(dstatus)) "NULL" else if (is(dstatus, "subQuery")) paste0("(", as.character(dstatus), ")") else paste0("'", as.character(dstatus), "'"))
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    fields <- c(fields, "dx1")
    values <- c(values, if (is.null(dx1)) "NULL" else if (is(dx1, "subQuery")) paste0("(", as.character(dx1), ")") else paste0("'", as.character(dx1), "'"))
  }

  if (missing(dx10)) {
    dx10 <- defaults$dx10
  }
  if (!is.null(dx10)) {
    fields <- c(fields, "dx10")
    values <- c(values, if (is.null(dx10)) "NULL" else if (is(dx10, "subQuery")) paste0("(", as.character(dx10), ")") else paste0("'", as.character(dx10), "'"))
  }

  if (missing(dx11)) {
    dx11 <- defaults$dx11
  }
  if (!is.null(dx11)) {
    fields <- c(fields, "dx11")
    values <- c(values, if (is.null(dx11)) "NULL" else if (is(dx11, "subQuery")) paste0("(", as.character(dx11), ")") else paste0("'", as.character(dx11), "'"))
  }

  if (missing(dx12)) {
    dx12 <- defaults$dx12
  }
  if (!is.null(dx12)) {
    fields <- c(fields, "dx12")
    values <- c(values, if (is.null(dx12)) "NULL" else if (is(dx12, "subQuery")) paste0("(", as.character(dx12), ")") else paste0("'", as.character(dx12), "'"))
  }

  if (missing(dx13)) {
    dx13 <- defaults$dx13
  }
  if (!is.null(dx13)) {
    fields <- c(fields, "dx13")
    values <- c(values, if (is.null(dx13)) "NULL" else if (is(dx13, "subQuery")) paste0("(", as.character(dx13), ")") else paste0("'", as.character(dx13), "'"))
  }

  if (missing(dx14)) {
    dx14 <- defaults$dx14
  }
  if (!is.null(dx14)) {
    fields <- c(fields, "dx14")
    values <- c(values, if (is.null(dx14)) "NULL" else if (is(dx14, "subQuery")) paste0("(", as.character(dx14), ")") else paste0("'", as.character(dx14), "'"))
  }

  if (missing(dx15)) {
    dx15 <- defaults$dx15
  }
  if (!is.null(dx15)) {
    fields <- c(fields, "dx15")
    values <- c(values, if (is.null(dx15)) "NULL" else if (is(dx15, "subQuery")) paste0("(", as.character(dx15), ")") else paste0("'", as.character(dx15), "'"))
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    fields <- c(fields, "dx2")
    values <- c(values, if (is.null(dx2)) "NULL" else if (is(dx2, "subQuery")) paste0("(", as.character(dx2), ")") else paste0("'", as.character(dx2), "'"))
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    fields <- c(fields, "dx3")
    values <- c(values, if (is.null(dx3)) "NULL" else if (is(dx3, "subQuery")) paste0("(", as.character(dx3), ")") else paste0("'", as.character(dx3), "'"))
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    fields <- c(fields, "dx4")
    values <- c(values, if (is.null(dx4)) "NULL" else if (is(dx4, "subQuery")) paste0("(", as.character(dx4), ")") else paste0("'", as.character(dx4), "'"))
  }

  if (missing(dx5)) {
    dx5 <- defaults$dx5
  }
  if (!is.null(dx5)) {
    fields <- c(fields, "dx5")
    values <- c(values, if (is.null(dx5)) "NULL" else if (is(dx5, "subQuery")) paste0("(", as.character(dx5), ")") else paste0("'", as.character(dx5), "'"))
  }

  if (missing(dx6)) {
    dx6 <- defaults$dx6
  }
  if (!is.null(dx6)) {
    fields <- c(fields, "dx6")
    values <- c(values, if (is.null(dx6)) "NULL" else if (is(dx6, "subQuery")) paste0("(", as.character(dx6), ")") else paste0("'", as.character(dx6), "'"))
  }

  if (missing(dx7)) {
    dx7 <- defaults$dx7
  }
  if (!is.null(dx7)) {
    fields <- c(fields, "dx7")
    values <- c(values, if (is.null(dx7)) "NULL" else if (is(dx7, "subQuery")) paste0("(", as.character(dx7), ")") else paste0("'", as.character(dx7), "'"))
  }

  if (missing(dx8)) {
    dx8 <- defaults$dx8
  }
  if (!is.null(dx8)) {
    fields <- c(fields, "dx8")
    values <- c(values, if (is.null(dx8)) "NULL" else if (is(dx8, "subQuery")) paste0("(", as.character(dx8), ")") else paste0("'", as.character(dx8), "'"))
  }

  if (missing(dx9)) {
    dx9 <- defaults$dx9
  }
  if (!is.null(dx9)) {
    fields <- c(fields, "dx9")
    values <- c(values, if (is.null(dx9)) "NULL" else if (is(dx9, "subQuery")) paste0("(", as.character(dx9), ")") else paste0("'", as.character(dx9), "'"))
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    fields <- c(fields, "dxver")
    values <- c(values, if (is.null(dxver)) "NULL" else if (is(dxver, "subQuery")) paste0("(", as.character(dxver), ")") else paste0("'", as.character(dxver), "'"))
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    fields <- c(fields, "eeclass")
    values <- c(values, if (is.null(eeclass)) "NULL" else if (is(eeclass, "subQuery")) paste0("(", as.character(eeclass), ")") else paste0("'", as.character(eeclass), "'"))
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    fields <- c(fields, "eestatu")
    values <- c(values, if (is.null(eestatu)) "NULL" else if (is(eestatu, "subQuery")) paste0("(", as.character(eestatu), ")") else paste0("'", as.character(eestatu), "'"))
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    fields <- c(fields, "efamid")
    values <- c(values, if (is.null(efamid)) "NULL" else if (is(efamid, "subQuery")) paste0("(", as.character(efamid), ")") else paste0("'", as.character(efamid), "'"))
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    fields <- c(fields, "egeoloc")
    values <- c(values, if (is.null(egeoloc)) "NULL" else if (is(egeoloc, "subQuery")) paste0("(", as.character(egeoloc), ")") else paste0("'", as.character(egeoloc), "'"))
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    fields <- c(fields, "eidflag")
    values <- c(values, if (is.null(eidflag)) "NULL" else if (is(eidflag, "subQuery")) paste0("(", as.character(eidflag), ")") else paste0("'", as.character(eidflag), "'"))
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    fields <- c(fields, "emprel")
    values <- c(values, if (is.null(emprel)) "NULL" else if (is(emprel, "subQuery")) paste0("(", as.character(emprel), ")") else paste0("'", as.character(emprel), "'"))
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    fields <- c(fields, "enrflag")
    values <- c(values, if (is.null(enrflag)) "NULL" else if (is(enrflag, "subQuery")) paste0("(", as.character(enrflag), ")") else paste0("'", as.character(enrflag), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    fields <- c(fields, "hlthplan")
    values <- c(values, if (is.null(hlthplan)) "NULL" else if (is(hlthplan, "subQuery")) paste0("(", as.character(hlthplan), ")") else paste0("'", as.character(hlthplan), "'"))
  }

  if (missing(hospnet)) {
    hospnet <- defaults$hospnet
  }
  if (!is.null(hospnet)) {
    fields <- c(fields, "hospnet")
    values <- c(values, if (is.null(hospnet)) "NULL" else if (is(hospnet, "subQuery")) paste0("(", as.character(hospnet), ")") else paste0("'", as.character(hospnet), "'"))
  }

  if (missing(hosppay)) {
    hosppay <- defaults$hosppay
  }
  if (!is.null(hosppay)) {
    fields <- c(fields, "hosppay")
    values <- c(values, if (is.null(hosppay)) "NULL" else if (is(hosppay, "subQuery")) paste0("(", as.character(hosppay), ")") else paste0("'", as.character(hosppay), "'"))
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    fields <- c(fields, "indstry")
    values <- c(values, if (is.null(indstry)) "NULL" else if (is(indstry, "subQuery")) paste0("(", as.character(indstry), ")") else paste0("'", as.character(indstry), "'"))
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    fields <- c(fields, "mdc")
    values <- c(values, if (is.null(mdc)) "NULL" else if (is(mdc, "subQuery")) paste0("(", as.character(mdc), ")") else paste0("'", as.character(mdc), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    fields <- c(fields, "msa")
    values <- c(values, if (is.null(msa)) "NULL" else if (is(msa, "subQuery")) paste0("(", as.character(msa), ")") else paste0("'", as.character(msa), "'"))
  }

  if (missing(pdx)) {
    pdx <- defaults$pdx
  }
  if (!is.null(pdx)) {
    fields <- c(fields, "pdx")
    values <- c(values, if (is.null(pdx)) "NULL" else if (is(pdx, "subQuery")) paste0("(", as.character(pdx), ")") else paste0("'", as.character(pdx), "'"))
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    fields <- c(fields, "phyflag")
    values <- c(values, if (is.null(phyflag)) "NULL" else if (is(phyflag, "subQuery")) paste0("(", as.character(phyflag), ")") else paste0("'", as.character(phyflag), "'"))
  }

  if (missing(physid)) {
    physid <- defaults$physid
  }
  if (!is.null(physid)) {
    fields <- c(fields, "physid")
    values <- c(values, if (is.null(physid)) "NULL" else if (is(physid, "subQuery")) paste0("(", as.character(physid), ")") else paste0("'", as.character(physid), "'"))
  }

  if (missing(physnet)) {
    physnet <- defaults$physnet
  }
  if (!is.null(physnet)) {
    fields <- c(fields, "physnet")
    values <- c(values, if (is.null(physnet)) "NULL" else if (is(physnet, "subQuery")) paste0("(", as.character(physnet), ")") else paste0("'", as.character(physnet), "'"))
  }

  if (missing(physpay)) {
    physpay <- defaults$physpay
  }
  if (!is.null(physpay)) {
    fields <- c(fields, "physpay")
    values <- c(values, if (is.null(physpay)) "NULL" else if (is(physpay, "subQuery")) paste0("(", as.character(physpay), ")") else paste0("'", as.character(physpay), "'"))
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    fields <- c(fields, "plankey")
    values <- c(values, if (is.null(plankey)) "NULL" else if (is(plankey, "subQuery")) paste0("(", as.character(plankey), ")") else paste0("'", as.character(plankey), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(poapdx)) {
    poapdx <- defaults$poapdx
  }
  if (!is.null(poapdx)) {
    fields <- c(fields, "poapdx")
    values <- c(values, if (is.null(poapdx)) "NULL" else if (is(poapdx, "subQuery")) paste0("(", as.character(poapdx), ")") else paste0("'", as.character(poapdx), "'"))
  }

  if (missing(poadx1)) {
    poadx1 <- defaults$poadx1
  }
  if (!is.null(poadx1)) {
    fields <- c(fields, "poadx1")
    values <- c(values, if (is.null(poadx1)) "NULL" else if (is(poadx1, "subQuery")) paste0("(", as.character(poadx1), ")") else paste0("'", as.character(poadx1), "'"))
  }

  if (missing(poadx2)) {
    poadx2 <- defaults$poadx2
  }
  if (!is.null(poadx2)) {
    fields <- c(fields, "poadx2")
    values <- c(values, if (is.null(poadx2)) "NULL" else if (is(poadx2, "subQuery")) paste0("(", as.character(poadx2), ")") else paste0("'", as.character(poadx2), "'"))
  }

  if (missing(poadx3)) {
    poadx3 <- defaults$poadx3
  }
  if (!is.null(poadx3)) {
    fields <- c(fields, "poadx3")
    values <- c(values, if (is.null(poadx3)) "NULL" else if (is(poadx3, "subQuery")) paste0("(", as.character(poadx3), ")") else paste0("'", as.character(poadx3), "'"))
  }

  if (missing(poadx4)) {
    poadx4 <- defaults$poadx4
  }
  if (!is.null(poadx4)) {
    fields <- c(fields, "poadx4")
    values <- c(values, if (is.null(poadx4)) "NULL" else if (is(poadx4, "subQuery")) paste0("(", as.character(poadx4), ")") else paste0("'", as.character(poadx4), "'"))
  }

  if (missing(poadx5)) {
    poadx5 <- defaults$poadx5
  }
  if (!is.null(poadx5)) {
    fields <- c(fields, "poadx5")
    values <- c(values, if (is.null(poadx5)) "NULL" else if (is(poadx5, "subQuery")) paste0("(", as.character(poadx5), ")") else paste0("'", as.character(poadx5), "'"))
  }

  if (missing(poadx6)) {
    poadx6 <- defaults$poadx6
  }
  if (!is.null(poadx6)) {
    fields <- c(fields, "poadx6")
    values <- c(values, if (is.null(poadx6)) "NULL" else if (is(poadx6, "subQuery")) paste0("(", as.character(poadx6), ")") else paste0("'", as.character(poadx6), "'"))
  }

  if (missing(poadx7)) {
    poadx7 <- defaults$poadx7
  }
  if (!is.null(poadx7)) {
    fields <- c(fields, "poadx7")
    values <- c(values, if (is.null(poadx7)) "NULL" else if (is(poadx7, "subQuery")) paste0("(", as.character(poadx7), ")") else paste0("'", as.character(poadx7), "'"))
  }

  if (missing(poadx8)) {
    poadx8 <- defaults$poadx8
  }
  if (!is.null(poadx8)) {
    fields <- c(fields, "poadx8")
    values <- c(values, if (is.null(poadx8)) "NULL" else if (is(poadx8, "subQuery")) paste0("(", as.character(poadx8), ")") else paste0("'", as.character(poadx8), "'"))
  }

  if (missing(poadx9)) {
    poadx9 <- defaults$poadx9
  }
  if (!is.null(poadx9)) {
    fields <- c(fields, "poadx9")
    values <- c(values, if (is.null(poadx9)) "NULL" else if (is(poadx9, "subQuery")) paste0("(", as.character(poadx9), ")") else paste0("'", as.character(poadx9), "'"))
  }

  if (missing(poadx10)) {
    poadx10 <- defaults$poadx10
  }
  if (!is.null(poadx10)) {
    fields <- c(fields, "poadx10")
    values <- c(values, if (is.null(poadx10)) "NULL" else if (is(poadx10, "subQuery")) paste0("(", as.character(poadx10), ")") else paste0("'", as.character(poadx10), "'"))
  }

  if (missing(poadx11)) {
    poadx11 <- defaults$poadx11
  }
  if (!is.null(poadx11)) {
    fields <- c(fields, "poadx11")
    values <- c(values, if (is.null(poadx11)) "NULL" else if (is(poadx11, "subQuery")) paste0("(", as.character(poadx11), ")") else paste0("'", as.character(poadx11), "'"))
  }

  if (missing(poadx12)) {
    poadx12 <- defaults$poadx12
  }
  if (!is.null(poadx12)) {
    fields <- c(fields, "poadx12")
    values <- c(values, if (is.null(poadx12)) "NULL" else if (is(poadx12, "subQuery")) paste0("(", as.character(poadx12), ")") else paste0("'", as.character(poadx12), "'"))
  }

  if (missing(poadx13)) {
    poadx13 <- defaults$poadx13
  }
  if (!is.null(poadx13)) {
    fields <- c(fields, "poadx13")
    values <- c(values, if (is.null(poadx13)) "NULL" else if (is(poadx13, "subQuery")) paste0("(", as.character(poadx13), ")") else paste0("'", as.character(poadx13), "'"))
  }

  if (missing(poadx14)) {
    poadx14 <- defaults$poadx14
  }
  if (!is.null(poadx14)) {
    fields <- c(fields, "poadx14")
    values <- c(values, if (is.null(poadx14)) "NULL" else if (is(poadx14, "subQuery")) paste0("(", as.character(poadx14), ")") else paste0("'", as.character(poadx14), "'"))
  }

  if (missing(poadx15)) {
    poadx15 <- defaults$poadx15
  }
  if (!is.null(poadx15)) {
    fields <- c(fields, "poadx15")
    values <- c(values, if (is.null(poadx15)) "NULL" else if (is(poadx15, "subQuery")) paste0("(", as.character(poadx15), ")") else paste0("'", as.character(poadx15), "'"))
  }

  if (missing(pproc)) {
    pproc <- defaults$pproc
  }
  if (!is.null(pproc)) {
    fields <- c(fields, "pproc")
    values <- c(values, if (is.null(pproc)) "NULL" else if (is(pproc, "subQuery")) paste0("(", as.character(pproc), ")") else paste0("'", as.character(pproc), "'"))
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    fields <- c(fields, "proc1")
    values <- c(values, if (is.null(proc1)) "NULL" else if (is(proc1, "subQuery")) paste0("(", as.character(proc1), ")") else paste0("'", as.character(proc1), "'"))
  }

  if (missing(proc10)) {
    proc10 <- defaults$proc10
  }
  if (!is.null(proc10)) {
    fields <- c(fields, "proc10")
    values <- c(values, if (is.null(proc10)) "NULL" else if (is(proc10, "subQuery")) paste0("(", as.character(proc10), ")") else paste0("'", as.character(proc10), "'"))
  }

  if (missing(proc11)) {
    proc11 <- defaults$proc11
  }
  if (!is.null(proc11)) {
    fields <- c(fields, "proc11")
    values <- c(values, if (is.null(proc11)) "NULL" else if (is(proc11, "subQuery")) paste0("(", as.character(proc11), ")") else paste0("'", as.character(proc11), "'"))
  }

  if (missing(proc12)) {
    proc12 <- defaults$proc12
  }
  if (!is.null(proc12)) {
    fields <- c(fields, "proc12")
    values <- c(values, if (is.null(proc12)) "NULL" else if (is(proc12, "subQuery")) paste0("(", as.character(proc12), ")") else paste0("'", as.character(proc12), "'"))
  }

  if (missing(proc13)) {
    proc13 <- defaults$proc13
  }
  if (!is.null(proc13)) {
    fields <- c(fields, "proc13")
    values <- c(values, if (is.null(proc13)) "NULL" else if (is(proc13, "subQuery")) paste0("(", as.character(proc13), ")") else paste0("'", as.character(proc13), "'"))
  }

  if (missing(proc14)) {
    proc14 <- defaults$proc14
  }
  if (!is.null(proc14)) {
    fields <- c(fields, "proc14")
    values <- c(values, if (is.null(proc14)) "NULL" else if (is(proc14, "subQuery")) paste0("(", as.character(proc14), ")") else paste0("'", as.character(proc14), "'"))
  }

  if (missing(proc15)) {
    proc15 <- defaults$proc15
  }
  if (!is.null(proc15)) {
    fields <- c(fields, "proc15")
    values <- c(values, if (is.null(proc15)) "NULL" else if (is(proc15, "subQuery")) paste0("(", as.character(proc15), ")") else paste0("'", as.character(proc15), "'"))
  }

  if (missing(proc2)) {
    proc2 <- defaults$proc2
  }
  if (!is.null(proc2)) {
    fields <- c(fields, "proc2")
    values <- c(values, if (is.null(proc2)) "NULL" else if (is(proc2, "subQuery")) paste0("(", as.character(proc2), ")") else paste0("'", as.character(proc2), "'"))
  }

  if (missing(proc3)) {
    proc3 <- defaults$proc3
  }
  if (!is.null(proc3)) {
    fields <- c(fields, "proc3")
    values <- c(values, if (is.null(proc3)) "NULL" else if (is(proc3, "subQuery")) paste0("(", as.character(proc3), ")") else paste0("'", as.character(proc3), "'"))
  }

  if (missing(proc4)) {
    proc4 <- defaults$proc4
  }
  if (!is.null(proc4)) {
    fields <- c(fields, "proc4")
    values <- c(values, if (is.null(proc4)) "NULL" else if (is(proc4, "subQuery")) paste0("(", as.character(proc4), ")") else paste0("'", as.character(proc4), "'"))
  }

  if (missing(proc5)) {
    proc5 <- defaults$proc5
  }
  if (!is.null(proc5)) {
    fields <- c(fields, "proc5")
    values <- c(values, if (is.null(proc5)) "NULL" else if (is(proc5, "subQuery")) paste0("(", as.character(proc5), ")") else paste0("'", as.character(proc5), "'"))
  }

  if (missing(proc6)) {
    proc6 <- defaults$proc6
  }
  if (!is.null(proc6)) {
    fields <- c(fields, "proc6")
    values <- c(values, if (is.null(proc6)) "NULL" else if (is(proc6, "subQuery")) paste0("(", as.character(proc6), ")") else paste0("'", as.character(proc6), "'"))
  }

  if (missing(proc7)) {
    proc7 <- defaults$proc7
  }
  if (!is.null(proc7)) {
    fields <- c(fields, "proc7")
    values <- c(values, if (is.null(proc7)) "NULL" else if (is(proc7, "subQuery")) paste0("(", as.character(proc7), ")") else paste0("'", as.character(proc7), "'"))
  }

  if (missing(proc8)) {
    proc8 <- defaults$proc8
  }
  if (!is.null(proc8)) {
    fields <- c(fields, "proc8")
    values <- c(values, if (is.null(proc8)) "NULL" else if (is(proc8, "subQuery")) paste0("(", as.character(proc8), ")") else paste0("'", as.character(proc8), "'"))
  }

  if (missing(proc9)) {
    proc9 <- defaults$proc9
  }
  if (!is.null(proc9)) {
    fields <- c(fields, "proc9")
    values <- c(values, if (is.null(proc9)) "NULL" else if (is(proc9, "subQuery")) paste0("(", as.character(proc9), ")") else paste0("'", as.character(proc9), "'"))
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    fields <- c(fields, "region")
    values <- c(values, if (is.null(region)) "NULL" else if (is(region, "subQuery")) paste0("(", as.character(region), ")") else paste0("'", as.character(region), "'"))
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    fields <- c(fields, "rx")
    values <- c(values, if (is.null(rx)) "NULL" else if (is(rx, "subQuery")) paste0("(", as.character(rx), ")") else paste0("'", as.character(rx), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(state)) {
    state <- defaults$state
  }
  if (!is.null(state)) {
    fields <- c(fields, "state")
    values <- c(values, if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (missing(totcob)) {
    totcob <- defaults$totcob
  }
  if (!is.null(totcob)) {
    fields <- c(fields, "totcob")
    values <- c(values, if (is.null(totcob)) "NULL" else if (is(totcob, "subQuery")) paste0("(", as.character(totcob), ")") else paste0("'", as.character(totcob), "'"))
  }

  if (missing(totcoins)) {
    totcoins <- defaults$totcoins
  }
  if (!is.null(totcoins)) {
    fields <- c(fields, "totcoins")
    values <- c(values, if (is.null(totcoins)) "NULL" else if (is(totcoins, "subQuery")) paste0("(", as.character(totcoins), ")") else paste0("'", as.character(totcoins), "'"))
  }

  if (missing(totcopay)) {
    totcopay <- defaults$totcopay
  }
  if (!is.null(totcopay)) {
    fields <- c(fields, "totcopay")
    values <- c(values, if (is.null(totcopay)) "NULL" else if (is(totcopay, "subQuery")) paste0("(", as.character(totcopay), ")") else paste0("'", as.character(totcopay), "'"))
  }

  if (missing(totded)) {
    totded <- defaults$totded
  }
  if (!is.null(totded)) {
    fields <- c(fields, "totded")
    values <- c(values, if (is.null(totded)) "NULL" else if (is(totded, "subQuery")) paste0("(", as.character(totded), ")") else paste0("'", as.character(totded), "'"))
  }

  if (missing(totnet)) {
    totnet <- defaults$totnet
  }
  if (!is.null(totnet)) {
    fields <- c(fields, "totnet")
    values <- c(values, if (is.null(totnet)) "NULL" else if (is(totnet, "subQuery")) paste0("(", as.character(totnet), ")") else paste0("'", as.character(totnet), "'"))
  }

  if (missing(totpay)) {
    totpay <- defaults$totpay
  }
  if (!is.null(totpay)) {
    fields <- c(fields, "totpay")
    values <- c(values, if (is.null(totpay)) "NULL" else if (is(totpay, "subQuery")) paste0("(", as.character(totpay), ")") else paste0("'", as.character(totpay), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    fields <- c(fields, "wgtkey")
    values <- c(values, if (is.null(wgtkey)) "NULL" else if (is(wgtkey, "subQuery")) paste0("(", as.character(wgtkey), ")") else paste0("'", as.character(wgtkey), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "inpatient_admissions", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_inpatient_services <- function(flag, admdate, admtyp, age, agegrp, cap_svc, caseid, cob, coins, copay, datatyp, deduct, disdate, dobyr, drg, dstatus, dx1, dx2, dx3, dx4, dx5, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, facprof, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pay, pddate, pdx, phyflag, plankey, plantyp, pproc, proc1, procmod, proctyp, provid, qty, region, revcode, rx, seqnum, sex, stdplac, stdprov, svcdate, svcscat, tsvcdat, version, wgtkey, year, units, npi, msclmid) {
  defaults <- get('inpatient_services', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(flag)) {
    flag <- defaults$flag
  }
  if (!is.null(flag)) {
    fields <- c(fields, "_flag")
    values <- c(values, if (is.null(flag)) "NULL" else if (is(flag, "subQuery")) paste0("(", as.character(flag), ")") else paste0("'", as.character(flag), "'"))
  }

  if (missing(admdate)) {
    admdate <- defaults$admdate
  }
  if (!is.null(admdate)) {
    fields <- c(fields, "admdate")
    values <- c(values, if (is.null(admdate)) "NULL" else if (is(admdate, "subQuery")) paste0("(", as.character(admdate), ")") else paste0("'", as.character(admdate), "'"))
  }

  if (missing(admtyp)) {
    admtyp <- defaults$admtyp
  }
  if (!is.null(admtyp)) {
    fields <- c(fields, "admtyp")
    values <- c(values, if (is.null(admtyp)) "NULL" else if (is(admtyp, "subQuery")) paste0("(", as.character(admtyp), ")") else paste0("'", as.character(admtyp), "'"))
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    fields <- c(fields, "age")
    values <- c(values, if (is.null(age)) "NULL" else if (is(age, "subQuery")) paste0("(", as.character(age), ")") else paste0("'", as.character(age), "'"))
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    fields <- c(fields, "agegrp")
    values <- c(values, if (is.null(agegrp)) "NULL" else if (is(agegrp, "subQuery")) paste0("(", as.character(agegrp), ")") else paste0("'", as.character(agegrp), "'"))
  }

  if (missing(cap_svc)) {
    cap_svc <- defaults$cap_svc
  }
  if (!is.null(cap_svc)) {
    fields <- c(fields, "cap_svc")
    values <- c(values, if (is.null(cap_svc)) "NULL" else if (is(cap_svc, "subQuery")) paste0("(", as.character(cap_svc), ")") else paste0("'", as.character(cap_svc), "'"))
  }

  if (missing(caseid)) {
    caseid <- defaults$caseid
  }
  if (!is.null(caseid)) {
    fields <- c(fields, "caseid")
    values <- c(values, if (is.null(caseid)) "NULL" else if (is(caseid, "subQuery")) paste0("(", as.character(caseid), ")") else paste0("'", as.character(caseid), "'"))
  }

  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    fields <- c(fields, "cob")
    values <- c(values, if (is.null(cob)) "NULL" else if (is(cob, "subQuery")) paste0("(", as.character(cob), ")") else paste0("'", as.character(cob), "'"))
  }

  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    fields <- c(fields, "coins")
    values <- c(values, if (is.null(coins)) "NULL" else if (is(coins, "subQuery")) paste0("(", as.character(coins), ")") else paste0("'", as.character(coins), "'"))
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    fields <- c(fields, "copay")
    values <- c(values, if (is.null(copay)) "NULL" else if (is(copay, "subQuery")) paste0("(", as.character(copay), ")") else paste0("'", as.character(copay), "'"))
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    fields <- c(fields, "datatyp")
    values <- c(values, if (is.null(datatyp)) "NULL" else if (is(datatyp, "subQuery")) paste0("(", as.character(datatyp), ")") else paste0("'", as.character(datatyp), "'"))
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    fields <- c(fields, "deduct")
    values <- c(values, if (is.null(deduct)) "NULL" else if (is(deduct, "subQuery")) paste0("(", as.character(deduct), ")") else paste0("'", as.character(deduct), "'"))
  }

  if (missing(disdate)) {
    disdate <- defaults$disdate
  }
  if (!is.null(disdate)) {
    fields <- c(fields, "disdate")
    values <- c(values, if (is.null(disdate)) "NULL" else if (is(disdate, "subQuery")) paste0("(", as.character(disdate), ")") else paste0("'", as.character(disdate), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(drg)) {
    drg <- defaults$drg
  }
  if (!is.null(drg)) {
    fields <- c(fields, "drg")
    values <- c(values, if (is.null(drg)) "NULL" else if (is(drg, "subQuery")) paste0("(", as.character(drg), ")") else paste0("'", as.character(drg), "'"))
  }

  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    fields <- c(fields, "dstatus")
    values <- c(values, if (is.null(dstatus)) "NULL" else if (is(dstatus, "subQuery")) paste0("(", as.character(dstatus), ")") else paste0("'", as.character(dstatus), "'"))
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    fields <- c(fields, "dx1")
    values <- c(values, if (is.null(dx1)) "NULL" else if (is(dx1, "subQuery")) paste0("(", as.character(dx1), ")") else paste0("'", as.character(dx1), "'"))
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    fields <- c(fields, "dx2")
    values <- c(values, if (is.null(dx2)) "NULL" else if (is(dx2, "subQuery")) paste0("(", as.character(dx2), ")") else paste0("'", as.character(dx2), "'"))
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    fields <- c(fields, "dx3")
    values <- c(values, if (is.null(dx3)) "NULL" else if (is(dx3, "subQuery")) paste0("(", as.character(dx3), ")") else paste0("'", as.character(dx3), "'"))
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    fields <- c(fields, "dx4")
    values <- c(values, if (is.null(dx4)) "NULL" else if (is(dx4, "subQuery")) paste0("(", as.character(dx4), ")") else paste0("'", as.character(dx4), "'"))
  }

  if (missing(dx5)) {
    dx5 <- defaults$dx5
  }
  if (!is.null(dx5)) {
    fields <- c(fields, "dx5")
    values <- c(values, if (is.null(dx5)) "NULL" else if (is(dx5, "subQuery")) paste0("(", as.character(dx5), ")") else paste0("'", as.character(dx5), "'"))
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    fields <- c(fields, "dxver")
    values <- c(values, if (is.null(dxver)) "NULL" else if (is(dxver, "subQuery")) paste0("(", as.character(dxver), ")") else paste0("'", as.character(dxver), "'"))
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    fields <- c(fields, "eeclass")
    values <- c(values, if (is.null(eeclass)) "NULL" else if (is(eeclass, "subQuery")) paste0("(", as.character(eeclass), ")") else paste0("'", as.character(eeclass), "'"))
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    fields <- c(fields, "eestatu")
    values <- c(values, if (is.null(eestatu)) "NULL" else if (is(eestatu, "subQuery")) paste0("(", as.character(eestatu), ")") else paste0("'", as.character(eestatu), "'"))
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    fields <- c(fields, "efamid")
    values <- c(values, if (is.null(efamid)) "NULL" else if (is(efamid, "subQuery")) paste0("(", as.character(efamid), ")") else paste0("'", as.character(efamid), "'"))
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    fields <- c(fields, "egeoloc")
    values <- c(values, if (is.null(egeoloc)) "NULL" else if (is(egeoloc, "subQuery")) paste0("(", as.character(egeoloc), ")") else paste0("'", as.character(egeoloc), "'"))
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    fields <- c(fields, "eidflag")
    values <- c(values, if (is.null(eidflag)) "NULL" else if (is(eidflag, "subQuery")) paste0("(", as.character(eidflag), ")") else paste0("'", as.character(eidflag), "'"))
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    fields <- c(fields, "emprel")
    values <- c(values, if (is.null(emprel)) "NULL" else if (is(emprel, "subQuery")) paste0("(", as.character(emprel), ")") else paste0("'", as.character(emprel), "'"))
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    fields <- c(fields, "enrflag")
    values <- c(values, if (is.null(enrflag)) "NULL" else if (is(enrflag, "subQuery")) paste0("(", as.character(enrflag), ")") else paste0("'", as.character(enrflag), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(fachdid)) {
    fachdid <- defaults$fachdid
  }
  if (!is.null(fachdid)) {
    fields <- c(fields, "fachdid")
    values <- c(values, if (is.null(fachdid)) "NULL" else if (is(fachdid, "subQuery")) paste0("(", as.character(fachdid), ")") else paste0("'", as.character(fachdid), "'"))
  }

  if (missing(facprof)) {
    facprof <- defaults$facprof
  }
  if (!is.null(facprof)) {
    fields <- c(fields, "facprof")
    values <- c(values, if (is.null(facprof)) "NULL" else if (is(facprof, "subQuery")) paste0("(", as.character(facprof), ")") else paste0("'", as.character(facprof), "'"))
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    fields <- c(fields, "hlthplan")
    values <- c(values, if (is.null(hlthplan)) "NULL" else if (is(hlthplan, "subQuery")) paste0("(", as.character(hlthplan), ")") else paste0("'", as.character(hlthplan), "'"))
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    fields <- c(fields, "indstry")
    values <- c(values, if (is.null(indstry)) "NULL" else if (is(indstry, "subQuery")) paste0("(", as.character(indstry), ")") else paste0("'", as.character(indstry), "'"))
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    fields <- c(fields, "mdc")
    values <- c(values, if (is.null(mdc)) "NULL" else if (is(mdc, "subQuery")) paste0("(", as.character(mdc), ")") else paste0("'", as.character(mdc), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    fields <- c(fields, "msa")
    values <- c(values, if (is.null(msa)) "NULL" else if (is(msa, "subQuery")) paste0("(", as.character(msa), ")") else paste0("'", as.character(msa), "'"))
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    fields <- c(fields, "netpay")
    values <- c(values, if (is.null(netpay)) "NULL" else if (is(netpay, "subQuery")) paste0("(", as.character(netpay), ")") else paste0("'", as.character(netpay), "'"))
  }

  if (missing(ntwkprov)) {
    ntwkprov <- defaults$ntwkprov
  }
  if (!is.null(ntwkprov)) {
    fields <- c(fields, "ntwkprov")
    values <- c(values, if (is.null(ntwkprov)) "NULL" else if (is(ntwkprov, "subQuery")) paste0("(", as.character(ntwkprov), ")") else paste0("'", as.character(ntwkprov), "'"))
  }

  if (missing(paidntwk)) {
    paidntwk <- defaults$paidntwk
  }
  if (!is.null(paidntwk)) {
    fields <- c(fields, "paidntwk")
    values <- c(values, if (is.null(paidntwk)) "NULL" else if (is(paidntwk, "subQuery")) paste0("(", as.character(paidntwk), ")") else paste0("'", as.character(paidntwk), "'"))
  }

  if (missing(pay)) {
    pay <- defaults$pay
  }
  if (!is.null(pay)) {
    fields <- c(fields, "pay")
    values <- c(values, if (is.null(pay)) "NULL" else if (is(pay, "subQuery")) paste0("(", as.character(pay), ")") else paste0("'", as.character(pay), "'"))
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    fields <- c(fields, "pddate")
    values <- c(values, if (is.null(pddate)) "NULL" else if (is(pddate, "subQuery")) paste0("(", as.character(pddate), ")") else paste0("'", as.character(pddate), "'"))
  }

  if (missing(pdx)) {
    pdx <- defaults$pdx
  }
  if (!is.null(pdx)) {
    fields <- c(fields, "pdx")
    values <- c(values, if (is.null(pdx)) "NULL" else if (is(pdx, "subQuery")) paste0("(", as.character(pdx), ")") else paste0("'", as.character(pdx), "'"))
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    fields <- c(fields, "phyflag")
    values <- c(values, if (is.null(phyflag)) "NULL" else if (is(phyflag, "subQuery")) paste0("(", as.character(phyflag), ")") else paste0("'", as.character(phyflag), "'"))
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    fields <- c(fields, "plankey")
    values <- c(values, if (is.null(plankey)) "NULL" else if (is(plankey, "subQuery")) paste0("(", as.character(plankey), ")") else paste0("'", as.character(plankey), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(pproc)) {
    pproc <- defaults$pproc
  }
  if (!is.null(pproc)) {
    fields <- c(fields, "pproc")
    values <- c(values, if (is.null(pproc)) "NULL" else if (is(pproc, "subQuery")) paste0("(", as.character(pproc), ")") else paste0("'", as.character(pproc), "'"))
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    fields <- c(fields, "proc1")
    values <- c(values, if (is.null(proc1)) "NULL" else if (is(proc1, "subQuery")) paste0("(", as.character(proc1), ")") else paste0("'", as.character(proc1), "'"))
  }

  if (missing(procmod)) {
    procmod <- defaults$procmod
  }
  if (!is.null(procmod)) {
    fields <- c(fields, "procmod")
    values <- c(values, if (is.null(procmod)) "NULL" else if (is(procmod, "subQuery")) paste0("(", as.character(procmod), ")") else paste0("'", as.character(procmod), "'"))
  }

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    fields <- c(fields, "proctyp")
    values <- c(values, if (is.null(proctyp)) "NULL" else if (is(proctyp, "subQuery")) paste0("(", as.character(proctyp), ")") else paste0("'", as.character(proctyp), "'"))
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    fields <- c(fields, "provid")
    values <- c(values, if (is.null(provid)) "NULL" else if (is(provid, "subQuery")) paste0("(", as.character(provid), ")") else paste0("'", as.character(provid), "'"))
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    fields <- c(fields, "qty")
    values <- c(values, if (is.null(qty)) "NULL" else if (is(qty, "subQuery")) paste0("(", as.character(qty), ")") else paste0("'", as.character(qty), "'"))
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    fields <- c(fields, "region")
    values <- c(values, if (is.null(region)) "NULL" else if (is(region, "subQuery")) paste0("(", as.character(region), ")") else paste0("'", as.character(region), "'"))
  }

  if (missing(revcode)) {
    revcode <- defaults$revcode
  }
  if (!is.null(revcode)) {
    fields <- c(fields, "revcode")
    values <- c(values, if (is.null(revcode)) "NULL" else if (is(revcode, "subQuery")) paste0("(", as.character(revcode), ")") else paste0("'", as.character(revcode), "'"))
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    fields <- c(fields, "rx")
    values <- c(values, if (is.null(rx)) "NULL" else if (is(rx, "subQuery")) paste0("(", as.character(rx), ")") else paste0("'", as.character(rx), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    fields <- c(fields, "stdplac")
    values <- c(values, if (is.null(stdplac)) "NULL" else if (is(stdplac, "subQuery")) paste0("(", as.character(stdplac), ")") else paste0("'", as.character(stdplac), "'"))
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    fields <- c(fields, "stdprov")
    values <- c(values, if (is.null(stdprov)) "NULL" else if (is(stdprov, "subQuery")) paste0("(", as.character(stdprov), ")") else paste0("'", as.character(stdprov), "'"))
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    fields <- c(fields, "svcdate")
    values <- c(values, if (is.null(svcdate)) "NULL" else if (is(svcdate, "subQuery")) paste0("(", as.character(svcdate), ")") else paste0("'", as.character(svcdate), "'"))
  }

  if (missing(svcscat)) {
    svcscat <- defaults$svcscat
  }
  if (!is.null(svcscat)) {
    fields <- c(fields, "svcscat")
    values <- c(values, if (is.null(svcscat)) "NULL" else if (is(svcscat, "subQuery")) paste0("(", as.character(svcscat), ")") else paste0("'", as.character(svcscat), "'"))
  }

  if (missing(tsvcdat)) {
    tsvcdat <- defaults$tsvcdat
  }
  if (!is.null(tsvcdat)) {
    fields <- c(fields, "tsvcdat")
    values <- c(values, if (is.null(tsvcdat)) "NULL" else if (is(tsvcdat, "subQuery")) paste0("(", as.character(tsvcdat), ")") else paste0("'", as.character(tsvcdat), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    fields <- c(fields, "wgtkey")
    values <- c(values, if (is.null(wgtkey)) "NULL" else if (is(wgtkey, "subQuery")) paste0("(", as.character(wgtkey), ")") else paste0("'", as.character(wgtkey), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  if (missing(units)) {
    units <- defaults$units
  }
  if (!is.null(units)) {
    fields <- c(fields, "units")
    values <- c(values, if (is.null(units)) "NULL" else if (is(units, "subQuery")) paste0("(", as.character(units), ")") else paste0("'", as.character(units), "'"))
  }

  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (missing(msclmid)) {
    msclmid <- defaults$msclmid
  }
  if (!is.null(msclmid)) {
    fields <- c(fields, "msclmid")
    values <- c(values, if (is.null(msclmid)) "NULL" else if (is(msclmid, "subQuery")) paste0("(", as.character(msclmid), ")") else paste0("'", as.character(msclmid), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "inpatient_services", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_lab <- function(enrolid, seqnum, abnormal, agegrp, eeclass, eestatu, eidflag, emprel, enrflag, hlthplan, indstry, mhsacovg, phyflag, proctyp, region, rx, sex, egeoloc, mdc, version, resltcat, dx1, proc1, pddate, svcdate, msa, orderid, provid, refhigh, reflow, result, testcnt, dobyr, plankey, stdprov, wgtkey, year, age, datatyp, plantyp, stdplac, loinccd, resunit, efamid, dxver) {
  defaults <- get('lab', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(abnormal)) {
    abnormal <- defaults$abnormal
  }
  if (!is.null(abnormal)) {
    fields <- c(fields, "abnormal")
    values <- c(values, if (is.null(abnormal)) "NULL" else if (is(abnormal, "subQuery")) paste0("(", as.character(abnormal), ")") else paste0("'", as.character(abnormal), "'"))
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    fields <- c(fields, "agegrp")
    values <- c(values, if (is.null(agegrp)) "NULL" else if (is(agegrp, "subQuery")) paste0("(", as.character(agegrp), ")") else paste0("'", as.character(agegrp), "'"))
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    fields <- c(fields, "eeclass")
    values <- c(values, if (is.null(eeclass)) "NULL" else if (is(eeclass, "subQuery")) paste0("(", as.character(eeclass), ")") else paste0("'", as.character(eeclass), "'"))
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    fields <- c(fields, "eestatu")
    values <- c(values, if (is.null(eestatu)) "NULL" else if (is(eestatu, "subQuery")) paste0("(", as.character(eestatu), ")") else paste0("'", as.character(eestatu), "'"))
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    fields <- c(fields, "eidflag")
    values <- c(values, if (is.null(eidflag)) "NULL" else if (is(eidflag, "subQuery")) paste0("(", as.character(eidflag), ")") else paste0("'", as.character(eidflag), "'"))
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    fields <- c(fields, "emprel")
    values <- c(values, if (is.null(emprel)) "NULL" else if (is(emprel, "subQuery")) paste0("(", as.character(emprel), ")") else paste0("'", as.character(emprel), "'"))
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    fields <- c(fields, "enrflag")
    values <- c(values, if (is.null(enrflag)) "NULL" else if (is(enrflag, "subQuery")) paste0("(", as.character(enrflag), ")") else paste0("'", as.character(enrflag), "'"))
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    fields <- c(fields, "hlthplan")
    values <- c(values, if (is.null(hlthplan)) "NULL" else if (is(hlthplan, "subQuery")) paste0("(", as.character(hlthplan), ")") else paste0("'", as.character(hlthplan), "'"))
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    fields <- c(fields, "indstry")
    values <- c(values, if (is.null(indstry)) "NULL" else if (is(indstry, "subQuery")) paste0("(", as.character(indstry), ")") else paste0("'", as.character(indstry), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    fields <- c(fields, "phyflag")
    values <- c(values, if (is.null(phyflag)) "NULL" else if (is(phyflag, "subQuery")) paste0("(", as.character(phyflag), ")") else paste0("'", as.character(phyflag), "'"))
  }

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    fields <- c(fields, "proctyp")
    values <- c(values, if (is.null(proctyp)) "NULL" else if (is(proctyp, "subQuery")) paste0("(", as.character(proctyp), ")") else paste0("'", as.character(proctyp), "'"))
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    fields <- c(fields, "region")
    values <- c(values, if (is.null(region)) "NULL" else if (is(region, "subQuery")) paste0("(", as.character(region), ")") else paste0("'", as.character(region), "'"))
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    fields <- c(fields, "rx")
    values <- c(values, if (is.null(rx)) "NULL" else if (is(rx, "subQuery")) paste0("(", as.character(rx), ")") else paste0("'", as.character(rx), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    fields <- c(fields, "egeoloc")
    values <- c(values, if (is.null(egeoloc)) "NULL" else if (is(egeoloc, "subQuery")) paste0("(", as.character(egeoloc), ")") else paste0("'", as.character(egeoloc), "'"))
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    fields <- c(fields, "mdc")
    values <- c(values, if (is.null(mdc)) "NULL" else if (is(mdc, "subQuery")) paste0("(", as.character(mdc), ")") else paste0("'", as.character(mdc), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(resltcat)) {
    resltcat <- defaults$resltcat
  }
  if (!is.null(resltcat)) {
    fields <- c(fields, "resltcat")
    values <- c(values, if (is.null(resltcat)) "NULL" else if (is(resltcat, "subQuery")) paste0("(", as.character(resltcat), ")") else paste0("'", as.character(resltcat), "'"))
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    fields <- c(fields, "dx1")
    values <- c(values, if (is.null(dx1)) "NULL" else if (is(dx1, "subQuery")) paste0("(", as.character(dx1), ")") else paste0("'", as.character(dx1), "'"))
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    fields <- c(fields, "proc1")
    values <- c(values, if (is.null(proc1)) "NULL" else if (is(proc1, "subQuery")) paste0("(", as.character(proc1), ")") else paste0("'", as.character(proc1), "'"))
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    fields <- c(fields, "pddate")
    values <- c(values, if (is.null(pddate)) "NULL" else if (is(pddate, "subQuery")) paste0("(", as.character(pddate), ")") else paste0("'", as.character(pddate), "'"))
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    fields <- c(fields, "svcdate")
    values <- c(values, if (is.null(svcdate)) "NULL" else if (is(svcdate, "subQuery")) paste0("(", as.character(svcdate), ")") else paste0("'", as.character(svcdate), "'"))
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    fields <- c(fields, "msa")
    values <- c(values, if (is.null(msa)) "NULL" else if (is(msa, "subQuery")) paste0("(", as.character(msa), ")") else paste0("'", as.character(msa), "'"))
  }

  if (missing(orderid)) {
    orderid <- defaults$orderid
  }
  if (!is.null(orderid)) {
    fields <- c(fields, "orderid")
    values <- c(values, if (is.null(orderid)) "NULL" else if (is(orderid, "subQuery")) paste0("(", as.character(orderid), ")") else paste0("'", as.character(orderid), "'"))
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    fields <- c(fields, "provid")
    values <- c(values, if (is.null(provid)) "NULL" else if (is(provid, "subQuery")) paste0("(", as.character(provid), ")") else paste0("'", as.character(provid), "'"))
  }

  if (missing(refhigh)) {
    refhigh <- defaults$refhigh
  }
  if (!is.null(refhigh)) {
    fields <- c(fields, "refhigh")
    values <- c(values, if (is.null(refhigh)) "NULL" else if (is(refhigh, "subQuery")) paste0("(", as.character(refhigh), ")") else paste0("'", as.character(refhigh), "'"))
  }

  if (missing(reflow)) {
    reflow <- defaults$reflow
  }
  if (!is.null(reflow)) {
    fields <- c(fields, "reflow")
    values <- c(values, if (is.null(reflow)) "NULL" else if (is(reflow, "subQuery")) paste0("(", as.character(reflow), ")") else paste0("'", as.character(reflow), "'"))
  }

  if (missing(result)) {
    result <- defaults$result
  }
  if (!is.null(result)) {
    fields <- c(fields, "result")
    values <- c(values, if (is.null(result)) "NULL" else if (is(result, "subQuery")) paste0("(", as.character(result), ")") else paste0("'", as.character(result), "'"))
  }

  if (missing(testcnt)) {
    testcnt <- defaults$testcnt
  }
  if (!is.null(testcnt)) {
    fields <- c(fields, "testcnt")
    values <- c(values, if (is.null(testcnt)) "NULL" else if (is(testcnt, "subQuery")) paste0("(", as.character(testcnt), ")") else paste0("'", as.character(testcnt), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    fields <- c(fields, "plankey")
    values <- c(values, if (is.null(plankey)) "NULL" else if (is(plankey, "subQuery")) paste0("(", as.character(plankey), ")") else paste0("'", as.character(plankey), "'"))
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    fields <- c(fields, "stdprov")
    values <- c(values, if (is.null(stdprov)) "NULL" else if (is(stdprov, "subQuery")) paste0("(", as.character(stdprov), ")") else paste0("'", as.character(stdprov), "'"))
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    fields <- c(fields, "wgtkey")
    values <- c(values, if (is.null(wgtkey)) "NULL" else if (is(wgtkey, "subQuery")) paste0("(", as.character(wgtkey), ")") else paste0("'", as.character(wgtkey), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    fields <- c(fields, "age")
    values <- c(values, if (is.null(age)) "NULL" else if (is(age, "subQuery")) paste0("(", as.character(age), ")") else paste0("'", as.character(age), "'"))
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    fields <- c(fields, "datatyp")
    values <- c(values, if (is.null(datatyp)) "NULL" else if (is(datatyp, "subQuery")) paste0("(", as.character(datatyp), ")") else paste0("'", as.character(datatyp), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    fields <- c(fields, "stdplac")
    values <- c(values, if (is.null(stdplac)) "NULL" else if (is(stdplac, "subQuery")) paste0("(", as.character(stdplac), ")") else paste0("'", as.character(stdplac), "'"))
  }

  if (missing(loinccd)) {
    loinccd <- defaults$loinccd
  }
  if (!is.null(loinccd)) {
    fields <- c(fields, "loinccd")
    values <- c(values, if (is.null(loinccd)) "NULL" else if (is(loinccd, "subQuery")) paste0("(", as.character(loinccd), ")") else paste0("'", as.character(loinccd), "'"))
  }

  if (missing(resunit)) {
    resunit <- defaults$resunit
  }
  if (!is.null(resunit)) {
    fields <- c(fields, "resunit")
    values <- c(values, if (is.null(resunit)) "NULL" else if (is(resunit, "subQuery")) paste0("(", as.character(resunit), ")") else paste0("'", as.character(resunit), "'"))
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    fields <- c(fields, "efamid")
    values <- c(values, if (is.null(efamid)) "NULL" else if (is(efamid, "subQuery")) paste0("(", as.character(efamid), ")") else paste0("'", as.character(efamid), "'"))
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    fields <- c(fields, "dxver")
    values <- c(values, if (is.null(dxver)) "NULL" else if (is(dxver, "subQuery")) paste0("(", as.character(dxver), ")") else paste0("'", as.character(dxver), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "lab", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_outpatient_services <- function(flag, age, agegrp, cap_svc, cob, coins, copay, datatyp, deduct, dobyr, dx1, dx2, dx3, dx4, dx5, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, facprof, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pay, pddate, phyflag, plankey, plantyp, proc1, procgrp, procmod, proctyp, provid, qty, region, revcode, rx, seqnum, sex, stdplac, stdprov, svcdate, svcscat, tsvcdat, version, wgtkey, year, units, npi, msclmid) {
  defaults <- get('outpatient_services', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(flag)) {
    flag <- defaults$flag
  }
  if (!is.null(flag)) {
    fields <- c(fields, "_flag")
    values <- c(values, if (is.null(flag)) "NULL" else if (is(flag, "subQuery")) paste0("(", as.character(flag), ")") else paste0("'", as.character(flag), "'"))
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    fields <- c(fields, "age")
    values <- c(values, if (is.null(age)) "NULL" else if (is(age, "subQuery")) paste0("(", as.character(age), ")") else paste0("'", as.character(age), "'"))
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    fields <- c(fields, "agegrp")
    values <- c(values, if (is.null(agegrp)) "NULL" else if (is(agegrp, "subQuery")) paste0("(", as.character(agegrp), ")") else paste0("'", as.character(agegrp), "'"))
  }

  if (missing(cap_svc)) {
    cap_svc <- defaults$cap_svc
  }
  if (!is.null(cap_svc)) {
    fields <- c(fields, "cap_svc")
    values <- c(values, if (is.null(cap_svc)) "NULL" else if (is(cap_svc, "subQuery")) paste0("(", as.character(cap_svc), ")") else paste0("'", as.character(cap_svc), "'"))
  }

  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    fields <- c(fields, "cob")
    values <- c(values, if (is.null(cob)) "NULL" else if (is(cob, "subQuery")) paste0("(", as.character(cob), ")") else paste0("'", as.character(cob), "'"))
  }

  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    fields <- c(fields, "coins")
    values <- c(values, if (is.null(coins)) "NULL" else if (is(coins, "subQuery")) paste0("(", as.character(coins), ")") else paste0("'", as.character(coins), "'"))
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    fields <- c(fields, "copay")
    values <- c(values, if (is.null(copay)) "NULL" else if (is(copay, "subQuery")) paste0("(", as.character(copay), ")") else paste0("'", as.character(copay), "'"))
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    fields <- c(fields, "datatyp")
    values <- c(values, if (is.null(datatyp)) "NULL" else if (is(datatyp, "subQuery")) paste0("(", as.character(datatyp), ")") else paste0("'", as.character(datatyp), "'"))
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    fields <- c(fields, "deduct")
    values <- c(values, if (is.null(deduct)) "NULL" else if (is(deduct, "subQuery")) paste0("(", as.character(deduct), ")") else paste0("'", as.character(deduct), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    fields <- c(fields, "dx1")
    values <- c(values, if (is.null(dx1)) "NULL" else if (is(dx1, "subQuery")) paste0("(", as.character(dx1), ")") else paste0("'", as.character(dx1), "'"))
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    fields <- c(fields, "dx2")
    values <- c(values, if (is.null(dx2)) "NULL" else if (is(dx2, "subQuery")) paste0("(", as.character(dx2), ")") else paste0("'", as.character(dx2), "'"))
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    fields <- c(fields, "dx3")
    values <- c(values, if (is.null(dx3)) "NULL" else if (is(dx3, "subQuery")) paste0("(", as.character(dx3), ")") else paste0("'", as.character(dx3), "'"))
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    fields <- c(fields, "dx4")
    values <- c(values, if (is.null(dx4)) "NULL" else if (is(dx4, "subQuery")) paste0("(", as.character(dx4), ")") else paste0("'", as.character(dx4), "'"))
  }

  if (missing(dx5)) {
    dx5 <- defaults$dx5
  }
  if (!is.null(dx5)) {
    fields <- c(fields, "dx5")
    values <- c(values, if (is.null(dx5)) "NULL" else if (is(dx5, "subQuery")) paste0("(", as.character(dx5), ")") else paste0("'", as.character(dx5), "'"))
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    fields <- c(fields, "dxver")
    values <- c(values, if (is.null(dxver)) "NULL" else if (is(dxver, "subQuery")) paste0("(", as.character(dxver), ")") else paste0("'", as.character(dxver), "'"))
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    fields <- c(fields, "eeclass")
    values <- c(values, if (is.null(eeclass)) "NULL" else if (is(eeclass, "subQuery")) paste0("(", as.character(eeclass), ")") else paste0("'", as.character(eeclass), "'"))
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    fields <- c(fields, "eestatu")
    values <- c(values, if (is.null(eestatu)) "NULL" else if (is(eestatu, "subQuery")) paste0("(", as.character(eestatu), ")") else paste0("'", as.character(eestatu), "'"))
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    fields <- c(fields, "efamid")
    values <- c(values, if (is.null(efamid)) "NULL" else if (is(efamid, "subQuery")) paste0("(", as.character(efamid), ")") else paste0("'", as.character(efamid), "'"))
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    fields <- c(fields, "egeoloc")
    values <- c(values, if (is.null(egeoloc)) "NULL" else if (is(egeoloc, "subQuery")) paste0("(", as.character(egeoloc), ")") else paste0("'", as.character(egeoloc), "'"))
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    fields <- c(fields, "eidflag")
    values <- c(values, if (is.null(eidflag)) "NULL" else if (is(eidflag, "subQuery")) paste0("(", as.character(eidflag), ")") else paste0("'", as.character(eidflag), "'"))
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    fields <- c(fields, "emprel")
    values <- c(values, if (is.null(emprel)) "NULL" else if (is(emprel, "subQuery")) paste0("(", as.character(emprel), ")") else paste0("'", as.character(emprel), "'"))
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    fields <- c(fields, "enrflag")
    values <- c(values, if (is.null(enrflag)) "NULL" else if (is(enrflag, "subQuery")) paste0("(", as.character(enrflag), ")") else paste0("'", as.character(enrflag), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(fachdid)) {
    fachdid <- defaults$fachdid
  }
  if (!is.null(fachdid)) {
    fields <- c(fields, "fachdid")
    values <- c(values, if (is.null(fachdid)) "NULL" else if (is(fachdid, "subQuery")) paste0("(", as.character(fachdid), ")") else paste0("'", as.character(fachdid), "'"))
  }

  if (missing(facprof)) {
    facprof <- defaults$facprof
  }
  if (!is.null(facprof)) {
    fields <- c(fields, "facprof")
    values <- c(values, if (is.null(facprof)) "NULL" else if (is(facprof, "subQuery")) paste0("(", as.character(facprof), ")") else paste0("'", as.character(facprof), "'"))
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    fields <- c(fields, "hlthplan")
    values <- c(values, if (is.null(hlthplan)) "NULL" else if (is(hlthplan, "subQuery")) paste0("(", as.character(hlthplan), ")") else paste0("'", as.character(hlthplan), "'"))
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    fields <- c(fields, "indstry")
    values <- c(values, if (is.null(indstry)) "NULL" else if (is(indstry, "subQuery")) paste0("(", as.character(indstry), ")") else paste0("'", as.character(indstry), "'"))
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    fields <- c(fields, "mdc")
    values <- c(values, if (is.null(mdc)) "NULL" else if (is(mdc, "subQuery")) paste0("(", as.character(mdc), ")") else paste0("'", as.character(mdc), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    fields <- c(fields, "msa")
    values <- c(values, if (is.null(msa)) "NULL" else if (is(msa, "subQuery")) paste0("(", as.character(msa), ")") else paste0("'", as.character(msa), "'"))
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    fields <- c(fields, "netpay")
    values <- c(values, if (is.null(netpay)) "NULL" else if (is(netpay, "subQuery")) paste0("(", as.character(netpay), ")") else paste0("'", as.character(netpay), "'"))
  }

  if (missing(ntwkprov)) {
    ntwkprov <- defaults$ntwkprov
  }
  if (!is.null(ntwkprov)) {
    fields <- c(fields, "ntwkprov")
    values <- c(values, if (is.null(ntwkprov)) "NULL" else if (is(ntwkprov, "subQuery")) paste0("(", as.character(ntwkprov), ")") else paste0("'", as.character(ntwkprov), "'"))
  }

  if (missing(paidntwk)) {
    paidntwk <- defaults$paidntwk
  }
  if (!is.null(paidntwk)) {
    fields <- c(fields, "paidntwk")
    values <- c(values, if (is.null(paidntwk)) "NULL" else if (is(paidntwk, "subQuery")) paste0("(", as.character(paidntwk), ")") else paste0("'", as.character(paidntwk), "'"))
  }

  if (missing(pay)) {
    pay <- defaults$pay
  }
  if (!is.null(pay)) {
    fields <- c(fields, "pay")
    values <- c(values, if (is.null(pay)) "NULL" else if (is(pay, "subQuery")) paste0("(", as.character(pay), ")") else paste0("'", as.character(pay), "'"))
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    fields <- c(fields, "pddate")
    values <- c(values, if (is.null(pddate)) "NULL" else if (is(pddate, "subQuery")) paste0("(", as.character(pddate), ")") else paste0("'", as.character(pddate), "'"))
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    fields <- c(fields, "phyflag")
    values <- c(values, if (is.null(phyflag)) "NULL" else if (is(phyflag, "subQuery")) paste0("(", as.character(phyflag), ")") else paste0("'", as.character(phyflag), "'"))
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    fields <- c(fields, "plankey")
    values <- c(values, if (is.null(plankey)) "NULL" else if (is(plankey, "subQuery")) paste0("(", as.character(plankey), ")") else paste0("'", as.character(plankey), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    fields <- c(fields, "proc1")
    values <- c(values, if (is.null(proc1)) "NULL" else if (is(proc1, "subQuery")) paste0("(", as.character(proc1), ")") else paste0("'", as.character(proc1), "'"))
  }

  if (missing(procgrp)) {
    procgrp <- defaults$procgrp
  }
  if (!is.null(procgrp)) {
    fields <- c(fields, "procgrp")
    values <- c(values, if (is.null(procgrp)) "NULL" else if (is(procgrp, "subQuery")) paste0("(", as.character(procgrp), ")") else paste0("'", as.character(procgrp), "'"))
  }

  if (missing(procmod)) {
    procmod <- defaults$procmod
  }
  if (!is.null(procmod)) {
    fields <- c(fields, "procmod")
    values <- c(values, if (is.null(procmod)) "NULL" else if (is(procmod, "subQuery")) paste0("(", as.character(procmod), ")") else paste0("'", as.character(procmod), "'"))
  }

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    fields <- c(fields, "proctyp")
    values <- c(values, if (is.null(proctyp)) "NULL" else if (is(proctyp, "subQuery")) paste0("(", as.character(proctyp), ")") else paste0("'", as.character(proctyp), "'"))
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    fields <- c(fields, "provid")
    values <- c(values, if (is.null(provid)) "NULL" else if (is(provid, "subQuery")) paste0("(", as.character(provid), ")") else paste0("'", as.character(provid), "'"))
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    fields <- c(fields, "qty")
    values <- c(values, if (is.null(qty)) "NULL" else if (is(qty, "subQuery")) paste0("(", as.character(qty), ")") else paste0("'", as.character(qty), "'"))
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    fields <- c(fields, "region")
    values <- c(values, if (is.null(region)) "NULL" else if (is(region, "subQuery")) paste0("(", as.character(region), ")") else paste0("'", as.character(region), "'"))
  }

  if (missing(revcode)) {
    revcode <- defaults$revcode
  }
  if (!is.null(revcode)) {
    fields <- c(fields, "revcode")
    values <- c(values, if (is.null(revcode)) "NULL" else if (is(revcode, "subQuery")) paste0("(", as.character(revcode), ")") else paste0("'", as.character(revcode), "'"))
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    fields <- c(fields, "rx")
    values <- c(values, if (is.null(rx)) "NULL" else if (is(rx, "subQuery")) paste0("(", as.character(rx), ")") else paste0("'", as.character(rx), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    fields <- c(fields, "stdplac")
    values <- c(values, if (is.null(stdplac)) "NULL" else if (is(stdplac, "subQuery")) paste0("(", as.character(stdplac), ")") else paste0("'", as.character(stdplac), "'"))
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    fields <- c(fields, "stdprov")
    values <- c(values, if (is.null(stdprov)) "NULL" else if (is(stdprov, "subQuery")) paste0("(", as.character(stdprov), ")") else paste0("'", as.character(stdprov), "'"))
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    fields <- c(fields, "svcdate")
    values <- c(values, if (is.null(svcdate)) "NULL" else if (is(svcdate, "subQuery")) paste0("(", as.character(svcdate), ")") else paste0("'", as.character(svcdate), "'"))
  }

  if (missing(svcscat)) {
    svcscat <- defaults$svcscat
  }
  if (!is.null(svcscat)) {
    fields <- c(fields, "svcscat")
    values <- c(values, if (is.null(svcscat)) "NULL" else if (is(svcscat, "subQuery")) paste0("(", as.character(svcscat), ")") else paste0("'", as.character(svcscat), "'"))
  }

  if (missing(tsvcdat)) {
    tsvcdat <- defaults$tsvcdat
  }
  if (!is.null(tsvcdat)) {
    fields <- c(fields, "tsvcdat")
    values <- c(values, if (is.null(tsvcdat)) "NULL" else if (is(tsvcdat, "subQuery")) paste0("(", as.character(tsvcdat), ")") else paste0("'", as.character(tsvcdat), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    fields <- c(fields, "wgtkey")
    values <- c(values, if (is.null(wgtkey)) "NULL" else if (is(wgtkey, "subQuery")) paste0("(", as.character(wgtkey), ")") else paste0("'", as.character(wgtkey), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  if (missing(units)) {
    units <- defaults$units
  }
  if (!is.null(units)) {
    fields <- c(fields, "units")
    values <- c(values, if (is.null(units)) "NULL" else if (is(units, "subQuery")) paste0("(", as.character(units), ")") else paste0("'", as.character(units), "'"))
  }

  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (missing(msclmid)) {
    msclmid <- defaults$msclmid
  }
  if (!is.null(msclmid)) {
    fields <- c(fields, "msclmid")
    values <- c(values, if (is.null(msclmid)) "NULL" else if (is(msclmid, "subQuery")) paste0("(", as.character(msclmid), ")") else paste0("'", as.character(msclmid), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "outpatient_services", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

expect_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, visit_detail_id, condition_source_value, condition_source_concept_id, condition_status_source_value, condition_status_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(condition_occurrence_id)) {
    fields <- c(fields, "condition_occurrence_id")
    values <- c(values, if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    fields <- c(fields, "condition_start_date")
    values <- c(values, if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_start_datetime)) {
    fields <- c(fields, "condition_start_datetime")
    values <- c(values, if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_date)) {
    fields <- c(fields, "condition_end_date")
    values <- c(values, if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_end_datetime)) {
    fields <- c(fields, "condition_end_datetime")
    values <- c(values, if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    fields <- c(fields, "condition_type_concept_id")
    values <- c(values, if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_source_value)) {
    fields <- c(fields, "condition_source_value")
    values <- c(values, if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    fields <- c(fields, "condition_source_concept_id")
    values <- c(values, if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    fields <- c(fields, "condition_status_source_value")
    values <- c(values, if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    fields <- c(fields, "condition_status_concept_id")
    values <- c(values, if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "condition_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_death <- function(person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    fields <- c(fields, "death_date")
    values <- c(values, if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    fields <- c(fields, "death_datetime")
    values <- c(values, if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    fields <- c(fields, "death_type_concept_id")
    values <- c(values, if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    fields <- c(fields, "cause_concept_id")
    values <- c(values, if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    fields <- c(fields, "cause_source_value")
    values <- c(values, if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    fields <- c(fields, "cause_source_concept_id")
    values <- c(values, if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "death", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source__concept_id, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(device_exposure_id)) {
    fields <- c(fields, "device_exposure_id")
    values <- c(values, if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    fields <- c(fields, "device_concept_id")
    values <- c(values, if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    fields <- c(fields, "device_exposure_start_date")
    values <- c(values, if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    fields <- c(fields, "device_exposure_start_datetime")
    values <- c(values, if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    fields <- c(fields, "device_exposure_end_date")
    values <- c(values, if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    fields <- c(fields, "device_exposure_end_datetime")
    values <- c(values, if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    fields <- c(fields, "device_type_concept_id")
    values <- c(values, if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    fields <- c(fields, "unique_device_id")
    values <- c(values, if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(device_source_value)) {
    fields <- c(fields, "device_source_value")
    values <- c(values, if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    fields <- c(fields, "[device_source_ concept_id]")
    values <- c(values, if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "device_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_drug_exposure <- function(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, verbatim_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(drug_exposure_id)) {
    fields <- c(fields, "drug_exposure_id")
    values <- c(values, if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    fields <- c(fields, "drug_exposure_start_date")
    values <- c(values, if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    fields <- c(fields, "drug_exposure_start_datetime")
    values <- c(values, if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    fields <- c(fields, "drug_exposure_end_date")
    values <- c(values, if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    fields <- c(fields, "drug_exposure_end_datetime")
    values <- c(values, if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    fields <- c(fields, "verbatim_end_date")
    values <- c(values, if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    fields <- c(fields, "drug_type_concept_id")
    values <- c(values, if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    fields <- c(fields, "refills")
    values <- c(values, if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(days_supply)) {
    fields <- c(fields, "days_supply")
    values <- c(values, if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(sig)) {
    fields <- c(fields, "sig")
    values <- c(values, if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(route_concept_id)) {
    fields <- c(fields, "route_concept_id")
    values <- c(values, if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    fields <- c(fields, "lot_number")
    values <- c(values, if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(drug_source_value)) {
    fields <- c(fields, "drug_source_value")
    values <- c(values, if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    fields <- c(fields, "drug_source_concept_id")
    values <- c(values, if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(route_source_value)) {
    fields <- c(fields, "route_source_value")
    values <- c(values, if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    fields <- c(fields, "dose_unit_source_value")
    values <- c(values, if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "drug_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_concept_id_1)) {
    fields <- c(fields, "domain_concept_id_1")
    values <- c(values, if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    fields <- c(fields, "fact_id_1")
    values <- c(values, if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    fields <- c(fields, "domain_concept_id_2")
    values <- c(values, if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    fields <- c(fields, "fact_id_2")
    values <- c(values, if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "fact_relationship", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_measurement <- function(measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, visit_detail_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  fields <- c()
  values <- c()
  if (!missing(measurement_id)) {
    fields <- c(fields, "measurement_id")
    values <- c(values, if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_concept_id)) {
    fields <- c(fields, "measurement_concept_id")
    values <- c(values, if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    fields <- c(fields, "measurement_date")
    values <- c(values, if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_datetime)) {
    fields <- c(fields, "measurement_datetime")
    values <- c(values, if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    fields <- c(fields, "measurement_type_concept_id")
    values <- c(values, if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(operator_concept_id)) {
    fields <- c(fields, "operator_concept_id")
    values <- c(values, if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    fields <- c(fields, "range_low")
    values <- c(values, if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    fields <- c(fields, "range_high")
    values <- c(values, if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    fields <- c(fields, "measurement_source_value")
    values <- c(values, if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    fields <- c(fields, "measurement_source_concept_id")
    values <- c(values, if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    fields <- c(fields, "value_source_value")
    values <- c(values, if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "measurement", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_note <- function(note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, note_source_value, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    fields <- c(fields, "note_date")
    values <- c(values, if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    fields <- c(fields, "note_datetime")
    values <- c(values, if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    fields <- c(fields, "note_type_concept_id")
    values <- c(values, if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    fields <- c(fields, "note_class_concept_id")
    values <- c(values, if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    fields <- c(fields, "note_title")
    values <- c(values, if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    fields <- c(fields, "note_text")
    values <- c(values, if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    fields <- c(fields, "encoding_concept_id")
    values <- c(values, if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(note_source_value)) {
    fields <- c(fields, "note_source_value")
    values <- c(values, if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "note", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_note_nlp <- function(note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  fields <- c()
  values <- c()
  if (!missing(note_nlp_id)) {
    fields <- c(fields, "note_nlp_id")
    values <- c(values, if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    fields <- c(fields, "section_concept_id")
    values <- c(values, if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    fields <- c(fields, "snippet")
    values <- c(values, if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    fields <- c(fields, "offset")
    values <- c(values, if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    fields <- c(fields, "lexical_variant")
    values <- c(values, if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    fields <- c(fields, "note_nlp_concept_id")
    values <- c(values, if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    fields <- c(fields, "note_nlp_source_concept_id")
    values <- c(values, if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    fields <- c(fields, "nlp_system")
    values <- c(values, if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    fields <- c(fields, "nlp_date")
    values <- c(values, if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    fields <- c(fields, "nlp_date_time")
    values <- c(values, if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    fields <- c(fields, "term_exists")
    values <- c(values, if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    fields <- c(fields, "term_temporal")
    values <- c(values, if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    fields <- c(fields, "term_modifiers")
    values <- c(values, if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "note_nlp", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_observation <- function(observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, visit_detail_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(observation_id)) {
    fields <- c(fields, "observation_id")
    values <- c(values, if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_concept_id)) {
    fields <- c(fields, "observation_concept_id")
    values <- c(values, if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    fields <- c(fields, "observation_date")
    values <- c(values, if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_datetime)) {
    fields <- c(fields, "observation_datetime")
    values <- c(values, if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    fields <- c(fields, "observation_type_concept_id")
    values <- c(values, if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    fields <- c(fields, "qualifier_concept_id")
    values <- c(values, if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(observation_source_value)) {
    fields <- c(fields, "observation_source_value")
    values <- c(values, if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    fields <- c(fields, "observation_source_concept_id")
    values <- c(values, if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "observation", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(observation_period_id)) {
    fields <- c(fields, "observation_period_id")
    values <- c(values, if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    fields <- c(fields, "observation_period_start_date")
    values <- c(values, if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    fields <- c(fields, "observation_period_end_date")
    values <- c(values, if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    fields <- c(fields, "period_type_concept_id")
    values <- c(values, if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "observation_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_person <- function(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    fields <- c(fields, "month_of_birth")
    values <- c(values, if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(day_of_birth)) {
    fields <- c(fields, "day_of_birth")
    values <- c(values, if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    fields <- c(fields, "birth_datetime")
    values <- c(values, if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    fields <- c(fields, "race_concept_id")
    values <- c(values, if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    fields <- c(fields, "ethnicity_concept_id")
    values <- c(values, if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(person_source_value)) {
    fields <- c(fields, "person_source_value")
    values <- c(values, if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    fields <- c(fields, "race_source_value")
    values <- c(values, if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    fields <- c(fields, "race_source_concept_id")
    values <- c(values, if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    fields <- c(fields, "ethnicity_source_value")
    values <- c(values, if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    fields <- c(fields, "ethnicity_source_concept_id")
    values <- c(values, if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "person", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_procedure_occurrence <- function(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_datetime, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(procedure_occurrence_id)) {
    fields <- c(fields, "procedure_occurrence_id")
    values <- c(values, if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_concept_id)) {
    fields <- c(fields, "procedure_concept_id")
    values <- c(values, if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    fields <- c(fields, "procedure_date")
    values <- c(values, if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_datetime)) {
    fields <- c(fields, "procedure_datetime")
    values <- c(values, if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    fields <- c(fields, "procedure_type_concept_id")
    values <- c(values, if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(modifier_concept_id)) {
    fields <- c(fields, "modifier_concept_id")
    values <- c(values, if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    fields <- c(fields, "procedure_source_value")
    values <- c(values, if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    fields <- c(fields, "procedure_source_concept_id")
    values <- c(values, if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "procedure_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  fields <- c()
  values <- c()
  if (!missing(specimen_id)) {
    fields <- c(fields, "specimen_id")
    values <- c(values, if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    fields <- c(fields, "specimen_concept_id")
    values <- c(values, if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    fields <- c(fields, "specimen_type_concept_id")
    values <- c(values, if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    fields <- c(fields, "specimen_date")
    values <- c(values, if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    fields <- c(fields, "specimen_datetime")
    values <- c(values, if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    fields <- c(fields, "anatomic_site_concept_id")
    values <- c(values, if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    fields <- c(fields, "disease_status_concept_id")
    values <- c(values, if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    fields <- c(fields, "specimen_source_id")
    values <- c(values, if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    fields <- c(fields, "specimen_source_value")
    values <- c(values, if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    fields <- c(fields, "anatomic_site_source_value")
    values <- c(values, if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    fields <- c(fields, "disease_status_source_value")
    values <- c(values, if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "specimen", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_visit_detail <- function(visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    fields <- c(fields, "preceding_visit_detail_id")
    values <- c(values, if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    fields <- c(fields, "visit_detail_parent_id")
    values <- c(values, if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "visit_detail", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    fields <- c(fields, "preceding_visit_occurrence_id")
    values <- c(values, if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "visit_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cohort", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cohort_attribute <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cohort_attribute", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  fields <- c()
  values <- c()
  if (!missing(condition_era_id)) {
    fields <- c(fields, "condition_era_id")
    values <- c(values, if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    fields <- c(fields, "condition_era_start_date")
    values <- c(values, if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    fields <- c(fields, "condition_era_end_date")
    values <- c(values, if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    fields <- c(fields, "condition_occurrence_count")
    values <- c(values, if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "condition_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  fields <- c()
  values <- c()
  if (!missing(dose_era_id)) {
    fields <- c(fields, "dose_era_id")
    values <- c(values, if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    fields <- c(fields, "dose_value")
    values <- c(values, if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    fields <- c(fields, "dose_era_start_date")
    values <- c(values, if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    fields <- c(fields, "dose_era_end_date")
    values <- c(values, if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "dose_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  fields <- c()
  values <- c()
  if (!missing(drug_era_id)) {
    fields <- c(fields, "drug_era_id")
    values <- c(values, if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    fields <- c(fields, "drug_era_start_date")
    values <- c(values, if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    fields <- c(fields, "drug_era_end_date")
    values <- c(values, if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    fields <- c(fields, "drug_exposure_count")
    values <- c(values, if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    fields <- c(fields, "gap_days")
    values <- c(values, if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "drug_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cost <- function(cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  fields <- c()
  values <- c()
  if (!missing(cost_id)) {
    fields <- c(fields, "cost_id")
    values <- c(values, if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    fields <- c(fields, "cost_event_id")
    values <- c(values, if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    fields <- c(fields, "cost_domain_id")
    values <- c(values, if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    fields <- c(fields, "cost_type_concept_id")
    values <- c(values, if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    fields <- c(fields, "currency_concept_id")
    values <- c(values, if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    fields <- c(fields, "total_charge")
    values <- c(values, if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    fields <- c(fields, "total_cost")
    values <- c(values, if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    fields <- c(fields, "total_paid")
    values <- c(values, if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    fields <- c(fields, "paid_by_payer")
    values <- c(values, if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    fields <- c(fields, "paid_by_patient")
    values <- c(values, if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    fields <- c(fields, "paid_patient_copay")
    values <- c(values, if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    fields <- c(fields, "paid_patient_coinsurance")
    values <- c(values, if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    fields <- c(fields, "paid_patient_deductible")
    values <- c(values, if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    fields <- c(fields, "paid_by_primary")
    values <- c(values, if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    fields <- c(fields, "paid_ingredient_cost")
    values <- c(values, if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    fields <- c(fields, "paid_dispensing_fee")
    values <- c(values, if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    fields <- c(fields, "amount_allowed")
    values <- c(values, if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    fields <- c(fields, "revenue_code_concept_id")
    values <- c(values, if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    fields <- c(fields, "revenue_code_source_value")
    values <- c(values, if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    fields <- c(fields, "drg_concept_id")
    values <- c(values, if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    fields <- c(fields, "drg_source_value")
    values <- c(values, if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cost", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  fields <- c()
  values <- c()
  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    fields <- c(fields, "payer_plan_period_start_date")
    values <- c(values, if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    fields <- c(fields, "payer_plan_period_end_date")
    values <- c(values, if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_source_value)) {
    fields <- c(fields, "payer_source_value")
    values <- c(values, if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(plan_source_value)) {
    fields <- c(fields, "plan_source_value")
    values <- c(values, if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(family_source_value)) {
    fields <- c(fields, "family_source_value")
    values <- c(values, if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "payer_plan_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  fields <- c()
  values <- c()
  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_name)) {
    fields <- c(fields, "care_site_name")
    values <- c(values, if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    fields <- c(fields, "place_of_service_concept_id")
    values <- c(values, if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    fields <- c(fields, "care_site_source_value")
    values <- c(values, if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    fields <- c(fields, "place_of_service_source_value")
    values <- c(values, if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "care_site", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  fields <- c()
  values <- c()
  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    fields <- c(fields, "address_1")
    values <- c(values, if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    fields <- c(fields, "address_2")
    values <- c(values, if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    fields <- c(fields, "city")
    values <- c(values, if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    fields <- c(fields, "state")
    values <- c(values, if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    fields <- c(fields, "zip")
    values <- c(values, if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    fields <- c(fields, "county")
    values <- c(values, if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    fields <- c(fields, "location_source_value")
    values <- c(values, if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "location", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_provider <- function(provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_name)) {
    fields <- c(fields, "provider_name")
    values <- c(values, if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    fields <- c(fields, "dea")
    values <- c(values, if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(specialty_concept_id)) {
    fields <- c(fields, "specialty_concept_id")
    values <- c(values, if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(provider_source_value)) {
    fields <- c(fields, "provider_source_value")
    values <- c(values, if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_source_value)) {
    fields <- c(fields, "specialty_source_value")
    values <- c(values, if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    fields <- c(fields, "specialty_source_concept_id")
    values <- c(values, if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "provider", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  fields <- c()
  values <- c()
  if (!missing(cdm_source_name)) {
    fields <- c(fields, "cdm_source_name")
    values <- c(values, if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    fields <- c(fields, "cdm_source_abbreviation")
    values <- c(values, if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    fields <- c(fields, "cdm_holder")
    values <- c(values, if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    fields <- c(fields, "source_description")
    values <- c(values, if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    fields <- c(fields, "source_documentation_reference")
    values <- c(values, if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    fields <- c(fields, "[cdm_etl _reference]")
    values <- c(values, if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    fields <- c(fields, "source_release_date")
    values <- c(values, if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    fields <- c(fields, "cdm_release_date")
    values <- c(values, if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    fields <- c(fields, "cdm_version")
    values <- c(values, if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cdm_source", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  fields <- c()
  values <- c()
  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    fields <- c(fields, "attribute_name")
    values <- c(values, if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    fields <- c(fields, "attribute_description")
    values <- c(values, if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    fields <- c(fields, "attribute_type_concept_id")
    values <- c(values, if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    fields <- c(fields, "attribute_syntax")
    values <- c(values, if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "attribute_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    fields <- c(fields, "cohort_definition_name")
    values <- c(values, if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    fields <- c(fields, "cohort_definition_description")
    values <- c(values, if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    fields <- c(fields, "definition_type_concept_id")
    values <- c(values, if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    fields <- c(fields, "cohort_definition_syntax")
    values <- c(values, if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    fields <- c(fields, "subject_concept_id")
    values <- c(values, if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    fields <- c(fields, "cohort_instantiation_date")
    values <- c(values, if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cohort_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, visit_detail_id, condition_source_value, condition_source_concept_id, condition_status_source_value, condition_status_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(condition_occurrence_id)) {
    fields <- c(fields, "condition_occurrence_id")
    values <- c(values, if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    fields <- c(fields, "condition_start_date")
    values <- c(values, if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_start_datetime)) {
    fields <- c(fields, "condition_start_datetime")
    values <- c(values, if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_date)) {
    fields <- c(fields, "condition_end_date")
    values <- c(values, if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_end_datetime)) {
    fields <- c(fields, "condition_end_datetime")
    values <- c(values, if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    fields <- c(fields, "condition_type_concept_id")
    values <- c(values, if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_source_value)) {
    fields <- c(fields, "condition_source_value")
    values <- c(values, if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    fields <- c(fields, "condition_source_concept_id")
    values <- c(values, if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    fields <- c(fields, "condition_status_source_value")
    values <- c(values, if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    fields <- c(fields, "condition_status_concept_id")
    values <- c(values, if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "condition_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_death <- function(person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    fields <- c(fields, "death_date")
    values <- c(values, if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    fields <- c(fields, "death_datetime")
    values <- c(values, if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    fields <- c(fields, "death_type_concept_id")
    values <- c(values, if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    fields <- c(fields, "cause_concept_id")
    values <- c(values, if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    fields <- c(fields, "cause_source_value")
    values <- c(values, if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    fields <- c(fields, "cause_source_concept_id")
    values <- c(values, if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "death", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source__concept_id, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(device_exposure_id)) {
    fields <- c(fields, "device_exposure_id")
    values <- c(values, if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    fields <- c(fields, "device_concept_id")
    values <- c(values, if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    fields <- c(fields, "device_exposure_start_date")
    values <- c(values, if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    fields <- c(fields, "device_exposure_start_datetime")
    values <- c(values, if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    fields <- c(fields, "device_exposure_end_date")
    values <- c(values, if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    fields <- c(fields, "device_exposure_end_datetime")
    values <- c(values, if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    fields <- c(fields, "device_type_concept_id")
    values <- c(values, if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    fields <- c(fields, "unique_device_id")
    values <- c(values, if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(device_source_value)) {
    fields <- c(fields, "device_source_value")
    values <- c(values, if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    fields <- c(fields, "[device_source_ concept_id]")
    values <- c(values, if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "device_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_drug_exposure <- function(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, verbatim_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(drug_exposure_id)) {
    fields <- c(fields, "drug_exposure_id")
    values <- c(values, if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    fields <- c(fields, "drug_exposure_start_date")
    values <- c(values, if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    fields <- c(fields, "drug_exposure_start_datetime")
    values <- c(values, if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    fields <- c(fields, "drug_exposure_end_date")
    values <- c(values, if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    fields <- c(fields, "drug_exposure_end_datetime")
    values <- c(values, if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    fields <- c(fields, "verbatim_end_date")
    values <- c(values, if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    fields <- c(fields, "drug_type_concept_id")
    values <- c(values, if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    fields <- c(fields, "refills")
    values <- c(values, if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(days_supply)) {
    fields <- c(fields, "days_supply")
    values <- c(values, if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(sig)) {
    fields <- c(fields, "sig")
    values <- c(values, if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(route_concept_id)) {
    fields <- c(fields, "route_concept_id")
    values <- c(values, if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    fields <- c(fields, "lot_number")
    values <- c(values, if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(drug_source_value)) {
    fields <- c(fields, "drug_source_value")
    values <- c(values, if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    fields <- c(fields, "drug_source_concept_id")
    values <- c(values, if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(route_source_value)) {
    fields <- c(fields, "route_source_value")
    values <- c(values, if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    fields <- c(fields, "dose_unit_source_value")
    values <- c(values, if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "drug_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_concept_id_1)) {
    fields <- c(fields, "domain_concept_id_1")
    values <- c(values, if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    fields <- c(fields, "fact_id_1")
    values <- c(values, if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    fields <- c(fields, "domain_concept_id_2")
    values <- c(values, if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    fields <- c(fields, "fact_id_2")
    values <- c(values, if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "fact_relationship", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_measurement <- function(measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, visit_detail_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  fields <- c()
  values <- c()
  if (!missing(measurement_id)) {
    fields <- c(fields, "measurement_id")
    values <- c(values, if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_concept_id)) {
    fields <- c(fields, "measurement_concept_id")
    values <- c(values, if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    fields <- c(fields, "measurement_date")
    values <- c(values, if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_datetime)) {
    fields <- c(fields, "measurement_datetime")
    values <- c(values, if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    fields <- c(fields, "measurement_type_concept_id")
    values <- c(values, if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(operator_concept_id)) {
    fields <- c(fields, "operator_concept_id")
    values <- c(values, if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    fields <- c(fields, "range_low")
    values <- c(values, if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    fields <- c(fields, "range_high")
    values <- c(values, if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    fields <- c(fields, "measurement_source_value")
    values <- c(values, if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    fields <- c(fields, "measurement_source_concept_id")
    values <- c(values, if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    fields <- c(fields, "value_source_value")
    values <- c(values, if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "measurement", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_note <- function(note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, note_source_value, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    fields <- c(fields, "note_date")
    values <- c(values, if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    fields <- c(fields, "note_datetime")
    values <- c(values, if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    fields <- c(fields, "note_type_concept_id")
    values <- c(values, if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    fields <- c(fields, "note_class_concept_id")
    values <- c(values, if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    fields <- c(fields, "note_title")
    values <- c(values, if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    fields <- c(fields, "note_text")
    values <- c(values, if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    fields <- c(fields, "encoding_concept_id")
    values <- c(values, if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(note_source_value)) {
    fields <- c(fields, "note_source_value")
    values <- c(values, if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "note", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_note_nlp <- function(note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  fields <- c()
  values <- c()
  if (!missing(note_nlp_id)) {
    fields <- c(fields, "note_nlp_id")
    values <- c(values, if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    fields <- c(fields, "section_concept_id")
    values <- c(values, if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    fields <- c(fields, "snippet")
    values <- c(values, if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    fields <- c(fields, "offset")
    values <- c(values, if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    fields <- c(fields, "lexical_variant")
    values <- c(values, if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    fields <- c(fields, "note_nlp_concept_id")
    values <- c(values, if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    fields <- c(fields, "note_nlp_source_concept_id")
    values <- c(values, if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    fields <- c(fields, "nlp_system")
    values <- c(values, if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    fields <- c(fields, "nlp_date")
    values <- c(values, if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    fields <- c(fields, "nlp_date_time")
    values <- c(values, if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    fields <- c(fields, "term_exists")
    values <- c(values, if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    fields <- c(fields, "term_temporal")
    values <- c(values, if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    fields <- c(fields, "term_modifiers")
    values <- c(values, if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "note_nlp", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_observation <- function(observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, visit_detail_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(observation_id)) {
    fields <- c(fields, "observation_id")
    values <- c(values, if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_concept_id)) {
    fields <- c(fields, "observation_concept_id")
    values <- c(values, if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    fields <- c(fields, "observation_date")
    values <- c(values, if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_datetime)) {
    fields <- c(fields, "observation_datetime")
    values <- c(values, if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    fields <- c(fields, "observation_type_concept_id")
    values <- c(values, if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    fields <- c(fields, "qualifier_concept_id")
    values <- c(values, if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(observation_source_value)) {
    fields <- c(fields, "observation_source_value")
    values <- c(values, if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    fields <- c(fields, "observation_source_concept_id")
    values <- c(values, if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "observation", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(observation_period_id)) {
    fields <- c(fields, "observation_period_id")
    values <- c(values, if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    fields <- c(fields, "observation_period_start_date")
    values <- c(values, if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    fields <- c(fields, "observation_period_end_date")
    values <- c(values, if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    fields <- c(fields, "period_type_concept_id")
    values <- c(values, if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "observation_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_person <- function(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    fields <- c(fields, "month_of_birth")
    values <- c(values, if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(day_of_birth)) {
    fields <- c(fields, "day_of_birth")
    values <- c(values, if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    fields <- c(fields, "birth_datetime")
    values <- c(values, if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    fields <- c(fields, "race_concept_id")
    values <- c(values, if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    fields <- c(fields, "ethnicity_concept_id")
    values <- c(values, if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(person_source_value)) {
    fields <- c(fields, "person_source_value")
    values <- c(values, if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    fields <- c(fields, "race_source_value")
    values <- c(values, if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    fields <- c(fields, "race_source_concept_id")
    values <- c(values, if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    fields <- c(fields, "ethnicity_source_value")
    values <- c(values, if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    fields <- c(fields, "ethnicity_source_concept_id")
    values <- c(values, if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "person", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_procedure_occurrence <- function(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_datetime, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(procedure_occurrence_id)) {
    fields <- c(fields, "procedure_occurrence_id")
    values <- c(values, if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_concept_id)) {
    fields <- c(fields, "procedure_concept_id")
    values <- c(values, if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    fields <- c(fields, "procedure_date")
    values <- c(values, if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_datetime)) {
    fields <- c(fields, "procedure_datetime")
    values <- c(values, if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    fields <- c(fields, "procedure_type_concept_id")
    values <- c(values, if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(modifier_concept_id)) {
    fields <- c(fields, "modifier_concept_id")
    values <- c(values, if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    fields <- c(fields, "procedure_source_value")
    values <- c(values, if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    fields <- c(fields, "procedure_source_concept_id")
    values <- c(values, if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "procedure_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  fields <- c()
  values <- c()
  if (!missing(specimen_id)) {
    fields <- c(fields, "specimen_id")
    values <- c(values, if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    fields <- c(fields, "specimen_concept_id")
    values <- c(values, if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    fields <- c(fields, "specimen_type_concept_id")
    values <- c(values, if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    fields <- c(fields, "specimen_date")
    values <- c(values, if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    fields <- c(fields, "specimen_datetime")
    values <- c(values, if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    fields <- c(fields, "anatomic_site_concept_id")
    values <- c(values, if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    fields <- c(fields, "disease_status_concept_id")
    values <- c(values, if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    fields <- c(fields, "specimen_source_id")
    values <- c(values, if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    fields <- c(fields, "specimen_source_value")
    values <- c(values, if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    fields <- c(fields, "anatomic_site_source_value")
    values <- c(values, if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    fields <- c(fields, "disease_status_source_value")
    values <- c(values, if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "specimen", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_visit_detail <- function(visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    fields <- c(fields, "preceding_visit_detail_id")
    values <- c(values, if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    fields <- c(fields, "visit_detail_parent_id")
    values <- c(values, if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "visit_detail", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    fields <- c(fields, "preceding_visit_occurrence_id")
    values <- c(values, if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "visit_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cohort", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cohort_attribute <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cohort_attribute", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  fields <- c()
  values <- c()
  if (!missing(condition_era_id)) {
    fields <- c(fields, "condition_era_id")
    values <- c(values, if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    fields <- c(fields, "condition_era_start_date")
    values <- c(values, if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    fields <- c(fields, "condition_era_end_date")
    values <- c(values, if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    fields <- c(fields, "condition_occurrence_count")
    values <- c(values, if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "condition_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  fields <- c()
  values <- c()
  if (!missing(dose_era_id)) {
    fields <- c(fields, "dose_era_id")
    values <- c(values, if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    fields <- c(fields, "dose_value")
    values <- c(values, if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    fields <- c(fields, "dose_era_start_date")
    values <- c(values, if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    fields <- c(fields, "dose_era_end_date")
    values <- c(values, if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "dose_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  fields <- c()
  values <- c()
  if (!missing(drug_era_id)) {
    fields <- c(fields, "drug_era_id")
    values <- c(values, if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    fields <- c(fields, "drug_era_start_date")
    values <- c(values, if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    fields <- c(fields, "drug_era_end_date")
    values <- c(values, if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    fields <- c(fields, "drug_exposure_count")
    values <- c(values, if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    fields <- c(fields, "gap_days")
    values <- c(values, if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "drug_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cost <- function(cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  fields <- c()
  values <- c()
  if (!missing(cost_id)) {
    fields <- c(fields, "cost_id")
    values <- c(values, if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    fields <- c(fields, "cost_event_id")
    values <- c(values, if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    fields <- c(fields, "cost_domain_id")
    values <- c(values, if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    fields <- c(fields, "cost_type_concept_id")
    values <- c(values, if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    fields <- c(fields, "currency_concept_id")
    values <- c(values, if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    fields <- c(fields, "total_charge")
    values <- c(values, if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    fields <- c(fields, "total_cost")
    values <- c(values, if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    fields <- c(fields, "total_paid")
    values <- c(values, if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    fields <- c(fields, "paid_by_payer")
    values <- c(values, if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    fields <- c(fields, "paid_by_patient")
    values <- c(values, if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    fields <- c(fields, "paid_patient_copay")
    values <- c(values, if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    fields <- c(fields, "paid_patient_coinsurance")
    values <- c(values, if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    fields <- c(fields, "paid_patient_deductible")
    values <- c(values, if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    fields <- c(fields, "paid_by_primary")
    values <- c(values, if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    fields <- c(fields, "paid_ingredient_cost")
    values <- c(values, if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    fields <- c(fields, "paid_dispensing_fee")
    values <- c(values, if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    fields <- c(fields, "amount_allowed")
    values <- c(values, if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    fields <- c(fields, "revenue_code_concept_id")
    values <- c(values, if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    fields <- c(fields, "revenue_code_source_value")
    values <- c(values, if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    fields <- c(fields, "drg_concept_id")
    values <- c(values, if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    fields <- c(fields, "drg_source_value")
    values <- c(values, if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cost", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  fields <- c()
  values <- c()
  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    fields <- c(fields, "payer_plan_period_start_date")
    values <- c(values, if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    fields <- c(fields, "payer_plan_period_end_date")
    values <- c(values, if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_source_value)) {
    fields <- c(fields, "payer_source_value")
    values <- c(values, if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(plan_source_value)) {
    fields <- c(fields, "plan_source_value")
    values <- c(values, if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(family_source_value)) {
    fields <- c(fields, "family_source_value")
    values <- c(values, if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "payer_plan_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  fields <- c()
  values <- c()
  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_name)) {
    fields <- c(fields, "care_site_name")
    values <- c(values, if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    fields <- c(fields, "place_of_service_concept_id")
    values <- c(values, if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    fields <- c(fields, "care_site_source_value")
    values <- c(values, if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    fields <- c(fields, "place_of_service_source_value")
    values <- c(values, if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "care_site", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  fields <- c()
  values <- c()
  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    fields <- c(fields, "address_1")
    values <- c(values, if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    fields <- c(fields, "address_2")
    values <- c(values, if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    fields <- c(fields, "city")
    values <- c(values, if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    fields <- c(fields, "state")
    values <- c(values, if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    fields <- c(fields, "zip")
    values <- c(values, if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    fields <- c(fields, "county")
    values <- c(values, if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    fields <- c(fields, "location_source_value")
    values <- c(values, if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "location", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_provider <- function(provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_name)) {
    fields <- c(fields, "provider_name")
    values <- c(values, if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    fields <- c(fields, "dea")
    values <- c(values, if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(specialty_concept_id)) {
    fields <- c(fields, "specialty_concept_id")
    values <- c(values, if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(provider_source_value)) {
    fields <- c(fields, "provider_source_value")
    values <- c(values, if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_source_value)) {
    fields <- c(fields, "specialty_source_value")
    values <- c(values, if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    fields <- c(fields, "specialty_source_concept_id")
    values <- c(values, if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "provider", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  fields <- c()
  values <- c()
  if (!missing(cdm_source_name)) {
    fields <- c(fields, "cdm_source_name")
    values <- c(values, if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    fields <- c(fields, "cdm_source_abbreviation")
    values <- c(values, if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    fields <- c(fields, "cdm_holder")
    values <- c(values, if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    fields <- c(fields, "source_description")
    values <- c(values, if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    fields <- c(fields, "source_documentation_reference")
    values <- c(values, if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    fields <- c(fields, "[cdm_etl _reference]")
    values <- c(values, if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    fields <- c(fields, "source_release_date")
    values <- c(values, if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    fields <- c(fields, "cdm_release_date")
    values <- c(values, if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    fields <- c(fields, "cdm_version")
    values <- c(values, if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cdm_source", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  fields <- c()
  values <- c()
  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    fields <- c(fields, "attribute_name")
    values <- c(values, if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    fields <- c(fields, "attribute_description")
    values <- c(values, if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    fields <- c(fields, "attribute_type_concept_id")
    values <- c(values, if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    fields <- c(fields, "attribute_syntax")
    values <- c(values, if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "attribute_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    fields <- c(fields, "cohort_definition_name")
    values <- c(values, if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    fields <- c(fields, "cohort_definition_description")
    values <- c(values, if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    fields <- c(fields, "definition_type_concept_id")
    values <- c(values, if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    fields <- c(fields, "cohort_definition_syntax")
    values <- c(values, if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    fields <- c(fields, "subject_concept_id")
    values <- c(values, if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    fields <- c(fields, "cohort_instantiation_date")
    values <- c(values, if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cohort_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_condition_occurrence <- function(rowCount, condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, visit_detail_id, condition_source_value, condition_source_concept_id, condition_status_source_value, condition_status_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(condition_occurrence_id)) {
    fields <- c(fields, "condition_occurrence_id")
    values <- c(values, if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    fields <- c(fields, "condition_start_date")
    values <- c(values, if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_start_datetime)) {
    fields <- c(fields, "condition_start_datetime")
    values <- c(values, if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_date)) {
    fields <- c(fields, "condition_end_date")
    values <- c(values, if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_end_datetime)) {
    fields <- c(fields, "condition_end_datetime")
    values <- c(values, if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    fields <- c(fields, "condition_type_concept_id")
    values <- c(values, if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_source_value)) {
    fields <- c(fields, "condition_source_value")
    values <- c(values, if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    fields <- c(fields, "condition_source_concept_id")
    values <- c(values, if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    fields <- c(fields, "condition_status_source_value")
    values <- c(values, if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    fields <- c(fields, "condition_status_concept_id")
    values <- c(values, if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "condition_occurrence", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_death <- function(rowCount, person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    fields <- c(fields, "death_date")
    values <- c(values, if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    fields <- c(fields, "death_datetime")
    values <- c(values, if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    fields <- c(fields, "death_type_concept_id")
    values <- c(values, if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    fields <- c(fields, "cause_concept_id")
    values <- c(values, if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    fields <- c(fields, "cause_source_value")
    values <- c(values, if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    fields <- c(fields, "cause_source_concept_id")
    values <- c(values, if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "death", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_device_exposure <- function(rowCount, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source__concept_id, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(device_exposure_id)) {
    fields <- c(fields, "device_exposure_id")
    values <- c(values, if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    fields <- c(fields, "device_concept_id")
    values <- c(values, if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    fields <- c(fields, "device_exposure_start_date")
    values <- c(values, if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    fields <- c(fields, "device_exposure_start_datetime")
    values <- c(values, if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    fields <- c(fields, "device_exposure_end_date")
    values <- c(values, if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    fields <- c(fields, "device_exposure_end_datetime")
    values <- c(values, if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    fields <- c(fields, "device_type_concept_id")
    values <- c(values, if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    fields <- c(fields, "unique_device_id")
    values <- c(values, if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(device_source_value)) {
    fields <- c(fields, "device_source_value")
    values <- c(values, if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    fields <- c(fields, "[device_source_ concept_id]")
    values <- c(values, if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "device_exposure", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_drug_exposure <- function(rowCount, drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, verbatim_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(drug_exposure_id)) {
    fields <- c(fields, "drug_exposure_id")
    values <- c(values, if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    fields <- c(fields, "drug_exposure_start_date")
    values <- c(values, if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    fields <- c(fields, "drug_exposure_start_datetime")
    values <- c(values, if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    fields <- c(fields, "drug_exposure_end_date")
    values <- c(values, if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    fields <- c(fields, "drug_exposure_end_datetime")
    values <- c(values, if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    fields <- c(fields, "verbatim_end_date")
    values <- c(values, if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    fields <- c(fields, "drug_type_concept_id")
    values <- c(values, if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    fields <- c(fields, "refills")
    values <- c(values, if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(days_supply)) {
    fields <- c(fields, "days_supply")
    values <- c(values, if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(sig)) {
    fields <- c(fields, "sig")
    values <- c(values, if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(route_concept_id)) {
    fields <- c(fields, "route_concept_id")
    values <- c(values, if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    fields <- c(fields, "lot_number")
    values <- c(values, if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(drug_source_value)) {
    fields <- c(fields, "drug_source_value")
    values <- c(values, if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    fields <- c(fields, "drug_source_concept_id")
    values <- c(values, if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(route_source_value)) {
    fields <- c(fields, "route_source_value")
    values <- c(values, if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    fields <- c(fields, "dose_unit_source_value")
    values <- c(values, if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "drug_exposure", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_fact_relationship <- function(rowCount, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_concept_id_1)) {
    fields <- c(fields, "domain_concept_id_1")
    values <- c(values, if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    fields <- c(fields, "fact_id_1")
    values <- c(values, if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    fields <- c(fields, "domain_concept_id_2")
    values <- c(values, if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    fields <- c(fields, "fact_id_2")
    values <- c(values, if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "fact_relationship", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_measurement <- function(rowCount, measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, visit_detail_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  fields <- c()
  values <- c()
  if (!missing(measurement_id)) {
    fields <- c(fields, "measurement_id")
    values <- c(values, if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_concept_id)) {
    fields <- c(fields, "measurement_concept_id")
    values <- c(values, if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    fields <- c(fields, "measurement_date")
    values <- c(values, if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_datetime)) {
    fields <- c(fields, "measurement_datetime")
    values <- c(values, if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    fields <- c(fields, "measurement_type_concept_id")
    values <- c(values, if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(operator_concept_id)) {
    fields <- c(fields, "operator_concept_id")
    values <- c(values, if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    fields <- c(fields, "range_low")
    values <- c(values, if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    fields <- c(fields, "range_high")
    values <- c(values, if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    fields <- c(fields, "measurement_source_value")
    values <- c(values, if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    fields <- c(fields, "measurement_source_concept_id")
    values <- c(values, if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    fields <- c(fields, "value_source_value")
    values <- c(values, if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "measurement", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_note <- function(rowCount, note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, note_source_value, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    fields <- c(fields, "note_date")
    values <- c(values, if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    fields <- c(fields, "note_datetime")
    values <- c(values, if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    fields <- c(fields, "note_type_concept_id")
    values <- c(values, if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    fields <- c(fields, "note_class_concept_id")
    values <- c(values, if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    fields <- c(fields, "note_title")
    values <- c(values, if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    fields <- c(fields, "note_text")
    values <- c(values, if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    fields <- c(fields, "encoding_concept_id")
    values <- c(values, if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(note_source_value)) {
    fields <- c(fields, "note_source_value")
    values <- c(values, if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "note", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_note_nlp <- function(rowCount, note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  fields <- c()
  values <- c()
  if (!missing(note_nlp_id)) {
    fields <- c(fields, "note_nlp_id")
    values <- c(values, if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    fields <- c(fields, "section_concept_id")
    values <- c(values, if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    fields <- c(fields, "snippet")
    values <- c(values, if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    fields <- c(fields, "offset")
    values <- c(values, if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    fields <- c(fields, "lexical_variant")
    values <- c(values, if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    fields <- c(fields, "note_nlp_concept_id")
    values <- c(values, if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    fields <- c(fields, "note_nlp_source_concept_id")
    values <- c(values, if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    fields <- c(fields, "nlp_system")
    values <- c(values, if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    fields <- c(fields, "nlp_date")
    values <- c(values, if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    fields <- c(fields, "nlp_date_time")
    values <- c(values, if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    fields <- c(fields, "term_exists")
    values <- c(values, if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    fields <- c(fields, "term_temporal")
    values <- c(values, if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    fields <- c(fields, "term_modifiers")
    values <- c(values, if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "note_nlp", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_observation <- function(rowCount, observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, visit_detail_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(observation_id)) {
    fields <- c(fields, "observation_id")
    values <- c(values, if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_concept_id)) {
    fields <- c(fields, "observation_concept_id")
    values <- c(values, if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    fields <- c(fields, "observation_date")
    values <- c(values, if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_datetime)) {
    fields <- c(fields, "observation_datetime")
    values <- c(values, if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    fields <- c(fields, "observation_type_concept_id")
    values <- c(values, if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    fields <- c(fields, "qualifier_concept_id")
    values <- c(values, if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(observation_source_value)) {
    fields <- c(fields, "observation_source_value")
    values <- c(values, if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    fields <- c(fields, "observation_source_concept_id")
    values <- c(values, if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "observation", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_observation_period <- function(rowCount, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(observation_period_id)) {
    fields <- c(fields, "observation_period_id")
    values <- c(values, if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    fields <- c(fields, "observation_period_start_date")
    values <- c(values, if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    fields <- c(fields, "observation_period_end_date")
    values <- c(values, if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    fields <- c(fields, "period_type_concept_id")
    values <- c(values, if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "observation_period", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_person <- function(rowCount, person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    fields <- c(fields, "month_of_birth")
    values <- c(values, if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(day_of_birth)) {
    fields <- c(fields, "day_of_birth")
    values <- c(values, if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    fields <- c(fields, "birth_datetime")
    values <- c(values, if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    fields <- c(fields, "race_concept_id")
    values <- c(values, if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    fields <- c(fields, "ethnicity_concept_id")
    values <- c(values, if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(person_source_value)) {
    fields <- c(fields, "person_source_value")
    values <- c(values, if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    fields <- c(fields, "race_source_value")
    values <- c(values, if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    fields <- c(fields, "race_source_concept_id")
    values <- c(values, if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    fields <- c(fields, "ethnicity_source_value")
    values <- c(values, if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    fields <- c(fields, "ethnicity_source_concept_id")
    values <- c(values, if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "person", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_procedure_occurrence <- function(rowCount, procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_datetime, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(procedure_occurrence_id)) {
    fields <- c(fields, "procedure_occurrence_id")
    values <- c(values, if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_concept_id)) {
    fields <- c(fields, "procedure_concept_id")
    values <- c(values, if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    fields <- c(fields, "procedure_date")
    values <- c(values, if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_datetime)) {
    fields <- c(fields, "procedure_datetime")
    values <- c(values, if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    fields <- c(fields, "procedure_type_concept_id")
    values <- c(values, if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(modifier_concept_id)) {
    fields <- c(fields, "modifier_concept_id")
    values <- c(values, if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    fields <- c(fields, "procedure_source_value")
    values <- c(values, if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    fields <- c(fields, "procedure_source_concept_id")
    values <- c(values, if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "procedure_occurrence", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_specimen <- function(rowCount, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  fields <- c()
  values <- c()
  if (!missing(specimen_id)) {
    fields <- c(fields, "specimen_id")
    values <- c(values, if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    fields <- c(fields, "specimen_concept_id")
    values <- c(values, if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    fields <- c(fields, "specimen_type_concept_id")
    values <- c(values, if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    fields <- c(fields, "specimen_date")
    values <- c(values, if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    fields <- c(fields, "specimen_datetime")
    values <- c(values, if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    fields <- c(fields, "anatomic_site_concept_id")
    values <- c(values, if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    fields <- c(fields, "disease_status_concept_id")
    values <- c(values, if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    fields <- c(fields, "specimen_source_id")
    values <- c(values, if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    fields <- c(fields, "specimen_source_value")
    values <- c(values, if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    fields <- c(fields, "anatomic_site_source_value")
    values <- c(values, if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    fields <- c(fields, "disease_status_source_value")
    values <- c(values, if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "specimen", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_visit_detail <- function(rowCount, visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    fields <- c(fields, "preceding_visit_detail_id")
    values <- c(values, if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    fields <- c(fields, "visit_detail_parent_id")
    values <- c(values, if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "visit_detail", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_visit_occurrence <- function(rowCount, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    fields <- c(fields, "preceding_visit_occurrence_id")
    values <- c(values, if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "visit_occurrence", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cohort <- function(rowCount, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cohort", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cohort_attribute <- function(rowCount, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cohort_attribute", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_condition_era <- function(rowCount, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  fields <- c()
  values <- c()
  if (!missing(condition_era_id)) {
    fields <- c(fields, "condition_era_id")
    values <- c(values, if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    fields <- c(fields, "condition_era_start_date")
    values <- c(values, if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    fields <- c(fields, "condition_era_end_date")
    values <- c(values, if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    fields <- c(fields, "condition_occurrence_count")
    values <- c(values, if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "condition_era", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_dose_era <- function(rowCount, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  fields <- c()
  values <- c()
  if (!missing(dose_era_id)) {
    fields <- c(fields, "dose_era_id")
    values <- c(values, if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    fields <- c(fields, "dose_value")
    values <- c(values, if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    fields <- c(fields, "dose_era_start_date")
    values <- c(values, if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    fields <- c(fields, "dose_era_end_date")
    values <- c(values, if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "dose_era", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_drug_era <- function(rowCount, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  fields <- c()
  values <- c()
  if (!missing(drug_era_id)) {
    fields <- c(fields, "drug_era_id")
    values <- c(values, if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    fields <- c(fields, "drug_era_start_date")
    values <- c(values, if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    fields <- c(fields, "drug_era_end_date")
    values <- c(values, if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    fields <- c(fields, "drug_exposure_count")
    values <- c(values, if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    fields <- c(fields, "gap_days")
    values <- c(values, if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "drug_era", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cost <- function(rowCount, cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  fields <- c()
  values <- c()
  if (!missing(cost_id)) {
    fields <- c(fields, "cost_id")
    values <- c(values, if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    fields <- c(fields, "cost_event_id")
    values <- c(values, if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    fields <- c(fields, "cost_domain_id")
    values <- c(values, if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    fields <- c(fields, "cost_type_concept_id")
    values <- c(values, if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    fields <- c(fields, "currency_concept_id")
    values <- c(values, if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    fields <- c(fields, "total_charge")
    values <- c(values, if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    fields <- c(fields, "total_cost")
    values <- c(values, if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    fields <- c(fields, "total_paid")
    values <- c(values, if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    fields <- c(fields, "paid_by_payer")
    values <- c(values, if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    fields <- c(fields, "paid_by_patient")
    values <- c(values, if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    fields <- c(fields, "paid_patient_copay")
    values <- c(values, if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    fields <- c(fields, "paid_patient_coinsurance")
    values <- c(values, if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    fields <- c(fields, "paid_patient_deductible")
    values <- c(values, if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    fields <- c(fields, "paid_by_primary")
    values <- c(values, if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    fields <- c(fields, "paid_ingredient_cost")
    values <- c(values, if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    fields <- c(fields, "paid_dispensing_fee")
    values <- c(values, if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    fields <- c(fields, "amount_allowed")
    values <- c(values, if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    fields <- c(fields, "revenue_code_concept_id")
    values <- c(values, if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    fields <- c(fields, "revenue_code_source_value")
    values <- c(values, if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    fields <- c(fields, "drg_concept_id")
    values <- c(values, if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    fields <- c(fields, "drg_source_value")
    values <- c(values, if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cost", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_payer_plan_period <- function(rowCount, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  fields <- c()
  values <- c()
  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    fields <- c(fields, "payer_plan_period_start_date")
    values <- c(values, if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    fields <- c(fields, "payer_plan_period_end_date")
    values <- c(values, if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_source_value)) {
    fields <- c(fields, "payer_source_value")
    values <- c(values, if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(plan_source_value)) {
    fields <- c(fields, "plan_source_value")
    values <- c(values, if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(family_source_value)) {
    fields <- c(fields, "family_source_value")
    values <- c(values, if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "payer_plan_period", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_care_site <- function(rowCount, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  fields <- c()
  values <- c()
  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_name)) {
    fields <- c(fields, "care_site_name")
    values <- c(values, if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    fields <- c(fields, "place_of_service_concept_id")
    values <- c(values, if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    fields <- c(fields, "care_site_source_value")
    values <- c(values, if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    fields <- c(fields, "place_of_service_source_value")
    values <- c(values, if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "care_site", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_location <- function(rowCount, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  fields <- c()
  values <- c()
  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    fields <- c(fields, "address_1")
    values <- c(values, if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    fields <- c(fields, "address_2")
    values <- c(values, if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    fields <- c(fields, "city")
    values <- c(values, if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    fields <- c(fields, "state")
    values <- c(values, if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    fields <- c(fields, "zip")
    values <- c(values, if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    fields <- c(fields, "county")
    values <- c(values, if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    fields <- c(fields, "location_source_value")
    values <- c(values, if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "location", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_provider <- function(rowCount, provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_name)) {
    fields <- c(fields, "provider_name")
    values <- c(values, if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    fields <- c(fields, "dea")
    values <- c(values, if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(specialty_concept_id)) {
    fields <- c(fields, "specialty_concept_id")
    values <- c(values, if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(provider_source_value)) {
    fields <- c(fields, "provider_source_value")
    values <- c(values, if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_source_value)) {
    fields <- c(fields, "specialty_source_value")
    values <- c(values, if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    fields <- c(fields, "specialty_source_concept_id")
    values <- c(values, if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "provider", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cdm_source <- function(rowCount, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  fields <- c()
  values <- c()
  if (!missing(cdm_source_name)) {
    fields <- c(fields, "cdm_source_name")
    values <- c(values, if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    fields <- c(fields, "cdm_source_abbreviation")
    values <- c(values, if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    fields <- c(fields, "cdm_holder")
    values <- c(values, if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    fields <- c(fields, "source_description")
    values <- c(values, if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    fields <- c(fields, "source_documentation_reference")
    values <- c(values, if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    fields <- c(fields, "[cdm_etl _reference]")
    values <- c(values, if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    fields <- c(fields, "source_release_date")
    values <- c(values, if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    fields <- c(fields, "cdm_release_date")
    values <- c(values, if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    fields <- c(fields, "cdm_version")
    values <- c(values, if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cdm_source", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_attribute_definition <- function(rowCount, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  fields <- c()
  values <- c()
  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    fields <- c(fields, "attribute_name")
    values <- c(values, if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    fields <- c(fields, "attribute_description")
    values <- c(values, if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    fields <- c(fields, "attribute_type_concept_id")
    values <- c(values, if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    fields <- c(fields, "attribute_syntax")
    values <- c(values, if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "attribute_definition", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cohort_definition <- function(rowCount, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    fields <- c(fields, "cohort_definition_name")
    values <- c(values, if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    fields <- c(fields, "cohort_definition_description")
    values <- c(values, if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    fields <- c(fields, "definition_type_concept_id")
    values <- c(values, if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    fields <- c(fields, "cohort_definition_syntax")
    values <- c(values, if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    fields <- c(fields, "subject_concept_id")
    values <- c(values, if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    fields <- c(fields, "cohort_instantiation_date")
    values <- c(values, if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cohort_definition", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

lookup_condition_occurrence <- function(fetchField, condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, visit_detail_id, condition_source_value, condition_source_concept_id, condition_status_source_value, condition_status_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.condition_occurrence WHERE')
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_occurrence_id = ", if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_concept_id = ", if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_start_date = ", if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_start_datetime = ", if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_end_date = ", if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_end_datetime = ", if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_type_concept_id = ", if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " stop_reason = ", if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_source_value = ", if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_source_concept_id = ", if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_status_source_value = ", if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_status_concept_id = ", if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_death <- function(fetchField, person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.death WHERE')
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " death_date = ", if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " death_datetime = ", if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " death_type_concept_id = ", if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cause_concept_id = ", if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cause_source_value = ", if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cause_source_concept_id = ", if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_device_exposure <- function(fetchField, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source__concept_id, visit_detail_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.device_exposure WHERE')
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_id = ", if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_concept_id = ", if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_start_date = ", if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_start_datetime = ", if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_end_date = ", if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_end_datetime = ", if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_type_concept_id = ", if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unique_device_id = ", if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_source_value = ", if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " [device_source_ concept_id] = ", if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_drug_exposure <- function(fetchField, drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, verbatim_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value, visit_detail_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.drug_exposure WHERE')
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_id = ", if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_concept_id = ", if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_start_date = ", if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_start_datetime = ", if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_end_date = ", if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_end_datetime = ", if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " verbatim_end_date = ", if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_type_concept_id = ", if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " stop_reason = ", if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " refills = ", if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " days_supply = ", if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " sig = ", if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " route_concept_id = ", if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " lot_number = ", if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_source_value = ", if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_source_concept_id = ", if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " route_source_value = ", if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_unit_source_value = ", if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_fact_relationship <- function(fetchField, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.fact_relationship WHERE')
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " domain_concept_id_1 = ", if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " fact_id_1 = ", if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " domain_concept_id_2 = ", if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " fact_id_2 = ", if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " relationship_concept_id = ", if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_measurement <- function(fetchField, measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, visit_detail_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.measurement WHERE')
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_id = ", if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_concept_id = ", if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_date = ", if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_datetime = ", if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_type_concept_id = ", if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " operator_concept_id = ", if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_number = ", if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_concept_id = ", if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " range_low = ", if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " range_high = ", if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_source_value = ", if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_source_concept_id = ", if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_source_value = ", if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_source_value = ", if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_note <- function(fetchField, note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, note_source_value, visit_occurrence_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.note WHERE')
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_id = ", if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_date = ", if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_datetime = ", if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_type_concept_id = ", if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_class_concept_id = ", if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_title = ", if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_text = ", if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " encoding_concept_id = ", if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " language_concept_id = ", if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_source_value = ", if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_note_nlp <- function(fetchField, note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.note_nlp WHERE')
  first <- TRUE
  if (!missing(note_nlp_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_nlp_id = ", if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_id = ", if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " section_concept_id = ", if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " snippet = ", if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " offset = ", if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " lexical_variant = ", if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_nlp_concept_id = ", if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_nlp_source_concept_id = ", if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " nlp_system = ", if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " nlp_date = ", if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " nlp_date_time = ", if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " term_exists = ", if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " term_temporal = ", if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " term_modifiers = ", if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_observation <- function(fetchField, observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, visit_detail_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.observation WHERE')
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_id = ", if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_concept_id = ", if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_date = ", if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_datetime = ", if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_type_concept_id = ", if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_number = ", if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_string = ", if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_concept_id = ", if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " qualifier_concept_id = ", if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_source_value = ", if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_source_concept_id = ", if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_source_value = ", if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " qualifier_source_value = ", if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_observation_period <- function(fetchField, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.observation_period WHERE')
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_period_id = ", if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_period_start_date = ", if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_period_end_date = ", if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " period_type_concept_id = ", if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_person <- function(fetchField, person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.person WHERE')
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_concept_id = ", if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " year_of_birth = ", if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " month_of_birth = ", if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " day_of_birth = ", if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " birth_datetime = ", if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " race_concept_id = ", if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " ethnicity_concept_id = ", if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_id = ", if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_source_value = ", if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_value = ", if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_concept_id = ", if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " race_source_value = ", if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " race_source_concept_id = ", if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " ethnicity_source_value = ", if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " ethnicity_source_concept_id = ", if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_procedure_occurrence <- function(fetchField, procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_datetime, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value, visit_detail_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.procedure_occurrence WHERE')
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_occurrence_id = ", if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_concept_id = ", if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_date = ", if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_datetime = ", if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_type_concept_id = ", if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " modifier_concept_id = ", if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_source_value = ", if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_source_concept_id = ", if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " qualifier_source_value = ", if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_specimen <- function(fetchField, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.specimen WHERE')
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_id = ", if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_concept_id = ", if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_type_concept_id = ", if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_date = ", if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_datetime = ", if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " anatomic_site_concept_id = ", if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " disease_status_concept_id = ", if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_source_id = ", if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_source_value = ", if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_source_value = ", if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " anatomic_site_source_value = ", if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " disease_status_source_value = ", if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_visit_detail <- function(fetchField, visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.visit_detail WHERE')
  first <- TRUE
  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_concept_id = ", if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_date = ", if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_datetime = ", if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_date = ", if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_datetime = ", if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_type_concept_id = ", if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_value = ", if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_concept_id = ", if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_value = ", if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_concept_id = ", if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_source_value = ", if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_concept_id = ", if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " preceding_visit_detail_id = ", if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_parent_id = ", if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_visit_occurrence <- function(fetchField, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.visit_occurrence WHERE')
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_concept_id = ", if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_date = ", if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_datetime = ", if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_date = ", if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_datetime = ", if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_type_concept_id = ", if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_value = ", if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_concept_id = ", if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_concept_id = ", if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_value = ", if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_concept_id = ", if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_source_value = ", if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " preceding_visit_occurrence_id = ", if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort <- function(fetchField, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cohort WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_id = ", if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " subject_id = ", if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_start_date = ", if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_end_date = ", if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort_attribute <- function(fetchField, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cohort_attribute WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_id = ", if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " subject_id = ", if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_start_date = ", if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_end_date = ", if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_definition_id = ", if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_number = ", if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_concept_id = ", if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_condition_era <- function(fetchField, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.condition_era WHERE')
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_era_id = ", if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_concept_id = ", if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_era_start_date = ", if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_era_end_date = ", if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_occurrence_count = ", if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_dose_era <- function(fetchField, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.dose_era WHERE')
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_era_id = ", if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_concept_id = ", if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_value = ", if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_era_start_date = ", if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_era_end_date = ", if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_drug_era <- function(fetchField, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.drug_era WHERE')
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_era_id = ", if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_concept_id = ", if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_era_start_date = ", if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_era_end_date = ", if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_count = ", if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gap_days = ", if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cost <- function(fetchField, cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cost WHERE')
  first <- TRUE
  if (!missing(cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_id = ", if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_event_id = ", if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_domain_id = ", if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_type_concept_id = ", if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " currency_concept_id = ", if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " total_charge = ", if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " total_cost = ", if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " total_paid = ", if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_by_payer = ", if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_by_patient = ", if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_patient_copay = ", if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_patient_coinsurance = ", if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_patient_deductible = ", if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_by_primary = ", if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_ingredient_cost = ", if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_dispensing_fee = ", if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_id = ", if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " amount_allowed = ", if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " revenue_code_concept_id = ", if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " revenue_code_source_value = ", if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drg_concept_id = ", if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drg_source_value = ", if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_payer_plan_period <- function(fetchField, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.payer_plan_period WHERE')
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_id = ", if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_start_date = ", if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_end_date = ", if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_source_value = ", if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " plan_source_value = ", if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " family_source_value = ", if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_care_site <- function(fetchField, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.care_site WHERE')
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_name = ", if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " place_of_service_concept_id = ", if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_id = ", if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_source_value = ", if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " place_of_service_source_value = ", if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_location <- function(fetchField, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.location WHERE')
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_id = ", if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " address_1 = ", if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " address_2 = ", if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " city = ", if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " state = ", if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " zip = ", if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " county = ", if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_source_value = ", if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_provider <- function(fetchField, provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.provider WHERE')
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_name = ", if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " npi = ", if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dea = ", if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specialty_concept_id = ", if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " year_of_birth = ", if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_concept_id = ", if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_source_value = ", if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specialty_source_value = ", if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specialty_source_concept_id = ", if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_value = ", if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_concept_id = ", if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cdm_source <- function(fetchField, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cdm_source WHERE')
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_source_name = ", if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_source_abbreviation = ", if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_holder = ", if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_description = ", if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_documentation_reference = ", if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " [cdm_etl _reference] = ", if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_release_date = ", if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_release_date = ", if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_version = ", if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " vocabulary_version = ", if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_attribute_definition <- function(fetchField, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.attribute_definition WHERE')
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_definition_id = ", if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_name = ", if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_description = ", if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_type_concept_id = ", if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_syntax = ", if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort_definition <- function(fetchField, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cohort_definition WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_id = ", if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_name = ", if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_description = ", if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " definition_type_concept_id = ", if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_syntax = ", if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " subject_concept_id = ", if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_instantiation_date = ", if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

generateInsertSql <- function(databaseSchema = NULL) {
  insertSql <- c()
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.drug_claims;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.enrollment_detail;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.enrollment_summary;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.facility_header;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.health_risk_assessment;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.hra_question_ref;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.hra_variable_ref;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.inpatient_admissions;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.inpatient_services;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.lab;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.outpatient_services;")
  createInsertStatement <- function(insert, env) {
    s <- c()
    if (length(insert$fields)==0){
      s <- c(s, paste0('-- Group ', insert$testId, ': ', insert$sql))
      return(s)
    }
    else {
   
      if (env$testId != insert$testId) {
          s <- c(s, paste0('-- Test Case ', insert$testId, ': ', insert$testDescription))
          env$testId <- insert$testId
        }      
  
      s <- c(s, paste0("INSERT INTO @cdm_database_schema.",
                       insert$table,
                       "(",
                       paste(insert$fields, collapse = ", "),
                       ") VALUES (",
                       paste(insert$values, collapse = ", "), 
                       ");"))
      return(s)
    }
  }
  
  env <- new.env()
  env$testId <- -1
  insertSql <- c(insertSql, do.call(c, lapply(frameworkContext$inserts, createInsertStatement, env)))
  if (is.null(databaseSchema)) {
  	insertSql <- gsub('@cdm_database_schema.', '', insertSql)
  } else {
  	insertSql <- gsub('@cdm_database_schema', databaseSchema, insertSql)
  }
  return(insertSql)
}

generateTestSql <- function(databaseSchema = NULL) {
  testSql <- c()
  testSql <- c(testSql, "IF OBJECT_ID('@cdm_database_schema.test_results', 'U') IS NOT NULL DROP TABLE @cdm_database_schema.test_results;")
  testSql <- c(testSql, "CREATE TABLE @cdm_database_schema.test_results (id INT, description VARCHAR(512), test VARCHAR(256), status VARCHAR(5));")
  createExpectStatement <- function(expect, env) {
    s <- c()
    if (env$testId != expect$testId) {
      s <- c(s, paste0('-- Test Case', expect$testId, ': ', expect$testDescription))
      env$testId <- expect$testId
    }
    operators <- rep("=", length(expect$fields))
    operators[expect$values == "NULL"] <- rep("IS", sum(expect$values == "NULL"))
    s <- c(s, paste0("INSERT INTO @cdm_database_schema.test_results SELECT ",
                     expect$testId,
                     " AS id, '",
                     expect$testDescription,
                     "' AS description, 'Expect ",
                     expect$table,
                     "' AS test, CASE WHEN (SELECT COUNT(*) FROM @cdm_database_schema.",
                     expect$table,
                     " WHERE ",
                     paste(paste(expect$fields, operators, expect$values), collapse = " AND "),
                     ") ",
                     if (expect$type == 0) "= 0" else if (expect$type == 1) "!= 0" else paste("!=", expect$rowCount),
                     " THEN 'FAIL' ELSE 'PASS' END AS status;"))
    return(s)
  }
  env <- new.env()
  env$testId <- -1
  testSql <- c(testSql, do.call(c, lapply(frameworkContext$expects, createExpectStatement, env)))
  if (is.null(databaseSchema)) {
  	testSql <- gsub('@cdm_database_schema.', '', testSql)
  } else {
  	testSql <- gsub('@cdm_database_schema', databaseSchema, testSql)
  }
  return(testSql)
}

