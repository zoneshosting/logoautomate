#!/usr/bin/env python3
"""
MLB EPG Data Automation Script - GitHub Actions Version
Fetches EPG data and filters MLB automation logos daily
"""
import requests
import re
from datetime import datetime
import os
import sys

def fetch_and_filter_mlb_data(username, password, output_file="mlb_filtered.txt"):
    """
    Fetch EPG data from the API and filter MLB automation logos
    
    Args:
        username (str): API username
        password (str): API password
        output_file (str): Output file name
    
    Returns:
        bool: True if successful, False otherwise
    """
    
    # Construct the URL
    url = f"http://epg-4iptv.com:2086/logos.php?username={username}&password={password}"
    
    try:
        print(f"Fetching EPG data...")
        
        # Fetch the data
        response = requests.get(url, timeout=30)
        response.raise_for_status()
        
        # Get the content
        content = response.text
        print(f"Fetched {len(content)} characters")
        
        # Split by <br> tags since that's how the data is formatted
        lines = content.split('<br>')
        print(f"Total entries after splitting: {len(lines)}")
        
        # Count MLB lines for debugging
        mlb_lines = [line for line in lines if 'MLB' in line]
        automation_lines = [line for line in lines if 'automation' in line]
        print(f"Found {len(mlb_lines)} lines containing 'MLB'")
        print(f"Found {len(automation_lines)} lines containing 'automation'")
        
        # Filter for MLB lines with automation logos
        mlb_automation_lines = []
        
        for line in lines:
            # Look for lines that:
            # 1. Start with "MLB" followed by a number
            # 2. Contain the automation URL pattern
            # 3. Do NOT contain "AWAY" or "HOME"
            if (line.strip().startswith('MLB') and 
                'https://epg.epg-4iptv.com/guide/logos/automation' in line and
                'AWAY' not in line and 
                'HOME' not in line):
                
                # Extract MLB number to ensure we only get MLB 01-20
                mlb_match = re.search(r'MLB (\d+)', line)
                if mlb_match:
                    mlb_num = int(mlb_match.group(1))
                    if 1 <= mlb_num <= 20:
                        mlb_automation_lines.append(line.strip())
                        print(f"Found: MLB {mlb_num:02d}")
        
        # Sort the lines numerically by MLB number
        def get_mlb_number(line):
            match = re.search(r'MLB (\d+)', line)
            return int(match.group(1)) if match else 0
        
        mlb_automation_lines.sort(key=get_mlb_number)
        
        # Write to output file
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write('\n'.join(mlb_automation_lines))
        
        print(f"\nFiltered {len(mlb_automation_lines)} MLB automation lines")
        print(f"Output saved to: {output_file}")
        
        # Print summary
        print("\nFound MLB channels:")
        for line in mlb_automation_lines:
            mlb_match = re.search(r'MLB (\d+)', line)
            if mlb_match:
                print(f"  MLB {mlb_match.group(1)}")
        
        return True
        
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        return False
    except Exception as e:
        print(f"Error processing data: {e}")
        return False

def main():
    """Main function to run the automation"""
    
    # Get credentials from environment variables (for GitHub Actions)
    USERNAME = os.getenv('EPG_USERNAME', 'eRuTKFCeSV')  # Fallback to hardcoded
    PASSWORD = os.getenv('EPG_PASSWORD', 'TUNXVoqzez')  # Fallback to hardcoded
    
    # Create MLB directory if it doesn't exist
    mlb_dir = "MLB"
    if not os.path.exists(mlb_dir):
        os.makedirs(mlb_dir)
        print(f"Created directory: {mlb_dir}")
    
    # Create timestamped filename with MM-DD-YYYY format
    timestamp = datetime.now().strftime("%m-%d-%Y")
    current_file = os.path.join(mlb_dir, "mlb_epg_current.txt")
    timestamped_file = os.path.join(mlb_dir, f"{timestamp}_mlb_epg_filtered.txt")
    
    print("=" * 50)
    print("MLB EPG Data Automation")
    print("=" * 50)
    print(f"Timestamp: {datetime.now()}")
    print(f"Running in: {'GitHub Actions' if os.getenv('GITHUB_ACTIONS') else 'Local'}")
    print(f"Output directory: {mlb_dir}/")
    
    # Run the automation
    success = fetch_and_filter_mlb_data(USERNAME, PASSWORD, current_file)
    
    if success:
        print("\n✅ Automation completed successfully!")
        
        # Create timestamped backup
        try:
            with open(current_file, 'r', encoding='utf-8') as f:
                content = f.read()
            with open(timestamped_file, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"Timestamped backup saved to: {timestamped_file}")
        except Exception as e:
            print(f"Warning: Could not create timestamped backup: {e}")
            
        sys.exit(0)
    else:
        print("\n❌ Automation failed!")
        sys.exit(1)
    
    print("=" * 50)

if __name__ == "__main__":
    main()
