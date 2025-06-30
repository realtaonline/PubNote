@echo off
REM fop.bat - FOP launcher with auto-generated Windows config

SETLOCAL

REM Resolve absolute path to this script (strip trailing backslash)
SET "THIS=%~dp0"
IF "%THIS:~-1%"=="\" SET "THIS=%THIS:~0,-1%"

REM Convert backslashes to forward slashes and prepend file URI prefix
SET "THIS_URI=file:///%THIS:\=/%"

REM Debug line
REM ECHO THIS=%THIS%
REM ECHO THIS_URI=%THIS_URI%

REM Define paths
SET "TEMPLATE=%THIS%\fop-config.template.xml"
SET "CONFIG=%THIS%\fop-config.windows.xml"
SET "FOP=%THIS%\..\fop-2.11\fop-2.11\fop.bat"

REM Create config only if it doesn't already exist
IF NOT EXIST "%CONFIG%" (
    powershell -NoProfile -Command ^
      "$content = Get-Content -Raw '%TEMPLATE%';" ^
      "$thisDir = '%THIS_URI%';" ^
      "$content -replace '\{\{REPO_DIR\}\}', $thisDir | Set-Content -NoNewline '%CONFIG%'"
)

REM Call FOP with the config
CALL "%FOP%" -c "%CONFIG%" %*
ENDLOCAL
