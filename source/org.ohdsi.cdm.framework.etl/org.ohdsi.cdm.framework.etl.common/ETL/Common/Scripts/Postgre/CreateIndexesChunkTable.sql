CREATE INDEX chunkid_idx ON {sc}._chunks (Chunkid);
CLUSTER {sc}._chunks  USING chunkid_idx;