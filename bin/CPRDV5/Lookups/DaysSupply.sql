SELECT [prodcode]
      ,[ndd]
      ,[qty]
      ,[numpacks]
      ,[numdays]
  FROM {sc}.[Daysupply_Decodes]
  union all
  SELECT [prodcode]
      ,-1
      ,-1
      ,-1
      ,[numdays]
      FROM {sc}.[Daysupply_Modes]