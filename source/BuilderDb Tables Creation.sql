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
	[DeviceExposure] [bigint] NOT NULL,
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chunk]    Script Date: 07/04/2016 11:16:14 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_BuildingId] ON [dbo].[Chunk] 
(
	[BuildingId] ASC,
	[BuilderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingSettings]    Script Date: 07/04/2016 11:16:14 ******/
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
/****** Object:  Table [dbo].[Building]    Script Date: 07/04/2016 11:16:14 ******/
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
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuilderState]    Script Date: 07/04/2016 11:16:14 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Builder]    Script Date: 07/04/2016 11:16:14 ******/
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
	[StateId] [int] NOT NULL,
	[BuildingId] [int] NULL,
	[Version] [varchar](50) NULL,
 CONSTRAINT [PK_Builders1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AvailableOnS3]    Script Date: 07/04/2016 11:16:14 ******/
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
CREATE CLUSTERED INDEX [idx_Building] ON [dbo].[AvailableOnS3] 
(
	[BuildingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_Set] ON [dbo].[AvailableOnS3] 
(
	[SetIndex] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 07/04/2016 11:16:14 ******/
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
	[BuildingId] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_Builder_State1]    Script Date: 07/04/2016 11:16:14 ******/
ALTER TABLE [dbo].[Builder] ADD  CONSTRAINT [DF_Builder_State1]  DEFAULT ((4)) FOR [StateId]
GO
/****** Object:  Default [DF_KeyOffset_DeviceExposure1]    Script Date: 07/04/2016 11:16:14 ******/
ALTER TABLE [dbo].[KeyOffset] ADD  CONSTRAINT [DF_KeyOffset_DeviceExposure1]  DEFAULT ((0)) FOR [DeviceExposure]
GO
/****** Object:  Default [DF_Log_BuildingId1]    Script Date: 07/04/2016 11:16:14 ******/
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_BuildingId1]  DEFAULT ((0)) FOR [BuildingId]
GO
/****** Object:  ForeignKey [FK_Log_Chunks1]    Script Date: 07/04/2016 11:16:14 ******/
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_Chunks1] FOREIGN KEY([ChunkId])
REFERENCES [dbo].[Chunk] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_Chunks1]
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