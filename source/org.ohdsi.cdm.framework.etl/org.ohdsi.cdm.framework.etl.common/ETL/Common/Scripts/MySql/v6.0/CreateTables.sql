CREATE TABLE {sc}.person
(
  person_id						bigint(20)	  	NOT NULL , 
  gender_concept_id				INTEGER	  	NOT NULL ,
  year_of_birth					INTEGER	  	NOT NULL ,
  month_of_birth				INTEGER	  	NULL,
  day_of_birth					INTEGER	  	NULL,
  birth_datetime				datetime	NULL,
  death_datetime				datetime	NULL,
  race_concept_id				INTEGER		NOT NULL,
  ethnicity_concept_id			INTEGER	  	NOT NULL,
  location_id					bigint(20) UNSIGNED		NULL,
  provider_id					bigint(20) UNSIGNED		NULL,
  care_site_id					bigint(20) UNSIGNED		NULL,
  person_source_value			VARCHAR(50)	NULL,
  gender_source_value			VARCHAR(50) NULL,
  gender_source_concept_id	  	INTEGER		NOT NULL,
  race_source_value				VARCHAR(50) NULL,
  race_source_concept_id		INTEGER		NOT NULL,
  ethnicity_source_value		VARCHAR(50) NULL,
  ethnicity_source_concept_id	INTEGER		NOT NULL
)
;

CREATE TABLE {sc}.observation_period
(
  observation_period_id				bigint(20) UNSIGNED		NOT NULL ,
  person_id							bigint(20)		NOT NULL ,
  observation_period_start_date		DATE		NOT NULL ,
  observation_period_end_date		DATE		NOT NULL ,
  period_type_concept_id			INTEGER		NOT NULL
)
;

CREATE TABLE {sc}.specimen
(
  specimen_id					bigint(20) UNSIGNED			NOT NULL ,
  person_id						bigint(20)			NOT NULL ,
  specimen_concept_id			INTEGER			NOT NULL ,
  specimen_type_concept_id		INTEGER			NOT NULL ,
  specimen_date					DATE			NULL ,
  specimen_datetime				datetime		NOT NULL ,
  quantity						NUMERIC			NULL ,
  unit_concept_id				INTEGER			NULL ,
  anatomic_site_concept_id		INTEGER			NOT NULL ,
  disease_status_concept_id		INTEGER			NOT NULL ,
  specimen_source_id			VARCHAR(50)		NULL ,
  specimen_source_value			VARCHAR(50)		NULL ,
  unit_source_value				VARCHAR(50)		NULL ,
  anatomic_site_source_value	VARCHAR(50)		NULL ,
  disease_status_source_value	VARCHAR(50)		NULL
)
;

CREATE TABLE {sc}.visit_occurrence
(
  visit_occurrence_id			bigint(20)	UNSIGNED		NOT NULL ,
  person_id						bigint(20)			NOT NULL ,
  visit_concept_id				INTEGER			NOT NULL ,
  visit_start_date				DATE			NULL ,
  visit_start_datetime			datetime		NOT NULL ,
  visit_end_date				DATE			NULL ,
  visit_end_datetime			datetime		NOT NULL ,
  visit_type_concept_id			INTEGER			NOT NULL ,
  provider_id					bigint(20) UNSIGNED		NULL,
  care_site_id					bigint(20) UNSIGNED			NULL,
  visit_source_value			VARCHAR(50)		NULL,
  visit_source_concept_id		INTEGER			NOT NULL ,
  admitted_from_concept_id      INTEGER     	NOT NULL ,   
  admitted_from_source_value    VARCHAR(50) 	NULL ,
  discharge_to_source_value		VARCHAR(50)		NULL ,
  discharge_to_concept_id		INTEGER   		NOT NULL ,
  preceding_visit_occurrence_id	bigint(20) UNSIGNED			NULL
)
;

