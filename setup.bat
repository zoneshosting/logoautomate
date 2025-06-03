@echo off
REM Setup script for MLB EPG Logo Automation
REM This will install all required dependencies

echo ===============================================
echo MLB EPG Logo Automation - Setup
echo ===============================================
echo.

REM Change to the script directory
cd /d "H:\00-Claude\projects\logo-automation"

REM Check if Python is installed
echo Checking Python installation...
python --version
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.x from https://python.org
    echo Make sure to check "Add Python to PATH" during installation
    pause
    exit /b 1
)

echo Python found successfully!
echo.

REM Install required packages
echo Installing required Python packages...
pip install -r requirements.txt

if %errorlevel% equ 0 (
    echo.
    echo ===============================================
    echo Setup completed successfully!
    echo You can now run the automation using:
    echo   run_automation.bat
    echo ===============================================
) else (
    echo.
    echo ===============================================
    echo ERROR: Failed to install required packages
    echo Make sure you have internet connection
    echo ===============================================
)

echo.
echo Press any key to exit...
pause >nul
