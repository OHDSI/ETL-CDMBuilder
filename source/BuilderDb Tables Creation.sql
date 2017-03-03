SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvailableOnS3](
	[BuildingId] [int] NOT NULL,
	[SetIndex] [int] NOT NULL,
	[ChunkId] [int] NOT NULL,
	[Saved] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Index [idx_Building]    Script Date: 3/3/2017 3:34:47 PM ******/
CREATE CLUSTERED INDEX [idx_Building] ON [dbo].[AvailableOnS3]
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Builder]    Script Date: 3/3/2017 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Builder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Dsn] [varchar](50) NOT NULL,
	[Folder] [varchar](250) NULL,
	[MaxDegreeOfParallelism] [int] NOT NULL,
	[BatchSize] [int] NOT NULL,
	[StateId] [int] NOT NULL CONSTRAINT [DF_Builder_State1]  DEFAULT ((4)),
	[BuildingId] [int] NULL,
	[Version] [varchar](50) NULL,
 CONSTRAINT [PK_Builders1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BuilderState]    Script Date: 3/3/2017 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuilderState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BuilderState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Building]    Script Date: 3/3/2017 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[Id] [int] NOT NULL,
	[CreateDestinationDbStart] [datetime] NULL,
	[CreateDestinationDbEnd] [datetime] NULL,
	[CreateChunksStart] [datetime] NULL,
	[CreateChunksEnd] [datetime] NULL,
	[CreateLookupStart] [datetime] NULL,
	[CreateLookupEnd] [datetime] NULL,
	[BuildingStart] [datetime] NULL,
	[BuildingEnd] [datetime] NULL,
	[CopyVocabularyStart] [datetime] NULL,
	[CopyVocabularyEnd] [datetime] NULL,
	[CreateIndexesStart] [datetime] NULL,
	[CreateIndexesEnd] [datetime] NULL,
	[AchillesStart] [datetime] NULL,
	[AchillesEnd] [datetime] NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BuildingSettings]    Script Date: 3/3/2017 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingSettings](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[SourceConnectionString] [nvarchar](250) NOT NULL,
	[DestinationConnectionString] [nvarchar](250) NOT NULL,
	[VocabularyConnectionString] [nvarchar](250) NOT NULL,
	[Vendor] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chunk]    Script Date: 3/3/2017 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chunk](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NOT NULL,
	[BuilderId] [int] NULL,
	[Started] [datetime] NULL,
	[QueriesExecuted] [datetime] NULL,
	[Loaded] [datetime] NULL,
	[Built] [datetime] NULL,
	[Ended] [datetime] NULL,
	[Failed] [datetime] NULL,
 CONSTRAINT [PK_Chunk1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KeyOffset]    Script Date: 3/3/2017 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyOffset](
	[BuildingId] [int] NOT NULL,
	[VisitOccurrence] [bigint] NOT NULL,
	[PayerPlanPeriod] [bigint] NOT NULL,
	[DrugExposure] [bigint] NOT NULL,
	[ProcedureOccurrence] [bigint] NOT NULL,
	[DeviceExposure] [bigint] NOT NULL CONSTRAINT [DF_KeyOffset_DeviceExposure1]  DEFAULT ((0)),
	[ConditionOccurrence] [bigint] NOT NULL,
	[Measurement] [bigint] NOT NULL,
	[Observation] [bigint] NOT NULL,
	[ObservationPeriod] [bigint] NOT NULL,
	[VisitCost] [bigint] NOT NULL,
	[ProcedureCost] [bigint] NOT NULL,
	[DeviceCost] [bigint] NOT NULL,
	[DrugEra] [bigint] NOT NULL,
	[ConditionEra] [bigint] NOT NULL,
 CONSTRAINT [PK_KeyOffset1] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 3/3/2017 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChunkId] [int] NULL,
	[BuilderId] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[BuildingId] [int] NOT NULL CONSTRAINT [DF_Log_BuildingId1]  DEFAULT ((0))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubChunk]    Script Date: 3/3/2017 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubChunk](
	[ChunkId] [int] NOT NULL,
	[Index] [int] NOT NULL,
	[MinPersonId] [bigint] NOT NULL,
	[MaxPersonId] [bigint] NOT NULL,
	[PersonCount] [int] NOT NULL,
	[Saved] [tinyint] NOT NULL CONSTRAINT [DF_SubChunk_Saved]  DEFAULT ((0)),
 CONSTRAINT [PK_SubChunk] PRIMARY KEY CLUSTERED 
(
	[ChunkId] ASC,
	[Index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [idx_Set]    Script Date: 3/3/2017 3:34:47 PM ******/
CREATE NONCLUSTERED INDEX [idx_Set] ON [dbo].[AvailableOnS3]
(
	[SetIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_BuildingId]    Script Date: 3/3/2017 3:34:47 PM ******/
CREATE NONCLUSTERED INDEX [IDX_BuildingId] ON [dbo].[Chunk]
(
	[BuildingId] ASC,
	[BuilderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SubChunk]  WITH CHECK ADD  CONSTRAINT [FK_SubChunk_Chunk] FOREIGN KEY([ChunkId])
REFERENCES [dbo].[Chunk] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubChunk] CHECK CONSTRAINT [FK_SubChunk_Chunk]
GO


INSERT INTO [dbo].[BuilderState]
           ([Name])
     VALUES ('Idle')
GO

INSERT INTO [dbo].[BuilderState]
           ([Name])
     VALUES ('Running')
GO

INSERT INTO [dbo].[BuilderState]
           ([Name])
     VALUES ('Stopping')
GO

INSERT INTO [dbo].[BuilderState]
           ([Name])
     VALUES ('Stopped')
GO

INSERT INTO [dbo].[BuilderState]
           ([Name])
     VALUES ('Error')
GO