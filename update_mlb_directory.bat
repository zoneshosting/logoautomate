@echo off
echo Updating automation to use MLB directory with MM-DD-YYYY timestamps...
echo.

REM First pull any recent changes
echo 1. Pulling latest changes...
git pull origin main

echo.
echo 2. Adding all changes...
git add .
git commit -m "Update: Create MLB directory with MM-DD-YYYY timestamped files"

echo.
echo 3. Pushing changes...
git push

echo.
echo ✅ Updated! Your automation will now:
echo    - Create files in MLB/ directory
echo    - Use MM-DD-YYYY format (like 06-03-2025_mlb_epg_filtered.txt)
echo    - Keep both current and timestamped files
echo.
echo Example files:
echo    MLB/mlb_epg_current.txt (always current)
echo    MLB/06-03-2025_mlb_epg_filtered.txt (today's backup)
echo.
pause
