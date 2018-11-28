--USE your SIS Database
DROP PROC IF EXISTS dbo.dw_ClassAttendance_cy
GO
CREATE PROC dbo.dw_ClassAttendance_cy
AS
DECLARE
	@StartDate datetime,
	@EndDate datetime

IF(MONTH(GETDATE()) > 7)
	BEGIN
		SELECT
			@StartDate = '7/1/'+CAST(YEAR(GETDATE()) AS VARCHAR),
			@EndDate = '6/30/'+CAST(YEAR(GETDATE())+1 AS VARCHAR)
	END
ELSE
	BEGIN
		SELECT
			@StartDate = '7/1/'+CAST(YEAR(GETDATE())-1 AS VARCHAR),
			@EndDate = '6/30/'+CAST(YEAR(GETDATE()) AS VARCHAR)
	END

SELECT
	Term,
	CAST(AttendanceDate AS DATETIME) AttendanceDate,
	CAST(CONVERT(varchar(8), AttendanceDate, 112) AS INT) AttendanceDateSK,
	CAST(StudentID AS BIGINT) StudentID,
	CAST(SchoolID AS INT) SchoolID,
	CAST(CourseID AS BIGINT) CourseID,
	CAST(AttendTypeID AS VARCHAR(5)) AttendTypeID
FROM [dbo].[vw_pbiClassAttendance]
WHERE AttendanceDate BETWEEN @StartDate AND @EndDate
GO


--------------------------------------------------------------------------------
DROP PROC IF EXISTS dbo.dw_ClassAttendance_pys
GO
CREATE PROC dbo.dw_ClassAttendance_pys
AS
DECLARE
	@LastDayOfSY datetime

IF(MONTH(GETDATE()) > 7)
	BEGIN
		SELECT
			@LastDayOfSY = '6/30/'+CAST(YEAR(GETDATE()) AS VARCHAR)
	END
ELSE
	BEGIN
		SELECT
			@LastDayOfSY = '6/30/'+CAST(YEAR(GETDATE())-1 AS VARCHAR)
	END

SELECT
	Term ,
	CAST(AttendanceDate AS DATETIME) AttendanceDate,
	CAST(CONVERT(varchar(8), AttendanceDate, 112) AS INT) AttendanceDateSK,
	CAST(StudentID AS BIGINT) StudentID,
	CAST(SchoolID AS INT) SchoolID,
	CAST(CourseID AS BIGINT) CourseID,
	CAST(AttendTypeID AS VARCHAR(5)) AttendTypeID
FROM [dbo].[vw_pbiClassAttendance]
WHERE AttendanceDate <= @LastDayOfSY 
GO


--------------------------------------------------------------------------
DROP PROC IF EXISTS dbo.dw_DailyIncident_pys
GO
CREATE PROC dbo.dw_DailyIncident_pys
AS
DECLARE
	@LastDayOfSY datetime

IF(MONTH(GETDATE()) > 7)
	BEGIN
		SELECT
			@LastDayOfSY = '6/30/'+CAST(YEAR(GETDATE()) AS VARCHAR)
	END
ELSE
	BEGIN
		SELECT
			@LastDayOfSY = '6/30/'+CAST(YEAR(GETDATE())-1 AS VARCHAR)
	END


SELECT 
	CAST(StudentID AS BIGINT) StudentID,
	CAST(SchoolID AS INT) SchoolID,
	CAST(IncidentID AS VARCHAR(5)) IncidentID,
	CAST(InvolvementID AS VARCHAR(5)) InvolvmentID,
	CAST(IncidentDate AS DATETIME) IncidentDate,
	CAST(CONVERT(varchar(8), IncidentDate, 112) AS INT) IncidentDateSK,
	CAST(ActionID AS VARCHAR(5)) ActionID
FROM dbo.vw_pbiDailyIncident
WHERE IncidentDate <= @LastDayOfSY
GO

