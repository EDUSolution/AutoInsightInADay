IF(OBJECT_ID('dbo.FactDailyIncident_cy')) IS NOT NULL
	DROP TABLE dbo.FactDailyIncident_cy
GO
IF(OBJECT_ID('dbo.FactDailyIncident_pys')) IS NOT NULL
	DROP TABLE dbo.FactDailyIncident_pys
GO
IF(OBJECT_ID('dbo.FactDailyAttendance_cy')) IS NOT NULL
	DROP TABLE dbo.FactDailyAttendance_cy
GO
IF(OBJECT_ID('dbo.FactDailyAttendance_pys')) IS NOT NULL
	DROP TABLE dbo.FactDailyAttendance_pys
GO
IF(OBJECT_ID('dbo.FactClassAttendance_cy')) IS NOT NULL
	DROP TABLE dbo.FactClassAttendance_cy
GO
IF(OBJECT_ID('dbo.FactClassAttendance_pys')) IS NOT NULL
	DROP TABLE dbo.FactClassAttendance_pys
GO

IF(OBJECT_ID('dbo.DimAction')) IS NOT NULL
	DROP TABLE dbo.DimAction
GO
CREATE TABLE dbo.DimAction
(
	ActionSK int identity(1,1)
		CONSTRAINT PK_DimAction_ActionSK PRIMARY KEY,
	ActionAK varchar(5),
	[Action] varchar(40)
)
GO

IF(OBJECT_ID('dbo.DimAttendanceType')) IS NOT NULL
	DROP TABLE dbo.DimAttendanceType
GO
CREATE TABLE dbo.DimAttendanceType
(
	AttendanceTypeSK int identity(1,1)
		CONSTRAINT PK_DimAttendance_AttendanceTypeSK PRIMARY KEY,
	AttendanceTypeAK varchar(5),
	AttendanceType varchar(40)
)
GO

IF(OBJECT_ID('dbo.DimCourse')) IS NOT NULL
	DROP TABLE dbo.DimCourse
GO
CREATE TABLE dbo.DimCourse
(
	CourseSK int identity(1,1)
		CONSTRAINT PK_DimCourse_CourseSK PRIMARY KEY,
	CourseAK bigint,
	CourseCode varchar(15),
	CourseName varchar(40)
)
GO

IF(OBJECT_ID('dbo.DimIncident')) IS NOT NULL
	DROP TABLE dbo.DimIncident
GO
CREATE TABLE dbo.DimIncident
(
	IncidentSK int identity(1,1)
		CONSTRAINT PK_DimIncident_IncidentSK PRIMARY KEY,
	IncidentAK varchar(5),
	Incident varchar(40)
)
GO

IF(OBJECT_ID('dbo.DimInvolvement')) IS NOT NULL
	DROP TABLE dbo.DimInvolvement
GO
CREATE TABLE dbo.DimInvolvement
(
	InvolvementSK int identity(1,1)
		CONSTRAINT PK_DimInvolvement_InvolvmentSK PRIMARY KEY,
	InvolvementAK varchar(5),
	Involvement varchar(20)
)
GO

IF(OBJECT_ID('dbo.DimSchool')) IS NOT NULL
	DROP TABLE dbo.DimSchool
GO
CREATE TABLE dbo.DimSchool
(
	SchoolSK int identity(1,1)
		CONSTRAINT PK_DimSchool_SchoolSK PRIMARY KEY,
	SchoolAK int,
	SchoolName varchar(40)
)
GO

IF(OBJECT_ID('dbo.DimStudent')) IS NOT NULL
	DROP TABLE dbo.DimStudent
GO
CREATE TABLE dbo.DimStudent
(
	StudentSK bigint identity(1,1)
		CONSTRAINT PK_DimStudent_StudentSK PRIMARY KEY,
	StudentAK bigint, 
	StudentName varchar(20), 
	Gender varchar(6), 
	FederalRaceCategory varchar(50), 
	PrimaryLanguage varchar(25), 
	GradeNum int, 
	Grade varchar(12), 
	CumulativeGPA varchar(50), 
	StartSchoolYear datetime, 
	EndSchoolYear datetime
)
GO


