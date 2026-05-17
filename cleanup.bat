@echo off
if not "%~1"=="" (
    cd /d "%~1"
)
del /q *.aux *.bbl *.blg *.idx *.ilg *.ind *.log *.out *.synctex.gz *.toc
exit /b 0