CREATE TABLE {sc}.visit_detail
(
  visit_detail_id                    bigint(20) UNSIGNED     NOT NULL ,
  person_id                          bigint(20) UNSIGNED     NOT NULL ,
  visit_detail_concept_id            INTEGER     NOT NULL ,
  visit_detail_start_date            DATE        NULL ,
  visit_detail_start_datetime        datetime   NOT NULL ,
  visit_detail_end_date              DATE        NULL ,
  visit_detail_end_datetime          datetime   NOT NULL ,
  visit_detail_type_concept_id       INTEGER     NOT NULL ,
  provider_id                        bigint(20) UNSIGNED      NULL ,
  care_site_id                       bigint(20) UNSIGNED     NULL ,
  discharge_to_concept_id            INTEGER     NOT NULL ,
  admitted_from_concept_id           INTEGER     NOT NULL , 
  admitted_from_source_value         VARCHAR(50) NULL ,
  visit_detail_source_value          VARCHAR(50) NULL ,
  visit_detail_source_concept_id     INTEGER     NOT NULL ,
  discharge_to_source_value          VARCHAR(50) NULL ,
  preceding_visit_detail_id          bigint(20)      NULL ,
  visit_detail_parent_id             bigint(20) UNSIGNED      NULL ,
  visit_occurrence_id                bigint(20) UNSIGNED      NOT NULL
)
;

CREATE TABLE {sc}.procedure_occurrence
(
  procedure_occurrence_id		bigint(20)	UNSIGNED		NOT NULL ,
  person_id						bigint(20)			NOT NULL ,
  procedure_concept_id			INTEGER			NOT NULL ,
  procedure_date				DATE			NULL ,
  procedure_datetime			datetime		NOT NULL ,
  procedure_type_concept_id		INTEGER			NOT NULL ,
  modifier_concept_id			INTEGER			NOT NULL ,
  quantity						INTEGER			NULL ,
  provider_id					bigint(20)	UNSIGNED		NULL ,
  visit_occurrence_id			bigint(20)	UNSIGNED		NULL ,
  visit_detail_id             	bigint(20)  UNSIGNED    	NULL ,
  procedure_source_value		VARCHAR(50)		NULL ,
  procedure_source_concept_id	INTEGER			NOT NULL ,
  modifier_source_value		    VARCHAR(50)		NULL 
)
;

CREATE TABLE {sc}.drug_exposure
(
  drug_exposure_id				bigint(20)	UNSIGNED		 	NOT NULL ,
  person_id						bigint(20)			 	NOT NULL ,
  drug_concept_id				INTEGER			  	NOT NULL ,
  drug_exposure_start_date		DATE			    NULL ,
  drug_exposure_start_datetime	datetime		 	NOT NULL ,
  drug_exposure_end_date		DATE			    NULL ,
  drug_exposure_end_datetime	datetime		  	NOT NULL ,
  verbatim_end_date				DATE			    NULL ,
  drug_type_concept_id			INTEGER			  	NOT NULL ,
  stop_reason					VARCHAR(20)			NULL ,
  refills						INTEGER		  		NULL ,
  quantity						NUMERIC			    NULL ,
  days_supply					INTEGER		  		NULL ,
  sig							TEXT				NULL ,
  route_concept_id				INTEGER				NOT NULL ,
  lot_number					VARCHAR(50)	 		NULL ,
  provider_id					bigint(20)	UNSIGNED		  	NULL ,
  visit_occurrence_id			bigint(20)	UNSIGNED		  	NULL ,
  visit_detail_id               bigint(20)  UNSIGNED     		NULL ,
  drug_source_value				VARCHAR(50)	  		NULL ,
  drug_source_concept_id		INTEGER			  	NOT NULL ,
  route_source_value			VARCHAR(50)	  		NULL ,
  dose_unit_source_value		VARCHAR(50)	  		NULL
)
;

