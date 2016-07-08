SELECT [prodcode]
      ,[ndd]
      ,[qty]
      ,[numpacks]
      ,[numdays]
  FROM [Daysupply_Decodes]
  union all
  SELECT [prodcode]
      ,-1
      ,-1
      ,-1
      ,[numdays]
      FROM [Daysupply_Modes]