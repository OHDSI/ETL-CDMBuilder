CREATE EXTERNAL TABLE {sc}.cdm_source  (
  cdm_source_name					VARCHAR(255),
  cdm_source_abbreviation			VARCHAR(25),
  cdm_holder						VARCHAR(255),
  source_description				VARCHAR(MAX),
  source_documentation_reference	VARCHAR(255),
  cdm_etl_reference					VARCHAR(255),
  source_release_date				DATE,
  cdm_release_date					DATE,
  cdm_version						VARCHAR(10),
  vocabulary_version				VARCHAR(20)
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/CDM_SOURCE/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.metadata  (
  metadata_concept_id       INTEGER,
  metadata_type_concept_id  INTEGER,
  name                      VARCHAR(250),
  value_as_string           VARCHAR(MAX),
  value_as_concept_id       INTEGER,
  metadata_date             DATE,
  metadata_datetime         VARCHAR(19)   
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/METADATA/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.person  (
  person_id						BIGINT,
  gender_concept_id				INTEGER,
  year_of_birth					INTEGER,
  month_of_birth				INTEGER,
  day_of_birth					INTEGER,
  birth_datetime				VARCHAR(19),
  death_datetime				VARCHAR(19),
  race_concept_id				INTEGER,
  ethnicity_concept_id			INTEGER,
  location_id					BIGINT,
  provider_id					BIGINT,
  care_site_id					BIGINT,
  person_source_value			VARCHAR(50),
  gender_source_value			VARCHAR(50),
  gender_source_concept_id	  	INTEGER,
  race_source_value				VARCHAR(50),
  race_source_concept_id		INTEGER,
  ethnicity_source_value		VARCHAR(50),
  ethnicity_source_concept_id	INTEGER
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/PERSON/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.observation_period  (
  observation_period_id				BIGINT,
  person_id							BIGINT,
  observation_period_start_date		DATE,
  observation_period_end_date		DATE,
  period_type_concept_id			INTEGER
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/OBSERVATION_PERIOD/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.specimen  (
  specimen_id					BIGINT,
  person_id						BIGINT,
  specimen_concept_id			INTEGER,
  specimen_type_concept_id		INTEGER,
  specimen_date					DATE,
  specimen_datetime				VARCHAR(19),
  quantity						DECIMAL(38,2),
  unit_concept_id				INTEGER,
  anatomic_site_concept_id		INTEGER,
  disease_status_concept_id		INTEGER,
  specimen_source_id			VARCHAR(50),
  specimen_source_value			VARCHAR(50),
  unit_source_value				VARCHAR(50),
  anatomic_site_source_value	VARCHAR(50),
  disease_status_source_value	VARCHAR(50)
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/SPECIMEN/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.visit_occurrence  (
  visit_occurrence_id			    BIGINT,
  person_id						    BIGINT,
  visit_concept_id				    INTEGER,
  visit_start_date				    DATE,
  visit_start_datetime				VARCHAR(19),
  visit_end_date					DATE,
  visit_end_datetime				VARCHAR(19),
  visit_type_concept_id			    INTEGER,
  provider_id					    BIGINT,
  care_site_id					    BIGINT,
  visit_source_value				VARCHAR(50),
  visit_source_concept_id		    INTEGER,
  admitted_from_concept_id      	INTEGER,   
  admitted_from_source_value    	VARCHAR(50),
  discharge_to_source_value		  	VARCHAR(50),
  discharge_to_concept_id		    INTEGER,
  preceding_visit_occurrence_id		BIGINT	
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/VISIT_OCCURRENCE/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.visit_detail  (
  visit_detail_id                    BIGINT,
  person_id                          BIGINT,
  visit_detail_concept_id            INTEGER,
  visit_detail_start_date            DATE,
  visit_detail_start_datetime        VARCHAR(19),
  visit_detail_end_date              DATE,
  visit_detail_end_datetime          VARCHAR(19),
  visit_detail_type_concept_id       INTEGER,
  provider_id                        BIGINT,
  care_site_id                       BIGINT,
  discharge_to_concept_id            INTEGER,
  admitted_from_concept_id           INTEGER, 
  admitted_from_source_value         VARCHAR(50),
  visit_detail_source_value          VARCHAR(50),
  visit_detail_source_concept_id     INTEGER,
  discharge_to_source_value          VARCHAR(50),
  preceding_visit_detail_id          BIGINT,
  visit_detail_parent_id             BIGINT,
  visit_occurrence_id                BIGINT
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/VISIT_DETAIL/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.procedure_occurrence  (
  procedure_occurrence_id		BIGINT,
  person_id						BIGINT,
  procedure_concept_id			INTEGER,
  procedure_date				DATE,
  procedure_datetime			VARCHAR(19),
  procedure_type_concept_id		INTEGER,
  modifier_concept_id			INTEGER,
  quantity						INTEGER,
  provider_id					BIGINT,
  visit_occurrence_id			BIGINT,
  visit_detail_id             	BIGINT,
  procedure_source_value		VARCHAR(50),
  procedure_source_concept_id	INTEGER,
  modifier_source_value		    VARCHAR(50)
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/PROCEDURE_OCCURRENCE/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.drug_exposure  (
  drug_exposure_id				BIGINT,
  person_id						BIGINT,
  drug_concept_id				INTEGER,
  drug_exposure_start_date		DATE,
  drug_exposure_start_datetime	VARCHAR(19),
  drug_exposure_end_date		DATE,
  drug_exposure_end_datetime	VARCHAR(19),
  verbatim_end_date				DATE,
  drug_type_concept_id			INTEGER,
  stop_reason					VARCHAR(20),
  refills						INTEGER,
  quantity						NUMERIC,
  days_supply					INTEGER,
  sig							TEXT,
  route_concept_id				INTEGER,
  lot_number					VARCHAR(50),
  provider_id					BIGINT,
  visit_occurrence_id			BIGINT,
  visit_detail_id               BIGINT,
  drug_source_value				VARCHAR(50),
  drug_source_concept_id		INTEGER,
  route_source_value			VARCHAR(50),
  dose_unit_source_value		VARCHAR(50)	  
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/DRUG_EXPOSURE/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.device_exposure  (
  device_exposure_id			    BIGINT,
  person_id						    BIGINT,
  device_concept_id			        INTEGER,
  device_exposure_start_date	    DATE,
  device_exposure_start_datetime	VARCHAR(19),
  device_exposure_end_date		    DATE,
  device_exposure_end_datetime    	VARCHAR(19),
  device_type_concept_id		    INTEGER,
  unique_device_id			        VARCHAR(50),
  quantity						    DECIMAL(38,2),
  provider_id					    BIGINT,
  visit_occurrence_id			    BIGINT,
  visit_detail_id                 	BIGINT,
  device_source_value			    VARCHAR(100),
  device_source_concept_id		    INTEGER	
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/DEVICE_EXPOSURE/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.condition_occurrence  (
  condition_occurrence_id		    BIGINT,
  person_id						    BIGINT,
  condition_concept_id			    INTEGER,
  condition_start_date			    DATE,
  condition_start_datetime		  	VARCHAR(19),
  condition_end_date			    DATE,
  condition_end_datetime		    VARCHAR(19),
  condition_type_concept_id		  	INTEGER,
  condition_status_concept_id	  	INTEGER,
  stop_reason					    VARCHAR(20),
  provider_id					    BIGINT,
  visit_occurrence_id			    BIGINT,
  visit_detail_id               	BIGINT,
  condition_source_value		    VARCHAR(50),
  condition_source_concept_id	  	INTEGER,
  condition_status_source_value		VARCHAR(50)
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/CONDITION_OCCURRENCE/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.measurement  (
  measurement_id				BIGINT,
  person_id						BIGINT,
  measurement_concept_id		INTEGER,
  measurement_date				DATE,
  measurement_datetime			VARCHAR(19),
  measurement_time              VARCHAR(19),
  measurement_type_concept_id	INTEGER,
  operator_concept_id			INTEGER,
  value_as_number				DECIMAL(38,2),
  value_as_concept_id			INTEGER,
  unit_concept_id				INTEGER,
  range_low					    DECIMAL(38,2),
  range_high					DECIMAL(38,2),
  provider_id					BIGINT,
  visit_occurrence_id			BIGINT,
  visit_detail_id               BIGINT,
  measurement_source_value		VARCHAR(50),
  measurement_source_concept_id	INTEGER,
  unit_source_value				VARCHAR(50),
  value_source_value			VARCHAR(700)
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/MEASUREMENT/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.note  (
  note_id						BIGINT,
  person_id						BIGINT,
  note_event_id         		BIGINT, 
  note_event_field_concept_id	INTEGER, 
  note_date						DATE,
  note_datetime					VARCHAR(19),
  note_type_concept_id			INTEGER,
  note_class_concept_id 		INTEGER,
  note_title					VARCHAR(250),
  note_text						VARCHAR(MAX),
  encoding_concept_id			INTEGER,
  language_concept_id			INTEGER,
  provider_id					BIGINT,
  visit_occurrence_id			BIGINT,
  visit_detail_id       		BIGINT,
  note_source_value				VARCHAR(50)
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/NOTE/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.note_nlp  (
  note_nlp_id					BIGINT,
  note_id						BIGINT,
  section_concept_id			INTEGER,
  snippet						VARCHAR(250),
  "offset"					    VARCHAR(250),
  lexical_variant				VARCHAR(250),
  note_nlp_concept_id			INTEGER,
  nlp_system					VARCHAR(250),
  nlp_date						DATE,
  nlp_datetime					VARCHAR(19),
  term_exists					VARCHAR(1),
  term_temporal					VARCHAR(50),
  term_modifiers				VARCHAR(2000),
  note_nlp_source_concept_id  	INTEGER	
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/NOTE_NLP/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.observation
 (observation_id					BIGINT,
  person_id						    BIGINT,
  observation_concept_id			INTEGER,
  observation_date				    DATE,
  observation_datetime				VARCHAR(19),
  observation_type_concept_id	    INTEGER,
  value_as_number				    DECIMAL(38,2),
  value_as_string				    VARCHAR(60),
  value_as_concept_id			    INTEGER,
  qualifier_concept_id			    INTEGER,
  unit_concept_id				    INTEGER,
  provider_id					    BIGINT,
  visit_occurrence_id			    BIGINT,
  visit_detail_id               	BIGINT,
  observation_source_value		  	VARCHAR(50),
  observation_source_concept_id		INTEGER,
  unit_source_value				   	VARCHAR(50),
  qualifier_source_value			VARCHAR(50),
  observation_event_id				BIGINT, 
  obs_event_field_concept_id		INTEGER, 
  value_as_datetime					VARCHAR(19)
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/OBSERVATION/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.survey_conduct (
  survey_conduct_id					BIGINT,
  person_id 						BIGINT,
  survey_concept_id			  		INTEGER,
  survey_start_date				    DATE,
  survey_start_datetime				VARCHAR(19),
  survey_end_date					DATE,
  survey_end_datetime				VARCHAR(19),
  provider_id						BIGINT,
  assisted_concept_id	  			INTEGER,
  respondent_type_concept_id		INTEGER,
  timing_concept_id					INTEGER,
  collection_method_concept_id		INTEGER,
  assisted_source_value		  		VARCHAR(50),
  respondent_type_source_value		VARCHAR(100),
  timing_source_value				VARCHAR(100),
  collection_method_source_value	VARCHAR(100),
  survey_source_value				VARCHAR(100),
  survey_source_concept_id			INTEGER,
  survey_source_identifier			VARCHAR(100),
  validated_survey_concept_id		INTEGER,
  validated_survey_source_value		VARCHAR(100),
  survey_version_number				VARCHAR(20),
  visit_occurrence_id				BIGINT,
  visit_detail_id					BIGINT,
  response_visit_occurrence_id		BIGINT	
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/SURVEY_CONDUCT/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.fact_relationship  (
  domain_concept_id_1		INTEGER,
  fact_id_1					BIGINT,
  domain_concept_id_2		INTEGER,
  fact_id_2					BIGINT,
  relationship_concept_id	INTEGER	
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/FACT_RELATIONSHIP/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.location
 (location_id				BIGINT,
  address_1					VARCHAR(50),
  address_2					VARCHAR(50),
  city						VARCHAR(50),
  state						VARCHAR(2),
  zip						VARCHAR(9),
  county					VARCHAR(20),
  country					VARCHAR(100),
  location_source_value		VARCHAR(50),
  latitude					DECIMAL(38,2),
  longitude					DECIMAL(38,2)	
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/LOCATION/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.location_history  (
  location_history_id           BIGINT,
  location_id			        BIGINT,
  relationship_type_concept_id	INTEGER,  
  domain_id				        VARCHAR(50),
  entity_id				        BIGINT,
  start_date			        DATE,
  end_date				        DATE	
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/LOCATION_HISTORY/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.care_site  (
  care_site_id						BIGINT,
  care_site_name					VARCHAR(255),
  place_of_service_concept_id	  	INTEGER,
  location_id						BIGINT,
  care_site_source_value			VARCHAR(50),
  place_of_service_source_value		VARCHAR(50)
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/CARE_SITE/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.provider  (
  provider_id					BIGINT,
  provider_name					VARCHAR(255),
  NPI							VARCHAR(20),
  DEA							VARCHAR(20),
  specialty_concept_id			INTEGER,
  care_site_id					BIGINT,
  year_of_birth					INTEGER,
  gender_concept_id				INTEGER,
  provider_source_value			VARCHAR(50),
  specialty_source_value		VARCHAR(50),
  specialty_source_concept_id	INTEGER,
  gender_source_value			VARCHAR(50),
  gender_source_concept_id		INTEGER	
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/PROVIDER/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.payer_plan_period
 (payer_plan_period_id			BIGINT,
  person_id						BIGINT,
  contract_person_id            BIGINT,
  payer_plan_period_start_date  DATE,
  payer_plan_period_end_date	DATE,
  payer_concept_id              INTEGER,
  plan_concept_id               INTEGER,
  contract_concept_id           INTEGER,
  sponsor_concept_id            INTEGER,
  stop_reason_concept_id        INTEGER,
  payer_source_value			VARCHAR(50),
  payer_source_concept_id       INTEGER,
  plan_source_value				VARCHAR(50),
  plan_source_concept_id        INTEGER,
  contract_source_value         VARCHAR(50),
  contract_source_concept_id    INTEGER,
  sponsor_source_value          VARCHAR(50),
  sponsor_source_concept_id     INTEGER,
  family_source_value			VARCHAR(50),
  stop_reason_source_value      VARCHAR(50),
  stop_reason_source_concept_id INTEGER
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/PAYER_PLAN_PERIOD/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.cost  (
  cost_id						BIGINT,
  person_id 					BIGINT,
  cost_event_id					BIGINT,
  cost_event_field_concept_id	INTEGER, 
  cost_concept_id				INTEGER,
  cost_type_concept_id		  	INTEGER,
  currency_concept_id			INTEGER,
  cost							DECIMAL(38,2),
  incurred_date					DATE,
  billed_date					DATE,
  paid_date						DATE,
  revenue_code_concept_id		INTEGER,
  drg_concept_id			    INTEGER,
  cost_source_value				VARCHAR(50),
  cost_source_concept_id	  	INTEGER,
  revenue_code_source_value		VARCHAR(50),
  drg_source_value			    VARCHAR(3),
  payer_plan_period_id			BIGINT
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/COST/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.drug_era  (
  drug_era_id				BIGINT,
  person_id					BIGINT,
  drug_concept_id			INTEGER,
  drug_era_start_datetime	VARCHAR(19),
  drug_era_end_datetime		VARCHAR(19),
  drug_exposure_count		INTEGER,
  gap_days					INTEGER	
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/DRUG_ERA/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.dose_era  (
  dose_era_id				BIGINT,
  person_id					BIGINT,
  drug_concept_id			INTEGER,
  unit_concept_id			INTEGER,
  dose_value				DECIMAL(38,2),
  dose_era_start_datetime	VARCHAR(19),
  dose_era_end_datetime		VARCHAR(19)
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/DOSE_ERA/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.condition_era  (
  condition_era_id					BIGINT,
  person_id							BIGINT,
  condition_concept_id				INTEGER,
  condition_era_start_datetime		VARCHAR(19),
  condition_era_end_datetime		VARCHAR(19),
  condition_occurrence_count		INTEGER	
)
STORED AS PARQUET
LOCATION 's3://{bucket}/{folder}/CONDITION_ERA/'
TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}._VERSION 
( 
	VERSION_ID INTEGER,
	VERSION_DATE DATE 
)
STORED AS PARQUET LOCATION 's3://{bucket}/{folder}/VERSION/' TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.concept
(
	concept_id INTEGER,
	concept_name VARCHAR(255),
	domain_id VARCHAR(20),
	vocabulary_id VARCHAR(20),
	concept_class_id VARCHAR(20),
	standard_concept VARCHAR(1),
	concept_code VARCHAR(50),
	valid_start_date DATE,
	valid_end_date DATE,
	invalid_reason VARCHAR(1)
)
STORED AS PARQUET LOCATION 's3://{bucket}/{folder}/CONCEPT/' TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');


CREATE EXTERNAL TABLE {sc}.concept_ancestor
(
	ancestor_concept_id INTEGER,
	descendant_concept_id INTEGER,
	min_levels_of_separation INTEGER,
	max_levels_of_separation INTEGER
)
STORED AS PARQUET LOCATION 's3://{bucket}/{folder}/CONCEPT_ANCESTOR/' TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.concept_class
(
	concept_class_id VARCHAR(20),
	concept_class_name VARCHAR(255),
	concept_class_concept_id INTEGER
)
STORED AS PARQUET LOCATION 's3://{bucket}/{folder}/CONCEPT_CLASS/' TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.concept_relationship
(
	concept_id_1 INTEGER,
	concept_id_2 INTEGER,
	relationship_id VARCHAR(20),
	valid_start_date DATE,
	valid_end_date DATE,
	invalid_reason VARCHAR(1)
)
STORED AS PARQUET LOCATION 's3://{bucket}/{folder}/CONCEPT_RELATIONSHIP/' TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.concept_synonym
(
	concept_id INTEGER,
	concept_synonym_name VARCHAR(1000),
	language_concept_id INTEGER
)
STORED AS PARQUET LOCATION 's3://{bucket}/{folder}/CONCEPT_SYNONYM/' TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.domain
(
	domain_id VARCHAR(20),
	domain_name VARCHAR(255),
	domain_concept_id INTEGER
)
STORED AS PARQUET LOCATION 's3://{bucket}/{folder}/DOMAIN/' TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.drug_strength
(
	drug_concept_id INTEGER,
	ingredient_concept_id INTEGER,
	amount_value DOUBLE PRECISION,
	amount_unit_concept_id INTEGER,
	numerator_value DOUBLE PRECISION,
	numerator_unit_concept_id INTEGER,
	denominator_value DOUBLE PRECISION,
	denominator_unit_concept_id INTEGER,
	box_size  INTEGER,
	valid_start_date DATE,
	valid_end_date DATE,
	invalid_reason VARCHAR(1)
)
STORED AS PARQUET LOCATION 's3://{bucket}/{folder}/DRUG_STRENGTH/' TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.relationship
(
	relationship_id VARCHAR(20),
	relationship_name VARCHAR(255),
	is_hierarchical VARCHAR(1),
	defines_ancestry VARCHAR(1),
	reverse_relationship_id VARCHAR(20),
	relationship_concept_id INTEGER
)
STORED AS PARQUET LOCATION 's3://{bucket}/{folder}/RELATIONSHIP/' TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.source_to_concept_map
(
	source_code VARCHAR(255),
	source_concept_id INTEGER,
	source_vocabulary_id VARCHAR(20),
	source_code_description VARCHAR(255),
	target_concept_id INTEGER,
	target_vocabulary_id VARCHAR(20),
	valid_start_date DATE,
	valid_end_date DATE,
	invalid_reason VARCHAR(1)
)
STORED AS PARQUET LOCATION 's3://{bucket}/{folder}/SOURCE_TO_CONCEPT_MAP/' TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');

CREATE EXTERNAL TABLE {sc}.vocabulary
(
	vocabulary_id VARCHAR(20),
	vocabulary_name VARCHAR(255),
	vocabulary_reference VARCHAR(255),
	vocabulary_version VARCHAR(255),
	vocabulary_concept_id INTEGER
)
STORED AS PARQUET LOCATION 's3://{bucket}/{folder}/VOCABULARY/' TABLE PROPERTIES ('COMPRESSION_TYPE'='GZIP');