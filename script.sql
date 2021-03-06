USE [master]
GO
/****** Object:  Database [TourManager]    Script Date: 12/11/2016 2:15:17 AM ******/
CREATE DATABASE [TourManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TourManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TourManager.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TourManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TourManager_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TourManager] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TourManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TourManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TourManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TourManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TourManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TourManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [TourManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TourManager] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TourManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TourManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TourManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TourManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TourManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TourManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TourManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TourManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TourManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TourManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TourManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TourManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TourManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TourManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TourManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TourManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TourManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TourManager] SET  MULTI_USER 
GO
ALTER DATABASE [TourManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TourManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TourManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TourManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TourManager]
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerById]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomerById]
	@Id varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Customer
	WHERE id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[GetCustomerList]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomerList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Customer
END

GO
/****** Object:  StoredProcedure [dbo].[GetDestinationById]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDestinationById]
	@Id varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Destination WHERE id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[GetDestinationList]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDestinationList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Destination
END

GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeById]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmployeeById]
	@Id varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Employee
	INNER JOIN EmployeeRole ON Employee.role = EmployeeRole.id
	INNER JOIN Status ON Employee.status = Employee.status
	WHERE Employee.id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeByTourGroupId]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmployeeByTourGroupId]
	@tour_group_id varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT Employee.id, Employee.name, Employee.role, Employee.status
	FROM Employee
	INNER JOIN TourGroupDetail ON Employee.id = TourGroupDetail.employee_id
	WHERE TourGroupDetail.tour_group_id = @tour_group_id
END

GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeList]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmployeeList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Employee
	INNER JOIN EmployeeRole ON Employee.role = EmployeeRole.id
	INNER JOIN Status ON Employee.status = Employee.status
END

GO
/****** Object:  StoredProcedure [dbo].[GetPassengerById]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPassengerById]
	@customer_id varchar(20),
	@tour_group_id varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Passenger
	WHERE customer_id = @customer_id AND tour_group_id = @tour_group_id
END

GO
/****** Object:  StoredProcedure [dbo].[GetPassengerByTourGroupId]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPassengerByTourGroupId]
	@tour_group_id varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Passenger
	INNER JOIN PassengerCategory ON Passenger.category_id = PassengerCategory.id
	INNER JOIN Customer ON Customer.id = Passenger.customer_id
	WHERE Passenger.tour_group_id = @tour_group_id
END

GO
/****** Object:  StoredProcedure [dbo].[GetStatusById]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetStatusById]
	@Id varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Status WHERE id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[GetStatusList]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetStatusList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Status 
END

GO
/****** Object:  StoredProcedure [dbo].[GetTourGroupList]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTourGroupList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM TourGroup
	INNER JOIN Tour ON Tour.id = TourGroup.tour_id
END

GO
/****** Object:  StoredProcedure [dbo].[GetTourList]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTourList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Tour
	INNER JOIN Destination ON Tour.destination_id = Destination.id
	INNER JOIN TourPrice ON Tour.tour_price_id = TourPrice.id
	INNER JOIN TourCategory ON Tour.category_id = TourCategory.id
END

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [varchar](20) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[gender] [varchar](2) NOT NULL,
	[nationality] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Customer__3213E83F05102741] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Destination]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Destination](
	[id] [varchar](20) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Destinat__3213E83F62AF067B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [varchar](20) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [varchar](2) NOT NULL,
	[role] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Employee__3213E83F218170D0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeRole]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeRole](
	[id] [varchar](20) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Employee__3213E83F64257B5A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[id] [varchar](2) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [varchar](20) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[status] [varchar](2) NOT NULL,
	[destination_id] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Hotel__3213E83F14758CA3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Passenger](
	[customer_id] [varchar](20) NOT NULL,
	[category_id] [varchar](20) NOT NULL,
	[tour_group_id] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Passenge__9FEB457E9E698CE4] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[tour_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PassengerCategory]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PassengerCategory](
	[id] [varchar](20) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Passenge__3213E83F1A4E41A3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[id] [varchar](2) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__Status__72E12F1A0F949A6F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [varchar](20) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[category_id] [varchar](20) NOT NULL,
	[tour_price_id] [varchar](20) NOT NULL,
	[destination_id] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Tour__3213E83F00C112BE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TourCategory]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TourCategory](
	[id] [varchar](20) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__TourCate__3213E83F26B09213] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TourGroup]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TourGroup](
	[id] [varchar](20) NOT NULL,
	[tour_group_id] [varchar](20) NOT NULL,
	[depart_date] [date] NOT NULL,
	[return_date] [date] NOT NULL,
 CONSTRAINT [PK__TourGrou__3213E83F96508C7B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TourGroupDetail]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TourGroupDetail](
	[tour_group_id] [varchar](20) NOT NULL,
	[employee_id] [varchar](20) NOT NULL,
	[transport_id] [varchar](20) NOT NULL,
 CONSTRAINT [PK__TourGrou__D744595C3E859A04] PRIMARY KEY CLUSTERED 
(
	[tour_group_id] ASC,
	[employee_id] ASC,
	[transport_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TourPrice]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TourPrice](
	[id] [varchar](20) NOT NULL,
	[price] [money] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
 CONSTRAINT [PK__TourPric__3213E83F29B9321F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TourSite]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TourSite](
	[id] [varchar](20) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[destination_id] [varchar](20) NOT NULL,
 CONSTRAINT [PK__TourSite__3213E83F13F7C09C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transport]    Script Date: 12/11/2016 2:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transport](
	[id] [varchar](20) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [varchar](2) NOT NULL,
 CONSTRAINT [PK__Transpor__3213E83F6B6042A1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Gender] FOREIGN KEY([gender])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Gender]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeRole] FOREIGN KEY([role])
REFERENCES [dbo].[EmployeeRole] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeRole]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Status] FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Status]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Destination] FOREIGN KEY([destination_id])
REFERENCES [dbo].[Destination] ([id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Destination]
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_Customer]
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_PassengerCategory] FOREIGN KEY([category_id])
REFERENCES [dbo].[PassengerCategory] ([id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_PassengerCategory]
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_TourGroup] FOREIGN KEY([tour_group_id])
REFERENCES [dbo].[TourGroup] ([id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_TourGroup]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_Destination] FOREIGN KEY([destination_id])
REFERENCES [dbo].[Destination] ([id])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_Destination]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_TourCategory] FOREIGN KEY([category_id])
REFERENCES [dbo].[TourCategory] ([id])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_TourCategory]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_TourPrice] FOREIGN KEY([tour_price_id])
REFERENCES [dbo].[TourPrice] ([id])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_TourPrice]
GO
ALTER TABLE [dbo].[TourGroup]  WITH CHECK ADD  CONSTRAINT [FK_TourGroup_TourCategory] FOREIGN KEY([tour_group_id])
REFERENCES [dbo].[TourCategory] ([id])
GO
ALTER TABLE [dbo].[TourGroup] CHECK CONSTRAINT [FK_TourGroup_TourCategory]
GO
ALTER TABLE [dbo].[TourGroupDetail]  WITH CHECK ADD  CONSTRAINT [FK_TourGroupDetail_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[TourGroupDetail] CHECK CONSTRAINT [FK_TourGroupDetail_Employee]
GO
ALTER TABLE [dbo].[TourGroupDetail]  WITH CHECK ADD  CONSTRAINT [FK_TourGroupDetail_Tour] FOREIGN KEY([tour_group_id])
REFERENCES [dbo].[TourGroup] ([id])
GO
ALTER TABLE [dbo].[TourGroupDetail] CHECK CONSTRAINT [FK_TourGroupDetail_Tour]
GO
ALTER TABLE [dbo].[TourGroupDetail]  WITH CHECK ADD  CONSTRAINT [FK_TourGroupDetail_Transport] FOREIGN KEY([transport_id])
REFERENCES [dbo].[Transport] ([id])
GO
ALTER TABLE [dbo].[TourGroupDetail] CHECK CONSTRAINT [FK_TourGroupDetail_Transport]
GO
ALTER TABLE [dbo].[TourSite]  WITH CHECK ADD  CONSTRAINT [FK_TourSite_Destination] FOREIGN KEY([destination_id])
REFERENCES [dbo].[Destination] ([id])
GO
ALTER TABLE [dbo].[TourSite] CHECK CONSTRAINT [FK_TourSite_Destination]
GO
ALTER TABLE [dbo].[Transport]  WITH CHECK ADD  CONSTRAINT [FK_Transport_Status] FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Transport] CHECK CONSTRAINT [FK_Transport_Status]
GO
USE [master]
GO
ALTER DATABASE [TourManager] SET  READ_WRITE 
GO
