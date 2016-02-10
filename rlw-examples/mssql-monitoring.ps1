# ---
# RightScript Name: DB SQLS Install monitors
# Description: Installs Microsoft SQL Server specific monitoring. 
#
rsc rl10 create /rll/tss/exec/mssql_monitor executable=[System.IO.Path]::GetFullPath(".\attachments\mssql-monitor.ps1")
