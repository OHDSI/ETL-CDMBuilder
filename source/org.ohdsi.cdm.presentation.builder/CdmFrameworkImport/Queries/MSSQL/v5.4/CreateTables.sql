CREATE TABLE {sc}.care_site (
[care_site_id] bigint NOT NULL,
[care_site_name] varchar(255) NULL,
[place_of_service_concept_id] bigint NULL,
[location_id] bigint NULL,
[care_site_source_value] varchar(150) NULL,
[place_of_service_source_value] varchar(150) NULL
);

CREATE TABLE {sc}.cdm_source (
[cdm_source_name] varchar(255) NULL,
[cdm_source_abbreviation] varchar(30) NULL,
[cdm_holder] varchar(255) NULL,
[source_description] varchar(MAX) NULL,
[source_documentation_reference] varchar(255) NULL,
[cdm_etl_reference] varchar(255) NULL,
[source_release_date] date NULL,
[cdm_release_date] date NULL,
[cdm_version] varchar(10) NULL,
[cdm_version_concept_id] bigint NOT NULL,
[vocabulary_version] varchar(20) NULL
);

CREATE TABLE {sc}.cohort (
[cohort_definition_id] bigint NOT NULL,
[subject_id] bigint NOT NULL,
[cohort_start_date] date NOT NULL,
[cohort_end_date] date NOT NULL
);

CREATE TABLE {sc}.cohort_definition (
[cohort_definition_id] bigint NOT NULL,
[cohort_definition_name] varchar(255) NULL,
[cohort_definition_description] varchar(MAX) NULL,
[definition_type_concept_id] bigint NOT NULL,
[cohort_definition_syntax] varchar(MAX) NULL,
[subject_concept_id] bigint NOT NULL,
[cohort_initiation_date] date NULL
);

CREATE TABLE {sc}.concept (
[concept_id] bigint NOT NULL,
[concept_name] varchar(500) NULL,
[domain_id] varchar(20) NULL,
[vocabulary_id] varchar(200) NULL,
[concept_class_id] varchar(20) NULL,
[standard_concept] varchar(1) NULL,
[concept_code] varchar(100) NULL,
[valid_start_date] date NOT NULL,
[valid_end_date] date NOT NULL,
[invalid_reason] varchar(1) NULL
);

CREATE TABLE {sc}.concept_ancestor (
[ancestor_concept_id] bigint NOT NULL,
[descendant_concept_id] bigint NOT NULL,
[min_levels_of_separation] bigint NOT NULL,
[max_levels_of_separation] bigint NOT NULL
);

CREATE TABLE {sc}.concept_class (
[concept_class_id] varchar(20) NULL,
[concept_class_name] varchar(255) NULL,
[concept_class_concept_id] bigint NOT NULL
);

CREATE TABLE {sc}.concept_relationship (
[concept_id_1] bigint NOT NULL,
[concept_id_2] bigint NOT NULL,
[relationship_id] varchar(20) NULL,
[valid_start_date] date NOT NULL,
[valid_end_date] date NOT NULL,
[invalid_reason] varchar(1) NULL
);

CREATE TABLE {sc}.concept_synonym (
[concept_id] bigint NOT NULL,
[concept_synonym_name] varchar(1500) NULL,
[language_concept_id] bigint NOT NULL
);

