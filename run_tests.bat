@echo off
REM Script to run Robot Framework tests on Windows

echo === Robot Framework Automation Testing ===
echo.

REM Check if sample website server is running
echo Checking if website is accessible...
curl -s http://localhost:8080/index.html >nul 2>&1
if %errorlevel% equ 0 (
    echo √ Website is accessible at http://localhost:8080
) else (
    echo × Website is not accessible.
    echo.
    echo Please start the web server first:
    echo   cd sample-website
    echo   python -m http.server 8080
    echo.
    exit /b 1
)

echo.
echo === Running Tests ===
echo.

REM Create results directory if it doesn't exist
if not exist results mkdir results

REM Run all tests
robot --outputdir results tests/

echo.
echo === Test Execution Complete ===
echo.
echo Test reports available in 'results' directory:
echo   - results\report.html - Summary report
echo   - results\log.html - Detailed log
echo   - results\output.xml - XML output
echo.
echo To view the report:
echo   start results\report.html