CREATE TABLE {sc}.device_exposure
(
  device_exposure_id			    bigint(20)	UNSIGNED	  	NOT NULL ,
  person_id						    bigint(20)			NOT NULL ,
  device_concept_id			        INTEGER			NOT NULL ,
  device_exposure_start_date	    DATE			NULL ,
  device_exposure_start_datetime	datetime		NOT NULL ,
  device_exposure_end_date		    DATE			NULL ,
  device_exposure_end_datetime    	datetime		NULL ,
  device_type_concept_id		    INTEGER			NOT NULL ,
  unique_device_id			        VARCHAR(50)		NULL ,
  quantity						    INTEGER			NULL ,
  provider_id					    bigint(20)	UNSIGNED		NULL ,
  visit_occurrence_id			    bigint(20)	UNSIGNED		NULL ,
  visit_detail_id                 	bigint(20)  UNSIGNED     	NULL ,
  device_source_value			    VARCHAR(100)	NULL ,
  device_source_concept_id		    INTEGER			NOT NULL
)
;


CREATE TABLE {sc}.condition_occurrence
(
  condition_occurrence_id		bigint(20)	UNSIGNED		NOT NULL ,
  person_id						bigint(20)			NOT NULL ,
  condition_concept_id			INTEGER			NOT NULL ,
  condition_start_date			DATE			NULL ,
  condition_start_datetime		datetime		NOT NULL ,
  condition_end_date			DATE			NULL ,
  condition_end_datetime		datetime		NULL ,
  condition_type_concept_id		INTEGER			NOT NULL ,
  condition_status_concept_id	INTEGER			NOT NULL ,
  stop_reason					VARCHAR(20)		NULL ,
  provider_id					bigint(20)	UNSIGNED		NULL ,
  visit_occurrence_id			bigint(20)	UNSIGNED		NULL ,
  visit_detail_id               bigint(20)	UNSIGNED     	NULL ,
  condition_source_value		VARCHAR(50)		NULL ,
  condition_source_concept_id	INTEGER			NOT NULL ,
  condition_status_source_value	VARCHAR(50)		NULL
)
;


CREATE TABLE {sc}.measurement
(
  measurement_id				bigint(20)	UNSIGNED		NOT NULL ,
  person_id						bigint(20)			NOT NULL ,
  measurement_concept_id		INTEGER			NOT NULL ,
  measurement_date				DATE			NULL ,
  measurement_datetime			datetime		NOT NULL ,
  measurement_time              varchar(10)	 	NULL,
  measurement_type_concept_id	INTEGER			NOT NULL ,
  operator_concept_id			INTEGER			NULL ,
  value_as_number				NUMERIC			NULL ,
  value_as_concept_id			INTEGER			NULL ,
  unit_concept_id				INTEGER			NULL ,
  range_low					    NUMERIC			NULL ,
  range_high					NUMERIC			NULL ,
  provider_id					bigint(20) UNSIGNED			NULL ,
  visit_occurrence_id			bigint(20) UNSIGNED			NULL ,
  visit_detail_id               bigint(20) UNSIGNED	     	NULL ,
  measurement_source_value		VARCHAR(50)		NULL ,
  measurement_source_concept_id	INTEGER			NOT NULL ,
  unit_source_value				VARCHAR(50)		NULL ,
  value_source_value			VARCHAR(5000)		NULL
)
;


CREATE TABLE {sc}.note
(
  note_id						bigint(20) UNSIGNED			NOT NULL ,
  person_id						bigint(20)			NOT NULL ,
  note_event_id         		bigint(20) UNSIGNED     	NULL , 
  note_event_field_concept_id	INTEGER 		NOT NULL , 
  note_date						DATE			NULL ,
  note_datetime					datetime		NOT NULL ,
  note_type_concept_id			INTEGER			NOT NULL ,
  note_class_concept_id 		INTEGER			NOT NULL ,
  note_title					VARCHAR(250)	NULL ,
  note_text						TEXT  			NULL ,
  encoding_concept_id			INTEGER			NOT NULL ,
  language_concept_id			INTEGER			NOT NULL ,
  provider_id					bigint(20) UNSIGNED			NULL ,
  visit_occurrence_id			bigint(20) UNSIGNED			NULL ,
  visit_detail_id       		bigint(20) UNSIGNED      	NULL ,
  note_source_value				VARCHAR(50)		NULL
)
;


