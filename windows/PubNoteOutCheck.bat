@echo off
setlocal enabledelayedexpansion

:: ---------------------------------------------------------------------------
:: PubNoteOutCheck.bat
::
:: A batch file for validating a PubNote distribution XML output file.
::
:: Usage:
::   PubNoteOutCheck.bat file.xml
::
:: Errors are recorded in a log file in the input file directory.
::
:: ---------------------------------------------------------------------------

:: Get repo root by assuming script is in repo\shell
set "SCRIPT_DIR=%~dp0"
set "REPO=%SCRIPT_DIR%.."

:: Require input file
if "%~1"=="" goto :usage
if not exist "%~1" (
    echo ERROR: File "%~1" not found.
    goto :usage
)

set "INPUT=%~nx1"
set "FILEDIR=%~dp1"
set "JING_JAR=%REPO%\utilities\jing\bin\jing.jar"
set "RNG=%REPO%\rng\PubMedOut.rng"
set "LOG=%FILEDIR%%INPUT%.out.log.txt"

echo Validating "%FILEDIR%%INPUT%" using "%RNG%" to "%LOG%"...

:: Delete existing log if present
if exist "%LOG%" del "%LOG%"

:: Validate and capture stdout to log
java -jar "%JING_JAR%" "%RNG%" "%FILEDIR%%INPUT%" > "%LOG%"
set "RETVAL=%ERRORLEVEL%"

:: If the log file exists, show its contents
if exist "%LOG%" (
    type "%LOG%"
    for %%F in ("%LOG%") do (
        if %%~zF==0 del "%LOG%"
    )
)

:: Check validation
if "%RETVAL%" == "0" (
  echo No validation errors
) else (
  echo Validation errors:
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

pause

:end
exit /b %RETVAL%

:usage
echo Usage: PubNoteCheckOut.bat distributionFile.xml
exit /b 1
