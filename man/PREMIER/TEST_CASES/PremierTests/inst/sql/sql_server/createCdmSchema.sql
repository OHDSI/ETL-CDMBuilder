/*********************************************************************************
# Copyright 2014 Observational Health Data Sciences and Informatics
#
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
********************************************************************************/

/************************
 ####### #     # ####### ######      #####  ######  #     #           #######
 #     # ##   ## #     # #     #    #     # #     # ##   ##    #    # #
 #     # # # # # #     # #     #    #       #     # # # # #    #    # #
 #     # #  #  # #     # ######     #       #     # #  #  #    #    # ######
 #     # #     # #     # #          #       #     # #     #    #    #       #
 #     # #     # #     # #          #     # #     # #     #     #  #  #     #
 ####### #     # ####### #           #####  ######  #     #      ##    #####

script to create OMOP common data model, version 5.0 for Amazon Redshift database
last revised: 7 September 2016
author:  Patrick Ryan, Ajit Londhe
*************************/

drop table if exists scratch_jweave17_273.care_site;
create table scratch_jweave17_273.care_site
(
	care_site_id bigint not null,
	care_site_name varchar(255),
	place_of_service_concept_id bigint,
	location_id bigint,
	care_site_source_value varchar(50),
	place_of_service_source_value varchar(50)
)
diststyle all;

drop table if exists scratch_jweave17_273.cdm_domain_meta;
create table scratch_jweave17_273.cdm_domain_meta
(
   domain_id    varchar(20),
   description  varchar(4000)
)
diststyle all;

drop table if exists scratch_jweave17_273.cdm_source;
create table scratch_jweave17_273.cdm_source
(
    cdm_source_name varchar(255) not null,
    cdm_source_abbreviation varchar(25),
    cdm_holder varchar(255),
    source_description varchar(4000),
    source_documentation_reference varchar(255),
    cdm_etl_reference varchar(255),
    source_release_date date null,
    cdm_release_date date null,
    cdm_version varchar(10),
    vocabulary_version varchar(20) null
)
diststyle all;

drop table if exists scratch_jweave17_273.cohort;
create table scratch_jweave17_273.cohort
(
    cohort_definition_id int not null,
    subject_id bigint not null,
    cohort_start_date date not null,
    cohort_end_date date not null
)
distkey(subject_id);

drop table if exists scratch_jweave17_273.cohort_definition;
create table scratch_jweave17_273.cohort_definition
(
    cohort_definition_id int not null,
    cohort_definition_name varchar(255) not null,
    cohort_definition_description varchar(8000) null,
    definition_type_concept_id int null,
    cohort_definition_syntax varchar(8000) null,
    subject_concept_id int null,
    cohort_initiation_date date null
)
diststyle all;

drop table if exists scratch_jweave17_273.concept;
create table scratch_jweave17_273.concept
(
    concept_id int not null,
    concept_name varchar(255) null,
    domain_id varchar(20) not null,
    vocabulary_id varchar(20) not null,
    concept_class_id varchar(20) not null,
    standard_concept char(1) null,
    concept_code varchar(50) null,
    valid_start_date date not null,
    valid_end_date date not null,
    invalid_reason char(1) null
)
diststyle all;

drop table if exists scratch_jweave17_273.concept_ancestor;
create table scratch_jweave17_273.concept_ancestor
(
	ancestor_concept_id integer not null,
	descendant_concept_id integer not null,
	min_levels_of_separation integer not null,
	max_levels_of_separation integer not null
)
diststyle all;

drop table if exists scratch_jweave17_273.concept_class;
create table scratch_jweave17_273.concept_class
(
    concept_class_id varchar(20) not null,
    concept_class_name varchar(255) not null,
    concept_class_concept_id int not null
)
diststyle all;

drop table if exists scratch_jweave17_273.concept_relationship;
create table scratch_jweave17_273.concept_relationship
(
    concept_id_1 int not null,
    concept_id_2 int not null,
    relationship_id varchar(20) not null,
    valid_start_date date not null,
    valid_end_date date not null,
    invalid_reason char(1) null
)
diststyle all;

drop table if exists scratch_jweave17_273.concept_synonym;
create table scratch_jweave17_273.concept_synonym
(
    concept_id int not null,
    concept_synonym_name varchar(1000) not null,
    language_concept_id int not null
)
diststyle all;

