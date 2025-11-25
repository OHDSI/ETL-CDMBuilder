CREATE TABLE {sc}.care_site (
care_site_id int8 NOT NULL,
care_site_name varchar(255) NULL,
place_of_service_concept_id int8 NULL,
location_id int8 NULL,
care_site_source_value varchar(150) NULL,
place_of_service_source_value varchar(150) NULL
);

CREATE TABLE {sc}.cdm_source (
cdm_source_name varchar(255) NOT NULL,
cdm_source_abbreviation varchar(30) NULL,
cdm_holder varchar(255) NULL,
source_description varchar(65535) NULL,
source_documentation_reference varchar(255) NULL,
cdm_etl_reference varchar(255) NULL,
source_release_date date NULL,
cdm_release_date date NULL,
cdm_version varchar(10) NULL,
cdm_version_concept_id int8 NOT NULL,
vocabulary_version varchar(20) NULL
);

CREATE TABLE {sc}.cohort (
cohort_definition_id int8 NOT NULL,
subject_id int8 NOT NULL,
cohort_start_date date NOT NULL,
cohort_end_date date NOT NULL
);

CREATE TABLE {sc}.cohort_definition (
cohort_definition_id int8 NOT NULL,
cohort_definition_name varchar(255) NOT NULL,
cohort_definition_description varchar(65535) NULL,
definition_type_concept_id int8 NOT NULL,
cohort_definition_syntax varchar(65535) NULL,
subject_concept_id int8 NOT NULL,
cohort_initiation_date date NULL
);

CREATE TABLE {sc}.concept (
concept_id int8 NOT NULL,
concept_name varchar(500) NOT NULL,
domain_id varchar(20) NOT NULL,
vocabulary_id varchar(200) NOT NULL,
concept_class_id varchar(20) NOT NULL,
standard_concept varchar(1) NULL,
concept_code varchar(100) NOT NULL,
valid_start_date date NOT NULL,
valid_end_date date NOT NULL,
invalid_reason varchar(1) NULL
);

CREATE TABLE {sc}.concept_ancestor (
ancestor_concept_id int8 NOT NULL,
descendant_concept_id int8 NOT NULL,
min_levels_of_separation int4 NOT NULL,
max_levels_of_separation int4 NOT NULL
);

CREATE TABLE {sc}.concept_class (
concept_class_id varchar(20) NOT NULL,
concept_class_name varchar(255) NOT NULL,
concept_class_concept_id int8 NOT NULL
);

 CREATE TABLE {sc}.concept_relationship (
concept_id_1 int8 NOT NULL,
concept_id_2 int8 NOT NULL,
relationship_id varchar(20) NOT NULL,
valid_start_date date NOT NULL,
valid_end_date date NOT NULL,
invalid_reason varchar(1) NULL
);

CREATE TABLE {sc}.concept_synonym (
concept_id int8 NOT NULL,
concept_synonym_name varchar(1500) NOT NULL,
language_concept_id int8 NOT NULL
);

CREATE TABLE {sc}.condition_era (
condition_era_id int8 NOT NULL,
person_id int8 NOT NULL,
condition_concept_id int8 NOT NULL,
condition_era_start_date date NOT NULL,
condition_era_end_date date NOT NULL,
condition_occurrence_count int4 NULL
);

CREATE TABLE {sc}.condition_occurrence (
condition_occurrence_id int8 NOT NULL,
person_id int8 NOT NULL,
condition_concept_id int8 NOT NULL,
condition_start_date date NOT NULL,
condition_start_datetime timestamp NULL,
condition_end_date date NULL,
condition_end_datetime timestamp NULL,
condition_type_concept_id int8 NOT NULL,
stop_reason varchar(20) NULL,
provider_id int8 NULL,
visit_occurrence_id int8 NULL,
visit_detail_id int8 NULL,
condition_status_concept_id int8 NULL,
condition_source_value varchar(65535) NULL,
condition_source_concept_id int8 NULL,
condition_status_source_value varchar(65535) NULL
);

