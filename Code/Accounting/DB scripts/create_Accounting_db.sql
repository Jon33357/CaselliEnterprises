USE [master]
GO
/****** Object:  Database [Accounting]    Script Date: 25-02-2017 15:02:19 ******/
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
/****** Object:  Table [dbo].[Client]    Script Date: 25-02-2017 15:02:19 ******/
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
/****** Object:  Table [dbo].[DocElement]    Script Date: 25-02-2017 15:02:19 ******/
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
/****** Object:  Table [dbo].[DocElementHeader]    Script Date: 25-02-2017 15:02:19 ******/
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
/****** Object:  Table [dbo].[DocElementTransaction]    Script Date: 25-02-2017 15:02:19 ******/
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
/****** Object:  Table [dbo].[DocElementType]    Script Date: 25-02-2017 15:02:19 ******/
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
/****** Object:  Table [dbo].[DocType]    Script Date: 25-02-2017 15:02:19 ******/
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
/****** Object:  Table [dbo].[Document]    Script Date: 25-02-2017 15:02:19 ******/
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
/****** Object:  Table [dbo].[Entity]    Script Date: 25-02-2017 15:02:19 ******/
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
USE [master]
GO
ALTER DATABASE [Accounting] SET  READ_WRITE 
GO