CREATE TABLE {sc}.note_nlp
(
  note_nlp_id					bigint(20)	UNSIGNED		NOT NULL ,
  note_id						bigint(20)	UNSIGNED		NOT NULL ,
  section_concept_id			INTEGER			NOT NULL ,
  snippet						VARCHAR(250)	NULL ,
  offset					    VARCHAR(250)	NULL ,
  lexical_variant				VARCHAR(250)	NOT NULL ,
  note_nlp_concept_id			INTEGER			NOT NULL ,
  nlp_system					VARCHAR(250)	NULL ,
  nlp_date						DATE			NOT NULL ,
  nlp_datetime					datetime		NULL ,
  term_exists					VARCHAR(1)		NULL ,
  term_temporal					VARCHAR(50)		NULL ,
  term_modifiers				VARCHAR(2000)	NULL ,
  note_nlp_source_concept_id  	INTEGER			NOT NULL
)
;


CREATE TABLE {sc}.observation
(
  observation_id					bigint(20) UNSIGNED			NOT NULL ,
  person_id						    bigint(20)			NOT NULL ,
  observation_concept_id			INTEGER			NOT NULL ,
  observation_date				    DATE			NULL ,
  observation_datetime				datetime		NOT NULL ,
  observation_type_concept_id	    INTEGER			NOT NULL ,
  value_as_number				    NUMERIC			NULL ,
  value_as_string				    VARCHAR(3000)		NULL ,
  value_as_concept_id			    INTEGER			NULL ,
  qualifier_concept_id			    INTEGER			NULL ,
  unit_concept_id				    INTEGER			NULL ,
  provider_id					    bigint(20) UNSIGNED			NULL ,
  visit_occurrence_id			    bigint(20) UNSIGNED			NULL ,
  visit_detail_id               	bigint(20) UNSIGNED      	NULL ,
  observation_source_value		  	VARCHAR(50)		NULL ,
  observation_source_concept_id		INTEGER			NOT NULL ,
  unit_source_value				    VARCHAR(50)		NULL ,
  qualifier_source_value			VARCHAR(50)		NULL ,
  observation_event_id				bigint(20)			NULL , 
  obs_event_field_concept_id		INTEGER			NOT NULL , 
  value_as_datetime					datetime		NULL
)
;


CREATE TABLE {sc}.survey_conduct 
(
  survey_conduct_id					bigint(20) UNSIGNED			NOT NULL ,
  person_id						    bigint(20)			NOT NULL ,
  survey_concept_id			  		INTEGER			NOT NULL ,
  survey_start_date				    DATE			NULL ,
  survey_start_datetime				datetime		NULL ,
  survey_end_date					DATE			NULL ,
  survey_end_datetime				datetime		NOT NULL ,
  provider_id						bigint(20) UNSIGNED			NULL ,
  assisted_concept_id	  			INTEGER			NOT NULL ,
  respondent_type_concept_id		INTEGER			NOT NULL ,
  timing_concept_id					INTEGER			NOT NULL ,
  collection_method_concept_id		INTEGER			NOT NULL ,
  assisted_source_value		  		VARCHAR(50)		NULL ,
  respondent_type_source_value		VARCHAR(100)  	NULL ,
  timing_source_value				VARCHAR(100)	NULL ,
  collection_method_source_value	VARCHAR(100)	NULL ,
  survey_source_value				VARCHAR(100)	NULL ,
  survey_source_concept_id			INTEGER			NOT NULL ,
  survey_source_identifier			VARCHAR(100)	NULL ,
  validated_survey_concept_id		INTEGER			NOT NULL ,
  validated_survey_source_value		VARCHAR(100)	NULL ,
  survey_version_number				VARCHAR(20)		NULL ,
  visit_occurrence_id				bigint(20) UNSIGNED			NULL ,
  visit_detail_id					bigint(20) UNSIGNED			NULL ,
  response_visit_occurrence_id	bigint(20)			NULL
)
;



