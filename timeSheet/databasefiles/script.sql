USE [master]
GO
/****** Object:  Database [timesheet]    Script Date: 6/26/2015 12:26:25 AM ******/
CREATE DATABASE [timesheet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'timesheet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HM\MSSQL\DATA\timesheet.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'timesheet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HM\MSSQL\DATA\timesheet_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [timesheet] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [timesheet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [timesheet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [timesheet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [timesheet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [timesheet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [timesheet] SET ARITHABORT OFF 
GO
ALTER DATABASE [timesheet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [timesheet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [timesheet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [timesheet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [timesheet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [timesheet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [timesheet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [timesheet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [timesheet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [timesheet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [timesheet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [timesheet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [timesheet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [timesheet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [timesheet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [timesheet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [timesheet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [timesheet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [timesheet] SET  MULTI_USER 
GO
ALTER DATABASE [timesheet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [timesheet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [timesheet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [timesheet] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [timesheet] SET DELAYED_DURABILITY = DISABLED 
GO
USE [timesheet]
GO
/****** Object:  Table [dbo].[Calender]    Script Date: 6/26/2015 12:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calender](
	[CalenderID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CalenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Departme__B2079BCD3290CF19] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Holiday]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday](
	[HolidayID] [int] IDENTITY(1,1) NOT NULL,
	[CalenderID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HolidayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [text] NOT NULL,
	[StatusCode] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK__Project__761ABED054397343] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectTask]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTask](
	[ProjectTaskID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[TemplateTaskID] [int] NOT NULL,
	[TaskName] [text] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK__ProjectT__71C01D648E94A8AB] PRIMARY KEY CLUSTERED 
(
	[ProjectTaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectTemplate]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTemplate](
	[ProjectTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTemplateName] [text] NOT NULL,
 CONSTRAINT [PK__ProjectT__670BEBE3D1FB2D52] PRIMARY KEY CLUSTERED 
(
	[ProjectTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleCode] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaskRole]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskRole](
	[TaskRoleID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[TemplateTaskID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TemplateTask]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemplateTask](
	[TemplateTaskID] [int] NOT NULL,
	[ProjectTemplateID] [int] NOT NULL,
	[TaskName] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TemplateTaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProject]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProject](
	[UserProjectID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](255) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[StatusCode] [int] NOT NULL,
 CONSTRAINT [PK__UserProj__5F7DD4B7FD89940B] PRIMARY KEY CLUSTERED 
(
	[UserProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](255) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK__UserRole__3D978A5536FA11F7] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](255) NOT NULL,
	[UserPassword] [nvarchar](255) NOT NULL,
	[DepartmentID] [int] NULL,
	[UserTypeID] [int] NULL,
 CONSTRAINT [PK__Users__1788CCACDCD9BD11] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTimesheet]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTimesheet](
	[UserTimesheetID] [int] IDENTITY(1,1) NOT NULL,
	[UserProjectID] [int] NOT NULL,
	[ProjectTaskID] [int] NULL,
	[Days] [date] NOT NULL,
	[Hours] [decimal](4, 2) NOT NULL,
	[TaskDescription] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK__UserTime__8CA1E1FB8CD402AA] PRIMARY KEY CLUSTERED 
(
	[UserTimesheetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeID] [int] NOT NULL,
	[UserTypeDesc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Holiday]  WITH CHECK ADD  CONSTRAINT [FK_Holiday_Calender] FOREIGN KEY([CalenderID])
REFERENCES [dbo].[Calender] ([CalenderID])
GO
ALTER TABLE [dbo].[Holiday] CHECK CONSTRAINT [FK_Holiday_Calender]
GO
ALTER TABLE [dbo].[ProjectTask]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTask_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[ProjectTask] CHECK CONSTRAINT [FK_ProjectTask_Project]
GO
ALTER TABLE [dbo].[ProjectTask]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTask_TemplateTask] FOREIGN KEY([TemplateTaskID])
REFERENCES [dbo].[TemplateTask] ([TemplateTaskID])
GO
ALTER TABLE [dbo].[ProjectTask] CHECK CONSTRAINT [FK_ProjectTask_TemplateTask]
GO
ALTER TABLE [dbo].[TaskRole]  WITH CHECK ADD  CONSTRAINT [FK_TaskRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[TaskRole] CHECK CONSTRAINT [FK_TaskRole_Role]
GO
ALTER TABLE [dbo].[TaskRole]  WITH CHECK ADD  CONSTRAINT [FK_TaskRole_TemplateTask] FOREIGN KEY([TemplateTaskID])
REFERENCES [dbo].[TemplateTask] ([TemplateTaskID])
GO
ALTER TABLE [dbo].[TaskRole] CHECK CONSTRAINT [FK_TaskRole_TemplateTask]
GO
ALTER TABLE [dbo].[TemplateTask]  WITH CHECK ADD  CONSTRAINT [FK_TemplateTask_ProjectTemplate] FOREIGN KEY([ProjectTemplateID])
REFERENCES [dbo].[ProjectTemplate] ([ProjectTemplateID])
GO
ALTER TABLE [dbo].[TemplateTask] CHECK CONSTRAINT [FK_TemplateTask_ProjectTemplate]
GO
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD  CONSTRAINT [FK_UserProject_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[UserProject] CHECK CONSTRAINT [FK_UserProject_Project]
GO
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD  CONSTRAINT [FK_UserProject_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserProject] CHECK CONSTRAINT [FK_UserProject_Users]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Department]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypes] ([UserTypeID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes]
GO
ALTER TABLE [dbo].[UserTimesheet]  WITH CHECK ADD  CONSTRAINT [FK_UserTimesheet_ProjectTask] FOREIGN KEY([ProjectTaskID])
REFERENCES [dbo].[ProjectTask] ([ProjectTaskID])
GO
ALTER TABLE [dbo].[UserTimesheet] CHECK CONSTRAINT [FK_UserTimesheet_ProjectTask]
GO
ALTER TABLE [dbo].[UserTimesheet]  WITH CHECK ADD  CONSTRAINT [FK_UserTimesheet_UserProject] FOREIGN KEY([UserProjectID])
REFERENCES [dbo].[UserProject] ([UserProjectID])
GO
ALTER TABLE [dbo].[UserTimesheet] CHECK CONSTRAINT [FK_UserTimesheet_UserProject]
GO
/****** Object:  StoredProcedure [dbo].[AddUserRoles]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddUserRoles]
	@userid nvarchar(255),
	@roleid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO UserRole(UserID,RoleID) VALUES(@userid,@roleid)
END

GO
/****** Object:  StoredProcedure [dbo].[FetchProjectInfo]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchProjectInfo]
	-- Add the parameters for the stored procedure here
	@projectid INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT StartDate,EndDate,StatusCode FROM Project WHERE ProjectID = @projectid
END

GO
/****** Object:  StoredProcedure [dbo].[FetchProjects]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchProjects] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ProjectID,ProjectName FROM Project
END

GO
/****** Object:  StoredProcedure [dbo].[FetchRoles]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchRoles] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Role
END

GO
/****** Object:  StoredProcedure [dbo].[FetchUsers]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchUsers]
	
AS
BEGIN
	select UserID from Users where UserTypeID != 1
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllProjects]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProjects]
	
AS
BEGIN
	SELECT * FROM Project
END

GO
/****** Object:  StoredProcedure [dbo].[GetResources]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetResources]
	@projectid INT
AS
BEGIN
	select up.UserID,ut.Days,ut.Hours,ut.TaskDescription from Project p
INNER JOIN UserProject up ON up.ProjectID=p.ProjectID
INNER JOIN UserTimesheet ut ON ut.UserProjectID = up.UserProjectID
 where p.ProjectID = @projectid ORDER BY ut.Days
END

GO
/****** Object:  StoredProcedure [dbo].[GetTimesheet]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTimesheet]
@userid nvarchar(255),
@projectid int
AS
BEGIN
	select ut.Days AS Days,ut.Hours AS Hours,ut.TaskDescription AS TaskDescription from UserTimesheet ut
INNER JOIN UserProject up ON up.UserProjectID=ut.UserProjectID
INNER JOIN Project P ON P.ProjectID=up.ProjectID
where UserID = @userid AND P.ProjectID=@projectid ORDER BY ut.UserTimesheetID DESC
END


GO
/****** Object:  StoredProcedure [dbo].[GetUserProjects]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserProjects]
	@userid nvarchar(255)
AS
BEGIN
	Select up.UserProjectID AS UserProjectID,up.ProjectID AS ProjectID,p.ProjectName AS ProjectName from UserProject up 
INNER JOIN Project p ON p.ProjectID = up.ProjectID
where UserID = @userid
END

GO
/****** Object:  StoredProcedure [dbo].[Logedhours]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Logedhours]
	@userprojectid INT,
	@day date,
	@hour decimal(4,2),
	@desc nvarchar(1000)
AS
BEGIN
DECLARE @totalhours decimal
	
 set @totalhours = (select SUM(Hours) from UserTimesheet where Days = @day)
		
	IF (@totalhours <= 8 AND @hour <=8) OR (@totalhours IS NULL)
	   INSERT INTO UserTimesheet (UserProjectID,Days,Hours,TaskDescription) VALUES(@userprojectid,@day,@hour,@desc)
END

GO
/****** Object:  StoredProcedure [dbo].[NewProject]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NewProject] 
	@projname text,
	@startdate date,
	@enddate date,
	@tempname text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 INSERT INTO Project (ProjectName,StatusCode,StartDate,EndDate) VALUES(@projname,1,@startdate,@enddate)
 INSERT INTO ProjectTemplate (ProjectTemplateName) values(@tempname)
END

GO
/****** Object:  StoredProcedure [dbo].[NewUser]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NewUser]
	@Userid NVARCHAR(255),
	@Pass NVARCHAR(255)
	
AS
BEGIN
 DECLARE @temp NVARCHAR(255)
	SET @temp = (SELECT UserID FROM Users where UserID = @Userid)

	IF @temp IS NULL
		INSERT INTO Users (UserID,UserPassword,UserTypeID) VALUES(@Userid,@Pass,2)

END

GO
/****** Object:  StoredProcedure [dbo].[ProjectAssignment]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProjectAssignment]
	@projectid INT,
	@userid nvarchar(255),
	@startdate date,
	@enddate date,
	@statuscode INT
AS
BEGIN
	DECLARE @temp INT
	
	SET @temp = (select @projectid from UserProject where ProjectID=@projectid AND UserID = @userid)

	IF @temp IS NULL
		INSERT INTO UserProject (ProjectID,UserID,StartDate,EndDate,StatusCode) VALUES (@projectid,@userid,@startdate,@enddate,@statuscode)
END

GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 6/26/2015 12:26:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserLogin] 
	@userid nvarchar(255),
	@password nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID,UserTypeID,DepartmentID FROM Users WHERE (UserID =@userid AND UserPassword=@password)
END

GO
USE [master]
GO
ALTER DATABASE [timesheet] SET  READ_WRITE 
GO
