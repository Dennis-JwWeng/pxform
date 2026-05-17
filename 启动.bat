@echo off
REM Windows: double-click this file to launch the PartFlow project page.
cd /d "%~dp0"
set PORT=8000
start "" http://localhost:%PORT%
where py >nul 2>nul && (py -m http.server %PORT%) || (python -m http.server %PORT%)
pause
