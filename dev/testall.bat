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
        call "%REPO%\windows\PubNoteOutCheck.bat"   "!FILE!" "batch=yes" || set FAIL=1
        call "%REPO%\windows\PubNoteOutExtract.bat" "!FILE!" "batch=yes" || set FAIL=2
        call "%REPO%\windows\PubNoteOutIndent.bat"  "!FILE!" "batch=yes" || set FAIL=3
    )

    REM PubMedIn scripts
    echo !BASENAME! | findstr /B /C:"PubMedIn" >nul
    if !errorlevel! == 0 (
        call "%REPO%\windows\PubNoteInCheck.bat"      "!FILE!" "batch=yes" || set FAIL=4
        call "%REPO%\windows\PubNoteRender-short.bat" "!FILE!" "batch=yes" || set FAIL=5
        call "%REPO%\windows\PubNoteInIndent.bat"     "!FILE!" "batch=yes" || set FAIL=31
    )

    REM Always render
    call "%REPO%\windows\PubNoteRender-us.bat"    "!FILE!" "batch=yes" || set FAIL=6
    call "%REPO%\windows\PubNoteRender-en.bat"    "!FILE!" "batch=yes" || set FAIL=7
    call "%REPO%\windows\PubNoteRender-de.bat"    "!FILE!" "batch=yes" || set FAIL=8
    call "%REPO%\windows\PubNoteRender-fr.bat"    "!FILE!" "batch=yes" || set FAIL=9
    call "%REPO%\windows\PubNoteRender.bat"       "!FILE!" "batch=yes" || set FAIL=10

    REM Standalone XML2Text / XML2TextMarkdown invocations, exercised directly
    REM rather than only via PubNoteRender's internal calls.
    call "%REPO%\windows\PubNoteXML2Text.bat"            "!FILE!" "batch=yes" || set FAIL=11
    call "%REPO%\windows\PubNoteXML2Text-en.bat"         "!FILE!" "batch=yes" || set FAIL=12
    call "%REPO%\windows\PubNoteXML2Text-de.bat"         "!FILE!" "batch=yes" || set FAIL=13
    call "%REPO%\windows\PubNoteXML2Text-fr.bat"         "!FILE!" "batch=yes" || set FAIL=14
    call "%REPO%\windows\PubNoteXML2TextMarkdown.bat"    "!FILE!" "batch=yes" || set FAIL=15
    call "%REPO%\windows\PubNoteXML2TextMarkdown-en.bat" "!FILE!" "batch=yes" || set FAIL=16
    call "%REPO%\windows\PubNoteXML2TextMarkdown-de.bat" "!FILE!" "batch=yes" || set FAIL=17
    call "%REPO%\windows\PubNoteXML2TextMarkdown-fr.bat" "!FILE!" "batch=yes" || set FAIL=18

    REM PubMedIn scripts
    echo !BASENAME! | findstr /B /C:"PubMedIn" >nul
    if !errorlevel! == 0 (
        echo XML2Text tests...
        call "%REPO%\windows\PubNoteXML2Text-short.bat"         "!FILE!" "batch=yes" || set FAIL=19
        call "%REPO%\windows\PubNoteXML2TextMarkdown-short.bat" "!FILE!" "batch=yes" || set FAIL=20
        echo Text2XML tests...
        call "%REPO%\windows\PubNoteInText2XML.bat"       "%TESTDIR%\!BASENAME!\!BASENAME!.xml.txt"             "batch=yes" || set FAIL=21
        call "%REPO%\windows\PubNoteInText2XML-en.bat"    "%TESTDIR%\!BASENAME!\!BASENAME!.xml-en.txt"          "batch=yes" || set FAIL=22
        call "%REPO%\windows\PubNoteInText2XML-fr.bat"    "%TESTDIR%\!BASENAME!\!BASENAME!.xml-fr.txt"          "batch=yes" || set FAIL=23
        call "%REPO%\windows\PubNoteInText2XML-de.bat"    "%TESTDIR%\!BASENAME!\!BASENAME!.xml-de.txt"          "batch=yes" || set FAIL=24
        call "%REPO%\windows\PubNoteInText2XML.bat"       "%TESTDIR%\!BASENAME!\!BASENAME!.xml-markdown.txt"    "batch=yes" || set FAIL=25
        call "%REPO%\windows\PubNoteInText2XML-en.bat"    "%TESTDIR%\!BASENAME!\!BASENAME!.xml-markdown-en.txt" "batch=yes" || set FAIL=26
        call "%REPO%\windows\PubNoteInText2XML-fr.bat"    "%TESTDIR%\!BASENAME!\!BASENAME!.xml-markdown-fr.txt" "batch=yes" || set FAIL=27
        call "%REPO%\windows\PubNoteInText2XML-de.bat"    "%TESTDIR%\!BASENAME!\!BASENAME!.xml-markdown-de.txt" "batch=yes" || set FAIL=28
        call "%REPO%\windows\PubNoteInText2XML-short.bat" "%TESTDIR%\!BASENAME!\!BASENAME!.xml-short.txt"             "batch=yes" || set FAIL=29
        call "%REPO%\windows\PubNoteInText2XML-short.bat" "%TESTDIR%\!BASENAME!\!BASENAME!.xml-markdown-short.txt"    "batch=yes" || set FAIL=30
    )

    if !FAIL! == 0 (
        echo PASSED: !BASENAME!
    ) else (
        echo FAILED: !BASENAME!
        set EXITSTATUS=1
        set "FAILED_CASES=!FAILED_CASES! !BASENAME! !FAIL!"
    )
)

if !EXITSTATUS! == 1 (
    echo.
    echo testall.bat failed: !FAILED_CASES!
)

exit /b !EXITSTATUS!