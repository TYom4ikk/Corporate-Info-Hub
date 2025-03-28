USE [Corporate-Info-Hub]
GO
/****** Object:  Table [dbo].[Absences]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Absences](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WorkerId] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[TypeId] [smallint] NOT NULL,
	[ReplacementWorkerId] [int] NULL,
 CONSTRAINT [PK_Absences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbsenceTypes]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsenceTypes](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AbsenceTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cabinets]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cabinets](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Cabinets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[ParentId] [smallint] NOT NULL,
	[DirectorId] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TypeId] [smallint] NOT NULL,
	[StatusId] [smallint] NOT NULL,
	[StartDateTime] [datetime] NULL,
	[HourlyDuration] [tinyint] NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ResponsibleDepartmentId] [smallint] NULL,
	[ResponsibleWorkerId] [int] NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventStatuses]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventStatuses](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EventStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTypes]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTypes](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EventTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[AuthorId] [int] NULL,
	[CreationDate] [date] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainings]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainings](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WorkerId] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[TrainingName] [nvarchar](max) NOT NULL,
	[TypeId] [smallint] NOT NULL,
 CONSTRAINT [PK_TrainingCalendars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingTypes]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingTypes](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TrainingTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [smallint] NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[WorkPhoneNumber] [nvarchar](20) NULL,
	[CabinetId] [smallint] NULL,
	[CorporateEmail] [nvarchar](100) NULL,
	[PostId] [smallint] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[LeaderId] [int] NULL,
	[HelperId] [int] NULL,
	[PersonalPhoneNumber] [nvarchar](20) NULL,
	[ExtraInfo] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PasswordSalt] [nvarchar](50) NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkingCalendar]    Script Date: 29.03.2025 12:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingCalendar](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[ExceptionDate] [date] NOT NULL,
	[IsWorkingDay] [bit] NOT NULL,
 CONSTRAINT [PK_WorkingCalendar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Absences] ON 

INSERT [dbo].[Absences] ([Id], [WorkerId], [StartDate], [EndDate], [TypeId], [ReplacementWorkerId]) VALUES (2, 1146, CAST(N'2025-03-14' AS Date), CAST(N'2025-05-14' AS Date), 1, 1159)
INSERT [dbo].[Absences] ([Id], [WorkerId], [StartDate], [EndDate], [TypeId], [ReplacementWorkerId]) VALUES (3, 1150, CAST(N'2025-06-06' AS Date), CAST(N'2025-06-10' AS Date), 7, NULL)
SET IDENTITY_INSERT [dbo].[Absences] OFF
GO
SET IDENTITY_INSERT [dbo].[AbsenceTypes] ON 

INSERT [dbo].[AbsenceTypes] ([Id], [Name]) VALUES (1, N'Больничный')
INSERT [dbo].[AbsenceTypes] ([Id], [Name]) VALUES (2, N'Отпуск')
INSERT [dbo].[AbsenceTypes] ([Id], [Name]) VALUES (3, N'Семейные обстоятельства')
INSERT [dbo].[AbsenceTypes] ([Id], [Name]) VALUES (4, N'Судебное заседание')
INSERT [dbo].[AbsenceTypes] ([Id], [Name]) VALUES (5, N'Медицинское обследование')
INSERT [dbo].[AbsenceTypes] ([Id], [Name]) VALUES (6, N'Технический сбой')
INSERT [dbo].[AbsenceTypes] ([Id], [Name]) VALUES (7, N'Религиозные праздники')
SET IDENTITY_INSERT [dbo].[AbsenceTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Cabinets] ON 

INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (262, N'101')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (263, N'102')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (264, N'103')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (265, N'104')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (266, N'105')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (267, N'106')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (268, N'107')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (269, N'108')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (270, N'109')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (271, N'109А')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (272, N'110')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (273, N'111')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (274, N'112')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (275, N'113')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (276, N'114')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (277, N'115')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (278, N'116')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (279, N'117')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (280, N'118')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (281, N'119')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (282, N'201')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (283, N'202')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (284, N'203')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (285, N'204')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (286, N'205')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (287, N'206')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (288, N'207')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (289, N'208')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (290, N'209')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (291, N'210')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (292, N'Серверная')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (295, N'211')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (296, N'212')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (297, N'213')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (298, N'214')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (299, N'215')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (300, N'216')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (301, N'217')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (302, N'218')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (303, N'219')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (304, N'301')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (305, N'301А')
INSERT [dbo].[Cabinets] ([Id], [Name]) VALUES (306, N'302')
SET IDENTITY_INSERT [dbo].[Cabinets] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (94, N'EcoTech', 0, 1132, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (95, N'Отдел Управления', 94, 1130, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (96, N'Отдел финансов', 95, 1135, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (97, N'Отдел кадров', 95, 1138, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (98, N'Юридический отдел', 95, 1139, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (99, N'Отдел продуктов', 94, 1142, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (100, N'Отдел тестирования', 99, 1144, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (101, N'Отдел маркетинга', 94, 1146, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (102, N'Отдел рекламы', 103, 1148, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (103, N'Отдел социальных сетей ', 101, 1150, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (104, N'Отдел PR', 103, 1152, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (105, N'Отдел продаж', 94, 1154, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (106, N'Отдел ИТ', 94, 1156, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (107, N'Отдел сетей', 106, 1158, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (108, N'Отдел безопасности', 106, 1160, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [ParentId], [DirectorId], [Description]) VALUES (109, N'Отдел поддержки инфраструктуры', 108, 1163, NULL)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([Id], [Name], [TypeId], [StatusId], [StartDateTime], [HourlyDuration], [Description], [ResponsibleDepartmentId], [ResponsibleWorkerId]) VALUES (1, N'День рождения компании', 4, 2, CAST(N'2025-06-06T00:00:00.000' AS DateTime), 2, N'Празднование дня рождения компании пройдёт в Измайловском парке', NULL, 1130)
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[EventStatuses] ON 

INSERT [dbo].[EventStatuses] ([Id], [Name]) VALUES (1, N'Проведён')
INSERT [dbo].[EventStatuses] ([Id], [Name]) VALUES (2, N'Ожидает проведения')
INSERT [dbo].[EventStatuses] ([Id], [Name]) VALUES (3, N'Проводится')
INSERT [dbo].[EventStatuses] ([Id], [Name]) VALUES (4, N'Отменён')
SET IDENTITY_INSERT [dbo].[EventStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[EventTypes] ON 

INSERT [dbo].[EventTypes] ([Id], [Name]) VALUES (1, N'Семинар')
INSERT [dbo].[EventTypes] ([Id], [Name]) VALUES (2, N'Корпоратив')
INSERT [dbo].[EventTypes] ([Id], [Name]) VALUES (3, N'Деловая встреча')
INSERT [dbo].[EventTypes] ([Id], [Name]) VALUES (4, N'День рождения')
SET IDENTITY_INSERT [dbo].[EventTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Description], [AuthorId], [CreationDate], [ImagePath]) VALUES (1, N'Новый офис в центре города', N'Компания открывает новый офис в центре города, что позволит улучшить условия работы и повысить доступность для клиентов и партнеров.', 1149, CAST(N'2025-03-14' AS Date), NULL)
INSERT [dbo].[News] ([Id], [Title], [Description], [AuthorId], [CreationDate], [ImagePath]) VALUES (2, N'Запуск нового продукта', N'Наша компания рада представить новый инновационный продукт, который будет революционизировать рынок и удовлетворять потребности наших клиентов.', 1149, CAST(N'2025-03-15' AS Date), NULL)
INSERT [dbo].[News] ([Id], [Title], [Description], [AuthorId], [CreationDate], [ImagePath]) VALUES (3, N'Партнерство с ведущей компанией', N'Мы заключили стратегическое партнерство с одной из ведущих компаний в отрасли, что позволит расширить наши возможности и предложить клиентам еще больше преимуществ.', 1149, CAST(N'2025-03-16' AS Date), NULL)
INSERT [dbo].[News] ([Id], [Title], [Description], [AuthorId], [CreationDate], [ImagePath]) VALUES (4, N'Награда за инновации', N'Наша компания получила престижную награду за инновации в области технологий, что подтверждает нашу приверженность качеству и прогрессу.', 1149, CAST(N'2025-03-18' AS Date), NULL)
INSERT [dbo].[News] ([Id], [Title], [Description], [AuthorId], [CreationDate], [ImagePath]) VALUES (5, N'Расширение штата', N'В связи с ростом компании мы объявляем о наборе новых сотрудников на различные позиции, приглашая всех желающих присоединиться к нашей команде.', 1149, CAST(N'2025-03-23' AS Date), NULL)
INSERT [dbo].[News] ([Id], [Title], [Description], [AuthorId], [CreationDate], [ImagePath]) VALUES (6, N'Открытие нового филиала', N'Мы открываем новый филиал в регионе, что позволит нам быть ближе к клиентам и улучшить обслуживание на местах.', 1149, CAST(N'2025-03-25' AS Date), NULL)
INSERT [dbo].[News] ([Id], [Title], [Description], [AuthorId], [CreationDate], [ImagePath]) VALUES (8, N'Успешное завершение проекта', N' Наша команда успешно завершила крупный проект, который получил высокую оценку клиентов и партнеров, что демонстрирует нашу способность выполнять сложные задачи.', 1149, CAST(N'2025-03-29' AS Date), NULL)
INSERT [dbo].[News] ([Id], [Title], [Description], [AuthorId], [CreationDate], [ImagePath]) VALUES (9, N'Внедрение новых технологий', N'Компания внедряет новые технологии для оптимизации процессов и повышения эффективности работы, что позволит нам опережать конкурентов и предоставлять лучшие услуги.', 1149, CAST(N'2025-03-31' AS Date), NULL)
INSERT [dbo].[News] ([Id], [Title], [Description], [AuthorId], [CreationDate], [ImagePath]) VALUES (10, N'Социальная ответственность', N'Наша компания участвует в социальных проектах, направленных на поддержку местных сообществ и защиту окружающей среды, что соответствует нашим ценностям и принципам.', 1149, CAST(N'2025-04-02' AS Date), NULL)
INSERT [dbo].[News] ([Id], [Title], [Description], [AuthorId], [CreationDate], [ImagePath]) VALUES (11, N'Обновление бренда', N'Мы обновляем наш бренд, чтобы лучше отражать наши ценности и миссию, что поможет нам еще лучше соединяться с клиентами и партнерами.', 1130, CAST(N'2025-04-05' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Name]) VALUES (156, N'Менеджер проектов')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (157, N'Административный координатор')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (158, N'Финансовый аналитик')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (159, N'Бухгалтер')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (160, N'HR-менеджер')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (161, N'Рекрутер')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (162, N'Корпоративный юрист')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (163, N'Специалист по compliance')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (164, N'Продуктовый менеджер')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (165, N'Аналитик продуктов')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (166, N'QA-инженер')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (167, N'Тестировщик ПО')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (168, N'Маркетинг-менеджер')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (169, N'Аналитик рынка')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (170, N'Менеджер по рекламе')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (171, N'Креативный директор')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (172, N'SMM-менеджер')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (173, N'Контент-менеджер')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (174, N'PR-менеджер')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (175, N'Специалист по связям с общественностью')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (176, N'Менеджер по продажам')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (177, N'Торговый представитель')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (178, N'Разработчик ПО')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (179, N'Системный архитектор')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (180, N'Сетевой инженер')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (181, N'Администратор сетей')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (182, N'Специалист по кибербезопасности')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (183, N'Инженер по информационной безопасности')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (184, N'Системный администратор')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (185, N'Технический специалист поддержки')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (186, N'Начальник отдела')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (188, N'Генеральный директор')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Trainings] ON 

INSERT [dbo].[Trainings] ([Id], [WorkerId], [StartDate], [EndDate], [TrainingName], [TypeId]) VALUES (1, 1130, CAST(N'2025-03-20' AS Date), CAST(N'2025-04-01' AS Date), N'Повышение квалификации в области менеджмента', 3)
INSERT [dbo].[Trainings] ([Id], [WorkerId], [StartDate], [EndDate], [TrainingName], [TypeId]) VALUES (2, 1155, CAST(N'2025-06-01' AS Date), CAST(N'2025-06-05' AS Date), N'Изучение языка программирования Java', 5)
SET IDENTITY_INSERT [dbo].[Trainings] OFF
GO
SET IDENTITY_INSERT [dbo].[TrainingTypes] ON 

INSERT [dbo].[TrainingTypes] ([Id], [Name]) VALUES (1, N'Подготовка сотрудников')
INSERT [dbo].[TrainingTypes] ([Id], [Name]) VALUES (2, N'Переподготовка')
INSERT [dbo].[TrainingTypes] ([Id], [Name]) VALUES (3, N'Повышение квалификации')
INSERT [dbo].[TrainingTypes] ([Id], [Name]) VALUES (4, N'Onboarding')
INSERT [dbo].[TrainingTypes] ([Id], [Name]) VALUES (5, N'Upskilling')
INSERT [dbo].[TrainingTypes] ([Id], [Name]) VALUES (6, N'Cross-training')
INSERT [dbo].[TrainingTypes] ([Id], [Name]) VALUES (7, N'Soft Skills Training')
INSERT [dbo].[TrainingTypes] ([Id], [Name]) VALUES (8, N'Leadership Development')
INSERT [dbo].[TrainingTypes] ([Id], [Name]) VALUES (9, N'Compliance Training')
INSERT [dbo].[TrainingTypes] ([Id], [Name]) VALUES (10, N'Digital Literacy Training')
SET IDENTITY_INSERT [dbo].[TrainingTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Workers] ON 

INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1130, 95, N'Белоусов', N'Семен', N'Агафонович', N'+7 (334) 167-89-01', 262, N'белоусов@гкдр.ру', 186, CAST(N'1971-04-25' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1131, 95, N'Иванов', N'Иван', N'Иванович', N'+7 (334) 156-89-02', 263, N'иванов@гкдр.ру', 156, CAST(N'1980-05-15' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1132, 94, N'Петров', N'Петр', N'Петрович', N'+7 (334) 163-89-21', 264, N'петров@гкдр.ру', 188, CAST(N'1975-08-20' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1133, 95, N'Сидоров', N'Алексей', N'Николаевич', N'+7 (445) 678-90-12', 265, N'сидоров@гкдр.ру', 157, CAST(N'1985-12-10' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1134, 95, N'Кузнецов', N'Дмитрий', N'Сергеевич', N'+7 (456) 789-01-23', 266, N'кузнецов@гкдр.ру', 158, CAST(N'1990-03-30' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1135, 96, N'Смирнов', N'Андрей', N'Владимирович', N'+7 (567) 899-12-34', 267, N'смирнов@гкдр.ру', 186, CAST(N'1982-07-22' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1136, 96, N'Васильев', N'Василий', N'Иванович', N'+7 (678) 901-23-43', 268, N'васильев@гкдр.ру', 159, CAST(N'1978-11-05' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1137, 97, N'Николаев', N'Николай', N'Петрович', N'+7 (789) 011-34-56', 269, N'николаев@гкдр.ру', 160, CAST(N'1988-09-18' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1138, 97, N'Михайлов', N'Михаил', N'Александрович', N'+7 (890) 123-45-67', 270, N'михайлов@гкдр.ру', 186, CAST(N'1995-02-14' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1139, 98, N'Федоров', N'Федор', N'Дмитриевич', N'+7 (901) 236-56-78', 271, N'федоров@гкдр.ру', 186, CAST(N'1983-06-09' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1140, 98, N'Алексеев', N'Алексей', N'Иванович', N'+7 (052) 345-67-89', 272, N'алексеев@гкдр.ру', 163, CAST(N'1976-10-12' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1141, 99, N'Дмитриев', N'Дмитрий', N'Сергеевич', N'+7 (123) 456-78-99', 273, N'дмитриев@гкдр.ру', 164, CAST(N'1992-04-07' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1142, 99, N'Сергеев', N'Сергей', N'Николаевич', N'+7 (634) 567-89-03', 274, N'сергеев@гкдр.ру', 186, CAST(N'1987-08-25' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1143, 100, N'Андреев', N'Андрей', N'Владимирович', N'+7 (345) 678-90-12', 275, N'андреев@гкдр.ру', 166, CAST(N'1979-01-30' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1144, 100, N'Павлов', N'Павел', N'Иванович', N'+7 (456) 789-01-23', 276, N'павлов@гкдр.ру', 186, CAST(N'1993-05-19' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1145, 101, N'Григорьев', N'Григорий', N'Петрович', N'+7 (567) 890-12-34', 277, N'григорьев@гкдр.ру', 168, CAST(N'1984-12-03' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1146, 101, N'Борисов', N'Борис', N'Алексеевич', N'+7 (678) 901-23-45', 278, N'борисов@гкдр.ру', 186, CAST(N'1991-07-17' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1147, 102, N'Кириллов', N'Кирилл', N'Дмитриевич', N'+7 (789) 012-34-56', 279, N'кириллов@гкдр.ру', 170, CAST(N'1986-03-22' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1148, 102, N'Тимофеев', N'Тимофей', N'Сергеевич', N'+7 (890) 123-45-67', 280, N'тимофеев@гкдр.ру', 186, CAST(N'1994-09-11' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1149, 103, N'Макаров', N'Макар', N'Иванович', N'+7 (901) 234-56-78', 281, N'макаров@гкдр.ру', 173, CAST(N'1981-02-28' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1150, 103, N'Егоров', N'Егор', N'Николаевич', N'+7 (012) 345-67-88', 282, N'егоров@гкдр.ру', 186, CAST(N'1996-06-14' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1151, 104, N'Степанов', N'Степан', N'Владимирович', N'+7 (123) 456-77-90', 283, N'степанов@гкдр.ру', 174, CAST(N'1989-10-05' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1152, 104, N'Филиппов', N'Филипп', N'Петрович', N'+7 (234) 567-89-11', 284, N'филиппов@гкдр.ру', 186, CAST(N'1977-04-18' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1153, 105, N'Константинов', N'Константин', N'Алексеевич', N'+7 (345) 678-90-13', 285, N'константинов@гкдр.ру', 176, CAST(N'1997-08-09' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1154, 105, N'Артемов', N'Артем', N'Дмитриевич', N'+7 (456) 789-01-23', 286, N'артемов@гкдр.ру', 186, CAST(N'1983-12-12' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1155, 106, N'Леонидов', N'Леонид', N'Сергеевич', N'+7 (567) 890-12-34', 287, N'леонидов@гкдр.ру', 178, CAST(N'1990-05-25' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1156, 106, N'Владимиров', N'Владимир', N'Иванович', N'+7 (678) 901-23-45', 288, N'владимиров@гкдр.ру', 186, CAST(N'1985-11-30' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1157, 107, N'Геннадьев', N'Геннадий', N'Николаевич', N'+7 (789) 012-34-56', 289, N'геннадьев@гкдр.ру', 180, CAST(N'1974-07-19' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1158, 107, N'Денисов', N'Денис', N'Петрович', N'+7 (890) 123-45-67', 290, N'денисов@гкдр.ру', 186, CAST(N'1998-03-03' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1159, 108, N'Антонов', N'Антон', N'Владимирович', N'+7 (901) 234-56-78', 291, N'антонов@гкдр.ру', 182, CAST(N'1980-09-27' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1160, 108, N'Игорев', N'Игорь', N'Дмитриевич', N'+7 (012) 345-66-89', 292, N'игорев@гкдр.ру', 186, CAST(N'1991-01-15' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Workers] ([Id], [DepartmentId], [LastName], [FirstName], [MiddleName], [WorkPhoneNumber], [CabinetId], [CorporateEmail], [PostId], [BirthDate], [LeaderId], [HelperId], [PersonalPhoneNumber], [ExtraInfo], [PasswordHash], [PasswordSalt]) VALUES (1163, 109, N'Сидоров', N'Александр', N'Эдуардович', N'+7 (056) 342-66-88', 306, N'сидороф@гкдр.ру', 186, CAST(N'1991-01-15' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Workers] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkingCalendar] ON 

INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (1, CAST(N'2024-01-01' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (2, CAST(N'2024-01-02' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (3, CAST(N'2024-01-03' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (4, CAST(N'2024-01-04' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (5, CAST(N'2024-01-05' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (6, CAST(N'2024-01-08' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (7, CAST(N'2024-02-23' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (8, CAST(N'2024-03-08' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (9, CAST(N'2024-04-27' AS Date), 1)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (10, CAST(N'2024-04-29' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (11, CAST(N'2024-04-30' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (12, CAST(N'2024-05-01' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (13, CAST(N'2024-05-09' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (14, CAST(N'2024-05-10' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (15, CAST(N'2024-06-12' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (16, CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (17, CAST(N'2024-11-04' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (18, CAST(N'2024-12-28' AS Date), 1)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (19, CAST(N'2024-12-30' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (20, CAST(N'2024-12-31' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (21, CAST(N'2025-01-01' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (22, CAST(N'2025-01-02' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (23, CAST(N'2025-01-03' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (24, CAST(N'2025-01-04' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (25, CAST(N'2025-01-05' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (26, CAST(N'2025-01-08' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (27, CAST(N'2025-02-23' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (28, CAST(N'2025-03-08' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (29, CAST(N'2025-04-27' AS Date), 1)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (30, CAST(N'2025-04-29' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (31, CAST(N'2025-04-30' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (32, CAST(N'2025-05-01' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (33, CAST(N'2025-05-09' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (34, CAST(N'2025-05-10' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (35, CAST(N'2025-06-12' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (36, CAST(N'2025-11-02' AS Date), 1)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (37, CAST(N'2025-11-04' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (38, CAST(N'2025-12-28' AS Date), 1)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (39, CAST(N'2025-12-30' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (40, CAST(N'2025-12-31' AS Date), 0)
SET IDENTITY_INSERT [dbo].[WorkingCalendar] OFF
GO
ALTER TABLE [dbo].[Absences]  WITH CHECK ADD  CONSTRAINT [FK_Absences_AbsenceTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[AbsenceTypes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Absences] CHECK CONSTRAINT [FK_Absences_AbsenceTypes]
GO
ALTER TABLE [dbo].[Absences]  WITH CHECK ADD  CONSTRAINT [FK_Absences_Workers] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Workers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Absences] CHECK CONSTRAINT [FK_Absences_Workers]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Departments] FOREIGN KEY([ResponsibleDepartmentId])
REFERENCES [dbo].[Departments] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Departments]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventStatuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[EventStatuses] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventStatuses]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[EventTypes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventTypes]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Workers1] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Workers] ([Id])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Workers1]
GO
ALTER TABLE [dbo].[Trainings]  WITH CHECK ADD  CONSTRAINT [FK_Trainings_TrainingTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TrainingTypes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Trainings] CHECK CONSTRAINT [FK_Trainings_TrainingTypes]
GO
ALTER TABLE [dbo].[Trainings]  WITH CHECK ADD  CONSTRAINT [FK_Trainings_Workers] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Workers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Trainings] CHECK CONSTRAINT [FK_Trainings_Workers]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Cabinets] FOREIGN KEY([CabinetId])
REFERENCES [dbo].[Cabinets] ([Id])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Cabinets]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Departments1] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Departments1]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Posts]
GO
