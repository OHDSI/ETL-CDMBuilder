SELECT DISTINCT {0} cast(patient_sk AS BIGINT) AS person_id, patient_sk
FROM {sc}.hf_d_patient
order by 1