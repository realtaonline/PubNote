@echo off
setlocal enabledelayedexpansion

:: ---------------------------------------------------------------------------
:: PubNoteOutExtract.bat
::
:: Extracts the individual XML Article files embedded in a PubNote
:: distribution XML ArticleSet document (or copies a single Article
:: document).
::
:: Usage:
::   PubNoteOutExtract.bat file.xml [indent=yes]
::
:: The output file is placed in a subdirectory named after the input file.
::
:: Errors are recorded in a log file in the input file directory.
::
:: ---------------------------------------------------------------------------

:: Get repo root by assuming script is in repo\shell
set "THIS=%~dp0"
set "REPO=%THIS%.."

:: Require input file
if "%~1"=="" goto :usage
if not exist "%~1" (
    echo ERROR: File "%~1" not found.
    goto :usage
)

:: Input details
set "INPUT=%~nx1"
set "INPUTBASE=%~n1"
set "FILEDIR=%~dp1"

:: Paths
set "SAXON_JAR=%THIS%\..\utilities\saxonhe\saxonhe.jar"
set "XSL=%THIS%\..\xsl\PubNoteOutExtract.xsl"
set "LOG=%FILEDIR%\%~nx1.extract.log.txt"

echo Extracting "%FILEDIR%\%INPUT%" to ""%FILEDIR%\%INPUTBASE%\"...

java -jar "%SAXON_JAR%" -s:"%FILEDIR%\%INPUT%" -xsl:"%XSL%" %2 %3 %4 %5 %6 %7 %8 %9 2> %LOG%
set RETVAL=%ERRORLEVEL%

:: Check result
if "%RETVAL%" == "0" (
  echo No extraction errors
  del %LOG%
) else (
  echo Extraction errors:
  type "%LOG%"
)


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

:usage
echo Usage: PubNoteOutExtract.bat distributionFile.xml [indent=yes] [start=###] [end=###]
exit /b 1
