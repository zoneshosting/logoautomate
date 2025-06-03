# MLB EPG Logo Automation

This project automatically fetches EPG (Electronic Program Guide) data and filters MLB automation logos daily using GitHub Actions.

## 🚀 GitHub Actions Setup

### 1. Repository Setup

1. **Create a new GitHub repository**
2. **Push this project to your repository:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: MLB EPG automation"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   git push -u origin main
   ```

### 2. Configure Secrets

For security, set up GitHub Secrets:

1. Go to your repository on GitHub
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret** and add:
   - Name: `EPG_USERNAME`, Value: `eRuTKFCeSV`
   - Name: `EPG_PASSWORD`, Value: `TUNXVoqzez`

### 3. Optional: Telegram Notifications 📱

Get instant notifications with MLB data sent to your Telegram!

**Quick Setup:**
1. Create a Telegram bot with @BotFather
2. Get your chat ID
3. Add two more secrets:
   - `TELEGRAM_BOT_TOKEN`: Your bot token
   - `TELEGRAM_CHAT_ID`: Your chat ID

**📋 Detailed guide:** See [TELEGRAM_SETUP.md](TELEGRAM_SETUP.md)

### 4. How It Works

The GitHub Action will:
- **Run daily at 6 AM UTC** (1 AM EST/2 AM EDT)
- **Fetch latest MLB EPG data**
- **Filter for automation logos only**
- **Save results to `mlb_epg_current.txt`**
- **Create timestamped backups**
- **Commit changes only if data updated**
- **Store artifacts for 30 days**

### 4. Manual Triggering

You can manually run the automation:
1. Go to **Actions** tab in your GitHub repository
2. Click **MLB EPG Logo Automation**
3. Click **Run workflow**

### 5. Monitoring

- **Check the Actions tab** for run history and logs
- **View output files** directly in your repository
- **Download artifacts** from the Actions run page

## 📁 Files

### GitHub Actions Files
- `.github/workflows/mlb-automation.yml` - Main workflow configuration
- `mlb_epg_automation_actions.py` - GitHub Actions optimized script

### Local Development Files
- `mlb_epg_automation.py` - Original local script
- `run_automation.bat` - Windows batch file for local runs
- `setup.bat` - Local setup script
- `requirements.txt` - Python dependencies

### Output Files (Generated)
- `mlb_epg_current.txt` - Latest MLB data (always current)
- `mlb_epg_filtered_YYYYMMDD_HHMMSS.txt` - Timestamped backups

## 🔧 Customization

### Change Schedule
Edit `.github/workflows/mlb-automation.yml`:
```yaml
schedule:
  - cron: '0 6 * * *'  # Daily at 6 AM UTC
```

### Timezone Examples
- `'0 12 * * *'` - Daily at 12 PM UTC (noon)
- `'0 0 * * 1'` - Weekly on Mondays at midnight UTC
- `'0 6 * * 1-5'` - Weekdays only at 6 AM UTC

### Output Format
Modify `mlb_epg_automation_actions.py` to change filtering logic or output format.

## 🛠️ Local Development

For local development and testing:

```bash
# Install dependencies
pip install -r requirements.txt

# Run locally (Windows)
run_automation.bat

# Run locally (Python)
python mlb_epg_automation.py
```

## 📊 What You Get

The automation finds MLB channels 01-20 with automation logos:
```
MLB 01 - <a href="https://epg.epg-4iptv.com/guide/logos/automation/MLB-01-hou-pit.png">https://epg.epg-4iptv.com/guide/logos/automation/MLB-01-hou-pit.png</a>
MLB 02 - <a href="https://epg.epg-4iptv.com/guide/logos/automation/MLB-02-col-mia.png">https://epg.epg-4iptv.com/guide/logos/automation/MLB-02-col-mia.png</a>
...
```

## 🔍 Troubleshooting

### Action Not Running
- Check your cron syntax
- Verify repository has Actions enabled
- Check for any error messages in Actions tab

### No Data Found
- Check if API credentials are correct
- Verify secrets are properly set
- Look at the Action logs for debugging info

### Permission Denied
- Ensure the workflow has `contents: write` permission
- Check if branch protection rules allow Actions to push

## 📈 Benefits of GitHub Actions

- ✅ **Automated daily runs** - No manual intervention needed
- ✅ **Free for public repositories** - GitHub provides compute time
- ✅ **Version controlled** - All changes tracked in git
- ✅ **Reliable scheduling** - Runs even when your computer is off
- ✅ **Artifact storage** - Automatic backup of results
- ✅ **Email notifications** - Get notified if automation fails
