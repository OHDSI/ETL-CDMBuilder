ETL-CDMBuilder
==============

Introduction
========

The CDM Builder can be used to transform observational datasets from their native formats and schemas into the OMOP Common Data Model (version 4).  

Features
========
* This builder can convert the following database:
  * Truven MarketScan Commercial Claims and Encounters (CCAE)
  * Truven MarketScan Medicare (MDCR)
  * Truven MarketScan Medicaid (MDCR)
  * OptumInsight ClinFormatics Data Mart v 5.0 (Optum)
  * Clinical Practice Research Datalink (CPRD)
  * Premier Alliance of Hospitals
  * National Health and Nutrition Examination Survey (NHANES)

Screenshot
===========
<img src="https://github.com/OHDSI/ETL-CDMBuilder/blob/master/man/ScreenShot.png" alt="ETL-CDMBuilder" title="ETL-CDMBuilder" />

Technology
============
* The CDM Builder was created using the Microsoft .NET framework (version 4+) and is meant to be executed against Microsoft SQL Server 2012+ databases. It is only intended to run in a Windows environment. 
* Visual Studio 2011+ is required for building the solution.

System Requirements
============
* SQL Server Native Client and .NET version 4+ are required on each server that will be running CDM Builder.

Dependencies
============
 * A SQL Server database of the OMOP Vocabulary must be accessible within your network. This will be used to map source concepts into CDM concepts.
 
Getting Started
===============
There is not a executable release this version, please use the User Guide to get started.

Getting Involved
=============
* User Guide
* Developer questions/comments/feedback: <a href="http://forums.ohdsi.org/c/developers">OHDSI Forum</a>
* We use the <a href="../../issues">GitHub issue tracker</a> for all bugs/issues/enhancements

License
=======
ETL-CDMBuilder is licensed under Apache License 2.0

Development
===========

###Development status
Beta testing, source is not set up properly to deploy an executable this release.

Acknowledgements
===========
Janssen Pharmaceutical Research & Development, LLC