CREATE TABLE {sc}."cost" (
cost_id int8 NOT NULL,
cost_event_id int8 NOT NULL,
cost_domain_id varchar(20) NOT NULL,
cost_type_concept_id int8 NOT NULL,
currency_concept_id int8 NULL,
total_charge numeric(38,2) NULL,
total_cost numeric(38,2) NULL,
total_paid numeric(38,2) NULL,
paid_by_payer numeric(38,2) NULL,
paid_by_patient numeric(38,2) NULL,
paid_patient_copay numeric(38,2) NULL,
paid_patient_coinsurance numeric(38,2) NULL,
paid_patient_deductible numeric(38,2) NULL,
paid_by_primary numeric(38,2) NULL,
paid_ingredient_cost numeric(38,2) NULL,
paid_dispensing_fee numeric(38,2) NULL,
payer_plan_period_id int8 NULL,
amount_allowed numeric(38,2) NULL,
revenue_code_concept_id int8 NULL,
revenue_code_source_value varchar(50) NULL,
drg_concept_id int8 NULL,
drg_source_value varchar(3) NULL
);

CREATE TABLE {sc}.death (
person_id int8 NOT NULL,
death_date date NOT NULL,
death_datetime timestamp NULL,
death_type_concept_id int8 NOT NULL,
cause_concept_id int8 NULL,
cause_source_value varchar(50) NULL,
cause_source_concept_id int8 NULL
);

CREATE TABLE {sc}.device_exposure (
device_exposure_id int8 NOT NULL,
person_id int8 NOT NULL,
device_concept_id int8 NOT NULL,
device_exposure_start_date date NOT NULL,
device_exposure_start_datetime timestamp NULL,
device_exposure_end_date date NULL,
device_exposure_end_datetime timestamp NULL,
device_type_concept_id int8 NOT NULL,
unique_device_id varchar(50) NULL,
production_id varchar(255) NULL,
quantity int4 NULL,
provider_id int8 NULL,
visit_occurrence_id int8 NULL,
visit_detail_id int8 NULL,
device_source_value varchar(255) NULL,
device_source_concept_id int8 NULL,
unit_concept_id int8 NULL,
unit_source_value varchar(255) NULL,
unit_source_concept_id int8 NULL
);

CREATE TABLE {sc}."domain" (
domain_id varchar(20) NOT NULL,
domain_name varchar(255) NOT NULL,
domain_concept_id int8 NOT NULL
);

CREATE TABLE {sc}.dose_era (
dose_era_id int8 NOT NULL,
person_id int8 NOT NULL,
drug_concept_id int8 NOT NULL,
unit_concept_id int8 NOT NULL,
dose_value numeric(38,2) NOT NULL,
dose_era_start_date date NOT NULL,
dose_era_end_date date NOT NULL
);

CREATE TABLE {sc}.drug_era (
drug_era_id int8 NOT NULL,
person_id int8 NOT NULL,
drug_concept_id int8 NOT NULL,
drug_era_start_date date NOT NULL,
drug_era_end_date date NOT NULL,
drug_exposure_count int4 NULL,
gap_days int4 NULL
);

CREATE TABLE {sc}.drug_exposure (
drug_exposure_id int8 NOT NULL,
person_id int8 NOT NULL,
drug_concept_id int8 NOT NULL,
drug_exposure_start_date date NOT NULL,
drug_exposure_start_datetime timestamp NULL,
drug_exposure_end_date date NULL,
drug_exposure_end_datetime timestamp NULL,
verbatim_end_date date NULL,
drug_type_concept_id int8 NOT NULL,
stop_reason varchar(20) NULL,
refills int4 NULL,
quantity numeric(38,2) NULL,
days_supply int4 NULL,
sig varchar(65535) NULL,
route_concept_id int8 NULL,
lot_number varchar(65535) NULL,
provider_id int8 NULL,
visit_occurrence_id int8 NULL,
visit_detail_id int8 NULL,
drug_source_value varchar(65535) NULL,
drug_source_concept_id int8 NULL,
route_source_value varchar(65535) NULL,
dose_unit_source_value varchar(65535) NULL
);

