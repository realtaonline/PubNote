@echo off
:: ---------------------------------------------------------------------------
:: PubNoteRender-en.bat
::
:: A Windows batch script for processing a PubNote XML input file into
:: PDF, HTML, and DOCX outputs using Saxon, FOP, and Wordinator.
::
:: Supports an optional language suffix (e.g., -fr, -de) passed as the
:: first argument, and handles transformation, rendering, and cleanup.
::
:: Usage:
::   PubNoteRender-en.bat [-suffix] file.xml [batch=yes]
::
:: If "batch=yes" is provided as the last argument, the script suppresses
:: the pause prompt after execution.
::
:: Output files are placed in a subdirectory named after the input file.
:: Temporary/intermediate files are cleaned unless "debug.txt" is found
:: in the input directory.
::
:: ---------------------------------------------------------------------------

setlocal enabledelayedexpansion

:: Get absolute path to repo root (parent of script dir)
set "THIS=%~dp0"
if "%THIS:~-1%"=="\" set "THIS=%THIS:~0,-1%"
for %%I in ("%THIS%\..") do set "REPO=%%~fI"

:: Optional suffix like -fr, -de, -us
set "SUFFIX=-en"

:: Check for optional -suffix
echo %1 | findstr "^-" >nul
if %errorlevel%==0 (
  set "SUFFIX=%1"
  shift
)

:: Require input file
if "%~1"=="" (
  echo Usage: PubNoteRender.bat [-suffix] file.xml
  exit /b 1
)

:: Input info
set "INPUT=%~nx1"
set "INPUTNAME=%~n1"
set "INPUTDIR=%~dp1"
set "WORKDIR=%INPUTDIR%%INPUTNAME%"
set "SWPXDIR=%WORKDIR%\%INPUT%%SUFFIX%"

:: File paths
set "SAXON_JAR=%REPO%\utilities\saxon12he\saxon12he.jar"
set "WORDINATOR_JAR=%REPO%\utilities\wordinator\wordinator-1.1.1-fat.jar"
set "XSLDIR=%REPO%\xsl"
set "XSLRENDER=%XSLDIR%\PubNoteRender%SUFFIX%.xsl"
set "SCRUBXSL=%XSLDIR%\scrubPubNote.xsl"
set "PN2HTML=%XSLDIR%\pnfo2html.xsl"
set "HTML2SWPX=%XSLDIR%\html2swpx.xsl"
set "FOP=%REPO%\utilities\fop\fop.bat"
set "DOTX=%REPO%\dev\PubNoteRender.dotx"

:: Outputs
set "FO=%WORKDIR%\%INPUT%%SUFFIX%.fo"
set "FOPFO=%WORKDIR%\%INPUT%%SUFFIX%.fop.fo"
set "PDF=%WORKDIR%\%INPUT%%SUFFIX%.pdf"
set "HTML=%WORKDIR%\%INPUT%%SUFFIX%.html"
set "DOCX=%WORKDIR%\%INPUT%%SUFFIX%.docx"
set "DOCX_TEMP=%SWPXDIR%\%INPUT%%SUFFIX%.docx"
set "SWPX=%SWPXDIR%\%INPUT%%SUFFIX%.swpx"
set "LOG=%INPUTDIR%\%INPUT%%SUFFIX%.pdf.log.txt"
set "DEBUG=%INPUTDIR%\debug.txt"

echo Rendering "%INPUTDIR%%INPUT%" using "%XSLRENDER%" to "%PDF%"...

:: Create work directories
if not exist "%WORKDIR%" mkdir "%WORKDIR%"
if not exist "%SWPXDIR%" mkdir "%SWPXDIR%"

:: Delete outputs
del /q "%FOPFO%" 2>nul
del /q "%FO%"    2>nul
del /q "%PDF%"   2>nul
del /q "%LOG%"   2>nul

:: Transform XML to FO
echo Transform XML to FO...
echo Transform XML to FO... >"%LOG%"
java -jar "%SAXON_JAR%" -s:"%INPUTDIR%%INPUT%" -xsl:"%XSLRENDER%" -o:"%FO%" 2>>"%LOG%"
if errorlevel 1 (
  echo Saxon execution error creating XSL-FO >>"%LOG%"
  goto fail
)

:: Scrub FO to FOP FO
echo Transform FO to FOP FO... >>"%LOG%"
echo Transform FO to FOP FO...
java -jar "%SAXON_JAR%" -s:"%FO%" -xsl:"%SCRUBXSL%" -o:"%FOPFO%" 2>>"%LOG%"
if errorlevel 1 (
  echo Saxon execution error scrubbing XSL-FO >>"%LOG%"
  goto fail
)

:: Render PDF
echo Render FOP FO to PDF...
echo Render FOP FO to PDF... >>"%LOG%"
pushd "%REPO%" >nul
call "%FOP%" -fo "%FOPFO%" -pdf "%PDF%" 2>>"%LOG%"
popd >nul
if errorlevel 1 (
  echo FOP execution error >>"%LOG%"
  goto fail
)

:: FO to HTML
echo Transform FO to HTML...
echo Transform FO to HTML... >>"%LOG%"
java -jar "%SAXON_JAR%" -s:"%FO%" -xsl:"%PN2HTML%" -o:"%HTML%" 2>>"%LOG%"
if errorlevel 1 (
  echo Saxon execution error creating HTML >>"%LOG%"
  goto fail
)

:: HTML to SWPX
echo Transform HTML to SWPX...
echo Transform HTML to SWPX... >>"%LOG%"
java -jar "%SAXON_JAR%" -s:"%HTML%" -xsl:"%HTML2SWPX%" -o:"%SWPX%" 2>>"%LOG%"
if errorlevel 1 (
  echo Saxon execution error creating SWPX >>"%LOG%"
  goto fail
)

:: SWPX to DOCX
echo Transform SWPX to DOCX...
echo Transform SWPX to DOCX... >>"%LOG%"
copy /y "%DOTX%" "%SWPXDIR%" >nul
java -jar "%WORDINATOR_JAR%" -i "%SWPXDIR%" -o "%SWPXDIR%" -t "%DOTX%" >>"%LOG%" 2>&1
if exist "%DOCX_TEMP%" (
  copy /y "%DOCX_TEMP%" "%DOCX%" >nul
)

:: Check outputs
if exist "%PDF%" if exist "%HTML%" if exist "%DOCX%" (
  echo.
  echo Successfully created:
  echo   - %PDF%
  echo   - %HTML%
  echo   - %DOCX%
  if exist "%DEBUG%" (
    echo Intermediate files preserved due to debug.txt
  ) else (
    del /q "%FO%" "%FOPFO%" "%LOG%" 2>nul
    rmdir /s /q "%SWPXDIR%" 2>nul
  )
  set RETVAL=0
) else (
  echo.
  echo PDF not created, please check "%LOG%"
  set RETVAL=1
)

REM Check for "batch=yes" as the last argument
set "LASTARG="

:argloop
if "%~1"=="" goto afterargs
set "LASTARG=%~1"
shift
goto argloop

:afterargs
if /i "%LASTARG%"=="batch=yes" goto skipPause
pause

:skipPause
exit /b %RETVAL%
