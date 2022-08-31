USE [MIS]
GO
/****** Object:  Table [dbo].[acc_Face_ReaderData]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acc_Face_ReaderData](
	[Reader] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dt] [datetime] NULL,
	[cardid] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reason] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[newcardid] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Temperature] [float] NULL,
	[ID] [int] NOT NULL,
	[DeviceLogId] [int] IDENTITY(1,1) NOT NULL
)

GO
/****** Object:  Table [dbo].[acc_monitor_log]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acc_monitor_log](
	[id] [int] NOT NULL,
	[create_time] [datetime] NULL,
	[status] [smallint] NOT NULL   DEFAULT ('0'),
	[time] [datetime] NULL,
	[pin] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[card_no] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[device_id] [int] NULL,
	[device_sn] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[device_name] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[verified] [int] NULL  DEFAULT ('200'),
	[state] [int] NULL,
	[state_name] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[event_type] [smallint] NULL,
	[trigger_opt] [smallint] NULL   DEFAULT ('-1'),
	[event_point_type] [smallint] NULL   DEFAULT ('-1'),
	[event_point_id] [int] NULL,
	[event_point_name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[firstname] [nvarchar](24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lastname] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dept] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[area] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)
)

GO
/****** Object:  Table [dbo].[acc_NetXs_ReaderData]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acc_NetXs_ReaderData](
	[Reader] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dt] [datetime] NULL,
	[cardid] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reason] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[newcardid] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ID] [int] NOT NULL
)

GO
/****** Object:  Table [dbo].[AccessCard]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccessCard](
	[AccessCardId] [int] IDENTITY(1,1) NOT NULL,
	[AccessCardNo] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[IsTemporary] [bit] NOT NULL DEFAULT ((0)),
	[IsPimco] [bit] NOT NULL DEFAULT ((0)),
  PRIMARY KEY CLUSTERED
(
	[AccessCardId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdvanceLeave]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdvanceLeave](
	[AdvanceLeaveId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FromDateId] [int] NOT NULL,
	[TillDateId] [int] NOT NULL,
	[Reason] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[AdvanceLeaveId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdvanceLeaveDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvanceLeaveDetail](
	[AdvanceLeaveDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdvanceLeaveId] [bigint] NOT NULL,
	[DateId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[IsAdjusted] [bit] NOT NULL   DEFAULT ((0)),
	[AdjustedLeaveReqAppId] [bigint] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[AdvanceLeaveDetailId] ASC
))

GO
/****** Object:  Table [dbo].[AllocationTypeMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllocationTypeMaster](
	[AllocationTypeId] [int] NOT NULL,
	[AllocationTypeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SequenceNo] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL   DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[AllocationTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[API]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[API](
	[APIId] [int] IDENTITY(1,1) NOT NULL,
	[ControllerName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ActionName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[HttpVerbId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[APIId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[APIRolePermission]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIRolePermission](
	[APIRolePermissionId] [bigint] IDENTITY(1,1) NOT NULL,
	[APIId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[APIRolePermissionId] ASC
))

GO
/****** Object:  Table [dbo].[APIUserPermission]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIUserPermission](
	[APIUserPermissionId] [bigint] IDENTITY(1,1) NOT NULL,
	[APIId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[APIUserPermissionId] ASC
))

GO
/****** Object:  Table [dbo].[AppraisalCycle]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppraisalCycle](
	[AppraisalCycleId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[AppraisalMonth] [int] NOT NULL,
	[AppraisalYear] [int] NOT NULL,
	--[AppraisalCycleName]  AS ((datename(month,dateadd(month,[AppraisalMonth],(-1)))+' ')+CONVERT([varchar](4),[AppraisalYear],(0))),
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[AppraisalCycleId] ASC
)
)

GO
/****** Object:  Table [dbo].[AppraisalParameter]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppraisalParameter](
	[ParameterId] [int] IDENTITY(1,1) NOT NULL,
	[ParameterName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Weightage] [int] NOT NULL   DEFAULT ((5)),
	[CompetencyTypeId] [int] NOT NULL,
	[SequenceNo] [int] NOT NULL,
	[IsFinalized] [bit] NOT NULL   DEFAULT ((0)),
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[DeletedDate] [datetime] NULL,
	[DeletedById] [int] NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[ParameterId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppraisalParameter_2020]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppraisalParameter_2020](
	[ParameterId] [int] IDENTITY(1,1) NOT NULL,
	[ParameterName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Weightage] [int] NOT NULL,
	[CompetencyTypeId] [int] NOT NULL,
	[SequenceNo] [int] NOT NULL,
	[IsFinalized] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[DeletedById] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppraisalRating]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppraisalRating](
	[AppraisalRatingId] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NOT NULL,
	[RatingTitle] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RatingDescription] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sequence] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[AppraisalRatingId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppraisalSetting]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppraisalSetting](
	[AppraisalSettingId] [int] IDENTITY(1,1) NOT NULL,
	[AppraisalCycleId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[VerticalId] [int] NOT NULL,
	[DivisionId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[DesignationIds] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[AppraisalSettingId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppraisalSettingDesignation]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppraisalSettingDesignation](
	[AppraisalSettingDesigId] [bigint] IDENTITY(1,1) NOT NULL,
	[AppraisalSettingId] [int] NOT NULL,
	[DesignationId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[AppraisalSettingDesigId] ASC
))

GO
/****** Object:  Table [dbo].[AppraisalSettingStage]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppraisalSettingStage](
	[AppraisalSettingStageId] [bigint] IDENTITY(1,1) NOT NULL,
	[AppraisalSettingId] [int] NOT NULL,
	[AppraisalStageId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[AppraisalSettingStageId] ASC
))

GO
/****** Object:  Table [dbo].[AppraisalStage]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppraisalStage](
	[AppraisalStageId] [int] IDENTITY(1,1) NOT NULL,
	[AppraisalStageName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AppraisalStageCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SequenceNo] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[AppraisalStageId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AsquareUserMapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AsquareUserMapping](
	[MappingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DeviceId] [int] NOT NULL,
	[JobId] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
  PRIMARY KEY CLUSTERED
(
	[MappingId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asset](
	[AssetId] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeId] [bigint] NOT NULL,
	[Make] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Model] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[AssetId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssetDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssetDetail](
	[AssetDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetId] [bigint] NULL,
	[SerialNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AssetTag] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[AssetDetailId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssetDetailAttributes]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssetDetailAttributes](
	[AttributeId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetDetailId] [bigint] NOT NULL,
	[AttributeType] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AttributeValue] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssetRequest]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssetRequest](
	[RequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeId] [bigint] NOT NULL,
	[Reason] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RequiredFromDateId] [bigint] NOT NULL,
	[RequiredTillDateId] [bigint] NULL,
	[StatusId] [int] NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[RequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssetsBrand]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssetsBrand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[BrandId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssetsMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssetsMaster](
	[AssetId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetTypeId] [bigint] NOT NULL,
	[BrandId] [int] NOT NULL,
	[Model] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SerialNo] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[VendorName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InvoiceNumber] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InvoiceDate] [datetime] NULL,
	[OrderNo] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  PRIMARY KEY CLUSTERED
(
	[AssetId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssetStatus]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[AssetStatus](
	[AssetStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StatusDescription] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[AssetStatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssetTransaction]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetTransaction](
	[TransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [bigint] NOT NULL,
	[AssetDetailId] [bigint] NOT NULL,
	[IssueDateId] [bigint] NOT NULL,
	[IsReturned] [bit] NOT NULL,
	[ReturnedOnDateId] [bigint] NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[AcknowledgedOnDateId] [bigint] NULL,
  PRIMARY KEY CLUSTERED
(
	[TransactionId] ASC
))

GO
/****** Object:  Table [dbo].[AssetType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssetType](
	[TypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsForTemporaryBasis] [bit] NOT NULL  DEFAULT ((1)),
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[TypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttendanceDataChangeRequestApplication]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttendanceDataChangeRequestApplication](
	[RequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestApplicationId] [bigint] NOT NULL,
	[RequestCategoryid] [int] NOT NULL,
	[Reason] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatusId] [bigint] NOT NULL,
	[ApproverId] [int] NULL,
	[ApproverRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [bit] NULL,
  PRIMARY KEY CLUSTERED
(
	[RequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttendanceDataChangeRequestCategory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttendanceDataChangeRequestCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[CategoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttendanceDataChangeRequestHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttendanceDataChangeRequestHistory](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[ApproverId] [int] NULL,
	[ApproverRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttendanceReportAccess]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceReportAccess](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[SendAutomatedEmails] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
/****** Object:  Table [dbo].[AttendanceStatusMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttendanceStatusMaster](
	[StatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[StatusCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[StatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttendanceUploadHistoryAsquare]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceUploadHistoryAsquare](
	[AttendaceId] [bigint] IDENTITY(1,1) NOT NULL,
	[DeviceId] [int] NOT NULL,
	[AttendaceDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[AttendaceId] ASC
))

GO
/****** Object:  Table [dbo].[BlockingReasonMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BlockingReasonMaster](
	[BlockingReasonId] [int] NOT NULL,
	[SequenceNo] [int] NOT NULL,
	[BlockingReason] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[BlockingReasonId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CabPickDropLocation]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CabPickDropLocation](
	[CabPDLocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NOT NULL,
	[RouteNo] [int] NOT NULL,
	[RouteLocation] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Sequence] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[CabPDLocationId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CabRequest]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CabRequest](
	[CabRequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DateId] [bigint] NOT NULL,
	[EmpContactNo] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CabShiftId] [int] NOT NULL,
	[CabPDLocationId] [int] NOT NULL,
	[LocationDetail] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatusId] [int] NOT NULL,
	[ApproverId] [bigint] NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[CabRequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CabRequestHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CabRequestHistory](
	[CabRequestHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[CabRequestId] [bigint] NOT NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatusId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[CabRequestHistoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CabServiceType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CabServiceType](
	[ServiceTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceType] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[ServiceTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CabShiftMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CabShiftMaster](
	[CabShiftId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceTypeId] [int] NOT NULL,
	[CabShiftName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[CabShiftId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CabStatusMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CabStatusMaster](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusCode] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[StatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CardPunchinData]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CardPunchinData](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[CardNo] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateId] [bigint] NOT NULL,
	[Date] [date] NOT NULL,
	[InTime] [datetime] NOT NULL,
	[OutTime] [datetime] NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CardPunchinDataMergeHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CardPunchinDataMergeHistory](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[ActionType] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OldCardNo] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OldDateId] [bigint] NULL,
	[OldDate] [date] NULL,
	[OldInTime] [datetime] NULL,
	[OldOutTime] [datetime] NULL,
	[OldIsActive] [bit] NULL,
	[NewCardNo] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewDateId] [bigint] NULL,
	[NewDate] [date] NULL,
	[NewInTime] [datetime] NULL,
	[NewOutTime] [datetime] NULL,
	[NewIsActive] [bit] NULL,
	[ModifiedDate] [datetime] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CertificationsAndRewards]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CertificationsAndRewards](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProfileId] [bigint] NOT NULL,
	[CertificationAndReward] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Type] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChangeExtnRequest]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChangeExtnRequest](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[NewMobileNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewExtnNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsVerified] [bit] NULL DEFAULT ((0)),
	[IsActionPerformed] [bit] NULL   DEFAULT ((0)),
	[Reason] [varchar](750) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NOT NULL,
	[Action] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActionDate] [datetime] NULL,
	[ActionTakenById] [int] NULL,
	[NewImage] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OldMobileNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OldImage] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
PRIMARY KEY CLUSTERED
(
	[RequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NULL,
	[CityName] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[CityId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Client]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
PRIMARY KEY CLUSTERED
(
	[ClientId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientMaster](
	[ClientId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Address] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[City] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Country] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[ClientId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientResourceMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientResourceMaster](
	[ClientResourceId] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourceName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[ClientProjectName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ClientProjectCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClientProjectDescription] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[FriendlyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[ClientResourceId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientSideManagerMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientSideManagerMaster](
	[ClientSideManagerId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[ManagerName] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[ClientSideManagerId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[CompanyId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompetencyForm]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompetencyForm](
	[CompetencyFormId] [int] IDENTITY(1,1) NOT NULL,
	[CompetencyFormName] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SpecializedFormName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LocationId] [int] NOT NULL,
	[VerticalId] [int] NOT NULL,
	[DivisionId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[DesignationId] [int] NOT NULL,
	[FeedbackTypeId] [int] NOT NULL,
	[IsRating] [bit] NOT NULL,
	[IsFinalized] [bit] NOT NULL   DEFAULT ((0)),
	[FinalizedDate] [datetime] NULL,
	[IsRetired] [bit] NULL    DEFAULT ((0)),
	[RetiredDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[CompetencyFormId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompetencyForm_25FEB2022_BKP]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompetencyForm_25FEB2022_BKP](
	[CompetencyFormId] [int] IDENTITY(1,1) NOT NULL,
	[CompetencyFormName] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SpecializedFormName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LocationId] [int] NOT NULL,
	[VerticalId] [int] NOT NULL,
	[DivisionId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[DesignationId] [int] NOT NULL,
	[FeedbackTypeId] [int] NOT NULL,
	[IsRating] [bit] NOT NULL,
	[IsFinalized] [bit] NOT NULL,
	[FinalizedDate] [datetime] NULL,
	[IsRetired] [bit] NULL,
	[RetiredDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompetencyFormDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompetencyFormDetail](
	[CompetencyFormDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CompetencyFormId] [int] NOT NULL,
	[CompetencyTypeId] [int] NOT NULL,
	[ParameterId] [int] NOT NULL,
	[EvaluationCriteria] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsRating] [bit] NOT NULL,
	[SequenceNo] [int] NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[CompetencyFormDetailId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompetencyFormDetail_2020]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompetencyFormDetail_2020](
	[CompetencyFormDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CompetencyFormId] [int] NOT NULL,
	[CompetencyTypeId] [int] NOT NULL,
	[ParameterId] [int] NOT NULL,
	[EvaluationCriteria] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsRating] [bit] NOT NULL,
	[SequenceNo] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompetencyFormDetail_25feb_bkp]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompetencyFormDetail_25feb_bkp](
	[CompetencyFormDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CompetencyFormId] [int] NOT NULL,
	[CompetencyTypeId] [int] NOT NULL,
	[ParameterId] [int] NOT NULL,
	[EvaluationCriteria] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsRating] [bit] NOT NULL,
	[SequenceNo] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompetencyType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompetencyType](
	[CompetencyTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CompetencyTypeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[CompetencyTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Correct]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Correct](
	[Employee_Name] [nvarchar](27) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Joining_Date] [datetime] NULL,
	[Intern] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Old_PL] [numeric](3, 1) NULL,
	[New_PL] [numeric](2, 1) NULL,
	[Total_PL] [numeric](3, 1) NULL,
	[New_PL_Leaves] [numeric](3, 1) NULL
)

GO
/****** Object:  Table [dbo].[Country]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED
(
	[CountryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Currency](
	[CurrencyId] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[CurrencyId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DashboardWidget]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DashboardWidget](
	[DashboardWidgetId] [int] IDENTITY(1,1) NOT NULL,
	[DashboardWidgetName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[DashboardWidgetId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DashboardWidgetRolePermission]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DashboardWidgetRolePermission](
	[DashboardWidgetRolePermissionId] [int] IDENTITY(1,1) NOT NULL,
	[DashboardWidgetId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[DashboardWidgetRolePermissionId] ASC
))

GO
/****** Object:  Table [dbo].[DashboardWidgetUserPermission]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DashboardWidgetUserPermission](
	[DashboardWidgetUserPermissionId] [int] IDENTITY(1,1) NOT NULL,
	[DashboardWidgetId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[DashboardWidgetUserPermissionId] ASC
))

GO
/****** Object:  Table [dbo].[DateMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DateMaster](
	[DateId] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsWeekend] [bit] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[DateId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DateWiseAttendance]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DateWiseAttendance](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[SystemGeneratedInTime] [datetime] NULL,
	[SystemGeneratedOutTime] [datetime] NULL,
	--[SystemGeneratedTotalWorkingHours]  AS ([SystemGeneratedOutTime]-[SystemGeneratedInTime]),
	[SystemGeneratedStatusId] [bigint] NOT NULL,
	[SystemGeneratedRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserGivenInTime] [datetime] NULL,
	[UserGivenOutTime] [datetime] NULL,
	[UserGivenTotalWorkingHours] [datetime] NULL,
	[UserGivenStatusId] [bigint] NULL,
	[UserGivenRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[IsNightShift] [bit] NOT NULL DEFAULT ((0)),
  PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DateWiseAttendanceAsquare]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[DateWiseAttendanceAsquare](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[SystemGeneratedInTime] [datetime] NULL,
	[SystemGeneratedOutTime] [datetime] NULL,
	--[SystemGeneratedTotalWorkingHours]  AS [SystemGeneratedOutTime]-[SystemGeneratedInTime],
	[SystemGeneratedStatusId] [bigint] NOT NULL,
	[SystemGeneratedRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserGivenInTime] [datetime] NULL,
	[UserGivenOutTime] [datetime] NULL,
	[UserGivenTotalWorkingHours] [datetime] NULL,
	[UserGivenStatusId] [bigint] NULL,
	[UserGivenRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DateWiseAttendanceMergeHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DateWiseAttendanceMergeHistory](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[ActionType] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OldDateId] [bigint] NULL,
	[OldUserId] [int] NULL,
	[OldInTime] [datetime] NULL,
	[OldOutTime] [datetime] NULL,
	[OldTotalWorkingHours] [datetime] NULL,
	[OldIsActive] [bit] NULL,
	[OldIsDeleted] [bit] NULL,
	[NewDateId] [bigint] NULL,
	[NewUserId] [int] NULL,
	[NewInTime] [datetime] NULL,
	[NewOutTime] [datetime] NULL,
	[NewTotalWorkingHours] [datetime] NULL,
	[NewIsActive] [bit] NULL,
	[NewIsDeleted] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
	[OldIsNightShift] [bit] NULL,
	[NewIsNightShift] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DateWiseLeaveType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateWiseLeaveType](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[LeaveRequestApplicationId] [bigint] NOT NULL,
	[DateId] [bigint] NOT NULL,
	[LeaveTypeId] [bigint] NOT NULL,
	[IsHalfDay] [bit] NOT NULL,
	[IsFirstDayHalfDay] [bit] NOT NULL  DEFAULT ((0)),
	[IsLastDayHalfDay] [bit] NOT NULL  DEFAULT ((0)),
 PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
/****** Object:  Table [dbo].[DateWiseLNSA]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DateWiseLNSA](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [bigint] NOT NULL,
	[DateId] [bigint] NOT NULL,
	[IsApprovedBySystem] [bit] NOT NULL   DEFAULT ((0)),
	[StatusId] [bigint] NOT NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
  PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DateWisePunchInData]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DateWisePunchInData](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[Data] [varchar](3000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepartmentHeadId] [int] NOT NULL,
	[DivisionId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[DepartmentId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DepartmentWiseAssetLimit]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentWiseAssetLimit](
	[LimitId] [bigint] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TypeId] [bigint] NOT NULL,
	[MaximumLimit] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[LimitId] ASC
))

GO
/****** Object:  Table [dbo].[Designation]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsIntern] [bit] NOT NULL,
	[DesignationGroupId] [int] NOT NULL   DEFAULT ((1)),
	[SpecialDesignationGropupId] [int] NULL,
	[Sequence] [int] NOT NULL   DEFAULT ((1)),
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[DesignationId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DesignationGroup]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DesignationGroup](
	[DesignationGroupId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationGroupName] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[DesignationGroupId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Division]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Division](
	[DivisionId] [int] IDENTITY(1,1) NOT NULL,
	[DivisionName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionHeadId] [int] NOT NULL,
	[VerticalId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[DivisionId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Document]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Document](
	[DocId] [int] IDENTITY(1,1) NOT NULL,
	[Path] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupId] [int] NULL,
	[FileDiscription] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tags] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date] [datetime] NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[UserId] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[DocId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentGroup]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentGroup](
	[DocGroupId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentId] [int] NULL,
	[UserID] [int] NULL,
	[DeleteFlag] [bit] NULL,
  PRIMARY KEY CLUSTERED
(
	[DocGroupId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentPermissionGroup]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentPermissionGroup](
	[DocumentPermissionGroupId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedByUserId] [int] NOT NULL  DEFAULT ((2)),
 PRIMARY KEY CLUSTERED
(
	[DocumentPermissionGroupId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentPermissionGroupPermissions]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentPermissionGroupPermissions](
	[DocumentPermissionGroupPermissionsId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentPermissionGroupId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
  PRIMARY KEY CLUSTERED
(
	[DocumentPermissionGroupPermissionsId] ASC
))

GO
/****** Object:  Table [dbo].[DocumentTag]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentTag](
	[DocumentTagId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[DocumentTagId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Domain]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Domain](
	[DomainId] [int] IDENTITY(1,1) NOT NULL,
	[DomainName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[DomainId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailTemplates](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Template] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsHTML] [bit] NOT NULL   DEFAULT ((0)),
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [date] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpAppraisal]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmpAppraisal](
	[EmpAppraisalId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpAppraisalSettingId] [bigint] NOT NULL,
	[ExposerFrom] [datetime] NULL,
	[ExposerTo] [datetime] NULL,
	[AppraiseeComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SelfSubmitDate] [datetime] NULL,
	[AppraiserComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppraiserSubmitDate] [datetime] NULL,
	[Approver1Comment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Approver1SubmitDate] [datetime] NULL,
	[Approver2Comment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Approver2SubmitDate] [datetime] NULL,
	[Approver3Comment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Approver3SubmitDate] [datetime] NULL,
	[AppraiserRecommendedForDesignationId] [int] NULL,
	[AppraiserRecommendedPercentage] [int] NULL,
	[AppraiserRecommendationComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Approver1RecommendedForDesignationId] [int] NULL,
	[Approver1RecommendedPercentage] [int] NULL,
	[Approver1RecommendationComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppraiserMarkedHighPotential] [bit] NULL DEFAULT ((0)),
	[AppraiserHighPotentialComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Approver1MarkedHighPotential] [bit] NULL   DEFAULT ((0)),
	[Approver1HighPotentialComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PromotionDesignationId] [int] NULL,
	[PromotionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[SelfOverallRating] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppraiserOverallRating] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ApproverOverallRating] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PromotionOverallRating] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  PRIMARY KEY CLUSTERED
(
	[EmpAppraisalId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpAppraisalLog]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[EmpAppraisalLog](
	[EmpAppraisalLogId] [int] IDENTITY(1,1) NOT NULL,
	[EmpAppraisalSettingId] [bigint] NOT NULL,
	[AppraisalStatusId] [int] NOT NULL,
	[ActionDescription] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Comment] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[EmpAppraisalLogId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpAppraisalParameterDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpAppraisalParameterDetail](
	[EAParameterDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpAppraisalId] [bigint] NOT NULL,
	[CompetencyFormDetailId] [int] NOT NULL,
	[SelfComment] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SelfRatingId] [int] NULL,
	[AppraiserComment] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppraiserRatingId] [int] NULL,
	[ApproverComment] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ApproverRatingId] [int] NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL   DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[EAParameterDetailId] ASC
))

GO
/****** Object:  Table [dbo].[EmpAppraisalSetting]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpAppraisalSetting](
	[EmpAppraisalSettingId] [bigint] IDENTITY(1,1) NOT NULL,
	[AppraisalSettingId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[VerticalId] [int] NOT NULL,
	[DivisionId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[DesignationId] [int] NOT NULL,
	[LastPromotionDate] [datetime] NULL,
	[LastPromotionDesignationId] [int] NULL,
	[LastAppraisalCycleId] [int] NULL,
	[CurrentAppraisalCycleId] [int] NOT NULL,
	[RMId] [int] NOT NULL,
	[AppraiserId] [int] NOT NULL,
	[Approver1] [int] NOT NULL,
	[Approver2] [int] NULL,
	[Approver3] [int] NULL,
	[HRId] [int] NULL,
	[CompetencyFormId] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[AppraisalStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[EmpAppraisalSettingId] ASC
))

GO
/****** Object:  Table [dbo].[EmpAppraisalSettingLog]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpAppraisalSettingLog](
	[EmpAppraisalSettingLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpAppraisalSettingId] [bigint] NOT NULL,
	[AppraisalSettingId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[VerticalId] [int] NOT NULL,
	[DivisionId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[DesignationId] [int] NOT NULL,
	[LastPromotionDate] [datetime] NULL,
	[LastPromotionDesignationId] [int] NULL,
	[LastAppraisalCycleId] [int] NULL,
	[CurrentAppraisalCycleId] [int] NOT NULL,
	[RMId] [int] NOT NULL,
	[AppraiserId] [int] NOT NULL,
	[Approver1] [int] NOT NULL,
	[Approver2] [int] NULL,
	[Approver3] [int] NULL,
	[HRId] [int] NULL,
	[CompetencyFormId] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[AppraisalStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[EmpAppraisalSettingLogId] ASC
))

GO
/****** Object:  Table [dbo].[EmpAppraisalSettingStage]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpAppraisalSettingStage](
	[EmpAppraisalSettingStageId] [int] IDENTITY(1,1) NOT NULL,
	[EmpAppraisalSettingId] [bigint] NOT NULL,
	[AppraisalStageId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[EmpAppraisalSettingStageId] ASC
))

GO
/****** Object:  Table [dbo].[EmployeeProfile]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeProfile](
	[ProfileId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[About] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Skills] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[ProfileId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeWiseWeekOff]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeWiseWeekOff](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[WeekOffDateId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
/****** Object:  Table [dbo].[EmployeeWish]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeWish](
	[EmployeeWishId] [bigint] IDENTITY(1,1) NOT NULL,
	[WishTo] [bigint] NOT NULL,
	[WishTypeId] [int] NOT NULL,
	[Message] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[EmployeeWishId] ASC
))

GO
/****** Object:  Table [dbo].[EncashedCOff_13_Jul_2017]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EncashedCOff_13_Jul_2017](
	[UserId] [int] NOT NULL,
	[EmployeeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TotalApplied] [int] NULL,
	[Approved] [int] NULL,
	[PendingForApproval] [int] NULL,
	[Rejected] [int] NULL,
	[Availed] [int] NULL,
	[ToBeEncashed] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ControllerName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActionName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ErrorType] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ErrorMessage] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TargetSite] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StackTrace] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReportedByUserId] [int] NULL,
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
  PRIMARY KEY CLUSTERED
(
	[ErrorId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExcludedUsersForAttendanceImport]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExcludedUsersForAttendanceImport](
	[ExclusionId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[ExclusionId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedbackStatus]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedbackStatus](
	[FeedbackStatusId] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackStatusName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FeedbackStatusDescription] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FeedbackTypeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[FeedbackStatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedbackType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedbackType](
	[FeedbackTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackTypeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SequenceNo] [int] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[FeedbackTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FinalizedCabRequest]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FinalizedCabRequest](
	[FCRequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[CabRequestIds] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[VehicleId] [int] NOT NULL,
	[StaffId] [bigint] NULL,
	[StaffName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StaffContactNo] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[FCRequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FinalLoggedTasks]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FinalLoggedTasks](
	[TaskId] [bigint] IDENTITY(1,1) NOT NULL,
	[MappingId] [bigint] NOT NULL,
	[Date] [date] NULL,
	[ProjectId] [bigint] NULL,
	[Description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaskTeamId] [bigint] NULL,
	[TaskTypeId] [bigint] NULL,
	[TaskSubDetail1Id] [bigint] NULL,
	[TaskSubDetail2Id] [bigint] NULL,
	[TimeSpent] [decimal](3, 1) NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[TaskId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FloorMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FloorMaster](
	[FloorId] [int] NULL,
	[FloorName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Form]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Form](
	[FormId] [int] IDENTITY(1,1) NOT NULL,
	[FormTitle] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FormName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[DepartmentId] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[FormId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderId] [int] NOT NULL,
	[GenderType] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[GenderId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GoalCategory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GoalCategory](
	[GoalCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[GoalCategoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GoalStatus]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GoalStatus](
	[GoalStatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[GoalStatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GSOCProject]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GSOCProject](
	[GSOCProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FilePath] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[GSOCProjectId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GSOCProjectSubscriber]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[GSOCProjectSubscriber](
	[GSOCProjectSubscriberId] [int] IDENTITY(1,1) NOT NULL,
	[GSOCProjectId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ProjectTitle] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	 PRIMARY KEY CLUSTERED
    (
    	[GSOCProjectSubscriberId] ASC
    )
)
SET ANSI_PADDING ON
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [Brief] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [ExpectedResult] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [Solution] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [TimelineDistribution] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [FuturePlans] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [IsActive] [bit] NOT NULL   DEFAULT ((1))
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [CreatedDate] [datetime] NOT NULL  DEFAULT (getdate())
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [CreatedById] [int] NULL
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [ModifiedDate] [datetime] NULL
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [ModifiedById] [int] NULL
SET ANSI_PADDING ON
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [FilePath] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[GSOCProjectSubscriber] ADD [IsApproved] [bit] NOT NULL DEFAULT ((0))


GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HttpVerb]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HttpVerb](
	[HttpVerbId] [int] IDENTITY(1,1) NOT NULL,
	[Verb] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[HttpVerbId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IdentityType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IdentityType](
	[IdentityTypeId] [int] IDENTITY(1,1) NOT NULL,
	[IdentityTypeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[IdentityTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Images]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[EmployeeName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SerialNo] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Image] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [int] NULL
)

GO
/****** Object:  Table [dbo].[Industry]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Industry](
	[IndustryTypeId] [int] IDENTITY(1,1) NOT NULL,
	[IndustryType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[IndustryTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceRequestDetailId] [bigint] NOT NULL,
	[InvoiceNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsCancelled] [bit] NOT NULL,
	[Reason] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[InvoiceId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceRequest]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceRequest](
	[InvoiceRequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL DEFAULT ((0)),
	[IsRejected] [bit] NOT NULL DEFAULT ((0)),
	[Comments] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[InvoiceRequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceRequestDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceRequestDetail](
	[InvoiceRequestDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceRequestId] [bigint] NOT NULL,
	[ClientId] [int] NOT NULL,
	[RequestedCount] [int] NOT NULL,
	[AvailableCount] [int] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[InvoiceRequestDetailId] ASC
))

GO
/****** Object:  Table [dbo].[JobCategory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobCategory](
	[JobCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[JobCategoryType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED
(
	[JobCategoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LDAPUsers]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LDAPUsers](
	[ADUsername] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisplayName] [nvarchar](23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailId] [nvarchar](39) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [nvarchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserShortName] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserPrincipalName] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
/****** Object:  Table [dbo].[LeaveBalance]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveBalance](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LeaveTypeId] [bigint] NOT NULL,
	[Count] [float] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[AllocationFrequency] [int] NOT NULL DEFAULT ((0)),
  PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
/****** Object:  Table [dbo].[LeaveBalance_bkp8feb]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveBalance_bkp8feb](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LeaveTypeId] [bigint] NOT NULL,
	[Count] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[AllocationFrequency] [int] NOT NULL
)

GO
/****** Object:  Table [dbo].[LeaveBalance_bkp8feb_2]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveBalance_bkp8feb_2](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LeaveTypeId] [bigint] NOT NULL,
	[Count] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[AllocationFrequency] [int] NOT NULL
)

GO
/****** Object:  Table [dbo].[LeaveBalanceHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveBalanceHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RecordId] [bigint] NOT NULL,
	[Count] [float] NOT NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[Id] ASC
))

GO
/****** Object:  Table [dbo].[LeaveHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LeaveHistory](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[LeaveRequestApplicationId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL   DEFAULT ((1)),
	[ApproverId] [int] NULL,
	[ApproverRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LeaveRequestApplication]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LeaveRequestApplication](
	[LeaveRequestApplicationId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FromDateId] [bigint] NOT NULL,
	[TillDateId] [bigint] NOT NULL,
	[NoOfTotalDays] [float] NOT NULL,
	[NoOfWorkingDays] [float] NOT NULL,
	[Reason] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PrimaryContactNo] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AlternativeContactNo] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsAvailableOnMobile] [bit] NOT NULL,
	[IsAvailableOnEmail] [bit] NOT NULL,
	[StatusId] [bigint] NOT NULL  DEFAULT ((1)),
	[ApproverId] [int] NULL,
	[ApproverRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[LeaveCombination] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 PRIMARY KEY CLUSTERED
(
	[LeaveRequestApplicationId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LeaveRequestApplicationDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveRequestApplicationDetail](
	[LeaveRequestApplicationDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[LeaveRequestApplicationId] [bigint] NOT NULL,
	[LeaveTypeId] [bigint] NOT NULL,
	[Count] [float] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[LeaveRequestApplicationDetailId] ASC
))

GO
/****** Object:  Table [dbo].[LeaveStatusMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LeaveStatusMaster](
	[StatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[StatusCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[StatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LeaveTypeMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LeaveTypeMaster](
	[TypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[ShortName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Priority] [int] NOT NULL,
	[IsAvailableForMarriedOnly] [bit] NOT NULL,
	[IsAvailableForMale] [bit] NOT NULL,
	[IsAvailableForFemale] [bit] NOT NULL,
	[MaximumNoForMale] [int] NULL,
	[MaximumNoForFemale] [int] NULL,
	[MaximumLimitForMale] [int] NULL,
	[MaximumLimitForFemale] [int] NULL,
	[MaximumLimitPeriod] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsAutoIncremented] [bit] NOT NULL,
	[AutoIncrementPeriod] [int] NULL,
	[AutoIncrementAfterType] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastAutoIncrementDate] [date] NULL,
	[NextAutoIncrementDate] [date] NULL,
	[DaysToIncrement] [int] NULL,
	[IsAutoExpire] [bit] NOT NULL,
	[AutoExpirePeriod] [int] NULL,
	[AutoExpireAfterType] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastAutoExpireDate] [date] NULL,
	[NextAutoExpireDate] [date] NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[TypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LegitimateLeaveRequest]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LegitimateLeaveRequest](
	[LegitimateLeaveRequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[LeaveRequestApplicationId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[DateId] [bigint] NOT NULL,
	[Reason] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LeaveCombination] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatusId] [bigint] NOT NULL   DEFAULT ((2)),
	[NextApproverId] [int] NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[LegitimateLeaveRequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LegitimateLeaveRequestHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LegitimateLeaveRequestHistory](
	[LegitimateLeaveRequestHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[LegitimateLeaveRequestId] [bigint] NOT NULL,
	[DateId] [bigint] NOT NULL,
	[Reason] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StatusId] [bigint] NOT NULL  DEFAULT ((1)),
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
 PRIMARY KEY CLUSTERED
(
	[LegitimateLeaveRequestHistoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LegitimateLeaveStatus]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LegitimateLeaveStatus](
	[StatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StatusCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[StatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListofHoliday]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ListofHoliday](
	[HolidayId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateId] [bigint] NOT NULL,
	[Holiday] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[HolidayId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LNSAStatusMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LNSAStatusMaster](
	[StatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StatusCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[StatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[Address] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 PRIMARY KEY CLUSTERED
(
	[LocationId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LocationPremisesListMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocationPremisesListMaster](
	[PremisesFloorId] [int] NOT NULL,
	[PremisesName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LocationId] [int] NOT NULL,
	[PremisesId] [int] NOT NULL,
	[FloorId] [int] NOT NULL,
	[TotalBay] [int] NULL,
	[SequenceNo] [int] NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL   DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[PremisesFloorId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoggedTasks]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoggedTasks](
	[TaskId] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[Description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TaskTeamId] [bigint] NOT NULL,
	[TaskTypeId] [bigint] NOT NULL,
	[TaskSubDetail1Id] [bigint] NOT NULL,
	[TaskSubDetail2Id] [bigint] NOT NULL,
	[TimeSpent] [decimal](3, 1) NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [date] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[TaskId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManagementEmployee]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagementEmployee](
	[RecordId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[FromDateId] [bigint] NOT NULL,
	[TillDateId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL
)

GO
/****** Object:  Table [dbo].[ManpowerRequisitionForm]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManpowerRequisitionForm](
	[ManpowerRequisitionFormDataId] [bigint] IDENTITY(1,1) NOT NULL,
	[InviteId] [bigint] NOT NULL,
	[FormSubmittedTo] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Department] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsReplacement] [bit] NULL,
	[ReplacedEmployeeName] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReplacedEmployeeDesignation] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsPlacementNew] [bit] NULL,
	[NumberOfNewPlacement] [bigint] NULL,
	[FixedCTC] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GrossBudget] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobRequirement] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ETAofClosingHiring] [datetime] NOT NULL,
	[ETAofJoining] [datetime] NOT NULL,
	[EducationalQualification] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobDescription] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MinExperienceRequired] [bigint] NOT NULL,
	[MaxExperienceRequired] [bigint] NOT NULL,
	[SpecialSkillRequirement] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SupervisorName] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SupervisorDesignation] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TechnologyRequired] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TechnologyLevelRequired] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Version] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
  PRIMARY KEY CLUSTERED
(
	[ManpowerRequisitionFormDataId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManpowerRequisitionInvite]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManpowerRequisitionInvite](
	[InviteId] [bigint] IDENTITY(1,1) NOT NULL,
	[ToEmailId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Position] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RandomCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [bigint] NULL,
PRIMARY KEY CLUSTERED
(
	[InviteId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaritalStatus]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaritalStatus](
	[MaritalStatusId] [int] NOT NULL,
	[MaritalStatusType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[MaritalStatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MarkedLWP]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarkedLWP](
	[Date] [date] NULL,
	[EmployeeName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RM] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employee_Id] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Intern] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [int] NULL,
	[IsLWPMarked] [bit] NOT NULL DEFAULT ((0))
)

GO
/****** Object:  Table [dbo].[MealCategory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MealCategory](
	[MealCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[MealCategoryName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[MealCategoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MealDishes]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MealDishes](
	[MealDishesId] [int] IDENTITY(1,1) NOT NULL,
	[MealDishesName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MealDishesId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MealPackage]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MealPackage](
	[MealPackageId] [int] IDENTITY(1,1) NOT NULL,
	[MealPackageName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MealPeriodId] [int] NOT NULL,
	[MealTypeId] [int] NOT NULL,
	[MealCategoryId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MealPackageId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MealPackageDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MealPackageDetail](
	[MealPackageDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[MealPackageId] [int] NOT NULL,
	[MealDate] [date] NOT NULL,
	[MealDishesId] [int] NOT NULL,
	[MealItemName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MealPackageDetailId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MealPackageFeedback]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MealPackageFeedback](
	[MealPackageFeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[MealPackageId] [int] NOT NULL,
	[Liked] [bit] NOT NULL,
	[Comment] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedByUserId] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[MealPackageFeedbackId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MealPeriod]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MealPeriod](
	[MealPeriodId] [int] IDENTITY(1,1) NOT NULL,
	[MealPeriodName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StartTime] [time](7) NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[MealPeriodId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MealType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MealType](
	[MealTypeId] [int] IDENTITY(1,1) NOT NULL,
	[MealTypeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[MealTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[ParentMenuId] [int] NOT NULL,
	[MenuName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ControllerName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ActionName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Sequence] [int] NOT NULL,
	[IsLinkEnabled] [bit] NOT NULL   DEFAULT ((1)),
	[IsVisible] [bit] NOT NULL   DEFAULT ((1)),
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[CssClass] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDelegatable] [bit] NOT NULL DEFAULT ((0)),
	[IsTabMenu] [bit] NOT NULL   DEFAULT ((0)),
 PRIMARY KEY CLUSTERED
(
	[MenuId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenusApprovalLevel]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenusApprovalLevel](
	[MenusApprovalLevelId] [bigint] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[Role] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RoleDesciption] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NoOfLevels] [int] NOT NULL,
	[ApprovalSequence] [int] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MenusApprovalLevelId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenusRolePermission]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenusRolePermission](
	[MenusRolePermissionId] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsViewRights] [bit] NOT NULL DEFAULT ((0)),
	[IsAddRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsModifyRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsDeleteRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsAssignRights] [bit] NOT NULL  DEFAULT ((0)),
	[IsApproveRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MenusRolePermissionId] ASC
))

GO
/****** Object:  Table [dbo].[MenusUserDelegation]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenusUserDelegation](
	[MenusUserDelegationId] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[DelegatedFromUserId] [int] NOT NULL,
	[DelegatedToUserId] [int] NOT NULL,
	[DelegatedFromDate] [datetime] NOT NULL,
	[DelegatedTillDate] [datetime] NOT NULL,
	[IsViewRights] [bit] NOT NULL  DEFAULT ((0)),
	[IsAddRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsModifyRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsDeleteRights] [bit] NOT NULL  DEFAULT ((0)),
	[IsAssignRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsApproveRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MenusUserDelegationId] ASC
))

GO
/****** Object:  Table [dbo].[MenusUserPermission]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenusUserPermission](
	[MenusUserPermissionId] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsViewRights] [bit] NOT NULL  DEFAULT ((0)),
	[IsAddRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsModifyRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsDeleteRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsAssignRights] [bit] NOT NULL  DEFAULT ((0)),
	[IsApproveRights] [bit] NOT NULL   DEFAULT ((0)),
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MenusUserPermissionId] ASC
))

GO
/****** Object:  Table [dbo].[NetXs_ReaderData]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetXs_ReaderData](
	[Reader] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dt] [datetime] NULL,
	[cardid] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reason] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[newcardid] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
/****** Object:  Table [dbo].[NewDesignationsList]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewDesignationsList](
	[Designation] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DesignationGroup] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sequence] [int] NULL,
	[IsIntern] [bit] NULL,
	[DesignationGroupId] [int] NULL,
	[DesignationId] [int] NULL
)

GO
/****** Object:  Table [dbo].[News]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [bigint] IDENTITY(1,1) NOT NULL,
	[NewsTitle] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NewsDescription] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FromDate] [datetime] NOT NULL,
	[TillDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	 PRIMARY KEY CLUSTERED
    (
    	[NewsId] ASC
    )
)
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[News] ADD [Link] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[News] ADD [IsInternal] [bit] NOT NULL DEFAULT ((1))


GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Occupation]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Occupation](
	[OccupationId] [int] IDENTITY(1,1) NOT NULL,
	[OccupationName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[OccupationId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OfficeDutyRequest]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OfficeDutyRequest](
	[OfficeDutyRequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[OfficeDutyTypeId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[FromDateId] [bigint] NOT NULL,
	[TillDateId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[Reason] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ApproverId] [int] NULL,
	[ApproverRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[OfficeDutyRequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OfficeDutyRequestHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OfficeDutyRequestHistory](
	[OfficeDutyRequestHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[OfficeDutyRequestId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[ApproverId] [int] NULL,
	[ApproverRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NOT NULL,
    PRIMARY KEY CLUSTERED
(
	[OfficeDutyRequestHistoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OfficeDutyType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OfficeDutyType](
	[OfficeDutyTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DutyType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[OfficeDutyTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OnshoreManager]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OnshoreManager](
	[OnshoreMgrId] [bigint] IDENTITY(1,1) NOT NULL,
	[ManagerName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EmailId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ClientId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[OnshoreMgrId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OutingRequest]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[OutingRequest](
	[OutingRequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[OutingTypeId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[FromDateId] [bigint] NOT NULL,
	[TillDateId] [bigint] NOT NULL,
	[Reason] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryContactNo] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AlternativeContactNo] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatusId] [bigint] NOT NULL  DEFAULT ((2)),
	[NextApproverId] [int] NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[OutingRequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OutingRequestDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutingRequestDetail](
	[OutingRequestDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[OutingRequestId] [bigint] NOT NULL,
	[DateId] [int] NULL,
	[StatusId] [bigint] NOT NULL   DEFAULT ((2)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[OutingRequestDetailId] ASC
))

GO
/****** Object:  Table [dbo].[OutingRequestHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OutingRequestHistory](
	[OutingRequestHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[OutingRequestId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL   DEFAULT ((1)),
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[OutingRequestHistoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OutingRequestStatus]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[OutingRequestStatus](
	[StatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StatusCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[StatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OutingType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OutingType](
	[OutingTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OutingTypeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[OutingTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PimcoAchievement]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PimcoAchievement](
	[PimcoAchievementId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FYStartYear] [int] NOT NULL,
	[QuarterNo] [int] NOT NULL,
	[QuarterStartDate] [date] NOT NULL,
	[QuarterEndDate] [date] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[ToBeDiscussedWithHR] [bit] NOT NULL DEFAULT ((0)),
	[EmpComments] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RMComments] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[PimcoAchievementId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PimcoAchievementDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PimcoAchievementDetail](
	[PimcoAchievementDetailId] [int] IDENTITY(1,1) NOT NULL,
	[PimcoAchievementId] [int] NOT NULL,
	[Achievement] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Purpose] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ProjectId] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[PimcoAchievementDetailId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PimcoEVP]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoEVP](
	[PimcoEVPId] [bigint] IDENTITY(1,1) NOT NULL,
	[PimcoSVPId] [bigint] NOT NULL,
	[IsActive] [int] NOT NULL,
	[PimcoEVPName] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedByID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [bigint] NULL,
	[ModifiedById] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[PimcoEVPId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoExecutive]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoExecutive](
	[PimcoExecutiveId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PimcoId] [bigint] NOT NULL,
	[PimcoOnboardingCategoryTypeId] [bigint] NOT NULL,
	[PimcoStartDate] [datetime] NOT NULL,
	[IsActive] [int] NOT NULL,
	[CreatedByID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[OffboardingDate] [datetime] NULL,
	[OffboardingCategoryTypeId] [bigint] NULL,
	[OffboardingReasonTypeId] [bigint] NULL,
  PRIMARY KEY CLUSTERED
(
	[PimcoExecutiveId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoExecutiveTeamMapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoExecutiveTeamMapping](
	[PimcoExecutiveTeamMappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[PimcoExecutiveId] [bigint] NOT NULL,
	[PimcoEVPId] [bigint] NOT NULL,
	[PimcoSVPId] [bigint] NOT NULL,
	[PimcoSupervisorId] [bigint] NOT NULL,
	[PimcoGroupId] [bigint] NOT NULL,
	[PimcoTeamId] [bigint] NOT NULL,
	[PimcoSubTeamId] [bigint] NOT NULL,
	[IsActive] [int] NOT NULL,
	[CreatedByID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[PimcoExecutiveTeamMappingId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoGroup]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoGroup](
	[PimcoGroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[IsActive] [int] NOT NULL,
	[PimcoGroupName] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedByID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [bigint] NULL,
	[ModifiedById] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[PimcoGroupId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoMonthlyAchievement]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PimcoMonthlyAchievement](
	[PimcoAchievementId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FYStartYear] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[ToBeDiscussedWithHR] [bit] NOT NULL DEFAULT ((0)),
	[EmpComments] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RMComments] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[PimcoAchievementId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PimcoMonthlyAchievementDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PimcoMonthlyAchievementDetail](
	[PimcoAchievementDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[PimcoProjectId] [int] NOT NULL,
	[PimcoAchievementId] [bigint] NOT NULL,
	[Achievement] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[PimcoAchievementDetailId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PimcoOffboardingCategoryType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoOffboardingCategoryType](
	[PimcoOffboardingCategoryTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[IsActive] [int] NOT NULL,
	[PimcoOffboardingCategoryTypeName] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedByID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [bigint] NULL,
	[ModifiedById] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[PimcoOffboardingCategoryTypeId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoOffboardingReasonType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoOffboardingReasonType](
	[PimcoOffboardingReasonTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[IsActive] [int] NOT NULL,
	[PimcoOffboardingReasonTypeName] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedByID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [bigint] NULL,
	[ModifiedById] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[PimcoOffboardingReasonTypeId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoOnboardingCategoryType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoOnboardingCategoryType](
	[PimcoOnboardingCategoryTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[IsActive] [int] NOT NULL,
	[PimcoOnboardingCategoryTypeName] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedByID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [bigint] NULL,
	[ModifiedById] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[PimcoOnboardingCategoryTypeId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoOrgUser]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PimcoOrgUser](
	[UserHierarchyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ParentUserHierarchyId] [int] NULL,
	[ParentName] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmplopeeId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OffshoreManager] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OffshoreManagerEmployeeId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OnshoreManager] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OnshoreManagerEmployeeId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TotalExperience] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PimcoTenure] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TopNSkills] [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProfileSummary] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoleDetail] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [int] NULL,
	[ParentUserId] [int] NULL,
	[Gender] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[IsVisible] [bit] NOT NULL DEFAULT ((1)),
	[PimcoId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PimcoParentId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Role] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrgManagerName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PimcoProjects]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PimcoProjects](
	[PimcoProjectId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ParentProjectId] [int] NOT NULL   DEFAULT ((0)),
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[VerticalId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[PimcoProjectId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PimcoProjectTeamMembers]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PimcoProjectTeamMembers](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[PimcoProjectId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ProjectRole] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AllocatedFrom] [date] NOT NULL,
	[AllocatedTill] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PimcoProjectVertical]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PimcoProjectVertical](
	[VerticalId] [bigint] IDENTITY(1,1) NOT NULL,
	[Vertical] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[OwnerId] [int] NOT NULL   DEFAULT ((0)),
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [date] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[VerticalId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PimcoSubTeam]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoSubTeam](
	[PimcoSubTeamId] [bigint] IDENTITY(1,1) NOT NULL,
	[PimcoTeamId] [bigint] NOT NULL,
	[IsActive] [int] NOT NULL,
	[PimcoSubTeamName] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedByID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [bigint] NULL,
	[ModifiedById] [datetime] NULL,
  PRIMARY KEY CLUSTERED
(
	[PimcoSubTeamId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoSupervisor]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoSupervisor](
	[PimcoSupervisorId] [bigint] IDENTITY(1,1) NOT NULL,
	[IsActive] [int] NOT NULL,
	[PimcoSupervisorName] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedByID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [bigint] NULL,
	[ModifiedById] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[PimcoSupervisorId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoSVP]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoSVP](
	[PimcoSVPId] [bigint] IDENTITY(1,1) NOT NULL,
	[PimcoSupervisorId] [bigint] NOT NULL,
	[IsActive] [int] NOT NULL,
	[PimcoSVPName] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedByID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [bigint] NULL,
	[ModifiedById] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[PimcoSVPId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoTeam]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoTeam](
	[PimcoTeamId] [bigint] IDENTITY(1,1) NOT NULL,
	[PimcoGroupId] [bigint] NOT NULL,
	[IsActive] [int] NOT NULL,
	[PimcoTeamName] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedByID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [bigint] NULL,
	[ModifiedById] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[PimcoTeamId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoUser]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PimcoUser](
	[PimcoUserId] [bigint] IDENTITY(1,1) NOT NULL,
	[GeminiUserId] [int] NOT NULL,
	[PimcoEmployeeId] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PimcoManagerName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[PimcoUserId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PimcoUserExpiration]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoUserExpiration](
	[PimcoUserExpirationId] [bigint] IDENTITY(1,1) NOT NULL,
	[PimcoUserId] [bigint] NOT NULL,
	[UserValidFromDate] [date] NOT NULL,
	[UserValidToDate] [date] NOT NULL,
	[IsAcknowledged] [bit] NOT NULL,
	[AcknowledgedBy] [int] NULL,
	[AcknowledgedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[PimcoUserExpirationId] ASC
))

GO
/****** Object:  Table [dbo].[PimcoUserImages]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PimcoUserImages](
	[UserId] [int] NULL,
	[Name] [nvarchar](19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Gender] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmplopeeId] [nvarchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ImagePath] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
/****** Object:  Table [dbo].[PlData]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlData](
	[Employee_Name] [nvarchar](27) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Joining_Date] [datetime] NULL,
	[Intern] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Old_PL] [numeric](3, 1) NULL,
	[New_PL] [numeric](2, 1) NULL,
	[Total_PL] [numeric](3, 1) NULL,
	[New_PL_Leaves] [numeric](3, 1) NULL,
	[PL_Encashed] [numeric](3, 1) NULL,
	[Updated_Old_PL] [numeric](3, 1) NULL,
	[FINAL_PL] [numeric](3, 1) NULL
)

GO
/****** Object:  Table [dbo].[Policy]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Policy](
	[PolicyId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyTitle] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PolicyName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[PolicyId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Premises]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Premises](
	[PremisesId] [int] NULL,
	[PremisesName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProfessionalAndEducationalExperience]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProfessionalAndEducationalExperience](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProfileId] [bigint] NOT NULL,
	[FromDate] [date] NOT NULL,
	[TillDate] [date] NOT NULL,
	[OrganizationName] [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DesignationOrField] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Role] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProfileRequest]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProfileRequest](
	[RequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestedById] [int] NOT NULL,
	[RequestedForId] [int] NOT NULL,
	[RandomCode] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsExpired] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[RequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectIndustryType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectIndustryType](
	[IndustryTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[IndustryType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [date] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[IndustryTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectMaster](
	[ProjectId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[ClientResourceId] [bigint] NOT NULL,
	[ProjectName] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ProjectCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[FriendlyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[ProjectId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectPrefrences]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectPrefrences](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [date] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
/****** Object:  Table [dbo].[ProjectRole]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectRole](
	[ProjectRoleId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectRoleType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[ProjectRoleId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectId] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentProjectId] [bigint] NULL,
	[Name] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[VerticalId] [bigint] NOT NULL,
	[IndustryTypeId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [date] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[ProjectId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectStatus]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectStatus](
	[ProjectStatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [date] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[ProjectStatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectTeamMembers]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectTeamMembers](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[Role] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[AllocatedFrom] [date] NOT NULL,
	[AllocatedTill] [date] NULL,
	[CreatedDate] [date] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectVertical]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectVertical](
	[VerticalId] [bigint] IDENTITY(1,1) NOT NULL,
	[Vertical] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[OwnerId] [int] NOT NULL   DEFAULT ((0)),
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [date] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[VerticalId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PromotedUserApr2019]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PromotedUserApr2019](
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OldDesignation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewDesignation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Promotion] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [int] NULL,
	[OldDesignationId] [int] NULL,
	[NewDesignationId] [int] NULL,
	[ExistingDesignationId] [int] NULL,
	[ExistingDesignation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PromotedUserApr2020]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PromotedUserApr2020](
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OldDesignation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewDesignation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Promotion] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [int] NULL,
	[OldDesignationId] [int] NULL,
	[NewDesignationId] [int] NULL,
	[ExistingDesignationId] [int] NULL,
	[ExistingDesignation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingDesignationGroupId] [int] NULL,
	[ExistingDesignationGroup] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Referral]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Referral](
	[ReferralId] [int] IDENTITY(1,1) NOT NULL,
	[OpeningFrom] [date] NOT NULL,
	[OpeningTill] [date] NOT NULL,
	[Profile] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[IsPositionClosed] [bit] NOT NULL DEFAULT ((0)),
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[CategoryID] [int] NULL,
	[Experience] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SourceID] [int] NULL,
	[HROwner] [int] NULL,
	[JDName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsFlyerEnabled] [bit] NULL,
 PRIMARY KEY CLUSTERED
(
	[ReferralId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferralCategory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReferralCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferralDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReferralDetail](
	[ReferralDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ReferralId] [int] NOT NULL,
	[RefereeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RelationWithReferee] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Resume] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[ReferredById] [int] NOT NULL,
	[IsPublished] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RefereeMailID] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatusID] [int] NULL,
	[Contact] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NoticeID] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[CandidateUId] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 PRIMARY KEY CLUSTERED
(
	[ReferralDetailId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferralManagers]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferralManagers](
	[SeqId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[HiringMangerID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL,
	[IsActive] [int] NOT NULL
)

GO
/****** Object:  Table [dbo].[ReferralNotice]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReferralNotice](
	[NoticeId] [int] IDENTITY(1,1) NOT NULL,
	[NoticePeriod] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferralRelation]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReferralRelation](
	[RelationId] [int] IDENTITY(1,1) NOT NULL,
	[RelationName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferralReview]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReferralReview](
	[ReferralReviewId] [int] IDENTITY(1,1) NOT NULL,
	[ReferralDetailId] [int] NOT NULL,
	[ForwardedToId] [int] NOT NULL,
	[CommentsByReviewer] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReferredById] [int] NOT NULL,
	[IsRelevant] [int] NULL,
	[Message] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[ReferralReviewId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferralSource]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReferralSource](
	[SourceId] [int] IDENTITY(1,1) NOT NULL,
	[SourceName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL,
	[IsActive] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferralStatus]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReferralStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReimbursementCategory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReimbursementCategory](
	[ReimbursementCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ReimbursementTypeId] [int] NOT NULL,
	[ReimbursementName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[ReimbursementCategoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReimbursementDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReimbursementDetail](
	[ReimbursementDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[ReimbursementRequestId] [bigint] NOT NULL,
	[ReimbursementCategoryId] [int] NOT NULL,
	[DocumentPath] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DocumentName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BillNo] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Date] [date] NOT NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDocumentValid] [bit] NOT NULL   DEFAULT ((1)),
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
PRIMARY KEY CLUSTERED
(
	[ReimbursementDetailId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReimbursementHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReimbursementHistory](
	[ReimbursementHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[ReimbursementRequestId] [bigint] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[ReimbursementHistoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReimbursementRequest]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReimbursementRequest](
	[ReimbursementRequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ReimbursementTypeId] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[ReimbRequestedAmt] [decimal](18, 2) NOT NULL,
	[ReimbApprovedAmt] [decimal](18, 2) NULL,
	[NextApproverId] [int] NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatusId] [int] NOT NULL,
	[IsReferredBack] [bit] NOT NULL   DEFAULT ((0)),
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[SubmittedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
PRIMARY KEY CLUSTERED
(
	[ReimbursementRequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReimbursementStatus]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReimbursementStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StatusCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[StatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReimbursementType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReimbursementType](
	[ReimbursementTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ReimbursementTypeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[ReimbursementTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Relationship]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Relationship](
	[RelationshipId] [int] IDENTITY(1,1) NOT NULL,
	[RelationshipName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[RelationshipId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RequestCompOff]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RequestCompOff](
	[RequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateId] [bigint] NOT NULL,
	[NoOfDays] [int] NOT NULL,
	[Reason] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StatusId] [bigint] NOT NULL   DEFAULT ((1)),
	[ApproverId] [int] NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[IsLapsed] [bit] NOT NULL   DEFAULT ((0)),
	[LapseDate] [date] NOT NULL DEFAULT (getdate()),
	[IsAvailed] [bit] NOT NULL   DEFAULT ((0)),
 PRIMARY KEY CLUSTERED
(
	[RequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RequestCompOffDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestCompOffDetail](
	[RequestCompOffDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [bigint] NOT NULL,
	[LeaveRequestApplicationId] [bigint] NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[LegitimateLeaveRequestId] [bigint] NULL,
  PRIMARY KEY CLUSTERED
(
	[RequestCompOffDetailId] ASC
))

GO
/****** Object:  Table [dbo].[RequestCompOffHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RequestCompOffHistory](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL   DEFAULT ((1)),
	[ApproverId] [int] NOT NULL,
	[ApproverRemarks] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RequestLnsa]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RequestLnsa](
	[RequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[FromDateId] [bigint] NOT NULL,
	[TillDateId] [bigint] NOT NULL,
	[TotalNoOfDays] [int] NOT NULL,
	[Reason] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ApproverRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [int] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [bigint] NULL,
	[ApproverId] [int] NULL,
	[StatusId] [bigint] NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[RequestId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RequestLnsaHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RequestLnsaHistory](
	[RequestLnsaHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
  PRIMARY KEY CLUSTERED
(
	[RequestLnsaHistoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AccessSequence] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[RoleId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchedulerAction]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchedulerAction](
	[ActionId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FunctionName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RepeatAfterPeriod] [float] NULL,
	[RepeatAfterType] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastRunTime] [datetime] NULL,
	[LastRunResult] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NextRunTime] [datetime] NULL,
	[RunFor] [int] NOT NULL   DEFAULT ((1)),
	[Ids] [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[IsCombinedEmail] [bit] NOT NULL   DEFAULT ((1)),
  PRIMARY KEY CLUSTERED
(
	[ActionId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeatAllocationDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeatAllocationDetail](
	[SeatAllocationDetailId] [int] NOT NULL,
	[SeatId] [int] NOT NULL,
	[AllocationTypeId] [int] NULL,
	[UserId] [int] NULL,
	[AllocationFrom] [datetime] NULL,
	[OnboardingId] [int] NULL,
	[JoiningDate] [datetime] NULL,
	[SystemRequirementId] [int] NULL,
	[DatabaseName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Remark] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlockingFrom] [datetime] NULL,
	[BlockingReasonId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[SeatAllocationDetailId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeatCheckDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatCheckDetail](
	[SeatCheckId] [int] NOT NULL,
	[SeatId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[IsItemChecked] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL   DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[SeatCheckId] ASC
))

GO
/****** Object:  Table [dbo].[SeatDetailTemp]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeatDetailTemp](
	[SeatId] [int] NOT NULL,
	[PremisesFloorId] [int] NOT NULL,
	[SeatNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SeatTypeId] [int] NOT NULL,
	[BayNumber] [int] NULL,
	[SeatStatusId] [int] NOT NULL,
	[IsChecked] [bit] NOT NULL,
	[UnitId] [int] NULL,
	[AllocationTypeId] [int] NULL,
	[EmployeeId] [int] NULL,
	[AllocationFrom] [datetime] NULL,
	[OnboardingId] [int] NULL,
	[JoiningDate] [datetime] NULL,
	[SystemRequirementId] [int] NULL,
	[Remark] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[SequenceNumber] [int] NULL,
	[BlockingReason] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlockingFrom] [datetime] NULL,
  PRIMARY KEY CLUSTERED
(
	[SeatId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeatItemMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeatItemMaster](
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SequenceNo] [int] NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL   DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[ItemId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeatMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeatMaster](
	[SeatId] [int] NOT NULL,
	[PremisesFloorId] [int] NOT NULL,
	[SeatNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SeatTypeId] [int] NOT NULL,
	[BayNumber] [int] NULL,
	[SeatStatusId] [int] NOT NULL,
	[IsChecked] [bit] NOT NULL,
	[UnitId] [int] NULL,
	[SequenceNo] [int] NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL   DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
  PRIMARY KEY CLUSTERED
(
	[SeatId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeatStatusMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeatStatusMaster](
	[StatusId] [int] NOT NULL,
	[StatusName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SequenceNo] [int] NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL  DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 PRIMARY KEY CLUSTERED
(
	[StatusId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeatTypeMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeatTypeMaster](
	[SeatTypeId] [int] NOT NULL,
	[SeatTypeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SequenceNo] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL   DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
  PRIMARY KEY CLUSTERED
(
	[SeatTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SharedGroupDocument]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SharedGroupDocument](
	[SharedGroupDocumentId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NOT NULL,
	[SharedGroupId] [int] NOT NULL,
	[SharedById] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[DateCreated] [date] NOT NULL,
	[DateDeleted] [date] NULL,
 PRIMARY KEY CLUSTERED
(
	[SharedGroupDocumentId] ASC
))

GO
/****** Object:  Table [dbo].[ShareDocument]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShareDocument](
	[ShareDocId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[ShareTo] [int] NULL,
	[ShareBy] [int] NULL,
	[Date] [datetime] NULL,
  PRIMARY KEY CLUSTERED
(
	[ShareDocId] ASC
))

GO
/****** Object:  Table [dbo].[ShiftMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShiftMaster](
	[ShiftId] [bigint] IDENTITY(1,1) NOT NULL,
	[ShiftName] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[InTime] [time](7) NOT NULL,
	[OutTime] [time](7) NOT NULL,
	--[WorkingHours]  AS (CONVERT([time],CONVERT([datetime],[OutTime],(0))-CONVERT([datetime],[InTime],(0)),(0))),
	[IsWeekEnd] [bit] NOT NULL,
	[IsNight] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[ShiftId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Skill](
	[SkillId] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[SkillId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SkillLevel]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SkillLevel](
	[SkillLevelId] [int] IDENTITY(1,1) NOT NULL,
	[SkillLevelName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[Sequence] [int] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[SkillLevelId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SkillType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SkillType](
	[SkillTypeId] [int] IDENTITY(1,1) NOT NULL,
	[SkillTypeName] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Sequence] [int] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[IsVisibleToUser] [bit] NOT NULL   DEFAULT ((1)),
 PRIMARY KEY CLUSTERED
(
	[SkillTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StaffAttendanceForDate]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffAttendanceForDate](
	[Date] [date] NOT NULL,
	[StaffUserId] [int] NULL,
	[InTime] [datetime] NULL,
	[OutTime] [datetime] NULL,
	[IsNightShift] [bit] NOT NULL,
	[Duration] [datetime] NULL
)

GO
/****** Object:  Table [dbo].[State]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NULL,
	[StateName] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED
(
	[StateId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SupportingStaffMember]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupportingStaffMember](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[MobileNo] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LocationId] [int] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskSubDetail1]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskSubDetail1](
	[TaskSubDetail1Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskSubDetail1Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [date] NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[TaskSubDetail1Id] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskSubDetail2]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskSubDetail2](
	[TaskSubDetail2Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskSubDetail2Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL  DEFAULT ((0)),
	[CreatedDate] [date] NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[TaskSubDetail2Id] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskTeam]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskTeam](
	[TaskTeamId] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [date] NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[TaskTeamId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskTeamTaskTypeMapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTeamTaskTypeMapping](
	[MappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskTeamId] [bigint] NOT NULL,
	[TaskTypeId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [date] NULL DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MappingId] ASC
))

GO
/****** Object:  Table [dbo].[TaskTemplates]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskTemplates](
	[TemplateId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TaskTeamId] [bigint] NOT NULL,
	[TaskTypeId] [bigint] NOT NULL,
	[TaskSubDetail1Id] [bigint] NOT NULL,
	[TaskSubDetail2Id] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [date] NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[TemplateId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskType](
	[TaskTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskTypeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [date] NULL  DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[TaskTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskTypeTaskSubDetail1Mapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTypeTaskSubDetail1Mapping](
	[MappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskTypeId] [bigint] NOT NULL,
	[TaskSubDetail1Id] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL  DEFAULT ((1)),
	[CreatedDate] [date] NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[MappingId] ASC
))

GO
/****** Object:  Table [dbo].[TaskTypeTaskSubDetail2Mapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTypeTaskSubDetail2Mapping](
	[MappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskTypeId] [bigint] NOT NULL,
	[TaskSubDetail2Id] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [date] NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MappingId] ASC
))

GO
/****** Object:  Table [dbo].[Team]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Team](
	[TeamId] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[WeekDayId] [int] NOT NULL,
	[IsReminderEmailsEnabled] [bit] NOT NULL,
	[IsAttendanceEmailsEnabled] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL   DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[TeamHeadId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ParentTeamId] [int] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[TeamId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeamEmailType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeamEmailType](
	[TeamEmailTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TeamEmailTypeName] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[TeamEmailTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeamEmailTypeMapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamEmailTypeMapping](
	[MappingId] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[TeamEmailTypeId] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[Time] [time](7) NOT NULL,
	[WeekDayId] [int] NOT NULL,
	[Week] [int] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MappingId] ASC
))

GO
/****** Object:  Table [dbo].[TeamGoal]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeamGoal](
	[TeamGoalId] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[AppraisalCycleId] [int] NULL,
	[StartDateId] [bigint] NOT NULL,
	[EndDateId] [bigint] NOT NULL,
	[Goal] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[OtherRemark] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL   DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[GoalStatusId] [bigint] NOT NULL,
	[GoalCategoryId] [int] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[TeamGoalId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeamGoalComment]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeamGoalComment](
	[TeamGoalCommentId] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamGoalId] [bigint] NOT NULL,
	[SelfComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppraiserComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ApproverComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[TeamGoalCommentId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeamGoalHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeamGoalHistory](
	[TeamGoalHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamGoalId] [bigint] NOT NULL,
	[StartDateId] [bigint] NOT NULL,
	[EndDateId] [bigint] NOT NULL,
	[Goal] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[GoalStatusId] [bigint] NOT NULL,
	[Remarks] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[GoalCategoryId] [int] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[TeamGoalHistoryId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeamRole]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeamRole](
	[TeamRoleId] [int] IDENTITY(1,1) NOT NULL,
	[TeamRoleName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccessSequence] [int] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[TeamRoleId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Temp_AppraisalAdditionalEXLData_2022]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp_AppraisalAdditionalEXLData_2022](
	[EmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Temp_AppraisalData_2020]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp_AppraisalData_2020](
	[UserId] [int] NULL,
	[LocationId] [int] NULL,
	[LocationName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1UserId] [int] NULL,
	[L2UserId] [int] NULL,
	[DesignationId] [int] NULL,
	[ExistingDesignation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingEmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingRM] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingL1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingL2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamId] [int] NULL,
	[TeamName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepartmentId] [int] NULL,
	[DepartmentName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepartmentHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionId] [int] NULL,
	[Division] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Intern] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsManager] [bit] NOT NULL DEFAULT ((0)),
	[CompetencyFormId] [int] NULL,
	[CompetencyFormName] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Designation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RM] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DoJ] [date] NULL,
	[L1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1))
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Temp_AppraisalData_2021]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp_AppraisalData_2021](
	[UserId] [int] NULL,
	[LocationId] [int] NULL,
	[LocationName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1UserId] [int] NULL,
	[L2UserId] [int] NULL,
	[DesignationId] [int] NULL,
	[ExistingDesignation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingEmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingRM] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingL1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingL2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamId] [int] NULL,
	[TeamName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepartmentId] [int] NULL,
	[DepartmentName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepartmentHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionId] [int] NULL,
	[Division] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Intern] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsManager] [bit] NOT NULL DEFAULT ((0)),
	[CompetencyFormId] [int] NULL,
	[CompetencyFormName] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Designation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RM] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DoJ] [date] NULL,
	[L1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL ,
	[Modifieddate] [datetime] NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1))
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Temp_AppraisalData_2021_Bkp]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp_AppraisalData_2021_Bkp](
	[UserId] [int] NULL,
	[LocationId] [int] NULL,
	[LocationName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1UserId] [int] NULL,
	[L2UserId] [int] NULL,
	[DesignationId] [int] NULL,
	[ExistingDesignation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingEmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingRM] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingL1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingL2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamId] [int] NULL,
	[TeamName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepartmentId] [int] NULL,
	[DepartmentName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepartmentHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionId] [int] NULL,
	[Division] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Intern] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsManager] [bit] NOT NULL,
	[CompetencyFormId] [int] NULL,
	[CompetencyFormName] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Designation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RM] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DoJ] [date] NULL,
	[L1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Temp_AppraisalData_2021_Revised_L1_L2]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp_AppraisalData_2021_Revised_L1_L2](
	[UserId] [int] NULL,
	[LocationId] [int] NULL,
	[LocationName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1UserId] [int] NULL,
	[L2UserId] [int] NULL,
	[DesignationId] [int] NULL,
	[ExistingDesignation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingEmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingRM] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingL1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingL2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamId] [int] NULL,
	[TeamName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepartmentId] [int] NULL,
	[DepartmentName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepartmentHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionId] [int] NULL,
	[Division] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Intern] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsManager] [bit] NOT NULL DEFAULT ((0)),
	[CompetencyFormId] [int] NULL,
	[CompetencyFormName] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Designation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RM] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DoJ] [date] NULL,
	[L1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1))
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Temp_AppraisalData_2022]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp_AppraisalData_2022](
	[UserId] [int] NULL,
	[LocationId] [int] NULL,
	[LocationName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1UserId] [int] NULL,
	[L2UserId] [int] NULL,
	[DesignationId] [int] NULL,
	[ExistingDesignation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingEmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingRM] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingL1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingL2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamId] [int] NULL,
	[TeamName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepartmentId] [int] NULL,
	[DepartmentName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepartmentHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionId] [int] NULL,
	[Division] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionHead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Intern] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsManager] [bit] NOT NULL DEFAULT ((0)),
	[CompetencyFormId] [int] NULL,
	[CompetencyFormName] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Designation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RM] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DoJ] [date] NULL,
	[L1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL ,
	[Modifieddate] [datetime] NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1))
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Temp_AppraisalEXLData_2022]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp_AppraisalEXLData_2022](
	[EmployeeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2EmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Temp_Employee_Assets_Mapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp_Employee_Assets_Mapping](
	[EmployeeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SerialNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModelName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OS] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DoJ] [datetime] NULL,
	[AssetTypeId] [int] NULL,
	[AssetType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BrandId] [int] NULL,
	[BrandName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempCardIssueDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempCardIssueDetail](
	[IssueId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[AccessCardId] [int] NULL,
	[IssueDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
	[Reason] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsReturn] [bit] NULL ,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[IssueId] ASC
)
)

GO
/****** Object:  Table [dbo].[TempEmployeeReminderDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempEmployeeReminderDetail](
	[EmployeeName] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeId] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder1Day] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder1Time] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder2Day] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder2Time] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder3Day] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder3Time] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempLnsaRequestHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempLnsaRequestHistory](
	[RequestId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempLnsaRequestHistoryForReqLNSAHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempLnsaRequestHistoryForReqLNSAHistory](
	[RequestId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempPimcoOrgUser]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempPimcoOrgUser](
	[UserHierarchyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EmplopeeId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OffshoreManager] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OffshoreManagerEmployeeId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OnshoreManager] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TotalExperience] [decimal](18, 10) NULL,
	[PimcoTenure] [decimal](18, 10) NULL,
	[TopNSkills] [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProfileSummary] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PimcoEmployeeId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrgManagerPIMCOid] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoleDetail] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VisioTeam] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VisioSubteam] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VisioBox] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Role] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrgManager] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [int] NULL,
	[ParentUserId] [int] NULL,
	[ParentUserHierarchyId] [int] NULL,
	[ParentName] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Gender] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[IsVisible] [bit] NOT NULL DEFAULT ((1))
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempRequestLnsaDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempRequestLnsaDetail](
	[RequestId] [bigint] NULL,
	[DateId] [bigint] NULL,
	[IsApprovedBySystem] [bit] NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifedBy] [int] NULL,
	[LastModifedDate] [datetime] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempRequestLnsaDetailForDateWise]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempRequestLnsaDetailForDateWise](
	[RequestId] [bigint] NULL,
	[DateId] [bigint] NULL,
	[IsApprovedBySystem] [bit] NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifedBy] [int] NULL,
	[LastModifedDate] [datetime] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempTerminatedEmployeeDesignation]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempTerminatedEmployeeDesignation](
	[EmployeeName] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Designation] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempUserAddressDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempUserAddressDetail](
	[TempUserAddressDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[RegistrationId] [bigint] NULL,
	[Address] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CountryId] [int] NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[PinCode] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsAddressPermanent] [bit] NULL,
PRIMARY KEY CLUSTERED
(
	[TempUserAddressDetailId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempUserRegistration]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TempUserRegistration](
	[RegistrationId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TempUserGuid] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsGuidExpired] [bit] NULL ,
	[GuidExpiryDate] [datetime] NULL,
	[FirstName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MiddleName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DOB] [date] NULL,
	[GenderId] [int] NULL,
	  PRIMARY KEY CLUSTERED
    (
    	[RegistrationId] ASC
    )
)
SET ANSI_PADDING ON
ALTER TABLE [dbo].[TempUserRegistration] ADD [BloodGroup] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[TempUserRegistration] ADD [MobileNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
SET ANSI_PADDING ON
ALTER TABLE [dbo].[TempUserRegistration] ADD [EmergencyContactNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[TempUserRegistration] ADD [PersonalEmailId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [MaritalStatusId] [int] NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [InsuranceAmount] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [IsSubmitted] [bit] NULL  DEFAULT ((0))
ALTER TABLE [dbo].[TempUserRegistration] ADD [SubmissionDate] [datetime] NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [IsVerified] [bit] NULL  DEFAULT ((0))
ALTER TABLE [dbo].[TempUserRegistration] ADD [VerificationDate] [datetime] NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [CreatedDate] [datetime] NULL DEFAULT (getdate())
ALTER TABLE [dbo].[TempUserRegistration] ADD [CreatedBy] [int] NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [IsActive] [bit] NULL   DEFAULT ((1))
ALTER TABLE [dbo].[TempUserRegistration] ADD [IsFresher] [bit] NULL
SET ANSI_PADDING ON
ALTER TABLE [dbo].[TempUserRegistration] ADD [LastEmployerName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [LastEmployerLocation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [LastJobDesignation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [LastJobTenure] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [LastJobUAN] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [JobLeavingReason] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [PanCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [AadhaarCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [VoterCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [DrivingLicenseId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [PassportId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [PhotoFileName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
ALTER TABLE [dbo].[TempUserRegistration] ADD [ADUserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL



GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempUserShift]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempUserShift](
	[TempUserShiftId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ShiftId] [bigint] NOT NULL,
	[ApproverId] [int] NULL,
	[StatusId] [bigint] NOT NULL DEFAULT ((2)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[TempUserShiftId] ASC
)
)

GO
/****** Object:  Table [dbo].[TempUserShiftDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempUserShiftDetail](
	[TempUserShiftDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[TempUserShiftId] [bigint] NOT NULL,
	[DateId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL DEFAULT ((2)),
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[TempUserShiftDetailId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempUserShiftHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempUserShiftHistory](
	[TempUserShiftHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[TempUserShiftId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL DEFAULT ((1)),
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[TempUserShiftHistoryId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[TimeSheetId] [bigint] IDENTITY(1,1) NOT NULL,
	[WeekNo] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	--[EndDate]  AS (dateadd(day,(6),[StartDate])),
	[TotalHoursLogged] [decimal](20, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[UserRemarks] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ApproverRemarks] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[SubmittedDate] [datetime] NULL,
	[IsSubmissionOnTime] [bit] NOT NULL DEFAULT ((0)),
	[IsTimeSheetEnabled] [bit] NULL DEFAULT ((0)),
  PRIMARY KEY CLUSTERED
(
	[TimeSheetId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimesheetExcludedUser]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimesheetExcludedUser](
	[TimesheetExcludedUserId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[TimesheetExcludedUserId] ASC
)
)

GO
/****** Object:  Table [dbo].[TimeSheetFinalTasks]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeSheetFinalTasks](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[WeekId] [bigint] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[WeekNo] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[TaskDate] [date] NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[ProjectName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TaskDescription] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TaskTeamName] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TaskType] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TaskSubDetail1] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TaskSubDetail2] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TimeSpent] [decimal](5, 1) NOT NULL,
	[TeamName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [int] NOT NULL,
	[ConsiderInReports] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeSheetReportAccess]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetReportAccess](
	[MappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsAvailableForAutomatedEmails] [bit] NOT NULL,
	[IsForAllTeamMembers] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MappingId] ASC
)
)

GO
/****** Object:  Table [dbo].[TimesheetStatus]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimesheetStatus](
	[TimesheetStatusId] [int] IDENTITY(1,1) NOT NULL,
	[TimesheetStatusName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TimesheetStatusDescription] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[TimesheetStatusId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeSheetTaskMapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetTaskMapping](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeSheetId] [bigint] NOT NULL,
	[TaskId] [bigint] NOT NULL,
	[ConsiderInClientReports] [bit] NOT NULL ,
  PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
)
)

GO
/****** Object:  Table [dbo].[Timezone]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Timezone](
	[TimeZoneId] [int] IDENTITY(1,1) NOT NULL,
	[BaseUTCOffset] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DayLightName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisplayName] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Id] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatndardName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SupportsDayLightSavingTime] [bit] NULL,
  PRIMARY KEY CLUSTERED
(
	[TimeZoneId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tournament]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tournament](
	[TournamentId] [int] IDENTITY(1,1) NOT NULL,
	[TournamentName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[TournamentId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TournamentCategory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TournamentCategory](
	[TournamentCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Category] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TournamentId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[TournamentCategoryId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TournamentSchedule]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentSchedule](
	[TournamentScheduleId] [bigint] IDENTITY(1,1) NOT NULL,
	[TournamentDate] [datetime] NOT NULL,
	[TournamentTeamId] [bigint] NOT NULL,
	[TournamentVSTeamId] [bigint] NOT NULL,
	[Round] [int] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[TournamentScheduleId] ASC
)
)

GO
/****** Object:  Table [dbo].[TournamentScore]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentScore](
	[TournamentScoreId] [bigint] IDENTITY(1,1) NOT NULL,
	[TournamentScheduleId] [bigint] NOT NULL,
	[TournamentTeamId] [bigint] NOT NULL,
	[G1Score] [int] NULL,
	[G2Score] [int] NULL,
	[G3Score] [int] NULL,
	[G4Score] [int] NULL,
	[G5Score] [int] NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
 PRIMARY KEY CLUSTERED
(
	[TournamentScoreId] ASC
)
)

GO
/****** Object:  Table [dbo].[TournamentTeam]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TournamentTeam](
	[TournamentTeamId] [bigint] IDENTITY(1,1) NOT NULL,
	[TournamentCategoryId] [int] NOT NULL,
	[ParticipantsUserIds] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL   DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[TournamentTeamId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Training]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Training](
	[TrainingId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TentativeDate] [date] NOT NULL,
	[NominationStartDate] [date] NOT NULL,
	[NominationEndDate] [date] NOT NULL,
	[IsNominationClosed] [bit] NOT NULL DEFAULT ((0)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
	[Document] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDocumented] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED
(
	[TrainingId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrainingDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrainingDetail](
	[TrainingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[TrainingId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL DEFAULT ((1)),
	[ApproverId] [int] NOT NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[TrainingDetailId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrainingStatus]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrainingStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[LastModifiedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[StatusId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Password] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LoginDate] [datetime] NULL ,
	[UnsuccessfulLoginAttempt] [int] NOT NULL ,
	[LastUnsuccessfulLoginAttemptDate] [datetime] NULL,
	[IsLocked] [bit] NOT NULL ,
	[AccountLockCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UnlockedBy] [int] NULL,
	[IsPasswordResetRequired] [bit] NOT NULL ,
	[IsPasswordResetCodeExpired] [bit] NOT NULL,
	[PasswordResetCode] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastPasswordChanged] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsSuspended] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[ADUserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  PRIMARY KEY CLUSTERED
(
	[UserId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccessCard]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccessCard](
	[UserAccessCardId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[AccessCardId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[IsDeleted] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[IsFinalised] [bit] NOT NULL DEFAULT ((0)),
	[IsPimco] [bit] NOT NULL DEFAULT ((0)),
	[StaffUserId] [int] NULL,
	[AssignedFromDate] [date] NOT NULL,
	[AssignedTillDate] [date] NULL,
  PRIMARY KEY CLUSTERED
(
	[UserAccessCardId] ASC
)
)

GO
/****** Object:  Table [dbo].[UserAchievement]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAchievement](
	[UserAchievementId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpAppraisalSettingId] [bigint] NOT NULL,
	[Achievement] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[UserAchievementId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAchievementComment]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAchievementComment](
	[UserAchievementCommentId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserAchievementId] [bigint] NOT NULL,
	[AppraiserComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ApproverComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL ,
  PRIMARY KEY CLUSTERED
(
	[UserAchievementCommentId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAchievementForMidYear]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAchievementForMidYear](
	[UserAchievementId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AppraisalCycleId] [int] NULL,
	[Achievement] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Remarks] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[UserAchievementId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserActivity]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserActivity](
	[UserActivityId] [bigint] IDENTITY(1,1) NOT NULL,
	[Activity] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[VisitedByUserId] [int] NOT NULL,
	[VisitedForUserId] [int] NULL,
	[ActivityDate] [datetime] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[UserActivityId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserActivityLog]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserActivityLog](
	[UserActivityLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[UserName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IPAddress] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BrowserInfo] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivityStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivityDetail] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LoginTime] [datetime] NOT NULL ,
	[LogoutTime] [datetime] NULL,
	[ClientInfo] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Device] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Latitude] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Longitude] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TimeZone] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ISP] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  PRIMARY KEY CLUSTERED
(
	[UserActivityLogId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAddressDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAddressDetail](
	[UserAddressDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Address] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[PinCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsAddressPermanent] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[UserAddressDetailId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserClientSideManagerAndProjectMapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClientSideManagerAndProjectMapping](
	[MappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientSideManagerId] [bigint] NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsBilled] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[IsDeleted] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MappingId] ASC
)
)

GO
/****** Object:  Table [dbo].[UserDefaulterHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDefaulterHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Reason] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[Id] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetail](
	[UserDetailId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PunchId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MiddleName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DOB] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GenderId] [int] NOT NULL,
	[MaritalStatusId] [int] NULL,
	[BloodGroup] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MobileNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailId] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JoiningDate] [date] NULL,
	[DesignationId] [int] NULL,
	[ImagePath] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TerminateDate] [date] NULL,
	[ReportTo] [int] NULL,
	[LastModifiedDate] [datetime] NULL DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
	[EmergencyContactNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PersonalEmailId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExtensionNumber] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InsuranceAmount] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PanCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AadhaarCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VoterCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DrivingLicenseId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PassportId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastEmployerName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastEmployerLocation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastJobTenure] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobLeavingReason] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UAN] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsFresher] [bit] NULL ,
	[LastJobDesignation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppraisalCycleId] [int] NULL,
	[ProjectManagerId] [int] NULL,
	[IsDOBPublic] [bit] NOT NULL ,
	[IsImageVerified] [bit] NOT NULL ,
	[ProbationPeriodMonths] [int] NULL,
	[IsEligibleForLeave] [bit] NOT NULL ,
	[FTEDate] [date] NULL,
	[WorkStationNo] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsUserVerified] [bit] NOT NULL ,
	[CandidateUId] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeUId] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  PRIMARY KEY CLUSTERED
(
	[UserDetailId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetail_Bkp_20200115]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetail_Bkp_20200115](
	[UserDetailId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PunchId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MiddleName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DOB] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GenderId] [int] NOT NULL,
	[MaritalStatusId] [int] NULL,
	[BloodGroup] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MobileNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailId] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JoiningDate] [date] NULL,
	[DesignationId] [int] NULL,
	[ImagePath] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TerminateDate] [date] NULL,
	[ReportTo] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[EmergencyContactNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PersonalEmailId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExtensionNumber] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InsuranceAmount] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PanCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AadhaarCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VoterCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DrivingLicenseId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PassportId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastEmployerName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastEmployerLocation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastJobTenure] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobLeavingReason] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UAN] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsFresher] [bit] NULL,
	[LastJobDesignation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppraisalCycleId] [int] NULL,
	[ProjectManagerId] [int] NULL,
	[IsDOBPublic] [bit] NOT NULL,
	[IsImageVerified] [bit] NOT NULL,
	[ProbationPeriodMonths] [int] NULL,
	[IsEligibleForLeave] [bit] NOT NULL,
	[FTEDate] [date] NULL,
	[WorkStationNo] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsUserVerified] [bit] NOT NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetail_bkp_com_mig_01_feb]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetail_bkp_com_mig_01_feb](
	[UserDetailId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PunchId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MiddleName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DOB] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GenderId] [int] NOT NULL,
	[MaritalStatusId] [int] NULL,
	[BloodGroup] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MobileNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailId] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JoiningDate] [date] NULL,
	[DesignationId] [int] NULL,
	[ImagePath] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TerminateDate] [date] NULL,
	[ReportTo] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[EmergencyContactNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PersonalEmailId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExtensionNumber] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InsuranceAmount] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PanCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AadhaarCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VoterCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DrivingLicenseId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PassportId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastEmployerName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastEmployerLocation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastJobTenure] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobLeavingReason] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UAN] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsFresher] [bit] NULL,
	[LastJobDesignation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppraisalCycleId] [int] NULL,
	[ProjectManagerId] [int] NULL,
	[IsDOBPublic] [bit] NOT NULL,
	[IsImageVerified] [bit] NOT NULL,
	[ProbationPeriodMonths] [int] NULL,
	[IsEligibleForLeave] [bit] NOT NULL,
	[FTEDate] [date] NULL,
	[WorkStationNo] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsUserVerified] [bit] NOT NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetail_BkpPromotion2020]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetail_BkpPromotion2020](
	[UserDetailId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PunchId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MiddleName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DOB] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GenderId] [int] NOT NULL,
	[MaritalStatusId] [int] NULL,
	[BloodGroup] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MobileNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailId] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JoiningDate] [date] NULL,
	[DesignationId] [int] NULL,
	[ImagePath] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TerminateDate] [date] NULL,
	[ReportTo] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[EmergencyContactNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PersonalEmailId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExtensionNumber] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InsuranceAmount] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PanCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AadhaarCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VoterCardId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DrivingLicenseId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PassportId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastEmployerName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastEmployerLocation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastJobTenure] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobLeavingReason] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UAN] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsFresher] [bit] NULL,
	[LastJobDesignation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppraisalCycleId] [int] NULL,
	[ProjectManagerId] [int] NULL,
	[IsDOBPublic] [bit] NOT NULL,
	[IsImageVerified] [bit] NOT NULL,
	[ProbationPeriodMonths] [int] NULL,
	[IsEligibleForLeave] [bit] NOT NULL,
	[FTEDate] [date] NULL,
	[WorkStationNo] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsUserVerified] [bit] NOT NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserFamilyDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserFamilyDetail](
	[UserFamilyDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RelationshipId] [int] NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DOB] [date] NULL,
	[GenderId] [int] NOT NULL,
	[OccupationId] [int] NULL,
	[Company] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Designation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[UserFamilyDetailId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserFeedback]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserFeedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[Remarks] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsAcknowledged] [bit] NULL ,
	[AcknowledgedBy] [int] NULL,
	[AcknowledgedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL ,
  PRIMARY KEY CLUSTERED
(
	[FeedbackId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserForm]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserForm](
	[UserFormId] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[FormName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FormPath] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[IsDeleted] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[UserFormId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGoal]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGoal](
	[UserGoalId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AppraisalCycleId] [int] NULL,
	[StartDateId] [bigint] NOT NULL,
	[EndDateId] [bigint] NOT NULL,
	[Goal] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[OtherRemark] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[GoalStatusId] [bigint] NOT NULL,
	[GoalCategoryId] [int] NOT NULL,
    PRIMARY KEY CLUSTERED
(
	[UserGoalId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGoalComment]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGoalComment](
	[UserGoalCommentId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserGoalId] [bigint] NOT NULL,
	[SelfComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppraiserComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ApproverComment] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL ,
 PRIMARY KEY CLUSTERED
(
	[UserGoalCommentId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGoalHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGoalHistory](
	[UserGoalHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserGoalId] [bigint] NOT NULL,
	[StartDateId] [bigint] NOT NULL,
	[EndDateId] [bigint] NOT NULL,
	[Goal] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[GoalStatusId] [bigint] NOT NULL,
	[Remarks] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[GoalCategoryId] [int] NOT NULL,
     PRIMARY KEY CLUSTERED
(
	[UserGoalHistoryId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserHierarchy]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserHierarchy](
	[UserHierarchyId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[IsSupportingStaff] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[UserHierarchyId] ASC
)
)

GO
/****** Object:  Table [dbo].[UserLocationHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLocationHistory](
	[UserLocationHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[NewCompanyLocationId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NewEmployeeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[UserLocationHistoryId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserPromotionHistory]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserPromotionHistory](
	[UserPromotionHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OldDesignationId] [int] NOT NULL,
	[NewDesignationId] [int] NOT NULL,
	[PromotionDate] [datetime] NOT NULL,
	[OldEmployeeCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NewEmployeeCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsersAssetDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsersAssetDetail](
	[AssetsRequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AssetId] [bigint] NOT NULL,
	[AllocatedFrom] [date] NOT NULL ,
	[AllocatedTill] [date] NULL,
	[Remarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsLost] [bit] NOT NULL ,
	[IsCollected] [bit] NOT NULL ,
	[DeAllocationRemarks] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CollectedOn] [datetime] NULL,
	[CollectedBy] [int] NULL,
	[Department] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  PRIMARY KEY CLUSTERED
(
	[AssetsRequestId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsersHealthInsurance]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsersHealthInsurance](
	[UsersHealthInsuranceId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[InsurancePdfPath] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
 PRIMARY KEY CLUSTERED
(
	[UsersHealthInsuranceId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserShiftMapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserShiftMapping](
	[MappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[ShiftId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[IsDeleted] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[MappingId] ASC
)
)

GO
/****** Object:  Table [dbo].[UserSkill]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSkill](
	[UserSkillId] [int] IDENTITY(1,1) NOT NULL,
	[SkillId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[SkillLevelId] [int] NOT NULL,
	[MonthsOfExperience] [int] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[SkillTypeId] [int] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[UserSkillId] ASC
)
)

GO
/****** Object:  Table [dbo].[UsersOnshoreMgrMapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsersOnshoreMgrMapping](
	[MappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClientSideEmpId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OnshoreMgrId] [bigint] NOT NULL,
	[UserValidFromDate] [date] NULL,
	[UserValidTillDate] [date] NULL,
	[NotifyOnshoreMgr] [bit] NOT NULL ,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[MappingId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsersToken]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersToken](
	[TokenId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AuthToken] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IssuedOn] [datetime] NOT NULL,
	[ExpiresOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[LastActivityDate] [datetime] NOT NULL ,
  PRIMARY KEY CLUSTERED
(
	[TokenId] ASC
)
)

GO
/****** Object:  Table [dbo].[UserTeamMapping]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTeamMapping](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[TeamRoleId] [int] NOT NULL,
	[ConsiderInClientReports] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[RecordId] ASC
)
)

GO
/****** Object:  Table [dbo].[VehicleDetails]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehicleDetails](
	[VehicleId] [int] IDENTITY(1,1) NOT NULL,
	[Vehicle] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LocationId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[VehicleId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vertical]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vertical](
	[VerticalId] [int] IDENTITY(1,1) NOT NULL,
	[VerticalName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VerticalHeadId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[DomainId] [int] NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[VerticalId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VerticalTable]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VerticalTable](
	[Id] [int] NULL,
	[Att_Id] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Att_Value] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VisitorDetail]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VisitorDetail](
	[VisitorId] [int] IDENTITY(1,1) NOT NULL,
	[Visitor_FName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Visitor_LName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Visitor_Address] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Visitor_ContactNo] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Visitor_Email] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Visitor_AppointmentWith] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Visitor_Purpose] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Visitor_IdentityProof] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Visitor_TimeIn] [datetime] NOT NULL,
	[Visitor_timeOut] [datetime] NULL,
	[Visitor_PhotoUrl] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Visitor_IdPhotoUrl] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[otheridcard] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccessoriesPhotoUrl] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReadPolicy] [int] NULL,
	[OtherPurpose] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Colleagues] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Visitor_cardno] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 PRIMARY KEY CLUSTERED
(
	[VisitorId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VisitorPurpose]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VisitorPurpose](
	[VisitorPurposeId] [int] IDENTITY(1,1) NOT NULL,
	[VisitorPurposeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedDate] [datetime] NOT NULL ,
	[CreatedById] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedById] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[VisitorPurposeId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WeekDay]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WeekDay](
	[WeekDayId] [int] IDENTITY(1,1) NOT NULL,
	[WeekDayName] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL ,
	[IsDeleted] [bit] NOT NULL ,
	[CreatedDate] [date] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [int] NULL,
  PRIMARY KEY CLUSTERED
(
	[WeekDayId] ASC
)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WishType]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WishType](
	[WishTypeId] [int] NOT NULL,
	[WishType] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  PRIMARY KEY CLUSTERED
(
	[WishTypeId] ASC
))

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WPSCheckItemMaster]    Script Date: 3/24/2022 4:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WPSCheckItemMaster](
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SequenceNo] [int] NULL,
	[IsActive] [bit] NOT NULL ,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL ,
	[ModifiedBy] [int]  NULL,
	[ModifiedOn] [datetime]  NULL
)

--GO
--SET ANSI_PADDING OFF
--GO
--SET ANSI_PADDING ON

--GO
--/****** Object:  Index [NIX_Acc_Monitor_Log_Pin]    Script Date: 3/24/2022 4:40:30 PM ******/
--CREATE NONCLUSTERED INDEX [NIX_Acc_Monitor_Log_Pin] ON [dbo].[acc_monitor_log]
--(
--	[state] ASC,
--	[event_point_id] ASC,
--	[time] ASC
--)
--
--GO
--ALTER TABLE [dbo].[AttendanceReportAccess] ADD  CONSTRAINT [DF_TeamManager_SendAutomatedEmails]  DEFAULT ((0)) FOR [SendAutomatedEmails]
--GO
--ALTER TABLE [dbo].[AttendanceReportAccess] ADD  CONSTRAINT [DF_TeamManager_IsActive]  DEFAULT ((1)) FOR [IsActive]
--GO
--ALTER TABLE [dbo].[AttendanceReportAccess] ADD  CONSTRAINT [DF_TeamManager_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[DateWisePunchInData] ADD  CONSTRAINT [DF_DateWisePunchInData_IsActive]  DEFAULT ((1)) FOR [IsActive]
--GO
--ALTER TABLE [dbo].[DateWisePunchInData] ADD  CONSTRAINT [DF_DateWisePunchInData_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
--GO
--ALTER TABLE [dbo].[DateWisePunchInData] ADD  CONSTRAINT [DF_DateWisePunchInData_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[ExcludedUsersForAttendanceImport] ADD  CONSTRAINT [DF_ExcludedUsersForAttendanceImport_IsActive]  DEFAULT ((1)) FOR [IsActive]
--GO
--ALTER TABLE [dbo].[ExcludedUsersForAttendanceImport] ADD  CONSTRAINT [DF_ExcludedUsersForAttendanceImport_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
--GO
--ALTER TABLE [dbo].[ExcludedUsersForAttendanceImport] ADD  CONSTRAINT [DF_ExcludedUsersForAttendanceImport_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[Invoice] ADD  DEFAULT ((1)) FOR [IsActive]
--GO
--ALTER TABLE [dbo].[Invoice] ADD  DEFAULT ((0)) FOR [IsCancelled]
--GO
--ALTER TABLE [dbo].[Invoice] ADD  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[MealPackageFeedback] ADD  CONSTRAINT [DF_MealPackageFeedback_Liked]  DEFAULT ((0)) FOR [Liked]
--GO
--ALTER TABLE [dbo].[MealPackageFeedback] ADD  CONSTRAINT [DF_MealPackageFeedback_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest] ADD  CONSTRAINT [DF_OfficeDutyRequest_StatusId]  DEFAULT ((1)) FOR [StatusId]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest] ADD  CONSTRAINT [DF_OfficeDutyRequest_IsActive]  DEFAULT ((1)) FOR [IsActive]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest] ADD  CONSTRAINT [DF_OfficeDutyRequest_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequestHistory] ADD  CONSTRAINT [DF_OfficeDutyRequestHistory_StatusId]  DEFAULT ((1)) FOR [StatusId]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequestHistory] ADD  CONSTRAINT [DF_OfficeDutyRequestHistory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[PimcoProjectTeamMembers] ADD  CONSTRAINT [DF_PimcoProjectTeamMembers_IsActive]  DEFAULT ((1)) FOR [IsActive]
--GO
--ALTER TABLE [dbo].[PimcoProjectTeamMembers] ADD  CONSTRAINT [DF_PimcoProjectTeamMembers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[PimcoUser] ADD  CONSTRAINT [DF_PimcoUser_IsActive]  DEFAULT ((1)) FOR [IsActive]
--GO
--ALTER TABLE [dbo].[PimcoUser] ADD  CONSTRAINT [DF_PimcoUser_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[PimcoUserExpiration] ADD  DEFAULT ((0)) FOR [IsAcknowledged]
--GO
--ALTER TABLE [dbo].[PimcoUserExpiration] ADD  CONSTRAINT [DF_PimcoUserExpiration_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[ProfileRequest] ADD  CONSTRAINT [DF_ProfileRequest_IsExpired]  DEFAULT ((0)) FOR [IsExpired]
--GO
--ALTER TABLE [dbo].[ProfileRequest] ADD  CONSTRAINT [DF_ProfileRequest_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[TeamGoalComment] ADD  CONSTRAINT [DF_TeamGoalComment_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[TimeSheetReportAccess] ADD  CONSTRAINT [DF_TimeSheetReportAccess_IsActive]  DEFAULT ((1)) FOR [IsActive]
--GO
--ALTER TABLE [dbo].[TimeSheetReportAccess] ADD  CONSTRAINT [DF_TimeSheetReportAccess_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
--GO
--ALTER TABLE [dbo].[TimeSheetReportAccess] ADD  CONSTRAINT [DF_TimeSheetReportAccess_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[TimesheetStatus] ADD  CONSTRAINT [DF_TimesheetStatus_IsActive]  DEFAULT ((1)) FOR [IsActive]
--GO
--ALTER TABLE [dbo].[TimesheetStatus] ADD  CONSTRAINT [DF_TimesheetStatus_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
--GO
--ALTER TABLE [dbo].[AdvanceLeave]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceLeave_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AdvanceLeave] CHECK CONSTRAINT [FK_AdvanceLeave_User]
--GO
--ALTER TABLE [dbo].[AdvanceLeaveDetail]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceLeaveDetail_AdvanceLeave_AdvanceLeaveId] FOREIGN KEY([AdvanceLeaveId])
--REFERENCES [dbo].[AdvanceLeave] ([AdvanceLeaveId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AdvanceLeaveDetail] CHECK CONSTRAINT [FK_AdvanceLeaveDetail_AdvanceLeave_AdvanceLeaveId]
--GO
--ALTER TABLE [dbo].[AdvanceLeaveDetail]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceLeaveDetail_LeaveRequestApplication_AdjustedLeaveReqAppId] FOREIGN KEY([AdjustedLeaveReqAppId])
--REFERENCES [dbo].[LeaveRequestApplication] ([LeaveRequestApplicationId])
--GO
--ALTER TABLE [dbo].[AdvanceLeaveDetail] CHECK CONSTRAINT [FK_AdvanceLeaveDetail_LeaveRequestApplication_AdjustedLeaveReqAppId]
--GO
--ALTER TABLE [dbo].[API]  WITH CHECK ADD  CONSTRAINT [FK_API_HttpVerb] FOREIGN KEY([HttpVerbId])
--REFERENCES [dbo].[HttpVerb] ([HttpVerbId])
--GO
--ALTER TABLE [dbo].[API] CHECK CONSTRAINT [FK_API_HttpVerb]
--GO
--ALTER TABLE [dbo].[API]  WITH CHECK ADD  CONSTRAINT [FK_API_User] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[API] CHECK CONSTRAINT [FK_API_User]
--GO
--ALTER TABLE [dbo].[APIRolePermission]  WITH CHECK ADD  CONSTRAINT [FK_APIRolePermission_API] FOREIGN KEY([APIId])
--REFERENCES [dbo].[API] ([APIId])
--GO
--ALTER TABLE [dbo].[APIRolePermission] CHECK CONSTRAINT [FK_APIRolePermission_API]
--GO
--ALTER TABLE [dbo].[APIRolePermission]  WITH CHECK ADD  CONSTRAINT [FK_APIRolePermission_Role] FOREIGN KEY([RoleId])
--REFERENCES [dbo].[Role] ([RoleId])
--GO
--ALTER TABLE [dbo].[APIRolePermission] CHECK CONSTRAINT [FK_APIRolePermission_Role]
--GO
--ALTER TABLE [dbo].[APIUserPermission]  WITH CHECK ADD  CONSTRAINT [FK_APIUserPermission_API] FOREIGN KEY([APIId])
--REFERENCES [dbo].[API] ([APIId])
--GO
--ALTER TABLE [dbo].[APIUserPermission] CHECK CONSTRAINT [FK_APIUserPermission_API]
--GO
--ALTER TABLE [dbo].[APIUserPermission]  WITH CHECK ADD  CONSTRAINT [FK_APIUserPermission_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[APIUserPermission] CHECK CONSTRAINT [FK_APIUserPermission_User]
--GO
--ALTER TABLE [dbo].[AppraisalCycle]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalCycle_Country_CountryId] FOREIGN KEY([CountryId])
--REFERENCES [dbo].[Country] ([CountryId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AppraisalCycle] CHECK CONSTRAINT [FK_AppraisalCycle_Country_CountryId]
--GO
--ALTER TABLE [dbo].[AppraisalParameter]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalParameter_CompetencyType_CompetencyTypeId] FOREIGN KEY([CompetencyTypeId])
--REFERENCES [dbo].[CompetencyType] ([CompetencyTypeId])
--GO
--ALTER TABLE [dbo].[AppraisalParameter] CHECK CONSTRAINT [FK_AppraisalParameter_CompetencyType_CompetencyTypeId]
--GO
--ALTER TABLE [dbo].[AppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalSetting_AppraisalCycle_AppraisalCycleId] FOREIGN KEY([AppraisalCycleId])
--REFERENCES [dbo].[AppraisalCycle] ([AppraisalCycleId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AppraisalSetting] CHECK CONSTRAINT [FK_AppraisalSetting_AppraisalCycle_AppraisalCycleId]
--GO
--ALTER TABLE [dbo].[AppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalSetting_Department_DepartmentId] FOREIGN KEY([DepartmentId])
--REFERENCES [dbo].[Department] ([DepartmentId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AppraisalSetting] CHECK CONSTRAINT [FK_AppraisalSetting_Department_DepartmentId]
--GO
--ALTER TABLE [dbo].[AppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalSetting_Division_DivisionId] FOREIGN KEY([DivisionId])
--REFERENCES [dbo].[Division] ([DivisionId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AppraisalSetting] CHECK CONSTRAINT [FK_AppraisalSetting_Division_DivisionId]
--GO
--ALTER TABLE [dbo].[AppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalSetting_Location_LocationId] FOREIGN KEY([LocationId])
--REFERENCES [dbo].[Location] ([LocationId])
--GO
--ALTER TABLE [dbo].[AppraisalSetting] CHECK CONSTRAINT [FK_AppraisalSetting_Location_LocationId]
--GO
--ALTER TABLE [dbo].[AppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalSetting_Team_TeamId] FOREIGN KEY([TeamId])
--REFERENCES [dbo].[Team] ([TeamId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AppraisalSetting] CHECK CONSTRAINT [FK_AppraisalSetting_Team_TeamId]
--GO
--ALTER TABLE [dbo].[AppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalSetting_Vertical_VerticalId] FOREIGN KEY([VerticalId])
--REFERENCES [dbo].[Vertical] ([VerticalId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AppraisalSetting] CHECK CONSTRAINT [FK_AppraisalSetting_Vertical_VerticalId]
--GO
--ALTER TABLE [dbo].[AppraisalSettingDesignation]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalSettingDesignation_AppraisalSetting_AppraisalSettingId] FOREIGN KEY([AppraisalSettingId])
--REFERENCES [dbo].[AppraisalSetting] ([AppraisalSettingId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AppraisalSettingDesignation] CHECK CONSTRAINT [FK_AppraisalSettingDesignation_AppraisalSetting_AppraisalSettingId]
--GO
--ALTER TABLE [dbo].[AppraisalSettingDesignation]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalSettingDesignation_Designation_DesignationId] FOREIGN KEY([DesignationId])
--REFERENCES [dbo].[Designation] ([DesignationId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AppraisalSettingDesignation] CHECK CONSTRAINT [FK_AppraisalSettingDesignation_Designation_DesignationId]
--GO
--ALTER TABLE [dbo].[AppraisalSettingStage]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalSettingStage_AppraisalSetting_AppraisalSettingId] FOREIGN KEY([AppraisalSettingId])
--REFERENCES [dbo].[AppraisalSetting] ([AppraisalSettingId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AppraisalSettingStage] CHECK CONSTRAINT [FK_AppraisalSettingStage_AppraisalSetting_AppraisalSettingId]
--GO
--ALTER TABLE [dbo].[AppraisalSettingStage]  WITH CHECK ADD  CONSTRAINT [FK_AppraisalSettingStage_AppraisalStage_AppraisalStageId] FOREIGN KEY([AppraisalStageId])
--REFERENCES [dbo].[AppraisalStage] ([AppraisalStageId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AppraisalSettingStage] CHECK CONSTRAINT [FK_AppraisalSettingStage_AppraisalStage_AppraisalStageId]
--GO
--ALTER TABLE [dbo].[AsquareUserMapping]  WITH CHECK ADD  CONSTRAINT [FK_AsquareUserMapping_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AsquareUserMapping] CHECK CONSTRAINT [FK_AsquareUserMapping_User]
--GO
--ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_AssetType_TypeId] FOREIGN KEY([TypeId])
--REFERENCES [dbo].[AssetType] ([TypeId])
--GO
--ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_AssetType_TypeId]
--GO
--ALTER TABLE [dbo].[AssetDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssetDetail_Asset_AssetId] FOREIGN KEY([AssetId])
--REFERENCES [dbo].[Asset] ([AssetId])
--GO
--ALTER TABLE [dbo].[AssetDetail] CHECK CONSTRAINT [FK_AssetDetail_Asset_AssetId]
--GO
--ALTER TABLE [dbo].[AssetDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssetDetail_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AssetDetail] CHECK CONSTRAINT [FK_AssetDetail_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[AssetDetailAttributes]  WITH CHECK ADD  CONSTRAINT [FK_AssetDetailAttributes_AssetDetail_AssetDetailId] FOREIGN KEY([AssetDetailId])
--REFERENCES [dbo].[AssetDetail] ([AssetDetailId])
--GO
--ALTER TABLE [dbo].[AssetDetailAttributes] CHECK CONSTRAINT [FK_AssetDetailAttributes_AssetDetail_AssetDetailId]
--GO
--ALTER TABLE [dbo].[AssetDetailAttributes]  WITH CHECK ADD  CONSTRAINT [FK_AssetDetailAttributes_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AssetDetailAttributes] CHECK CONSTRAINT [FK_AssetDetailAttributes_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[AssetDetailAttributes]  WITH CHECK ADD  CONSTRAINT [FK_AssetDetailAttributes_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AssetDetailAttributes] CHECK CONSTRAINT [FK_AssetDetailAttributes_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[AssetRequest]  WITH CHECK ADD  CONSTRAINT [FK_AssetRequest_AssetStatus_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[AssetStatus] ([AssetStatusId])
--GO
--ALTER TABLE [dbo].[AssetRequest] CHECK CONSTRAINT [FK_AssetRequest_AssetStatus_StatusId]
--GO
--ALTER TABLE [dbo].[AssetRequest]  WITH CHECK ADD  CONSTRAINT [FK_AssetRequest_AssetType_AssetType] FOREIGN KEY([TypeId])
--REFERENCES [dbo].[AssetType] ([TypeId])
--GO
--ALTER TABLE [dbo].[AssetRequest] CHECK CONSTRAINT [FK_AssetRequest_AssetType_AssetType]
--GO
--ALTER TABLE [dbo].[AssetRequest]  WITH CHECK ADD  CONSTRAINT [FK_AssetRequest_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AssetRequest] CHECK CONSTRAINT [FK_AssetRequest_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[AssetsMaster]  WITH CHECK ADD  CONSTRAINT [FK_AssetsMaster_AssetsBrand_BrandId] FOREIGN KEY([BrandId])
--REFERENCES [dbo].[AssetsBrand] ([BrandId])
--GO
--ALTER TABLE [dbo].[AssetsMaster] CHECK CONSTRAINT [FK_AssetsMaster_AssetsBrand_BrandId]
--GO
--ALTER TABLE [dbo].[AssetsMaster]  WITH CHECK ADD  CONSTRAINT [FK_AssetsMaster_AssetType_AssetTypeId] FOREIGN KEY([AssetTypeId])
--REFERENCES [dbo].[AssetType] ([TypeId])
--GO
--ALTER TABLE [dbo].[AssetsMaster] CHECK CONSTRAINT [FK_AssetsMaster_AssetType_AssetTypeId]
--GO
--ALTER TABLE [dbo].[AssetTransaction]  WITH CHECK ADD  CONSTRAINT [FK_AssetTransaction_AssetDetail_AcknowledgedOnDateId] FOREIGN KEY([AcknowledgedOnDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[AssetTransaction] CHECK CONSTRAINT [FK_AssetTransaction_AssetDetail_AcknowledgedOnDateId]
--GO
--ALTER TABLE [dbo].[AssetTransaction]  WITH CHECK ADD  CONSTRAINT [FK_AssetTransaction_AssetDetail_AssetDetailId] FOREIGN KEY([AssetDetailId])
--REFERENCES [dbo].[AssetDetail] ([AssetDetailId])
--GO
--ALTER TABLE [dbo].[AssetTransaction] CHECK CONSTRAINT [FK_AssetTransaction_AssetDetail_AssetDetailId]
--GO
--ALTER TABLE [dbo].[AssetTransaction]  WITH CHECK ADD  CONSTRAINT [FK_AssetTransaction_AssetDetail_IssueDateId] FOREIGN KEY([IssueDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[AssetTransaction] CHECK CONSTRAINT [FK_AssetTransaction_AssetDetail_IssueDateId]
--GO
--ALTER TABLE [dbo].[AssetTransaction]  WITH CHECK ADD  CONSTRAINT [FK_AssetTransaction_AssetDetail_ReturnedOnDateId] FOREIGN KEY([ReturnedOnDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[AssetTransaction] CHECK CONSTRAINT [FK_AssetTransaction_AssetDetail_ReturnedOnDateId]
--GO
--ALTER TABLE [dbo].[AssetTransaction]  WITH CHECK ADD  CONSTRAINT [FK_AssetTransaction_AssetRequest_RequestId] FOREIGN KEY([RequestId])
--REFERENCES [dbo].[AssetRequest] ([RequestId])
--GO
--ALTER TABLE [dbo].[AssetTransaction] CHECK CONSTRAINT [FK_AssetTransaction_AssetRequest_RequestId]
--GO
--ALTER TABLE [dbo].[AssetTransaction]  WITH CHECK ADD  CONSTRAINT [FK_AssetTransaction_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AssetTransaction] CHECK CONSTRAINT [FK_AssetTransaction_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[AssetType]  WITH CHECK ADD  CONSTRAINT [FK_AssetType_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AssetType] CHECK CONSTRAINT [FK_AssetType_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[AttendanceDataChangeRequestApplication]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceDataChangeRequestApplication_AttendanceDataChangeRequestCategory_CategoryId] FOREIGN KEY([RequestCategoryid])
--REFERENCES [dbo].[AttendanceDataChangeRequestCategory] ([CategoryId])
--GO
--ALTER TABLE [dbo].[AttendanceDataChangeRequestApplication] CHECK CONSTRAINT [FK_AttendanceDataChangeRequestApplication_AttendanceDataChangeRequestCategory_CategoryId]
--GO
--ALTER TABLE [dbo].[AttendanceDataChangeRequestCategory]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceDataChangeRequestCategory_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AttendanceDataChangeRequestCategory] CHECK CONSTRAINT [FK_AttendanceDataChangeRequestCategory_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[AttendanceDataChangeRequestCategory]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceDataChangeRequestCategory_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AttendanceDataChangeRequestCategory] CHECK CONSTRAINT [FK_AttendanceDataChangeRequestCategory_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[AttendanceDataChangeRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceDataChangeRequestHistory_AttendanceDataCHangeRequestApplication_RequestId] FOREIGN KEY([RequestId])
--REFERENCES [dbo].[AttendanceDataChangeRequestApplication] ([RequestId])
--GO
--ALTER TABLE [dbo].[AttendanceDataChangeRequestHistory] CHECK CONSTRAINT [FK_AttendanceDataChangeRequestHistory_AttendanceDataCHangeRequestApplication_RequestId]
--GO
--ALTER TABLE [dbo].[AttendanceReportAccess]  WITH CHECK ADD  CONSTRAINT [FK_TeamManager_Team_TeamId] FOREIGN KEY([TeamId])
--REFERENCES [dbo].[Team] ([TeamId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[AttendanceReportAccess] CHECK CONSTRAINT [FK_TeamManager_Team_TeamId]
--GO
--ALTER TABLE [dbo].[AttendanceReportAccess]  WITH CHECK ADD  CONSTRAINT [FK_TeamManager_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AttendanceReportAccess] CHECK CONSTRAINT [FK_TeamManager_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[AttendanceReportAccess]  WITH CHECK ADD  CONSTRAINT [FK_TeamManager_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AttendanceReportAccess] CHECK CONSTRAINT [FK_TeamManager_User_UserId]
--GO
--ALTER TABLE [dbo].[AttendanceStatusMaster]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceStatusMaster_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AttendanceStatusMaster] CHECK CONSTRAINT [FK_AttendanceStatusMaster_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[AttendanceStatusMaster]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceStatusMaster_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AttendanceStatusMaster] CHECK CONSTRAINT [FK_AttendanceStatusMaster_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[AttendanceUploadHistoryAsquare]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceUploadHistoryAsquare_User] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[AttendanceUploadHistoryAsquare] CHECK CONSTRAINT [FK_AttendanceUploadHistoryAsquare_User]
--GO
--ALTER TABLE [dbo].[CabPickDropLocation]  WITH CHECK ADD  CONSTRAINT [FK_CabPickDropLocation_Location_LocationId] FOREIGN KEY([LocationId])
--REFERENCES [dbo].[Location] ([LocationId])
--GO
--ALTER TABLE [dbo].[CabPickDropLocation] CHECK CONSTRAINT [FK_CabPickDropLocation_Location_LocationId]
--GO
--ALTER TABLE [dbo].[CabRequest]  WITH CHECK ADD  CONSTRAINT [FK_CabRequest_CabPickDropLocation_CabPDLocationId] FOREIGN KEY([CabPDLocationId])
--REFERENCES [dbo].[CabPickDropLocation] ([CabPDLocationId])
--GO
--ALTER TABLE [dbo].[CabRequest] CHECK CONSTRAINT [FK_CabRequest_CabPickDropLocation_CabPDLocationId]
--GO
--ALTER TABLE [dbo].[CabRequest]  WITH CHECK ADD  CONSTRAINT [FK_CabRequest_CabShiftMaster_CabShiftId] FOREIGN KEY([CabShiftId])
--REFERENCES [dbo].[CabShiftMaster] ([CabShiftId])
--GO
--ALTER TABLE [dbo].[CabRequest] CHECK CONSTRAINT [FK_CabRequest_CabShiftMaster_CabShiftId]
--GO
--ALTER TABLE [dbo].[CabRequest]  WITH CHECK ADD  CONSTRAINT [FK_CabRequest_CabStatusMaster_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[CabStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[CabRequest] CHECK CONSTRAINT [FK_CabRequest_CabStatusMaster_StatusId]
--GO
--ALTER TABLE [dbo].[CabRequest]  WITH CHECK ADD  CONSTRAINT [FK_CabRequest_DateMaster_Date] FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[CabRequest] CHECK CONSTRAINT [FK_CabRequest_DateMaster_Date]
--GO
--ALTER TABLE [dbo].[CabRequest]  WITH CHECK ADD  CONSTRAINT [FK_CabRequest_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[CabRequest] CHECK CONSTRAINT [FK_CabRequest_User_UserId]
--GO
--ALTER TABLE [dbo].[CabRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_CabRequestHistory_CabRequest_CabRequestId] FOREIGN KEY([CabRequestId])
--REFERENCES [dbo].[CabRequest] ([CabRequestId])
--GO
--ALTER TABLE [dbo].[CabRequestHistory] CHECK CONSTRAINT [FK_CabRequestHistory_CabRequest_CabRequestId]
--GO
--ALTER TABLE [dbo].[CabRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_CabRequestHistory_CabStatusMaster_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[CabStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[CabRequestHistory] CHECK CONSTRAINT [FK_CabRequestHistory_CabStatusMaster_StatusId]
--GO
--ALTER TABLE [dbo].[CardPunchinData]  WITH CHECK ADD  CONSTRAINT [FK_CardPunchinData_DateMaster_DateId] FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[CardPunchinData] CHECK CONSTRAINT [FK_CardPunchinData_DateMaster_DateId]
--GO
--ALTER TABLE [dbo].[CertificationsAndRewards]  WITH CHECK ADD  CONSTRAINT [FK_CertificationsAndRewards_EmployeeProfile_ProfileId] FOREIGN KEY([ProfileId])
--REFERENCES [dbo].[EmployeeProfile] ([ProfileId])
--GO
--ALTER TABLE [dbo].[CertificationsAndRewards] CHECK CONSTRAINT [FK_CertificationsAndRewards_EmployeeProfile_ProfileId]
--GO
--ALTER TABLE [dbo].[CertificationsAndRewards]  WITH CHECK ADD  CONSTRAINT [FK_CertificationsAndRewards_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[CertificationsAndRewards] CHECK CONSTRAINT [FK_CertificationsAndRewards_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ChangeExtnRequest]  WITH CHECK ADD  CONSTRAINT [FK_ChangeExtnRequest_User_ActionTakenById] FOREIGN KEY([ActionTakenById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ChangeExtnRequest] CHECK CONSTRAINT [FK_ChangeExtnRequest_User_ActionTakenById]
--GO
--ALTER TABLE [dbo].[ChangeExtnRequest]  WITH CHECK ADD  CONSTRAINT [FK_ChangeExtnRequest_User_CreatedById] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ChangeExtnRequest] CHECK CONSTRAINT [FK_ChangeExtnRequest_User_CreatedById]
--GO
--ALTER TABLE [dbo].[ClientResourceMaster]  WITH CHECK ADD  CONSTRAINT [FK_ClientResourceMaster_ClientMaster_ClientId] FOREIGN KEY([ClientId])
--REFERENCES [dbo].[ClientMaster] ([ClientId])
--GO
--ALTER TABLE [dbo].[ClientResourceMaster] CHECK CONSTRAINT [FK_ClientResourceMaster_ClientMaster_ClientId]
--GO
--ALTER TABLE [dbo].[ClientResourceMaster]  WITH CHECK ADD  CONSTRAINT [FK_ClientResourceMaster_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ClientResourceMaster] CHECK CONSTRAINT [FK_ClientResourceMaster_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ClientSideManagerMaster]  WITH CHECK ADD  CONSTRAINT [FK_ClientSideManagerMaster_ClientMaster_ClientId] FOREIGN KEY([ClientId])
--REFERENCES [dbo].[ClientMaster] ([ClientId])
--GO
--ALTER TABLE [dbo].[ClientSideManagerMaster] CHECK CONSTRAINT [FK_ClientSideManagerMaster_ClientMaster_ClientId]
--GO
--ALTER TABLE [dbo].[ClientSideManagerMaster]  WITH CHECK ADD  CONSTRAINT [FK_ClientSideManagerMaster_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ClientSideManagerMaster] CHECK CONSTRAINT [FK_ClientSideManagerMaster_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[CompetencyForm]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyForm_Department_DepartmentId] FOREIGN KEY([DepartmentId])
--REFERENCES [dbo].[Department] ([DepartmentId])
--GO
--ALTER TABLE [dbo].[CompetencyForm] CHECK CONSTRAINT [FK_CompetencyForm_Department_DepartmentId]
--GO
--ALTER TABLE [dbo].[CompetencyForm]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyForm_Designation_DesignationId] FOREIGN KEY([DesignationId])
--REFERENCES [dbo].[Designation] ([DesignationId])
--GO
--ALTER TABLE [dbo].[CompetencyForm] CHECK CONSTRAINT [FK_CompetencyForm_Designation_DesignationId]
--GO
--ALTER TABLE [dbo].[CompetencyForm]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyForm_Division_DivisionId] FOREIGN KEY([DivisionId])
--REFERENCES [dbo].[Division] ([DivisionId])
--GO
--ALTER TABLE [dbo].[CompetencyForm] CHECK CONSTRAINT [FK_CompetencyForm_Division_DivisionId]
--GO
--ALTER TABLE [dbo].[CompetencyForm]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyForm_FeedbackType_FeedbackTypeId] FOREIGN KEY([FeedbackTypeId])
--REFERENCES [dbo].[FeedbackType] ([FeedbackTypeId])
--GO
--ALTER TABLE [dbo].[CompetencyForm] CHECK CONSTRAINT [FK_CompetencyForm_FeedbackType_FeedbackTypeId]
--GO
--ALTER TABLE [dbo].[CompetencyForm]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyForm_Location_LocationId] FOREIGN KEY([LocationId])
--REFERENCES [dbo].[Location] ([LocationId])
--GO
--ALTER TABLE [dbo].[CompetencyForm] CHECK CONSTRAINT [FK_CompetencyForm_Location_LocationId]
--GO
--ALTER TABLE [dbo].[CompetencyForm]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyForm_Vertical_VerticalId] FOREIGN KEY([VerticalId])
--REFERENCES [dbo].[Vertical] ([VerticalId])
--GO
--ALTER TABLE [dbo].[CompetencyForm] CHECK CONSTRAINT [FK_CompetencyForm_Vertical_VerticalId]
--GO
--ALTER TABLE [dbo].[CompetencyFormDetail]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyFormDetail_AppraisalParameter_ParameterId] FOREIGN KEY([ParameterId])
--REFERENCES [dbo].[AppraisalParameter] ([ParameterId])
--GO
--ALTER TABLE [dbo].[CompetencyFormDetail] CHECK CONSTRAINT [FK_CompetencyFormDetail_AppraisalParameter_ParameterId]
--GO
--ALTER TABLE [dbo].[CompetencyFormDetail]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyFormDetail_CompetencyForm_CompetencyFormId] FOREIGN KEY([CompetencyFormId])
--REFERENCES [dbo].[CompetencyForm] ([CompetencyFormId])
--GO
--ALTER TABLE [dbo].[CompetencyFormDetail] CHECK CONSTRAINT [FK_CompetencyFormDetail_CompetencyForm_CompetencyFormId]
--GO
--ALTER TABLE [dbo].[CompetencyFormDetail]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyFormDetail_CompetencyType_CompetencyTypeId] FOREIGN KEY([CompetencyTypeId])
--REFERENCES [dbo].[CompetencyType] ([CompetencyTypeId])
--GO
--ALTER TABLE [dbo].[CompetencyFormDetail] CHECK CONSTRAINT [FK_CompetencyFormDetail_CompetencyType_CompetencyTypeId]
--GO
--ALTER TABLE [dbo].[DashboardWidgetRolePermission]  WITH CHECK ADD  CONSTRAINT [FK_DashboardWidgetRolePermission_DashboardWidget] FOREIGN KEY([DashboardWidgetId])
--REFERENCES [dbo].[DashboardWidget] ([DashboardWidgetId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[DashboardWidgetRolePermission] CHECK CONSTRAINT [FK_DashboardWidgetRolePermission_DashboardWidget]
--GO
--ALTER TABLE [dbo].[DashboardWidgetRolePermission]  WITH CHECK ADD  CONSTRAINT [FK_DashboardWidgetRolePermission_UserRole] FOREIGN KEY([RoleId])
--REFERENCES [dbo].[Role] ([RoleId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[DashboardWidgetRolePermission] CHECK CONSTRAINT [FK_DashboardWidgetRolePermission_UserRole]
--GO
--ALTER TABLE [dbo].[DashboardWidgetUserPermission]  WITH CHECK ADD  CONSTRAINT [FK_DashboardWidgetUserPermission_DashboardWidget] FOREIGN KEY([DashboardWidgetId])
--REFERENCES [dbo].[DashboardWidget] ([DashboardWidgetId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[DashboardWidgetUserPermission] CHECK CONSTRAINT [FK_DashboardWidgetUserPermission_DashboardWidget]
--GO
--ALTER TABLE [dbo].[DashboardWidgetUserPermission]  WITH CHECK ADD  CONSTRAINT [FK_DashboardWidgetUserPermission_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[DashboardWidgetUserPermission] CHECK CONSTRAINT [FK_DashboardWidgetUserPermission_User]
--GO
--ALTER TABLE [dbo].[DateWiseAttendance]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseAttendance_AttendanceStatus_StatusId] FOREIGN KEY([SystemGeneratedStatusId])
--REFERENCES [dbo].[AttendanceStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[DateWiseAttendance] CHECK CONSTRAINT [FK_DateWiseAttendance_AttendanceStatus_StatusId]
--GO
--ALTER TABLE [dbo].[DateWiseAttendance]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseAttendance_DateMaster_DateId] FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[DateWiseAttendance] CHECK CONSTRAINT [FK_DateWiseAttendance_DateMaster_DateId]
--GO
--ALTER TABLE [dbo].[DateWiseAttendance]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseAttendance_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[DateWiseAttendance] CHECK CONSTRAINT [FK_DateWiseAttendance_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[DateWiseAttendance]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseAttendance_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[DateWiseAttendance] CHECK CONSTRAINT [FK_DateWiseAttendance_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[DateWiseAttendance]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseAttendance_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[DateWiseAttendance] CHECK CONSTRAINT [FK_DateWiseAttendance_User_UserId]
--GO
--ALTER TABLE [dbo].[DateWiseAttendanceAsquare]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseAttendanceAsqure_AttendanceStatus_StatusId] FOREIGN KEY([SystemGeneratedStatusId])
--REFERENCES [dbo].[AttendanceStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[DateWiseAttendanceAsquare] CHECK CONSTRAINT [FK_DateWiseAttendanceAsqure_AttendanceStatus_StatusId]
--GO
--ALTER TABLE [dbo].[DateWiseAttendanceAsquare]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseAttendanceAsqure_DateMaster_DateId] FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[DateWiseAttendanceAsquare] CHECK CONSTRAINT [FK_DateWiseAttendanceAsqure_DateMaster_DateId]
--GO
--ALTER TABLE [dbo].[DateWiseAttendanceAsquare]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseAttendanceAsqure_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[DateWiseAttendanceAsquare] CHECK CONSTRAINT [FK_DateWiseAttendanceAsqure_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[DateWiseAttendanceAsquare]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseAttendanceAsqure_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[DateWiseAttendanceAsquare] CHECK CONSTRAINT [FK_DateWiseAttendanceAsqure_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[DateWiseAttendanceAsquare]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseAttendanceAsqure_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[DateWiseAttendanceAsquare] CHECK CONSTRAINT [FK_DateWiseAttendanceAsqure_User_UserId]
--GO
--ALTER TABLE [dbo].[DateWiseLeaveType]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseLeaveType_DateMaster_DateId] FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[DateWiseLeaveType] CHECK CONSTRAINT [FK_DateWiseLeaveType_DateMaster_DateId]
--GO
--ALTER TABLE [dbo].[DateWiseLeaveType]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseLeaveType_LeaveRequestApplication_LeaveRequestApplicationId] FOREIGN KEY([LeaveRequestApplicationId])
--REFERENCES [dbo].[LeaveRequestApplication] ([LeaveRequestApplicationId])
--GO
--ALTER TABLE [dbo].[DateWiseLeaveType] CHECK CONSTRAINT [FK_DateWiseLeaveType_LeaveRequestApplication_LeaveRequestApplicationId]
--GO
--ALTER TABLE [dbo].[DateWiseLeaveType]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseLeaveType_LeaveTypeMaster_LeaveTypeId] FOREIGN KEY([LeaveTypeId])
--REFERENCES [dbo].[LeaveTypeMaster] ([TypeId])
--GO
--ALTER TABLE [dbo].[DateWiseLeaveType] CHECK CONSTRAINT [FK_DateWiseLeaveType_LeaveTypeMaster_LeaveTypeId]
--GO
--ALTER TABLE [dbo].[DateWiseLNSA]  WITH CHECK ADD  CONSTRAINT [DateWiseLNSA_LNSAStatusMaster_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[LNSAStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[DateWiseLNSA] CHECK CONSTRAINT [DateWiseLNSA_LNSAStatusMaster_StatusId]
--GO
--ALTER TABLE [dbo].[DateWiseLNSA]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseLNSA_DateMaster_DateId] FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[DateWiseLNSA] CHECK CONSTRAINT [FK_DateWiseLNSA_DateMaster_DateId]
--GO
--ALTER TABLE [dbo].[DateWiseLNSA]  WITH CHECK ADD  CONSTRAINT [FK_DateWiseLNSA_RequestLNSA_RequestId] FOREIGN KEY([RequestId])
--REFERENCES [dbo].[RequestLnsa] ([RequestId])
--GO
--ALTER TABLE [dbo].[DateWiseLNSA] CHECK CONSTRAINT [FK_DateWiseLNSA_RequestLNSA_RequestId]
--GO
--ALTER TABLE [dbo].[DateWisePunchInData]  WITH CHECK ADD  CONSTRAINT [FK_DateWisePunchInData_DateMaster_DateId] FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[DateWisePunchInData] CHECK CONSTRAINT [FK_DateWisePunchInData_DateMaster_DateId]
--GO
--ALTER TABLE [dbo].[DateWisePunchInData]  WITH CHECK ADD  CONSTRAINT [FK_DateWisePunchInData_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[DateWisePunchInData] CHECK CONSTRAINT [FK_DateWisePunchInData_User_UserId]
--GO
--ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Division_DivisionId] FOREIGN KEY([DivisionId])
--REFERENCES [dbo].[Division] ([DivisionId])
--GO
--ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Division_DivisionId]
--GO
--ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_User_DepartmentHeadId] FOREIGN KEY([DepartmentHeadId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_User_DepartmentHeadId]
--GO
--ALTER TABLE [dbo].[DepartmentWiseAssetLimit]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentWiseAssetLimit_AssetType_TypeId] FOREIGN KEY([TypeId])
--REFERENCES [dbo].[AssetType] ([TypeId])
--GO
--ALTER TABLE [dbo].[DepartmentWiseAssetLimit] CHECK CONSTRAINT [FK_DepartmentWiseAssetLimit_AssetType_TypeId]
--GO
--ALTER TABLE [dbo].[DepartmentWiseAssetLimit]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentWiseAssetLimit_Department_DepartmentId] FOREIGN KEY([DepartmentId])
--REFERENCES [dbo].[Department] ([DepartmentId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[DepartmentWiseAssetLimit] CHECK CONSTRAINT [FK_DepartmentWiseAssetLimit_Department_DepartmentId]
--GO
--ALTER TABLE [dbo].[DepartmentWiseAssetLimit]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentWiseAssetLimit_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[DepartmentWiseAssetLimit] CHECK CONSTRAINT [FK_DepartmentWiseAssetLimit_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[Designation]  WITH CHECK ADD  CONSTRAINT [FK_Designation_DesignationGroup_DesignationGroupId] FOREIGN KEY([DesignationGroupId])
--REFERENCES [dbo].[DesignationGroup] ([DesignationGroupId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[Designation] CHECK CONSTRAINT [FK_Designation_DesignationGroup_DesignationGroupId]
--GO
--ALTER TABLE [dbo].[Designation]  WITH CHECK ADD  CONSTRAINT [FK_Designation_DesignationGroup_SpecialDesignationGroupId] FOREIGN KEY([SpecialDesignationGropupId])
--REFERENCES [dbo].[DesignationGroup] ([DesignationGroupId])
--GO
--ALTER TABLE [dbo].[Designation] CHECK CONSTRAINT [FK_Designation_DesignationGroup_SpecialDesignationGroupId]
--GO
--ALTER TABLE [dbo].[Division]  WITH CHECK ADD  CONSTRAINT [FK_Division_User_DivisionHeadId] FOREIGN KEY([DivisionHeadId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[Division] CHECK CONSTRAINT [FK_Division_User_DivisionHeadId]
--GO
--ALTER TABLE [dbo].[Division]  WITH CHECK ADD  CONSTRAINT [FK_Division_Vertical_VerticalId] FOREIGN KEY([VerticalId])
--REFERENCES [dbo].[Vertical] ([VerticalId])
--GO
--ALTER TABLE [dbo].[Division] CHECK CONSTRAINT [FK_Division_Vertical_VerticalId]
--GO
--ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_GorupId] FOREIGN KEY([GroupId])
--REFERENCES [dbo].[DocumentGroup] ([DocGroupId])
--GO
--ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_GorupId]
--GO
--ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_UserId]
--GO
--ALTER TABLE [dbo].[DocumentPermissionGroup]  WITH CHECK ADD  CONSTRAINT [FK_DocumentPermissionGroup_User] FOREIGN KEY([CreatedByUserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[DocumentPermissionGroup] CHECK CONSTRAINT [FK_DocumentPermissionGroup_User]
--GO
--ALTER TABLE [dbo].[DocumentPermissionGroupPermissions]  WITH CHECK ADD  CONSTRAINT [FK_DocumentPermissionGroupPermissions_DocumentPermissionGroup] FOREIGN KEY([DocumentPermissionGroupId])
--REFERENCES [dbo].[DocumentPermissionGroup] ([DocumentPermissionGroupId])
--GO
--ALTER TABLE [dbo].[DocumentPermissionGroupPermissions] CHECK CONSTRAINT [FK_DocumentPermissionGroupPermissions_DocumentPermissionGroup]
--GO
--ALTER TABLE [dbo].[DocumentPermissionGroupPermissions]  WITH CHECK ADD  CONSTRAINT [FK_DocumentPermissionGroupPermissions_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[DocumentPermissionGroupPermissions] CHECK CONSTRAINT [FK_DocumentPermissionGroupPermissions_User]
--GO
--ALTER TABLE [dbo].[EmpAppraisal]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisal_EmpAppraisalSetting_EmpAppraisalSettingId] FOREIGN KEY([EmpAppraisalSettingId])
--REFERENCES [dbo].[EmpAppraisalSetting] ([EmpAppraisalSettingId])
--GO
--ALTER TABLE [dbo].[EmpAppraisal] CHECK CONSTRAINT [FK_EmpAppraisal_EmpAppraisalSetting_EmpAppraisalSettingId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalLog_EmpAppraisalSetting_EmpAppraisalSettingId] FOREIGN KEY([EmpAppraisalSettingId])
--REFERENCES [dbo].[EmpAppraisalSetting] ([EmpAppraisalSettingId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalLog] CHECK CONSTRAINT [FK_EmpAppraisalLog_EmpAppraisalSetting_EmpAppraisalSettingId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalLog_FeedbackStatus_AppraisalStatusId] FOREIGN KEY([AppraisalStatusId])
--REFERENCES [dbo].[FeedbackStatus] ([FeedbackStatusId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalLog] CHECK CONSTRAINT [FK_EmpAppraisalLog_FeedbackStatus_AppraisalStatusId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalParameterDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalParameterDetail_AppraisalRating_AppraiserRatingId] FOREIGN KEY([AppraiserRatingId])
--REFERENCES [dbo].[AppraisalRating] ([AppraisalRatingId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalParameterDetail] CHECK CONSTRAINT [FK_EmpAppraisalParameterDetail_AppraisalRating_AppraiserRatingId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalParameterDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalParameterDetail_AppraisalRating_ApproverRatingId] FOREIGN KEY([ApproverRatingId])
--REFERENCES [dbo].[AppraisalRating] ([AppraisalRatingId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalParameterDetail] CHECK CONSTRAINT [FK_EmpAppraisalParameterDetail_AppraisalRating_ApproverRatingId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalParameterDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalParameterDetail_AppraisalRating_SelfRatingId] FOREIGN KEY([SelfRatingId])
--REFERENCES [dbo].[AppraisalRating] ([AppraisalRatingId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalParameterDetail] CHECK CONSTRAINT [FK_EmpAppraisalParameterDetail_AppraisalRating_SelfRatingId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalParameterDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalParameterDetail_CompetencyFormDetail] FOREIGN KEY([CompetencyFormDetailId])
--REFERENCES [dbo].[CompetencyFormDetail] ([CompetencyFormDetailId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalParameterDetail] CHECK CONSTRAINT [FK_EmpAppraisalParameterDetail_CompetencyFormDetail]
--GO
--ALTER TABLE [dbo].[EmpAppraisalParameterDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalParameterDetail_EmpAppraisal] FOREIGN KEY([EmpAppraisalId])
--REFERENCES [dbo].[EmpAppraisal] ([EmpAppraisalId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalParameterDetail] CHECK CONSTRAINT [FK_EmpAppraisalParameterDetail_EmpAppraisal]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_AppraisalSetting_AppraisalSettingId] FOREIGN KEY([AppraisalSettingId])
--REFERENCES [dbo].[AppraisalSetting] ([AppraisalSettingId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_AppraisalSetting_AppraisalSettingId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_CompetencyForm_CompetencyFormId] FOREIGN KEY([CompetencyFormId])
--REFERENCES [dbo].[CompetencyForm] ([CompetencyFormId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_CompetencyForm_CompetencyFormId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_Department_DepartmentId] FOREIGN KEY([DepartmentId])
--REFERENCES [dbo].[Department] ([DepartmentId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_Department_DepartmentId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_Designation_DesignationId] FOREIGN KEY([DesignationId])
--REFERENCES [dbo].[Designation] ([DesignationId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_Designation_DesignationId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_Division_DivisionId] FOREIGN KEY([DivisionId])
--REFERENCES [dbo].[Division] ([DivisionId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_Division_DivisionId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_FeedbackStatus_AppraisalStatusId] FOREIGN KEY([AppraisalStatusId])
--REFERENCES [dbo].[FeedbackStatus] ([FeedbackStatusId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_FeedbackStatus_AppraisalStatusId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_Location_LocationId] FOREIGN KEY([LocationId])
--REFERENCES [dbo].[Location] ([LocationId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_Location_LocationId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_Team_TeamId] FOREIGN KEY([TeamId])
--REFERENCES [dbo].[Team] ([TeamId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_Team_TeamId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_User_Appraiser] FOREIGN KEY([AppraiserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_User_Appraiser]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_User_Approver1] FOREIGN KEY([Approver1])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_User_Approver1]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_User_RM] FOREIGN KEY([RMId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_User_RM]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_User_UserId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSetting_Vertical_VerticalId] FOREIGN KEY([VerticalId])
--REFERENCES [dbo].[Vertical] ([VerticalId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSetting] CHECK CONSTRAINT [FK_EmpAppraisalSetting_Vertical_VerticalId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_AppraisalSetting_AppraisalSettingId] FOREIGN KEY([AppraisalSettingId])
--REFERENCES [dbo].[AppraisalSetting] ([AppraisalSettingId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_AppraisalSetting_AppraisalSettingId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_CompetencyForm_CompetencyFormId] FOREIGN KEY([CompetencyFormId])
--REFERENCES [dbo].[CompetencyForm] ([CompetencyFormId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_CompetencyForm_CompetencyFormId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_Department_DepartmentId] FOREIGN KEY([DepartmentId])
--REFERENCES [dbo].[Department] ([DepartmentId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_Department_DepartmentId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_Designation_DesignationId] FOREIGN KEY([DesignationId])
--REFERENCES [dbo].[Designation] ([DesignationId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_Designation_DesignationId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_Division_DivisionId] FOREIGN KEY([DivisionId])
--REFERENCES [dbo].[Division] ([DivisionId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_Division_DivisionId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_EmpAppraisalSetting_EmpAppraisalSettingId] FOREIGN KEY([EmpAppraisalSettingId])
--REFERENCES [dbo].[EmpAppraisalSetting] ([EmpAppraisalSettingId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_EmpAppraisalSetting_EmpAppraisalSettingId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_FeedbackStatus_AppraisalStatusId] FOREIGN KEY([AppraisalStatusId])
--REFERENCES [dbo].[FeedbackStatus] ([FeedbackStatusId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_FeedbackStatus_AppraisalStatusId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_Location_LocationId] FOREIGN KEY([LocationId])
--REFERENCES [dbo].[Location] ([LocationId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_Location_LocationId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_Team_TeamId] FOREIGN KEY([TeamId])
--REFERENCES [dbo].[Team] ([TeamId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_Team_TeamId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_User_Appraiser] FOREIGN KEY([AppraiserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_User_Appraiser]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_User_Approver1] FOREIGN KEY([Approver1])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_User_Approver1]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_User_RM] FOREIGN KEY([RMId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_User_RM]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_User_UserId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingLog_Vertical_VerticalId] FOREIGN KEY([VerticalId])
--REFERENCES [dbo].[Vertical] ([VerticalId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingLog] CHECK CONSTRAINT [FK_EmpAppraisalSettingLog_Vertical_VerticalId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingStage]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingStage_AppraisalStage_AppraisalStageId] FOREIGN KEY([AppraisalStageId])
--REFERENCES [dbo].[AppraisalStage] ([AppraisalStageId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingStage] CHECK CONSTRAINT [FK_EmpAppraisalSettingStage_AppraisalStage_AppraisalStageId]
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingStage]  WITH CHECK ADD  CONSTRAINT [FK_EmpAppraisalSettingStage_EmpAppraisalSetting_EmpAppraisalSettingId] FOREIGN KEY([EmpAppraisalSettingId])
--REFERENCES [dbo].[EmpAppraisalSetting] ([EmpAppraisalSettingId])
--GO
--ALTER TABLE [dbo].[EmpAppraisalSettingStage] CHECK CONSTRAINT [FK_EmpAppraisalSettingStage_EmpAppraisalSetting_EmpAppraisalSettingId]
--GO
--ALTER TABLE [dbo].[EmployeeProfile]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProfile_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[EmployeeProfile] CHECK CONSTRAINT [FK_EmployeeProfile_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[EmployeeProfile]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProfile_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[EmployeeProfile] CHECK CONSTRAINT [FK_EmployeeProfile_User_UserId]
--GO
--ALTER TABLE [dbo].[EmployeeWiseWeekOff]  WITH CHECK ADD FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[EmployeeWiseWeekOff]  WITH CHECK ADD FOREIGN KEY([WeekOffDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[EmployeeWish]  WITH CHECK ADD  CONSTRAINT [FK_EmployeWish_WishType] FOREIGN KEY([WishTypeId])
--REFERENCES [dbo].[WishType] ([WishTypeId])
--GO
--ALTER TABLE [dbo].[EmployeeWish] CHECK CONSTRAINT [FK_EmployeWish_WishType]
--GO
--ALTER TABLE [dbo].[ExcludedUsersForAttendanceImport]  WITH CHECK ADD  CONSTRAINT [FK_ExcludedUsersForAttendanceImport_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ExcludedUsersForAttendanceImport] CHECK CONSTRAINT [FK_ExcludedUsersForAttendanceImport_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ExcludedUsersForAttendanceImport]  WITH CHECK ADD  CONSTRAINT [FK_ExcludedUsersForAttendanceImport_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ExcludedUsersForAttendanceImport] CHECK CONSTRAINT [FK_ExcludedUsersForAttendanceImport_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[FeedbackStatus]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackStatus_FeedbackType_FeedbackTypeId] FOREIGN KEY([FeedbackTypeId])
--REFERENCES [dbo].[FeedbackType] ([FeedbackTypeId])
--GO
--ALTER TABLE [dbo].[FeedbackStatus] CHECK CONSTRAINT [FK_FeedbackStatus_FeedbackType_FeedbackTypeId]
--GO
--ALTER TABLE [dbo].[FinalizedCabRequest]  WITH CHECK ADD  CONSTRAINT [FK_FinalizedCabRequest_SupportingStaffMember_StaffId] FOREIGN KEY([StaffId])
--REFERENCES [dbo].[SupportingStaffMember] ([RecordId])
--GO
--ALTER TABLE [dbo].[FinalizedCabRequest] CHECK CONSTRAINT [FK_FinalizedCabRequest_SupportingStaffMember_StaffId]
--GO
--ALTER TABLE [dbo].[FinalizedCabRequest]  WITH CHECK ADD  CONSTRAINT [FK_FinalizedCabRequest_VehicleDetails_VehicleId] FOREIGN KEY([VehicleId])
--REFERENCES [dbo].[VehicleDetails] ([VehicleId])
--GO
--ALTER TABLE [dbo].[FinalizedCabRequest] CHECK CONSTRAINT [FK_FinalizedCabRequest_VehicleDetails_VehicleId]
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_FinalLoggedTasks_GeminiProjects_ProjectId] FOREIGN KEY([ProjectId])
--REFERENCES [dbo].[Projects] ([ProjectId])
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks] CHECK CONSTRAINT [FK_FinalLoggedTasks_GeminiProjects_ProjectId]
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_FinalLoggedTasks_TaskSubDetail1_TaskSubDetail1Id] FOREIGN KEY([TaskSubDetail1Id])
--REFERENCES [dbo].[TaskSubDetail1] ([TaskSubDetail1Id])
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks] CHECK CONSTRAINT [FK_FinalLoggedTasks_TaskSubDetail1_TaskSubDetail1Id]
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_FinalLoggedTasks_TaskSubDetail2_TaskSubDetail2Id] FOREIGN KEY([TaskSubDetail2Id])
--REFERENCES [dbo].[TaskSubDetail2] ([TaskSubDetail2Id])
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks] CHECK CONSTRAINT [FK_FinalLoggedTasks_TaskSubDetail2_TaskSubDetail2Id]
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_FinalLoggedTasks_TaskTeam_TaskTeamId] FOREIGN KEY([TaskTeamId])
--REFERENCES [dbo].[TaskTeam] ([TaskTeamId])
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks] CHECK CONSTRAINT [FK_FinalLoggedTasks_TaskTeam_TaskTeamId]
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_FinalLoggedTasks_TaskType_TaskTypeId] FOREIGN KEY([TaskTypeId])
--REFERENCES [dbo].[TaskType] ([TaskTypeId])
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks] CHECK CONSTRAINT [FK_FinalLoggedTasks_TaskType_TaskTypeId]
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_FinalLoggedTasks_TimeSheetTaskMapping_MappingId] FOREIGN KEY([MappingId])
--REFERENCES [dbo].[TimeSheetTaskMapping] ([RecordId])
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks] CHECK CONSTRAINT [FK_FinalLoggedTasks_TimeSheetTaskMapping_MappingId]
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_FinalLoggedTasks_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[FinalLoggedTasks] CHECK CONSTRAINT [FK_FinalLoggedTasks_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[Form]  WITH CHECK ADD  CONSTRAINT [FK_Form_Department_DepartmentId] FOREIGN KEY([DepartmentId])
--REFERENCES [dbo].[Department] ([DepartmentId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[Form] CHECK CONSTRAINT [FK_Form_Department_DepartmentId]
--GO
--ALTER TABLE [dbo].[Form]  WITH CHECK ADD  CONSTRAINT [FK_Form_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[Form] CHECK CONSTRAINT [FK_Form_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[Form]  WITH CHECK ADD  CONSTRAINT [FK_Form_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[Form] CHECK CONSTRAINT [FK_Form_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[GoalCategory]  WITH CHECK ADD  CONSTRAINT [FK_GoalCategory_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[GoalCategory] CHECK CONSTRAINT [FK_GoalCategory_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[GoalCategory]  WITH CHECK ADD  CONSTRAINT [FK_GoalCategory_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[GoalCategory] CHECK CONSTRAINT [FK_GoalCategory_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[GoalStatus]  WITH CHECK ADD  CONSTRAINT [FK_GoalStatus_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[GoalStatus] CHECK CONSTRAINT [FK_GoalStatus_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[GoalStatus]  WITH CHECK ADD  CONSTRAINT [FK_GoalStatus_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[GoalStatus] CHECK CONSTRAINT [FK_GoalStatus_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[GSOCProjectSubscriber]  WITH CHECK ADD  CONSTRAINT [FK_GSOCProjectSubscriber_GSOCProject] FOREIGN KEY([GSOCProjectId])
--REFERENCES [dbo].[GSOCProject] ([GSOCProjectId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[GSOCProjectSubscriber] CHECK CONSTRAINT [FK_GSOCProjectSubscriber_GSOCProject]
--GO
--ALTER TABLE [dbo].[GSOCProjectSubscriber]  WITH CHECK ADD  CONSTRAINT [FK_GSOCProjectSubscriber_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[GSOCProjectSubscriber] CHECK CONSTRAINT [FK_GSOCProjectSubscriber_User]
--GO
--ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([InvoiceRequestDetailId])
--REFERENCES [dbo].[InvoiceRequestDetail] ([InvoiceRequestDetailId])
--GO
--ALTER TABLE [dbo].[InvoiceRequest]  WITH CHECK ADD FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[InvoiceRequestDetail]  WITH CHECK ADD FOREIGN KEY([ClientId])
--REFERENCES [dbo].[Client] ([ClientId])
--GO
--ALTER TABLE [dbo].[InvoiceRequestDetail]  WITH CHECK ADD FOREIGN KEY([InvoiceRequestId])
--REFERENCES [dbo].[InvoiceRequest] ([InvoiceRequestId])
--GO
--ALTER TABLE [dbo].[LeaveBalance]  WITH CHECK ADD  CONSTRAINT [FK_LeaveBalance_LeaveTypeMaster_LeaveTypeId] FOREIGN KEY([LeaveTypeId])
--REFERENCES [dbo].[LeaveTypeMaster] ([TypeId])
--GO
--ALTER TABLE [dbo].[LeaveBalance] CHECK CONSTRAINT [FK_LeaveBalance_LeaveTypeMaster_LeaveTypeId]
--GO
--ALTER TABLE [dbo].[LeaveBalance]  WITH CHECK ADD  CONSTRAINT [FK_LeaveBalance_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveBalance] CHECK CONSTRAINT [FK_LeaveBalance_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[LeaveBalance]  WITH CHECK ADD  CONSTRAINT [FK_LeaveBalance_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveBalance] CHECK CONSTRAINT [FK_LeaveBalance_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[LeaveBalance]  WITH CHECK ADD  CONSTRAINT [FK_LeaveBalance_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[LeaveBalance] CHECK CONSTRAINT [FK_LeaveBalance_User_UserId]
--GO
--ALTER TABLE [dbo].[LeaveBalanceHistory]  WITH CHECK ADD  CONSTRAINT [FK_LeaveBalanceHistory_LeaveBalance_RecordId] FOREIGN KEY([RecordId])
--REFERENCES [dbo].[LeaveBalance] ([RecordId])
--GO
--ALTER TABLE [dbo].[LeaveBalanceHistory] CHECK CONSTRAINT [FK_LeaveBalanceHistory_LeaveBalance_RecordId]
--GO
--ALTER TABLE [dbo].[LeaveBalanceHistory]  WITH CHECK ADD  CONSTRAINT [FK_LeaveBalanceHistory_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveBalanceHistory] CHECK CONSTRAINT [FK_LeaveBalanceHistory_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[LeaveHistory]  WITH CHECK ADD  CONSTRAINT [FK_LeaveHistory_LeaveRequestApplication_LeaveRequestApplicationId] FOREIGN KEY([LeaveRequestApplicationId])
--REFERENCES [dbo].[LeaveRequestApplication] ([LeaveRequestApplicationId])
--GO
--ALTER TABLE [dbo].[LeaveHistory] CHECK CONSTRAINT [FK_LeaveHistory_LeaveRequestApplication_LeaveRequestApplicationId]
--GO
--ALTER TABLE [dbo].[LeaveHistory]  WITH CHECK ADD  CONSTRAINT [FK_LeaveHistory_LeaveStatusMaster_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[LeaveStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[LeaveHistory] CHECK CONSTRAINT [FK_LeaveHistory_LeaveStatusMaster_StatusId]
--GO
--ALTER TABLE [dbo].[LeaveHistory]  WITH CHECK ADD  CONSTRAINT [FK_LeaveHistory_User_ApproverId] FOREIGN KEY([ApproverId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveHistory] CHECK CONSTRAINT [FK_LeaveHistory_User_ApproverId]
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequestApplication_DateMaster_FromDateId] FOREIGN KEY([FromDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication] CHECK CONSTRAINT [FK_LeaveRequestApplication_DateMaster_FromDateId]
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequestApplication_DateMaster_TillDateId] FOREIGN KEY([TillDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication] CHECK CONSTRAINT [FK_LeaveRequestApplication_DateMaster_TillDateId]
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequestApplication_LeaveStatusMaster_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[LeaveStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication] CHECK CONSTRAINT [FK_LeaveRequestApplication_LeaveStatusMaster_StatusId]
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequestApplication_User_ApproverId] FOREIGN KEY([ApproverId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication] CHECK CONSTRAINT [FK_LeaveRequestApplication_User_ApproverId]
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequestApplication_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication] CHECK CONSTRAINT [FK_LeaveRequestApplication_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequestApplication_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication] CHECK CONSTRAINT [FK_LeaveRequestApplication_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequestApplication_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveRequestApplication] CHECK CONSTRAINT [FK_LeaveRequestApplication_User_UserId]
--GO
--ALTER TABLE [dbo].[LeaveRequestApplicationDetail]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequestApplicationDetail_LeaveRequestApplication_LeaveRequestApplicationId] FOREIGN KEY([LeaveRequestApplicationId])
--REFERENCES [dbo].[LeaveRequestApplication] ([LeaveRequestApplicationId])
--GO
--ALTER TABLE [dbo].[LeaveRequestApplicationDetail] CHECK CONSTRAINT [FK_LeaveRequestApplicationDetail_LeaveRequestApplication_LeaveRequestApplicationId]
--GO
--ALTER TABLE [dbo].[LeaveRequestApplicationDetail]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequestApplicationDetail_LeaveTypeMaster_LeaveTypeId] FOREIGN KEY([LeaveTypeId])
--REFERENCES [dbo].[LeaveTypeMaster] ([TypeId])
--GO
--ALTER TABLE [dbo].[LeaveRequestApplicationDetail] CHECK CONSTRAINT [FK_LeaveRequestApplicationDetail_LeaveTypeMaster_LeaveTypeId]
--GO
--ALTER TABLE [dbo].[LeaveStatusMaster]  WITH CHECK ADD  CONSTRAINT [FK_LeaveStatusMaster_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveStatusMaster] CHECK CONSTRAINT [FK_LeaveStatusMaster_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[LeaveStatusMaster]  WITH CHECK ADD  CONSTRAINT [FK_LeaveStatusMaster_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveStatusMaster] CHECK CONSTRAINT [FK_LeaveStatusMaster_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[LeaveTypeMaster]  WITH CHECK ADD  CONSTRAINT [FK_LeaveTypeMaster_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveTypeMaster] CHECK CONSTRAINT [FK_LeaveTypeMaster_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[LeaveTypeMaster]  WITH CHECK ADD  CONSTRAINT [FK_LeaveTypeMaster_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LeaveTypeMaster] CHECK CONSTRAINT [FK_LeaveTypeMaster_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequest_DateMaster_DateId] FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest] CHECK CONSTRAINT [FK_LegitimateLeaveRequest_DateMaster_DateId]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequest_LeaveRequestApplication_LeaveRequestApplicationId] FOREIGN KEY([LeaveRequestApplicationId])
--REFERENCES [dbo].[LeaveRequestApplication] ([LeaveRequestApplicationId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest] CHECK CONSTRAINT [FK_LegitimateLeaveRequest_LeaveRequestApplication_LeaveRequestApplicationId]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequest_LegitimateLeaveStatus_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[LegitimateLeaveStatus] ([StatusId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest] CHECK CONSTRAINT [FK_LegitimateLeaveRequest_LegitimateLeaveStatus_StatusId]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequest_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest] CHECK CONSTRAINT [FK_LegitimateLeaveRequest_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequest_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest] CHECK CONSTRAINT [FK_LegitimateLeaveRequest_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequest_User_NextApproverId] FOREIGN KEY([NextApproverId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest] CHECK CONSTRAINT [FK_LegitimateLeaveRequest_User_NextApproverId]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequest_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest] CHECK CONSTRAINT [FK_LegitimateLeaveRequest_User_UserId]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequestHistory_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequest] CHECK CONSTRAINT [FK_LegitimateLeaveRequestHistory_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequestHistory_DateMaster_DateId] FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequestHistory] CHECK CONSTRAINT [FK_LegitimateLeaveRequestHistory_DateMaster_DateId]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequestHistory_LegitimateLeaveRequest_LegitimateLeaveRequestId] FOREIGN KEY([LegitimateLeaveRequestId])
--REFERENCES [dbo].[LegitimateLeaveRequest] ([LegitimateLeaveRequestId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequestHistory] CHECK CONSTRAINT [FK_LegitimateLeaveRequestHistory_LegitimateLeaveRequest_LegitimateLeaveRequestId]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequestHistory_LegitimateLeaveStatus_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[LegitimateLeaveStatus] ([StatusId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequestHistory] CHECK CONSTRAINT [FK_LegitimateLeaveRequestHistory_LegitimateLeaveStatus_StatusId]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveRequestHistory_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveRequestHistory] CHECK CONSTRAINT [FK_LegitimateLeaveRequestHistory_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveStatus]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveStatus_User_CreatedById] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveStatus] CHECK CONSTRAINT [FK_LegitimateLeaveStatus_User_CreatedById]
--GO
--ALTER TABLE [dbo].[LegitimateLeaveStatus]  WITH CHECK ADD  CONSTRAINT [FK_LegitimateLeaveStatus_User_ModifiedById] FOREIGN KEY([ModifiedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LegitimateLeaveStatus] CHECK CONSTRAINT [FK_LegitimateLeaveStatus_User_ModifiedById]
--GO
--ALTER TABLE [dbo].[ListofHoliday]  WITH CHECK ADD  CONSTRAINT [FK_ListofHoliday_DateMaster_DateId] FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[ListofHoliday] CHECK CONSTRAINT [FK_ListofHoliday_DateMaster_DateId]
--GO
--ALTER TABLE [dbo].[ListofHoliday]  WITH CHECK ADD  CONSTRAINT [FK_ListofHoliday_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ListofHoliday] CHECK CONSTRAINT [FK_ListofHoliday_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_City_CityId] FOREIGN KEY([CityId])
--REFERENCES [dbo].[City] ([CityId])
--GO
--ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_City_CityId]
--GO
--ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Company_CompanyId] FOREIGN KEY([CompanyId])
--REFERENCES [dbo].[Company] ([CompanyId])
--GO
--ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Company_CompanyId]
--GO
--ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Country_CountryId] FOREIGN KEY([CountryId])
--REFERENCES [dbo].[Country] ([CountryId])
--GO
--ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Country_CountryId]
--GO
--ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_State_StateId] FOREIGN KEY([StateId])
--REFERENCES [dbo].[State] ([StateId])
--GO
--ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_State_StateId]
--GO
--ALTER TABLE [dbo].[LoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_LoggedTasks_GeminiProjects_ProjectId] FOREIGN KEY([ProjectId])
--REFERENCES [dbo].[Projects] ([ProjectId])
--GO
--ALTER TABLE [dbo].[LoggedTasks] CHECK CONSTRAINT [FK_LoggedTasks_GeminiProjects_ProjectId]
--GO
--ALTER TABLE [dbo].[LoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_LoggedTasks_TaskSubDetail1_TaskSubDetail1Id] FOREIGN KEY([TaskSubDetail1Id])
--REFERENCES [dbo].[TaskSubDetail1] ([TaskSubDetail1Id])
--GO
--ALTER TABLE [dbo].[LoggedTasks] CHECK CONSTRAINT [FK_LoggedTasks_TaskSubDetail1_TaskSubDetail1Id]
--GO
--ALTER TABLE [dbo].[LoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_LoggedTasks_TaskSubDetail2_TaskSubDetail2Id] FOREIGN KEY([TaskSubDetail2Id])
--REFERENCES [dbo].[TaskSubDetail2] ([TaskSubDetail2Id])
--GO
--ALTER TABLE [dbo].[LoggedTasks] CHECK CONSTRAINT [FK_LoggedTasks_TaskSubDetail2_TaskSubDetail2Id]
--GO
--ALTER TABLE [dbo].[LoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_LoggedTasks_TaskTeam_TaskTeamId] FOREIGN KEY([TaskTeamId])
--REFERENCES [dbo].[TaskTeam] ([TaskTeamId])
--GO
--ALTER TABLE [dbo].[LoggedTasks] CHECK CONSTRAINT [FK_LoggedTasks_TaskTeam_TaskTeamId]
--GO
--ALTER TABLE [dbo].[LoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_LoggedTasks_TaskType_TaskTypeId] FOREIGN KEY([TaskTypeId])
--REFERENCES [dbo].[TaskType] ([TaskTypeId])
--GO
--ALTER TABLE [dbo].[LoggedTasks] CHECK CONSTRAINT [FK_LoggedTasks_TaskType_TaskTypeId]
--GO
--ALTER TABLE [dbo].[LoggedTasks]  WITH CHECK ADD  CONSTRAINT [FK_LoggedTasks_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[LoggedTasks] CHECK CONSTRAINT [FK_LoggedTasks_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ManpowerRequisitionForm]  WITH CHECK ADD  CONSTRAINT [FK_ManpowerRequisitionForm_ManpowerRequisitionInvite_InviteId] FOREIGN KEY([InviteId])
--REFERENCES [dbo].[ManpowerRequisitionInvite] ([InviteId])
--GO
--ALTER TABLE [dbo].[ManpowerRequisitionForm] CHECK CONSTRAINT [FK_ManpowerRequisitionForm_ManpowerRequisitionInvite_InviteId]
--GO
--ALTER TABLE [dbo].[MealPackage]  WITH CHECK ADD  CONSTRAINT [FK_MealPackage_MealCategory_MealCategoryId] FOREIGN KEY([MealCategoryId])
--REFERENCES [dbo].[MealCategory] ([MealCategoryId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MealPackage] CHECK CONSTRAINT [FK_MealPackage_MealCategory_MealCategoryId]
--GO
--ALTER TABLE [dbo].[MealPackage]  WITH CHECK ADD  CONSTRAINT [FK_MealPackage_MealPeriod_MealPeriodId] FOREIGN KEY([MealPeriodId])
--REFERENCES [dbo].[MealPeriod] ([MealPeriodId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MealPackage] CHECK CONSTRAINT [FK_MealPackage_MealPeriod_MealPeriodId]
--GO
--ALTER TABLE [dbo].[MealPackage]  WITH CHECK ADD  CONSTRAINT [FK_MealPackage_MealType_MealTypeId] FOREIGN KEY([MealTypeId])
--REFERENCES [dbo].[MealType] ([MealTypeId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MealPackage] CHECK CONSTRAINT [FK_MealPackage_MealType_MealTypeId]
--GO
--ALTER TABLE [dbo].[MealPackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_MealPackageDetail_MealDishes_MealDishesId] FOREIGN KEY([MealDishesId])
--REFERENCES [dbo].[MealDishes] ([MealDishesId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MealPackageDetail] CHECK CONSTRAINT [FK_MealPackageDetail_MealDishes_MealDishesId]
--GO
--ALTER TABLE [dbo].[MealPackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_MealPackageDetail_MealPackage_MealPackageId] FOREIGN KEY([MealPackageId])
--REFERENCES [dbo].[MealPackage] ([MealPackageId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MealPackageDetail] CHECK CONSTRAINT [FK_MealPackageDetail_MealPackage_MealPackageId]
--GO
--ALTER TABLE [dbo].[MealPackageFeedback]  WITH CHECK ADD  CONSTRAINT [FK_MealPackageFeedback_MealPackage] FOREIGN KEY([MealPackageId])
--REFERENCES [dbo].[MealPackage] ([MealPackageId])
--GO
--ALTER TABLE [dbo].[MealPackageFeedback] CHECK CONSTRAINT [FK_MealPackageFeedback_MealPackage]
--GO
--ALTER TABLE [dbo].[MealPackageFeedback]  WITH CHECK ADD  CONSTRAINT [FK_MealPackageFeedback_User_CreatedByUserId] FOREIGN KEY([CreatedByUserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MealPackageFeedback] CHECK CONSTRAINT [FK_MealPackageFeedback_User_CreatedByUserId]
--GO
--ALTER TABLE [dbo].[MenusApprovalLevel]  WITH CHECK ADD  CONSTRAINT [FK_MenusApprovalLevel_Menu_MenuId] FOREIGN KEY([MenuId])
--REFERENCES [dbo].[Menu] ([MenuId])
--GO
--ALTER TABLE [dbo].[MenusApprovalLevel] CHECK CONSTRAINT [FK_MenusApprovalLevel_Menu_MenuId]
--GO
--ALTER TABLE [dbo].[MenusApprovalLevel]  WITH CHECK ADD  CONSTRAINT [FK_MenusApprovalLevel_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[MenusApprovalLevel] CHECK CONSTRAINT [FK_MenusApprovalLevel_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[MenusRolePermission]  WITH CHECK ADD  CONSTRAINT [FK_MenusRolePermission_Menu] FOREIGN KEY([MenuId])
--REFERENCES [dbo].[Menu] ([MenuId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MenusRolePermission] CHECK CONSTRAINT [FK_MenusRolePermission_Menu]
--GO
--ALTER TABLE [dbo].[MenusRolePermission]  WITH CHECK ADD  CONSTRAINT [FK_MenusRolePermission_UserRole] FOREIGN KEY([RoleId])
--REFERENCES [dbo].[Role] ([RoleId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MenusRolePermission] CHECK CONSTRAINT [FK_MenusRolePermission_UserRole]
--GO
--ALTER TABLE [dbo].[MenusUserDelegation]  WITH CHECK ADD  CONSTRAINT [FK_MenusUserDelegation_Menu] FOREIGN KEY([MenuId])
--REFERENCES [dbo].[Menu] ([MenuId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MenusUserDelegation] CHECK CONSTRAINT [FK_MenusUserDelegation_Menu]
--GO
--ALTER TABLE [dbo].[MenusUserDelegation]  WITH CHECK ADD  CONSTRAINT [FK_MenusUserDelegation_User_DelegatedFromUserId] FOREIGN KEY([DelegatedFromUserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MenusUserDelegation] CHECK CONSTRAINT [FK_MenusUserDelegation_User_DelegatedFromUserId]
--GO
--ALTER TABLE [dbo].[MenusUserDelegation]  WITH CHECK ADD  CONSTRAINT [FK_MenusUserDelegation_User_DelegatedToUserId] FOREIGN KEY([DelegatedToUserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[MenusUserDelegation] CHECK CONSTRAINT [FK_MenusUserDelegation_User_DelegatedToUserId]
--GO
--ALTER TABLE [dbo].[MenusUserPermission]  WITH CHECK ADD  CONSTRAINT [FK_MenusUserPermission_Menu] FOREIGN KEY([MenuId])
--REFERENCES [dbo].[Menu] ([MenuId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MenusUserPermission] CHECK CONSTRAINT [FK_MenusUserPermission_Menu]
--GO
--ALTER TABLE [dbo].[MenusUserPermission]  WITH CHECK ADD  CONSTRAINT [FK_MenusUserPermission_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[MenusUserPermission] CHECK CONSTRAINT [FK_MenusUserPermission_User]
--GO
--ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_User] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_User]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDutyRequest_DateMaster_FromDateId] FOREIGN KEY([FromDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest] CHECK CONSTRAINT [FK_OfficeDutyRequest_DateMaster_FromDateId]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDutyRequest_DateMaster_TillDateId] FOREIGN KEY([TillDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest] CHECK CONSTRAINT [FK_OfficeDutyRequest_DateMaster_TillDateId]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDutyRequest_LeaveStatusMaster_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[LeaveStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest] CHECK CONSTRAINT [FK_OfficeDutyRequest_LeaveStatusMaster_StatusId]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDutyRequest_OfficeDutyType_OfficeDutyTypeId] FOREIGN KEY([OfficeDutyTypeId])
--REFERENCES [dbo].[OfficeDutyType] ([OfficeDutyTypeId])
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest] CHECK CONSTRAINT [FK_OfficeDutyRequest_OfficeDutyType_OfficeDutyTypeId]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDutyRequest_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest] CHECK CONSTRAINT [FK_OfficeDutyRequest_User]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDutyRequest_User_ApproverId] FOREIGN KEY([ApproverId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest] CHECK CONSTRAINT [FK_OfficeDutyRequest_User_ApproverId]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDutyRequest_User_CreatedById] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[OfficeDutyRequest] CHECK CONSTRAINT [FK_OfficeDutyRequest_User_CreatedById]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDutyRequestHistory_LeaveStatusMaster_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[LeaveStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[OfficeDutyRequestHistory] CHECK CONSTRAINT [FK_OfficeDutyRequestHistory_LeaveStatusMaster_StatusId]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDutyRequestHistory_OfficeDutyRequest_OfficeDutyRequestId] FOREIGN KEY([OfficeDutyRequestId])
--REFERENCES [dbo].[OfficeDutyRequest] ([OfficeDutyRequestId])
--GO
--ALTER TABLE [dbo].[OfficeDutyRequestHistory] CHECK CONSTRAINT [FK_OfficeDutyRequestHistory_OfficeDutyRequest_OfficeDutyRequestId]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDutyRequestHistory_User_ApproverId] FOREIGN KEY([ApproverId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[OfficeDutyRequestHistory] CHECK CONSTRAINT [FK_OfficeDutyRequestHistory_User_ApproverId]
--GO
--ALTER TABLE [dbo].[OfficeDutyRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDutyRequestHistory_User_CreatedById] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[OfficeDutyRequestHistory] CHECK CONSTRAINT [FK_OfficeDutyRequestHistory_User_CreatedById]
--GO
--ALTER TABLE [dbo].[OnshoreManager]  WITH CHECK ADD  CONSTRAINT [FK_OnshoreManager_Client_ClientId] FOREIGN KEY([ClientId])
--REFERENCES [dbo].[Client] ([ClientId])
--GO
--ALTER TABLE [dbo].[OnshoreManager] CHECK CONSTRAINT [FK_OnshoreManager_Client_ClientId]
--GO
--ALTER TABLE [dbo].[OutingRequest]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequest_DateMaster_FromDateId] FOREIGN KEY([FromDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[OutingRequest] CHECK CONSTRAINT [FK_OutingRequest_DateMaster_FromDateId]
--GO
--ALTER TABLE [dbo].[OutingRequest]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequest_DateMaster_TillDateId] FOREIGN KEY([TillDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[OutingRequest] CHECK CONSTRAINT [FK_OutingRequest_DateMaster_TillDateId]
--GO
--ALTER TABLE [dbo].[OutingRequest]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequest_OutingRequestStatus_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[OutingRequestStatus] ([StatusId])
--GO
--ALTER TABLE [dbo].[OutingRequest] CHECK CONSTRAINT [FK_OutingRequest_OutingRequestStatus_StatusId]
--GO
--ALTER TABLE [dbo].[OutingRequest]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequest_OutingType_OutingTypeId] FOREIGN KEY([OutingTypeId])
--REFERENCES [dbo].[OutingType] ([OutingTypeId])
--GO
--ALTER TABLE [dbo].[OutingRequest] CHECK CONSTRAINT [FK_OutingRequest_OutingType_OutingTypeId]
--GO
--ALTER TABLE [dbo].[OutingRequest]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequest_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[OutingRequest] CHECK CONSTRAINT [FK_OutingRequest_User]
--GO
--ALTER TABLE [dbo].[OutingRequest]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequest_User_CreatedById] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[OutingRequest] CHECK CONSTRAINT [FK_OutingRequest_User_CreatedById]
--GO
--ALTER TABLE [dbo].[OutingRequest]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequest_User_NextApproverId] FOREIGN KEY([NextApproverId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[OutingRequest] CHECK CONSTRAINT [FK_OutingRequest_User_NextApproverId]
--GO
--ALTER TABLE [dbo].[OutingRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequestDetail_OutingRequest_OutingRequestId] FOREIGN KEY([OutingRequestId])
--REFERENCES [dbo].[OutingRequest] ([OutingRequestId])
--GO
--ALTER TABLE [dbo].[OutingRequestDetail] CHECK CONSTRAINT [FK_OutingRequestDetail_OutingRequest_OutingRequestId]
--GO
--ALTER TABLE [dbo].[OutingRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequestDetail_OutingRequestStatus_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[OutingRequestStatus] ([StatusId])
--GO
--ALTER TABLE [dbo].[OutingRequestDetail] CHECK CONSTRAINT [FK_OutingRequestDetail_OutingRequestStatus_StatusId]
--GO
--ALTER TABLE [dbo].[OutingRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequestHistory_OutingRequest_OutingRequestId] FOREIGN KEY([OutingRequestId])
--REFERENCES [dbo].[OutingRequest] ([OutingRequestId])
--GO
--ALTER TABLE [dbo].[OutingRequestHistory] CHECK CONSTRAINT [FK_OutingRequestHistory_OutingRequest_OutingRequestId]
--GO
--ALTER TABLE [dbo].[OutingRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequestHistory_OutingRequestStatus_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[OutingRequestStatus] ([StatusId])
--GO
--ALTER TABLE [dbo].[OutingRequestHistory] CHECK CONSTRAINT [FK_OutingRequestHistory_OutingRequestStatus_StatusId]
--GO
--ALTER TABLE [dbo].[OutingRequestHistory]  WITH CHECK ADD  CONSTRAINT [FK_OutingRequestHistory_User_CreatedById] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[OutingRequestHistory] CHECK CONSTRAINT [FK_OutingRequestHistory_User_CreatedById]
--GO
--ALTER TABLE [dbo].[OutingRequestStatus]  WITH CHECK ADD  CONSTRAINT [FK_[OutingRequestStatus_User_CreatedById] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[OutingRequestStatus] CHECK CONSTRAINT [FK_[OutingRequestStatus_User_CreatedById]
--GO
--ALTER TABLE [dbo].[OutingRequestStatus]  WITH CHECK ADD  CONSTRAINT [FK_[OutingRequestStatus_User_ModifiedById] FOREIGN KEY([ModifiedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[OutingRequestStatus] CHECK CONSTRAINT [FK_[OutingRequestStatus_User_ModifiedById]
--GO
--ALTER TABLE [dbo].[PimcoAchievement]  WITH CHECK ADD FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[PimcoAchievementDetail]  WITH CHECK ADD FOREIGN KEY([PimcoAchievementId])
--REFERENCES [dbo].[PimcoAchievement] ([PimcoAchievementId])
--GO
--ALTER TABLE [dbo].[PimcoAchievementDetail]  WITH CHECK ADD  CONSTRAINT [FK_PimcoAchievementDetail_ProjectId] FOREIGN KEY([ProjectId])
--REFERENCES [dbo].[PimcoProjects] ([PimcoProjectId])
--GO
--ALTER TABLE [dbo].[PimcoAchievementDetail] CHECK CONSTRAINT [FK_PimcoAchievementDetail_ProjectId]
--GO
--ALTER TABLE [dbo].[PimcoEVP]  WITH CHECK ADD  CONSTRAINT [FK_PimcoEVP_PimcoSVP_PimcoSVPId] FOREIGN KEY([PimcoSVPId])
--REFERENCES [dbo].[PimcoSVP] ([PimcoSVPId])
--GO
--ALTER TABLE [dbo].[PimcoEVP] CHECK CONSTRAINT [FK_PimcoEVP_PimcoSVP_PimcoSVPId]
--GO
--ALTER TABLE [dbo].[PimcoExecutive]  WITH CHECK ADD  CONSTRAINT [FK_PimcoExecutive_PimcoOffboardingCategoryType_PimcoOffboardingCategoryTypeId] FOREIGN KEY([OffboardingCategoryTypeId])
--REFERENCES [dbo].[PimcoOffboardingCategoryType] ([PimcoOffboardingCategoryTypeId])
--GO
--ALTER TABLE [dbo].[PimcoExecutive] CHECK CONSTRAINT [FK_PimcoExecutive_PimcoOffboardingCategoryType_PimcoOffboardingCategoryTypeId]
--GO
--ALTER TABLE [dbo].[PimcoExecutive]  WITH CHECK ADD  CONSTRAINT [FK_PimcoExecutive_PimcoOffboardingReasonType_PimcoOffboardingReasonTypeId] FOREIGN KEY([OffboardingReasonTypeId])
--REFERENCES [dbo].[PimcoOffboardingReasonType] ([PimcoOffboardingReasonTypeId])
--GO
--ALTER TABLE [dbo].[PimcoExecutive] CHECK CONSTRAINT [FK_PimcoExecutive_PimcoOffboardingReasonType_PimcoOffboardingReasonTypeId]
--GO
--ALTER TABLE [dbo].[PimcoExecutive]  WITH CHECK ADD  CONSTRAINT [FK_PimcoExecutive_PimcoOnboardingCategoryType_PimcoOnboardingCategoryTypeId] FOREIGN KEY([PimcoOnboardingCategoryTypeId])
--REFERENCES [dbo].[PimcoOnboardingCategoryType] ([PimcoOnboardingCategoryTypeId])
--GO
--ALTER TABLE [dbo].[PimcoExecutive] CHECK CONSTRAINT [FK_PimcoExecutive_PimcoOnboardingCategoryType_PimcoOnboardingCategoryTypeId]
--GO
--ALTER TABLE [dbo].[PimcoExecutive]  WITH CHECK ADD  CONSTRAINT [FK_PimcoExecutive_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[PimcoExecutive] CHECK CONSTRAINT [FK_PimcoExecutive_User_UserId]
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping]  WITH CHECK ADD  CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoEVP_PimcoEVPId] FOREIGN KEY([PimcoEVPId])
--REFERENCES [dbo].[PimcoEVP] ([PimcoEVPId])
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping] CHECK CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoEVP_PimcoEVPId]
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping]  WITH CHECK ADD  CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoExecutive_PimcoExecutiveId] FOREIGN KEY([PimcoExecutiveId])
--REFERENCES [dbo].[PimcoExecutive] ([PimcoExecutiveId])
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping] CHECK CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoExecutive_PimcoExecutiveId]
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping]  WITH CHECK ADD  CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoGroup_PimcoGroupId] FOREIGN KEY([PimcoGroupId])
--REFERENCES [dbo].[PimcoGroup] ([PimcoGroupId])
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping] CHECK CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoGroup_PimcoGroupId]
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping]  WITH CHECK ADD  CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoSubTeam_PimcoSubTeamId] FOREIGN KEY([PimcoSubTeamId])
--REFERENCES [dbo].[PimcoSubTeam] ([PimcoSubTeamId])
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping] CHECK CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoSubTeam_PimcoSubTeamId]
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping]  WITH CHECK ADD  CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoSupervisor_PimcoSupervisorId] FOREIGN KEY([PimcoSupervisorId])
--REFERENCES [dbo].[PimcoSupervisor] ([PimcoSupervisorId])
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping] CHECK CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoSupervisor_PimcoSupervisorId]
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping]  WITH CHECK ADD  CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoSVP_PimcoSVPId] FOREIGN KEY([PimcoSVPId])
--REFERENCES [dbo].[PimcoSVP] ([PimcoSVPId])
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping] CHECK CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoSVP_PimcoSVPId]
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping]  WITH CHECK ADD  CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoTeam_PimcoTeamId] FOREIGN KEY([PimcoTeamId])
--REFERENCES [dbo].[PimcoTeam] ([PimcoTeamId])
--GO
--ALTER TABLE [dbo].[PimcoExecutiveTeamMapping] CHECK CONSTRAINT [FK_PimcoExecutiveTeamMapping_PimcoTeam_PimcoTeamId]
--GO
--ALTER TABLE [dbo].[PimcoMonthlyAchievement]  WITH CHECK ADD  CONSTRAINT [FK_PimcoMonthlyAchievement_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[PimcoMonthlyAchievement] CHECK CONSTRAINT [FK_PimcoMonthlyAchievement_User_UserId]
--GO
--ALTER TABLE [dbo].[PimcoMonthlyAchievementDetail]  WITH CHECK ADD  CONSTRAINT [FK_PimcoMonthlyAchievementDetail_PimcoMonthlyAchievement_PimcoAchievementId] FOREIGN KEY([PimcoAchievementId])
--REFERENCES [dbo].[PimcoMonthlyAchievement] ([PimcoAchievementId])
--GO
--ALTER TABLE [dbo].[PimcoMonthlyAchievementDetail] CHECK CONSTRAINT [FK_PimcoMonthlyAchievementDetail_PimcoMonthlyAchievement_PimcoAchievementId]
--GO
--ALTER TABLE [dbo].[PimcoMonthlyAchievementDetail]  WITH CHECK ADD  CONSTRAINT [FK_PimcoMonthlyAchievementDetail_PimcoProjects_PimcoProjectId] FOREIGN KEY([PimcoProjectId])
--REFERENCES [dbo].[PimcoProjects] ([PimcoProjectId])
--GO
--ALTER TABLE [dbo].[PimcoMonthlyAchievementDetail] CHECK CONSTRAINT [FK_PimcoMonthlyAchievementDetail_PimcoProjects_PimcoProjectId]
--GO
--ALTER TABLE [dbo].[PimcoProjects]  WITH CHECK ADD  CONSTRAINT [FK_PimcoProjects_PimcoProjectVertical_VerticalId] FOREIGN KEY([VerticalId])
--REFERENCES [dbo].[PimcoProjectVertical] ([VerticalId])
--GO
--ALTER TABLE [dbo].[PimcoProjects] CHECK CONSTRAINT [FK_PimcoProjects_PimcoProjectVertical_VerticalId]
--GO
--ALTER TABLE [dbo].[PimcoProjects]  WITH CHECK ADD  CONSTRAINT [FK_PimcoProjects_ProjectStatus_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[ProjectStatus] ([ProjectStatusId])
--GO
--ALTER TABLE [dbo].[PimcoProjects] CHECK CONSTRAINT [FK_PimcoProjects_ProjectStatus_StatusId]
--GO
--ALTER TABLE [dbo].[PimcoProjectTeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_PimcoProjectTeamMembers_PimcoProjects_PimcoProjectId] FOREIGN KEY([PimcoProjectId])
--REFERENCES [dbo].[PimcoProjects] ([PimcoProjectId])
--GO
--ALTER TABLE [dbo].[PimcoProjectTeamMembers] CHECK CONSTRAINT [FK_PimcoProjectTeamMembers_PimcoProjects_PimcoProjectId]
--GO
--ALTER TABLE [dbo].[PimcoProjectTeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_PimcoProjectTeamMembers_User_CreatedById] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[PimcoProjectTeamMembers] CHECK CONSTRAINT [FK_PimcoProjectTeamMembers_User_CreatedById]
--GO
--ALTER TABLE [dbo].[PimcoProjectTeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_PimcoProjectTeamMembers_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[PimcoProjectTeamMembers] CHECK CONSTRAINT [FK_PimcoProjectTeamMembers_User_UserId]
--GO
--ALTER TABLE [dbo].[PimcoProjectVertical]  WITH CHECK ADD  CONSTRAINT [FK_PimcoProjectVertical_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[PimcoProjectVertical] CHECK CONSTRAINT [FK_PimcoProjectVertical_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[PimcoSubTeam]  WITH CHECK ADD  CONSTRAINT [FK_PimcoSubTeam_PimcoTeam_PimcoTeamId] FOREIGN KEY([PimcoTeamId])
--REFERENCES [dbo].[PimcoTeam] ([PimcoTeamId])
--GO
--ALTER TABLE [dbo].[PimcoSubTeam] CHECK CONSTRAINT [FK_PimcoSubTeam_PimcoTeam_PimcoTeamId]
--GO
--ALTER TABLE [dbo].[PimcoSVP]  WITH CHECK ADD  CONSTRAINT [FK_PimcoSVP_PimcoSupervisor_PimcoSupervisorId] FOREIGN KEY([PimcoSupervisorId])
--REFERENCES [dbo].[PimcoSupervisor] ([PimcoSupervisorId])
--GO
--ALTER TABLE [dbo].[PimcoSVP] CHECK CONSTRAINT [FK_PimcoSVP_PimcoSupervisor_PimcoSupervisorId]
--GO
--ALTER TABLE [dbo].[PimcoTeam]  WITH CHECK ADD  CONSTRAINT [FK_PimcoTeam_PimcoGroup_PimcoGroupId] FOREIGN KEY([PimcoGroupId])
--REFERENCES [dbo].[PimcoGroup] ([PimcoGroupId])
--GO
--ALTER TABLE [dbo].[PimcoTeam] CHECK CONSTRAINT [FK_PimcoTeam_PimcoGroup_PimcoGroupId]
--GO
--ALTER TABLE [dbo].[PimcoUser]  WITH CHECK ADD  CONSTRAINT [FK_PimcoUser_User_GeminiUserId] FOREIGN KEY([GeminiUserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[PimcoUser] CHECK CONSTRAINT [FK_PimcoUser_User_GeminiUserId]
--GO
--ALTER TABLE [dbo].[PimcoUserExpiration]  WITH CHECK ADD  CONSTRAINT [FK_PimcoUser_PimcoUserExpiration_PimcoUserId] FOREIGN KEY([PimcoUserId])
--REFERENCES [dbo].[PimcoUser] ([PimcoUserId])
--GO
--ALTER TABLE [dbo].[PimcoUserExpiration] CHECK CONSTRAINT [FK_PimcoUser_PimcoUserExpiration_PimcoUserId]
--GO
--ALTER TABLE [dbo].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_Policy_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[Policy] CHECK CONSTRAINT [FK_Policy_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_Policy_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[Policy] CHECK CONSTRAINT [FK_Policy_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[ProfessionalAndEducationalExperience]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionalAndEducationalExperience_EmployeeProfile_ProfileId] FOREIGN KEY([ProfileId])
--REFERENCES [dbo].[EmployeeProfile] ([ProfileId])
--GO
--ALTER TABLE [dbo].[ProfessionalAndEducationalExperience] CHECK CONSTRAINT [FK_ProfessionalAndEducationalExperience_EmployeeProfile_ProfileId]
--GO
--ALTER TABLE [dbo].[ProfessionalAndEducationalExperience]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionalAndEducationalExperience_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ProfessionalAndEducationalExperience] CHECK CONSTRAINT [FK_ProfessionalAndEducationalExperience_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ProfileRequest]  WITH CHECK ADD  CONSTRAINT [FK_ProfileRequest_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ProfileRequest] CHECK CONSTRAINT [FK_ProfileRequest_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ProfileRequest]  WITH CHECK ADD  CONSTRAINT [FK_ProfileRequest_User_RequestedById] FOREIGN KEY([RequestedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ProfileRequest] CHECK CONSTRAINT [FK_ProfileRequest_User_RequestedById]
--GO
--ALTER TABLE [dbo].[ProfileRequest]  WITH CHECK ADD  CONSTRAINT [FK_ProfileRequest_User_RequestedForId] FOREIGN KEY([RequestedForId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ProfileRequest] CHECK CONSTRAINT [FK_ProfileRequest_User_RequestedForId]
--GO
--ALTER TABLE [dbo].[ProjectIndustryType]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjectIndustryType_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ProjectIndustryType] CHECK CONSTRAINT [FK_GeminiProjectIndustryType_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ProjectMaster]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMaster_ClientMaster_ClientId] FOREIGN KEY([ClientId])
--REFERENCES [dbo].[ClientMaster] ([ClientId])
--GO
--ALTER TABLE [dbo].[ProjectMaster] CHECK CONSTRAINT [FK_ProjectMaster_ClientMaster_ClientId]
--GO
--ALTER TABLE [dbo].[ProjectPrefrences]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjectPrefrences_GeminiProject_ProjectId] FOREIGN KEY([ProjectId])
--REFERENCES [dbo].[Projects] ([ProjectId])
--GO
--ALTER TABLE [dbo].[ProjectPrefrences] CHECK CONSTRAINT [FK_GeminiProjectPrefrences_GeminiProject_ProjectId]
--GO
--ALTER TABLE [dbo].[ProjectPrefrences]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjectPrefrences_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ProjectPrefrences] CHECK CONSTRAINT [FK_GeminiProjectPrefrences_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ProjectPrefrences]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjectPrefrences_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ProjectPrefrences] CHECK CONSTRAINT [FK_GeminiProjectPrefrences_User_UserId]
--GO
--ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjects_GeminiProjectIndustryType_IndustryTypeId] FOREIGN KEY([IndustryTypeId])
--REFERENCES [dbo].[ProjectIndustryType] ([IndustryTypeId])
--GO
--ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_GeminiProjects_GeminiProjectIndustryType_IndustryTypeId]
--GO
--ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjects_GeminiProjectStatus_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[ProjectStatus] ([ProjectStatusId])
--GO
--ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_GeminiProjects_GeminiProjectStatus_StatusId]
--GO
--ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjects_GeminiProjectVertical_VerticalId] FOREIGN KEY([VerticalId])
--REFERENCES [dbo].[ProjectVertical] ([VerticalId])
--GO
--ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_GeminiProjects_GeminiProjectVertical_VerticalId]
--GO
--ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjects_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_GeminiProjects_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ProjectStatus]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjectStatus_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ProjectStatus] CHECK CONSTRAINT [FK_GeminiProjectStatus_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ProjectTeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjectTeamMembers_GeminiProjects_ProjectId] FOREIGN KEY([ProjectId])
--REFERENCES [dbo].[Projects] ([ProjectId])
--GO
--ALTER TABLE [dbo].[ProjectTeamMembers] CHECK CONSTRAINT [FK_GeminiProjectTeamMembers_GeminiProjects_ProjectId]
--GO
--ALTER TABLE [dbo].[ProjectTeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjectTeamMembers_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ProjectTeamMembers] CHECK CONSTRAINT [FK_GeminiProjectTeamMembers_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ProjectTeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjectTeamMembers_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ProjectTeamMembers] CHECK CONSTRAINT [FK_GeminiProjectTeamMembers_User_UserId]
--GO
--ALTER TABLE [dbo].[ProjectVertical]  WITH CHECK ADD  CONSTRAINT [FK_GeminiProjectVertical_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ProjectVertical] CHECK CONSTRAINT [FK_GeminiProjectVertical_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ReferralDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReferralDetail_Referral] FOREIGN KEY([ReferralId])
--REFERENCES [dbo].[Referral] ([ReferralId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[ReferralDetail] CHECK CONSTRAINT [FK_ReferralDetail_Referral]
--GO
--ALTER TABLE [dbo].[ReferralReview]  WITH CHECK ADD FOREIGN KEY([ReferralDetailId])
--REFERENCES [dbo].[ReferralDetail] ([ReferralDetailId])
--GO
--ALTER TABLE [dbo].[ReimbursementCategory]  WITH CHECK ADD  CONSTRAINT [FK_ReimbursementCategory_ReimbursementType] FOREIGN KEY([ReimbursementTypeId])
--REFERENCES [dbo].[ReimbursementType] ([ReimbursementTypeId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[ReimbursementCategory] CHECK CONSTRAINT [FK_ReimbursementCategory_ReimbursementType]
--GO
--ALTER TABLE [dbo].[ReimbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReimbursementDetail_ReimbursementCategory] FOREIGN KEY([ReimbursementCategoryId])
--REFERENCES [dbo].[ReimbursementCategory] ([ReimbursementCategoryId])
--GO
--ALTER TABLE [dbo].[ReimbursementDetail] CHECK CONSTRAINT [FK_ReimbursementDetail_ReimbursementCategory]
--GO
--ALTER TABLE [dbo].[ReimbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReimbursementDetail_ReimbursementRequest] FOREIGN KEY([ReimbursementRequestId])
--REFERENCES [dbo].[ReimbursementRequest] ([ReimbursementRequestId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[ReimbursementDetail] CHECK CONSTRAINT [FK_ReimbursementDetail_ReimbursementRequest]
--GO
--ALTER TABLE [dbo].[ReimbursementHistory]  WITH CHECK ADD  CONSTRAINT [FK_ReimbursementHistory_ReimbursementRequest] FOREIGN KEY([ReimbursementRequestId])
--REFERENCES [dbo].[ReimbursementRequest] ([ReimbursementRequestId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[ReimbursementHistory] CHECK CONSTRAINT [FK_ReimbursementHistory_ReimbursementRequest]
--GO
--ALTER TABLE [dbo].[ReimbursementHistory]  WITH CHECK ADD  CONSTRAINT [FK_ReimbursementHistory_ReimbursementStatus] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[ReimbursementStatus] ([StatusId])
--GO
--ALTER TABLE [dbo].[ReimbursementHistory] CHECK CONSTRAINT [FK_ReimbursementHistory_ReimbursementStatus]
--GO
--ALTER TABLE [dbo].[ReimbursementRequest]  WITH CHECK ADD  CONSTRAINT [FK_ReimbursementRequest_ReimbursementStatus] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[ReimbursementStatus] ([StatusId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[ReimbursementRequest] CHECK CONSTRAINT [FK_ReimbursementRequest_ReimbursementStatus]
--GO
--ALTER TABLE [dbo].[ReimbursementRequest]  WITH CHECK ADD  CONSTRAINT [FK_ReimbursementRequest_ReimbursementType] FOREIGN KEY([ReimbursementTypeId])
--REFERENCES [dbo].[ReimbursementType] ([ReimbursementTypeId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[ReimbursementRequest] CHECK CONSTRAINT [FK_ReimbursementRequest_ReimbursementType]
--GO
--ALTER TABLE [dbo].[ReimbursementRequest]  WITH CHECK ADD  CONSTRAINT [FK_ReimbursementRequest_User_NextApproverId] FOREIGN KEY([NextApproverId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ReimbursementRequest] CHECK CONSTRAINT [FK_ReimbursementRequest_User_NextApproverId]
--GO
--ALTER TABLE [dbo].[ReimbursementRequest]  WITH CHECK ADD  CONSTRAINT [FK_ReimbursementRequest_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[ReimbursementRequest] CHECK CONSTRAINT [FK_ReimbursementRequest_User_UserId]
--GO
--ALTER TABLE [dbo].[RequestCompOff]  WITH CHECK ADD  CONSTRAINT [FK_RequestCompOff_DateMaster_DateId] FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[RequestCompOff] CHECK CONSTRAINT [FK_RequestCompOff_DateMaster_DateId]
--GO
--ALTER TABLE [dbo].[RequestCompOff]  WITH CHECK ADD  CONSTRAINT [FK_RequestCompOff_LeaveStatusMaster_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[LeaveStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[RequestCompOff] CHECK CONSTRAINT [FK_RequestCompOff_LeaveStatusMaster_StatusId]
--GO
--ALTER TABLE [dbo].[RequestCompOff]  WITH CHECK ADD  CONSTRAINT [FK_RequestCompOff_User_ApproverId] FOREIGN KEY([ApproverId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[RequestCompOff] CHECK CONSTRAINT [FK_RequestCompOff_User_ApproverId]
--GO
--ALTER TABLE [dbo].[RequestCompOffDetail]  WITH CHECK ADD  CONSTRAINT [FK_RequestCompOffDetail_LeaveRequestApplication_LeaveRequestApplicationId] FOREIGN KEY([LeaveRequestApplicationId])
--REFERENCES [dbo].[LeaveRequestApplication] ([LeaveRequestApplicationId])
--GO
--ALTER TABLE [dbo].[RequestCompOffDetail] CHECK CONSTRAINT [FK_RequestCompOffDetail_LeaveRequestApplication_LeaveRequestApplicationId]
--GO
--ALTER TABLE [dbo].[RequestCompOffDetail]  WITH CHECK ADD  CONSTRAINT [FK_RequestCompOffDetail_LegitimateLeaveRequest_LegitimateLeaveRequestId] FOREIGN KEY([LegitimateLeaveRequestId])
--REFERENCES [dbo].[LegitimateLeaveRequest] ([LegitimateLeaveRequestId])
--GO
--ALTER TABLE [dbo].[RequestCompOffDetail] CHECK CONSTRAINT [FK_RequestCompOffDetail_LegitimateLeaveRequest_LegitimateLeaveRequestId]
--GO
--ALTER TABLE [dbo].[RequestCompOffDetail]  WITH CHECK ADD  CONSTRAINT [FK_RequestCompOffDetail_RequestCompOff_RequestId] FOREIGN KEY([RequestId])
--REFERENCES [dbo].[RequestCompOff] ([RequestId])
--GO
--ALTER TABLE [dbo].[RequestCompOffDetail] CHECK CONSTRAINT [FK_RequestCompOffDetail_RequestCompOff_RequestId]
--GO
--ALTER TABLE [dbo].[RequestCompOffHistory]  WITH CHECK ADD  CONSTRAINT [FK_RequestCompOffHistory_LeaveStatusMaster_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[LeaveStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[RequestCompOffHistory] CHECK CONSTRAINT [FK_RequestCompOffHistory_LeaveStatusMaster_StatusId]
--GO
--ALTER TABLE [dbo].[RequestCompOffHistory]  WITH CHECK ADD  CONSTRAINT [FK_RequestCompOffHistory_User_ApproverId] FOREIGN KEY([ApproverId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[RequestCompOffHistory] CHECK CONSTRAINT [FK_RequestCompOffHistory_User_ApproverId]
--GO
--ALTER TABLE [dbo].[RequestCompOffHistory]  WITH CHECK ADD  CONSTRAINT [FK_RequestCompOffHistory_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[RequestCompOffHistory] CHECK CONSTRAINT [FK_RequestCompOffHistory_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[RequestLnsa]  WITH CHECK ADD  CONSTRAINT [FK_RequestLnsa_DateMaster_FromDateId] FOREIGN KEY([FromDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[RequestLnsa] CHECK CONSTRAINT [FK_RequestLnsa_DateMaster_FromDateId]
--GO
--ALTER TABLE [dbo].[RequestLnsa]  WITH CHECK ADD  CONSTRAINT [FK_RequestLnsa_DateMaster_TillDateId] FOREIGN KEY([TillDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[RequestLnsa] CHECK CONSTRAINT [FK_RequestLnsa_DateMaster_TillDateId]
--GO
--ALTER TABLE [dbo].[RequestLnsa]  WITH CHECK ADD  CONSTRAINT [FK_RequestLnsa_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[LNSAStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[RequestLnsa] CHECK CONSTRAINT [FK_RequestLnsa_StatusId]
--GO
--ALTER TABLE [dbo].[RequestLnsa]  WITH CHECK ADD  CONSTRAINT [FK_RequestLnsa_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[RequestLnsa] CHECK CONSTRAINT [FK_RequestLnsa_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[RequestLnsaHistory]  WITH CHECK ADD  CONSTRAINT [FK_RequestLnsaHistory_LNSAStatusMaster_StatusId] FOREIGN KEY([StatusId])
--REFERENCES [dbo].[LNSAStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[RequestLnsaHistory] CHECK CONSTRAINT [FK_RequestLnsaHistory_LNSAStatusMaster_StatusId]
--GO
--ALTER TABLE [dbo].[RequestLnsaHistory]  WITH CHECK ADD  CONSTRAINT [FK_RequestLnsaHistory_RequestLnsa_RequestLnsaId] FOREIGN KEY([RequestId])
--REFERENCES [dbo].[RequestLnsa] ([RequestId])
--GO
--ALTER TABLE [dbo].[RequestLnsaHistory] CHECK CONSTRAINT [FK_RequestLnsaHistory_RequestLnsa_RequestLnsaId]
--GO
--ALTER TABLE [dbo].[SchedulerAction]  WITH CHECK ADD  CONSTRAINT [FK_SchedulerActions_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[SchedulerAction] CHECK CONSTRAINT [FK_SchedulerActions_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[SchedulerAction]  WITH CHECK ADD  CONSTRAINT [FK_SchedulerActions_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[SchedulerAction] CHECK CONSTRAINT [FK_SchedulerActions_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[SeatAllocationDetail]  WITH CHECK ADD  CONSTRAINT [FK_SeatAllocationDetail_AllocationTypeMaster] FOREIGN KEY([AllocationTypeId])
--REFERENCES [dbo].[AllocationTypeMaster] ([AllocationTypeId])
--GO
--ALTER TABLE [dbo].[SeatAllocationDetail] CHECK CONSTRAINT [FK_SeatAllocationDetail_AllocationTypeMaster]
--GO
--ALTER TABLE [dbo].[SeatAllocationDetail]  WITH CHECK ADD  CONSTRAINT [FK_SeatAllocationDetail_BlockingReasonMaster] FOREIGN KEY([BlockingReasonId])
--REFERENCES [dbo].[BlockingReasonMaster] ([BlockingReasonId])
--GO
--ALTER TABLE [dbo].[SeatAllocationDetail] CHECK CONSTRAINT [FK_SeatAllocationDetail_BlockingReasonMaster]
--GO
--ALTER TABLE [dbo].[SeatAllocationDetail]  WITH CHECK ADD  CONSTRAINT [FK_SeatAllocationDetail_SeatItemMaster] FOREIGN KEY([SystemRequirementId])
--REFERENCES [dbo].[SeatItemMaster] ([ItemId])
--GO
--ALTER TABLE [dbo].[SeatAllocationDetail] CHECK CONSTRAINT [FK_SeatAllocationDetail_SeatItemMaster]
--GO
--ALTER TABLE [dbo].[SeatAllocationDetail]  WITH CHECK ADD  CONSTRAINT [FK_SeatAllocationDetail_SeatMaster] FOREIGN KEY([SeatId])
--REFERENCES [dbo].[SeatMaster] ([SeatId])
--GO
--ALTER TABLE [dbo].[SeatAllocationDetail] CHECK CONSTRAINT [FK_SeatAllocationDetail_SeatMaster]
--GO
--ALTER TABLE [dbo].[SeatCheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_SeatCheckDetail_SeatItemMaster] FOREIGN KEY([ItemId])
--REFERENCES [dbo].[WPSCheckItemMaster] ([ItemId])
--GO
--ALTER TABLE [dbo].[SeatCheckDetail] CHECK CONSTRAINT [FK_SeatCheckDetail_SeatItemMaster]
--GO
--ALTER TABLE [dbo].[SeatCheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_SeatCheckDetail_SeatMaster] FOREIGN KEY([SeatId])
--REFERENCES [dbo].[SeatMaster] ([SeatId])
--GO
--ALTER TABLE [dbo].[SeatCheckDetail] CHECK CONSTRAINT [FK_SeatCheckDetail_SeatMaster]
--GO
--ALTER TABLE [dbo].[SeatMaster]  WITH CHECK ADD  CONSTRAINT [FK_SeatMaster_PremisesFloorMapping] FOREIGN KEY([PremisesFloorId])
--REFERENCES [dbo].[LocationPremisesListMaster] ([PremisesFloorId])
--GO
--ALTER TABLE [dbo].[SeatMaster] CHECK CONSTRAINT [FK_SeatMaster_PremisesFloorMapping]
--GO
--ALTER TABLE [dbo].[SeatMaster]  WITH CHECK ADD  CONSTRAINT [FK_SeatMaster_SeatStatusMaster] FOREIGN KEY([SeatStatusId])
--REFERENCES [dbo].[SeatStatusMaster] ([StatusId])
--GO
--ALTER TABLE [dbo].[SeatMaster] CHECK CONSTRAINT [FK_SeatMaster_SeatStatusMaster]
--GO
--ALTER TABLE [dbo].[SeatMaster]  WITH CHECK ADD  CONSTRAINT [FK_SeatMaster_SeatTypeMaster] FOREIGN KEY([SeatTypeId])
--REFERENCES [dbo].[SeatTypeMaster] ([SeatTypeId])
--GO
--ALTER TABLE [dbo].[SeatMaster] CHECK CONSTRAINT [FK_SeatMaster_SeatTypeMaster]
--GO
--ALTER TABLE [dbo].[SharedGroupDocument]  WITH CHECK ADD  CONSTRAINT [FK_SharedGroupDocument_Document] FOREIGN KEY([DocumentId])
--REFERENCES [dbo].[Document] ([DocId])
--GO
--ALTER TABLE [dbo].[SharedGroupDocument] CHECK CONSTRAINT [FK_SharedGroupDocument_Document]
--GO
--ALTER TABLE [dbo].[SharedGroupDocument]  WITH CHECK ADD  CONSTRAINT [FK_SharedGroupDocument_DocumentPermissionGroup] FOREIGN KEY([SharedGroupId])
--REFERENCES [dbo].[DocumentPermissionGroup] ([DocumentPermissionGroupId])
--GO
--ALTER TABLE [dbo].[SharedGroupDocument] CHECK CONSTRAINT [FK_SharedGroupDocument_DocumentPermissionGroup]
--GO
--ALTER TABLE [dbo].[SharedGroupDocument]  WITH CHECK ADD  CONSTRAINT [FK_SharedGroupDocument_User] FOREIGN KEY([SharedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[SharedGroupDocument] CHECK CONSTRAINT [FK_SharedGroupDocument_User]
--GO
--ALTER TABLE [dbo].[ShareDocument]  WITH CHECK ADD  CONSTRAINT [FK__ShareDocu__Docum__2B5F6B28] FOREIGN KEY([DocumentId])
--REFERENCES [dbo].[Document] ([DocId])
--GO
--ALTER TABLE [dbo].[ShareDocument] CHECK CONSTRAINT [FK__ShareDocu__Docum__2B5F6B28]
--GO
--ALTER TABLE [dbo].[ShareDocument]  WITH CHECK ADD  CONSTRAINT [FK__ShareDocu__Share__2C538F61] FOREIGN KEY([ShareTo])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ShareDocument] CHECK CONSTRAINT [FK__ShareDocu__Share__2C538F61]
--GO
--ALTER TABLE [dbo].[ShareDocument]  WITH CHECK ADD  CONSTRAINT [FK__ShareDocu__Share__2D47B39A] FOREIGN KEY([ShareBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ShareDocument] CHECK CONSTRAINT [FK__ShareDocu__Share__2D47B39A]
--GO
--ALTER TABLE [dbo].[ShiftMaster]  WITH CHECK ADD  CONSTRAINT [FK_ShiftMaster_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ShiftMaster] CHECK CONSTRAINT [FK_ShiftMaster_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[ShiftMaster]  WITH CHECK ADD  CONSTRAINT [FK_ShiftMaster_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[ShiftMaster] CHECK CONSTRAINT [FK_ShiftMaster_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[SupportingStaffMember]  WITH CHECK ADD  CONSTRAINT [FK_SupportingStaffMember_Location_LocationId] FOREIGN KEY([LocationId])
--REFERENCES [dbo].[Location] ([LocationId])
--GO
--ALTER TABLE [dbo].[SupportingStaffMember] CHECK CONSTRAINT [FK_SupportingStaffMember_Location_LocationId]
--GO
--ALTER TABLE [dbo].[SupportingStaffMember]  WITH CHECK ADD  CONSTRAINT [FK_SupportingStaffMember_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[SupportingStaffMember] CHECK CONSTRAINT [FK_SupportingStaffMember_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[TaskSubDetail1]  WITH CHECK ADD  CONSTRAINT [FK_TaskSubDetail1_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TaskSubDetail1] CHECK CONSTRAINT [FK_TaskSubDetail1_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[TaskSubDetail2]  WITH CHECK ADD  CONSTRAINT [FK_TaskSubDetail2_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TaskSubDetail2] CHECK CONSTRAINT [FK_TaskSubDetail2_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[TaskTeam]  WITH CHECK ADD  CONSTRAINT [FK_TaskTeam_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TaskTeam] CHECK CONSTRAINT [FK_TaskTeam_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[TaskTeamTaskTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_TaskTeamTaskTypeMapping_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TaskTeamTaskTypeMapping] CHECK CONSTRAINT [FK_TaskTeamTaskTypeMapping_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[TaskTeamTaskTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_TeamTaskTypeMapping_TaskTeam_TaskTeamId] FOREIGN KEY([TaskTeamId])
--REFERENCES [dbo].[TaskTeam] ([TaskTeamId])
--GO
--ALTER TABLE [dbo].[TaskTeamTaskTypeMapping] CHECK CONSTRAINT [FK_TeamTaskTypeMapping_TaskTeam_TaskTeamId]
--GO
--ALTER TABLE [dbo].[TaskTeamTaskTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_TeamTaskTypeMapping_TaskType_TaskTypeId] FOREIGN KEY([TaskTypeId])
--REFERENCES [dbo].[TaskType] ([TaskTypeId])
--GO
--ALTER TABLE [dbo].[TaskTeamTaskTypeMapping] CHECK CONSTRAINT [FK_TeamTaskTypeMapping_TaskType_TaskTypeId]
--GO
--ALTER TABLE [dbo].[TaskTemplates]  WITH CHECK ADD  CONSTRAINT [FK_TaskTemplates_TaskSubDetail1_TaskSubDetail1Id] FOREIGN KEY([TaskSubDetail1Id])
--REFERENCES [dbo].[TaskSubDetail1] ([TaskSubDetail1Id])
--GO
--ALTER TABLE [dbo].[TaskTemplates] CHECK CONSTRAINT [FK_TaskTemplates_TaskSubDetail1_TaskSubDetail1Id]
--GO
--ALTER TABLE [dbo].[TaskTemplates]  WITH CHECK ADD  CONSTRAINT [FK_TaskTemplates_TaskSubDetail2_TaskSubDetail2Id] FOREIGN KEY([TaskSubDetail2Id])
--REFERENCES [dbo].[TaskSubDetail2] ([TaskSubDetail2Id])
--GO
--ALTER TABLE [dbo].[TaskTemplates] CHECK CONSTRAINT [FK_TaskTemplates_TaskSubDetail2_TaskSubDetail2Id]
--GO
--ALTER TABLE [dbo].[TaskTemplates]  WITH CHECK ADD  CONSTRAINT [FK_TaskTemplates_TaskTeam_TaskTeamId] FOREIGN KEY([TaskTeamId])
--REFERENCES [dbo].[TaskTeam] ([TaskTeamId])
--GO
--ALTER TABLE [dbo].[TaskTemplates] CHECK CONSTRAINT [FK_TaskTemplates_TaskTeam_TaskTeamId]
--GO
--ALTER TABLE [dbo].[TaskTemplates]  WITH CHECK ADD  CONSTRAINT [FK_TaskTemplates_TaskType_TaskTypeId] FOREIGN KEY([TaskTypeId])
--REFERENCES [dbo].[TaskType] ([TaskTypeId])
--GO
--ALTER TABLE [dbo].[TaskTemplates] CHECK CONSTRAINT [FK_TaskTemplates_TaskType_TaskTypeId]
--GO
--ALTER TABLE [dbo].[TaskTemplates]  WITH CHECK ADD  CONSTRAINT [FK_TaskTemplates_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TaskTemplates] CHECK CONSTRAINT [FK_TaskTemplates_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[TaskType]  WITH CHECK ADD  CONSTRAINT [FK_TaskType_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TaskType] CHECK CONSTRAINT [FK_TaskType_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail1Mapping]  WITH CHECK ADD  CONSTRAINT [FK_TaskTypeTaskSubDetail!Mapping_TaskSubDetail1_TaskSubDetail2Id] FOREIGN KEY([TaskSubDetail1Id])
--REFERENCES [dbo].[TaskSubDetail1] ([TaskSubDetail1Id])
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail1Mapping] CHECK CONSTRAINT [FK_TaskTypeTaskSubDetail!Mapping_TaskSubDetail1_TaskSubDetail2Id]
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail1Mapping]  WITH CHECK ADD  CONSTRAINT [FK_TaskTypeTaskSubDetail1Mapping_TaskType_TaskTypeId] FOREIGN KEY([TaskTypeId])
--REFERENCES [dbo].[TaskType] ([TaskTypeId])
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail1Mapping] CHECK CONSTRAINT [FK_TaskTypeTaskSubDetail1Mapping_TaskType_TaskTypeId]
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail1Mapping]  WITH CHECK ADD  CONSTRAINT [FK_TaskTypeTaskSubDetail1Mapping_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail1Mapping] CHECK CONSTRAINT [FK_TaskTypeTaskSubDetail1Mapping_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail2Mapping]  WITH CHECK ADD  CONSTRAINT [FK_TaskTypeTaskSubDetail2Mapping_TaskSubDetail2_TaskSubDetail2Id] FOREIGN KEY([TaskSubDetail2Id])
--REFERENCES [dbo].[TaskSubDetail2] ([TaskSubDetail2Id])
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail2Mapping] CHECK CONSTRAINT [FK_TaskTypeTaskSubDetail2Mapping_TaskSubDetail2_TaskSubDetail2Id]
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail2Mapping]  WITH CHECK ADD  CONSTRAINT [FK_TaskTypeTaskSubDetail2Mapping_TaskType_TaskTypeId] FOREIGN KEY([TaskTypeId])
--REFERENCES [dbo].[TaskType] ([TaskTypeId])
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail2Mapping] CHECK CONSTRAINT [FK_TaskTypeTaskSubDetail2Mapping_TaskType_TaskTypeId]
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail2Mapping]  WITH CHECK ADD  CONSTRAINT [FK_TaskTypeTaskSubDetail2Mapping_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TaskTypeTaskSubDetail2Mapping] CHECK CONSTRAINT [FK_TaskTypeTaskSubDetail2Mapping_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Department_DepartmentId] FOREIGN KEY([DepartmentId])
--REFERENCES [dbo].[Department] ([DepartmentId])
--GO
--ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Department_DepartmentId]
--GO
--ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_User_TeamHeadId] FOREIGN KEY([TeamHeadId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_User_TeamHeadId]
--GO
--ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_WeekDay_WeekDayId] FOREIGN KEY([WeekDayId])
--REFERENCES [dbo].[WeekDay] ([WeekDayId])
--GO
--ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_WeekDay_WeekDayId]
--GO
--ALTER TABLE [dbo].[TeamEmailTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_TeamEmailTypeMapping_Team_TeamId] FOREIGN KEY([TeamId])
--REFERENCES [dbo].[Team] ([TeamId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[TeamEmailTypeMapping] CHECK CONSTRAINT [FK_TeamEmailTypeMapping_Team_TeamId]
--GO
--ALTER TABLE [dbo].[TeamEmailTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_TeamEmailTypeMapping_TeamEmailType_TeamEmailTypeId] FOREIGN KEY([TeamEmailTypeId])
--REFERENCES [dbo].[TeamEmailType] ([TeamEmailTypeId])
--GO
--ALTER TABLE [dbo].[TeamEmailTypeMapping] CHECK CONSTRAINT [FK_TeamEmailTypeMapping_TeamEmailType_TeamEmailTypeId]
--GO
--ALTER TABLE [dbo].[TeamEmailTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_TeamEmailTypeMapping_WeekDay_WeekDayId] FOREIGN KEY([WeekDayId])
--REFERENCES [dbo].[WeekDay] ([WeekDayId])
--GO
--ALTER TABLE [dbo].[TeamEmailTypeMapping] CHECK CONSTRAINT [FK_TeamEmailTypeMapping_WeekDay_WeekDayId]
--GO
--ALTER TABLE [dbo].[TeamGoal]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoal_AppraisalCycle_AppraisalCycleId] FOREIGN KEY([AppraisalCycleId])
--REFERENCES [dbo].[AppraisalCycle] ([AppraisalCycleId])
--GO
--ALTER TABLE [dbo].[TeamGoal] CHECK CONSTRAINT [FK_TeamGoal_AppraisalCycle_AppraisalCycleId]
--GO
--ALTER TABLE [dbo].[TeamGoal]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoal_DateMaster_EndDateId] FOREIGN KEY([EndDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[TeamGoal] CHECK CONSTRAINT [FK_TeamGoal_DateMaster_EndDateId]
--GO
--ALTER TABLE [dbo].[TeamGoal]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoal_DateMaster_StartDateId] FOREIGN KEY([StartDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[TeamGoal] CHECK CONSTRAINT [FK_TeamGoal_DateMaster_StartDateId]
--GO
--ALTER TABLE [dbo].[TeamGoal]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoal_GoalCategory_GoalCategoryId] FOREIGN KEY([GoalCategoryId])
--REFERENCES [dbo].[GoalCategory] ([GoalCategoryId])
--GO
--ALTER TABLE [dbo].[TeamGoal] CHECK CONSTRAINT [FK_TeamGoal_GoalCategory_GoalCategoryId]
--GO
--ALTER TABLE [dbo].[TeamGoal]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoal_Team_TeamId] FOREIGN KEY([TeamId])
--REFERENCES [dbo].[Team] ([TeamId])
--GO
--ALTER TABLE [dbo].[TeamGoal] CHECK CONSTRAINT [FK_TeamGoal_Team_TeamId]
--GO
--ALTER TABLE [dbo].[TeamGoal]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoal_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TeamGoal] CHECK CONSTRAINT [FK_TeamGoal_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[TeamGoalComment]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoalComment_TeamGoal_TeamGoalId] FOREIGN KEY([TeamGoalId])
--REFERENCES [dbo].[TeamGoal] ([TeamGoalId])
--GO
--ALTER TABLE [dbo].[TeamGoalComment] CHECK CONSTRAINT [FK_TeamGoalComment_TeamGoal_TeamGoalId]
--GO
--ALTER TABLE [dbo].[TeamGoalHistory]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoalHistory_DateMaster_EndDateId] FOREIGN KEY([EndDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[TeamGoalHistory] CHECK CONSTRAINT [FK_TeamGoalHistory_DateMaster_EndDateId]
--GO
--ALTER TABLE [dbo].[TeamGoalHistory]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoalHistory_DateMaster_StartDateId] FOREIGN KEY([StartDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[TeamGoalHistory] CHECK CONSTRAINT [FK_TeamGoalHistory_DateMaster_StartDateId]
--GO
--ALTER TABLE [dbo].[TeamGoalHistory]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoalHistory_GoalCategory_GoalCategoryId] FOREIGN KEY([GoalCategoryId])
--REFERENCES [dbo].[GoalCategory] ([GoalCategoryId])
--GO
--ALTER TABLE [dbo].[TeamGoalHistory] CHECK CONSTRAINT [FK_TeamGoalHistory_GoalCategory_GoalCategoryId]
--GO
--ALTER TABLE [dbo].[TeamGoalHistory]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoalHistory_GoalStatus_GoalStatusId] FOREIGN KEY([GoalStatusId])
--REFERENCES [dbo].[GoalStatus] ([GoalStatusId])
--GO
--ALTER TABLE [dbo].[TeamGoalHistory] CHECK CONSTRAINT [FK_TeamGoalHistory_GoalStatus_GoalStatusId]
--GO
--ALTER TABLE [dbo].[TeamGoalHistory]  WITH CHECK ADD  CONSTRAINT [FK_TeamGoalHistory_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TeamGoalHistory] CHECK CONSTRAINT [FK_TeamGoalHistory_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[TempUserAddressDetail]  WITH CHECK ADD  CONSTRAINT [FK_TempUserAddressDetail_City_CityId] FOREIGN KEY([CityId])
--REFERENCES [dbo].[City] ([CityId])
--GO
--ALTER TABLE [dbo].[TempUserAddressDetail] CHECK CONSTRAINT [FK_TempUserAddressDetail_City_CityId]
--GO
--ALTER TABLE [dbo].[TempUserAddressDetail]  WITH CHECK ADD  CONSTRAINT [FK_TempUserAddressDetail_Country_CountryId] FOREIGN KEY([CountryId])
--REFERENCES [dbo].[Country] ([CountryId])
--GO
--ALTER TABLE [dbo].[TempUserAddressDetail] CHECK CONSTRAINT [FK_TempUserAddressDetail_Country_CountryId]
--GO
--ALTER TABLE [dbo].[TempUserAddressDetail]  WITH CHECK ADD  CONSTRAINT [FK_TempUserAddressDetail_State_StateId] FOREIGN KEY([StateId])
--REFERENCES [dbo].[State] ([StateId])
--GO
--ALTER TABLE [dbo].[TempUserAddressDetail] CHECK CONSTRAINT [FK_TempUserAddressDetail_State_StateId]
--GO
--ALTER TABLE [dbo].[TempUserAddressDetail]  WITH CHECK ADD  CONSTRAINT [FK_TempUserAddressDetail_TempUserRegistration_RegistrationId] FOREIGN KEY([RegistrationId])
--REFERENCES [dbo].[TempUserRegistration] ([RegistrationId])
--GO
--ALTER TABLE [dbo].[TempUserAddressDetail] CHECK CONSTRAINT [FK_TempUserAddressDetail_TempUserRegistration_RegistrationId]
--GO
--ALTER TABLE [dbo].[TempUserShift]  WITH CHECK ADD FOREIGN KEY([ShiftId])
--REFERENCES [dbo].[ShiftMaster] ([ShiftId])
--GO
--ALTER TABLE [dbo].[TempUserShift]  WITH CHECK ADD FOREIGN KEY([StatusId])
--REFERENCES [dbo].[OutingRequestStatus] ([StatusId])
--GO
--ALTER TABLE [dbo].[TempUserShift]  WITH CHECK ADD FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TempUserShiftDetail]  WITH CHECK ADD FOREIGN KEY([DateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[TempUserShiftDetail]  WITH CHECK ADD FOREIGN KEY([StatusId])
--REFERENCES [dbo].[OutingRequestStatus] ([StatusId])
--GO
--ALTER TABLE [dbo].[TempUserShiftDetail]  WITH CHECK ADD FOREIGN KEY([TempUserShiftId])
--REFERENCES [dbo].[TempUserShift] ([TempUserShiftId])
--GO
--ALTER TABLE [dbo].[TempUserShiftHistory]  WITH CHECK ADD FOREIGN KEY([StatusId])
--REFERENCES [dbo].[OutingRequestStatus] ([StatusId])
--GO
--ALTER TABLE [dbo].[TempUserShiftHistory]  WITH CHECK ADD FOREIGN KEY([TempUserShiftId])
--REFERENCES [dbo].[TempUserShift] ([TempUserShiftId])
--GO
--ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[TimesheetExcludedUser]  WITH CHECK ADD  CONSTRAINT [FK_TimesheetExcludedUser_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TimesheetExcludedUser] CHECK CONSTRAINT [FK_TimesheetExcludedUser_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[TimesheetExcludedUser]  WITH CHECK ADD  CONSTRAINT [FK_TimesheetExcludedUser_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TimesheetExcludedUser] CHECK CONSTRAINT [FK_TimesheetExcludedUser_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[TimesheetExcludedUser]  WITH CHECK ADD  CONSTRAINT [FK_TimesheetExcludedUser_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TimesheetExcludedUser] CHECK CONSTRAINT [FK_TimesheetExcludedUser_User_UserId]
--GO
--ALTER TABLE [dbo].[TimeSheetReportAccess]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetReportAccess_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TimeSheetReportAccess] CHECK CONSTRAINT [FK_TimeSheetReportAccess_CreatedBy]
--GO
--ALTER TABLE [dbo].[TimeSheetReportAccess]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetReportAccess_TeamId] FOREIGN KEY([TeamId])
--REFERENCES [dbo].[Team] ([TeamId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[TimeSheetReportAccess] CHECK CONSTRAINT [FK_TimeSheetReportAccess_TeamId]
--GO
--ALTER TABLE [dbo].[TimeSheetReportAccess]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetReportAccess_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TimeSheetReportAccess] CHECK CONSTRAINT [FK_TimeSheetReportAccess_UserId]
--GO
--ALTER TABLE [dbo].[TimeSheetTaskMapping]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetTaskMapping_LoggedTasks_TaskId] FOREIGN KEY([TaskId])
--REFERENCES [dbo].[LoggedTasks] ([TaskId])
--GO
--ALTER TABLE [dbo].[TimeSheetTaskMapping] CHECK CONSTRAINT [FK_TimeSheetTaskMapping_LoggedTasks_TaskId]
--GO
--ALTER TABLE [dbo].[TimeSheetTaskMapping]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetTaskMapping_TimeSheet_TimeSheetId] FOREIGN KEY([TimeSheetId])
--REFERENCES [dbo].[TimeSheet] ([TimeSheetId])
--GO
--ALTER TABLE [dbo].[TimeSheetTaskMapping] CHECK CONSTRAINT [FK_TimeSheetTaskMapping_TimeSheet_TimeSheetId]
--GO
--ALTER TABLE [dbo].[TournamentCategory]  WITH CHECK ADD  CONSTRAINT [FK_TournamentCategory_Tournament] FOREIGN KEY([TournamentId])
--REFERENCES [dbo].[Tournament] ([TournamentId])
--GO
--ALTER TABLE [dbo].[TournamentCategory] CHECK CONSTRAINT [FK_TournamentCategory_Tournament]
--GO
--ALTER TABLE [dbo].[TournamentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_TournamentSchedule_TournamentTeam_TournamentTeamId] FOREIGN KEY([TournamentTeamId])
--REFERENCES [dbo].[TournamentTeam] ([TournamentTeamId])
--GO
--ALTER TABLE [dbo].[TournamentSchedule] CHECK CONSTRAINT [FK_TournamentSchedule_TournamentTeam_TournamentTeamId]
--GO
--ALTER TABLE [dbo].[TournamentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_TournamentSchedule_TournamentTeam_TournamentVSTeamId] FOREIGN KEY([TournamentVSTeamId])
--REFERENCES [dbo].[TournamentTeam] ([TournamentTeamId])
--GO
--ALTER TABLE [dbo].[TournamentSchedule] CHECK CONSTRAINT [FK_TournamentSchedule_TournamentTeam_TournamentVSTeamId]
--GO
--ALTER TABLE [dbo].[TournamentScore]  WITH CHECK ADD  CONSTRAINT [FK_TournamentScore_TournamentSchedule] FOREIGN KEY([TournamentScheduleId])
--REFERENCES [dbo].[TournamentSchedule] ([TournamentScheduleId])
--GO
--ALTER TABLE [dbo].[TournamentScore] CHECK CONSTRAINT [FK_TournamentScore_TournamentSchedule]
--GO
--ALTER TABLE [dbo].[TournamentScore]  WITH CHECK ADD  CONSTRAINT [FK_TournamentScore_TournamentTeam_TournamentTeamId] FOREIGN KEY([TournamentTeamId])
--REFERENCES [dbo].[TournamentTeam] ([TournamentTeamId])
--GO
--ALTER TABLE [dbo].[TournamentScore] CHECK CONSTRAINT [FK_TournamentScore_TournamentTeam_TournamentTeamId]
--GO
--ALTER TABLE [dbo].[TournamentTeam]  WITH CHECK ADD  CONSTRAINT [FK_TournamentTeam_TournamentCategory] FOREIGN KEY([TournamentCategoryId])
--REFERENCES [dbo].[TournamentCategory] ([TournamentCategoryId])
--GO
--ALTER TABLE [dbo].[TournamentTeam] CHECK CONSTRAINT [FK_TournamentTeam_TournamentCategory]
--GO
--ALTER TABLE [dbo].[TrainingDetail]  WITH CHECK ADD FOREIGN KEY([ApproverId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TrainingDetail]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[TrainingDetail]  WITH CHECK ADD FOREIGN KEY([StatusId])
--REFERENCES [dbo].[TrainingStatus] ([StatusId])
--GO
--ALTER TABLE [dbo].[TrainingDetail]  WITH CHECK ADD FOREIGN KEY([TrainingId])
--REFERENCES [dbo].[Training] ([TrainingId])
--GO
--ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Location_LocationId] FOREIGN KEY([LocationId])
--REFERENCES [dbo].[Location] ([LocationId])
--GO
--ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Location_LocationId]
--GO
--ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([RoleId])
--REFERENCES [dbo].[Role] ([RoleId])
--GO
--ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_UserRole_User]
--GO
--ALTER TABLE [dbo].[UserAccessCard]  WITH CHECK ADD  CONSTRAINT [FK_UserAccessCard_AccessCard] FOREIGN KEY([AccessCardId])
--REFERENCES [dbo].[AccessCard] ([AccessCardId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[UserAccessCard] CHECK CONSTRAINT [FK_UserAccessCard_AccessCard]
--GO
--ALTER TABLE [dbo].[UserAccessCard]  WITH CHECK ADD  CONSTRAINT [FK_UserAccessCard_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[UserAccessCard] CHECK CONSTRAINT [FK_UserAccessCard_User]
--GO
--ALTER TABLE [dbo].[UserAchievement]  WITH CHECK ADD  CONSTRAINT [FK_UserAchievement_EmpAppraisalSetting_EmpAppraisalSettingId] FOREIGN KEY([EmpAppraisalSettingId])
--REFERENCES [dbo].[EmpAppraisalSetting] ([EmpAppraisalSettingId])
--GO
--ALTER TABLE [dbo].[UserAchievement] CHECK CONSTRAINT [FK_UserAchievement_EmpAppraisalSetting_EmpAppraisalSettingId]
--GO
--ALTER TABLE [dbo].[UserAchievement]  WITH CHECK ADD  CONSTRAINT [FK_UserAchievement_User_CreatedById] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserAchievement] CHECK CONSTRAINT [FK_UserAchievement_User_CreatedById]
--GO
--ALTER TABLE [dbo].[UserAchievementComment]  WITH CHECK ADD  CONSTRAINT [FK_UserAchievementComment_UserAchievement_UserAchievementId] FOREIGN KEY([UserAchievementId])
--REFERENCES [dbo].[UserAchievement] ([UserAchievementId])
--GO
--ALTER TABLE [dbo].[UserAchievementComment] CHECK CONSTRAINT [FK_UserAchievementComment_UserAchievement_UserAchievementId]
--GO
--ALTER TABLE [dbo].[UserAchievementForMidYear]  WITH CHECK ADD  CONSTRAINT [FK_UserAchievementForMidYear_AppraisalCycle_AppraisalCycleId] FOREIGN KEY([AppraisalCycleId])
--REFERENCES [dbo].[AppraisalCycle] ([AppraisalCycleId])
--GO
--ALTER TABLE [dbo].[UserAchievementForMidYear] CHECK CONSTRAINT [FK_UserAchievementForMidYear_AppraisalCycle_AppraisalCycleId]
--GO
--ALTER TABLE [dbo].[UserAchievementForMidYear]  WITH CHECK ADD  CONSTRAINT [FK_UserAchievementForMidYear_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserAchievementForMidYear] CHECK CONSTRAINT [FK_UserAchievementForMidYear_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[UserAchievementForMidYear]  WITH CHECK ADD  CONSTRAINT [FK_UserAchievementForMidYear_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserAchievementForMidYear] CHECK CONSTRAINT [FK_UserAchievementForMidYear_User_UserId]
--GO
--ALTER TABLE [dbo].[UserActivity]  WITH CHECK ADD  CONSTRAINT [FK_UserActivity_User] FOREIGN KEY([VisitedByUserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserActivity] CHECK CONSTRAINT [FK_UserActivity_User]
--GO
--ALTER TABLE [dbo].[UserAddressDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressDetail_City_CityId] FOREIGN KEY([CityId])
--REFERENCES [dbo].[City] ([CityId])
--GO
--ALTER TABLE [dbo].[UserAddressDetail] CHECK CONSTRAINT [FK_UserAddressDetail_City_CityId]
--GO
--ALTER TABLE [dbo].[UserAddressDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressDetail_Country_CountryId] FOREIGN KEY([CountryId])
--REFERENCES [dbo].[Country] ([CountryId])
--GO
--ALTER TABLE [dbo].[UserAddressDetail] CHECK CONSTRAINT [FK_UserAddressDetail_Country_CountryId]
--GO
--ALTER TABLE [dbo].[UserAddressDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressDetail_State_StateId] FOREIGN KEY([StateId])
--REFERENCES [dbo].[State] ([StateId])
--GO
--ALTER TABLE [dbo].[UserAddressDetail] CHECK CONSTRAINT [FK_UserAddressDetail_State_StateId]
--GO
--ALTER TABLE [dbo].[UserAddressDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressDetail_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserAddressDetail] CHECK CONSTRAINT [FK_UserAddressDetail_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[UserAddressDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressDetail_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserAddressDetail] CHECK CONSTRAINT [FK_UserAddressDetail_User_UserId]
--GO
--ALTER TABLE [dbo].[UserClientSideManagerAndProjectMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserClientSideManagerAndProjectMapping_ClientSideManagerMaster_ClientSideManagerId] FOREIGN KEY([ClientSideManagerId])
--REFERENCES [dbo].[ClientSideManagerMaster] ([ClientSideManagerId])
--GO
--ALTER TABLE [dbo].[UserClientSideManagerAndProjectMapping] CHECK CONSTRAINT [FK_UserClientSideManagerAndProjectMapping_ClientSideManagerMaster_ClientSideManagerId]
--GO
--ALTER TABLE [dbo].[UserClientSideManagerAndProjectMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserClientSideManagerAndProjectMapping_ProjectMaster_ProjectId] FOREIGN KEY([ProjectId])
--REFERENCES [dbo].[ProjectMaster] ([ProjectId])
--GO
--ALTER TABLE [dbo].[UserClientSideManagerAndProjectMapping] CHECK CONSTRAINT [FK_UserClientSideManagerAndProjectMapping_ProjectMaster_ProjectId]
--GO
--ALTER TABLE [dbo].[UserClientSideManagerAndProjectMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserClientSideManagerAndProjectMapping_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserClientSideManagerAndProjectMapping] CHECK CONSTRAINT [FK_UserClientSideManagerAndProjectMapping_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[UserClientSideManagerAndProjectMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserClientSideManagerAndProjectMapping_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserClientSideManagerAndProjectMapping] CHECK CONSTRAINT [FK_UserClientSideManagerAndProjectMapping_User_UserId]
--GO
--ALTER TABLE [dbo].[UserDefaulterHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserDefaulterHistory_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserDefaulterHistory] CHECK CONSTRAINT [FK_UserDefaulterHistory_CreatedBy]
--GO
--ALTER TABLE [dbo].[UserDefaulterHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserDefaulterHistory_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserDefaulterHistory] CHECK CONSTRAINT [FK_UserDefaulterHistory_User]
--GO
--ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [FK_Gender_UserDetail] FOREIGN KEY([GenderId])
--REFERENCES [dbo].[Gender] ([GenderId])
--GO
--ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [FK_Gender_UserDetail]
--GO
--ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaritalStatus_UserDetail] FOREIGN KEY([MaritalStatusId])
--REFERENCES [dbo].[MaritalStatus] ([MaritalStatusId])
--GO
--ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [FK_MaritalStatus_UserDetail]
--GO
--ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [FK_User_UserDetail] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [FK_User_UserDetail]
--GO
--ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserDetail_AppraisalCycle_AppraisalCycleId] FOREIGN KEY([AppraisalCycleId])
--REFERENCES [dbo].[AppraisalCycle] ([AppraisalCycleId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [FK_UserDetail_AppraisalCycle_AppraisalCycleId]
--GO
--ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserDetail_Designation] FOREIGN KEY([DesignationId])
--REFERENCES [dbo].[Designation] ([DesignationId])
--GO
--ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [FK_UserDetail_Designation]
--GO
--ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserDetail_User_ProjectManagerId] FOREIGN KEY([ProjectManagerId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [FK_UserDetail_User_ProjectManagerId]
--GO
--ALTER TABLE [dbo].[UserFamilyDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserFamilyDetail_Gender_GenderId] FOREIGN KEY([GenderId])
--REFERENCES [dbo].[Gender] ([GenderId])
--GO
--ALTER TABLE [dbo].[UserFamilyDetail] CHECK CONSTRAINT [FK_UserFamilyDetail_Gender_GenderId]
--GO
--ALTER TABLE [dbo].[UserFamilyDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserFamilyDetail_Occupation_OccupationId] FOREIGN KEY([OccupationId])
--REFERENCES [dbo].[Occupation] ([OccupationId])
--GO
--ALTER TABLE [dbo].[UserFamilyDetail] CHECK CONSTRAINT [FK_UserFamilyDetail_Occupation_OccupationId]
--GO
--ALTER TABLE [dbo].[UserFamilyDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserFamilyDetail_Relationship_RelationshipId] FOREIGN KEY([RelationshipId])
--REFERENCES [dbo].[Relationship] ([RelationshipId])
--GO
--ALTER TABLE [dbo].[UserFamilyDetail] CHECK CONSTRAINT [FK_UserFamilyDetail_Relationship_RelationshipId]
--GO
--ALTER TABLE [dbo].[UserFamilyDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserFamilyDetail_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserFamilyDetail] CHECK CONSTRAINT [FK_UserFamilyDetail_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[UserFamilyDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserFamilyDetail_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserFamilyDetail] CHECK CONSTRAINT [FK_UserFamilyDetail_User_UserId]
--GO
--ALTER TABLE [dbo].[UserFeedback]  WITH CHECK ADD  CONSTRAINT [FK_UserFeedback_User_AcknowledgedBy] FOREIGN KEY([AcknowledgedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserFeedback] CHECK CONSTRAINT [FK_UserFeedback_User_AcknowledgedBy]
--GO
--ALTER TABLE [dbo].[UserFeedback]  WITH CHECK ADD  CONSTRAINT [FK_UserFeedback_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserFeedback] CHECK CONSTRAINT [FK_UserFeedback_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[UserForm]  WITH CHECK ADD  CONSTRAINT [FK_UserForm_Form_FormId] FOREIGN KEY([FormId])
--REFERENCES [dbo].[Form] ([FormId])
--GO
--ALTER TABLE [dbo].[UserForm] CHECK CONSTRAINT [FK_UserForm_Form_FormId]
--GO
--ALTER TABLE [dbo].[UserForm]  WITH CHECK ADD  CONSTRAINT [FK_UserForm_User_CreatedById] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserForm] CHECK CONSTRAINT [FK_UserForm_User_CreatedById]
--GO
--ALTER TABLE [dbo].[UserForm]  WITH CHECK ADD  CONSTRAINT [FK_UserForm_User_ModifiedById] FOREIGN KEY([ModifiedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserForm] CHECK CONSTRAINT [FK_UserForm_User_ModifiedById]
--GO
--ALTER TABLE [dbo].[UserForm]  WITH CHECK ADD  CONSTRAINT [FK_UserForm_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserForm] CHECK CONSTRAINT [FK_UserForm_User_UserId]
--GO
--ALTER TABLE [dbo].[UserGoal]  WITH CHECK ADD  CONSTRAINT [FK_UserGoal_AppraisalCycle_AppraisalCycleId] FOREIGN KEY([AppraisalCycleId])
--REFERENCES [dbo].[AppraisalCycle] ([AppraisalCycleId])
--GO
--ALTER TABLE [dbo].[UserGoal] CHECK CONSTRAINT [FK_UserGoal_AppraisalCycle_AppraisalCycleId]
--GO
--ALTER TABLE [dbo].[UserGoal]  WITH CHECK ADD  CONSTRAINT [FK_UserGoal_DateMaster_EndDateId] FOREIGN KEY([EndDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[UserGoal] CHECK CONSTRAINT [FK_UserGoal_DateMaster_EndDateId]
--GO
--ALTER TABLE [dbo].[UserGoal]  WITH CHECK ADD  CONSTRAINT [FK_UserGoal_DateMaster_StartDateId] FOREIGN KEY([StartDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[UserGoal] CHECK CONSTRAINT [FK_UserGoal_DateMaster_StartDateId]
--GO
--ALTER TABLE [dbo].[UserGoal]  WITH CHECK ADD  CONSTRAINT [FK_UserGoal_GoalCategory_GoalCategoryId] FOREIGN KEY([GoalCategoryId])
--REFERENCES [dbo].[GoalCategory] ([GoalCategoryId])
--GO
--ALTER TABLE [dbo].[UserGoal] CHECK CONSTRAINT [FK_UserGoal_GoalCategory_GoalCategoryId]
--GO
--ALTER TABLE [dbo].[UserGoal]  WITH CHECK ADD  CONSTRAINT [FK_UserGoal_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserGoal] CHECK CONSTRAINT [FK_UserGoal_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[UserGoal]  WITH CHECK ADD  CONSTRAINT [FK_UserGoal_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserGoal] CHECK CONSTRAINT [FK_UserGoal_User_UserId]
--GO
--ALTER TABLE [dbo].[UserGoalComment]  WITH CHECK ADD  CONSTRAINT [FK_UserGoalComment_UserGoal_UserGoalId] FOREIGN KEY([UserGoalId])
--REFERENCES [dbo].[UserGoal] ([UserGoalId])
--GO
--ALTER TABLE [dbo].[UserGoalComment] CHECK CONSTRAINT [FK_UserGoalComment_UserGoal_UserGoalId]
--GO
--ALTER TABLE [dbo].[UserGoalHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserGoalHistory_DateMaster_EndDateId] FOREIGN KEY([EndDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[UserGoalHistory] CHECK CONSTRAINT [FK_UserGoalHistory_DateMaster_EndDateId]
--GO
--ALTER TABLE [dbo].[UserGoalHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserGoalHistory_DateMaster_StartDateId] FOREIGN KEY([StartDateId])
--REFERENCES [dbo].[DateMaster] ([DateId])
--GO
--ALTER TABLE [dbo].[UserGoalHistory] CHECK CONSTRAINT [FK_UserGoalHistory_DateMaster_StartDateId]
--GO
--ALTER TABLE [dbo].[UserGoalHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserGoalHistory_GoalCategory_GoalCategoryId] FOREIGN KEY([GoalCategoryId])
--REFERENCES [dbo].[GoalCategory] ([GoalCategoryId])
--GO
--ALTER TABLE [dbo].[UserGoalHistory] CHECK CONSTRAINT [FK_UserGoalHistory_GoalCategory_GoalCategoryId]
--GO
--ALTER TABLE [dbo].[UserGoalHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserGoalHistory_GoalStatus_GoalStatusId] FOREIGN KEY([GoalStatusId])
--REFERENCES [dbo].[GoalStatus] ([GoalStatusId])
--GO
--ALTER TABLE [dbo].[UserGoalHistory] CHECK CONSTRAINT [FK_UserGoalHistory_GoalStatus_GoalStatusId]
--GO
--ALTER TABLE [dbo].[UserGoalHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserGoalHistory_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserGoalHistory] CHECK CONSTRAINT [FK_UserGoalHistory_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[UserHierarchy]  WITH CHECK ADD  CONSTRAINT [FK_UserHierarchy_User_CreatedById] FOREIGN KEY([CreatedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserHierarchy] CHECK CONSTRAINT [FK_UserHierarchy_User_CreatedById]
--GO
--ALTER TABLE [dbo].[UserHierarchy]  WITH CHECK ADD  CONSTRAINT [FK_UserHierarchy_User_ModifiedById] FOREIGN KEY([ModifiedById])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserHierarchy] CHECK CONSTRAINT [FK_UserHierarchy_User_ModifiedById]
--GO
--ALTER TABLE [dbo].[UserLocationHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserLocationHistory_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserLocationHistory] CHECK CONSTRAINT [FK_UserLocationHistory_User_UserId]
--GO
--ALTER TABLE [dbo].[UserPromotionHistory]  WITH CHECK ADD FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UsersHealthInsurance]  WITH CHECK ADD  CONSTRAINT [FK_UsersHealthInsurance_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UsersHealthInsurance] CHECK CONSTRAINT [FK_UsersHealthInsurance_User_UserId]
--GO
--ALTER TABLE [dbo].[UserShiftMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserShiftMapping_Shift_ShiftId] FOREIGN KEY([ShiftId])
--REFERENCES [dbo].[ShiftMaster] ([ShiftId])
--GO
--ALTER TABLE [dbo].[UserShiftMapping] CHECK CONSTRAINT [FK_UserShiftMapping_Shift_ShiftId]
--GO
--ALTER TABLE [dbo].[UserShiftMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserShiftMapping_User_CreatedBy] FOREIGN KEY([CreatedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserShiftMapping] CHECK CONSTRAINT [FK_UserShiftMapping_User_CreatedBy]
--GO
--ALTER TABLE [dbo].[UserShiftMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserShiftMapping_User_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserShiftMapping] CHECK CONSTRAINT [FK_UserShiftMapping_User_LastModifiedBy]
--GO
--ALTER TABLE [dbo].[UserShiftMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserShiftMapping_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UserShiftMapping] CHECK CONSTRAINT [FK_UserShiftMapping_User_UserId]
--GO
--ALTER TABLE [dbo].[UserSkill]  WITH CHECK ADD  CONSTRAINT [FK_UserSkill_Skill] FOREIGN KEY([SkillId])
--REFERENCES [dbo].[Skill] ([SkillId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[UserSkill] CHECK CONSTRAINT [FK_UserSkill_Skill]
--GO
--ALTER TABLE [dbo].[UserSkill]  WITH CHECK ADD  CONSTRAINT [FK_UserSkill_SkillLevel] FOREIGN KEY([SkillLevelId])
--REFERENCES [dbo].[SkillLevel] ([SkillLevelId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[UserSkill] CHECK CONSTRAINT [FK_UserSkill_SkillLevel]
--GO
--ALTER TABLE [dbo].[UserSkill]  WITH CHECK ADD  CONSTRAINT [FK_UserSkill_SkillType_SkillTypeId] FOREIGN KEY([SkillTypeId])
--REFERENCES [dbo].[SkillType] ([SkillTypeId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[UserSkill] CHECK CONSTRAINT [FK_UserSkill_SkillType_SkillTypeId]
--GO
--ALTER TABLE [dbo].[UserSkill]  WITH CHECK ADD  CONSTRAINT [FK_UserSkill_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[UserSkill] CHECK CONSTRAINT [FK_UserSkill_User]
--GO
--ALTER TABLE [dbo].[UsersOnshoreMgrMapping]  WITH CHECK ADD  CONSTRAINT [FK_UsersOnshoreMgrMapping_OnshoreManager_OnshoreMgrId] FOREIGN KEY([OnshoreMgrId])
--REFERENCES [dbo].[OnshoreManager] ([OnshoreMgrId])
--GO
--ALTER TABLE [dbo].[UsersOnshoreMgrMapping] CHECK CONSTRAINT [FK_UsersOnshoreMgrMapping_OnshoreManager_OnshoreMgrId]
--GO
--ALTER TABLE [dbo].[UsersOnshoreMgrMapping]  WITH CHECK ADD  CONSTRAINT [FK_UsersOnshoreMgrMapping_User_UserId] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UsersOnshoreMgrMapping] CHECK CONSTRAINT [FK_UsersOnshoreMgrMapping_User_UserId]
--GO
--ALTER TABLE [dbo].[UsersToken]  WITH CHECK ADD  CONSTRAINT [FK_UsersToken_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[UsersToken] CHECK CONSTRAINT [FK_UsersToken_User]
--GO
--ALTER TABLE [dbo].[UserTeamMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserTeamMapping_Team] FOREIGN KEY([TeamId])
--REFERENCES [dbo].[Team] ([TeamId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[UserTeamMapping] CHECK CONSTRAINT [FK_UserTeamMapping_Team]
--GO
--ALTER TABLE [dbo].[UserTeamMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserTeamMapping_TeamRole] FOREIGN KEY([TeamRoleId])
--REFERENCES [dbo].[TeamRole] ([TeamRoleId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[UserTeamMapping] CHECK CONSTRAINT [FK_UserTeamMapping_TeamRole]
--GO
--ALTER TABLE [dbo].[UserTeamMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserTeamMapping_User] FOREIGN KEY([UserId])
--REFERENCES [dbo].[User] ([UserId])
--ON DELETE CASCADE
--GO
--ALTER TABLE [dbo].[UserTeamMapping] CHECK CONSTRAINT [FK_UserTeamMapping_User]
--GO
--ALTER TABLE [dbo].[VehicleDetails]  WITH CHECK ADD  CONSTRAINT [FK_VehicleDetails_Location_LocationId] FOREIGN KEY([LocationId])
--REFERENCES [dbo].[Location] ([LocationId])
--GO
--ALTER TABLE [dbo].[VehicleDetails] CHECK CONSTRAINT [FK_VehicleDetails_Location_LocationId]
--GO
--ALTER TABLE [dbo].[Vertical]  WITH CHECK ADD  CONSTRAINT [FK_Vertical_Domain_DomainId] FOREIGN KEY([DomainId])
--REFERENCES [dbo].[Domain] ([DomainId])
--GO
--ALTER TABLE [dbo].[Vertical] CHECK CONSTRAINT [FK_Vertical_Domain_DomainId]
--GO
--ALTER TABLE [dbo].[Vertical]  WITH CHECK ADD  CONSTRAINT [FK_Vertical_User_VerticalHeadId] FOREIGN KEY([VerticalHeadId])
--REFERENCES [dbo].[User] ([UserId])
--GO
--ALTER TABLE [dbo].[Vertical] CHECK CONSTRAINT [FK_Vertical_User_VerticalHeadId]
--GO
