@echo off
REM MLB EPG Logo Automation Batch File
REM This batch file runs the Python script for fetching and filtering MLB EPG data

echo ===============================================
echo MLB EPG Logo Automation
echo ===============================================
echo Starting automation at %date% %time%
echo.

REM Change to the script directory
cd /d "H:\00-Claude\projects\logo-automation"

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.x and add it to your PATH
    pause
    exit /b 1
)

REM Check if requests module is installed
python -c "import requests" >nul 2>&1
if %errorlevel% neq 0 (
    echo Installing required Python packages...
    pip install requests
    if %errorlevel% neq 0 (
        echo ERROR: Failed to install required packages
        pause
        exit /b 1
    )
)

REM Run the Python script
echo Running MLB EPG automation script...
echo.
python mlb_epg_automation.py

REM Check if script ran successfully
if %errorlevel% equ 0 (
    echo.
    echo ===============================================
    echo Automation completed successfully!
    echo Check the output files in this directory.
    echo ===============================================
) else (
    echo.
    echo ===============================================
    echo ERROR: Script failed to run properly
    echo ===============================================
)

echo.
echo Press any key to exit...
pause >nul
