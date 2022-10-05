GO
/****** Object:  Table [dbo].[AllocationTypeMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE book (
  author_id       NUMBER(7)     NOT NULL,
  title           VARCHAR2(400) NOT NULL,
  published_in    NUMBER(7)     NOT NULL,
  language_id     NUMBER(7)     NOT NULL,
  id              NUMBER(7)     NOT NULL AUTO_INCREMENT,
  PRIMARY KEY( id )
);
CREATE TABLE author (
  id              NUMBER(7)     NOT NULL AUTO_INCREMENT,
  first_name      VARCHAR2(50),
  last_name       VARCHAR2(50)  NOT NULL,
  date_of_birth   DATE,
  year_of_birth   NUMBER(7),
  distinguished   NUMBER(1)
  PRIMARY KEY( id )
);

--CREATE TABLE [dbo].[AllocationTypeMaster](
--	[AllocationTypeId] [int] IDENTITY(1,1) NOT NULL ,
--	[AllocationTypeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
--	[SequenceNo] [int] NOT NULL   DEFAULT (getdate()),
--	[IsActive] [bit] NOT NULL ,
--	[CreatedBy] [int] NOT NULL,
--	[CreatedOn] [datetime] NOT NULL,
--	[ModifiedBy] [int] NULL,
--	[ModifiedOn] [datetime] NULL,
--	[language_id] [int] NOT NULL,
--	PRIMARY KEY CLUSTERED (
--	[AllocationTypeId] ASC
--	)
--)