CREATE TABLE {sc}.condition_era (
[condition_era_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[condition_concept_id] bigint NOT NULL,
[condition_era_start_date] date NOT NULL,
[condition_era_end_date] date NOT NULL,
[condition_occurrence_count] bigint NULL
);

CREATE TABLE {sc}.condition_occurrence (
[condition_occurrence_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[condition_concept_id] bigint NOT NULL,
[condition_start_date] date NOT NULL,
[condition_start_datetime] datetime NULL,
[condition_end_date] date NULL,
[condition_end_datetime] datetime NULL,
[condition_type_concept_id] bigint NOT NULL,
[stop_reason] varchar(20) NULL,
[provider_id] bigint NULL,
[visit_occurrence_id] bigint NULL,
[visit_detail_id] bigint NULL,
[condition_status_concept_id] bigint NULL,
[condition_source_value] varchar(MAX) NULL,
[condition_source_concept_id] bigint NULL,
[condition_status_source_value] varchar(MAX) NULL
);

CREATE TABLE {sc}.cost (
[cost_id] bigint NOT NULL,
[cost_event_id] bigint NOT NULL,
[cost_domain_id] varchar(20) NULL,
[cost_type_concept_id] bigint NOT NULL,
[currency_concept_id] bigint NULL,
[total_charge] numeric(38,2) NULL,
[total_cost] numeric(38,2) NULL,
[total_paid] numeric(38,2) NULL,
[paid_by_payer] numeric(38,2) NULL,
[paid_by_patient] numeric(38,2) NULL,
[paid_patient_copay] numeric(38,2) NULL,
[paid_patient_coinsurance] numeric(38,2) NULL,
[paid_patient_deductible] numeric(38,2) NULL,
[paid_by_primary] numeric(38,2) NULL,
[paid_ingredient_cost] numeric(38,2) NULL,
[paid_dispensing_fee] numeric(38,2) NULL,
[payer_plan_period_id] bigint NULL,
[amount_allowed] numeric(38,2) NULL,
[revenue_code_concept_id] bigint NULL,
[revenue_code_source_value] varchar(50) NULL,
[drg_concept_id] bigint NULL,
[drg_source_value] varchar(3) NULL
);

CREATE TABLE {sc}.death (
[person_id] bigint NOT NULL,
[death_date] date NOT NULL,
[death_datetime] datetime NULL,
[death_type_concept_id] bigint NOT NULL,
[cause_concept_id] bigint NULL,
[cause_source_value] varchar(50) NULL,
[cause_source_concept_id] bigint NULL
);

CREATE TABLE {sc}.device_exposure (
[device_exposure_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[device_concept_id] bigint NOT NULL,
[device_exposure_start_date] date NOT NULL,
[device_exposure_start_datetime] datetime NULL,
[device_exposure_end_date] date NULL,
[device_exposure_end_datetime] datetime NULL,
[device_type_concept_id] bigint NOT NULL,
[unique_device_id] varchar(50) NULL,
[production_id] varchar(255) NULL,
[quantity] bigint NULL,
[provider_id] bigint NULL,
[visit_occurrence_id] bigint NULL,
[visit_detail_id] bigint NULL,
[device_source_value] varchar(255) NULL,
[device_source_concept_id] bigint NULL,
[unit_concept_id] bigint NULL,
[unit_source_value] varchar(255) NULL,
[unit_source_concept_id] bigint NULL
);

CREATE TABLE {sc}.[domain] (
[domain_id] varchar(20) NULL,
[domain_name] varchar(255) NULL,
[domain_concept_id] bigint NOT NULL
);

CREATE TABLE {sc}.dose_era (
[dose_era_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[drug_concept_id] bigint NOT NULL,
[unit_concept_id] bigint NOT NULL,
[dose_value] numeric(38,2) NULL,
[dose_era_start_date] date NOT NULL,
[dose_era_end_date] date NOT NULL
);

CREATE TABLE {sc}.drug_era (
[drug_era_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[drug_concept_id] bigint NOT NULL,
[drug_era_start_date] date NOT NULL,
[drug_era_end_date] date NOT NULL,
[drug_exposure_count] bigint NULL,
[gap_days] bigint NULL
);

CREATE TABLE {sc}.drug_exposure (
[drug_exposure_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[drug_concept_id] bigint NOT NULL,
[drug_exposure_start_date] date NOT NULL,
[drug_exposure_start_datetime] datetime NULL,
[drug_exposure_end_date] date NULL,
[drug_exposure_end_datetime] datetime NULL,
[verbatim_end_date] date NULL,
[drug_type_concept_id] bigint NOT NULL,
[stop_reason] varchar(20) NULL,
[refills] bigint NULL,
[quantity] numeric(38,2) NULL,
[days_supply] bigint NULL,
[sig] varchar(MAX) NULL,
[route_concept_id] bigint NULL,
[lot_number] varchar(MAX) NULL,
[provider_id] bigint NULL,
[visit_occurrence_id] bigint NULL,
[visit_detail_id] bigint NULL,
[drug_source_value] varchar(MAX) NULL,
[drug_source_concept_id] bigint NULL,
[route_source_value] varchar(MAX) NULL,
[dose_unit_source_value] varchar(MAX) NULL
);

CREATE TABLE {sc}.drug_strength (
[drug_concept_id] bigint NOT NULL,
[ingredient_concept_id] bigint NOT NULL,
[amount_value] float NULL,
[amount_unit_concept_id] bigint NULL,
[numerator_value] float NULL,
[numerator_unit_concept_id] bigint NULL,
[denominator_value] float NULL,
[denominator_unit_concept_id] bigint NULL,
[box_size] bigint NULL,
[valid_start_date] date NOT NULL,
[valid_end_date] date NOT NULL,
[invalid_reason] varchar(1) NULL
);

CREATE TABLE {sc}.episode (
[episode_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[episode_concept_id] bigint NOT NULL,
[episode_start_date] date NOT NULL,
[episode_start_datetime] datetime NULL,
[episode_end_date] date NULL,
[episode_end_datetime] datetime NULL,
[episode_parent_id] bigint NULL,
[episode_number] bigint NULL,
[episode_object_concept_id] bigint NOT NULL,
[episode_type_concept_id] bigint NOT NULL,
[episode_source_value] varchar(250) NULL,
[episode_source_concept_id] bigint NULL
);

CREATE TABLE {sc}.episode_event (
[episode_id] bigint NOT NULL,
[event_id] bigint NOT NULL,
[episode_event_field_concept_id] bigint NOT NULL
);

CREATE TABLE {sc}.fact_relationship (
[domain_concept_id_1] bigint NOT NULL,
[fact_id_1] bigint NOT NULL,
[domain_concept_id_2] bigint NOT NULL,
[fact_id_2] bigint NOT NULL,
[relationship_concept_id] bigint NOT NULL
);

CREATE TABLE {sc}.location (
[location_id] bigint NOT NULL,
[address_1] varchar(50) NULL,
[address_2] varchar(50) NULL,
[city] varchar(50) NULL,
[state] varchar(25) NULL,
[zip] varchar(9) NULL,
[county] varchar(20) NULL,
[location_source_value] varchar(50) NULL,
[country_concept_id] bigint NULL,
[country_source_value] varchar(150) NULL,
[latitude] numeric(38,2) NULL,
[longitude] numeric(38,2) NULL
);

CREATE TABLE {sc}.measurement (
[measurement_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[measurement_concept_id] bigint NOT NULL,
[measurement_date] date NOT NULL,
[measurement_datetime] datetime NULL,
[measurement_time] varchar(50) NULL,
[measurement_type_concept_id] bigint NOT NULL,
[operator_concept_id] bigint NULL,
[value_as_number] numeric(38,2) NULL,
[value_as_concept_id] bigint NULL,
[unit_concept_id] bigint NULL,
[range_low] numeric(38,2) NULL,
[range_high] numeric(38,2) NULL,
[provider_id] bigint NULL,
[visit_occurrence_id] bigint NULL,
[visit_detail_id] bigint NULL,
[measurement_source_value] varchar(MAX) NULL,
[measurement_source_concept_id] bigint NULL,
[unit_source_value] varchar(MAX) NULL,
[unit_source_concept_id] bigint NULL,
[value_source_value] varchar(MAX) NULL,
[measurement_event_id] bigint NULL,
[meas_event_field_concept_id] bigint NULL
);

CREATE TABLE {sc}.metadata (
[metadata_id] bigint NOT NULL,
[metadata_concept_id] bigint NOT NULL,
[metadata_type_concept_id] bigint NOT NULL,
[name] varchar(250) NULL,
[value_as_string] varchar(MAX) NULL,
[value_as_concept_id] bigint NULL,
[value_as_number] numeric(38,2) NULL,
[metadata_date] date NULL,
[metadata_datetime] datetime NULL
);

CREATE TABLE {sc}.metadata_tmp (
[person_id] bigint NOT NULL,
[name] varchar(250) NULL,
[count] numeric(38, 2) NULL
);

CREATE TABLE {sc}.note (
[note_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[note_date] date NOT NULL,
[note_datetime] datetime NULL,
[note_type_concept_id] bigint NOT NULL,
[note_text] varchar(MAX) NULL,
[provider_id] bigint NULL,
[visit_occurrence_id] bigint NULL,
[visit_detail_id] bigint NULL,
[note_source_value] varchar(50) NULL,
[note_class_concept_id] bigint NOT NULL,
[note_title] varchar(250) NULL,
[encoding_concept_id] bigint NOT NULL,
[language_concept_id] bigint NOT NULL,
[note_event_id] bigint NULL,
[note_event_field_concept_id] bigint NULL
);

CREATE TABLE {sc}.note_nlp (
[note_nlp_id] bigint NOT NULL,
[note_id] bigint NOT NULL,
[section_concept_id] bigint NULL,
[snippet] varchar(250) NULL,
[offset] varchar(250) NULL,
[lexical_variant] varchar(250) NULL,
[note_nlp_concept_id] bigint NULL,
[note_nlp_source_concept_id] bigint NULL,
[nlp_system] varchar(250) NULL,
[nlp_date] date NOT NULL,
[nlp_datetime] datetime NULL,
[term_exists] varchar(1) NULL,
[term_temporal] varchar(50) NULL,
[term_modifiers] varchar(2000) NULL
);

CREATE TABLE {sc}.observation (
[observation_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[observation_concept_id] bigint NOT NULL,
[observation_date] date NOT NULL,
[observation_datetime] datetime NULL,
[observation_type_concept_id] bigint NOT NULL,
[value_as_number] numeric(38,2) NULL,
[value_as_string] varchar(MAX) NULL,
[value_as_concept_id] bigint NULL,
[qualifier_concept_id] bigint NULL,
[unit_concept_id] bigint NULL,
[provider_id] bigint NULL,
[visit_occurrence_id] bigint NULL,
[visit_detail_id] bigint NULL,
[observation_source_value] varchar(MAX) NULL,
[observation_source_concept_id] bigint NULL,
[unit_source_value] varchar(MAX) NULL,
[qualifier_source_value] varchar(MAX) NULL,
[value_source_value] varchar(700) NULL,
[observation_event_id] bigint NULL,
[obs_event_field_concept_id] bigint NULL
);

CREATE TABLE {sc}.observation_period (
[observation_period_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[observation_period_start_date] date NOT NULL,
[observation_period_end_date] date NOT NULL,
[period_type_concept_id] bigint NOT NULL
);

CREATE TABLE {sc}.payer_plan_period (
[payer_plan_period_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[payer_plan_period_start_date] date NOT NULL,
[payer_plan_period_end_date] date NOT NULL,
[payer_concept_id] bigint NULL,
[payer_source_value] varchar(150) NULL,
[payer_source_concept_id] bigint NULL,
[plan_concept_id] bigint NULL,
[plan_source_value] varchar(150) NULL,
[plan_source_concept_id] bigint NULL,
[sponsor_concept_id] bigint NULL,
[sponsor_source_value] varchar(150) NULL,
[sponsor_source_concept_id] bigint NULL,
[family_source_value] varchar(150) NULL,
[stop_reason_concept_id] bigint NULL,
[stop_reason_source_value] varchar(150) NULL,
[stop_reason_source_concept_id] bigint NULL
);

CREATE TABLE {sc}.person (
[person_id] bigint NOT NULL,
[gender_concept_id] bigint NOT NULL,
[year_of_birth] bigint NOT NULL,
[month_of_birth] bigint NULL,
[day_of_birth] bigint NULL,
[birth_datetime] datetime NULL,
[race_concept_id] bigint NOT NULL,
[ethnicity_concept_id] bigint NOT NULL,
[location_id] bigint NULL,
[provider_id] bigint NULL,
[care_site_id] bigint NULL,
[person_source_value] varchar(50) NULL,
[gender_source_value] varchar(50) NULL,
[gender_source_concept_id] bigint NULL,
[race_source_value] varchar(50) NULL,
[race_source_concept_id] bigint NULL,
[ethnicity_source_value] varchar(50) NULL,
[ethnicity_source_concept_id] bigint NULL
);

CREATE TABLE {sc}.procedure_occurrence (
[procedure_occurrence_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[procedure_concept_id] bigint NOT NULL,
[procedure_date] date NOT NULL,
[procedure_datetime] datetime NULL,
[procedure_end_date] date NULL,
[procedure_end_datetime] datetime NULL,
[procedure_type_concept_id] bigint NOT NULL,
[modifier_concept_id] bigint NULL,
[quantity] bigint NULL,
[provider_id] bigint NULL,
[visit_occurrence_id] bigint NULL,
[visit_detail_id] bigint NULL,
[procedure_source_value] varchar(500) NULL,
[procedure_source_concept_id] bigint NULL,
[modifier_source_value] varchar(50) NULL
);

CREATE TABLE {sc}.provider (
[provider_id] bigint NOT NULL,
[provider_name] varchar(255) NULL,
[npi] varchar(25) NULL,
[dea] varchar(20) NULL,
[specialty_concept_id] bigint NULL,
[care_site_id] bigint NULL,
[year_of_birth] bigint NULL,
[gender_concept_id] bigint NULL,
[provider_source_value] varchar(100) NULL,
[specialty_source_value] varchar(100) NULL,
[specialty_source_concept_id] bigint NULL,
[gender_source_value] varchar(50) NULL,
[gender_source_concept_id] bigint NULL
);

CREATE TABLE {sc}.relationship (
[relationship_id] varchar(20) NULL,
[relationship_name] varchar(255) NULL,
[is_hierarchical] varchar(1) NULL,
[defines_ancestry] varchar(1) NULL,
[reverse_relationship_id] varchar(20) NULL,
[relationship_concept_id] bigint NOT NULL
);

CREATE TABLE {sc}.source_to_concept_map (
[source_code] varchar(255) NULL,
[source_concept_id] bigint NOT NULL,
[source_vocabulary_id] varchar(50) NULL,
[source_code_description] varchar(255) NULL,
[target_concept_id] bigint NOT NULL,
[target_vocabulary_id] varchar(50) NULL,
[valid_start_date] date NOT NULL,
[valid_end_date] date NOT NULL,
[invalid_reason] varchar(1) NULL
);

CREATE TABLE {sc}.specimen (
[specimen_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[specimen_concept_id] bigint NOT NULL,
[specimen_type_concept_id] bigint NOT NULL,
[specimen_date] date NOT NULL,
[specimen_datetime] datetime NULL,
[quantity] float NULL,
[unit_concept_id] bigint NULL,
[anatomic_site_concept_id] bigint NULL,
[disease_status_concept_id] bigint NULL,
[specimen_source_id] varchar(50) NULL,
[specimen_source_value] varchar(50) NULL,
[unit_source_value] varchar(50) NULL,
[anatomic_site_source_value] varchar(50) NULL,
[disease_status_source_value] varchar(50) NULL
);

CREATE TABLE {sc}.visit_detail (
[visit_detail_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[visit_detail_concept_id] bigint NOT NULL,
[visit_detail_start_date] date NOT NULL,
[visit_detail_start_datetime] datetime NULL,
[visit_detail_end_date] date NOT NULL,
[visit_detail_end_datetime] datetime NULL,
[visit_detail_type_concept_id] bigint NOT NULL,
[provider_id] bigint NULL,
[care_site_id] bigint NULL,
[admitted_from_concept_id] bigint NULL,
[discharged_to_concept_id] bigint NULL,
[preceding_visit_detail_id] bigint NULL,
[visit_detail_source_value] varchar(150) NULL,
[visit_detail_source_concept_id] bigint NULL,
[admitted_from_source_value] varchar(150) NULL,
[discharged_to_source_value] varchar(150) NULL,
[parent_visit_detail_id] bigint NULL,
[visit_occurrence_id] bigint NOT NULL
);

CREATE TABLE {sc}.visit_occurrence (
[visit_occurrence_id] bigint NOT NULL,
[person_id] bigint NOT NULL,
[visit_concept_id] bigint NOT NULL,
[visit_start_date] date NOT NULL,
[visit_start_datetime] datetime NULL,
[visit_end_date] date NOT NULL,
[visit_end_datetime] datetime NULL,
[visit_type_concept_id] bigint NOT NULL,
[provider_id] bigint NULL,
[care_site_id] bigint NULL,
[visit_source_value] varchar(150) NULL,
[visit_source_concept_id] bigint NULL,
[admitted_from_concept_id] bigint NULL,
[admitted_from_source_value] varchar(150) NULL,
[discharged_to_concept_id] bigint NULL,
[discharged_to_source_value] varchar(150) NULL,
[preceding_visit_occurrence_id] bigint NULL
);

CREATE TABLE {sc}.vocabulary (
[vocabulary_id] varchar(20) NULL,
[vocabulary_name] varchar(255) NULL,
[vocabulary_reference] varchar(255) NULL,
[vocabulary_version] varchar(255) NULL,
[vocabulary_concept_id] bigint NOT NULL
);


