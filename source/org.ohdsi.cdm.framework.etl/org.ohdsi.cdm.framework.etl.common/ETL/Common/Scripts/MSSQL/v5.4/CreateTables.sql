--sql server CDM DDL Specification for OMOP Common Data Model 5.4

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.PERSON (
			person_id bigint NOT NULL,
			gender_concept_id integer NOT NULL,
			year_of_birth integer NOT NULL,
			month_of_birth integer NULL,
			day_of_birth integer NULL,
			birth_datetime datetime2 NULL,
			race_concept_id integer NOT NULL,
			ethnicity_concept_id integer NOT NULL,
			location_id bigint NULL,
			provider_id bigint NULL,
			care_site_id bigint NULL,
			person_source_value varchar(50) NULL,
			gender_source_value varchar(50) NULL,
			gender_source_concept_id integer NULL,
			race_source_value varchar(50) NULL,
			race_source_concept_id integer NULL,
			ethnicity_source_value varchar(50) NULL,
			ethnicity_source_concept_id integer NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.OBSERVATION_PERIOD (
			observation_period_id bigint NOT NULL,
			person_id bigint NOT NULL,
			observation_period_start_date date NOT NULL,
			observation_period_end_date date NOT NULL,
			period_type_concept_id integer NOT NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.VISIT_OCCURRENCE (
			visit_occurrence_id bigint NOT NULL,
			person_id bigint NOT NULL,
			visit_concept_id integer NOT NULL,
			visit_start_date date NOT NULL,
			visit_start_datetime datetime2 NULL,
			visit_end_date date NOT NULL,
			visit_end_datetime datetime2 NULL,
			visit_type_concept_id Integer NOT NULL,
			provider_id bigint NULL,
			care_site_id bigint NULL,
			visit_source_value varchar(50) NULL,
			visit_source_concept_id integer NULL,
			admitted_from_concept_id integer NULL,
			admitted_from_source_value varchar(50) NULL,
			discharged_to_concept_id integer NULL,
			discharged_to_source_value varchar(50) NULL,
			preceding_visit_occurrence_id bigint NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.VISIT_DETAIL (
			visit_detail_id bigint NOT NULL,
			person_id bigint NOT NULL,
			visit_detail_concept_id integer NOT NULL,
			visit_detail_start_date date NOT NULL,
			visit_detail_start_datetime datetime2 NULL,
			visit_detail_end_date date NOT NULL,
			visit_detail_end_datetime datetime2 NULL,
			visit_detail_type_concept_id integer NOT NULL,
			provider_id bigint NULL,
			care_site_id bigint NULL,
			visit_detail_source_value varchar(50) NULL,
			visit_detail_source_concept_id Integer NULL,
			admitted_from_concept_id Integer NULL,
			admitted_from_source_value varchar(50) NULL,
			discharged_to_source_value varchar(50) NULL,
			discharged_to_concept_id integer NULL,
			preceding_visit_detail_id bigint NULL,
			parent_visit_detail_id bigint NULL,
			visit_occurrence_id bigint NOT NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.CONDITION_OCCURRENCE (
			condition_occurrence_id bigint NOT NULL,
			person_id bigint NOT NULL,
			condition_concept_id integer NOT NULL,
			condition_start_date date NOT NULL,
			condition_start_datetime datetime2 NULL,
			condition_end_date date NULL,
			condition_end_datetime datetime2 NULL,
			condition_type_concept_id integer NOT NULL,
			condition_status_concept_id integer NULL,
			stop_reason varchar(20) NULL,
			provider_id bigint NULL,
			visit_occurrence_id bigint NULL,
			visit_detail_id bigint NULL,
			condition_source_value varchar(50) NULL,
			condition_source_concept_id integer NULL,
			condition_status_source_value varchar(50) NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.DRUG_EXPOSURE (
			drug_exposure_id bigint NOT NULL,
			person_id bigint NOT NULL,
			drug_concept_id integer NOT NULL,
			drug_exposure_start_date date NOT NULL,
			drug_exposure_start_datetime datetime2 NULL,
			drug_exposure_end_date date NOT NULL,
			drug_exposure_end_datetime datetime2 NULL,
			verbatim_end_date date NULL,
			drug_type_concept_id integer NOT NULL,
			stop_reason varchar(20) NULL,
			refills integer NULL,
			quantity float NULL,
			days_supply integer NULL,
			sig text NULL,
			route_concept_id integer NULL,
			lot_number varchar(50) NULL,
			provider_id bigint NULL,
			visit_occurrence_id bigint NULL,
			visit_detail_id bigint NULL,
			drug_source_value varchar(50) NULL,
			drug_source_concept_id integer NULL,
			route_source_value varchar(50) NULL,
			dose_unit_source_value varchar(50) NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.PROCEDURE_OCCURRENCE (
			procedure_occurrence_id bigint NOT NULL,
			person_id bigint NOT NULL,
			procedure_concept_id integer NOT NULL,
			procedure_date date NOT NULL,
			procedure_datetime datetime2 NULL,
			procedure_end_date date NULL,
			procedure_end_datetime datetime2 NULL,
			procedure_type_concept_id integer NOT NULL,
			modifier_concept_id integer NULL,
			quantity integer NULL,
			provider_id bigint NULL,
			visit_occurrence_id bigint NULL,
			visit_detail_id bigint NULL,
			procedure_source_value varchar(50) NULL,
			procedure_source_concept_id integer NULL,
			modifier_source_value varchar(50) NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.DEVICE_EXPOSURE (
			device_exposure_id bigint NOT NULL,
			person_id bigint NOT NULL,
			device_concept_id integer NOT NULL,
			device_exposure_start_date date NOT NULL,
			device_exposure_start_datetime datetime2 NULL,
			device_exposure_end_date date NULL,
			device_exposure_end_datetime datetime2 NULL,
			device_type_concept_id integer NOT NULL,
			unique_device_id varchar(255) NULL,
			production_id varchar(255) NULL,
			quantity integer NULL,
			provider_id bigint NULL,
			visit_occurrence_id bigint NULL,
			visit_detail_id bigint NULL,
			device_source_value varchar(50) NULL,
			device_source_concept_id integer NULL,
			unit_concept_id integer NULL,
			unit_source_value varchar(50) NULL,
			unit_source_concept_id integer NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.MEASUREMENT (
			measurement_id bigint NOT NULL,
			person_id bigint NOT NULL,
			measurement_concept_id integer NOT NULL,
			measurement_date date NOT NULL,
			measurement_datetime datetime2 NULL,
			measurement_time varchar(10) NULL,
			measurement_type_concept_id integer NOT NULL,
			operator_concept_id integer NULL,
			value_as_number float NULL,
			value_as_concept_id integer NULL,
			unit_concept_id integer NULL,
			range_low float NULL,
			range_high float NULL,
			provider_id bigint NULL,
			visit_occurrence_id bigint NULL,
			visit_detail_id bigint NULL,
			measurement_source_value varchar(50) NULL,
			measurement_source_concept_id integer NULL,
			unit_source_value varchar(50) NULL,
			unit_source_concept_id integer NULL,
			value_source_value varchar(50) NULL,
			measurement_event_id bigint NULL,
			meas_event_field_concept_id integer NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.OBSERVATION (
			observation_id bigint NOT NULL,
			person_id bigint NOT NULL,
			observation_concept_id integer NOT NULL,
			observation_date date NOT NULL,
			observation_datetime datetime2 NULL,
			observation_type_concept_id integer NOT NULL,
			value_as_number float NULL,
			value_as_string varchar(60) NULL,
			value_as_concept_id Integer NULL,
			qualifier_concept_id integer NULL,
			unit_concept_id integer NULL,
			provider_id bigint NULL,
			visit_occurrence_id bigint NULL,
			visit_detail_id bigint NULL,
			observation_source_value varchar(50) NULL,
			observation_source_concept_id integer NULL,
			unit_source_value varchar(50) NULL,
			qualifier_source_value varchar(50) NULL,
			value_source_value varchar(50) NULL,
			observation_event_id bigint NULL,
			obs_event_field_concept_id integer NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.DEATH (
			person_id bigint NOT NULL,
			death_date date NOT NULL,
			death_datetime datetime2 NULL,
			death_type_concept_id integer NULL,
			cause_concept_id integer NULL,
			cause_source_value varchar(50) NULL,
			cause_source_concept_id integer NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.NOTE (
			note_id bigint NOT NULL,
			person_id integer NOT NULL,
			note_date date NOT NULL,
			note_datetime datetime2 NULL,
			note_type_concept_id integer NOT NULL,
			note_class_concept_id integer NOT NULL,
			note_title varchar(250) NULL,
			note_text text NOT NULL,
			encoding_concept_id integer NOT NULL,
			language_concept_id integer NOT NULL,
			provider_id integer NULL,
			visit_occurrence_id integer NULL,
			visit_detail_id integer NULL,
			note_source_value varchar(50) NULL,
			note_event_id bigint NULL,
			note_event_field_concept_id integer NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE {sc}.NOTE_NLP (
			note_nlp_id bigint NOT NULL,
			note_id integer NOT NULL,
			section_concept_id integer NULL,
			snippet varchar(250) NULL,
			"offset" varchar(50) NULL,
			lexical_variant varchar(250) NOT NULL,
			note_nlp_concept_id integer NULL,
			note_nlp_source_concept_id integer NULL,
			nlp_system varchar(250) NULL,
			nlp_date date NOT NULL,
			nlp_datetime datetime2 NULL,
			term_exists varchar(1) NULL,
			term_temporal varchar(50) NULL,
			term_modifiers varchar(2000) NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.SPECIMEN (
			specimen_id bigint NOT NULL,
			person_id bigint NOT NULL,
			specimen_concept_id integer NOT NULL,
			specimen_type_concept_id integer NOT NULL,
			specimen_date date NOT NULL,
			specimen_datetime datetime2 NULL,
			quantity float NULL,
			unit_concept_id integer NULL,
			anatomic_site_concept_id integer NULL,
			disease_status_concept_id integer NULL,
			specimen_source_id varchar(50) NULL,
			specimen_source_value varchar(50) NULL,
			unit_source_value varchar(50) NULL,
			anatomic_site_source_value varchar(50) NULL,
			disease_status_source_value varchar(50) NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE {sc}.FACT_RELATIONSHIP (
			domain_concept_id_1 integer NOT NULL,
			fact_id_1 integer NOT NULL,
			domain_concept_id_2 integer NOT NULL,
			fact_id_2 integer NOT NULL,
			relationship_concept_id integer NOT NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE {sc}.LOCATION (
			location_id bigint NOT NULL,
			address_1 varchar(50) NULL,
			address_2 varchar(50) NULL,
			city varchar(50) NULL,
			state varchar(2) NULL,
			zip varchar(9) NULL,
			county varchar(20) NULL,
			location_source_value varchar(50) NULL,
			country_concept_id integer NULL,
			country_source_value varchar(80) NULL,
			latitude float NULL,
			longitude float NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE {sc}.CARE_SITE (
			care_site_id bigint NOT NULL,
			care_site_name varchar(255) NULL,
			place_of_service_concept_id integer NULL,
			location_id bigint NULL,
			care_site_source_value varchar(50) NULL,
			place_of_service_source_value varchar(50) NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE {sc}.PROVIDER (
			provider_id bigint NOT NULL,
			provider_name varchar(255) NULL,
			npi varchar(20) NULL,
			dea varchar(20) NULL,
			specialty_concept_id integer NULL,
			care_site_id integer NULL,
			year_of_birth integer NULL,
			gender_concept_id integer NULL,
			provider_source_value varchar(50) NULL,
			specialty_source_value varchar(50) NULL,
			specialty_source_concept_id integer NULL,
			gender_source_value varchar(50) NULL,
			gender_source_concept_id integer NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.PAYER_PLAN_PERIOD (
			payer_plan_period_id bigint NOT NULL,
			person_id bigint NOT NULL,
			payer_plan_period_start_date date NOT NULL,
			payer_plan_period_end_date date NOT NULL,
			payer_concept_id integer NULL,
			payer_source_value varchar(50) NULL,
			payer_source_concept_id integer NULL,
			plan_concept_id integer NULL,
			plan_source_value varchar(50) NULL,
			plan_source_concept_id integer NULL,
			sponsor_concept_id integer NULL,
			sponsor_source_value varchar(50) NULL,
			sponsor_source_concept_id integer NULL,
			family_source_value varchar(50) NULL,
			stop_reason_concept_id integer NULL,
			stop_reason_source_value varchar(50) NULL,
			stop_reason_source_concept_id integer NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE {sc}.COST (
			cost_id bigint NOT NULL,
			cost_event_id bigint NOT NULL,
			cost_domain_id varchar(20) NOT NULL,
			cost_type_concept_id integer NOT NULL,
			currency_concept_id integer NULL,
			total_charge float NULL,
			total_cost float NULL,
			total_paid float NULL,
			paid_by_payer float NULL,
			paid_by_patient float NULL,
			paid_patient_copay float NULL,
			paid_patient_coinsurance float NULL,
			paid_patient_deductible float NULL,
			paid_by_primary float NULL,
			paid_ingredient_cost float NULL,
			paid_dispensing_fee float NULL,
			payer_plan_period_id bigint NULL,
			amount_allowed float NULL,
			revenue_code_concept_id integer NULL,
			revenue_code_source_value varchar(50) NULL,
			drg_concept_id integer NULL,
			drg_source_value varchar(3) NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.DRUG_ERA (
			drug_era_id bigint NOT NULL,
			person_id bigint NOT NULL,
			drug_concept_id integer NOT NULL,
			drug_era_start_date date NOT NULL,
			drug_era_end_date date NOT NULL,
			drug_exposure_count integer NULL,
			gap_days integer NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.DOSE_ERA (
			dose_era_id bigint NOT NULL,
			person_id integer NOT NULL,
			drug_concept_id integer NOT NULL,
			unit_concept_id integer NOT NULL,
			dose_value float NOT NULL,
			dose_era_start_date date NOT NULL,
			dose_era_end_date date NOT NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.CONDITION_ERA (
			condition_era_id bigint NOT NULL,
			person_id bigint NOT NULL,
			condition_concept_id integer NOT NULL,
			condition_era_start_date date NOT NULL,
			condition_era_end_date date NOT NULL,
			condition_occurrence_count integer NULL );

--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE {sc}.EPISODE (
			episode_id bigint NOT NULL,
			person_id bigint NOT NULL,
			episode_concept_id integer NOT NULL,
			episode_start_date date NOT NULL,
			episode_start_datetime datetime2 NULL,
			episode_end_date date NULL,
			episode_end_datetime datetime2 NULL,
			episode_parent_id bigint NULL,
			episode_number integer NULL,
			episode_object_concept_id integer NOT NULL,
			episode_type_concept_id integer NOT NULL,
			episode_source_value varchar(50) NULL,
			episode_source_concept_id integer NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE {sc}.EPISODE_EVENT (
			episode_id bigint NOT NULL,
			event_id bigint NOT NULL,
			episode_event_field_concept_id integer NOT NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE {sc}.METADATA (
			metadata_id integer NOT NULL,
			metadata_concept_id integer NOT NULL,
			metadata_type_concept_id integer NOT NULL,
			name varchar(250) NOT NULL,
			value_as_string varchar(250) NULL,
			value_as_concept_id integer NULL,
			value_as_number float NULL,
			metadata_date date NULL,
			metadata_datetime datetime2 NULL );

CREATE TABLE {sc}.METADATA_TMP
(
   person_id  bigint         NOT NULL,
   name       varchar(250)   NOT NULL
);

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE {sc}.CDM_SOURCE (
			cdm_source_name varchar(255) NOT NULL,
			cdm_source_abbreviation varchar(25) NOT NULL,
			cdm_holder varchar(255) NOT NULL,
			source_description text NULL,
			source_documentation_reference varchar(255) NULL,
			cdm_etl_reference varchar(255) NULL,
			source_release_date date NOT NULL,
			cdm_release_date date NOT NULL,
			cdm_version varchar(10) NULL,
			cdm_version_concept_id integer NOT NULL,
			vocabulary_version varchar(20) NOT NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE {sc}.COHORT (
			cohort_definition_id integer NOT NULL,
			subject_id integer NOT NULL,
			cohort_start_date date NOT NULL,
			cohort_end_date date NOT NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE {sc}.COHORT_DEFINITION (
			cohort_definition_id integer NOT NULL,
			cohort_definition_name varchar(255) NOT NULL,
			cohort_definition_description text NULL,
			definition_type_concept_id integer NOT NULL,
			cohort_definition_syntax text NULL,
			subject_concept_id integer NOT NULL,
			cohort_initiation_date date NULL );