CREATE TABLE {sc}.drug_strength (
drug_concept_id int8 NOT NULL,
ingredient_concept_id int8 NOT NULL,
amount_value float8 NULL,
amount_unit_concept_id int8 NULL,
numerator_value float8 NULL,
numerator_unit_concept_id int8 NULL,
denominator_value float8 NULL,
denominator_unit_concept_id int8 NULL,
box_size int4 NULL,
valid_start_date date NOT NULL,
valid_end_date date NOT NULL,
invalid_reason varchar(1) NULL
);
 
 CREATE TABLE {sc}.episode (
episode_id int8 NOT NULL,
person_id int8 NOT NULL,
episode_concept_id int8 NOT NULL,
episode_start_date date NOT NULL,
episode_start_datetime timestamp NULL,
episode_end_date date NULL,
episode_end_datetime timestamp NULL,
episode_parent_id int8 NULL,
episode_number int4 NULL,
episode_object_concept_id int8 NOT NULL,
episode_type_concept_id int8 NOT NULL,
episode_source_value varchar(250) NULL,
episode_source_concept_id int8 NULL
);

CREATE TABLE {sc}.episode_event (
episode_id int8 NOT NULL,
event_id int8 NOT NULL,
episode_event_field_concept_id int8 NOT NULL
);

CREATE TABLE {sc}.fact_relationship (
domain_concept_id_1 int8 NOT NULL,
fact_id_1 int8 NOT NULL,
domain_concept_id_2 int8 NOT NULL,
fact_id_2 int8 NOT NULL,
relationship_concept_id int8 NOT NULL
);

CREATE TABLE {sc}."location" (
location_id int8 NOT NULL,
address_1 varchar(50) NULL,
address_2 varchar(50) NULL,
city varchar(50) NULL,
state varchar(25) NULL,
zip varchar(9) NULL,
county varchar(20) NULL,
location_source_value varchar(50) NULL,
country_concept_id int8 NULL,
country_source_value varchar(150) NULL,
latitude numeric(38,2) NULL,
longitude numeric(38,2) NULL
);

CREATE TABLE {sc}.measurement (
measurement_id int8 NOT NULL,
person_id int8 NOT NULL,
measurement_concept_id int8 NOT NULL,
measurement_date date NOT NULL,
measurement_datetime timestamp NULL,
measurement_time varchar(50) NULL,
measurement_type_concept_id int8 NOT NULL,
operator_concept_id int8 NULL,
value_as_number numeric(38,2) NULL,
value_as_concept_id int8 NULL,
unit_concept_id int8 NULL,
range_low numeric(38,2) NULL,
range_high numeric(38,2) NULL,
provider_id int8 NULL,
visit_occurrence_id int8 NULL,
visit_detail_id int8 NULL,
measurement_source_value varchar(65535) NULL,
measurement_source_concept_id int8 NULL,
unit_source_value varchar(65535) NULL,
unit_source_concept_id int8 NULL,
value_source_value varchar(65535) NULL,
measurement_event_id int8 NULL,
meas_event_field_concept_id int8 NULL
);

CREATE TABLE {sc}.metadata (
metadata_id int8 NOT NULL,
metadata_concept_id int8 NOT NULL,
metadata_type_concept_id int8 NOT NULL,
name varchar(250) NOT NULL,
value_as_string varchar(65535) NULL,
value_as_concept_id int8 NULL,
value_as_number numeric(38,2) NULL,
metadata_date date NULL,
metadata_datetime timestamp NULL
);

CREATE TABLE {sc}.metadata_tmp (
person_id int8 NOT NULL,
name varchar(250) NOT NULL
);

CREATE TABLE {sc}.note (
note_id int8 NOT NULL,
person_id int8 NOT NULL,
note_date date NOT NULL,
note_datetime timestamp NULL,
note_type_concept_id int8 NOT NULL,
note_text varchar(65535) NULL,
provider_id int8 NULL,
visit_occurrence_id int8 NULL,
visit_detail_id int8 NULL,
note_source_value varchar(50) NULL,
note_class_concept_id int8 NOT NULL,
note_title varchar(250) NULL,
encoding_concept_id int8 NOT NULL,
language_concept_id int8 NOT NULL,
note_event_id int8 NULL,
note_event_field_concept_id int8 NULL
);

