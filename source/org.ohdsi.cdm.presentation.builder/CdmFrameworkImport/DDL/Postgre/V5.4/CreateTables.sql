CREATE TABLE IF NOT EXISTS {sc}._version
(
	version_id INTEGER NOT NULL  
	,version_date DATE NOT NULL  
)

;

CREATE TABLE IF NOT EXISTS {sc}.care_site
(
	care_site_id BIGINT NOT NULL  
	,care_site_name VARCHAR(255)   
	,place_of_service_concept_id BIGINT   
	,location_id BIGINT   
	,care_site_source_value VARCHAR(150)   
	,place_of_service_source_value VARCHAR(150)   
)

;

CREATE TABLE IF NOT EXISTS {sc}.cdm_source
(
	cdm_source_name VARCHAR(255) NOT NULL  
	,cdm_source_abbreviation VARCHAR(30)   
	,cdm_holder VARCHAR(255)   
	,source_description VARCHAR(65535)   
	,source_documentation_reference VARCHAR(255)   
	,cdm_etl_reference VARCHAR(255)   
	,source_release_date DATE   
	,cdm_release_date DATE   
	,cdm_version VARCHAR(10)   
	,cdm_version_concept_id BIGINT NOT NULL  
	,vocabulary_version VARCHAR(20)   
)

;

CREATE TABLE IF NOT EXISTS {sc}.cohort
(
	cohort_definition_id BIGINT NOT NULL  
	,subject_id BIGINT NOT NULL  
	,cohort_start_date DATE NOT NULL  
	,cohort_end_date DATE NOT NULL  
)
;

CREATE TABLE IF NOT EXISTS {sc}.cohort_definition
(
	cohort_definition_id BIGINT NOT NULL  
	,cohort_definition_name VARCHAR(255) NOT NULL  
	,cohort_definition_description VARCHAR(65535)   
	,definition_type_concept_id BIGINT NOT NULL  
	,cohort_definition_syntax VARCHAR(65535)   
	,subject_concept_id BIGINT NOT NULL  
	,cohort_initiation_date DATE   
)

;

CREATE TABLE IF NOT EXISTS {sc}.concept
(
	concept_id BIGINT NOT NULL  
	,concept_name VARCHAR(500) NOT NULL  
	,domain_id VARCHAR(20) NOT NULL  
	,vocabulary_id VARCHAR(200) NOT NULL  
	,concept_class_id VARCHAR(20) NOT NULL  
	,standard_concept VARCHAR(1)   
	,concept_code VARCHAR(100) NOT NULL  
	,valid_start_date DATE NOT NULL  
	,valid_end_date DATE NOT NULL  
	,invalid_reason VARCHAR(1)   
	,PRIMARY KEY (concept_id)
)
;

CREATE TABLE IF NOT EXISTS {sc}.concept_ancestor
(
	ancestor_concept_id BIGINT NOT NULL  
	,descendant_concept_id BIGINT NOT NULL  
	,min_levels_of_separation INTEGER NOT NULL  
	,max_levels_of_separation INTEGER NOT NULL  
)
;

CREATE TABLE IF NOT EXISTS {sc}.concept_class
(
	concept_class_id VARCHAR(20) NOT NULL  
	,concept_class_name VARCHAR(255) NOT NULL  
	,concept_class_concept_id BIGINT NOT NULL  
)

;

CREATE TABLE IF NOT EXISTS {sc}.concept_synonym
(
	concept_id BIGINT NOT NULL  
	,concept_synonym_name VARCHAR(1500) NOT NULL  
	,language_concept_id BIGINT NOT NULL  
)

;

