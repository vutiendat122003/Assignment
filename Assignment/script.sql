USE [Assignment]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[adminId] [int] NOT NULL,
	[adminName] [nvarchar](50) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[adminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assesments]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assesments](
	[aid] [int] NOT NULL,
	[aname] [varchar](150) NOT NULL,
	[weight] [float] NOT NULL,
	[subid] [int] NULL,
 CONSTRAINT [PK_assesments] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[cid] [int] NOT NULL,
	[cname] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[subid] [int] NOT NULL,
	[semid] [int] NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exams]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[eid] [int] NOT NULL,
	[from] [datetime] NOT NULL,
	[duration] [float] NOT NULL,
	[aid] [int] NOT NULL,
 CONSTRAINT [PK_exams] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[features]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[features](
	[featureid] [int] NOT NULL,
	[url] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_features] PRIMARY KEY CLUSTERED 
(
	[featureid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grades]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grades](
	[eid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_grades] PRIMARY KEY CLUSTERED 
(
	[eid] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturers]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturers](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_lecturers] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[roleid] [int] NOT NULL,
	[rolename] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles_features]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles_features](
	[featureid] [int] NOT NULL,
	[roleid] [int] NOT NULL,
 CONSTRAINT [PK_roles_features] PRIMARY KEY CLUSTERED 
(
	[featureid] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semester]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semester](
	[semid] [int] NOT NULL,
	[year] [int] NOT NULL,
	[season] [varchar](10) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_semester] PRIMARY KEY CLUSTERED 
(
	[semid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[sid] [int] NOT NULL,
	[sname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students_courses]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_courses](
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_students_courses] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_subjects] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[displayname] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_admin]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_admin](
	[username] [nvarchar](50) NOT NULL,
	[adminId] [int] NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_users_admin] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[adminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_lecturers]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_lecturers](
	[username] [nvarchar](50) NOT NULL,
	[lid] [int] NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_users_lecturers] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_role]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_role](
	[username] [nvarchar](50) NOT NULL,
	[roleid] [int] NOT NULL,
 CONSTRAINT [PK_users_role] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_students]    Script Date: 16/07/2024 9:14:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_students](
	[username] [nvarchar](50) NOT NULL,
	[sid] [int] NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_users_students] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[admin] ([adminId], [adminName]) VALUES (1, N'Admin1')