CREATE TABLE {sc}.note_nlp (
note_nlp_id int8 NOT NULL,
note_id int8 NOT NULL,
section_concept_id int8 NULL,
snippet varchar(250) NULL,
"offset" varchar(250) NULL,
lexical_variant varchar(250) NOT NULL,
note_nlp_concept_id int8 NULL,
note_nlp_source_concept_id int8 NULL,
nlp_system varchar(250) NULL,
nlp_date date NOT NULL,
nlp_datetime timestamp NULL,
term_exists varchar(1) NULL,
term_temporal varchar(50) NULL,
term_modifiers varchar(2000) NULL
);

CREATE TABLE {sc}.observation (
observation_id int8 NOT NULL,
person_id int8 NOT NULL,
observation_concept_id int8 NOT NULL,
observation_date date NOT NULL,
observation_datetime timestamp NULL,
observation_type_concept_id int8 NOT NULL,
value_as_number numeric(38,2) NULL,
value_as_string varchar(65535) NULL,
value_as_concept_id int8 NULL,
qualifier_concept_id int8 NULL,
unit_concept_id int8 NULL,
provider_id int8 NULL,
visit_occurrence_id int8 NULL,
visit_detail_id int8 NULL,
observation_source_value varchar(65535) NULL,
observation_source_concept_id int8 NULL,
unit_source_value varchar(65535) NULL,
qualifier_source_value varchar(65535) NULL,
value_source_value varchar(700) NULL,
observation_event_id int8 NULL,
obs_event_field_concept_id int8 NULL
);

CREATE TABLE {sc}.observation_period (
observation_period_id int8 NOT NULL,
person_id int8 NOT NULL,
observation_period_start_date date NOT NULL,
observation_period_end_date date NOT NULL,
period_type_concept_id int8 NOT NULL
);

CREATE TABLE {sc}.payer_plan_period (
payer_plan_period_id int8 NOT NULL,
person_id int8 NOT NULL,
payer_plan_period_start_date date NOT NULL,
payer_plan_period_end_date date NOT NULL,
payer_concept_id int8 NULL,
payer_source_value varchar(150) NULL,
payer_source_concept_id int8 NULL,
plan_concept_id int8 NULL,
plan_source_value varchar(150) NULL,
plan_source_concept_id int8 NULL,
sponsor_concept_id int8 NULL,
sponsor_source_value varchar(150) NULL,
sponsor_source_concept_id int8 NULL,
family_source_value varchar(150) NULL,
stop_reason_concept_id int8 NULL,
stop_reason_source_value varchar(150) NULL,
stop_reason_source_concept_id int8 NULL
);

CREATE TABLE {sc}.person (
person_id int8 NOT NULL,
gender_concept_id int8 NOT NULL,
year_of_birth int4 NOT NULL,
month_of_birth int4 NULL,
day_of_birth int4 NULL,
birth_datetime timestamp NULL,
race_concept_id int8 NOT NULL,
ethnicity_concept_id int8 NOT NULL,
location_id int8 NULL,
provider_id int8 NULL,
care_site_id int8 NULL,
person_source_value varchar(50) NULL,
gender_source_value varchar(50) NULL,
gender_source_concept_id int8 NULL,
race_source_value varchar(50) NULL,
race_source_concept_id int8 NULL,
ethnicity_source_value varchar(50) NULL,
ethnicity_source_concept_id int8 NULL
);

CREATE TABLE {sc}.procedure_occurrence (
procedure_occurrence_id int8 NOT NULL,
person_id int8 NOT NULL,
procedure_concept_id int8 NOT NULL,
procedure_date date NOT NULL,
procedure_datetime timestamp NULL,
procedure_end_date date NULL,
procedure_end_datetime timestamp NULL,
procedure_type_concept_id int8 NOT NULL,
modifier_concept_id int8 NULL,
quantity int4 NULL,
provider_id int8 NULL,
visit_occurrence_id int8 NULL,
visit_detail_id int8 NULL,
procedure_source_value varchar(500) NULL,
procedure_source_concept_id int8 NULL,
modifier_source_value varchar(50) NULL
);

