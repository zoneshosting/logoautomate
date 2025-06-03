@echo off
echo Committing workflow fix...
git add .github/workflows/mlb-automation.yml
git commit -m "Fix: Update upload-artifact to v4 for compatibility"
git push
echo.
echo Fixed and pushed! You can now re-run the action.
pause