drop table if exists scratch_jweave17_273.condition_era;
create table scratch_jweave17_273.condition_era
    (
     condition_era_id				bigint			not null ,
     person_id						bigint			not null ,
     condition_concept_id			bigint			not null ,
     condition_era_start_date		date			not null ,
     condition_era_end_date			date			not null ,
     condition_occurrence_count		integer			null
    )
distkey(person_id);

drop table if exists scratch_jweave17_273.condition_occurrence;
create table scratch_jweave17_273.condition_occurrence
    (
     condition_occurrence_id		bigint			not null ,
     person_id						bigint			not null ,
     condition_concept_id			bigint			not null ,
     condition_start_date			date			not null ,
     condition_end_date				date			null ,
     condition_type_concept_id		bigint			not null ,
     stop_reason					varchar(20)		null ,
     provider_id					bigint			null ,
     visit_occurrence_id			bigint			null ,
     condition_status_concept_id bigint null , --JW addition
     condition_source_value			varchar(50)		null ,
	 condition_source_concept_id	integer			null ,
	 condition_status_source_value varchar(50) null --JW addition
    )
distkey(person_id);

--added cost table
drop table if exists scratch_jweave17_273.cost;
create table scratch_jweave17_273.cost
   (
    cost_id	bigint not null,
    cost_event_id bigint not null,
    cost_domain_id varchar(20) not null,
    cost_type_concept_id bigint not null,
    currency_concept_id bigint null,
    total_charge float null,
    total_cost float null,
    total_paid float null,
    paid_by_payer float null,
    paid_by_patient float null,
    paid_patient_copay float null,
    paid_patient_coinsurance float null,
    paid_patient_deductible float null,
    paid_by_primary float null,
    paid_ingredient_cost float null,
    paid_dispensing_fee float null,
    payer_plan_period_id bigint,
    amount_allowed float null,
    revenue_code_concept_id bigint null,
    revenue_code_source_value varchar(50) null
   )
diststyle all;

drop table if exists scratch_jweave17_273.death;
create table scratch_jweave17_273.death
(
    person_id bigint not null,
    death_date date not null,
    death_type_concept_id bigint not null,
    cause_concept_id bigint null,
    cause_source_value varchar(50) null,
    cause_source_concept_id int null
)
distkey(person_id);

drop table if exists scratch_jweave17_273.device_cost;
create table scratch_jweave17_273.device_cost
(
    device_cost_id int not null,
    device_exposure_id int not null,
    currency_concept_id int null,
    paid_copay float null,
    paid_coinsurance float null,
    paid_toward_deductible float null,
    paid_by_payer float null,
    paid_by_coordination_benefits float null,
    total_out_of_pocket float null,
    total_paid float null,
    payer_plan_period_id int null
)
distkey(device_cost_id);

drop table if exists scratch_jweave17_273.device_exposure;
create table scratch_jweave17_273.device_exposure
    (
     device_exposure_id				bigint			not null ,
     person_id						bigint			not null ,
     device_concept_id				integer			not null ,
     device_exposure_start_date		date			not null ,
     device_exposure_end_date		date			null ,
     device_type_concept_id			integer			not null ,
	 unique_device_id				varchar(50)		null ,
	 quantity						integer			null ,
     provider_id					bigint			null ,
     visit_occurrence_id			bigint			null ,
     device_source_value			varchar(100)	null ,
	 device_source_concept_id		integer			null
    )
distkey(person_id);

drop table if exists scratch_jweave17_273.domain;
create table scratch_jweave17_273.domain (
    domain_id varchar(20) not null,
    domain_name varchar(255) not null,
    domain_concept_id int not null
)
diststyle all;

drop table if exists scratch_jweave17_273.dose_era;
create table scratch_jweave17_273.dose_era (
    dose_era_id int not null,
    person_id bigint not null,
    drug_concept_id int not null,
    unit_concept_id int not null,
    dose_value float not null,
    dose_era_start_date date not null,
    dose_era_end_date date not null
)
distkey(person_id);

drop table if exists scratch_jweave17_273.drug_cost;
create table scratch_jweave17_273.drug_cost (
    drug_cost_id bigint not null,
    drug_exposure_id bigint not null,
    currency_concept_id int null,
    paid_copay numeric null,
    paid_coinsurance numeric null,
    paid_toward_deductible numeric null,
    paid_by_payer numeric null,
    paid_by_coordination_benefits numeric null,
    total_out_of_pocket numeric null,
    total_paid numeric null,
    ingredient_cost numeric null,
    dispensing_fee numeric null,
    average_wholesale_price numeric null,
    payer_plan_period_id bigint null
)
distkey(drug_exposure_id);