CREATE TABLE {sc}.fact_relationship
(
  domain_concept_id_1		INTEGER			NOT NULL ,
  fact_id_1					bigint(20) UNSIGNED			NOT NULL ,
  domain_concept_id_2		INTEGER			NOT NULL ,
  fact_id_2					bigint(20) UNSIGNED			NOT NULL ,
  relationship_concept_id	INTEGER			NOT NULL
)
;

CREATE TABLE {sc}.location
(
  location_id			bigint(20) UNSIGNED			NOT NULL ,
  address_1				VARCHAR(50)		NULL ,
  address_2				VARCHAR(50)		NULL ,
  city					VARCHAR(50)		NULL ,
  state					VARCHAR(2)		NULL ,
  zip					VARCHAR(9)		NULL ,
  county				VARCHAR(20)		NULL ,
  country				VARCHAR(100)	NULL ,
  location_source_value VARCHAR(50)		NULL ,
  latitude				NUMERIC			NULL ,
  longitude				NUMERIC			NULL
)
;

CREATE TABLE {sc}.location_history 
( 
  location_history_id           bigint(20) UNSIGNED      NOT NULL,
  location_id			        bigint(20) UNSIGNED		NOT NULL,
  relationship_type_concept_id	INTEGER		NOT NULL, 
  domain_id				        VARCHAR(50)	NOT NULL,
  entity_id				        bigint(20) UNSIGNED		NOT NULL,
  start_date			        DATE		NOT NULL,
  end_date				        DATE		NULL
)
;

CREATE TABLE {sc}.care_site
(
  care_site_id					bigint(20) UNSIGNED			NOT NULL ,
  care_site_name				VARCHAR(255)	NULL ,
  place_of_service_concept_id	INTEGER			NOT NULL ,
  location_id					bigint(20) UNSIGNED			NULL ,
  care_site_source_value		VARCHAR(50)		NULL ,
  place_of_service_source_value	VARCHAR(50)		NULL
)
;

CREATE TABLE {sc}.provider
(
  provider_id					bigint(20) UNSIGNED			NOT NULL ,
  provider_name					VARCHAR(255)	NULL ,
  NPI							VARCHAR(20)		NULL ,
  DEA							VARCHAR(20)		NULL ,
  specialty_concept_id			INTEGER			NOT NULL ,
  care_site_id					bigint(20) UNSIGNED			NULL ,
  year_of_birth					INTEGER			NULL ,
  gender_concept_id				INTEGER			NOT NULL ,
  provider_source_value			VARCHAR(50)		NULL ,
  specialty_source_value		VARCHAR(50)		NULL ,
  specialty_source_concept_id	INTEGER			NULL ,
  gender_source_value			VARCHAR(50)		NULL ,
  gender_source_concept_id		INTEGER			NOT NULL
)
;


CREATE TABLE {sc}.payer_plan_period
(
  payer_plan_period_id			bigint(20) UNSIGNED			NOT NULL ,
  person_id						bigint(20)			NOT NULL ,
  contract_person_id            bigint(20)        	NULL ,
  payer_plan_period_start_date  DATE			NOT NULL ,
  payer_plan_period_end_date	DATE			NOT NULL ,
  payer_concept_id              INTEGER       	NOT NULL ,
  plan_concept_id               INTEGER       	NOT NULL ,
  contract_concept_id           INTEGER       	NOT NULL ,
  sponsor_concept_id            INTEGER       	NOT NULL ,
  stop_reason_concept_id        INTEGER       	NOT NULL ,
  payer_source_value			VARCHAR(50)	  	NULL ,
  payer_source_concept_id       INTEGER       	NOT NULL ,
  plan_source_value				VARCHAR(50)	  	NULL ,
  plan_source_concept_id        INTEGER       	NOT NULL ,
  contract_source_value         VARCHAR(50)   	NULL ,
  contract_source_concept_id    INTEGER       	NOT NULL ,
  sponsor_source_value          VARCHAR(50)   	NULL ,
  sponsor_source_concept_id     INTEGER       	NOT NULL ,
  family_source_value			VARCHAR(50)	  	NULL ,
  stop_reason_source_value      VARCHAR(50)   	NULL ,
  stop_reason_source_concept_id INTEGER       	NOT NULL
)
;

