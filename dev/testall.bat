@echo off
setlocal enabledelayedexpansion

REM Resolve REPO as parent of the script directory
pushd "%~dp0\.." >nul
set "REPO=%CD%"
popd >nul
set "TESTDIR=%REPO%\test"

set EXITSTATUS=0

for %%F in (PubMedIn-1.xml PubMedOut-1.xml) do (
    set "FILE=%TESTDIR%\%%F"
    set "BASENAME=%%~nF"
    echo Processing: !BASENAME!

    if exist "%TESTDIR%\!BASENAME!\" (
        rmdir /s /q "%TESTDIR%\!BASENAME!"
    )

    set FAIL=0

    REM PubMedOut scripts
    echo !BASENAME! | findstr /B /C:"PubMedOut" >nul
    if !errorlevel! == 0 (
        call "%REPO%\windows\PubNoteOutCheck.bat" "!FILE!" "batch=yes" || set FAIL=1
        call "%REPO%\windows\PubNoteOutExtract.bat" "!FILE!" "batch=yes" || set FAIL=1
        call "%REPO%\windows\PubNoteOutIndent.bat" "!FILE!" "batch=yes" || set FAIL=1
    )

    REM PubMedIn scripts
    echo !BASENAME! | findstr /B /C:"PubMedIn" >nul
    if !errorlevel! == 0 (
        call "%REPO%\windows\PubNoteInCheck.bat" "!FILE!" "batch=yes" || set FAIL=1
    )

    REM Always render
    call "%REPO%\windows\PubNoteRender-en.bat" "!FILE!" "batch=yes" || set FAIL=1
    call "%REPO%\windows\PubNoteRender-us.bat" "!FILE!" "batch=yes" || set FAIL=1
    call "%REPO%\windows\PubNoteRender-de.bat" "!FILE!" "batch=yes" || set FAIL=1
    call "%REPO%\windows\PubNoteRender-fr.bat" "!FILE!" "batch=yes" || set FAIL=1

    if !FAIL! == 1 (
        echo FAILED: !BASENAME!
        set EXITSTATUS=1
        set "FAILED_CASES=!FAILED_CASES! !BASENAME!"
    ) else (
        echo PASSED: !BASENAME!
    )
)

if !EXITSTATUS! == 1 (
    echo.
    echo testall.bat failed: !FAILED_CASES!
)

exit /b !EXITSTATUS!