CREATE TABLE IF NOT EXISTS {sc}.cost
(
	cost_id BIGINT NOT NULL  
	,cost_event_id BIGINT NOT NULL  
	,cost_domain_id VARCHAR(20) NOT NULL  
	,cost_type_concept_id BIGINT NOT NULL  
	,currency_concept_id BIGINT   
	,total_charge NUMERIC(38,2)   
	,total_cost NUMERIC(38,2)   
	,total_paid NUMERIC(38,2)   
	,paid_by_payer NUMERIC(38,2)   
	,paid_by_patient NUMERIC(38,2)   
	,paid_patient_copay NUMERIC(38,2)   
	,paid_patient_coinsurance NUMERIC(38,2)   
	,paid_patient_deductible NUMERIC(38,2)   
	,paid_by_primary NUMERIC(38,2)   
	,paid_ingredient_cost NUMERIC(38,2)   
	,paid_dispensing_fee NUMERIC(38,2)   
	,payer_plan_period_id BIGINT   
	,amount_allowed NUMERIC(38,2)   
	,revenue_code_concept_id BIGINT   
	,revenue_code_source_value VARCHAR(50)   
	,drg_concept_id BIGINT   
	,drg_source_value VARCHAR(3)   
)
;

CREATE TABLE IF NOT EXISTS {sc}."domain"
(
	domain_id VARCHAR(20) NOT NULL  
	,domain_name VARCHAR(255) NOT NULL  
	,domain_concept_id BIGINT NOT NULL  
)

;

CREATE TABLE IF NOT EXISTS {sc}.drug_strength
(
	drug_concept_id BIGINT NOT NULL  
	,ingredient_concept_id BIGINT NOT NULL  
	,amount_value DOUBLE PRECISION   
	,amount_unit_concept_id BIGINT   
	,numerator_value DOUBLE PRECISION   
	,numerator_unit_concept_id BIGINT   
	,denominator_value DOUBLE PRECISION   
	,denominator_unit_concept_id BIGINT   
	,box_size INTEGER   
	,valid_start_date DATE NOT NULL  
	,valid_end_date DATE NOT NULL  
	,invalid_reason VARCHAR(1)   
)

;

CREATE TABLE IF NOT EXISTS {sc}.fact_relationship
(
	domain_concept_id_1 BIGINT NOT NULL  
	,fact_id_1 BIGINT NOT NULL  
	,domain_concept_id_2 BIGINT NOT NULL  
	,fact_id_2 BIGINT NOT NULL  
	,relationship_concept_id BIGINT NOT NULL  
)

;

CREATE TABLE IF NOT EXISTS {sc}."location"
(
	location_id BIGINT NOT NULL  
	,address_1 VARCHAR(50)   
	,address_2 VARCHAR(50)   
	,city VARCHAR(50)   
	,state VARCHAR(25)   
	,zip VARCHAR(9)   
	,county VARCHAR(20)   
	,location_source_value VARCHAR(50)   
	,country_concept_id BIGINT   
	,country_source_value VARCHAR(150)   
	,latitude NUMERIC(38,2)   
	,longitude NUMERIC(38,2)   
)

;

CREATE TABLE IF NOT EXISTS {sc}.metadata
(
	metadata_id BIGINT NOT NULL  
	,metadata_concept_id BIGINT NOT NULL  
	,metadata_type_concept_id BIGINT NOT NULL  
	,name VARCHAR(250) NOT NULL  
	,value_as_string VARCHAR(65535)   
	,value_as_concept_id BIGINT   
	,value_as_number NUMERIC(38,2)   
	,metadata_date DATE   
	,metadata_datetime TIMESTAMP   
)

;

CREATE TABLE IF NOT EXISTS {sc}.note_nlp
(
	note_nlp_id BIGINT NOT NULL  
	,note_id BIGINT NOT NULL  
	,section_concept_id BIGINT   
	,snippet VARCHAR(250)   
	,"offset" VARCHAR(250)   
	,lexical_variant VARCHAR(250) NOT NULL  
	,note_nlp_concept_id BIGINT   
	,note_nlp_source_concept_id BIGINT   
	,nlp_system VARCHAR(250)   
	,nlp_date DATE NOT NULL  
	,nlp_datetime TIMESTAMP   
	,term_exists VARCHAR(1)   
	,term_temporal VARCHAR(50)   
	,term_modifiers VARCHAR(2000)   
)

;

