USE [master]
GO
/****** Object:  Database [Accounting]    Script Date: 19-02-2017 22:31:33 ******/
CREATE DATABASE [Accounting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Accounting', FILENAME = N'E:\Digital Repository\Code\Data\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Accounting.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Accounting_log', FILENAME = N'E:\Digital Repository\Code\Data\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Accounting_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Accounting] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Accounting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Accounting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Accounting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Accounting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Accounting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Accounting] SET ARITHABORT OFF 
GO
ALTER DATABASE [Accounting] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Accounting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Accounting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Accounting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Accounting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Accounting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Accounting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Accounting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Accounting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Accounting] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Accounting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Accounting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Accounting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Accounting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Accounting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Accounting] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Accounting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Accounting] SET RECOVERY FULL 
GO
ALTER DATABASE [Accounting] SET  MULTI_USER 
GO
ALTER DATABASE [Accounting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Accounting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Accounting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Accounting] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Accounting] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Accounting', N'ON'
GO
ALTER DATABASE [Accounting] SET QUERY_STORE = OFF
GO
USE [Accounting]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Accounting]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[production_id] [uniqueidentifier] NOT NULL,
	[id] [smallint] NOT NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_Batch] PRIMARY KEY CLUSTERED 
(
	[production_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocElement]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocElement](
	[doc_id] [uniqueidentifier] NOT NULL,
	[id] [smallint] NOT NULL,
	[type_code] [nvarchar](50) NULL,
	[state_code] [nvarchar](50) NULL,
	[state_date] [datetime] NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_DocElement] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocElementHeader]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocElementHeader](
	[doc_id] [uniqueidentifier] NOT NULL,
	[doc_element_id] [smallint] NOT NULL,
	[header_text] [nvarchar](250) NULL,
 CONSTRAINT [PK_DocElementHeader] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC,
	[doc_element_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocElementTransaction]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocElementTransaction](
	[document_id] [uniqueidentifier] NOT NULL,
	[doc_element_id] [smallint] NOT NULL,
	[transaction_description] [nvarchar](50) NULL,
	[transaction_amount] [smallmoney] NULL,
	[transaction_date] [date] NULL,
	[state_code] [nvarchar](50) NULL,
	[state_date] [datetime] NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_DocElementTransaction] PRIMARY KEY CLUSTERED 
(
	[document_id] ASC,
	[doc_element_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocElementType]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocElementType](
	[code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
	[state_code] [nvarchar](50) NULL,
	[state_date] [datetime] NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_DocElementType] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocGroup]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGroup](
	[id] [uniqueidentifier] NOT NULL,
	[version] [smallint] NOT NULL,
	[type_code] [nvarchar](50) NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_DocGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocGroupType]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGroupType](
	[code] [nvarchar](50) NOT NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_DocGroupType] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocType]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocType](
	[code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_DocType] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Document]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[id] [uniqueidentifier] NOT NULL,
	[type_code] [nvarchar](50) NULL,
	[entity_code] [nvarchar](50) NULL,
	[version] [smallint] NOT NULL,
	[doc_location] [varchar](255) NULL,
	[state_code] [nvarchar](50) NULL,
	[state_date] [datetime] NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Document_DocGroup]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_DocGroup](
	[doc_id] [uniqueidentifier] NOT NULL,
	[doc_group_code] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Document_Page]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_Page](
	[doc_id] [uniqueidentifier] NOT NULL,
	[page_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Document_Page] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC,
	[page_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entity]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_AccountEntity] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IndexingUnit]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexingUnit](
	[doc_group_code] [nvarchar](50) NULL,
	[doc_id] [uniqueidentifier] NULL,
	[page_number] [int] NULL,
	[doc_element_id] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Page]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[id] [uniqueidentifier] NOT NULL,
	[production_id] [uniqueidentifier] NOT NULL,
	[batch_id] [smallint] NOT NULL,
	[page_number] [int] NULL,
	[capture_date] [datetime] NULL,
	[capture_orientation_type_code] [nvarchar](50) NULL,
	[capture_size_type_code] [nvarchar](50) NULL,
	[capture_resolution_type_code] [nvarchar](50) NULL,
	[capture_color_type_code] [nvarchar](50) NULL,
	[location] [nvarchar](50) NULL,
	[state_code] [nvarchar](50) NULL,
	[state_date] [datetime] NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Production]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Production](
	[id] [uniqueidentifier] NOT NULL,
	[type_code] [nvarchar](50) NOT NULL,
	[client_code] [nvarchar](50) NOT NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_Production] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductionType]    Script Date: 19-02-2017 22:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionType](
	[code] [nvarchar](50) NOT NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductionType] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IndexingUnit]    Script Date: 19-02-2017 22:31:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IndexingUnit] ON [dbo].[IndexingUnit]
