@echo off
echo Updating Telegram to send actual MLB URLs instead of file...
echo.

echo 1. Pulling latest changes...
git pull origin main

echo.
echo 2. Committing URL display update...
git add mlb_epg_automation_actions.py
git commit -m "Update Telegram: Display actual MLB URLs instead of file attachment"

echo.
echo 3. Pushing changes...
git push

echo.
echo ✅ Updated! Your Telegram messages will now show:
echo.
echo 🏆 MLB EPG Update
echo 📅 Date: June 3, 2025 at 8:00 AM EST
echo 📺 Channels Found: 15 MLB channels
echo ✅ Status: Successfully updated
echo 📄 Current file: MLB/mlb_epg_current.txt
echo.
echo Followed by all the actual URLs:
echo MLB 01 - https://epg.epg-4iptv.com/guide/logos/automation/MLB-01-hou-pit.png
echo MLB 02 - https://epg.epg-4iptv.com/guide/logos/automation/MLB-02-col-mia.png
echo MLB 03 - https://epg.epg-4iptv.com/guide/logos/automation/MLB-03-chc-wsh.png
echo ... (and so on)
echo.
pause
