@echo off
setlocal enabledelayedexpansion

:: ---------------------------------------------------------------------------
:: PubNoteInText2XML.bat
::
:: A batch file for processing a PubNote in/submission text input file into
:: an equivalent XML file.
::
:: Supports an optional language suffix (e.g., -en, -fr, -de, -short), passed
:: as the first argument.
::
:: Usage:
::   PubNoteInText2XML.bat [-suffix] file.txt
::
:: ---------------------------------------------------------------------------

:: Get repo root by assuming script is in repo\windows
set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "REPO=%%~fI"

:: Optional suffix like -en, -fr, -de, -short
set "SUFFIX="
echo %1 | findstr "^-" >nul
if %errorlevel%==0 (
  set "SUFFIX=%1"
  shift
)

:: Require input file
if "%~1"=="" goto :usage
if not exist "%~1" (
    echo File "%~1" not found.
    echo.
    goto :usage
)

set "FILEDIR=%~dp1"
set "INPUT=%~nx1"
set "INPUTBASE=%~n1"

set "MODELIXML=%REPO%\ixml\PubMedIn%SUFFIX%.ixml"
set "MODELXSLT=%REPO%\ixml\PubMedIn-ixml2xml.xsl"

call "%REPO%\Crane-txt2xml\windows\Crane-txt2xml.bat" "%MODELIXML%" "%MODELXSLT%" "%~1" "%~1.xml"
exit /b %errorlevel%

:usage
echo Usage: PubNoteInText2XML%SUFFIX%.bat file.txt
exit /b 1
