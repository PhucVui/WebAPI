
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Module
	(
	ModuleId int NOT NULL IDENTITY (1, 1),
	ModuleName nvarchar(200) NOT NULL,
	Duration int NOT NULL,
	Status int NOT NULL,
	CreatedDate datetimeoffset(7) NOT NULL,
	CreatedBy int NOT NULL,
	ModifiedDate datetimeoffset(7) NOT NULL,
	ModifiedBy int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Module ADD CONSTRAINT
	PK_Module PRIMARY KEY CLUSTERED 
	(
	ModuleId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Module SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Module', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Module', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Module', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Teacher
	(
	TeacherId int NOT NULL IDENTITY (1, 1),
	Fullname nvarchar(50) NOT NULL,
	Gender bit NOT NULL,
	Dob date NOT NULL,
	Email nvarchar(50) NOT NULL,
	PhoneNumber nvarchar(20) NOT NULL,
	[Level] nvarchar(50) NOT NULL,
	Address nvarchar(200) NOT NULL,
	Avatar nvarchar(MAX) NOT NULL,
	Status int NOT NULL,
	CreatedDate datetimeoffset(7) NOT NULL,
	CreatedBy int NOT NULL,
	ModifiedDate datetimeoffset(7) NOT NULL,
	ModifiedBy int NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Teacher ADD CONSTRAINT
	PK_Teacher PRIMARY KEY CLUSTERED 
	(
	TeacherId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Teacher SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Teacher', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Teacher', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Teacher', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Student
	(
	StudentId int NOT NULL IDENTITY (1, 1),
	Fullname nvarchar(50) NOT NULL,
	Gender bit NOT NULL,
	Dob date NOT NULL,
	Email nvarchar(50) NOT NULL,
	PhoneNumber nvarchar(20) NOT NULL,
	Address nvarchar(200) NOT NULL,
	Avatar nvarchar(MAX) NOT NULL,
	Status int NOT NULL,
	CreatedDate datetimeoffset(7) NOT NULL,
	CreatedBy int NOT NULL,
	ModifiedDate datetimeoffset(7) NOT NULL,
	ModifiedBy int NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Student ADD CONSTRAINT
	PK_Student PRIMARY KEY CLUSTERED 
	(
	StudentId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Student SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Student', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Student', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Student', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Course
	(
	CourseId int NOT NULL IDENTITY (1, 1),
	CourseName nvarchar(50) NOT NULL,
	Status int NOT NULL,
	StartDate date NULL,
	EndDate date NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Course ADD CONSTRAINT
	PK_Course PRIMARY KEY CLUSTERED 
	(
	CourseId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Course SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Course', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Course', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Course', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.CourseModule
	(
	CourseId int NOT NULL,
	ModuleId int NOT NULL,
	Status int NOT NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.CourseModule ADD CONSTRAINT
	FK_CourseModule_Course FOREIGN KEY
	(
	CourseId
	) REFERENCES dbo.Course
	(
	CourseId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.CourseModule ADD CONSTRAINT
	FK_CourseModule_Module FOREIGN KEY
	(
	ModuleId
	) REFERENCES dbo.Module
	(
	ModuleId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.CourseModule SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.CourseModule', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.CourseModule', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.CourseModule', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.CourseTeacher
	(
	CourseId int NOT NULL,
	TeacherId int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.CourseTeacher ADD CONSTRAINT
	FK_CourseTeacher_Course FOREIGN KEY
	(
	CourseId
	) REFERENCES dbo.Course
	(
	CourseId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.CourseTeacher ADD CONSTRAINT
	FK_CourseTeacher_Teacher FOREIGN KEY
	(
	TeacherId
	) REFERENCES dbo.Teacher
	(
	TeacherId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.CourseTeacher SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.CourseTeacher', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.CourseTeacher', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.CourseTeacher', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.CourseStudent
	(
	CourseId int NOT NULL,
	StudentId int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.CourseStudent ADD CONSTRAINT
	FK_CourseStudent_Course FOREIGN KEY
	(
	CourseId
	) REFERENCES dbo.Course
	(
	CourseId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.CourseStudent ADD CONSTRAINT
	FK_CourseStudent_Student FOREIGN KEY
	(
	StudentId
	) REFERENCES dbo.Student
	(
	StudentId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.CourseStudent SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.CourseStudent', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.CourseStudent', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.CourseStudent', 'Object', 'CONTROL') as Contr_Per 