CREATE TABLE dbo.FactClassAttendance_pys
(
	ClassAttendancepysID int identity(1,1)		
		CONSTRAINT PK_FactClassAttendancepys_ClassAttendancepysID PRIMARY KEY,
	Term int,
	AttendanceDateSK int,
	StudentSK bigint,
		CONSTRAINT FK_CApys_To_DimStudent_On_StudentSK
			FOREIGN KEY (StudentSK) 
				REFERENCES dbo.DimStudent(StudentSK),
	SchoolSK int,
		CONSTRAINT FK_CApys_To_DimSchool_On_SchoolSK
			FOREIGN KEY (SchoolSK) 
				REFERENCES dbo.DimSchool(SchoolSK),
	CourseSK int,
		CONSTRAINT FK_CApys_To_DimSchool_On_CourseSK
			FOREIGN KEY (CourseSK) 
				REFERENCES dbo.DimCourse(CourseSK),
	AttendTypeSK int
		CONSTRAINT FK_CApys_To_DimSchool_On_AttendTypeSK
			FOREIGN KEY (AttendTypeSK) 
				REFERENCES dbo.DimAttendanceType(AttendanceTypeSK)
)
GO

CREATE TABLE dbo.FactClassAttendance_cy
(
	ClassAttendancecyID int identity(1,1)		
		CONSTRAINT PK_FactClassAttendancecy_ClassAttendancecyID PRIMARY KEY,
	Term int,
	AttendanceDateSK int,
	StudentSK bigint,
		CONSTRAINT FK_CAcy_To_DimStudent_On_StudentSK
			FOREIGN KEY (StudentSK) 
				REFERENCES dbo.DimStudent(StudentSK),
	SchoolSK int,
		CONSTRAINT FK_CAcy_To_DimSchool_On_SchoolSK
			FOREIGN KEY (SchoolSK) 
				REFERENCES dbo.DimSchool(SchoolSK),
	CourseSK int,
		CONSTRAINT FK_CAcy_To_DimSchool_On_CourseSK
			FOREIGN KEY (CourseSK) 
				REFERENCES dbo.DimCourse(CourseSK),
	AttendTypeSK int
		CONSTRAINT FK_CAcy_To_DimSchool_On_AttendTypeSK
			FOREIGN KEY (AttendTypeSK) 
				REFERENCES dbo.DimAttendanceType(AttendanceTypeSK)
)
GO

CREATE TABLE dbo.FactDailyAttendance_pys
(
	DailyAttendancepysID int identity(1,1)		
		CONSTRAINT PK_FactDailyAttendancepys_DailyAttendancepysID PRIMARY KEY,
	AttendanceDateSK int,
	StudentSK bigint,
		CONSTRAINT FK_DApys_To_DimStudent_On_StudentSK
			FOREIGN KEY (StudentSK) 
				REFERENCES dbo.DimStudent(StudentSK),
	SchoolSK int,
		CONSTRAINT FK_DApys_To_DimSchool_On_SchoolSK
			FOREIGN KEY (SchoolSK) 
				REFERENCES dbo.DimSchool(SchoolSK),
	NumOfPossiblePeriods int,
	NumOfTardies int,
	NumofUnexcusedAbsent int,
	NumofExcusedAbsent int
)
GO

CREATE TABLE dbo.FactDailyAttendance_cy
(
	DailyAttendancecyID int identity(1,1)		
		CONSTRAINT PK_FactDailyAttendancecy_DailyAttendancecyID PRIMARY KEY,
	AttendanceDateSK int,
	StudentSK bigint,
		CONSTRAINT FK_DAcy_To_DimStudent_On_StudentSK
			FOREIGN KEY (StudentSK) 
				REFERENCES dbo.DimStudent(StudentSK),
	SchoolSK int,
		CONSTRAINT FK_DAcy_To_DimSchool_On_SchoolSK
			FOREIGN KEY (SchoolSK) 
				REFERENCES dbo.DimSchool(SchoolSK),
	NumOfPossiblePeriods int,
	NumOfTardies int,
	NumofUnexcusedAbsent int,
	NumofExcusedAbsent int
)
GO

