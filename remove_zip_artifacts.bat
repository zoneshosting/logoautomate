@echo off
echo Removing zip artifact backup from workflow...
git add .github/workflows/mlb-automation.yml
git commit -m "Remove zip artifacts - keep only text files in repository"
git push
echo.
echo ✅ Updated! Now only text files will be created, no zip backups.
echo.
echo Your text files are available at:
echo - Repository: mlb_epg_current.txt
echo - Raw URL: https://raw.githubusercontent.com/zoneshosting/logoautomate/main/mlb_epg_current.txt
pause
