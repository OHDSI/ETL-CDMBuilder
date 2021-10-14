
CREATE TABLE {sc}.person (
			person_id bigint(20) NOT NULL,
			gender_concept_id int(11) NOT NULL,
			year_of_birth int(11) NOT NULL,
			month_of_birth int(11) NULL,
			day_of_birth int(11) NULL,
			birth_datetime timestamp NULL,
			race_concept_id int(11) NOT NULL,
			ethnicity_concept_id int(11) NOT NULL,
			location_id bigint(20) NULL,
			provider_id bigint(20) NULL,
			care_site_id bigint(20) NULL,
			person_source_value varchar(50) NULL,
			gender_source_value varchar(50) NULL,
			gender_source_concept_id int(11) NULL,
			race_source_value varchar(50) NULL,
			race_source_concept_id int(11) NULL,
			ethnicity_source_value varchar(50) NULL,
			ethnicity_source_concept_id int(11) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.observation_period (
			observation_period_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			observation_period_start_date date NOT NULL,
			observation_period_end_date date NOT NULL,
			period_type_concept_id int(11) NOT NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.visit_occurrence (
			visit_occurrence_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			visit_concept_id int(11) NOT NULL,
			visit_start_date date NOT NULL,
			visit_start_datetime timestamp NULL,
			visit_end_date date NOT NULL,
			visit_end_datetime timestamp NULL,
			visit_type_concept_id int(11) NOT NULL,
			provider_id bigint(20) NULL,
			care_site_id bigint(20) NULL,
			visit_source_value varchar(50) NULL,
			visit_source_concept_id int(11) NULL,
			admitted_from_concept_id int(11) NULL,
			admitted_from_source_value varchar(50) NULL,
			discharged_to_concept_id int(11) NULL,
			discharged_to_source_value varchar(50) NULL,
			preceding_visit_occurrence_id bigint(20) UNSIGNED NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.visit_detail (
			visit_detail_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			visit_detail_concept_id int(11) NOT NULL,
			visit_detail_start_date date NOT NULL,
			visit_detail_start_datetime timestamp NULL,
			visit_detail_end_date date NOT NULL,
			visit_detail_end_datetime timestamp NULL,
			visit_detail_type_concept_id int(11) NOT NULL,
			provider_id bigint(20) NULL,
			care_site_id bigint(20) NULL,
			visit_detail_source_value varchar(50) NULL,
			visit_detail_source_concept_id int(11) NULL,
			admitted_from_concept_id int(11) NULL,
			admitted_from_source_value varchar(50) NULL,
			discharged_to_source_value varchar(50) NULL,
			discharged_to_concept_id int(11) NULL,
			preceding_visit_detail_id bigint(20) UNSIGNED NULL,
			parent_visit_detail_id bigint(20) UNSIGNED NULL,
			visit_occurrence_id bigint(20) UNSIGNED NOT NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.condition_occurrence (
			condition_occurrence_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			condition_concept_id int(11) NOT NULL,
			condition_start_date date NOT NULL,
			condition_start_datetime timestamp NULL,
			condition_end_date date NULL,
			condition_end_datetime timestamp NULL,
			condition_type_concept_id int(11) NOT NULL,
			condition_status_concept_id int(11) NULL,
			stop_reason varchar(20) NULL,
			provider_id bigint(20) NULL,
			visit_occurrence_id bigint(20) UNSIGNED NULL,
			visit_detail_id bigint(20) UNSIGNED NULL,
			condition_source_value varchar(50) NULL,
			condition_source_concept_id int(11) NULL,
			condition_status_source_value varchar(50) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.drug_exposure (
			drug_exposure_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			drug_concept_id int(11) NOT NULL,
			drug_exposure_start_date date NOT NULL,
			drug_exposure_start_datetime timestamp NULL,
			drug_exposure_end_date date NOT NULL,
			drug_exposure_end_datetime timestamp NULL,
			verbatim_end_date date NULL,
			drug_type_concept_id int(11) NOT NULL,
			stop_reason varchar(20) NULL,
			refills int(11) NULL,
			quantity DECIMAL(38,2) NULL,
			days_supply int(11) NULL,
			sig text NULL,
			route_concept_id int(11) NULL,
			lot_number varchar(50) NULL,
			provider_id bigint(20) NULL,
			visit_occurrence_id bigint(20) UNSIGNED NULL,
			visit_detail_id bigint(20) UNSIGNED NULL,
			drug_source_value varchar(50) NULL,
			drug_source_concept_id int(11) NULL,
			route_source_value varchar(50) NULL,
			dose_unit_source_value varchar(50) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.procedure_occurrence (
			procedure_occurrence_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			procedure_concept_id int(11) NOT NULL,
			procedure_date date NOT NULL,
			procedure_datetime timestamp NULL,
			procedure_end_date date NULL,
			procedure_end_datetime timestamp NULL,
			procedure_type_concept_id int(11) NOT NULL,
			modifier_concept_id int(11) NULL,
			quantity int(11) NULL,
			provider_id bigint(20) NULL,
			visit_occurrence_id bigint(20) UNSIGNED NULL,
			visit_detail_id bigint(20) UNSIGNED NULL,
			procedure_source_value varchar(50) NULL,
			procedure_source_concept_id int(11) NULL,
			modifier_source_value varchar(50) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.device_exposure (
			device_exposure_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			device_concept_id int(11) NOT NULL,
			device_exposure_start_date date NOT NULL,
			device_exposure_start_datetime timestamp NULL,
			device_exposure_end_date date NULL,
			device_exposure_end_datetime timestamp NULL,
			device_type_concept_id int(11) NOT NULL,
			unique_device_id varchar(255) NULL,
			production_id varchar(255) NULL,
			quantity int(11) NULL,
			provider_id bigint(20) NULL,
			visit_occurrence_id bigint(20) UNSIGNED NULL,
			visit_detail_id bigint(20) UNSIGNED NULL,
			device_source_value varchar(50) NULL,
			device_source_concept_id int(11) NULL,
			unit_concept_id int(11) NULL,
			unit_source_value varchar(50) NULL,
			unit_source_concept_id int(11) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.measurement (
			measurement_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			measurement_concept_id int(11) NOT NULL,
			measurement_date date NOT NULL,
			measurement_datetime timestamp NULL,
			measurement_time varchar(10) NULL,
			measurement_type_concept_id int(11) NOT NULL,
			operator_concept_id int(11) NULL,
			value_as_number DECIMAL(38,2) NULL,
			value_as_concept_id int(11) NULL,
			unit_concept_id int(11) NULL,
			range_low DECIMAL(38,2) NULL,
			range_high DECIMAL(38,2) NULL,
			provider_id bigint(20) NULL,
			visit_occurrence_id bigint(20) UNSIGNED NULL,
			visit_detail_id bigint(20) UNSIGNED NULL,
			measurement_source_value varchar(50) NULL,
			measurement_source_concept_id int(11) NULL,
			unit_source_value varchar(50) NULL,
			unit_source_concept_id int(11) NULL,
			value_source_value varchar(50) NULL,
			measurement_event_id bigint(20) NULL,
			meas_event_field_concept_id int(11) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.observation (
			observation_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			observation_concept_id int(11) NOT NULL,
			observation_date date NOT NULL,
			observation_datetime timestamp NULL,
			observation_type_concept_id int(11) NOT NULL,
			value_as_number DECIMAL(38,2) NULL,
			value_as_string varchar(60) NULL,
			value_as_concept_id int(11) NULL,
			qualifier_concept_id int(11) NULL,
			unit_concept_id int(11) NULL,
			provider_id bigint(20) NULL,
			visit_occurrence_id bigint(20) UNSIGNED NULL,
			visit_detail_id bigint(20) UNSIGNED NULL,
			observation_source_value varchar(50) NULL,
			observation_source_concept_id int(11) NULL,
			unit_source_value varchar(50) NULL,
			qualifier_source_value varchar(50) NULL,
			value_source_value varchar(50) NULL,
			observation_event_id bigint(20) NULL,
			obs_event_field_concept_id int(11) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.death (
			person_id bigint(20) NOT NULL,
			death_date date NOT NULL,
			death_datetime timestamp NULL,
			death_type_concept_id int(11) NULL,
			cause_concept_id int(11) NULL,
			cause_source_value varchar(50) NULL,
			cause_source_concept_id int(11) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.note (
			note_id bigint(20) UNSIGNED NOT NULL,
			person_id int(11) NOT NULL,
			note_date date NOT NULL,
			note_datetime timestamp NULL,
			note_type_concept_id int(11) NOT NULL,
			note_class_concept_id int(11) NOT NULL,
			note_title varchar(250) NULL,
			note_text text NOT NULL,
			encoding_concept_id int(11) NOT NULL,
			language_concept_id int(11) NOT NULL,
			provider_id int(11) NULL,
			visit_occurrence_id int(11) NULL,
			visit_detail_id int(11) NULL,
			note_source_value varchar(50) NULL,
			note_event_id bigint(20) NULL,
			note_event_field_concept_id int(11) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.note_nlp (
			note_nlp_id bigint(20) UNSIGNED NOT NULL,
			note_id int(11) NOT NULL,
			section_concept_id int(11) NULL,
			snippet varchar(250) NULL,
			offset varchar(50) NULL,
			lexical_variant varchar(250) NOT NULL,
			note_nlp_concept_id int(11) NULL,
			note_nlp_source_concept_id int(11) NULL,
			nlp_system varchar(250) NULL,
			nlp_date date NOT NULL,
			nlp_datetime timestamp NULL,
			term_exists varchar(1) NULL,
			term_temporal varchar(50) NULL,
			term_modifiers varchar(2000) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.specimen (
			specimen_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			specimen_concept_id int(11) NOT NULL,
			specimen_type_concept_id int(11) NOT NULL,
			specimen_date date NOT NULL,
			specimen_datetime timestamp NULL,
			quantity DECIMAL(38,2) NULL,
			unit_concept_id int(11) NULL,
			anatomic_site_concept_id int(11) NULL,
			disease_status_concept_id int(11) NULL,
			specimen_source_id varchar(50) NULL,
			specimen_source_value varchar(50) NULL,
			unit_source_value varchar(50) NULL,
			anatomic_site_source_value varchar(50) NULL,
			disease_status_source_value varchar(50) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.fact_relationship (
			domain_concept_id_1 int(11) NOT NULL,
			fact_id_1 int(11) NOT NULL,
			domain_concept_id_2 int(11) NOT NULL,
			fact_id_2 int(11) NOT NULL,
			relationship_concept_id int(11) NOT NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.location (
			location_id bigint(20) NOT NULL,
			address_1 varchar(50) NULL,
			address_2 varchar(50) NULL,
			city varchar(50) NULL,
			state varchar(2) NULL,
			zip varchar(9) NULL,
			county varchar(20) NULL,
			location_source_value varchar(50) NULL,
			country_concept_id int(11) NULL,
			country_source_value varchar(80) NULL,
			latitude DECIMAL(38,2) NULL,
			longitude DECIMAL(38,2) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.care_site (
			care_site_id bigint(20) NOT NULL,
			care_site_name varchar(255) NULL,
			place_of_service_concept_id int(11) NULL,
			location_id bigint(20) NULL,
			care_site_source_value varchar(50) NULL,
			place_of_service_source_value varchar(50) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.provider (
			provider_id bigint(20) NOT NULL,
			provider_name varchar(255) NULL,
			npi varchar(20) NULL,
			dea varchar(20) NULL,
			specialty_concept_id int(11) NULL,
			care_site_id int(11) NULL,
			year_of_birth int(11) NULL,
			gender_concept_id int(11) NULL,
			provider_source_value varchar(50) NULL,
			specialty_source_value varchar(50) NULL,
			specialty_source_concept_id int(11) NULL,
			gender_source_value varchar(50) NULL,
			gender_source_concept_id int(11) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.payer_plan_period (
			payer_plan_period_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			payer_plan_period_start_date date NOT NULL,
			payer_plan_period_end_date date NOT NULL,
			payer_concept_id int(11) NULL,
			payer_source_value varchar(50) NULL,
			payer_source_concept_id int(11) NULL,
			plan_concept_id int(11) NULL,
			plan_source_value varchar(50) NULL,
			plan_source_concept_id int(11) NULL,
			sponsor_concept_id int(11) NULL,
			sponsor_source_value varchar(50) NULL,
			sponsor_source_concept_id int(11) NULL,
			family_source_value varchar(50) NULL,
			stop_reason_concept_id int(11) NULL,
			stop_reason_source_value varchar(50) NULL,
			stop_reason_source_concept_id int(11) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.cost (
			cost_id bigint(20) UNSIGNED NOT NULL,
			cost_event_id bigint(20) UNSIGNED NOT NULL,
			cost_domain_id varchar(20) NOT NULL,
			cost_type_concept_id int(11) NOT NULL,
			currency_concept_id int(11) NULL,
			total_charge DECIMAL(38,2) NULL,
			total_cost DECIMAL(38,2) NULL,
			total_paid DECIMAL(38,2) NULL,
			paid_by_payer DECIMAL(38,2) NULL,
			paid_by_patient DECIMAL(38,2) NULL,
			paid_patient_copay DECIMAL(38,2) NULL,
			paid_patient_coinsurance DECIMAL(38,2) NULL,
			paid_patient_deductible DECIMAL(38,2) NULL,
			paid_by_primary DECIMAL(38,2) NULL,
			paid_ingredient_cost DECIMAL(38,2) NULL,
			paid_dispensing_fee DECIMAL(38,2) NULL,
			payer_plan_period_id bigint(20) UNSIGNED NULL,
			amount_allowed DECIMAL(38,2) NULL,
			revenue_code_concept_id int(11) NULL,
			revenue_code_source_value varchar(50) NULL,
			drg_concept_id int(11) NULL,
			drg_source_value varchar(3) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.drug_era (
			drug_era_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			drug_concept_id int(11) NOT NULL,
			drug_era_start_date date NOT NULL,
			drug_era_end_date date NOT NULL,
			drug_exposure_count int(11) NULL,
			gap_days int(11) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.dose_era (
			dose_era_id bigint(20) UNSIGNED NOT NULL,
			person_id int(11) NOT NULL,
			drug_concept_id int(11) NOT NULL,
			unit_concept_id int(11) NOT NULL,
			dose_value DECIMAL(38,2) NOT NULL,
			dose_era_start_date date NOT NULL,
			dose_era_end_date date NOT NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.condition_era (
			condition_era_id bigint(20) UNSIGNED NOT NULL,
			person_id bigint(20) NOT NULL,
			condition_concept_id int(11) NOT NULL,
			condition_era_start_date date NOT NULL,
			condition_era_end_date date NOT NULL,
			condition_occurrence_count int(11) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.episode (
			episode_id bigint(20) NOT NULL,
			person_id bigint(20) NOT NULL,
			episode_concept_id int(11) NOT NULL,
			episode_start_date date NOT NULL,
			episode_start_datetime timestamp NULL,
			episode_end_date date NULL,
			episode_end_datetime timestamp NULL,
			episode_parent_id bigint(20) NULL,
			episode_number int(11) NULL,
			episode_object_concept_id int(11) NOT NULL,
			episode_type_concept_id int(11) NOT NULL,
			episode_source_value varchar(50) NULL,
			episode_source_concept_id int(11) NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.episode_event (
			episode_id bigint(20) NOT NULL,
			event_id bigint(20) NOT NULL,
			episode_event_field_concept_id int(11) NOT NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.metadata (
			metadata_id int(11) NOT NULL,
			metadata_concept_id int(11) NOT NULL,
			metadata_type_concept_id int(11) NOT NULL,
			name varchar(250) NOT NULL,
			value_as_string varchar(250) NULL,
			value_as_concept_id int(11) NULL,
			value_as_number DECIMAL(38,2) NULL,
			metadata_date date NULL,
			metadata_datetime timestamp NULL )ENGINE=InnoDB;
GO

CREATE TABLE {sc}.metadata_tmp
(
   person_id  bigint(20)         NOT NULL,
   name       varchar(250)   NOT NULL
)ENGINE=InnoDB;
GO


CREATE TABLE {sc}.cdm_source (
			cdm_source_name varchar(255) NOT NULL,
			cdm_source_abbreviation varchar(25) NOT NULL,
			cdm_holder varchar(255) NOT NULL,
			source_description text NULL,
			source_documentation_reference varchar(255) NULL,
			cdm_etl_reference varchar(255) NULL,
			source_release_date date NOT NULL,
			cdm_release_date date NOT NULL,
			cdm_version varchar(10) NULL,
			cdm_version_concept_id int(11) NOT NULL,
			vocabulary_version varchar(20) NOT NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.cohort (
			cohort_definition_id int(11) NOT NULL,
			subject_id int(11) NOT NULL,
			cohort_start_date date NOT NULL,
			cohort_end_date date NOT NULL )ENGINE=InnoDB;
GO


CREATE TABLE {sc}.cohort_definition (
			cohort_definition_id int(11) NOT NULL,
			cohort_definition_name varchar(255) NOT NULL,
			cohort_definition_description text NULL,
			definition_type_concept_id int(11) NOT NULL,
			cohort_definition_syntax text NULL,
			subject_concept_id int(11) NOT NULL,
			cohort_initiation_date date NULL )ENGINE=InnoDB;
GO