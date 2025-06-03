@echo off
echo Fixing Telegram environment variables and forcing fresh data...
echo.

echo 1. Pulling latest changes...
git pull origin main

echo.
echo 2. Updating workflow with Telegram environment variables...
git add .github/workflows/mlb-automation.yml
git commit -m "Fix: Add Telegram environment variables to workflow"

echo.
echo 3. Pushing workflow fix...
git push

echo.
echo ✅ Fixed! Now:
echo.
echo 📋 Next steps:
echo 1. Make sure you've added these GitHub secrets:
echo    - TELEGRAM_BOT_TOKEN: e5362baf-c777-4d57-a609-6eaf1f9e87f6
echo    - TELEGRAM_CHAT_ID: -1002555936919
echo.
echo 2. Run the action manually again to test Telegram
echo.
echo 🎯 The action should now:
echo    - Create/update MLB directory with files
echo    - Send Telegram notifications to your group
echo    - Show the actual MLB URLs in the messages
echo.
pause