CREATE TABLE IF NOT EXISTS {sc}.person
(
	person_id BIGINT NOT NULL  
	,gender_concept_id BIGINT NOT NULL  
	,year_of_birth INTEGER NOT NULL  
	,month_of_birth INTEGER   
	,day_of_birth INTEGER   
	,birth_datetime TIMESTAMP   
	,race_concept_id BIGINT NOT NULL  
	,ethnicity_concept_id BIGINT NOT NULL  
	,location_id BIGINT   
	,provider_id BIGINT   
	,care_site_id BIGINT   
	,person_source_value VARCHAR(50)   
	,gender_source_value VARCHAR(50)   
	,gender_source_concept_id BIGINT   
	,race_source_value VARCHAR(50)   
	,race_source_concept_id BIGINT   
	,ethnicity_source_value VARCHAR(50)   
	,ethnicity_source_concept_id BIGINT   
	,PRIMARY KEY (person_id)
)
;

CREATE TABLE IF NOT EXISTS {sc}."provider"
(
	provider_id BIGINT NOT NULL  
	,provider_name VARCHAR(255)   
	,npi VARCHAR(25)   
	,dea VARCHAR(20)   
	,specialty_concept_id BIGINT   
	,care_site_id BIGINT   
	,year_of_birth INTEGER   
	,gender_concept_id BIGINT   
	,provider_source_value VARCHAR(100)   
	,specialty_source_value VARCHAR(100)   
	,specialty_source_concept_id BIGINT   
	,gender_source_value VARCHAR(50)   
	,gender_source_concept_id BIGINT   
)

;

CREATE TABLE IF NOT EXISTS {sc}.relationship
(
	relationship_id VARCHAR(20) NOT NULL  
	,relationship_name VARCHAR(255) NOT NULL  
	,is_hierarchical VARCHAR(1) NOT NULL  
	,defines_ancestry VARCHAR(1) NOT NULL  
	,reverse_relationship_id VARCHAR(20) NOT NULL  
	,relationship_concept_id BIGINT NOT NULL  
)

;

CREATE TABLE IF NOT EXISTS {sc}.source_to_concept_map
(
	source_code VARCHAR(255)   
	,source_concept_id BIGINT NOT NULL  
	,source_vocabulary_id VARCHAR(50) NOT NULL  
	,source_code_description VARCHAR(255)   
	,target_concept_id BIGINT NOT NULL  
	,target_vocabulary_id VARCHAR(50)   
	,valid_start_date DATE NOT NULL  
	,valid_end_date DATE NOT NULL  
	,invalid_reason VARCHAR(1)   
)

;

CREATE TABLE IF NOT EXISTS {sc}.test_results
(
	id INTEGER   
	,description VARCHAR(512)   
	,test VARCHAR(256)   
	,status VARCHAR(5)   
)
;

CREATE TABLE IF NOT EXISTS {sc}.vocabulary
(
	vocabulary_id VARCHAR(20) NOT NULL  
	,vocabulary_name VARCHAR(255) NOT NULL  
	,vocabulary_reference VARCHAR(255)   
	,vocabulary_version VARCHAR(255)   
	,vocabulary_concept_id BIGINT NOT NULL  
)

;

CREATE TABLE IF NOT EXISTS {sc}.concept_relationship
(
	concept_id_1 BIGINT NOT NULL  
	,concept_id_2 BIGINT NOT NULL  
	,relationship_id VARCHAR(20) NOT NULL  
	,valid_start_date DATE NOT NULL  
	,valid_end_date DATE NOT NULL  
	,invalid_reason VARCHAR(1)   
)
;

CREATE TABLE IF NOT EXISTS {sc}.condition_era
(
	condition_era_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,condition_concept_id BIGINT NOT NULL  
	,condition_era_start_date DATE NOT NULL  
	,condition_era_end_date DATE NOT NULL  
	,condition_occurrence_count INTEGER   
)
;

