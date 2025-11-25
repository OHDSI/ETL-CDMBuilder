CREATE TABLE {sc}.care_site (
  care_site_id bigint NOT NULL,
  care_site_name varchar(255) DEFAULT NULL,
  place_of_service_concept_id bigint DEFAULT NULL,
  location_id bigint DEFAULT NULL,
  care_site_source_value varchar(150) DEFAULT NULL,
  place_of_service_source_value varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.cdm_source (
  cdm_source_name varchar(255) DEFAULT NULL,
  cdm_source_abbreviation varchar(30) DEFAULT NULL,
  cdm_holder varchar(255) DEFAULT NULL,
  source_description longtext,
  source_documentation_reference varchar(255) DEFAULT NULL,
  cdm_etl_reference varchar(255) DEFAULT NULL,
  source_release_date date DEFAULT NULL,
  cdm_release_date date DEFAULT NULL,
  cdm_version varchar(10) DEFAULT NULL,
  cdm_version_concept_id bigint NOT NULL,
  vocabulary_version varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.cohort (
  cohort_definition_id bigint NOT NULL,
  subject_id bigint NOT NULL,
  cohort_start_date date NOT NULL,
  cohort_end_date date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.cohort_attribute (
  cohort_definition_id int NOT NULL,
  subject_id int NOT NULL,
  cohort_start_date date NOT NULL,
  cohort_end_date date NOT NULL,
  attribute_definition_id int NOT NULL,
  value_as_number decimal(38,2) DEFAULT NULL,
  value_as_concept_id int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.cohort_definition (
  cohort_definition_id bigint NOT NULL,
  cohort_definition_name varchar(255) DEFAULT NULL,
  cohort_definition_description longtext,
  definition_type_concept_id bigint NOT NULL,
  cohort_definition_syntax longtext,
  subject_concept_id bigint NOT NULL,
  cohort_initiation_date date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.concept (
  concept_id bigint NOT NULL,
  concept_name varchar(500) DEFAULT NULL,
  domain_id varchar(20) DEFAULT NULL,
  vocabulary_id varchar(200) DEFAULT NULL,
  concept_class_id varchar(20) DEFAULT NULL,
  standard_concept varchar(1) DEFAULT NULL,
  concept_code varchar(100) DEFAULT NULL,
  valid_start_date date NOT NULL,
  valid_end_date date NOT NULL,
  invalid_reason varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.concept_ancestor (
  ancestor_concept_id bigint NOT NULL,
  descendant_concept_id bigint NOT NULL,
  min_levels_of_separation bigint NOT NULL,
  max_levels_of_separation bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.concept_class (
  concept_class_id varchar(20) DEFAULT NULL,
  concept_class_name varchar(255) DEFAULT NULL,
  concept_class_concept_id bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.concept_relationship (
  concept_id_1 bigint NOT NULL,
  concept_id_2 bigint NOT NULL,
  relationship_id varchar(20) DEFAULT NULL,
  valid_start_date date NOT NULL,
  valid_end_date date NOT NULL,
  invalid_reason varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.concept_synonym (
  concept_id bigint NOT NULL,
  concept_synonym_name varchar(1500) DEFAULT NULL,
  language_concept_id bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.condition_era (
  condition_era_id bigint NOT NULL,
  person_id bigint NOT NULL,
  condition_concept_id bigint NOT NULL,
  condition_era_start_date date NOT NULL,
  condition_era_end_date date NOT NULL,
  condition_occurrence_count bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.condition_occurrence (
  condition_occurrence_id bigint NOT NULL,
  person_id bigint NOT NULL,
  condition_concept_id bigint NOT NULL,
  condition_start_date date NOT NULL,
  condition_start_datetime datetime DEFAULT NULL,
  condition_end_date date DEFAULT NULL,
  condition_end_datetime datetime DEFAULT NULL,
  condition_type_concept_id bigint NOT NULL,
  stop_reason varchar(20) DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint DEFAULT NULL,
  visit_detail_id bigint DEFAULT NULL,
  condition_status_concept_id bigint DEFAULT NULL,
  condition_source_value longtext,
  condition_source_concept_id bigint DEFAULT NULL,
  condition_status_source_value longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.cost (
  cost_id bigint NOT NULL,
  cost_event_id bigint NOT NULL,
  cost_domain_id varchar(20) DEFAULT NULL,
  cost_type_concept_id bigint NOT NULL,
  currency_concept_id bigint DEFAULT NULL,
  total_charge decimal(38,2) DEFAULT NULL,
  total_cost decimal(38,2) DEFAULT NULL,
  total_paid decimal(38,2) DEFAULT NULL,
  paid_by_payer decimal(38,2) DEFAULT NULL,
  paid_by_patient decimal(38,2) DEFAULT NULL,
  paid_patient_copay decimal(38,2) DEFAULT NULL,
  paid_patient_coinsurance decimal(38,2) DEFAULT NULL,
  paid_patient_deductible decimal(38,2) DEFAULT NULL,
  paid_by_primary decimal(38,2) DEFAULT NULL,
  paid_ingredient_cost decimal(38,2) DEFAULT NULL,
  paid_dispensing_fee decimal(38,2) DEFAULT NULL,
  payer_plan_period_id bigint DEFAULT NULL,
  amount_allowed decimal(38,2) DEFAULT NULL,
  revenue_code_concept_id bigint DEFAULT NULL,
  revenue_code_source_value varchar(50) DEFAULT NULL,
  drg_concept_id bigint DEFAULT NULL,
  drg_source_value varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.death (
  person_id bigint NOT NULL,
  death_date date NOT NULL,
  death_datetime datetime DEFAULT NULL,
  death_type_concept_id bigint NOT NULL,
  cause_concept_id bigint DEFAULT NULL,
  cause_source_value varchar(50) DEFAULT NULL,
  cause_source_concept_id bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.device_exposure (
  device_exposure_id bigint NOT NULL,
  person_id bigint NOT NULL,
  device_concept_id bigint NOT NULL,
  device_exposure_start_date date NOT NULL,
  device_exposure_start_datetime datetime DEFAULT NULL,
  device_exposure_end_date date DEFAULT NULL,
  device_exposure_end_datetime datetime DEFAULT NULL,
  device_type_concept_id bigint NOT NULL,
  unique_device_id varchar(50) DEFAULT NULL,
  production_id varchar(255) DEFAULT NULL,
  quantity bigint DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint DEFAULT NULL,
  visit_detail_id bigint DEFAULT NULL,
  device_source_value varchar(255) DEFAULT NULL,
  device_source_concept_id bigint DEFAULT NULL,
  unit_concept_id bigint DEFAULT NULL,
  unit_source_value varchar(255) DEFAULT NULL,
  unit_source_concept_id bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.domain (
  domain_id varchar(20) DEFAULT NULL,
  domain_name varchar(255) DEFAULT NULL,
  domain_concept_id bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.dose_era (
  dose_era_id bigint NOT NULL,
  person_id bigint NOT NULL,
  drug_concept_id bigint NOT NULL,
  unit_concept_id bigint NOT NULL,
  dose_value decimal(38,2) DEFAULT NULL,
  dose_era_start_date date NOT NULL,
  dose_era_end_date date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.drug_era (
  drug_era_id bigint NOT NULL,
  person_id bigint NOT NULL,
  drug_concept_id bigint NOT NULL,
  drug_era_start_date date NOT NULL,
  drug_era_end_date date NOT NULL,
  drug_exposure_count bigint DEFAULT NULL,
  gap_days bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.drug_exposure (
  drug_exposure_id bigint NOT NULL,
  person_id bigint NOT NULL,
  drug_concept_id bigint NOT NULL,
  drug_exposure_start_date date NOT NULL,
  drug_exposure_start_datetime datetime DEFAULT NULL,
  drug_exposure_end_date date DEFAULT NULL,
  drug_exposure_end_datetime datetime DEFAULT NULL,
  verbatim_end_date date DEFAULT NULL,
  drug_type_concept_id bigint NOT NULL,
  stop_reason varchar(20) DEFAULT NULL,
  refills bigint DEFAULT NULL,
  quantity decimal(38,2) DEFAULT NULL,
  days_supply bigint DEFAULT NULL,
  sig longtext,
  route_concept_id bigint DEFAULT NULL,
  lot_number longtext,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint DEFAULT NULL,
  visit_detail_id bigint DEFAULT NULL,
  drug_source_value longtext,
  drug_source_concept_id bigint DEFAULT NULL,
  route_source_value longtext,
  dose_unit_source_value longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.drug_strength (
  drug_concept_id bigint NOT NULL,
  ingredient_concept_id bigint NOT NULL,
  amount_value float DEFAULT NULL,
  amount_unit_concept_id bigint DEFAULT NULL,
  numerator_value float DEFAULT NULL,
  numerator_unit_concept_id bigint DEFAULT NULL,
  denominator_value float DEFAULT NULL,
  denominator_unit_concept_id bigint DEFAULT NULL,
  box_size bigint DEFAULT NULL,
  valid_start_date date NOT NULL,
  valid_end_date date NOT NULL,
  invalid_reason varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.episode (
  episode_id bigint NOT NULL,
  person_id bigint NOT NULL,
  episode_concept_id bigint NOT NULL,
  episode_start_date date NOT NULL,
  episode_start_datetime datetime DEFAULT NULL,
  episode_end_date date DEFAULT NULL,
  episode_end_datetime datetime DEFAULT NULL,
  episode_parent_id bigint DEFAULT NULL,
  episode_number bigint DEFAULT NULL,
  episode_object_concept_id bigint NOT NULL,
  episode_type_concept_id bigint NOT NULL,
  episode_source_value varchar(250) DEFAULT NULL,
  episode_source_concept_id bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.episode_event (
  episode_id bigint NOT NULL,
  event_id bigint NOT NULL,
  episode_event_field_concept_id bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.fact_relationship (
  domain_concept_id_1 bigint NOT NULL,
  fact_id_1 bigint NOT NULL,
  domain_concept_id_2 bigint NOT NULL,
  fact_id_2 bigint NOT NULL,
  relationship_concept_id bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.location (
  location_id bigint NOT NULL,
  address_1 varchar(50) DEFAULT NULL,
  address_2 varchar(50) DEFAULT NULL,
  city varchar(50) DEFAULT NULL,
  state varchar(25) DEFAULT NULL,
  zip varchar(9) DEFAULT NULL,
  county varchar(20) DEFAULT NULL,
  location_source_value varchar(50) DEFAULT NULL,
  country_concept_id bigint DEFAULT NULL,
  country_source_value varchar(150) DEFAULT NULL,
  latitude decimal(38,2) DEFAULT NULL,
  longitude decimal(38,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.measurement (
  measurement_id bigint NOT NULL,
  person_id bigint NOT NULL,
  measurement_concept_id bigint NOT NULL,
  measurement_date date NOT NULL,
  measurement_datetime datetime DEFAULT NULL,
  measurement_time varchar(50) DEFAULT NULL,
  measurement_type_concept_id bigint NOT NULL,
  operator_concept_id bigint DEFAULT NULL,
  value_as_number decimal(38,2) DEFAULT NULL,
  value_as_concept_id bigint DEFAULT NULL,
  unit_concept_id bigint DEFAULT NULL,
  range_low decimal(38,2) DEFAULT NULL,
  range_high decimal(38,2) DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint DEFAULT NULL,
  visit_detail_id bigint DEFAULT NULL,
  measurement_source_value longtext,
  measurement_source_concept_id bigint DEFAULT NULL,
  unit_source_value longtext,
  unit_source_concept_id bigint DEFAULT NULL,
  value_source_value longtext,
  measurement_event_id bigint DEFAULT NULL,
  meas_event_field_concept_id bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.metadata (
  metadata_id bigint NOT NULL,
  metadata_concept_id bigint NOT NULL,
  metadata_type_concept_id bigint NOT NULL,
  name varchar(250) DEFAULT NULL,
  value_as_string longtext,
  value_as_concept_id bigint DEFAULT NULL,
  value_as_number decimal(38,2) DEFAULT NULL,
  metadata_date date DEFAULT NULL,
  metadata_datetime datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.metadata_tmp (
  person_id bigint NOT NULL,
  name varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.note (
  note_id bigint NOT NULL,
  person_id bigint NOT NULL,
  note_date date NOT NULL,
  note_datetime datetime DEFAULT NULL,
  note_type_concept_id bigint NOT NULL,
  note_text longtext,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint DEFAULT NULL,
  visit_detail_id bigint DEFAULT NULL,
  note_source_value varchar(50) DEFAULT NULL,
  note_class_concept_id bigint NOT NULL,
  note_title varchar(250) DEFAULT NULL,
  encoding_concept_id bigint NOT NULL,
  language_concept_id bigint NOT NULL,
  note_event_id bigint DEFAULT NULL,
  note_event_field_concept_id bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.note_nlp (
  note_nlp_id bigint NOT NULL,
  note_id bigint NOT NULL,
  section_concept_id bigint DEFAULT NULL,
  snippet varchar(250) DEFAULT NULL,
  offset varchar(250) DEFAULT NULL,
  lexical_variant varchar(250) DEFAULT NULL,
  note_nlp_concept_id bigint DEFAULT NULL,
  note_nlp_source_concept_id bigint DEFAULT NULL,
  nlp_system varchar(250) DEFAULT NULL,
  nlp_date date NOT NULL,
  nlp_datetime datetime DEFAULT NULL,
  term_exists varchar(1) DEFAULT NULL,
  term_temporal varchar(50) DEFAULT NULL,
  term_modifiers varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.observation (
  observation_id bigint NOT NULL,
  person_id bigint NOT NULL,
  observation_concept_id bigint NOT NULL,
  observation_date date NOT NULL,
  observation_datetime datetime DEFAULT NULL,
  observation_type_concept_id bigint NOT NULL,
  value_as_number decimal(38,2) DEFAULT NULL,
  value_as_string longtext,
  value_as_concept_id bigint DEFAULT NULL,
  qualifier_concept_id bigint DEFAULT NULL,
  unit_concept_id bigint DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint DEFAULT NULL,
  visit_detail_id bigint DEFAULT NULL,
  observation_source_value longtext,
  observation_source_concept_id bigint DEFAULT NULL,
  unit_source_value longtext,
  qualifier_source_value longtext,
  value_source_value varchar(700) DEFAULT NULL,
  observation_event_id bigint DEFAULT NULL,
  obs_event_field_concept_id bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.observation_period (
  observation_period_id bigint NOT NULL,
  person_id bigint NOT NULL,
  observation_period_start_date date NOT NULL,
  observation_period_end_date date NOT NULL,
  period_type_concept_id bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.payer_plan_period (
  payer_plan_period_id bigint NOT NULL,
  person_id bigint NOT NULL,
  payer_plan_period_start_date date NOT NULL,
  payer_plan_period_end_date date NOT NULL,
  payer_concept_id bigint DEFAULT NULL,
  payer_source_value varchar(150) DEFAULT NULL,
  payer_source_concept_id bigint DEFAULT NULL,
  plan_concept_id bigint DEFAULT NULL,
  plan_source_value varchar(150) DEFAULT NULL,
  plan_source_concept_id bigint DEFAULT NULL,
  sponsor_concept_id bigint DEFAULT NULL,
  sponsor_source_value varchar(150) DEFAULT NULL,
  sponsor_source_concept_id bigint DEFAULT NULL,
  family_source_value varchar(150) DEFAULT NULL,
  stop_reason_concept_id bigint DEFAULT NULL,
  stop_reason_source_value varchar(150) DEFAULT NULL,
  stop_reason_source_concept_id bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.person (
  person_id bigint NOT NULL,
  gender_concept_id bigint NOT NULL,
  year_of_birth bigint NOT NULL,
  month_of_birth bigint DEFAULT NULL,
  day_of_birth bigint DEFAULT NULL,
  birth_datetime datetime DEFAULT NULL,
  race_concept_id bigint NOT NULL,
  ethnicity_concept_id bigint NOT NULL,
  location_id bigint DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  care_site_id bigint DEFAULT NULL,
  person_source_value varchar(50) DEFAULT NULL,
  gender_source_value varchar(50) DEFAULT NULL,
  gender_source_concept_id bigint DEFAULT NULL,
  race_source_value varchar(50) DEFAULT NULL,
  race_source_concept_id bigint DEFAULT NULL,
  ethnicity_source_value varchar(50) DEFAULT NULL,
  ethnicity_source_concept_id bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.procedure_occurrence (
  procedure_occurrence_id bigint NOT NULL,
  person_id bigint NOT NULL,
  procedure_concept_id bigint NOT NULL,
  procedure_date date NOT NULL,
  procedure_datetime datetime DEFAULT NULL,
  procedure_end_date date DEFAULT NULL,
  procedure_end_datetime datetime DEFAULT NULL,
  procedure_type_concept_id bigint NOT NULL,
  modifier_concept_id bigint DEFAULT NULL,
  quantity bigint DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint DEFAULT NULL,
  visit_detail_id bigint DEFAULT NULL,
  procedure_source_value varchar(500) DEFAULT NULL,
  procedure_source_concept_id bigint DEFAULT NULL,
  modifier_source_value varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.provider (
  provider_id bigint NOT NULL,
  provider_name varchar(255) DEFAULT NULL,
  npi varchar(25) DEFAULT NULL,
  dea varchar(20) DEFAULT NULL,
  specialty_concept_id bigint DEFAULT NULL,
  care_site_id bigint DEFAULT NULL,
  year_of_birth bigint DEFAULT NULL,
  gender_concept_id bigint DEFAULT NULL,
  provider_source_value varchar(100) DEFAULT NULL,
  specialty_source_value varchar(100) DEFAULT NULL,
  specialty_source_concept_id bigint DEFAULT NULL,
  gender_source_value varchar(50) DEFAULT NULL,
  gender_source_concept_id bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.relationship (
  relationship_id varchar(20) DEFAULT NULL,
  relationship_name varchar(255) DEFAULT NULL,
  is_hierarchical varchar(1) DEFAULT NULL,
  defines_ancestry varchar(1) DEFAULT NULL,
  reverse_relationship_id varchar(20) DEFAULT NULL,
  relationship_concept_id bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.source_to_concept_map (
  source_code varchar(255) DEFAULT NULL,
  source_concept_id bigint NOT NULL,
  source_vocabulary_id varchar(50) DEFAULT NULL,
  source_code_description varchar(255) DEFAULT NULL,
  target_concept_id bigint NOT NULL,
  target_vocabulary_id varchar(50) DEFAULT NULL,
  valid_start_date date NOT NULL,
  valid_end_date date NOT NULL,
  invalid_reason varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.specimen (
  specimen_id bigint NOT NULL,
  person_id bigint NOT NULL,
  specimen_concept_id bigint NOT NULL,
  specimen_type_concept_id bigint NOT NULL,
  specimen_date date NOT NULL,
  specimen_datetime datetime DEFAULT NULL,
  quantity float DEFAULT NULL,
  unit_concept_id bigint DEFAULT NULL,
  anatomic_site_concept_id bigint DEFAULT NULL,
  disease_status_concept_id bigint DEFAULT NULL,
  specimen_source_id varchar(50) DEFAULT NULL,
  specimen_source_value varchar(50) DEFAULT NULL,
  unit_source_value varchar(50) DEFAULT NULL,
  anatomic_site_source_value varchar(50) DEFAULT NULL,
  disease_status_source_value varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.visit_detail (
  visit_detail_id bigint NOT NULL,
  person_id bigint NOT NULL,
  visit_detail_concept_id bigint NOT NULL,
  visit_detail_start_date date NOT NULL,
  visit_detail_start_datetime datetime DEFAULT NULL,
  visit_detail_end_date date NOT NULL,
  visit_detail_end_datetime datetime DEFAULT NULL,
  visit_detail_type_concept_id bigint NOT NULL,
  provider_id bigint DEFAULT NULL,
  care_site_id bigint DEFAULT NULL,
  admitted_from_concept_id bigint DEFAULT NULL,
  discharged_to_concept_id bigint DEFAULT NULL,
  preceding_visit_detail_id bigint DEFAULT NULL,
  visit_detail_source_value varchar(150) DEFAULT NULL,
  visit_detail_source_concept_id bigint DEFAULT NULL,
  admitted_from_source_value varchar(150) DEFAULT NULL,
  discharged_to_source_value varchar(150) DEFAULT NULL,
  parent_visit_detail_id bigint DEFAULT NULL,
  visit_occurrence_id bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.visit_occurrence (
  visit_occurrence_id bigint NOT NULL,
  person_id bigint NOT NULL,
  visit_concept_id bigint NOT NULL,
  visit_start_date date NOT NULL,
  visit_start_datetime datetime DEFAULT NULL,
  visit_end_date date NOT NULL,
  visit_end_datetime datetime DEFAULT NULL,
  visit_type_concept_id bigint NOT NULL,
  provider_id bigint DEFAULT NULL,
  care_site_id bigint DEFAULT NULL,
  visit_source_value varchar(150) DEFAULT NULL,
  visit_source_concept_id bigint DEFAULT NULL,
  admitted_from_concept_id bigint DEFAULT NULL,
  admitted_from_source_value varchar(150) DEFAULT NULL,
  discharged_to_concept_id bigint DEFAULT NULL,
  discharged_to_source_value varchar(150) DEFAULT NULL,
  preceding_visit_occurrence_id bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.vocabulary (
  vocabulary_id varchar(20) DEFAULT NULL,
  vocabulary_name varchar(255) DEFAULT NULL,
  vocabulary_reference varchar(255) DEFAULT NULL,
  vocabulary_version varchar(255) DEFAULT NULL,
  vocabulary_concept_id bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;