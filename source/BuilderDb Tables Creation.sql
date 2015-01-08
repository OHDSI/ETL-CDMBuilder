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
 CONSTRAINT [PK_Builders1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BuilderState]    Script Date: 12/15/2014 4:20:01 PM ******/
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
/****** Object:  Table [dbo].[Building]    Script Date: 12/15/2014 4:20:01 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BuildingSettings]    Script Date: 12/15/2014 4:20:01 PM ******/
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
/****** Object:  Table [dbo].[Chunk]    Script Date: 12/15/2014 4:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chunk](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NOT NULL,
	[Started] [datetime] NULL,
	[Ended] [datetime] NULL,
 CONSTRAINT [PK_Chunk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KeyOffset]    Script Date: 12/15/2014 4:20:01 PM ******/
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
 CONSTRAINT [PK_KeyOffset] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 12/15/2014 4:20:01 PM ******/
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [ClusteredIndex-20141213-171925]    Script Date: 12/15/2014 4:20:01 PM ******/
CREATE CLUSTERED INDEX [ClusteredIndex-20141213-171925] ON [dbo].[Log]
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20141213-171955]    Script Date: 12/15/2014 4:20:01 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20141213-171955] ON [dbo].[Log]
(
	[BuilderId] ASC
)
INCLUDE ( 	[Type]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Builder] ADD  CONSTRAINT [DF_Builder_State1]  DEFAULT ((4)) FOR [StateId]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_BuildingId]  DEFAULT ((0)) FOR [BuildingId]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_Chunks] FOREIGN KEY([ChunkId])
REFERENCES [dbo].[Chunk] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_Chunks]
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