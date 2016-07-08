SELECT lower(source_code_description) SOURCE_CODE, target_concept_id
from Vocabulary.dbo.source_to_concept_map 
where source_vocabulary_ID=502 and mapping_type='observation_value'
