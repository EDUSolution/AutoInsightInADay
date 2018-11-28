EXEC [SSISDB].[catalog].[create_environment] @environment_name=N'Production', @environment_description=N'', @folder_name=N'iiad_ETL'

GO

DECLARE @var sql_variant = N'AtRiskDW'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'DWDatabase', @sensitive=False, @description=N'', @environment_name=N'Production', @folder_name=N'iiad_ETL', @value=@var, @data_type=N'String'
GO
DECLARE @var sql_variant = N'pass@word!972'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'DWPassword', @sensitive=True, @description=N'', @environment_name=N'Production', @folder_name=N'iiad_ETL', @value=@var, @data_type=N'String'
GO
DECLARE @var sql_variant = N'pleblanc'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'DWUserName', @sensitive=False, @description=N'', @environment_name=N'Production', @folder_name=N'iiad_ETL', @value=@var, @data_type=N'String'
GO
DECLARE @var sql_variant = N'iiad-database.windows.net'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'DWServer', @sensitive=False, @description=N'', @environment_name=N'Production', @folder_name=N'iiad_ETL', @value=@var, @data_type=N'String'
GO
DECLARE @var sql_variant = N'SIS'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'SourceDatabase', @sensitive=False, @description=N'', @environment_name=N'Production', @folder_name=N'iiad_ETL', @value=@var, @data_type=N'String'
GO
DECLARE @var sql_variant = N'pass@word!972'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'SourcePassword', @sensitive=True, @description=N'', @environment_name=N'Production', @folder_name=N'iiad_ETL', @value=@var, @data_type=N'String'
GO
DECLARE @var sql_variant = N'pleblanc'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'SourceUserName', @sensitive=False, @description=N'', @environment_name=N'Production', @folder_name=N'iiad_ETL', @value=@var, @data_type=N'String'
GO
DECLARE @var sql_variant = N'iiad.database.windows.net'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'SourceServer', @sensitive=False, @description=N'', @environment_name=N'Production', @folder_name=N'iiad_ETL', @value=@var, @data_type=N'String'
GO

DECLARE @var bit = N'False'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'InitialLoad', @sensitive=False, @description=N'', @environment_name=N'Production', @folder_name=N'iiad_ETL', @value=@var, @data_type=N'Boolean'
GO

DECLARE @var sql_variant = N'asazure://southcentralus.asazure.windows.net/iiad'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'TabularServer', @sensitive=False, @description=N'', @environment_name=N'Production', @folder_name=N'iiad_ETL', @value=@var, @data_type=N'String'
GO

DECLARE @var sql_variant = N'iiad_AtRisk'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'TabularDatabase', @sensitive=False, @description=N'', @environment_name=N'Production', @folder_name=N'iiad_ETL', @value=@var, @data_type=N'String'
GO


---Add Reference to Environment
--EXEC [SSISDB].[catalog].[delete_environment_reference] @reference_id=1
Declare @reference_id bigint
EXEC [SSISDB].[catalog].[create_environment_reference] @environment_name=N'Production', @environment_folder_name=N'iiad_ETL', @reference_id=@reference_id OUTPUT, @project_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @reference_type=A
Select @reference_id

GO

EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'DWDatabase', @object_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @value_type=R, @parameter_value=N'DWDatabase'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'DWPassword', @object_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @value_type=R, @parameter_value=N'DWPassword'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'DWServer', @object_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @value_type=R, @parameter_value=N'DWServer'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'DWUserName', @object_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @value_type=R, @parameter_value=N'DWUserName'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'InitialLoad', @object_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @value_type=R, @parameter_value=N'InitialLoad'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'SourceDatabase', @object_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @value_type=R, @parameter_value=N'SourceDatabase'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'SourcePassword', @object_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @value_type=R, @parameter_value=N'SourcePassword'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'SourceServer', @object_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @value_type=R, @parameter_value=N'SourceServer'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'SourceUserName', @object_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @value_type=R, @parameter_value=N'SourceUserName'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'TabularServer', @object_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @value_type=R, @parameter_value=N'TabularServer'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'TabularDatabase', @object_name=N'AtRisk.SSIS', @folder_name=N'iiad_ETL', @project_name=N'AtRisk.SSIS', @value_type=R, @parameter_value=N'TabularDatabase'
GO
GO




