@echo off
echo Adding Telegram bot integration to MLB automation...
echo.

REM Pull latest changes first
echo 1. Pulling latest changes...
git pull origin main

echo.
echo 2. Adding Telegram integration files...
git add .
git commit -m "Add Telegram bot integration with success/failure notifications"

echo.
echo 3. Pushing changes...
git push

echo.
echo ✅ Telegram integration added!
echo.
echo 📋 Next steps:
echo    1. Read TELEGRAM_SETUP.md for detailed setup instructions
echo    2. Create a Telegram bot with @BotFather
echo    3. Get your chat ID
echo    4. Add TELEGRAM_BOT_TOKEN and TELEGRAM_CHAT_ID secrets to GitHub
echo    5. Test by running the action manually
echo.
echo 🎯 Once configured, you'll get:
echo    - Success notifications with MLB data file
echo    - Failure notifications if automation fails
echo    - Instant updates delivered to your Telegram
echo.
pause
