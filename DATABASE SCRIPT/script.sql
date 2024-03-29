USE [HR]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/20/2019 1:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[D_ID] [int] IDENTITY(1,1) NOT NULL,
	[D_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[D_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/20/2019 1:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Em_ID] [int] IDENTITY(1,1) NOT NULL,
	[Em_Name] [nvarchar](50) NULL,
	[D_ID] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Em_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([D_ID], [D_Name]) VALUES (3, N'Education')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Em_ID], [Em_Name], [D_ID]) VALUES (5, N'Mohammed', 3)
SET IDENTITY_INSERT [dbo].[Employee] OFF
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department1] FOREIGN KEY([D_ID])
REFERENCES [dbo].[Department] ([D_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department1]
GO
/****** Object:  StoredProcedure [dbo].[DeleteDepartment]    Script Date: 11/20/2019 1:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteDepartment] @D_ID int
AS
Begin   
Delete from Department Where D_ID=@D_ID

End;



GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 11/20/2019 1:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteEmployee] @EM_ID int
AS
Begin   
Delete from Employee Where EM_ID=@EM_ID

End;

GO
/****** Object:  StoredProcedure [dbo].[InsertDepartment]    Script Date: 11/20/2019 1:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertDepartment] @D_Name nvarchar(50)
AS

insert into dbo.Department(D_Name)
values(@D_Name)
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 11/20/2019 1:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmployee] @Em_Name nvarchar(50),@D_ID int
AS

insert into dbo.Employee(Em_Name,D_ID)
values(@Em_Name,@D_ID )
GO
/****** Object:  StoredProcedure [dbo].[UpdateDepart]    Script Date: 11/20/2019 1:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[UpdateDepart] @D_Name nvarchar(50),@D_ID int
AS

update Department set D_Name=@D_Name
Where D_ID=@D_ID
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 11/20/2019 1:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[UpdateEmployee] @Em_Name nvarchar(50),@D_ID int,@Em_ID int
AS

update Employee set Em_Name=@Em_Name,D_ID =@D_ID
Where Em_id=@Em_ID
GO