drop table if exists scratch_jweave17_273.drug_era;
create table scratch_jweave17_273.drug_era
(
 drug_era_id					bigint			not null ,
 person_id						bigint			not null ,
 drug_concept_id				integer			not null ,
 drug_era_start_date			date			not null ,
 drug_era_end_date				date			not null ,
 drug_exposure_count			integer			null ,
 gap_days						integer			null
)
distkey(person_id);


drop table if exists scratch_jweave17_273.drug_exposure;
create table scratch_jweave17_273.drug_exposure
    (
     drug_exposure_id				bigint			not null ,
     person_id						bigint			not null ,
     drug_concept_id				integer			not null ,
     drug_exposure_start_date		date			not null ,
     drug_exposure_end_date			date			null ,
     drug_type_concept_id			integer			not null ,
     stop_reason					varchar(20)		null ,
     refills						integer			null ,
     quantity						numeric			null ,
     days_supply					integer			null ,
     sig							text	null ,
	 route_concept_id				integer			null ,
	 effective_drug_dose			numeric			null ,
	 dose_unit_concept_id			integer			null ,
	 lot_number						varchar(50)		null ,
     provider_id					bigint			null ,
     visit_occurrence_id			bigint			null ,
     drug_source_value				varchar(50)		null ,
	 drug_source_concept_id			integer			null ,
	 route_source_value				varchar(50)		null ,
	 dose_unit_source_value			varchar(50)		null
    )
distkey(person_id);

drop table if exists scratch_jweave17_273.drug_strength;
create table scratch_jweave17_273.drug_strength (
  drug_concept_id				integer		not null,
  ingredient_concept_id			integer		not null,
  amount_value					numeric		null,
  amount_unit_concept_id		integer		null,
  numerator_value				numeric		null,
  numerator_unit_concept_id		integer		null,
  denominator_unit_concept_id	integer		null,
  valid_start_date				date		not null,
  valid_end_date				date		not null,
  invalid_reason				varchar(1)	null
)
diststyle all;



drop table if exists scratch_jweave17_273.location;
create table scratch_jweave17_273.location
    (
     location_id					integer			not null ,
     address_1						varchar(50)		null ,
     address_2						varchar(50)		null ,
     city							varchar(50)		null ,
     state							varchar(2)		null ,
     zip							varchar(9)		null ,
     county							varchar(20)		null ,
     location_source_value			varchar(50)		null
    )
diststyle all;

drop table if exists scratch_jweave17_273.measurement;
create table scratch_jweave17_273.measurement
    (
     measurement_id					bigint			not null ,
     person_id						bigint			not null ,
     measurement_concept_id			integer			not null ,
     measurement_date				date			not null ,
     measurement_time				varchar(10)		null ,
	 measurement_type_concept_id	integer			not null ,
	 operator_concept_id			integer			null ,
     value_as_number				numeric			null ,
     value_as_concept_id			bigint			null ,
     unit_concept_id				integer			null ,
     range_low						numeric			null ,
     range_high						numeric			null ,
     provider_id					bigint			null ,
     visit_occurrence_id			bigint			null ,
     measurement_source_value		varchar(50)		null ,
	 measurement_source_concept_id	integer			null ,
     unit_source_value				varchar(50)		null ,
	 value_source_value				varchar(260)		null
    )
distkey(person_id);

drop table if exists scratch_jweave17_273.note;
create table scratch_jweave17_273.note
    (
     note_id						integer			not null ,
     person_id						integer			not null ,
     note_date						date			not null ,
	 note_time						varchar(10)		null ,
	 note_type_concept_id			integer			not null ,
	 note_text						text	not null ,
     provider_id					integer			null ,
	 visit_occurrence_id			integer			null ,
	 note_source_value				varchar(50)		null
    )
distkey(person_id);

drop table if exists scratch_jweave17_273.observation;
create table scratch_jweave17_273.observation
    (
     observation_id					bigint			not null ,
     person_id						bigint			not null ,
     observation_concept_id			bigint			not null ,
     observation_date				date			not null ,
     observation_time				varchar(10)		null ,
     observation_type_concept_id	bigint			not null ,
	 value_as_number				numeric			null ,
     value_as_string				varchar(500)		null ,
     value_as_concept_id			bigint			null ,
	 qualifier_concept_id			integer			null ,
     unit_concept_id				bigint			null ,
     provider_id					bigint			null ,
     visit_occurrence_id			bigint			null ,
     observation_source_value		varchar(50)		null ,
	 observation_source_concept_id	integer			null ,
     unit_source_value				varchar(50)		null ,
	 qualifier_source_value			varchar(50)		null
    )