(
	[doc_group_code] ASC,
	[doc_id] ASC,
	[page_number] ASC,
	[doc_element_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [FK_Batch_Production] FOREIGN KEY([production_id])
REFERENCES [dbo].[Production] ([id])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK_Batch_Production]
GO
ALTER TABLE [dbo].[DocElement]  WITH CHECK ADD  CONSTRAINT [FK_DocElement_DocElementType] FOREIGN KEY([type_code])
REFERENCES [dbo].[DocElementType] ([code])
GO
ALTER TABLE [dbo].[DocElement] CHECK CONSTRAINT [FK_DocElement_DocElementType]
GO
ALTER TABLE [dbo].[DocElement]  WITH CHECK ADD  CONSTRAINT [FK_DocElement_Document] FOREIGN KEY([doc_id])
REFERENCES [dbo].[Document] ([id])
GO
ALTER TABLE [dbo].[DocElement] CHECK CONSTRAINT [FK_DocElement_Document]
GO
ALTER TABLE [dbo].[DocElementHeader]  WITH CHECK ADD  CONSTRAINT [FK_DocElementHeader_DocElement] FOREIGN KEY([doc_id], [doc_element_id])
REFERENCES [dbo].[DocElement] ([doc_id], [id])
GO
ALTER TABLE [dbo].[DocElementHeader] CHECK CONSTRAINT [FK_DocElementHeader_DocElement]
GO
ALTER TABLE [dbo].[DocElementTransaction]  WITH CHECK ADD  CONSTRAINT [FK_DocElementTransaction_DocElement] FOREIGN KEY([document_id], [doc_element_id])
REFERENCES [dbo].[DocElement] ([doc_id], [id])
GO
ALTER TABLE [dbo].[DocElementTransaction] CHECK CONSTRAINT [FK_DocElementTransaction_DocElement]
GO
ALTER TABLE [dbo].[DocGroup]  WITH CHECK ADD  CONSTRAINT [FK_DocGroup_DocGroupType] FOREIGN KEY([type_code])
REFERENCES [dbo].[DocGroupType] ([code])
GO
ALTER TABLE [dbo].[DocGroup] CHECK CONSTRAINT [FK_DocGroup_DocGroupType]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Doc_Entity] FOREIGN KEY([entity_code])
REFERENCES [dbo].[Entity] ([code])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Doc_Entity]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_DocType] FOREIGN KEY([type_code])
REFERENCES [dbo].[DocType] ([code])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_DocType]
GO
ALTER TABLE [dbo].[Document_DocGroup]  WITH CHECK ADD  CONSTRAINT [FK_Document_DocGroup_DocGroup] FOREIGN KEY([doc_group_code])
REFERENCES [dbo].[DocGroup] ([id])
GO
ALTER TABLE [dbo].[Document_DocGroup] CHECK CONSTRAINT [FK_Document_DocGroup_DocGroup]
GO
ALTER TABLE [dbo].[Document_DocGroup]  WITH CHECK ADD  CONSTRAINT [FK_Document_DocGroup_Document] FOREIGN KEY([doc_id])
REFERENCES [dbo].[Document] ([id])
GO
ALTER TABLE [dbo].[Document_DocGroup] CHECK CONSTRAINT [FK_Document_DocGroup_Document]
GO
ALTER TABLE [dbo].[Document_Page]  WITH CHECK ADD  CONSTRAINT [FK_Document_Page_Document] FOREIGN KEY([doc_id])
REFERENCES [dbo].[Document] ([id])
GO
ALTER TABLE [dbo].[Document_Page] CHECK CONSTRAINT [FK_Document_Page_Document]
GO
ALTER TABLE [dbo].[Document_Page]  WITH CHECK ADD  CONSTRAINT [FK_Document_Page_Page] FOREIGN KEY([page_id])
REFERENCES [dbo].[Page] ([id])
GO
ALTER TABLE [dbo].[Document_Page] CHECK CONSTRAINT [FK_Document_Page_Page]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_Page_Batch] FOREIGN KEY([production_id], [batch_id])
REFERENCES [dbo].[Batch] ([production_id], [id])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_Page_Batch]
GO
ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [FK_Production_Client] FOREIGN KEY([client_code])
REFERENCES [dbo].[Client] ([code])
GO
ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [FK_Production_Client]
GO
ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [FK_Production_ProductionType] FOREIGN KEY([type_code])
REFERENCES [dbo].[ProductionType] ([code])
GO
ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [FK_Production_ProductionType]
GO
USE [master]
GO
ALTER DATABASE [Accounting] SET  READ_WRITE 
GO
