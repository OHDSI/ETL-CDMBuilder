CREATE TABLE {sc}.attribute_definition
(
   attribute_definition_id int(11) NOT NULL,
   attribute_name varchar(255) NOT NULL,
   attribute_description      text,
   attribute_type_concept_id  int(11) NOT NULL,
   attribute_syntax           text
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.care_site
(
   care_site_id bigint(20) NOT NULL,
   care_site_name varchar(255),
   place_of_service_concept_id int(11),
   location_id bigint(20),
   care_site_source_value varchar(50),
   place_of_service_source_value varchar(50)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.cdm_domain_meta
(
   domain_id    varchar(20),
   description  varchar(4000)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.cdm_source
(
   cdm_source_name                 varchar(255)   NOT NULL,
   cdm_source_abbreviation         varchar(25),
   cdm_holder                      varchar(255),
   source_description              text,
   source_documentation_reference  varchar(255),
   cdm_etl_reference               varchar(255),
   source_release_date             date,
   cdm_release_date                date,
   cdm_version                     varchar(10),
   vocabulary_version              varchar(20)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.cohort
(
   cohort_definition_id  int(11)   NOT NULL,
   subject_id            int(11)   NOT NULL,
   cohort_start_date     date      NOT NULL,
   cohort_end_date       date      NOT NULL
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.cohort_attribute
(
   cohort_definition_id     int(11)   NOT NULL,
   subject_id               int(11)   NOT NULL,
   cohort_start_date        date      NOT NULL,
   cohort_end_date          date      NOT NULL,
   attribute_definition_id  int(11)   NOT NULL,
   value_as_number          DECIMAL(38,2),
   value_as_concept_id      int(11)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.cohort_definition
(
   cohort_definition_id           int(11)        NOT NULL,
   cohort_definition_name         varchar(255)   NOT NULL,
   cohort_definition_description  text,
   definition_type_concept_id     int(11)        NOT NULL,
   cohort_definition_syntax       text,
   subject_concept_id             int(11)        NOT NULL,
   cohort_initiation_date         date
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.condition_era
(
   condition_era_id            bigint(20) UNSIGNED NOT NULL,
   person_id                   bigint(20)    NOT NULL,
   condition_concept_id        int(11)   NOT NULL,
   condition_era_start_date    date      NOT NULL,
   condition_era_end_date      date      NOT NULL,
   condition_occurrence_count  int(11)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.condition_occurrence
(
   condition_occurrence_id        bigint(20) UNSIGNED NOT NULL,
   person_id                      bigint(20)        NOT NULL,
   condition_concept_id           int(11)       NOT NULL,
   condition_start_date           date          NOT NULL,
   condition_start_datetime       datetime,
   condition_end_date             date,
   condition_end_datetime         datetime,
   condition_type_concept_id      int(11)       NOT NULL,
   stop_reason                    varchar(20),
   provider_id                    bigint(20),
   visit_occurrence_id            bigint(20) UNSIGNED,
   visit_detail_id                bigint(20) UNSIGNED,
   condition_status_concept_id    int(11),
   condition_source_value         varchar(50),
   condition_source_concept_id    int(11),
   condition_status_source_value  varchar(50)
   
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.cost
(
   cost_id                    bigint(20) UNSIGNED        NOT NULL,
   cost_event_id              bigint(20) UNSIGNED       NOT NULL,
   cost_domain_id             varchar(20)   NOT NULL,
   cost_type_concept_id       int(11)       NOT NULL,
   currency_concept_id        int(11),
   total_charge               DECIMAL(38,2),
   total_cost                 DECIMAL(38,2),
   total_paid                 DECIMAL(38,2),
   paid_by_payer              DECIMAL(38,2),
   paid_by_patient            DECIMAL(38,2),
   paid_patient_copay         DECIMAL(38,2),
   paid_patient_coinsurance   DECIMAL(38,2),
   paid_patient_deductible    DECIMAL(38,2),
   paid_by_primary            DECIMAL(38,2),
   paid_ingredient_cost       DECIMAL(38,2),
   paid_dispensing_fee        DECIMAL(38,2),
   payer_plan_period_id       bigint(20) UNSIGNED,
   amount_allowed             DECIMAL(38,2),
   revenue_code_concept_id    int(11),
   revenue_code_source_value  varchar(50),
   drg_concept_id             int(11),
   drg_source_value           varchar(3)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.death
(
   person_id                bigint(20)        NOT NULL,
   death_date               date          NOT NULL,
   death_datetime           datetime,
   death_type_concept_id    int(11)       NOT NULL,
   cause_concept_id         int(11),
   cause_source_value       varchar(50),
   cause_source_concept_id  int(11)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.device_exposure
(
   device_exposure_id              bigint(20) UNSIGNED         NOT NULL,
   person_id                       bigint(20)         NOT NULL,
   device_concept_id               int(11)        NOT NULL,
   device_exposure_start_date      date           NOT NULL,
   device_exposure_start_datetime  datetime,
   device_exposure_end_date        date,
   device_exposure_end_datetime    datetime,
   device_type_concept_id          int(11)        NOT NULL,
   unique_device_id                varchar(50),
   quantity                        int(11),
   provider_id                     bigint(20),
   visit_occurrence_id             bigint(20) UNSIGNED,
   visit_detail_id                 bigint(20) UNSIGNED,
   device_source_value             varchar(100),
   device_source_concept_id        int(11)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.dose_era
(
   dose_era_id          bigint(20) UNSIGNED    NOT NULL,
   person_id            int(11)   NOT NULL,
   drug_concept_id      int(11)   NOT NULL,
   unit_concept_id      int(11)   NOT NULL,
   dose_value           DECIMAL(38,2)   NOT NULL,
   dose_era_start_date  date      NOT NULL,
   dose_era_end_date    date      NOT NULL
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.drug_era
(
   drug_era_id          bigint(20) UNSIGNED    NOT NULL,
   person_id            bigint(20)    NOT NULL,
   drug_concept_id      int(11)   NOT NULL,
   drug_era_start_date  date      NOT NULL,
   drug_era_end_date    date      NOT NULL,
   drug_exposure_count  int(11),
   gap_days             int(11)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.drug_exposure
(
   drug_exposure_id              bigint(20) UNSIGNED        NOT NULL,
   person_id                     bigint(20)        NOT NULL,
   drug_concept_id               int(11)       NOT NULL,
   drug_exposure_start_date      date          NOT NULL,
   drug_exposure_start_datetime  datetime,
   drug_exposure_end_date        date          NOT NULL,
   drug_exposure_end_datetime    datetime,
   verbatim_end_date             date,
   drug_type_concept_id          int(11)       NOT NULL,
   stop_reason                   varchar(20),
   refills                       int(11),
   quantity                      DECIMAL(38,2),
   days_supply                   int(11),
   sig                           text,
   route_concept_id              int(11),
   lot_number                    varchar(50),
   provider_id                   bigint(20),
   visit_occurrence_id           bigint(20) UNSIGNED,
   visit_detail_id               bigint(20) UNSIGNED,
   drug_source_value             varchar(50),
   drug_source_concept_id        int(11),
   route_source_value            varchar(50),
   dose_unit_source_value        varchar(50)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.fact_relationship
(
   domain_concept_id_1      int(11)   NOT NULL,
   fact_id_1                int(11)   NOT NULL,
   domain_concept_id_2      int(11)   NOT NULL,
   fact_id_2                int(11)   NOT NULL,
   relationship_concept_id  int(11)   NOT NULL
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.location
(
   location_id            bigint(20)        NOT NULL,
   address_1              varchar(50),
   address_2              varchar(50),
   city                   varchar(50),
   state                  varchar(2),
   zip                    varchar(9),
   county                 varchar(20),
   location_source_value  varchar(50)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.measurement
(
   measurement_id                 bigint(20) UNSIGNED          NOT NULL,
   person_id                      bigint(20)          NOT NULL,
   measurement_concept_id         int(11)         NOT NULL,
   measurement_date               date            NOT NULL,
   measurement_datetime           datetime,
   measurement_time               varchar(10),
   measurement_type_concept_id    int(11)         NOT NULL,
   operator_concept_id            int(11),
   value_as_number                DECIMAL(38,2),
   value_as_concept_id            int(11),
   unit_concept_id                int(11),
   range_low                      DECIMAL(38,2),
   range_high                     DECIMAL(38,2),
   provider_id                    bigint(20),
   visit_occurrence_id            bigint(20) UNSIGNED,
   visit_detail_id                bigint(20) UNSIGNED,
   measurement_source_value       varchar(100),
   measurement_source_concept_id  int(11),
   unit_source_value              varchar(50),
   value_source_value             varchar(2500)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.metadata
(
   metadata_concept_id       int(11)        NOT NULL,
   metadata_type_concept_id  int(11)        NOT NULL,
   name                      varchar(250)   NOT NULL,
   value_as_string           text,
   value_as_concept_id       int(11),
   metadata_date             date,
   metadata_datetime         datetime
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.metadata_tmp
(
   person_id  bigint(20)         NOT NULL,
   name       varchar(250)   NOT NULL
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.note
(
   note_id                bigint(20) UNSIGNED        NOT NULL,
   person_id              int(11)        NOT NULL,
   note_date              date           NOT NULL,
   note_datetime          datetime,
   note_type_concept_id   int(11)        NOT NULL,
   note_class_concept_id  int(11)        NOT NULL,
   note_title             varchar(250),
   note_text              text,
   encoding_concept_id    int(11)        NOT NULL,
   language_concept_id    int(11)        NOT NULL,
   provider_id            int(11),
   visit_occurrence_id    int(11),
   visit_detail_id        int(11),
   note_source_value      varchar(50)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.note_nlp
(
   note_nlp_id                 bigint(20) UNSIGNED         NOT NULL,
   note_id                     int(11)         NOT NULL,
   section_concept_id          int(11),
   snippet                     varchar(250),
   offset                      varchar(250),
   lexical_variant             varchar(250)    NOT NULL,
   note_nlp_concept_id         int(11),
   note_nlp_source_concept_id  int(11),
   nlp_system                  varchar(250),
   nlp_date                    date            NOT NULL,
   nlp_datetime                datetime,
   term_exists                 varchar(1),
   term_temporal               varchar(50),
   term_modifiers              varchar(2000)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.observation
(
   observation_id                 bigint(20) UNSIGNED         NOT NULL,
   person_id                      bigint(20)          NOT NULL,
   observation_concept_id         int(11)         NOT NULL,
   observation_date               date            NOT NULL,
   observation_datetime           datetime,
   observation_type_concept_id    int(11)         NOT NULL,
   value_as_number                DECIMAL(38,2),
   value_as_string                varchar(2000),
   value_as_concept_id            int(11),
   qualifier_concept_id           int(11),
   unit_concept_id                int(11),
   provider_id                    bigint(20),
   visit_occurrence_id            bigint(20) UNSIGNED,
   visit_detail_id                bigint(20) UNSIGNED,
   observation_source_value       varchar(250),
   observation_source_concept_id  int(11),
   unit_source_value              varchar(250),
   qualifier_source_value         varchar(250)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.observation_period
(
   observation_period_id          bigint(20) UNSIGNED    NOT NULL,
   person_id                      bigint(20)    NOT NULL,
   observation_period_start_date  date      NOT NULL,
   observation_period_end_date    date      NOT NULL,
   period_type_concept_id         int(11)   NOT NULL
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.payer_plan_period
(
   payer_plan_period_id           bigint(20) UNSIGNED       NOT NULL,
   person_id                      bigint(20)        NOT NULL,
   payer_plan_period_start_date   date          NOT NULL,
   payer_plan_period_end_date     date          NOT NULL,
   payer_concept_id               int(11),
   payer_source_value             varchar(50),
   payer_source_concept_id        int(11),
   plan_concept_id                int(11),
   plan_source_value              varchar(50),
   plan_source_concept_id         int(11),
   sponsor_concept_id             int(11),
   sponsor_source_value           varchar(50),
   sponsor_source_concept_id      int(11),
   family_source_value            varchar(50),
   stop_reason_concept_id         int(11),
   stop_reason_source_value       varchar(50),
   stop_reason_source_concept_id  int(11)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.person
(
   person_id                    bigint(20)        NOT NULL,
   gender_concept_id            int(11)       NOT NULL,
   year_of_birth                int(11)       NOT NULL,
   month_of_birth               int(11),
   day_of_birth                 int(11),
   birth_datetime               datetime,
   race_concept_id              int(11)       NOT NULL,
   ethnicity_concept_id         int(11)       NOT NULL,
   location_id                  bigint(20),
   provider_id                  bigint(20),
   care_site_id                 bigint(20),
   person_source_value          varchar(50),
   gender_source_value          varchar(50),
   gender_source_concept_id     int(11),
   race_source_value            varchar(50),
   race_source_concept_id       int(11),
   ethnicity_source_value       varchar(50),
   ethnicity_source_concept_id  int(11)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.procedure_occurrence
(
   procedure_occurrence_id      bigint(20) UNSIGNED       NOT NULL,
   person_id                    bigint(20)        NOT NULL,
   procedure_concept_id         int(11)       NOT NULL,
   procedure_date               date          NOT NULL,
   procedure_datetime           datetime,
   procedure_type_concept_id    int(11)       NOT NULL,
   modifier_concept_id          int(11),
   quantity                     int(11),
   provider_id                  bigint(20),
   visit_occurrence_id          bigint(20) UNSIGNED,
   visit_detail_id              bigint(20) UNSIGNED,
   procedure_source_value       varchar(50),
   procedure_source_concept_id  int(11),
   modifier_source_value        varchar(50)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.provider
(
   provider_id                  bigint(20)         NOT NULL,
   provider_name                varchar(255),
   npi                          varchar(20),
   dea                          varchar(20),
   specialty_concept_id         int(11),
   care_site_id                 int(11),
   year_of_birth                int(11),
   gender_concept_id            int(11),
   provider_source_value        varchar(50),
   specialty_source_value       varchar(50),
   specialty_source_concept_id  int(11),
   gender_source_value          varchar(50),
   gender_source_concept_id     int(11)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.specimen
(
   specimen_id                  bigint(20)  UNSIGNED       NOT NULL,
   person_id                    bigint(20)        NOT NULL,
   specimen_concept_id          int(11)       NOT NULL,
   specimen_type_concept_id     int(11)       NOT NULL,
   specimen_date                date          NOT NULL,
   specimen_datetime            datetime,
   quantity                     DECIMAL(38,2),
   unit_concept_id              int(11),
   anatomic_site_concept_id     int(11),
   disease_status_concept_id    int(11),
   specimen_source_id           varchar(50),
   specimen_source_value        varchar(50),
   unit_source_value            varchar(50),
   anatomic_site_source_value   varchar(50),
   disease_status_source_value  varchar(50)
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.visit_detail
(
   visit_detail_id                 bigint(20) UNSIGNED       NOT NULL,
   person_id                       bigint(20)        NOT NULL,
   visit_detail_concept_id         int(11)       NOT NULL,
   visit_detail_start_date         date          NOT NULL,
   visit_detail_start_datetime     datetime,
   visit_detail_end_date           date          NOT NULL,
   visit_detail_end_datetime       datetime,
   visit_detail_type_concept_id    int(11)       NOT NULL,
   provider_id                     bigint(20),
   care_site_id                    bigint(20),
   admitting_source_concept_id     int(11),
   discharge_to_concept_id         int(11),
   preceding_visit_detail_id       bigint(20) UNSIGNED,
   visit_detail_source_value       varchar(50),
   visit_detail_source_concept_id  int(11),
   admitting_source_value          varchar(50),
   discharge_to_source_value       varchar(50),
   visit_detail_parent_id          bigint(20) UNSIGNED,
   visit_occurrence_id             bigint(20) UNSIGNED       NOT NULL
)ENGINE=InnoDB;
GO

CREATE TABLE {sc}.visit_occurrence
(
   visit_occurrence_id            bigint(20)   UNSIGNED     NOT NULL,
   person_id                      bigint(20)        NOT NULL,
   visit_concept_id               int(11)       NOT NULL,
   visit_start_date               date          NOT NULL,
   visit_start_datetime           datetime,
   visit_end_date                 date          NOT NULL,
   visit_end_datetime             datetime,
   visit_type_concept_id          int(11)       NOT NULL,
   provider_id                    bigint(20),
   care_site_id                   bigint(20),
   visit_source_value             varchar(50),
   visit_source_concept_id        int(11),
   admitting_source_concept_id    int(11),
   admitting_source_value         varchar(50),
   discharge_to_concept_id        int(11),
   discharge_to_source_value      varchar(50),
   preceding_visit_occurrence_id  bigint(20) UNSIGNED
)ENGINE=InnoDB;
GO