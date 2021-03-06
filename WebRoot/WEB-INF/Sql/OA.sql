if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_emexcellence_department]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[emexcellence] DROP CONSTRAINT FK_emexcellence_department
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_eminfo_department]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[eminfo] DROP CONSTRAINT FK_eminfo_department
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_affice_eminfo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[affice] DROP CONSTRAINT FK_affice_eminfo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_bumf_eminfo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[bumf] DROP CONSTRAINT FK_bumf_eminfo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_bumf_eminfo1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[bumf] DROP CONSTRAINT FK_bumf_eminfo1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_emexcellence_eminfo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[emexcellence] DROP CONSTRAINT FK_emexcellence_eminfo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_emr_eminfo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[emr] DROP CONSTRAINT FK_emr_eminfo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_info_eminfo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[info] DROP CONSTRAINT FK_info_eminfo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_info_eminfo1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[info] DROP CONSTRAINT FK_info_eminfo1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_sign_eminfo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[sign] DROP CONSTRAINT FK_sign_eminfo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_sysr_eminfo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[sysr] DROP CONSTRAINT FK_sysr_eminfo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_topic_eminfo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[topic] DROP CONSTRAINT FK_topic_eminfo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_eminfo_emstate]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[eminfo] DROP CONSTRAINT FK_eminfo_emstate
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_eminfo_job]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[eminfo] DROP CONSTRAINT FK_eminfo_job
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_sign_signstate]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[sign] DROP CONSTRAINT FK_sign_signstate
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_retopic_topic]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[retopic] DROP CONSTRAINT FK_retopic_topic
GO

/****** Object:  Table [dbo].[affice]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[affice]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[affice]
GO

/****** Object:  Table [dbo].[bumf]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bumf]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bumf]
GO

/****** Object:  Table [dbo].[department]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[department]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[department]
GO

/****** Object:  Table [dbo].[emexcellence]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[emexcellence]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[emexcellence]
GO

/****** Object:  Table [dbo].[eminfo]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[eminfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[eminfo]
GO

/****** Object:  Table [dbo].[emr]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[emr]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[emr]
GO

/****** Object:  Table [dbo].[emstate]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[emstate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[emstate]
GO

/****** Object:  Table [dbo].[info]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[info]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[info]
GO

/****** Object:  Table [dbo].[job]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[job]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[job]
GO

/****** Object:  Table [dbo].[level]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[level]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[level]
GO

/****** Object:  Table [dbo].[password]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[password]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[password]
GO

/****** Object:  Table [dbo].[retopic]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[retopic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[retopic]
GO

/****** Object:  Table [dbo].[sign]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sign]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sign]
GO

/****** Object:  Table [dbo].[signstate]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[signstate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[signstate]
GO

/****** Object:  Table [dbo].[sysr]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysr]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysr]
GO

/****** Object:  Table [dbo].[topic]    Script Date: 2004-11-04 16:45:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[topic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[topic]
GO

/****** Object:  Table [dbo].[affice]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[affice] (
	[afficeid] [int] IDENTITY (1, 1) NOT NULL ,
	[title] [varchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[time] [datetime] NOT NULL ,
	[employeeid] [int] NOT NULL ,
	[content] [text] COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[bumf]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[bumf] (
	[bumfid] [int] IDENTITY (1, 1) NOT NULL ,
	[sendter] [int] NOT NULL ,
	[accepter] [int] NOT NULL ,
	[title] [varchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[time] [datetime] NOT NULL ,
	[content] [text] COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[affix] [varchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[examine] [bit] NOT NULL ,
	[sign] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[department]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[department] (
	[departmentid] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[explain] [text] COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[emexcellence]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[emexcellence] (
	[excellenceid] [int] IDENTITY (1, 1) NOT NULL ,
	[employeeid] [int] NOT NULL ,
	[time] [datetime] NOT NULL ,
	[levelid] [int] NOT NULL ,
	[departmentid] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[eminfo]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[eminfo] (
	[employeeid] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[sex] [bit] NOT NULL ,
	[birthday] [datetime] NOT NULL ,
	[learn] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[post] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[departmentid] [int] NOT NULL ,
	[jobid] [int] NOT NULL ,
	[tel] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[addr] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[stateid] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[emr]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[emr] (
	[recordedid] [int] IDENTITY (1, 1) NOT NULL ,
	[time] [datetime] NOT NULL ,
	[work] [varchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[employeeid] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[emstate]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[emstate] (
	[stateid] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[explain] [text] COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[info]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[info] (
	[infoid] [int] IDENTITY (1, 1) NOT NULL ,
	[title] [varchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[time] [datetime] NOT NULL ,
	[sendter] [int] NOT NULL ,
	[accepter] [int] NOT NULL ,
	[content] [text] COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[new] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[job]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[job] (
	[jobid] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[explain] [text] COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[level]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[level] (
	[levelid] [int] IDENTITY (1, 1) NOT NULL ,
	[level] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[explain] [text] COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[password]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[password] (
	[employeeid] [int] NOT NULL ,
	[password] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[time] [datetime] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[retopic]    Script Date: 2004-11-04 16:45:59 ******/