GO
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (1, N'WS1', 0.15, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (2, N'WS2', 0.15, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (3, N'PT1', 0.15, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (4, N'PT2', 0.15, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (5, N'FE', 0.4, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (6, N'FE', 0.2, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (7, N'PT1', 0.05, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (8, N'PT2', 0.05, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (9, N'WS1', 0.05, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (10, N'WS2', 0.05, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (11, N'PE', 0.2, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (12, N'ASS', 0.4, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (13, N'FE', 1, 3)
GO
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (1, N'SE1871', 1, 1, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (2, N'SE1871', 2, 2, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (3, N'SE1871', 3, 3, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (4, N'SE1871', 4, 4, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (5, N'SE1869', 1, 5, 3)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (6, N'SE1869', 2, 6, 3)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (7, N'SE1869', 3, 7, 3)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (8, N'SE1869', 4, 8, 3)
GO
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (1, CAST(N'2024-06-24T09:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (2, CAST(N'2024-06-25T09:00:00.000' AS DateTime), 30, 2)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (3, CAST(N'2024-06-26T09:00:00.000' AS DateTime), 30, 3)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (4, CAST(N'2024-06-27T09:00:00.000' AS DateTime), 30, 4)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (5, CAST(N'2024-06-28T09:00:00.000' AS DateTime), 60, 5)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (6, CAST(N'2024-06-29T09:00:00.000' AS DateTime), 60, 6)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (7, CAST(N'2024-06-30T09:00:00.000' AS DateTime), 60, 7)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (8, CAST(N'2024-06-30T00:00:00.000' AS DateTime), 30, 8)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (9, CAST(N'2024-07-01T09:00:00.000' AS DateTime), 30, 9)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (10, CAST(N'2024-07-02T09:00:00.000' AS DateTime), 60, 10)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (11, CAST(N'2024-07-03T09:00:00.000' AS DateTime), 60, 11)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (12, CAST(N'2024-07-04T09:00:00.000' AS DateTime), 30, 12)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (13, CAST(N'2024-07-05T09:00:00.000' AS DateTime), 60, 13)
GO
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 1, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 2, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 1, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 2, 2)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 1, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 2, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 1, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 2, 1)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 1, 0)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 2, 7)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 1, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 2, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 1, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 2, 4.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 1, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 1, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (10, 1, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (11, 1, 1)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (12, 1, 6)
GO
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (1, N'Hoang Van A')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (2, N'Hoang Van B')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (3, N'Hoang Van C')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (4, N'Hoang Van D')
GO
INSERT [dbo].[roles] ([roleid], [rolename]) VALUES (1, N'student')
INSERT [dbo].[roles] ([roleid], [rolename]) VALUES (2, N'teacher')
INSERT [dbo].[roles] ([roleid], [rolename]) VALUES (3, N'admin')
GO
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (1, 2023, N'Summer', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (2, 2023, N'Fall', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (3, 2024, N'Spring', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (4, 2024, N'Summer', 1)
GO
INSERT [dbo].[students] ([sid], [sname]) VALUES (1, N'Nguyen Van A')
INSERT [dbo].[students] ([sid], [sname]) VALUES (2, N'Nguyen Van B')
INSERT [dbo].[students] ([sid], [sname]) VALUES (3, N'Nguyen Van C')
INSERT [dbo].[students] ([sid], [sname]) VALUES (4, N'Nguyen Van D')
GO
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 4)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 5)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 6)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 7)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 8)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 4)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 6)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 8)
GO
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (1, N'MAS291')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (2, N'PRJ301')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (3, N'JPD123')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (4, N'IOT102')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (5, N'CSD201')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (6, N'DBI202')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (7, N'JPD113')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (8, N'LAB211')
GO
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'admin1', N'123', N'Admin 1')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'hoangvana', N'123', N'Hoang Van A')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'hoangvanb', N'123', N'Hoang Van B')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'hoangvanc', N'123', N'Hoang Van C')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'hoangvand', N'123', N'Hoang Van D')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'nguyenvana', N'123', N'Nguyen Van A')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'nguyenvanb', N'123', N'Nguyen Van B')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'nguyenvanc', N'123', N'Nguyen Van C')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'nguyenvand', N'123', N'Nguyen Van D')
GO
INSERT [dbo].[users_admin] ([username], [adminId], [active]) VALUES (N'admin1', 1, 1)
GO
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'hoangvana', 1, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'hoangvanb', 2, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'hoangvanc', 3, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'hoangvand', 4, 1)
GO
INSERT [dbo].[users_role] ([username], [roleid]) VALUES (N'admin1', 3)
INSERT [dbo].[users_role] ([username], [roleid]) VALUES (N'hoangvana', 2)
INSERT [dbo].[users_role] ([username], [roleid]) VALUES (N'hoangvanb', 2)
INSERT [dbo].[users_role] ([username], [roleid]) VALUES (N'hoangvanc', 2)
INSERT [dbo].[users_role] ([username], [roleid]) VALUES (N'hoangvand', 2)
INSERT [dbo].[users_role] ([username], [roleid]) VALUES (N'nguyenvana', 1)
INSERT [dbo].[users_role] ([username], [roleid]) VALUES (N'nguyenvanb', 1)
INSERT [dbo].[users_role] ([username], [roleid]) VALUES (N'nguyenvanc', 1)
INSERT [dbo].[users_role] ([username], [roleid]) VALUES (N'nguyenvand', 1)
GO
INSERT [dbo].[users_students] ([username], [sid], [active]) VALUES (N'nguyenvana', 1, 1)
INSERT [dbo].[users_students] ([username], [sid], [active]) VALUES (N'nguyenvanb', 2, 1)
INSERT [dbo].[users_students] ([username], [sid], [active]) VALUES (N'nguyenvanc', 3, 1)
GO
ALTER TABLE [dbo].[assesments]  WITH CHECK ADD  CONSTRAINT [FK_assesments_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[assesments] CHECK CONSTRAINT [FK_assesments_subjects]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_lecturers]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_semester] FOREIGN KEY([semid])
REFERENCES [dbo].[semester] ([semid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_semester]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_subjects]
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK_exams_assesments] FOREIGN KEY([aid])
REFERENCES [dbo].[assesments] ([aid])
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK_exams_assesments]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_exams] FOREIGN KEY([eid])
REFERENCES [dbo].[exams] ([eid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_exams]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_students]
GO
ALTER TABLE [dbo].[roles_features]  WITH CHECK ADD  CONSTRAINT [FK_roles_features_features] FOREIGN KEY([featureid])
REFERENCES [dbo].[features] ([featureid])
GO
ALTER TABLE [dbo].[roles_features] CHECK CONSTRAINT [FK_roles_features_features]
GO
ALTER TABLE [dbo].[roles_features]  WITH CHECK ADD  CONSTRAINT [FK_roles_features_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([roleid])
GO
ALTER TABLE [dbo].[roles_features] CHECK CONSTRAINT [FK_roles_features_roles]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_courses] FOREIGN KEY([cid])
REFERENCES [dbo].[courses] ([cid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_courses]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_students]
GO
ALTER TABLE [dbo].[users_admin]  WITH CHECK ADD  CONSTRAINT [FK_users_admin_admin] FOREIGN KEY([adminId])
REFERENCES [dbo].[admin] ([adminId])
GO
ALTER TABLE [dbo].[users_admin] CHECK CONSTRAINT [FK_users_admin_admin]
GO
ALTER TABLE [dbo].[users_admin]  WITH CHECK ADD  CONSTRAINT [FK_users_admin_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_admin] CHECK CONSTRAINT [FK_users_admin_users]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_lecturers]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_users]
GO
ALTER TABLE [dbo].[users_role]  WITH CHECK ADD  CONSTRAINT [FK_users_role_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([roleid])
GO
ALTER TABLE [dbo].[users_role] CHECK CONSTRAINT [FK_users_role_roles]
GO
ALTER TABLE [dbo].[users_role]  WITH CHECK ADD  CONSTRAINT [FK_users_role_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_role] CHECK CONSTRAINT [FK_users_role_users]
GO
ALTER TABLE [dbo].[users_students]  WITH CHECK ADD  CONSTRAINT [FK_users_students_students1] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[users_students] CHECK CONSTRAINT [FK_users_students_students1]
GO
ALTER TABLE [dbo].[users_students]  WITH CHECK ADD  CONSTRAINT [FK_users_students_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_students] CHECK CONSTRAINT [FK_users_students_users]
GO
