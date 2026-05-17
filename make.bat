@echo off
setlocal enabledelayedexpansion
:: Build Retrotype Guide PDF

set LIST=retrotype-guide

for /f %%D in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set DATE=%%D

for %%F in (%LIST%) do (
    set JOB=%%F-%DATE%

    for /l %%i in (1,1,3) do (
        xelatex -synctex=1 -interaction=nonstopmode -jobname="!JOB!" "%%F"
    )

    gswin64c -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile="!JOB!-compressed.pdf" "!JOB!.pdf"

    move /y "!JOB!-compressed.pdf" "!JOB!.pdf"
)

call cleanup.bat
exit /b 0
