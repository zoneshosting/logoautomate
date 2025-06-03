@echo off
echo Fixing gitignore and workflow issues...
git add .gitignore
git add .github/workflows/mlb-automation.yml
git commit -m "Fix: Allow mlb_epg_current.txt to be committed by Actions"
git push
echo.
echo Fixed! Now the action should commit the current file properly.
pause