CREATE TABLE IF NOT EXISTS {sc}.condition_occurrence
(
	condition_occurrence_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,condition_concept_id BIGINT NOT NULL  
	,condition_start_date DATE NOT NULL  
	,condition_start_datetime TIMESTAMP   
	,condition_end_date DATE   
	,condition_end_datetime TIMESTAMP   
	,condition_type_concept_id BIGINT NOT NULL  
	,stop_reason VARCHAR(20)   
	,provider_id BIGINT   
	,visit_occurrence_id BIGINT   
	,visit_detail_id BIGINT   
	,condition_status_concept_id BIGINT   
	,condition_source_value VARCHAR(65535)   
	,condition_source_concept_id BIGINT   
	,condition_status_source_value VARCHAR(65535)   
)
;

CREATE TABLE IF NOT EXISTS {sc}.death
(
	person_id BIGINT NOT NULL  
	,death_date DATE NOT NULL  
	,death_datetime TIMESTAMP   
	,death_type_concept_id BIGINT NOT NULL  
	,cause_concept_id BIGINT   
	,cause_source_value VARCHAR(50)   
	,cause_source_concept_id BIGINT   
)
;

CREATE TABLE IF NOT EXISTS {sc}.device_exposure
(
	device_exposure_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,device_concept_id BIGINT NOT NULL  
	,device_exposure_start_date DATE NOT NULL  
	,device_exposure_start_datetime TIMESTAMP   
	,device_exposure_end_date DATE   
	,device_exposure_end_datetime TIMESTAMP   
	,device_type_concept_id BIGINT NOT NULL  
	,unique_device_id VARCHAR(50)   
	,production_id VARCHAR(255)   
	,quantity INTEGER   
	,provider_id BIGINT   
	,visit_occurrence_id BIGINT   
	,visit_detail_id BIGINT   
	,device_source_value VARCHAR(255)   
	,device_source_concept_id BIGINT   
	,unit_concept_id BIGINT   
	,unit_source_value VARCHAR(255)   
	,unit_source_concept_id BIGINT   
)
;

CREATE TABLE IF NOT EXISTS {sc}.dose_era
(
	dose_era_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,drug_concept_id BIGINT NOT NULL  
	,unit_concept_id BIGINT NOT NULL  
	,dose_value NUMERIC(38,2) NOT NULL  
	,dose_era_start_date DATE NOT NULL  
	,dose_era_end_date DATE NOT NULL  
)
;

CREATE TABLE IF NOT EXISTS {sc}.drug_era
(
	drug_era_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,drug_concept_id BIGINT NOT NULL  
	,drug_era_start_date DATE NOT NULL  
	,drug_era_end_date DATE NOT NULL  
	,drug_exposure_count INTEGER   
	,gap_days INTEGER   
)
;

CREATE TABLE IF NOT EXISTS {sc}.drug_exposure
(
	drug_exposure_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,drug_concept_id BIGINT NOT NULL  
	,drug_exposure_start_date DATE NOT NULL  
	,drug_exposure_start_datetime TIMESTAMP   
	,drug_exposure_end_date DATE   
	,drug_exposure_end_datetime TIMESTAMP   
	,verbatim_end_date DATE   
	,drug_type_concept_id BIGINT NOT NULL  
	,stop_reason VARCHAR(20)   
	,refills INTEGER   
	,quantity NUMERIC(38,2)   
	,days_supply INTEGER   
	,sig VARCHAR(65535)   
	,route_concept_id BIGINT   
	,lot_number VARCHAR(65535)   
	,provider_id BIGINT   
	,visit_occurrence_id BIGINT   
	,visit_detail_id BIGINT   
	,drug_source_value VARCHAR(65535)   
	,drug_source_concept_id BIGINT   
	,route_source_value VARCHAR(65535)   
	,dose_unit_source_value VARCHAR(65535)   
)
;

