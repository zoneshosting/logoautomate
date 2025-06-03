# 📱 Telegram Bot Setup Guide

Follow these steps to set up Telegram notifications for your MLB automation.

## 🤖 Step 1: Create a Telegram Bot

1. **Open Telegram** and search for `@BotFather`
2. **Start a chat** with BotFather
3. **Send:** `/newbot`
4. **Choose a name** for your bot (e.g., "MLB EPG Bot")
5. **Choose a username** (e.g., "mlb_epg_bot")
6. **Copy the bot token** (looks like: `1234567890:ABCDEFGHIJKLMNOPQRSTUVWXYZ`)

## 💬 Step 2: Get Your Chat ID

### Method A: Send a Message to Your Bot
1. **Find your bot** in Telegram (using the username you created)
2. **Send any message** to your bot (e.g., "Hello")
3. **Open this URL** in your browser (replace YOUR_BOT_TOKEN):
   ```
   https://api.telegram.org/botYOUR_BOT_TOKEN/getUpdates
   ```
4. **Look for "chat":{"id":NUMBERS}** - those numbers are your chat ID

### Method B: Use @userinfobot
1. **Search for `@userinfobot`** in Telegram
2. **Start a chat** and send any message
3. **Copy your User ID** (this is your chat ID)

## 🔐 Step 3: Add Secrets to GitHub

Go to your GitHub repository → **Settings** → **Secrets and variables** → **Actions**

Add these two new secrets:

1. **Secret Name:** `TELEGRAM_BOT_TOKEN`
   **Value:** Your bot token from Step 1

2. **Secret Name:** `TELEGRAM_CHAT_ID`  
   **Value:** Your chat ID from Step 2

## 📋 Example Values

```
TELEGRAM_BOT_TOKEN: 1234567890:ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789
TELEGRAM_CHAT_ID: 987654321
```

## ✨ What You'll Get

Once set up, you'll receive Telegram messages with:

### ✅ Success Notifications:
```
🏆 MLB EPG Update

📅 Date: June 3, 2025 at 12:00 PM UTC
📺 Channels Found: 15 MLB channels  
✅ Status: Successfully updated

📄 Current file: MLB/mlb_epg_current.txt
🗃️ Backup file: MLB/06-03-2025_mlb_epg_filtered.txt
```

**Plus:** The actual text file with all the MLB data!

### ❌ Failure Notifications:
```
⚠️ MLB EPG Update Failed

📅 Date: June 3, 2025 at 12:00 PM UTC
❌ Status: Automation failed

🔧 Please check the GitHub Actions logs for details.
```

## 🔧 Testing

After adding the secrets:
1. Go to **Actions** tab in your repository
2. Run **"MLB EPG Logo Automation"** manually
3. Check your Telegram for the notification!

## 🚫 Optional: Disable Telegram

If you don't want Telegram notifications, simply don't add the secrets. The automation will work normally without them.

## 📱 Pro Tips

- **Pin the bot chat** for easy access to daily updates
- **Mute notifications** if you don't want alerts (you'll still see the messages)
- **Forward messages** to team channels if needed
- **Use the file** directly from Telegram - it's the same as the GitHub version!
