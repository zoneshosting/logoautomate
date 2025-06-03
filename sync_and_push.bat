@echo off
echo Syncing with GitHub and pushing schedule update...
echo.
echo 1. Pulling latest changes from GitHub...
git pull origin main
echo.
echo 2. Pushing schedule update...
git push
echo.
echo ✅ Schedule updated! Your automation will now run at 8 AM New York time.
echo.
pause