--------------------------------------------------------------------------
DROP PROC IF EXISTS dbo.dw_DailyIncident_cy
GO
CREATE PROC [dbo].[dw_DailyIncident_cy]
AS
DECLARE
	@StartDate datetime,
	@EndDate datetime

IF(MONTH(GETDATE()) > 7)
	BEGIN
		SELECT
			@StartDate = '7/1/'+CAST(YEAR(GETDATE()) AS VARCHAR),
			@EndDate = '6/30/'+CAST(YEAR(GETDATE())+1 AS VARCHAR)
	END
ELSE
	BEGIN
		SELECT
			@StartDate = '7/1/'+CAST(YEAR(GETDATE())-1 AS VARCHAR),
			@EndDate = '6/30/'+CAST(YEAR(GETDATE()) AS VARCHAR)
	END


SELECT 
	CAST(StudentID AS BIGINT) StudentID,
	CAST(SchoolID AS INT) SchoolID,
	CAST(IncidentID AS VARCHAR(5)) IncidentID,
	CAST(InvolvementID AS VARCHAR(5)) InvolvmentID,
	CAST(IncidentDate AS DATETIME) IncidentDate,
	CAST(CONVERT(varchar(8), IncidentDate, 112) AS INT) IncidentDateSK,
	CAST(ActionID AS VARCHAR(5)) ActionID
FROM dbo.vw_pbiDailyIncident
WHERE IncidentDate BETWEEN @StartDate AND @EndDate
GO

-------------------------------------------------------------------------------------
DROP PROC IF EXISTS dbo.dw_DailyAttendance_cy
GO
CREATE PROC dbo.dw_DailyAttendance_cy
AS
DECLARE
	@StartDate datetime,
	@EndDate datetime

IF(MONTH(GETDATE()) > 7)
	BEGIN
		SELECT
			@StartDate = '7/1/'+CAST(YEAR(GETDATE()) AS VARCHAR),
			@EndDate = '6/30/'+CAST(YEAR(GETDATE())+1 AS VARCHAR)
	END
ELSE
	BEGIN
		SELECT
			@StartDate = '7/1/'+CAST(YEAR(GETDATE())-1 AS VARCHAR),
			@EndDate = '6/30/'+CAST(YEAR(GETDATE()) AS VARCHAR)
	END

SELECT 
	CAST(SchoolID AS INT) SchoolID,
	CAST(AttendanceDate AS DATETIME) AttendanceDate,
	CAST(CONVERT(varchar(8), AttendanceDate, 112) AS INT) AttendanceDateSK,
	CAST(StudentID AS BIGINT) StudentID,
	NumofPossiblePeriods,
	NumofTardies,
	NumofUnexcusedAbsent,
	NumofExcusedAbsent
FROM dbo.vw_pbiDailyAttendance
WHERE AttendanceDate BETWEEN @StartDate AND @EndDate
GO

--------------------------------------------------------------------------------

DROP PROC IF EXISTS dbo.dw_DailyAttendance_pys
GO
CREATE PROC dbo.dw_DailyAttendance_pys
AS
DECLARE
	@LastDayOfSY datetime

IF(MONTH(GETDATE()) > 7)
	BEGIN
		SELECT
			@LastDayOfSY = '6/30/'+CAST(YEAR(GETDATE()) AS VARCHAR)
	END
ELSE
	BEGIN
		SELECT
			@LastDayOfSY = '6/30/'+CAST(YEAR(GETDATE())-1 AS VARCHAR)
	END
SELECT 
	CAST(SchoolID AS INT) SchoolID,
	CAST(AttendanceDate AS DATETIME) AttendanceDate,
	CAST(CONVERT(varchar(8), AttendanceDate, 112) AS INT) AttendanceDateSK,
	CAST(StudentID AS BIGINT) StudentID,
	NumofPossiblePeriods,
	NumofTardies,
	NumofUnexcusedAbsent,
	NumofExcusedAbsent
FROM vw_pbiDailyAttendance
WHERE AttendanceDate <= @LastDayOfSY 
GO




