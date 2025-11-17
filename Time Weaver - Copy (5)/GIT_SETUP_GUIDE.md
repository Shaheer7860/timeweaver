# Git Repository Setup Guide

## Current Situation
Your files are in: `E:\Time Weaver - Copy (5)`

## Option 1: Initialize Git in Current Folder (Recommended)

If you haven't created a GitHub repo yet, initialize git in the current folder:

```powershell
# Navigate to your project folder
cd "E:\Time Weaver - Copy (5)"

# Initialize git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit - Time Weaver app"

# Create repository on GitHub, then:
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git branch -M main
git push -u origin main
```

**Result:** Files will be at the root of your GitHub repository ✅

## Option 2: Move Files from Subdirectory to Root

If you already have a GitHub repo and files are in a subdirectory:

### Step 1: Clone your repository
```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
```

### Step 2: Move files from subdirectory to root
```powershell
# If files are in "Time Weaver - Copy (5)" subdirectory
Move-Item "Time Weaver - Copy (5)\*" . -Force
Move-Item "Time Weaver - Copy (5)\.*" . -Force -ErrorAction SilentlyContinue

# Remove empty subdirectory
Remove-Item "Time Weaver - Copy (5)" -Force
```

### Step 3: Commit and push
```bash
git add .
git commit -m "Move files to repository root"
git push
```

## Option 3: Use Railway Root Directory Setting

If you can't move files, configure Railway:

1. Go to Railway Dashboard
2. Select your project
3. Go to Settings
4. Find "Root Directory"
5. Set to: `Time Weaver - Copy (5)`
6. Save and redeploy

## Verification

After setup, your GitHub repository should look like:
```
your-repo/
├── app.py              ✅
├── requirements.txt    ✅
├── Procfile            ✅
├── railway.json        ✅
├── nixpacks.toml       ✅
├── public/             ✅
├── database.py         ✅
└── ...
```

**NOT:**
```
your-repo/
└── Time Weaver - Copy (5)/
    ├── app.py
    └── ...
```

## Quick Check Script

Run this to verify your structure:
```powershell
cd "E:\Time Weaver - Copy (5)"
.\setup_repo_root.ps1
```

## Essential Files Checklist

Make sure these are in your repository root:
- [x] `app.py` - Main Flask application
- [x] `requirements.txt` - Python dependencies
- [x] `Procfile` - Railway start command
- [x] `railway.json` - Railway configuration
- [x] `nixpacks.toml` - Python detection config
- [x] `public/` - Static files folder
- [x] `database.py` - Database manager
- [x] `HolidayData.csv` - Holiday data

All these files are present in your current directory! ✅