CREATE TABLE dbo.FactDailyIncident_pys
(
	DailyIncidentpysID int identity(1,1)		
		CONSTRAINT PK_FactDailyIncidentpys_DailyIncidentepysID PRIMARY KEY,
	IncidentDateSK int,
	StudentSK bigint,
		CONSTRAINT FK_DIpys_To_DimStudent_On_StudentSK
			FOREIGN KEY (StudentSK) 
				REFERENCES dbo.DimStudent(StudentSK),
	SchoolSK int,
		CONSTRAINT FK_DIpys_To_DimSchool_On_SchoolSK
			FOREIGN KEY (SchoolSK) 
				REFERENCES dbo.DimSchool(SchoolSK),
	IncidentSK int,
		CONSTRAINT FK_DIpys_To_DimSchool_On_IncidentSK
			FOREIGN KEY (IncidentSK) 
				REFERENCES dbo.DimIncident(IncidentSK),
	InvolvementSK int,
		CONSTRAINT FK_DIpys_To_DimSchool_On_InvolvementSK
			FOREIGN KEY (InvolvementSK) 
				REFERENCES dbo.DimInvolvement(InvolvementSK),
	ActionSK int
		CONSTRAINT FK_DIpys_To_DimSchool_On_ActionSK
			FOREIGN KEY (ActionSK) 
				REFERENCES dbo.DimAction(ActionSK)
)
GO

CREATE TABLE dbo.FactDailyIncident_cy
(
	DailyIncidentcyID int identity(1,1)		
		CONSTRAINT PK_FactDailyIncidentcy_DailyIncidentecyID PRIMARY KEY,
	IncidentDateSK int,
	StudentSK bigint,
		CONSTRAINT FK_DIcy_To_DimStudent_On_StudentSK
			FOREIGN KEY (StudentSK) 
				REFERENCES dbo.DimStudent(StudentSK),
	SchoolSK int,
		CONSTRAINT FK_DIcy_To_DimSchool_On_SchoolSK
			FOREIGN KEY (SchoolSK) 
				REFERENCES dbo.DimSchool(SchoolSK),
	IncidentSK int,
		CONSTRAINT FK_DIcy_To_DimSchool_On_IncidentSK
			FOREIGN KEY (IncidentSK) 
				REFERENCES dbo.DimIncident(IncidentSK),
	InvolvementSK int,
		CONSTRAINT FK_DIcy_To_DimSchool_On_InvolvementSK
			FOREIGN KEY (InvolvementSK) 
				REFERENCES dbo.DimInvolvement(InvolvementSK),
	ActionSK int
		CONSTRAINT FK_DIcy_To_DimSchool_On_ActionSK
			FOREIGN KEY (ActionSK) 
				REFERENCES dbo.DimAction(ActionSK)
)
GO

---------------------------------------------------------------------------
IF(OBJECT_ID('dbo.StageClassAttendance')) IS NOT NULL
	DROP TABLE dbo.StageClassAttendance
GO
CREATE TABLE dbo.StageClassAttendance
(
	StageClassAttendance int identity(1,1)		
		CONSTRAINT PK_StageClassAttendance_StageClassAttendance PRIMARY KEY,
	Term int,
	AttendanceDate datetime,
	AttendanceDateSK int,
	StudentID bigint,
	SchoolID int,
	CourseID bigint,
	AttendTypeID varchar(5)
)
GO

IF(OBJECT_ID('dbo.StageDailyAttendance')) IS NOT NULL
	DROP TABLE dbo.StageDailyAttendance
GO
CREATE TABLE dbo.StageDailyAttendance
(
	StageDailyAttendance int identity(1,1)		
		CONSTRAINT PK_StageDailyAttendance_StageDailyAttendance PRIMARY KEY,
	AttendanceDate datetime,
	AttendanceDateSK int,
	StudentID bigint,
	SchoolID int,
	NumOfPossiblePeriods int,
	NumOfTardies int,
	NumofUnexcusedAbsent int,
	NumofExcusedAbsent int
)
GO

IF(OBJECT_ID('dbo.StageDailyIncident')) IS NOT NULL
	DROP TABLE dbo.StageDailyIncident
GO
CREATE TABLE dbo.StageDailyIncident
(
	StageDailyIncident int identity(1,1)		
		CONSTRAINT PK_StageDailyIncident_StageDailyIncident PRIMARY KEY,
	IncidentDate datetime,
	IncidentDateSK int,
	StudentID bigint,
	SchoolID int,
	IncidentID varchar(5),
	InvolvementID varchar(5),
	ActionID varchar(5)
)
GO

IF(OBJECT_ID('dbo.LoadClassAttendance')) IS NOT NULL
	DROP VIEW dbo.LoadClassAttendance
GO
CREATE VIEW dbo.LoadClassAttendance
AS
SELECT	
	ISNULL(sca.Term, -1) Term,
	ISNULL(sca.AttendanceDateSK, 190001010) AttendanceDateSK,
	ISNULL(st.StudentSK, -1) StudentSK,
	ISNULL(sc.SchoolSK, -1) SchoolSK,
	ISNULL(c.CourseSK, -1) CourseSK,
	ISNULL(a.[AttendanceTypeSK], -1) AttendanceTypeSK