CREATE TABLE {sc}.provider (
provider_id int8 NOT NULL,
provider_name varchar(255) NULL,
npi varchar(25) NULL,
dea varchar(20) NULL,
specialty_concept_id int8 NULL,
care_site_id int8 NULL,
year_of_birth int4 NULL,
gender_concept_id int8 NULL,
provider_source_value varchar(100) NULL,
specialty_source_value varchar(100) NULL,
specialty_source_concept_id int8 NULL,
gender_source_value varchar(50) NULL,
gender_source_concept_id int8 NULL
);

CREATE TABLE {sc}.relationship (
relationship_id varchar(20) NOT NULL,
relationship_name varchar(255) NOT NULL,
is_hierarchical varchar(1) NOT NULL,
defines_ancestry varchar(1) NOT NULL,
reverse_relationship_id varchar(20) NOT NULL,
relationship_concept_id int8 NOT NULL
);

CREATE TABLE {sc}.source_to_concept_map (
source_code varchar(255) NULL,
source_concept_id int8 NOT NULL,
source_vocabulary_id varchar(50) NOT NULL,
source_code_description varchar(255) NULL,
target_concept_id int8 NOT NULL,
target_vocabulary_id varchar(50) NULL,
valid_start_date date NOT NULL,
valid_end_date date NOT NULL,
invalid_reason varchar(1) NULL
);

CREATE TABLE {sc}.specimen (
specimen_id int8 NOT NULL,
person_id int8 NOT NULL,
specimen_concept_id int8 NOT NULL,
specimen_type_concept_id int8 NOT NULL,
specimen_date date NOT NULL,
specimen_datetime timestamp NULL,
quantity float8 NULL,
unit_concept_id int8 NULL,
anatomic_site_concept_id int8 NULL,
disease_status_concept_id int8 NULL,
specimen_source_id varchar(50) NULL,
specimen_source_value varchar(50) NULL,
unit_source_value varchar(50) NULL,
anatomic_site_source_value varchar(50) NULL,
disease_status_source_value varchar(50) NULL
);

CREATE TABLE {sc}.visit_detail (
visit_detail_id int8 NOT NULL,
person_id int8 NOT NULL,
visit_detail_concept_id int8 NOT NULL,
visit_detail_start_date date NOT NULL,
visit_detail_start_datetime timestamp NULL,
visit_detail_end_date date NOT NULL,
visit_detail_end_datetime timestamp NULL,
visit_detail_type_concept_id int8 NOT NULL,
provider_id int8 NULL,
care_site_id int8 NULL,
admitted_from_concept_id int8 NULL,
discharged_to_concept_id int8 NULL,
preceding_visit_detail_id int8 NULL,
visit_detail_source_value varchar(150) NULL,
visit_detail_source_concept_id int8 NULL,
admitted_from_source_value varchar(150) NULL,
discharged_to_source_value varchar(150) NULL,
parent_visit_detail_id int8 NULL,
visit_occurrence_id int8 NOT NULL
);

CREATE TABLE {sc}.visit_occurrence (
visit_occurrence_id int8 NOT NULL,
person_id int8 NOT NULL,
visit_concept_id int8 NOT NULL,
visit_start_date date NOT NULL,
visit_start_datetime timestamp NULL,
visit_end_date date NOT NULL,
visit_end_datetime timestamp NULL,
visit_type_concept_id int8 NOT NULL,
provider_id int8 NULL,
care_site_id int8 NULL,
visit_source_value varchar(150) NULL,
visit_source_concept_id int8 NULL,
admitted_from_concept_id int8 NULL,
admitted_from_source_value varchar(150) NULL,
discharged_to_concept_id int8 NULL,
discharged_to_source_value varchar(150) NULL,
preceding_visit_occurrence_id int8 NULL
);

CREATE TABLE {sc}.vocabulary (
vocabulary_id varchar(20) NOT NULL,
vocabulary_name varchar(255) NOT NULL,
vocabulary_reference varchar(255) NULL,
vocabulary_version varchar(255) NULL,
vocabulary_concept_id int8 NOT NULL
);