# MLB EPG Logo Automation 🏆⚾

This project automatically fetches EPG (Electronic Program Guide) data and filters MLB automation logos daily using GitHub Actions. Get instant Telegram notifications with the latest MLB channel URLs!

## ✨ Features

- 🤖 **Automated daily runs** at 8 AM EST/EDT
- 📱 **Telegram notifications** with actual MLB URLs
- 📁 **Organized file structure** in MLB directory
- ⏰ **Unique timestamped files** for every run
- 🔄 **Always commits new data** (no conflicts)
- 📊 **Complete run history** tracking
- 🎯 **16 MLB channels** automatically detected

## 🚀 Quick Start

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

### 2. Configure Required Secrets

Go to **Settings** → **Secrets and variables** → **Actions** and add:

```
EPG_USERNAME: eRuTKFCeSV
EPG_PASSWORD: TUNXVoqzez
```

### 3. Optional: Telegram Notifications 📱

**Get instant MLB updates sent to your Telegram!**

Add these additional secrets for Telegram integration:
```
TELEGRAM_BOT_TOKEN: [Your bot token from @BotFather]
TELEGRAM_CHAT_ID: [Your chat ID or group ID]
```

**📋 Complete setup guide:** See [TELEGRAM_SETUP.md](TELEGRAM_SETUP.md)

## 📱 Telegram Features

When configured, you'll receive:

### ✅ Success Notifications:
```
🏆 MLB EPG Update

📅 Date: June 3, 2025 at 8:00 AM EST
📺 Channels Found: 16 MLB channels
✅ Status: Successfully updated
📄 Current file: MLB/mlb_epg_current.txt
🗃️ Timestamped file: MLB/06-03-2025_1200_mlb_epg_filtered.txt
```

**Plus all the actual URLs:**
```
MLB 01 - https://epg.epg-4iptv.com/guide/logos/automation/MLB-01-hou-pit.png
MLB 02 - https://epg.epg-4iptv.com/guide/logos/automation/MLB-02-col-mia.png
MLB 03 - https://epg.epg-4iptv.com/guide/logos/automation/MLB-03-chc-wsh.png
... (all 16 channels)
```

### ❌ Failure Notifications:
```
⚠️ MLB EPG Update Failed

📅 Date: June 3, 2025 at 8:00 AM EST
❌ Status: Automation failed

🔧 Please check the GitHub Actions logs for details.
```

## 📁 File Structure

### Generated Files (in MLB directory):
```
MLB/
├── mlb_epg_current.txt                    (always latest data)
├── 06-03-2025_1200_mlb_epg_filtered.txt   (12:00 PM run)
├── 06-03-2025_1800_mlb_epg_filtered.txt   (6:00 PM run)
├── 06-04-2025_1200_mlb_epg_filtered.txt   (next day)
└── ... (unique file for every run)
```

### Project Files:
```
📂 .github/workflows/
   └── mlb-automation.yml                   (GitHub Actions workflow)
📂 MLB/                                     (Generated output directory)
📄 mlb_epg_automation_actions.py           (Main automation script)
📄 mlb_epg_automation.py                   (Local development script)
📄 requirements.txt                        (Python dependencies)
📄 TELEGRAM_SETUP.md                       (Telegram setup guide)
📄 README.md                               (This file)
```

## ⏰ Scheduling

**Current schedule:** Daily at 8 AM EST/EDT (12 PM UTC)

### Change the Schedule:
Edit `.github/workflows/mlb-automation.yml`:

```yaml
schedule:
  - cron: '0 12 * * *'  # 8 AM EDT/12 PM UTC
```

**Other schedule examples:**
- `'0 13 * * *'` - 8 AM EST (winter time)
- `'0 6 * * *'` - 6 AM UTC daily
- `'0 12 * * 1-5'` - Weekdays only at 12 PM UTC
- `'0 0 * * 1'` - Weekly on Mondays

## 🎯 How It Works

1. **Scheduled Run** - GitHub Actions triggers at 8 AM EST/EDT
2. **Fetch Data** - Connects to EPG API and downloads channel data
3. **Filter MLB** - Extracts only MLB automation logos (channels 01-20)
4. **Create Files** - Saves to MLB directory with timestamps
5. **Commit to GitHub** - Pushes new files to repository
6. **Send Telegram** - Notifies your chat/group with URLs

## 🚀 Manual Testing

**Run anytime:**
1. Go to **Actions** tab in your repository
2. Click **MLB EPG Logo Automation**
3. Click **Run workflow** → **Run workflow**

## 📊 What You Get

**Raw output format (in files):**
```html
MLB 01 - <a href="https://epg.epg-4iptv.com/guide/logos/automation/MLB-01-hou-pit.png">https://epg.epg-4iptv.com/guide/logos/automation/MLB-01-hou-pit.png</a>
MLB 02 - <a href="https://epg.epg-4iptv.com/guide/logos/automation/MLB-02-col-mia.png">https://epg.epg-4iptv.com/guide/logos/automation/MLB-02-col-mia.png</a>
```

**Telegram format (clean URLs):**
```
MLB 01 - https://epg.epg-4iptv.com/guide/logos/automation/MLB-01-hou-pit.png
MLB 02 - https://epg.epg-4iptv.com/guide/logos/automation/MLB-02-col-mia.png
```

## 🛠️ Local Development

**For testing and development:**

```bash
# Install dependencies
pip install -r requirements.txt

# Run locally
python mlb_epg_automation.py
```

**Local files created:** `MLB/MM-DD-YYYY_HHMM_mlb_epg_filtered.txt`

## 🔧 Customization

### Change Output Format
Modify `mlb_epg_automation_actions.py` function `fetch_and_filter_mlb_data()`

### Add More Channels
Update the regex pattern to include other channel types

### Change Directory
Modify `mlb_dir = "MLB"` to your preferred folder name

## 🔍 Troubleshooting

### ❌ Action Failing
- Check **Actions** tab for error logs
- Verify all secrets are set correctly
- Ensure repository has Actions enabled

### 📱 Telegram Not Working
- Verify bot token is correct
- Check chat ID includes `-` for groups
- Make sure bot is added to your group
- Test with [TELEGRAM_SETUP.md](TELEGRAM_SETUP.md) guide

### 📁 No Files Created
- Check if MLB directory exists in repository
- Look for error messages in Actions logs
- Verify API credentials are working

### ⏰ Wrong Schedule
- Remember GitHub Actions uses UTC time
- Use [crontab.guru](https://crontab.guru/) to validate cron expressions
- Account for daylight saving time changes

## 📈 Benefits

- ✅ **Fully automated** - Runs without any manual work
- ✅ **Always up-to-date** - Fresh MLB data every day
- ✅ **Instant notifications** - Get URLs delivered to Telegram
- ✅ **Complete history** - Every run saved with timestamps
- ✅ **No conflicts** - Unique filenames prevent overwrites
- ✅ **Free hosting** - GitHub Actions provides the compute
- ✅ **Version controlled** - All changes tracked in git
- ✅ **Reliable** - Runs even when your computer is off

## 🎯 Perfect For

- 📺 **IPTV providers** needing current MLB logos
- 🏆 **Sports streaming services** 
- 📱 **Telegram groups** sharing sports content
- 🤖 **Automation enthusiasts**
- ⚾ **MLB content creators**

---

**Made with ❤️ for the MLB automation community**

*Last updated: June 2025 - Now with Telegram integration and unique timestamped files!*