FROM dbo.StageClassAttendance sca
LEFT OUTER JOIN dbo.DimStudent st
	ON sca.StudentID = st.StudentAK AND
	sca.AttendanceDate BETWEEN st.StartSchoolYear and st.EndSchoolYear
LEFT OUTER JOIN dbo.DimSchool sc
	ON sca.SchoolID = sc.SchoolAK
LEFT OUTER JOIN dbo.DimCourse c
	ON sca.CourseID = c.CourseAK
LEFT OUTER JOIN DimAttendanceType a
	ON sca.AttendTypeID = a.[AttendanceTypeAK]
GO

IF(OBJECT_ID('dbo.LoadDailyAttendance')) IS NOT NULL
	DROP VIEW dbo.LoadDailyAttendance
GO
CREATE VIEW dbo.LoadDailyAttendance
AS
SELECT	
	ISNULL(sda.AttendanceDateSK, 190001010) AttendanceDateSK,
	ISNULL(st.StudentSK, -1) StudentSK,
	ISNULL(sc.SchoolSK, -1) SchoolSK,
	NumOfPossiblePeriods,
	NumofUnexcusedAbsent,
	NumofExcusedAbsent,
	NumOfTardies
FROM dbo.StageDailyAttendance sda
LEFT OUTER JOIN dbo.DimStudent st
	ON sda.StudentID = st.StudentAK AND
	sda.AttendanceDate BETWEEN st.StartSchoolYear and st.EndSchoolYear
LEFT OUTER JOIN dbo.DimSchool sc
	ON sda.SchoolID = sc.SchoolAK
GO

IF(OBJECT_ID('dbo.LoadDailyIncident')) IS NOT NULL
	DROP VIEW dbo.LoadDailyIncident
GO
CREATE VIEW dbo.LoadDailyIncident
AS
SELECT	
	ISNULL(sdi.IncidentDateSK, 190001010) IncidentDateSK,
	ISNULL(st.StudentSK, -1) StudentSK,
	ISNULL(sc.SchoolSK, -1) SchoolSK,
	ISNULL(i.IncidentSK, -1) IncidentSK,
	ISNULL(inv.InvolvementSK, -1) InvolvementSK,
	ISNULL(a.ActionSK, -1) ActionSK
FROM dbo.StageDailyIncident sdi
LEFT OUTER JOIN dbo.DimStudent st
	ON sdi.StudentID = st.StudentAK AND
	sdi.IncidentDate BETWEEN st.StartSchoolYear and st.EndSchoolYear
LEFT OUTER JOIN dbo.DimSchool sc
	ON sdi.SchoolID = sc.SchoolAK
LEFT OUTER JOIN dbo.DimIncident i
	ON sdi.IncidentID = i.IncidentAK
LEFT OUTER JOIN dbo.DimInvolvement inv
	ON sdi.InvolvementID = inv.InvolvementAK
LEFT OUTER JOIN dbo.DimAction a
	ON sdi.ActionID = a.ActionAK
GO

------------------------------------------------------------------
IF(OBJECT_ID('dbo.FactDailyIncident')) IS NOT NULL
	DROP VIEW dbo.FactDailyIncident
GO
CREATE VIEW dbo.FactDailyIncident
AS
SELECT *, 1 CY FROM FactDailyIncident_cy
UNION
SELECT *, 0 CY FROM FactDailyIncident_pys
WHERE IncidentDateSK BETWEEN 20160701 AND 20170630
GO

IF(OBJECT_ID('dbo.FactDailyAttendance')) IS NOT NULL
	DROP VIEW dbo.FactDailyAttendance
GO
CREATE VIEW dbo.FactDailyAttendance
AS
SELECT *, 1 CY FROM FactDailyAttendance_cy
UNION
SELECT *, 0 CY FROM FactDailyAttendance_pys
WHERE AttendanceDateSK BETWEEN 20160701 AND 20170630
GO

IF(OBJECT_ID('dbo.FactClassAttendance')) IS NOT NULL
	DROP VIEW dbo.FactClassAttendance
GO
CREATE VIEW dbo.FactClassAttendance
AS
SELECT *, 1 CY FROM FactClassAttendance_cy
UNION
SELECT *, 0 CY FROM FactClassAttendance_pys
WHERE AttendanceDateSK BETWEEN 20160701 AND 20170630
GO