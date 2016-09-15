DROP TABLE IF EXISTS {sc}.concept;
DROP TABLE IF EXISTS {sc}.concept_ancestor;
DROP TABLE IF EXISTS {sc}.concept_class;
DROP TABLE IF EXISTS {sc}.concept_relationship;
DROP TABLE IF EXISTS {sc}.concept_synonym;
DROP TABLE IF EXISTS {sc}.domain;
DROP TABLE IF EXISTS {sc}.drug_strength;
DROP TABLE IF EXISTS {sc}.relationship;
DROP TABLE IF EXISTS {sc}.source_to_concept_map;
DROP TABLE IF EXISTS {sc}.vocabulary;

CREATE TABLE {sc}.concept
(
	concept_id INTEGER NOT NULL,
	concept_name VARCHAR(255) NOT NULL ENCODE lzo,
	domain_id VARCHAR(20) NOT NULL ENCODE lzo,
	vocabulary_id VARCHAR(20) NOT NULL ENCODE lzo,
	concept_class_id VARCHAR(20) NOT NULL ENCODE bytedict,
	standard_concept VARCHAR(1),
	concept_code VARCHAR(50) NOT NULL ENCODE lzo,
	valid_start_date DATE NOT NULL,
	valid_end_date DATE NOT NULL,
	invalid_reason VARCHAR(1)
)
DISTSTYLE EVEN;


CREATE TABLE {sc}.concept_ancestor
(
	ancestor_concept_id INTEGER NOT NULL,
	descendant_concept_id INTEGER NOT NULL,
	min_levels_of_separation INTEGER NOT NULL,
	max_levels_of_separation INTEGER NOT NULL
)
DISTSTYLE EVEN;

CREATE TABLE {sc}.concept_class
(
	concept_class_id VARCHAR(20) NOT NULL,
	concept_class_name VARCHAR(255) NOT NULL,
	concept_class_concept_id INTEGER NOT NULL
)
DISTSTYLE EVEN;

CREATE TABLE {sc}.concept_relationship
(
	concept_id_1 INTEGER NOT NULL,
	concept_id_2 INTEGER NOT NULL,
	relationship_id VARCHAR(20) NOT NULL ENCODE bytedict,
	valid_start_date DATE NOT NULL,
	valid_end_date DATE NOT NULL,
	invalid_reason VARCHAR(1)
)
DISTSTYLE EVEN;

CREATE TABLE {sc}.concept_synonym
(
	concept_id INTEGER NOT NULL,
	concept_synonym_name VARCHAR(1000) NOT NULL,
	language_concept_id INTEGER NOT NULL
)
DISTSTYLE EVEN;

CREATE TABLE {sc}.domain
(
	domain_id VARCHAR(20) NOT NULL,
	domain_name VARCHAR(255) NOT NULL,
	domain_concept_id INTEGER NOT NULL
)
DISTSTYLE EVEN;

CREATE TABLE {sc}.drug_strength
(
	drug_concept_id INTEGER NOT NULL,
	ingredient_concept_id INTEGER NOT NULL,
	amount_value DOUBLE PRECISION,
	amount_unit_concept_id INTEGER,
	numerator_value DOUBLE PRECISION,
	numerator_unit_concept_id INTEGER,
	denominator_value DOUBLE PRECISION,
	denominator_unit_concept_id INTEGER,
	valid_start_date DATE NOT NULL,
	valid_end_date DATE NOT NULL,
	invalid_reason VARCHAR(1)
)
DISTSTYLE EVEN;

CREATE TABLE {sc}.relationship
(
	relationship_id VARCHAR(20) NOT NULL,
	relationship_name VARCHAR(255) NOT NULL,
	is_hierarchical VARCHAR(1) NOT NULL,
	defines_ancestry VARCHAR(1) NOT NULL,
	reverse_relationship_id VARCHAR(20) NOT NULL,
	relationship_concept_id INTEGER NOT NULL
)
DISTSTYLE EVEN;

CREATE TABLE {sc}.source_to_concept_map
(
	source_code VARCHAR(50) NOT NULL,
	source_concept_id INTEGER NOT NULL,
	source_vocabulary_id VARCHAR(20) NOT NULL,
	source_code_description VARCHAR(255),
	target_concept_id INTEGER NOT NULL,
	target_vocabulary_id VARCHAR(20) NOT NULL,
	valid_start_date DATE NOT NULL,
	valid_end_date DATE NOT NULL,
	invalid_reason VARCHAR(1)
)
DISTSTYLE EVEN;

CREATE TABLE {sc}.vocabulary
(
	vocabulary_id VARCHAR(20) NOT NULL,
	vocabulary_name VARCHAR(255) NOT NULL,
	vocabulary_reference VARCHAR(255),
	vocabulary_version VARCHAR(255),
	vocabulary_concept_id INTEGER NOT NULL
)
DISTSTYLE EVEN;






















