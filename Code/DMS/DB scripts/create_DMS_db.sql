USE [master]
GO
/****** Object:  Database [DMS]    Script Date: 28-02-2017 18:25:10 ******/
CREATE DATABASE [DMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Accounting', FILENAME = N'E:\Digital Repository\Code\Data\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Accounting_log', FILENAME = N'E:\Digital Repository\Code\Data\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DMS] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [DMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DMS] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [DMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DMS] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DMS] SET RECOVERY FULL 
GO
ALTER DATABASE [DMS] SET  MULTI_USER 
GO
ALTER DATABASE [DMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DMS', N'ON'
GO
ALTER DATABASE [DMS] SET QUERY_STORE = OFF
GO
USE [DMS]
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
USE [DMS]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[id] [uniqueidentifier] NOT NULL,
	[version] [smallint] NULL,
 CONSTRAINT [PK_Batch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Batch_Page]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch_Page](
	[batch_id] [uniqueidentifier] NOT NULL,
	[production_id] [uniqueidentifier] NOT NULL,
	[page_number] [int] NOT NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_Batch_Page] PRIMARY KEY CLUSTERED 
(
	[batch_id] ASC,
	[production_id] ASC,
	[page_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 28-02-2017 18:25:11 ******/
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
/****** Object:  Table [dbo].[DocGroup]    Script Date: 28-02-2017 18:25:11 ******/
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
/****** Object:  Table [dbo].[DocGroupType]    Script Date: 28-02-2017 18:25:11 ******/
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
/****** Object:  Table [dbo].[DocType]    Script Date: 28-02-2017 18:25:11 ******/
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
/****** Object:  Table [dbo].[Document]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[id] [uniqueidentifier] NOT NULL,
	[type_code] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[Document_DocGroup]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_DocGroup](
	[doc_id] [uniqueidentifier] NOT NULL,
	[doc_group_code] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Document_Page]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_Page](
	[doc_id] [uniqueidentifier] NOT NULL,
	[production_id] [uniqueidentifier] NOT NULL,
	[page_number] [int] NOT NULL,
 CONSTRAINT [PK_Document_Page] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC,
	[production_id] ASC,
	[page_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Index]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Index](
	[indexing_unit_id] [bigint] NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[order] [tinyint] NULL,
	[schema_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Index] PRIMARY KEY CLUSTERED 
(
	[indexing_unit_id] ASC,
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IndexingUnit]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexingUnit](
	[id] [bigint] NOT NULL,
 CONSTRAINT [PK_IndexingUnit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IndexValueDateTime]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexValueDateTime](
	[indexing_unit_id] [bigint] NOT NULL,
	[index_code] [nvarchar](50) NOT NULL,
	[value] [datetime] NULL,
 CONSTRAINT [PK_IndexValueDateTime] PRIMARY KEY CLUSTERED 
(
	[indexing_unit_id] ASC,
	[index_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IndexValueText]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexValueText](
	[indexing_unit_id] [bigint] NOT NULL,
	[index_code] [nvarchar](50) NOT NULL,
	[value] [nvarchar](50) NULL,
 CONSTRAINT [PK_IndexValueText] PRIMARY KEY CLUSTERED 
(
	[indexing_unit_id] ASC,
	[index_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Page]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[production_id] [uniqueidentifier] NOT NULL,
	[page_number] [int] NOT NULL,
	[indexing_unit_id] [bigint] NULL,
	[capture_date] [datetime] NULL,
	[capture_orientation_type_code] [nvarchar](50) NULL,
	[capture_size_type_code] [nvarchar](50) NULL,
	[capture_resolution_type_code] [nvarchar](50) NULL,
	[capture_color_type_code] [nvarchar](50) NULL,
	[repository_code] [nvarchar](50) NULL,
	[file_type_code] [nvarchar](50) NULL,
	[file_name] [nvarchar](50) NULL,
	[state_code] [nvarchar](50) NULL,
	[state_date] [datetime] NULL,
	[last_modified_date] [datetime] NOT NULL,
	[last_modified_by] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[occ_version] [bigint] NOT NULL,
 CONSTRAINT [PK_Page_1] PRIMARY KEY CLUSTERED 
(
	[production_id] ASC,
	[page_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Production]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Production](
	[id] [uniqueidentifier] NOT NULL,
	[indexing_unit_id] [bigint] NULL,
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
/****** Object:  Table [dbo].[ProductionType]    Script Date: 28-02-2017 18:25:11 ******/
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
/****** Object:  Table [dbo].[Repository]    Script Date: 28-02-2017 18:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repository](
	[code] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NULL,
	[host] [nvarchar](50) NULL,
	[user] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[location_string] [nvarchar](50) NULL,
 CONSTRAINT [PK_Repository] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Batch_Page]  WITH CHECK ADD  CONSTRAINT [FK_Batch_Page_Batch] FOREIGN KEY([batch_id])
REFERENCES [dbo].[Batch] ([id])
GO
ALTER TABLE [dbo].[Batch_Page] CHECK CONSTRAINT [FK_Batch_Page_Batch]
GO
ALTER TABLE [dbo].[Batch_Page]  WITH CHECK ADD  CONSTRAINT [FK_Batch_Page_Page] FOREIGN KEY([production_id], [page_number])
REFERENCES [dbo].[Page] ([production_id], [page_number])
GO
ALTER TABLE [dbo].[Batch_Page] CHECK CONSTRAINT [FK_Batch_Page_Page]
GO
ALTER TABLE [dbo].[DocGroup]  WITH CHECK ADD  CONSTRAINT [FK_DocGroup_DocGroupType] FOREIGN KEY([type_code])
REFERENCES [dbo].[DocGroupType] ([code])
GO
ALTER TABLE [dbo].[DocGroup] CHECK CONSTRAINT [FK_DocGroup_DocGroupType]
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
ALTER TABLE [dbo].[Document_Page]  WITH CHECK ADD  CONSTRAINT [FK_Document_Page_Page] FOREIGN KEY([production_id], [page_number])
REFERENCES [dbo].[Page] ([production_id], [page_number])
GO
ALTER TABLE [dbo].[Document_Page] CHECK CONSTRAINT [FK_Document_Page_Page]
GO
ALTER TABLE [dbo].[Index]  WITH CHECK ADD  CONSTRAINT [FK_Index_IndexingUnit] FOREIGN KEY([indexing_unit_id])
REFERENCES [dbo].[IndexingUnit] ([id])
GO
ALTER TABLE [dbo].[Index] CHECK CONSTRAINT [FK_Index_IndexingUnit]
GO
ALTER TABLE [dbo].[Index]  WITH CHECK ADD  CONSTRAINT [FK_Index_IndexValueDateTime] FOREIGN KEY([indexing_unit_id], [code])
REFERENCES [dbo].[IndexValueDateTime] ([indexing_unit_id], [index_code])
GO
ALTER TABLE [dbo].[Index] CHECK CONSTRAINT [FK_Index_IndexValueDateTime]
GO
ALTER TABLE [dbo].[Index]  WITH CHECK ADD  CONSTRAINT [FK_Index_IndexValueText] FOREIGN KEY([indexing_unit_id], [code])
REFERENCES [dbo].[IndexValueText] ([indexing_unit_id], [index_code])
GO
ALTER TABLE [dbo].[Index] CHECK CONSTRAINT [FK_Index_IndexValueText]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_Page_IndexingUnit] FOREIGN KEY([indexing_unit_id])
REFERENCES [dbo].[IndexingUnit] ([id])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_Page_IndexingUnit]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_Page_Production] FOREIGN KEY([production_id])
REFERENCES [dbo].[Production] ([id])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_Page_Production]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_Page_Repository] FOREIGN KEY([repository_code])
REFERENCES [dbo].[Repository] ([code])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_Page_Repository]
GO
ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [FK_Production_Client] FOREIGN KEY([client_code])
REFERENCES [dbo].[Client] ([code])
GO
ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [FK_Production_Client]
GO
ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [FK_Production_IndexingUnit] FOREIGN KEY([indexing_unit_id])
REFERENCES [dbo].[IndexingUnit] ([id])
GO
ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [FK_Production_IndexingUnit]
GO
ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [FK_Production_ProductionType] FOREIGN KEY([type_code])
REFERENCES [dbo].[ProductionType] ([code])
GO
ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [FK_Production_ProductionType]
GO
USE [master]
GO
ALTER DATABASE [DMS] SET  READ_WRITE 
GO