CREATE TABLE {sc}.cost
(
  cost_id						bigint(20) UNSIGNED		NOT NULL ,
  person_id						bigint(20)		NOT NULL,
  cost_event_id					bigint(20) UNSIGNED      NOT NULL ,
  cost_event_field_concept_id	INTEGER		NOT NULL , 
  cost_concept_id				INTEGER		NOT NULL ,
  cost_type_concept_id		  	INTEGER     NOT NULL ,
  currency_concept_id			INTEGER		NOT NULL ,
  cost							NUMERIC		NULL ,
  incurred_date					DATE		NOT NULL ,
  billed_date					DATE		NULL ,
  paid_date						DATE		NULL ,
  revenue_code_concept_id		INTEGER		NOT NULL ,
  drg_concept_id			    INTEGER		NOT NULL ,
  cost_source_value				VARCHAR(50)	NULL ,
  cost_source_concept_id	  	INTEGER		NOT NULL ,
  revenue_code_source_value 	VARCHAR(50) NULL ,
  drg_source_value			    VARCHAR(3)	NULL ,
  payer_plan_period_id			bigint(20) UNSIGNED		NULL
)
;


CREATE TABLE {sc}.drug_era
(
  drug_era_id				bigint(20) UNSIGNED		NOT NULL ,
  person_id					bigint(20)		NOT NULL ,
  drug_concept_id			INTEGER		NOT NULL ,
  drug_era_start_datetime	datetime		NOT NULL ,
  drug_era_end_datetime		datetime		NOT NULL ,
  drug_exposure_count		INTEGER		NULL ,
  gap_days					INTEGER		NULL
)
;



CREATE TABLE {sc}.dose_era
(
  dose_era_id				bigint(20) UNSIGNED			NOT NULL ,
  person_id					bigint(20)			NOT NULL ,
  drug_concept_id			INTEGER			NOT NULL ,
  unit_concept_id			INTEGER			NOT NULL ,
  dose_value				NUMERIC			NOT NULL ,
  dose_era_start_datetime	datetime		NOT NULL ,
  dose_era_end_datetime		datetime		NOT NULL
)
;



CREATE TABLE {sc}.condition_era
(
  condition_era_id					bigint(20) UNSIGNED			NOT NULL ,
  person_id							bigint(20)			NOT NULL ,
  condition_concept_id				INTEGER			NOT NULL ,
  condition_era_start_datetime		datetime		NOT NULL ,
  condition_era_end_datetime		datetime		NOT NULL ,
  condition_occurrence_count		INTEGER			NULL
)
;

CREATE TABLE {sc}.cdm_source
(
	cdm_source_name varchar(250) not null,
	cdm_source_abbreviation varchar(250) not null,
	cdm_holder varchar(250) not null,
	source_description varchar(250) not null,
	source_documentation_reference varchar(250) not null,
	cdm_etl_reference varchar(250) not null,
	source_release_date varchar(10) not null,
	cdm_release_date varchar(10) not null,
	cdm_version varchar(250) not null,
	vocabulary_version varchar(250) not null
);

CREATE TABLE {sc}.cohort_definition
(
	cohort_definition_id bigint(20) UNSIGNED not null,
	cohort_definition_name varchar(250) not null,
	cohort_definition_description varchar(250) not null,
	definition_type_concept_id bigint(20) null,
	cohort_definition_syntax varchar(250) null,
	subject_concept_id bigint(20) null,
	cohort_initiation_date date not null
);


CREATE TABLE {sc}.cdm_domain_meta 
(
	domain_id varchar(20),
	description varchar(4000)
);

CREATE TABLE {sc}.metadata 
(
	metadata_concept_id integer not null,
	name varchar(250) not null,
	value_as_string varchar(500) null,
	value_as_concept_id integer null,
	metadata_date date null,
	metadata_datetime varchar(10) null
);

CREATE TABLE {sc}.metadata_tmp 
(
	person_id bigint(20) not null,
	name varchar(250) not null
);