distkey(person_id);

drop table if exists scratch_jweave17_273.observation_period;
create table scratch_jweave17_273.observation_period
    (
     observation_period_id				bigint		not null ,
     person_id							bigint		not null ,
     observation_period_start_date		date		not null ,
     observation_period_end_date		date		not null ,
	 period_type_concept_id				integer		not null
    )
distkey(person_id);

drop table if exists scratch_jweave17_273.payer_plan_period;
create table scratch_jweave17_273.payer_plan_period
    (
     payer_plan_period_id			bigint			not null ,
     person_id						bigint			not null ,
     payer_plan_period_start_date	date			not null ,
     payer_plan_period_end_date		date			not null ,
     payer_source_value				varchar (50)	null ,
     plan_source_value				varchar (50)	null ,
     family_source_value			varchar (50)	null
    )
distkey(person_id);


drop table if exists scratch_jweave17_273.person;
create table scratch_jweave17_273.person
    (
     person_id						bigint		not null ,
     gender_concept_id				integer		not null ,
     year_of_birth					integer		not null ,
     month_of_birth					integer		null,
     day_of_birth					integer		null,
	 time_of_birth					varchar(10)	null,
     race_concept_id				integer		not null,
     ethnicity_concept_id			integer		not null,
     location_id					bigint		null,
     provider_id					bigint		null,
     care_site_id					bigint		null,
     person_source_value			varchar(50) null,
     gender_source_value			varchar(50) null,
	 gender_source_concept_id		integer		null,
     race_source_value				varchar(50) null,
	 race_source_concept_id			integer		null,
     ethnicity_source_value			varchar(50) null,
	 ethnicity_source_concept_id	integer		null
    )
distkey(person_id);

drop table if exists scratch_jweave17_273.procedure_cost;
create table scratch_jweave17_273.procedure_cost
    (
     procedure_cost_id				bigint			not null ,
     procedure_occurrence_id		bigint			not null ,
     currency_concept_id			integer			null ,
     paid_copay						numeric			null ,
     paid_coinsurance				numeric			null ,
     paid_toward_deductible			numeric			null ,
     paid_by_payer					numeric			null ,
     paid_by_coordination_benefits	numeric			null ,
     total_out_of_pocket			numeric			null ,
     total_paid						numeric			null ,
	   revenue_code_concept_id		bigint			null ,
     payer_plan_period_id			bigint			null ,
	   revenue_code_source_value		varchar(50)		null
	)
distkey(procedure_occurrence_id);


drop table if exists scratch_jweave17_273.procedure_occurrence;
create table scratch_jweave17_273.procedure_occurrence
    (
     procedure_occurrence_id		bigint			not null ,
     person_id						bigint			not null ,
     procedure_concept_id			integer			not null ,
     procedure_date					date			not null ,
     procedure_type_concept_id		integer			not null ,
	 modifier_concept_id			integer			null ,
	 quantity						integer			null ,
     provider_id					bigint			null ,
     visit_occurrence_id			bigint			null ,
     procedure_source_value			varchar(50)		null ,
	 procedure_source_concept_id	integer			null ,
	 qualifier_source_value			varchar(50)		null
    )
distkey(person_id);


drop table if exists scratch_jweave17_273.provider;
create table scratch_jweave17_273.provider
    (
     provider_id					bigint			not null ,
	 provider_name					varchar(255)	null ,
     npi							varchar(20)		null ,
     dea							varchar(20)		null ,
     specialty_concept_id			integer			null ,
     care_site_id					integer			null ,
	 year_of_birth					integer			null ,
	 gender_concept_id				integer			null ,
     provider_source_value			varchar(50)		null ,
     specialty_source_value			varchar(50)		null ,
	 specialty_source_concept_id	integer			null ,
	 gender_source_value			varchar(50)		null ,
	 gender_source_concept_id		integer			null
    )
distkey(provider_id);

