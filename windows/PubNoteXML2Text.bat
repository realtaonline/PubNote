@echo off
setlocal enabledelayedexpansion

:: ---------------------------------------------------------------------------
:: PubNoteXML2Text.bat
::
:: Converts a PubNote XML file into an editable text file, with optional
:: markdown mixed-content rendering.
::
:: Supports an optional language suffix (e.g., -en, -fr, -de, -short) passed
:: as the first argument, for translating the element and attribute names
:: into labels, otherwise the raw XML names are used as labels.
::
:: Supports an optional indication to use markdown instead of elements in the
:: mixed content, passed as MARKDOWN=markdown=yes in the environment.
::
:: Usage:
::   PubNoteXML2Text.bat [-suffix] file.xml
::
:: Output files are placed in a subdirectory named after the input file.
::
:: ---------------------------------------------------------------------------

:: Get repo root by assuming script is in repo\windows
set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "REPO=%%~fI"

:: Check for optional -suffix argument like -en, -fr, -de, -short
set "SUFFIX="
echo %1 | findstr "^-" >nul
if %errorlevel%==0 (
  set "SUFFIX=%1"
  shift
)

set "MARKDOWNSUFFIX="
if not "%MARKDOWN%"=="" set "MARKDOWNSUFFIX=-markdown"

if "%~1"=="" (
  echo Usage: %~nx0 inputXMLname 1>&2
  echo See script header for full details 1>&2
  exit /b 1
)

if not exist "%~1" (
  echo Input XML "%~1" not found
  exit /b 1
)

set "FILEDIR=%~dp1"
set "INPUT=%~nx1"
set "INPUTBASE=%~n1"
set "OUTPUT=%FILEDIR%%INPUTBASE%\%INPUT%%MARKDOWNSUFFIX%%SUFFIX%.txt"

:: Remove any old result file
if exist "%OUTPUT%" del "%OUTPUT%"

java -cp "%REPO%\utilities\saxonhe\saxonhe.jar" net.sf.saxon.Transform -s:"%~1" -xsl:"%REPO%\xsl\PubNote-xml2txt%SUFFIX%.xsl" -o:"%OUTPUT%" labels=no %MARKDOWN%
set RETVAL=%errorlevel%

REM Check for "batch=yes" as the last argument
set "LASTARG="

:loop
if "%~1"=="" goto afterloop
set "LASTARG=%~1"
shift
goto loop

:afterloop
if /i "%LASTARG%"=="batch=yes" goto end
echo >con ...
pause

:end
exit /b %RETVAL%
