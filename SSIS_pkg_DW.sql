CREATE PROC dbo.LoadATRiskDW

AS
Declare @execution_id bigint
EXEC [SSISDB].[catalog].[create_execution] @package_name=N'MasterDWLoad.dtsx', @execution_id=@execution_id OUTPUT, @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @use32bitruntime=False, @reference_id=4, @useanyworker=True, @runinscaleout=True
Select @execution_id
DECLARE @var0 smallint = 1
EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id,  @object_type=50, @parameter_name=N'LOGGING_LEVEL', @parameter_value=@var0
EXEC [SSISDB].[catalog].[start_execution] @execution_id,  @retry_count=0
GO

