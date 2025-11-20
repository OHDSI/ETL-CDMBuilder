CREATE TABLE {sc}.care_site (
  care_site_id bigint NOT NULL,
  care_site_name varchar(255) DEFAULT NULL,
  place_of_service_concept_id int DEFAULT NULL,
  location_id bigint DEFAULT NULL,
  care_site_source_value varchar(50) DEFAULT NULL,
  place_of_service_source_value varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.cdm_domain_meta (
  domain_id varchar(20) DEFAULT NULL,
  description varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.cdm_source (
  cdm_source_name varchar(255) DEFAULT NULL,
  cdm_source_abbreviation varchar(25) DEFAULT NULL,
  cdm_holder varchar(255) DEFAULT NULL,
  source_description text,
  source_documentation_reference varchar(255) DEFAULT NULL,
  cdm_etl_reference varchar(255) DEFAULT NULL,
  source_release_date date DEFAULT NULL,
  cdm_release_date date DEFAULT NULL,
  cdm_version varchar(10) DEFAULT NULL,
  vocabulary_version varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.cohort (
  cohort_definition_id int NOT NULL,
  subject_id int NOT NULL,
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
  cohort_definition_id int NOT NULL,
  cohort_definition_name varchar(255) DEFAULT NULL,
  cohort_definition_description text,
  definition_type_concept_id int NOT NULL,
  cohort_definition_syntax text,
  subject_concept_id int NOT NULL,
  cohort_initiation_date date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.condition_era (
  condition_era_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  condition_concept_id int NOT NULL,
  condition_era_start_date date NOT NULL,
  condition_era_end_date date NOT NULL,
  condition_occurrence_count int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.condition_occurrence (
  condition_occurrence_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  condition_concept_id int NOT NULL,
  condition_start_date date NOT NULL,
  condition_start_datetime datetime DEFAULT NULL,
  condition_end_date date DEFAULT NULL,
  condition_end_datetime datetime DEFAULT NULL,
  condition_type_concept_id int NOT NULL,
  stop_reason varchar(20) DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint unsigned DEFAULT NULL,
  visit_detail_id bigint unsigned DEFAULT NULL,
  condition_status_concept_id int DEFAULT NULL,
  condition_source_value varchar(50) DEFAULT NULL,
  condition_source_concept_id int DEFAULT NULL,
  condition_status_source_value varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.cost (
  cost_id bigint unsigned NOT NULL,
  cost_event_id bigint unsigned NOT NULL,
  cost_domain_id varchar(20) DEFAULT NULL,
  cost_type_concept_id int NOT NULL,
  currency_concept_id int DEFAULT NULL,
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
  payer_plan_period_id bigint unsigned DEFAULT NULL,
  amount_allowed decimal(38,2) DEFAULT NULL,
  revenue_code_concept_id int DEFAULT NULL,
  revenue_code_source_value varchar(50) DEFAULT NULL,
  drg_concept_id int DEFAULT NULL,
  drg_source_value varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.death (
  person_id bigint NOT NULL,
  death_date date NOT NULL,
  death_datetime datetime DEFAULT NULL,
  death_type_concept_id int NOT NULL,
  cause_concept_id int DEFAULT NULL,
  cause_source_value varchar(50) DEFAULT NULL,
  cause_source_concept_id int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.device_exposure (
  device_exposure_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  device_concept_id int NOT NULL,
  device_exposure_start_date date NOT NULL,
  device_exposure_start_datetime datetime DEFAULT NULL,
  device_exposure_end_date date DEFAULT NULL,
  device_exposure_end_datetime datetime DEFAULT NULL,
  device_type_concept_id int NOT NULL,
  unique_device_id varchar(50) DEFAULT NULL,
  quantity int DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint unsigned DEFAULT NULL,
  visit_detail_id bigint unsigned DEFAULT NULL,
  device_source_value varchar(100) DEFAULT NULL,
  device_source_concept_id int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.dose_era (
  dose_era_id bigint unsigned NOT NULL,
  person_id int NOT NULL,
  drug_concept_id int NOT NULL,
  unit_concept_id int NOT NULL,
  dose_value decimal(38,2) DEFAULT NULL,
  dose_era_start_date date NOT NULL,
  dose_era_end_date date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.drug_era (
  drug_era_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  drug_concept_id int NOT NULL,
  drug_era_start_date date NOT NULL,
  drug_era_end_date date NOT NULL,
  drug_exposure_count int DEFAULT NULL,
  gap_days int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.drug_exposure (
  drug_exposure_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  drug_concept_id int NOT NULL,
  drug_exposure_start_date date NOT NULL,
  drug_exposure_start_datetime datetime DEFAULT NULL,
  drug_exposure_end_date date NOT NULL,
  drug_exposure_end_datetime datetime DEFAULT NULL,
  verbatim_end_date date DEFAULT NULL,
  drug_type_concept_id int NOT NULL,
  stop_reason varchar(20) DEFAULT NULL,
  refills int DEFAULT NULL,
  quantity decimal(38,2) DEFAULT NULL,
  days_supply int DEFAULT NULL,
  sig text,
  route_concept_id int DEFAULT NULL,
  lot_number varchar(50) DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint unsigned DEFAULT NULL,
  visit_detail_id bigint unsigned DEFAULT NULL,
  drug_source_value varchar(50) DEFAULT NULL,
  drug_source_concept_id int DEFAULT NULL,
  route_source_value varchar(50) DEFAULT NULL,
  dose_unit_source_value varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.fact_relationship (
  domain_concept_id_1 int NOT NULL,
  fact_id_1 int NOT NULL,
  domain_concept_id_2 int NOT NULL,
  fact_id_2 int NOT NULL,
  relationship_concept_id int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.location (
  location_id bigint NOT NULL,
  address_1 varchar(50) DEFAULT NULL,
  address_2 varchar(50) DEFAULT NULL,
  city varchar(50) DEFAULT NULL,
  state varchar(2) DEFAULT NULL,
  zip varchar(9) DEFAULT NULL,
  county varchar(20) DEFAULT NULL,
  location_source_value varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.measurement (
  measurement_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  measurement_concept_id int NOT NULL,
  measurement_date date NOT NULL,
  measurement_datetime datetime DEFAULT NULL,
  measurement_time varchar(10) DEFAULT NULL,
  measurement_type_concept_id int NOT NULL,
  operator_concept_id int DEFAULT NULL,
  value_as_number decimal(38,2) DEFAULT NULL,
  value_as_concept_id int DEFAULT NULL,
  unit_concept_id int DEFAULT NULL,
  range_low decimal(38,2) DEFAULT NULL,
  range_high decimal(38,2) DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint unsigned DEFAULT NULL,
  visit_detail_id bigint unsigned DEFAULT NULL,
  measurement_source_value varchar(100) DEFAULT NULL,
  measurement_source_concept_id int DEFAULT NULL,
  unit_source_value varchar(50) DEFAULT NULL,
  value_source_value varchar(2500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.metadata (
  metadata_concept_id int NOT NULL,
  metadata_type_concept_id int NOT NULL,
  name varchar(250) DEFAULT NULL,
  value_as_string text,
  value_as_concept_id int DEFAULT NULL,
  metadata_date date DEFAULT NULL,
  metadata_datetime datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.metadata_tmp (
  person_id bigint NOT NULL,
  name varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.note (
  note_id bigint unsigned NOT NULL,
  person_id int NOT NULL,
  note_date date NOT NULL,
  note_datetime datetime DEFAULT NULL,
  note_type_concept_id int NOT NULL,
  note_class_concept_id int NOT NULL,
  note_title varchar(250) DEFAULT NULL,
  note_text text,
  encoding_concept_id int NOT NULL,
  language_concept_id int NOT NULL,
  provider_id int DEFAULT NULL,
  visit_occurrence_id int DEFAULT NULL,
  visit_detail_id int DEFAULT NULL,
  note_source_value varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.note_nlp (
  note_nlp_id bigint unsigned NOT NULL,
  note_id int NOT NULL,
  section_concept_id int DEFAULT NULL,
  snippet varchar(250) DEFAULT NULL,
  offset varchar(250) DEFAULT NULL,
  lexical_variant varchar(250) DEFAULT NULL,
  note_nlp_concept_id int DEFAULT NULL,
  note_nlp_source_concept_id int DEFAULT NULL,
  nlp_system varchar(250) DEFAULT NULL,
  nlp_date date NOT NULL,
  nlp_datetime datetime DEFAULT NULL,
  term_exists varchar(1) DEFAULT NULL,
  term_temporal varchar(50) DEFAULT NULL,
  term_modifiers varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.observation (
  observation_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  observation_concept_id int NOT NULL,
  observation_date date NOT NULL,
  observation_datetime datetime DEFAULT NULL,
  observation_type_concept_id int NOT NULL,
  value_as_number decimal(38,2) DEFAULT NULL,
  value_as_string varchar(2000) DEFAULT NULL,
  value_as_concept_id int DEFAULT NULL,
  qualifier_concept_id int DEFAULT NULL,
  unit_concept_id int DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint unsigned DEFAULT NULL,
  visit_detail_id bigint unsigned DEFAULT NULL,
  observation_source_value varchar(250) DEFAULT NULL,
  observation_source_concept_id int DEFAULT NULL,
  unit_source_value varchar(250) DEFAULT NULL,
  qualifier_source_value varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.observation_period (
  observation_period_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  observation_period_start_date date NOT NULL,
  observation_period_end_date date NOT NULL,
  period_type_concept_id int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.payer_plan_period (
  payer_plan_period_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  payer_plan_period_start_date date NOT NULL,
  payer_plan_period_end_date date NOT NULL,
  payer_concept_id int DEFAULT NULL,
  payer_source_value varchar(50) DEFAULT NULL,
  payer_source_concept_id int DEFAULT NULL,
  plan_concept_id int DEFAULT NULL,
  plan_source_value varchar(50) DEFAULT NULL,
  plan_source_concept_id int DEFAULT NULL,
  sponsor_concept_id int DEFAULT NULL,
  sponsor_source_value varchar(50) DEFAULT NULL,
  sponsor_source_concept_id int DEFAULT NULL,
  family_source_value varchar(50) DEFAULT NULL,
  stop_reason_concept_id int DEFAULT NULL,
  stop_reason_source_value varchar(50) DEFAULT NULL,
  stop_reason_source_concept_id int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.person (
  person_id bigint NOT NULL,
  gender_concept_id int NOT NULL,
  year_of_birth int NOT NULL,
  month_of_birth int DEFAULT NULL,
  day_of_birth int DEFAULT NULL,
  birth_datetime datetime DEFAULT NULL,
  race_concept_id int NOT NULL,
  ethnicity_concept_id int NOT NULL,
  location_id bigint DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  care_site_id bigint DEFAULT NULL,
  person_source_value varchar(50) DEFAULT NULL,
  gender_source_value varchar(50) DEFAULT NULL,
  gender_source_concept_id int DEFAULT NULL,
  race_source_value varchar(50) DEFAULT NULL,
  race_source_concept_id int DEFAULT NULL,
  ethnicity_source_value varchar(50) DEFAULT NULL,
  ethnicity_source_concept_id int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.procedure_occurrence (
  procedure_occurrence_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  procedure_concept_id int NOT NULL,
  procedure_date date NOT NULL,
  procedure_datetime datetime DEFAULT NULL,
  procedure_type_concept_id int NOT NULL,
  modifier_concept_id int DEFAULT NULL,
  quantity int DEFAULT NULL,
  provider_id bigint DEFAULT NULL,
  visit_occurrence_id bigint unsigned DEFAULT NULL,
  visit_detail_id bigint unsigned DEFAULT NULL,
  procedure_source_value varchar(50) DEFAULT NULL,
  procedure_source_concept_id int DEFAULT NULL,
  modifier_source_value varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.provider (
  provider_id bigint NOT NULL,
  provider_name varchar(255) DEFAULT NULL,
  npi varchar(20) DEFAULT NULL,
  dea varchar(20) DEFAULT NULL,
  specialty_concept_id int DEFAULT NULL,
  care_site_id int DEFAULT NULL,
  year_of_birth int DEFAULT NULL,
  gender_concept_id int DEFAULT NULL,
  provider_source_value varchar(50) DEFAULT NULL,
  specialty_source_value varchar(50) DEFAULT NULL,
  specialty_source_concept_id int DEFAULT NULL,
  gender_source_value varchar(50) DEFAULT NULL,
  gender_source_concept_id int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.specimen (
  specimen_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  specimen_concept_id int NOT NULL,
  specimen_type_concept_id int NOT NULL,
  specimen_date date NOT NULL,
  specimen_datetime datetime DEFAULT NULL,
  quantity decimal(38,2) DEFAULT NULL,
  unit_concept_id int DEFAULT NULL,
  anatomic_site_concept_id int DEFAULT NULL,
  disease_status_concept_id int DEFAULT NULL,
  specimen_source_id varchar(50) DEFAULT NULL,
  specimen_source_value varchar(50) DEFAULT NULL,
  unit_source_value varchar(50) DEFAULT NULL,
  anatomic_site_source_value varchar(50) DEFAULT NULL,
  disease_status_source_value varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.visit_detail (
  visit_detail_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  visit_detail_concept_id int NOT NULL,
  visit_detail_start_date date NOT NULL,
  visit_detail_start_datetime datetime DEFAULT NULL,
  visit_detail_end_date date NOT NULL,
  visit_detail_end_datetime datetime DEFAULT NULL,
  visit_detail_type_concept_id int NOT NULL,
  provider_id bigint DEFAULT NULL,
  care_site_id bigint DEFAULT NULL,
  admitting_source_concept_id int DEFAULT NULL,
  discharge_to_concept_id int DEFAULT NULL,
  preceding_visit_detail_id bigint unsigned DEFAULT NULL,
  visit_detail_source_value varchar(50) DEFAULT NULL,
  visit_detail_source_concept_id int DEFAULT NULL,
  admitting_source_value varchar(50) DEFAULT NULL,
  discharge_to_source_value varchar(50) DEFAULT NULL,
  visit_detail_parent_id bigint unsigned DEFAULT NULL,
  visit_occurrence_id bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE {sc}.visit_occurrence (
  visit_occurrence_id bigint unsigned NOT NULL,
  person_id bigint NOT NULL,
  visit_concept_id int NOT NULL,
  visit_start_date date NOT NULL,
  visit_start_datetime datetime DEFAULT NULL,
  visit_end_date date NOT NULL,
  visit_end_datetime datetime DEFAULT NULL,
  visit_type_concept_id int NOT NULL,
  provider_id bigint DEFAULT NULL,
  care_site_id bigint DEFAULT NULL,
  visit_source_value varchar(50) DEFAULT NULL,
  visit_source_concept_id int DEFAULT NULL,
  admitting_source_concept_id int DEFAULT NULL,
  admitting_source_value varchar(50) DEFAULT NULL,
  discharge_to_concept_id int DEFAULT NULL,
  discharge_to_source_value varchar(50) DEFAULT NULL,
  preceding_visit_occurrence_id bigint unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;