CREATE TABLE [dbo].[retopic] (
	[ritopicid] [int] IDENTITY (1, 1) NOT NULL ,
	[tipicic] [int] NOT NULL ,
	[time] [datetime] NOT NULL ,
	[employeeid] [int] NOT NULL ,
	[content] [text] COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sign]    Script Date: 2004-11-04 16:46:00 ******/
CREATE TABLE [dbo].[sign] (
	[signid] [int] IDENTITY (1, 1) NOT NULL ,
	[time] [datetime] NOT NULL ,
	[employeeid] [int] NOT NULL ,
	[late] [bit] NOT NULL ,
	[quit] [bit] NOT NULL ,
	[leave] [bit] NOT NULL ,
	[work] [bit] NOT NULL ,
	[signstateid] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[signstate]    Script Date: 2004-11-04 16:46:00 ******/
CREATE TABLE [dbo].[signstate] (
	[signstateid] [int] NOT NULL ,
	[describestate] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[time] [datetime] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysr]    Script Date: 2004-11-04 16:46:00 ******/
CREATE TABLE [dbo].[sysr] (
	[recordedid] [int] IDENTITY (1, 1) NOT NULL ,
	[time] [datetime] NOT NULL ,
	[work] [varchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[employeeid] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[topic]    Script Date: 2004-11-04 16:46:00 ******/
CREATE TABLE [dbo].[topic] (
	[topiccid] [int] IDENTITY (1, 1) NOT NULL ,
	[title] [varchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[time] [datetime] NOT NULL ,
	[employeeid] [int] NOT NULL ,
	[content] [text] COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[affice] WITH NOCHECK ADD 
	CONSTRAINT [PK_affice] PRIMARY KEY  CLUSTERED 
	(
		[afficeid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[bumf] WITH NOCHECK ADD 
	CONSTRAINT [PK_bumf] PRIMARY KEY  CLUSTERED 
	(
		[bumfid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[department] WITH NOCHECK ADD 
	CONSTRAINT [PK_department] PRIMARY KEY  CLUSTERED 
	(
		[departmentid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[emexcellence] WITH NOCHECK ADD 
	CONSTRAINT [DF_emexcellence_levelid] DEFAULT (1) FOR [levelid],
	CONSTRAINT [PK_emexcellence] PRIMARY KEY  CLUSTERED 
	(
		[excellenceid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[eminfo] WITH NOCHECK ADD 
	CONSTRAINT [PK_eminfo] PRIMARY KEY  CLUSTERED 
	(
		[employeeid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[emr] WITH NOCHECK ADD 
	CONSTRAINT [PK_employeeid] PRIMARY KEY  CLUSTERED 
	(
		[recordedid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[emstate] WITH NOCHECK ADD 
	CONSTRAINT [PK_emstate] PRIMARY KEY  CLUSTERED 
	(
		[stateid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[info] WITH NOCHECK ADD 
	CONSTRAINT [DF_info_new] DEFAULT (0) FOR [new],
	CONSTRAINT [PK_info] PRIMARY KEY  CLUSTERED 
	(
		[infoid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[job] WITH NOCHECK ADD 
	CONSTRAINT [PK_job] PRIMARY KEY  CLUSTERED 
	(
		[jobid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[level] WITH NOCHECK ADD 
	CONSTRAINT [PK_level] PRIMARY KEY  CLUSTERED 
	(
		[levelid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[password] WITH NOCHECK ADD 
	CONSTRAINT [PK_password] PRIMARY KEY  CLUSTERED 
	(
		[employeeid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[retopic] WITH NOCHECK ADD 
	CONSTRAINT [PK_retopic] PRIMARY KEY  CLUSTERED 
	(
		[ritopicid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sign] WITH NOCHECK ADD 
	CONSTRAINT [DF_sign_late] DEFAULT (0) FOR [late],
	CONSTRAINT [DF_sign_quit] DEFAULT (0) FOR [quit],
	CONSTRAINT [DF_sign_leave] DEFAULT (0) FOR [leave],
	CONSTRAINT [DF_sign_work] DEFAULT (1) FOR [work],
	CONSTRAINT [PK_sign] PRIMARY KEY  CLUSTERED 
	(
		[signid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[signstate] WITH NOCHECK ADD 
	CONSTRAINT [PK_signstate] PRIMARY KEY  CLUSTERED 
	(
		[signstateid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysr] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysr] PRIMARY KEY  CLUSTERED 
	(
		[recordedid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[topic] WITH NOCHECK ADD 
	CONSTRAINT [PK_topic] PRIMARY KEY  CLUSTERED 
	(
		[topiccid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[affice] ADD 
	CONSTRAINT [FK_affice_eminfo] FOREIGN KEY 
	(
		[employeeid]
	) REFERENCES [dbo].[eminfo] (
		[employeeid]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[bumf] ADD 
	CONSTRAINT [FK_bumf_eminfo] FOREIGN KEY 
	(
		[sendter]
	) REFERENCES [dbo].[eminfo] (
		[employeeid]
	),
	CONSTRAINT [FK_bumf_eminfo1] FOREIGN KEY 
	(
		[accepter]
	) REFERENCES [dbo].[eminfo] (
		[employeeid]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[emexcellence] ADD 
	CONSTRAINT [FK_emexcellence_department] FOREIGN KEY 
	(
		[departmentid]
	) REFERENCES [dbo].[department] (
		[departmentid]
	) ON UPDATE CASCADE ,
	CONSTRAINT [FK_emexcellence_eminfo] FOREIGN KEY 
	(
		[employeeid]
	) REFERENCES [dbo].[eminfo] (
		[employeeid]
	)
GO

ALTER TABLE [dbo].[eminfo] ADD 
	CONSTRAINT [FK_eminfo_department] FOREIGN KEY 
	(
		[departmentid]
	) REFERENCES [dbo].[department] (
		[departmentid]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_eminfo_emstate] FOREIGN KEY 
	(
		[stateid]
	) REFERENCES [dbo].[emstate] (
		[stateid]
	) ON UPDATE CASCADE ,
	CONSTRAINT [FK_eminfo_job] FOREIGN KEY 
	(
		[jobid]
	) REFERENCES [dbo].[job] (
		[jobid]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[emr] ADD 
	CONSTRAINT [FK_emr_eminfo] FOREIGN KEY 
	(
		[employeeid]
	) REFERENCES [dbo].[eminfo] (
		[employeeid]
	)
GO

ALTER TABLE [dbo].[info] ADD 
	CONSTRAINT [FK_info_eminfo] FOREIGN KEY 
	(
		[sendter]
	) REFERENCES [dbo].[eminfo] (
		[employeeid]
	),
	CONSTRAINT [FK_info_eminfo1] FOREIGN KEY 
	(
		[accepter]
	) REFERENCES [dbo].[eminfo] (
		[employeeid]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[retopic] ADD 
	CONSTRAINT [FK_retopic_topic] FOREIGN KEY 
	(
		[tipicic]
	) REFERENCES [dbo].[topic] (
		[topiccid]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[sign] ADD 
	CONSTRAINT [FK_sign_eminfo] FOREIGN KEY 
	(
		[employeeid]
	) REFERENCES [dbo].[eminfo] (
		[employeeid]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_sign_signstate] FOREIGN KEY 
	(
		[signstateid]
	) REFERENCES [dbo].[signstate] (
		[signstateid]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[sysr] ADD 
	CONSTRAINT [FK_sysr_eminfo] FOREIGN KEY 
	(
		[employeeid]
	) REFERENCES [dbo].[eminfo] (
		[employeeid]
	)
GO

ALTER TABLE [dbo].[topic] ADD 
	CONSTRAINT [FK_topic_eminfo] FOREIGN KEY 
	(
		[employeeid]
	) REFERENCES [dbo].[eminfo] (
		[employeeid]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