CREATE TABLE IF NOT EXISTS {sc}.episode
(
	episode_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,episode_concept_id BIGINT NOT NULL  
	,episode_start_date DATE NOT NULL  
	,episode_start_datetime TIMESTAMP   
	,episode_end_date DATE   
	,episode_end_datetime TIMESTAMP   
	,episode_parent_id BIGINT   
	,episode_number INTEGER   
	,episode_object_concept_id BIGINT NOT NULL  
	,episode_type_concept_id BIGINT NOT NULL  
	,episode_source_value VARCHAR(250)   
	,episode_source_concept_id BIGINT   
	,PRIMARY KEY (episode_id)
)
;

CREATE TABLE IF NOT EXISTS {sc}.episode_event
(
	episode_id BIGINT NOT NULL  
	,event_id BIGINT NOT NULL  
	,episode_event_field_concept_id BIGINT NOT NULL  
)
;

CREATE TABLE IF NOT EXISTS {sc}.measurement
(
	measurement_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,measurement_concept_id BIGINT NOT NULL  
	,measurement_date DATE NOT NULL  
	,measurement_datetime TIMESTAMP   
	,measurement_time VARCHAR(50)   
	,measurement_type_concept_id BIGINT NOT NULL  
	,operator_concept_id BIGINT   
	,value_as_number NUMERIC(38,2)   
	,value_as_concept_id BIGINT   
	,unit_concept_id BIGINT   
	,range_low NUMERIC(38,2)   
	,range_high NUMERIC(38,2)   
	,provider_id BIGINT   
	,visit_occurrence_id BIGINT   
	,visit_detail_id BIGINT   
	,measurement_source_value VARCHAR(65535)   
	,measurement_source_concept_id BIGINT   
	,unit_source_value VARCHAR(65535)   
	,unit_source_concept_id BIGINT   
	,value_source_value VARCHAR(65535)   
	,measurement_event_id BIGINT   
	,meas_event_field_concept_id BIGINT   
)
;

CREATE TABLE IF NOT EXISTS {sc}.note
(
	note_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,note_date DATE NOT NULL  
	,note_datetime TIMESTAMP   
	,note_type_concept_id BIGINT NOT NULL  
	,note_text VARCHAR(65535)   
	,provider_id BIGINT   
	,visit_occurrence_id BIGINT   
	,visit_detail_id BIGINT   
	,note_source_value VARCHAR(50)   
	,note_class_concept_id BIGINT NOT NULL  
	,note_title VARCHAR(250)   
	,encoding_concept_id BIGINT NOT NULL  
	,language_concept_id BIGINT NOT NULL  
	,note_event_id BIGINT   
	,note_event_field_concept_id BIGINT   
)
;

CREATE TABLE IF NOT EXISTS {sc}.observation
(
	observation_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,observation_concept_id BIGINT NOT NULL  
	,observation_date DATE NOT NULL  
	,observation_datetime TIMESTAMP   
	,observation_type_concept_id BIGINT NOT NULL  
	,value_as_number NUMERIC(38,2)   
	,value_as_string VARCHAR(65535)   
	,value_as_concept_id BIGINT   
	,qualifier_concept_id BIGINT   
	,unit_concept_id BIGINT   
	,provider_id BIGINT   
	,visit_occurrence_id BIGINT   
	,visit_detail_id BIGINT   
	,observation_source_value VARCHAR(65535)   
	,observation_source_concept_id BIGINT   
	,unit_source_value VARCHAR(65535)   
	,qualifier_source_value VARCHAR(65535)   
	,value_source_value VARCHAR(700)   
	,observation_event_id BIGINT   
	,obs_event_field_concept_id BIGINT   
)
;

CREATE TABLE IF NOT EXISTS {sc}.observation_period
(
	observation_period_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,observation_period_start_date DATE NOT NULL  
	,observation_period_end_date DATE NOT NULL  
	,period_type_concept_id BIGINT NOT NULL  
)
;

