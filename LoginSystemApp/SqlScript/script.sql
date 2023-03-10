USE [LogsignUp]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 19-02-2023 11:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](30) NULL,
	[Password] [varchar](30) NOT NULL,
	[Mobile] [varchar](15) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Address1] [varchar](100) NOT NULL,
	[Address2] [varchar](100) NOT NULL,
	[Is_Active] [tinyint] NOT NULL,
	[pincode] [varchar](10) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Mobile], [Gender], [Address1], [Address2], [Is_Active], [pincode]) VALUES (1, N'Rajesh Kumar', N'rajesh546@gmail.com', N'rajesh@21', N'8451321645', N'Male', N'Lajpat Nagar', N'New Delhi', 1, N'231908')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Mobile], [Gender], [Address1], [Address2], [Is_Active], [pincode]) VALUES (2, N'Rahul Sehgal', N'rahul546@gmail.com', N'rahul5641', N'9830251144', N'Male', N'Sadar Bazar', N'Delhi', 1, N'674526')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Mobile], [Gender], [Address1], [Address2], [Is_Active], [pincode]) VALUES (3, N'Shalini Singh', N'shalini545@gmail.com', N'shalini54', N'8874113966', N'Female', N'Lucknow', N'Uttar Padesh', 1, N'670026')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Mobile], [Gender], [Address1], [Address2], [Is_Active], [pincode]) VALUES (4, N'Govind Kumar', N'govind545@gmail.com', N'govind215', N'6344561102', N'Male', N'Hardoi', N'Uttar Pradesh', 1, N'674596')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Mobile], [Gender], [Address1], [Address2], [Is_Active], [pincode]) VALUES (5, N'Anisha Burman', N'anisha21@gmail.com', N'anish@545', N'6674102555', N'Female', N'Dhanbad', N'Jharkhand', 1, N'678976')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Mobile], [Gender], [Address1], [Address2], [Is_Active], [pincode]) VALUES (6, N'Abhinash Singh', N'abhinash54@gmail.com', N'Abhinash@212', N'8812367499', N'Male', N'Greater Nio', N'Uttar Pradesh', 0, N'897231')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Mobile], [Gender], [Address1], [Address2], [Is_Active], [pincode]) VALUES (7, N'Aman Sharma', N'sharma23@gmail.com', N'Aman@123', N'9363683684', N'Male', N'Noida', N'Uttar Pradesh', 0, N'765676')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_customers]    Script Date: 19-02-2023 11:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_delete_customers]
@id int as
begin
delete from Customers where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_customer]    Script Date: 19-02-2023 11:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_customer]
@Id int=null
as
begin
select Id,Name,Email,Password,Mobile,Gender,Address1,Address2,Is_Active,Pincode from Customers where Id=isnull(@Id,Id)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_customers]    Script Date: 19-02-2023 11:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_insert_customers]
@Name varchar(100),
@Email varchar(30),
@Password varchar(30),
@Mobile varchar(15),
@Gender varchar(10),
@Address1 varchar(100),
@Address2 varchar(100),
@Is_Active tinyint,
@Pincode varchar(10)

as
begin
declare @c int
select @c=COUNT(*) from Customers where Email= @email
if(@c>0)
begin
select 1 as alreadyexist,0 as created
end
else
begin
insert into Customers(Name,Email,Password,Mobile,Gender,Address1,Address2,Is_Active,Pincode)values
(@Name,@Email,@Password,@Mobile,@Gender,@Address1,@Address2,@Is_Active,@Pincode)
select 0 as AlreadyExist, 1 as Created
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_login_customer]    Script Date: 19-02-2023 11:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_login_customer]
@email varchar(100),
@password varchar(100)
as
begin

if(Exists(select 1 from Customers where Email=@email and Password=@password))
begin

select 1 as exist

end
else
begin
select 0 as exist
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_customers]    Script Date: 19-02-2023 11:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_update_customers]
@Id Int,
@Name varchar(100),
@Email varchar(30),
@Password varchar(30),
@Mobile varchar(15),
@Gender varchar(10),
@Address1 varchar(100),
@Address2 varchar(100),
@Is_Active tinyint,
@Pincode varchar(10)

as
begin
update Customers set Name=isnull(@Name,Name),
Email=isnull(@email,Email),Password=isnull(@Password,Password),Mobile=isnull(@mobile,Mobile),
Gender=isnull(@Gender,Gender),Address1=isnull(@Address1,Address1),Address2=isnull(@Address2,Address2),
Is_Active=isnull(@Is_Active,Is_Active),Pincode=isnull(@Pincode,Pincode) where Id=@Id
end
GO
