/****** Object:  Table [dbo].[CARE_SITE]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[CARE_SITE](
	[CARE_SITE_ID] [int] NOT NULL,
	[LOCATION_ID] [int] NULL,
	[ORGANIZATION_ID] [int] NULL,
	[PLACE_OF_SERVICE_CONCEPT_ID] [int] NULL,
	[CARE_SITE_SOURCE_VALUE] [varchar](50) NULL,
	[PLACE_OF_SERVICE_SOURCE_VALUE] [varchar](50) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[COHORT]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[COHORT](
	[COHORT_ID] [int] IDENTITY(1,1) NOT NULL,
	[COHORT_CONCEPT_ID] [int] NOT NULL,
	[COHORT_START_DATE] [date] NOT NULL,
	[COHORT_END_DATE] [date] NULL,
	[SUBJECT_ID] [bigint] NOT NULL,
	[STOP_REASON] [varchar](20) NULL
) ON [PRIMARY]


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[CONDITION_ERA]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[CONDITION_ERA](
	[CONDITION_ERA_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PERSON_ID] [bigint] NOT NULL,
	[CONDITION_CONCEPT_ID] [int] NOT NULL,
	[CONDITION_ERA_START_DATE] [date] NOT NULL,
	[CONDITION_ERA_END_DATE] [date] NOT NULL,
	[CONDITION_TYPE_CONCEPT_ID] [int] NOT NULL,
	[CONDITION_OCCURRENCE_COUNT] [int] NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


/****** Object:  Table [dbo].[CONDITION_OCCURRENCE]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[CONDITION_OCCURRENCE](
	[CONDITION_OCCURRENCE_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PERSON_ID] [bigint] NOT NULL,
	[CONDITION_CONCEPT_ID] [int] NOT NULL,
	[CONDITION_START_DATE] [date] NOT NULL,
	[CONDITION_END_DATE] [date] NULL,
	[CONDITION_TYPE_CONCEPT_ID] [int] NOT NULL,
	[STOP_REASON] [varchar](20) NULL,
	[ASSOCIATED_PROVIDER_ID] [bigint] NULL,
	[VISIT_OCCURRENCE_ID] [bigint] NULL,
	[CONDITION_SOURCE_VALUE] [varchar](50) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[DEATH]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[DEATH](
	[PERSON_ID] [bigint] NOT NULL,
	[DEATH_DATE] [date] NOT NULL,
	[DEATH_TYPE_CONCEPT_ID] [int] NOT NULL,
	[CAUSE_OF_DEATH_CONCEPT_ID] [int] NULL,
	[CAUSE_OF_DEATH_SOURCE_VALUE] [varchar](50) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[DRUG_COST]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[DRUG_COST](
	[DRUG_COST_ID] [bigint] NOT NULL,
	[DRUG_EXPOSURE_ID] [bigint] NOT NULL,
	[PAID_COPAY] [numeric](12, 2) NULL,
	[PAID_COINSURANCE] [numeric](12, 2) NULL,
	[PAID_TOWARD_DEDUCTIBLE] [numeric](12, 2) NULL,
	[PAID_BY_PAYER] [numeric](12, 2) NULL,
	[PAID_BY_COORDINATION_BENEFITS] [numeric](12, 2) NULL,
	[TOTAL_OUT_OF_POCKET] [numeric](12, 2) NULL,
	[TOTAL_PAID] [numeric](12, 2) NULL,
	[INGREDIENT_COST] [numeric](12, 2) NULL,
	[DISPENSING_FEE] [numeric](12, 2) NULL,
	[AVERAGE_WHOLESALE_PRICE] [numeric](12, 2) NULL,
	[PAYER_PLAN_PERIOD_ID] [int] NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


/****** Object:  Table [dbo].[DRUG_ERA]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[DRUG_ERA](
	[DRUG_ERA_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PERSON_ID] [bigint] NOT NULL,
	[DRUG_ERA_START_DATE] [date] NOT NULL,
	[DRUG_ERA_END_DATE] [date] NOT NULL,
	[DRUG_TYPE_CONCEPT_ID] [int] NOT NULL,
	[DRUG_CONCEPT_ID] [int] NULL,
	[DRUG_EXPOSURE_COUNT] [int] NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


/****** Object:  Table [dbo].[DRUG_EXPOSURE]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[DRUG_EXPOSURE](
	[DRUG_EXPOSURE_ID] [bigint] NOT NULL,
	[PERSON_ID] [bigint] NOT NULL,
	[DRUG_CONCEPT_ID] [int] NOT NULL,
	[DRUG_EXPOSURE_START_DATE] [date] NOT NULL,
	[DRUG_EXPOSURE_END_DATE] [date] NULL,
	[DRUG_TYPE_CONCEPT_ID] [int] NOT NULL,
	[STOP_REASON] [varchar](20) NULL,
	[REFILLS] [int] NULL,
	[QUANTITY] [int] NULL,
	[DAYS_SUPPLY] [int] NULL,
	[SIG] [varchar](500) NULL,
	[PRESCRIBING_PROVIDER_ID] [bigint] NULL,
	[VISIT_OCCURRENCE_ID] [bigint] NULL,
	[RELEVANT_CONDITION_CONCEPT_ID] [int] NULL,
	[DRUG_SOURCE_VALUE] [varchar](50) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[LOCATION]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[LOCATION](
	[LOCATION_ID] [int] NOT NULL,
	[ADDRESS_1] [varchar](50) NULL,
	[ADDRESS_2] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[STATE] [char](2) NULL,
	[ZIP] [varchar](9) NULL,
	[COUNTY] [varchar](20) NULL,
	[LOCATION_SOURCE_VALUE] [varchar](50) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[OBSERVATION]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[OBSERVATION](
	[OBSERVATION_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PERSON_ID] [bigint] NOT NULL,
	[OBSERVATION_CONCEPT_ID] [bigint] NOT NULL,
	[OBSERVATION_TYPE_CONCEPT_ID] [int] NOT NULL,
	[OBSERVATION_DATE] [date] NOT NULL,
	[OBSERVATION_TIME] [time](7) NULL,
	[VALUE_AS_NUMBER] [numeric](15, 3) NULL,
	[VALUE_AS_STRING] [varchar](500) NULL,
	[VALUE_AS_CONCEPT_ID] [int] NULL,
	[UNIT_CONCEPT_ID] [bigint] NULL,
	[RANGE_LOW] [float] NULL,
	[RANGE_HIGH] [float] NULL,
	[ASSOCIATED_PROVIDER_ID] [bigint] NULL,
	[VISIT_OCCURRENCE_ID] [bigint] NULL,
	[OBSERVATION_SOURCE_VALUE] [varchar](256) NULL,
	[UNIT_SOURCE_VALUE] [varchar](256) NULL,
	[RELEVANT_CONDITION_CONCEPT_ID] [int] NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[OBSERVATION_PERIOD]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OBSERVATION_PERIOD](
	[OBSERVATION_PERIOD_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PERSON_ID] [bigint] NOT NULL,
	[OBSERVATION_PERIOD_START_DATE] [date] NOT NULL,
	[OBSERVATION_PERIOD_END_DATE] [date] NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


/****** Object:  Table [dbo].[ORGANIZATION]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[ORGANIZATION](
	[ORGANIZATION_ID] [int] NOT NULL,
	[PLACE_OF_SERVICE_CONCEPT_ID] [int] NULL,
	[LOCATION_ID] [int] NULL,
	[ORGANIZATION_SOURCE_VALUE] [varchar](50) NULL,
	[PLACE_OF_SERVICE_SOURCE_VALUE] [varchar](50) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[PAYER_PLAN_PERIOD]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[PAYER_PLAN_PERIOD](
	[PAYER_PLAN_PERIOD_ID] [bigint] NOT NULL,
	[PERSON_ID] [bigint] NOT NULL,
	[PAYER_PLAN_PERIOD_START_DATE] [date] NOT NULL,
	[PAYER_PLAN_PERIOD_END_DATE] [date] NOT NULL,
	[PAYER_SOURCE_VALUE] [varchar](50) NULL,
	[PLAN_SOURCE_VALUE] [varchar](50) NULL,
	[FAMILY_SOURCE_VALUE] [varchar](50) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[PERSON]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[PERSON](
	[PERSON_ID] [bigint] NOT NULL,
	[GENDER_CONCEPT_ID] [int] NOT NULL,
	[YEAR_OF_BIRTH] [int] NOT NULL,
	[MONTH_OF_BIRTH] [int] NULL,
	[DAY_OF_BIRTH] [int] NULL,
	[RACE_CONCEPT_ID] [int] NULL,
	[ETHNICITY_CONCEPT_ID] [int] NULL,
	[LOCATION_ID] [int] NULL,
	[PROVIDER_ID] [bigint] NULL,
	[CARE_SITE_ID] [int] NULL,
	[PERSON_SOURCE_VALUE] [varchar](50) NULL,
	[GENDER_SOURCE_VALUE] [varchar](50) NULL,
	[RACE_SOURCE_VALUE] [varchar](50) NULL,
	[ETHNICITY_SOURCE_VALUE] [varchar](50) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[PROCEDURE_COST]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[PROCEDURE_COST](
	[PROCEDURE_COST_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PROCEDURE_OCCURRENCE_ID] [bigint] NOT NULL,
	[PAID_COPAY] [numeric](12, 2) NULL,
	[PAID_COINSURANCE] [numeric](12, 2) NULL,
	[PAID_TOWARD_DEDUCTIBLE] [numeric](12, 2) NULL,
	[PAID_BY_PAYER] [numeric](12, 2) NULL,
	[PAID_BY_COORDINATION_BENEFITS] [numeric](12, 2) NULL,
	[TOTAL_OUT_OF_POCKET] [numeric](12, 2) NULL,
	[TOTAL_PAID] [numeric](12, 2) NULL,
	[DISEASE_CLASS_CONCEPT_ID] [int] NULL,
	[REVENUE_CODE_CONCEPT_ID] [int] NULL,
	[PAYER_PLAN_PERIOD_ID] [bigint] NULL,
	[DISEASE_CLASS_SOURCE_VALUE] [varchar](50) NULL,
	[REVENUE_CODE_SOURCE_VALUE] [varchar](50) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[PROCEDURE_OCCURRENCE]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[PROCEDURE_OCCURRENCE](
	[PROCEDURE_OCCURRENCE_ID] [bigint] NOT NULL,
	[PERSON_ID] [bigint] NOT NULL,
	[PROCEDURE_TYPE_CONCEPT_ID] [int] NOT NULL,
	[PROCEDURE_DATE] [date] NOT NULL,
	[PROCEDURE_CONCEPT_ID] [bigint] NOT NULL,
	[ASSOCIATED_PROVIDER_ID] [bigint] NULL,
	[PROCEDURE_SOURCE_VALUE] [varchar](50) NULL,
	[VISIT_OCCURRENCE_ID] [bigint] NULL,
	[RELEVANT_CONDITION_CONCEPT_ID] [int] NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[PROVIDER]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[PROVIDER](
	[PROVIDER_ID] [bigint] NOT NULL,
	[NPI] [varchar](20) NULL,
	[DEA] [varchar](20) NULL,
	[SPECIALTY_CONCEPT_ID] [int] NULL,
	[CARE_SITE_ID] [int] NULL,
	[PROVIDER_SOURCE_VALUE] [varchar](50) NULL,
	[SPECIALTY_SOURCE_VALUE] [varchar](50) NULL
) ON [PRIMARY]


SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[VISIT_OCCURRENCE]    Script Date: 10/7/2013 9:30:37 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[VISIT_OCCURRENCE](
	[VISIT_OCCURRENCE_ID] [bigint] NOT NULL,
	[PERSON_ID] [bigint] NOT NULL,
	[PLACE_OF_SERVICE_CONCEPT_ID] [int] NOT NULL,
	[VISIT_START_DATE] [date] NOT NULL,
	[VISIT_END_DATE] [date] NOT NULL,
	[PLACE_OF_SERVICE_SOURCE_VALUE] [varchar](50) NULL,
	[CARE_SITE_ID] [int] NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)


SET ANSI_PADDING OFF



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated unique identifier for each care site. A care site is the place where the provider delivered the healthcare to the person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CARE_SITE', @level2type=N'COLUMN',@level2name=N'CARE_SITE_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the geographic location in the location table, where the detailed address information is stored.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CARE_SITE', @level2type=N'COLUMN',@level2name=N'LOCATION_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the organization in the organization table, where the detailed information is stored.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CARE_SITE', @level2type=N'COLUMN',@level2name=N'ORGANIZATION_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the predefined concept identifier in the vocabulary reflecting the place of service.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CARE_SITE', @level2type=N'COLUMN',@level2name=N'PLACE_OF_SERVICE_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the care site as it appears in the source data, stored here for reference.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CARE_SITE', @level2type=N'COLUMN',@level2name=N'CARE_SITE_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the place of service as it appears in the source data, stored here for reference.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CARE_SITE', @level2type=N'COLUMN',@level2name=N'PLACE_OF_SERVICE_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about the site of care.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CARE_SITE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated unique identifier for each condition era.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_ERA', @level2type=N'COLUMN',@level2name=N'CONDITION_ERA_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key identifier to the person who is experiencing the condition during the condition era. The demographic details of that person are stored in the person table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_ERA', @level2type=N'COLUMN',@level2name=N'PERSON_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key that refers to a standard condition concept identifier in the vocabulary. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_ERA', @level2type=N'COLUMN',@level2name=N'CONDITION_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date for the condition era constructed from the individual instances of condition occurrences. It is the start date of the very first chronologically recorded instance of the condition.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_ERA', @level2type=N'COLUMN',@level2name=N'CONDITION_ERA_START_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date for the condition era constructed from the individual instances of condition occurrences. It is the end date of the final continuously recorded instance of the condition.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_ERA', @level2type=N'COLUMN',@level2name=N'CONDITION_ERA_END_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' A foreign key to the predefined concept identifier in the vocabulary reflecting the parameters used to construct the condition era. For a detailed current listing of condition types see Appendix B: Condition Type Concepts.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_ERA', @level2type=N'COLUMN',@level2name=N'CONDITION_TYPE_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of individual condition occurrences used to construct the condition era.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_ERA', @level2type=N'COLUMN',@level2name=N'CONDITION_OCCURRENCE_COUNT'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A diagnoses or conditions that over a period of time.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_ERA'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated unique identifier for each condition occurrence event.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'CONDITION_OCCURRENCE_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key identifier to the person who is experiencing the condition. The demographic details of that person are stored in the person table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'PERSON_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key that refers to a standard condition concept identifier in the vocabulary.  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'CONDITION_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date when the instance of the condition is recorded.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'CONDITION_START_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date when the instance of the Condition is last' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'CONDITION_END_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the predefined concept identifier in the vocabulary reflecting the source data from which the condition was recorded, the level of standardization, and the type of occurrence. Conditions are defined as primary or secondary diagnoses, problem lists and person statuses. For a detailed current listing of condition types see Appendix B: Condition Type Concepts.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'CONDITION_TYPE_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The reason, if available, that the condition was no longer recorded, as indicated in the source data. Valid values include discharged, resolved, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'STOP_REASON'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the provider in the provider table who was responsible for determining (diagnosing) the condition.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'ASSOCIATED_PROVIDER_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the visit in the visit table during which the condition was determined (diagnosed).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'VISIT_OCCURRENCE_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the condition as it appears in the source data. This code is mapped to a standard condition concept in the vocabulary and the original code is , stored here for reference. Condition source codes are typically ICD-9-CM diagnosis codes from medical claims or discharge status/disposition codes from EHRs.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'CONDITION_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A diagnosis or condition that has been recorded about a person at a certain time.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONDITION_OCCURRENCE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System-generated foreign key identifier to the deceased person. The demographic details of that person are stored in the person table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEATH', @level2type=N'COLUMN',@level2name=N'PERSON_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the person deceased. If the precise date including day or month is not known or not allowed, December is used as the default month, and the last day of the month the default day.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEATH', @level2type=N'COLUMN',@level2name=N'DEATH_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key referring to the predefined concept identifier in the vocabulary reflecting how the death was represented in the source data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEATH', @level2type=N'COLUMN',@level2name=N'DEATH_TYPE_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key referring to a standard concept identifier in the vocabulary for conditions.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEATH', @level2type=N'COLUMN',@level2name=N'CAUSE_OF_DEATH_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the cause of death as it appears in the source data. This code is mapped to a standard concept in the vocabulary and the original code is , stored here for reference. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEATH', @level2type=N'COLUMN',@level2name=N'CAUSE_OF_DEATH_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Time and cause of death of the Person. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEATH'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated unique identifier for each drug cost record.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'DRUG_COST_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key identifier to the drug record for which cost data are recorded. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'DRUG_EXPOSURE_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount paid by the person as a fixed contribution to the expenses. Copay does not contribute to the out_of_pocket expenses.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'PAID_COPAY'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount paid by the person as a joint assumption of risk. Typically, this is a percentage of the expenses defined by the payer plan (policy) after the person' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'PAID_COINSURANCE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount paid by the person that is counted toward the deductible defined by the payer plan (policy).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'PAID_TOWARD_DEDUCTIBLE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount paid by the payer (insurer). If there is more than one payer, several drug_cost records indicate that fact.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'PAID_BY_PAYER'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount paid by a secondary payer through the coordination of benefits.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'PAID_BY_COORDINATION_BENEFITS'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total amount paid by the person as a share of the expenses, excluding the copay.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'TOTAL_OUT_OF_POCKET'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total amount paid for the expenses of drug exposure.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'TOTAL_PAID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The portion of the drug expenses due to the cost charged by the manufacturer for the drug, typically a percentage of the Average Wholesale Price.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'INGREDIENT_COST'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The portion of the drug expenses due to the dispensing fee charged by the pharmacy, typically a fixed amount.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'DISPENSING_FEE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'List price of a drug set by the manufacturer.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'AVERAGE_WHOLESALE_PRICE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the payer_plan_period table, where the details of the payer, plan and family are stored.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST', @level2type=N'COLUMN',@level2name=N'PAYER_PLAN_PERIOD_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For each Drug Exposure record additional information about cost and payments.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_COST'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated unique identifier for each drug era.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_ERA', @level2type=N'COLUMN',@level2name=N'DRUG_ERA_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key identifier to the person who is subjected to the drug during the drug era. The demographic details of that person are stored in the person table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_ERA', @level2type=N'COLUMN',@level2name=N'PERSON_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date for the drug era constructed from the individual instances of drug exposures. It is the start date of the very first chronologically recorded instance of utilization of a drug.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_ERA', @level2type=N'COLUMN',@level2name=N'DRUG_ERA_START_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date for the drug era constructed from the individual instance of drug exposures. It is the end date of the final continuously recorded instance of utilization of a drug.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_ERA', @level2type=N'COLUMN',@level2name=N'DRUG_ERA_END_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' A foreign key to the predefined concept identifier in the vocabulary reflecting the parameters used to construct the drug era. For a detailed current listing of drug types see Appendix A: Drug Type Codes.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_ERA', @level2type=N'COLUMN',@level2name=N'DRUG_TYPE_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key that refers to a standard concept identifier in the vocabulary for the drug concept.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_ERA', @level2type=N'COLUMN',@level2name=N'DRUG_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of individual drug exposure occurrences used to construct the drug era.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_ERA', @level2type=N'COLUMN',@level2name=N'DRUG_EXPOSURE_COUNT'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Association between a Person and a Drug over a specific time period.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRUG_ERA'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated unique identifier for each geographic location.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOCATION', @level2type=N'COLUMN',@level2name=N'LOCATION_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The address field 1, typically used for the street address, as it appears in the source data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOCATION', @level2type=N'COLUMN',@level2name=N'ADDRESS_1'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The address field 2, typically used for additional detail such as buildings, suites, floors, as it appears in the source data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOCATION', @level2type=N'COLUMN',@level2name=N'ADDRESS_2'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The city field as it appears in the source data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOCATION', @level2type=N'COLUMN',@level2name=N'CITY'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The state field as it appears in the source data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOCATION', @level2type=N'COLUMN',@level2name=N'STATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The zip code. For US addresses, valid zip codes can be 3, 5 or 9 digits long, depending on the source data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOCATION', @level2type=N'COLUMN',@level2name=N'ZIP'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The county. The county information is necessary because not all zip codes fall into one and the same county.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOCATION', @level2type=N'COLUMN',@level2name=N'COUNTY'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The verbatim information that is used to uniquely identify the location as it appears in the source data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOCATION', @level2type=N'COLUMN',@level2name=N'LOCATION_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Physical addresses.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOCATION'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated unique identifier for each observation.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'OBSERVATION_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key identifier to the person about whom the observation was recorded. The demographic details of that person are stored in the person table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'PERSON_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the standard observation concept identifier in the vocabulary. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'OBSERVATION_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the predefined concept identifier in the vocabulary reflecting the type of the observation.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'OBSERVATION_TYPE_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date of the observation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'OBSERVATION_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time of the observation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'OBSERVATION_TIME'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The observation result stored as a number. This is applicable to observations where the result is expressed as a numeric value.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'VALUE_AS_NUMBER'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The observation result stored as a string. This is applicable to observations where the result is expressed as verbatim text, such as in radiology or pathology report' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'VALUE_AS_STRING'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to an observation result stored as a concept identifier. This is applicable to observations where the result can be expressed as a standard concept from the vocabulary (e.g., positive/negative, present/absent, low/high, etc.).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'VALUE_AS_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to a standard concept identifier of measurement units in the vocabulary.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'UNIT_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The lower limit of the normal range of the observation. It is not applicable if the observation results are non-numeric or categorical, and must be in the same units of measure as the observation value.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'RANGE_LOW'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The upper limit of the normal range of the observation. It is not applicable if the observation results are non-numeric or categorical, and must be in the same units of measure as the observation value.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'RANGE_HIGH'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the provider in the provider table who was responsible for making the observation.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'ASSOCIATED_PROVIDER_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the visit in the visit table during which the observation was recorded.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'VISIT_OCCURRENCE_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The observation code as it appears in the source data. This code is mapped to a standard concept in the vocabulary and the original code is , stored here for reference.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'OBSERVATION_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the unit as it appears in the source data. This code is mapped to a standard unit concept in the vocabulary and the original code is , stored here for reference. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'UNIT_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the predefined concept identifier in the vocabulary reflecting the condition that was associated with the observation. Note that this is not a direct reference to a specific condition record in the condition table, but rather a condition concept in the vocabulary.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION', @level2type=N'COLUMN',@level2name=N'RELEVANT_CONDITION_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Symptoms, clinical observations, lab tests etc. about the Person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated unique identifier for each observation period.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION_PERIOD', @level2type=N'COLUMN',@level2name=N'OBSERVATION_PERIOD_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key identifier to the person for whom the observation period is defined. The demographic details of that person are stored in the person table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION_PERIOD', @level2type=N'COLUMN',@level2name=N'PERSON_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date of the observation period for which data are available from the data source.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION_PERIOD', @level2type=N'COLUMN',@level2name=N'OBSERVATION_PERIOD_START_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date of the observation period for which data are available from the data source.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION_PERIOD', @level2type=N'COLUMN',@level2name=N'OBSERVATION_PERIOD_END_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Time intervals at which health care information may be available.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBSERVATION_PERIOD'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated unique identifier for each organization. Here, an organization is defined as a collection of one or more care sites that share a single EHR database.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORGANIZATION', @level2type=N'COLUMN',@level2name=N'ORGANIZATION_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key that refers to a place of service concept identifier in the vocabulary.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORGANIZATION', @level2type=N'COLUMN',@level2name=N'PLACE_OF_SERVICE_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the geographic location of the administrative offices in the location table, where the detailed address information is stored.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORGANIZATION', @level2type=N'COLUMN',@level2name=N'LOCATION_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the organization in the source data , stored here for reference.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORGANIZATION', @level2type=N'COLUMN',@level2name=N'ORGANIZATION_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the place of service as it appears in the source data, stored here for reference.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORGANIZATION', @level2type=N'COLUMN',@level2name=N'PLACE_OF_SERVICE_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about health care organizations. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORGANIZATION'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated identifier for each unique combination of payer, plan, family code and time span' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PAYER_PLAN_PERIOD', @level2type=N'COLUMN',@level2name=N'PAYER_PLAN_PERIOD_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key identifier to the person covered by the payer. The demographic details of that person are stored in the person table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PAYER_PLAN_PERIOD', @level2type=N'COLUMN',@level2name=N'PERSON_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date of the payer plan period.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PAYER_PLAN_PERIOD', @level2type=N'COLUMN',@level2name=N'PAYER_PLAN_PERIOD_START_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date of the payer plan period defined for the person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PAYER_PLAN_PERIOD', @level2type=N'COLUMN',@level2name=N'PAYER_PLAN_PERIOD_END_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the payer as it appears in the source data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PAYER_PLAN_PERIOD', @level2type=N'COLUMN',@level2name=N'PAYER_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the person' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PAYER_PLAN_PERIOD', @level2type=N'COLUMN',@level2name=N'PLAN_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the person' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PAYER_PLAN_PERIOD', @level2type=N'COLUMN',@level2name=N'FAMILY_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about the coverage plan of the payer.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PAYER_PLAN_PERIOD'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System-generated identifier to uniquely identify each PERSON.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'PERSON_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key that refers to the standard Concept Code in the Dictionary for the Gender of the Person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'GENDER_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The year of birth of the Person. For data sources with date of birth, only the year is extracted. For data sources where the year of birth is not available, the approximate year of birth is derived based on any age group categorization available.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'YEAR_OF_BIRTH'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month of birth of the person. For data sources that provide the precise date of birth, the month is extracted and stored in this field.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'MONTH_OF_BIRTH'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The day of the month of birth of the person. For data sources that provide the precise date of birth, the day is extracted and stored in this field.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'DAY_OF_BIRTH'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key that refers to a standard concept identifier in the vocabulary for the race of the person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'RACE_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key that refers to the standard concept identifier in the vocabulary for the ethnicity of the person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'ETHNICITY_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the place of residency for the person in the location table, where the detailed address information is stored.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'LOCATION_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the primary care provider the person is seeing in the provider table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'PROVIDER_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the primary care site in the care site table, where the details of the care site are stored.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'CARE_SITE_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An encrypted key derived from the person identifier in the source data. This is necessary when a drug safety issue requires a link back to the person data at the source dataset. No value with any medical or demographic significance must be stored.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'PERSON_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the gender of the person as it appears in the source data. The person gender is mapped to a standard gender concept in the vocabulary and the corresponding concept identifier is, stored here for reference.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'GENDER_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the race of the person as it appears in the source data. The person race is mapped to a standard race concept in the vocabulary and the original code is, stored here for reference.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'RACE_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the ethnicity of the person as it appears in the source data. The person ethnicity is mapped to a standard ethnicity concept in the vocabulary and the original code is, stored here for reference.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON', @level2type=N'COLUMN',@level2name=N'ETHNICITY_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Demographic information about a Person (patient).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERSON'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated unique identifier for each procedure cost record.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'PROCEDURE_COST_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key identifier to the procedure record for which cost data are recorded. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'PROCEDURE_OCCURRENCE_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount paid by the person as a fixed contribution to the expenses. Copay does not contribute to the out_of_pocket expenses.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'PAID_COPAY'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount paid by the person as a joint assumption of risk. Typically, this is a percentage of the expenses defined by the payer plan (policy) after the person' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'PAID_COINSURANCE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount paid by the person that is counted toward the deductible defined by the payer plan (policy).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'PAID_TOWARD_DEDUCTIBLE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount paid by the payer (insurer). If there is more than one payer, several procedure_cost records indicate that fact.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'PAID_BY_PAYER'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount paid by a secondary payer through the coordination of benefits.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'PAID_BY_COORDINATION_BENEFITS'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total amount paid by the person as a share of the expenses, excluding the copay.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'TOTAL_OUT_OF_POCKET'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total amount paid for the expenses of the procedure.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'TOTAL_PAID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key referring to a standard concept identifier in the vocabulary for disease classes, such as DRGs and APCs.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'DISEASE_CLASS_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key referring to a standard concept identifier in the vocabulary for revenue codes.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'REVENUE_CODE_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the payer_plan_period table, where the details of the payer, plan and family are stored.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'PAYER_PLAN_PERIOD_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the disease class as it appears in the source data , stored here for reference.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'DISEASE_CLASS_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code for the revenue code as it appears in the source data , stored here for reference.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST', @level2type=N'COLUMN',@level2name=N'REVENUE_CODE_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For each Procedure additional information about cost and payments.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROCEDURE_COST'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system-generated unique identifier for each person' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VISIT_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'VISIT_OCCURRENCE_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key identifier to the person for whom the visit is recorded. The demographic details of that person are stored in the person table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VISIT_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'PERSON_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key that refers to a place of service concept identifier in the vocabulary.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VISIT_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'PLACE_OF_SERVICE_CONCEPT_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date of the visit.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VISIT_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'VISIT_START_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date of the visit. If this is a one-day visit the end date should match the start date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VISIT_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'VISIT_END_DATE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source code used to reflect the type or source of the visit in the source data. Valid entries include office visits, hospital admissions, etc. These source codes can also be type-of service codes and activity type codes.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VISIT_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'PLACE_OF_SERVICE_SOURCE_VALUE'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A foreign key to the care site in the care site table that was visited.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VISIT_OCCURRENCE', @level2type=N'COLUMN',@level2name=N'CARE_SITE_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Visits for health care services of the Person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VISIT_OCCURRENCE'

