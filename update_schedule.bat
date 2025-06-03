@echo off
echo Updating schedule to 8 AM EST/EDT...
git add .github/workflows/mlb-automation.yml
git commit -m "Update schedule: Run at 8 AM EST/EDT (12 PM UTC)"
git push
echo.
echo ✅ Schedule updated! Next run will be at 8 AM New York time.
pause