drop table if exists scratch_jweave17_273.relationship;
create table scratch_jweave17_273.relationship (
  relationship_id			varchar(20)		not null,
  relationship_name			varchar(255)	not null,
  is_hierarchical			varchar(1)		not null,
  defines_ancestry			varchar(1)		not null,
  reverse_relationship_id	varchar(20)		not null,
  relationship_concept_id	integer			not null
)
diststyle all;

drop table if exists scratch_jweave17_273.source_to_concept_map;
create table scratch_jweave17_273.source_to_concept_map (
  source_code				varchar(50)		not null,
  source_concept_id			integer			not null,
  source_vocabulary_id		varchar(20)		not null,
  source_code_description	varchar(255)	null,
  target_concept_id			integer			not null,
  target_vocabulary_id		varchar(20)		not null,
  valid_start_date			date			not null,
  valid_end_date			date			not null,
  invalid_reason			varchar(1)		null
)
diststyle all;

drop table if exists scratch_jweave17_273.specimen;
create table scratch_jweave17_273.specimen
    (
     specimen_id						integer			not null ,
	 person_id							integer			not null ,
	 specimen_concept_id				integer			not null ,
	 specimen_type_concept_id			integer			not null ,
	 specimen_date						date			not null ,
	 specimen_time						varchar(10)		null ,
	 quantity							numeric			null ,
	 unit_concept_id					integer			null ,
	 anatomic_site_concept_id			integer			null ,
	 disease_status_concept_id			integer			null ,
	 specimen_source_id					varchar(50)		null ,
	 specimen_source_value				varchar(50)		null ,
	 unit_source_value					varchar(50)		null ,
	 anatomic_site_source_value			varchar(50)		null ,
	 disease_status_source_value		varchar(50)		null
	)
distkey(person_id);

drop table if exists scratch_jweave17_273.visit_cost;
create table scratch_jweave17_273.visit_cost
    (
    visit_cost_id					integer			not null ,
    visit_occurrence_id			integer			not null ,
	  currency_concept_id			integer			null ,
    paid_copay						numeric			null ,
    paid_coinsurance				numeric			null ,
    paid_toward_deductible			numeric			null ,
    paid_by_payer					numeric			null ,
    paid_by_coordination_benefits	numeric			null ,
    total_out_of_pocket			numeric			null ,
    total_paid						numeric			null ,
    payer_plan_period_id			integer			null
    )
distkey(visit_cost_id);

drop table if exists scratch_jweave17_273.visit_occurrence;
create table scratch_jweave17_273.visit_occurrence
    (
     visit_occurrence_id			bigint			not null ,
     person_id						bigint			not null ,
     visit_concept_id				integer			not null ,
	 visit_start_date				date			not null ,
	 visit_start_time				varchar(10)		null ,
     visit_end_date					date			not null ,
	 visit_end_time					varchar(10)		null ,
	 visit_type_concept_id			integer			not null ,
	 provider_id					integer			null,
     care_site_id					bigint			null,
     visit_source_value				varchar(50)		null,
	 visit_source_concept_id		integer			null
    )
distkey(person_id);

drop table if exists scratch_jweave17_273.vocabulary;
create table scratch_jweave17_273.vocabulary (
  vocabulary_id			varchar(20)		not null,
  vocabulary_name		varchar(255)	not null,
  vocabulary_reference	varchar(255)	null,
  vocabulary_version	varchar(255)	null,
  vocabulary_concept_id	integer			not null
)
diststyle all;

drop table if exists scratch_jweave17_273.attribute_definition;
create table scratch_jweave17_273.attribute_definition (
  attribute_definition_id		integer			not null,
  attribute_name				varchar(255)	not null,
  attribute_description			text	null,
  attribute_type_concept_id		integer			not null,
  attribute_syntax				text	null
)
diststyle all;

drop table if exists scratch_jweave17_273.cohort_attribute;
create table scratch_jweave17_273.cohort_attribute
    (
	 cohort_definition_id			integer			not null ,
     cohort_start_date				date			not null ,
     cohort_end_date				date			not null ,
     subject_id						integer			not null ,
     attribute_definition_id		integer			not null ,
	 value_as_number				numeric			null ,
	 value_as_concept_id			integer			null
    )
distkey(subject_id);

drop table if exists scratch_jweave17_273.fact_relationship;
create table scratch_jweave17_273.fact_relationship
    (
     domain_concept_id_1			integer			not null ,
	 fact_id_1						integer			not null ,
	 domain_concept_id_2			integer			not null ,
	 fact_id_2						integer			not null ,
	 relationship_concept_id		integer			not null
	)
diststyle all;
