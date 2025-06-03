@echo off
echo Updating automation to create unique timestamped files every run...
echo.

echo 1. Pulling latest changes...
git pull origin main

echo.
echo 2. Committing timestamped file updates...
git add mlb_epg_automation_actions.py
git commit -m "Update: Create unique timestamped files with HHMM to avoid conflicts"

echo.
echo 3. Pushing changes...
git push

echo.
echo ✅ Updated! Now every run will create unique files:
echo.
echo 📁 File naming format:
echo    MLB/mlb_epg_current.txt (always current)
echo    MLB/06-03-2025_1200_mlb_epg_filtered.txt (12:00 PM run)
echo    MLB/06-03-2025_1800_mlb_epg_filtered.txt (6:00 PM run) 
echo    MLB/06-04-2025_1200_mlb_epg_filtered.txt (next day)
echo.
echo 🎯 Benefits:
echo    ✅ Every run creates new files (no conflicts)
echo    ✅ Always something to commit to GitHub
echo    ✅ Telegram notifications every time
echo    ✅ Easy to track different runs by time
echo.
echo 📱 Telegram will show both filenames in notifications
echo.
pause