CREATE TABLE IF NOT EXISTS {sc}.payer_plan_period
(
	payer_plan_period_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,payer_plan_period_start_date DATE NOT NULL  
	,payer_plan_period_end_date DATE NOT NULL  
	,payer_concept_id BIGINT   
	,payer_source_value VARCHAR(150)   
	,payer_source_concept_id BIGINT   
	,plan_concept_id BIGINT   
	,plan_source_value VARCHAR(150)   
	,plan_source_concept_id BIGINT   
	,sponsor_concept_id BIGINT   
	,sponsor_source_value VARCHAR(150)   
	,sponsor_source_concept_id BIGINT   
	,family_source_value VARCHAR(150)   
	,stop_reason_concept_id BIGINT   
	,stop_reason_source_value VARCHAR(150)   
	,stop_reason_source_concept_id BIGINT   
)
;

CREATE TABLE IF NOT EXISTS {sc}.procedure_occurrence
(
	procedure_occurrence_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,procedure_concept_id BIGINT NOT NULL  
	,procedure_date DATE NOT NULL  
	,procedure_datetime TIMESTAMP   
	,procedure_end_date DATE   
	,procedure_end_datetime TIMESTAMP   
	,procedure_type_concept_id BIGINT NOT NULL  
	,modifier_concept_id BIGINT   
	,quantity INTEGER   
	,provider_id BIGINT   
	,visit_occurrence_id BIGINT   
	,visit_detail_id BIGINT   
	,procedure_source_value VARCHAR(500)   
	,procedure_source_concept_id BIGINT   
	,modifier_source_value VARCHAR(50)   
)
;

CREATE TABLE IF NOT EXISTS {sc}.specimen
(
	specimen_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,specimen_concept_id BIGINT NOT NULL  
	,specimen_type_concept_id BIGINT NOT NULL  
	,specimen_date DATE NOT NULL  
	,specimen_datetime TIMESTAMP   
	,quantity DOUBLE PRECISION   
	,unit_concept_id BIGINT   
	,anatomic_site_concept_id BIGINT   
	,disease_status_concept_id BIGINT   
	,specimen_source_id VARCHAR(50)   
	,specimen_source_value VARCHAR(50)   
	,unit_source_value VARCHAR(50)   
	,anatomic_site_source_value VARCHAR(50)   
	,disease_status_source_value VARCHAR(50)   
)
;


CREATE TABLE IF NOT EXISTS {sc}.visit_detail
(
	visit_detail_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,visit_detail_concept_id BIGINT NOT NULL  
	,visit_detail_start_date DATE NOT NULL  
	,visit_detail_start_datetime TIMESTAMP   
	,visit_detail_end_date DATE NOT NULL  
	,visit_detail_end_datetime TIMESTAMP   
	,visit_detail_type_concept_id BIGINT NOT NULL  
	,provider_id BIGINT   
	,care_site_id BIGINT   
	,admitted_from_concept_id BIGINT   
	,discharged_to_concept_id BIGINT   
	,preceding_visit_detail_id BIGINT   
	,visit_detail_source_value VARCHAR(150)   
	,visit_detail_source_concept_id BIGINT   
	,admitted_from_source_value VARCHAR(150)   
	,discharged_to_source_value VARCHAR(150)   
	,parent_visit_detail_id BIGINT   
	,visit_occurrence_id BIGINT NOT NULL  
)
;

CREATE TABLE IF NOT EXISTS {sc}.visit_occurrence
(
	visit_occurrence_id BIGINT NOT NULL  
	,person_id BIGINT NOT NULL  
	,visit_concept_id BIGINT NOT NULL  
	,visit_start_date DATE NOT NULL  
	,visit_start_datetime TIMESTAMP   
	,visit_end_date DATE NOT NULL  
	,visit_end_datetime TIMESTAMP   
	,visit_type_concept_id BIGINT NOT NULL  
	,provider_id BIGINT   
	,care_site_id BIGINT   
	,visit_source_value VARCHAR(150)   
	,visit_source_concept_id BIGINT   
	,admitted_from_concept_id BIGINT   
	,admitted_from_source_value VARCHAR(150)   
	,discharged_to_concept_id BIGINT   
	,discharged_to_source_value VARCHAR(150)   
	,preceding_visit_occurrence_id BIGINT   
)
;