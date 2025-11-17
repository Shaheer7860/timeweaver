# Time Weaver - Railway Deployment Guide

## 🚀 Quick Deploy to Railway

Your project is now **fully optimized for Railway**!

### Deploy in 3 Steps:

1. **Push to GitHub** (if not already):
   ```bash
   git add .
   git commit -m "Optimized for Railway"
   git push
   ```

2. **Connect to Railway**:
   - Go to [railway.app](https://railway.app)
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your repository

3. **That's it!** Railway will:
   - Auto-detect Python
   - Install dependencies from `requirements.txt`
   - Run `python app.py` (from Procfile)
   - Your app will be live!

## 📁 Railway-Specific Files

### `Procfile`
```
web: python app.py
```
- Tells Railway how to start your app
- `web` process type runs your Flask server

### `railway.json`
- Build configuration
- Start command specification
- Restart policy

### `requirements.txt`
- Python dependencies
- Railway installs these automatically

### `runtime.txt` (optional)
- Specifies Python version (3.11)
- Railway can auto-detect, but this ensures consistency

## ⚙️ Configuration

### Database
- ✅ Uses `calendar.db` in current directory
- ✅ Railway has persistent storage (data persists!)
- ✅ Database is created automatically on first run

### Port
- ✅ Automatically uses `PORT` environment variable
- ✅ Railway sets this automatically
- ✅ App binds to `0.0.0.0` to accept external connections

### Static Files
- ✅ Served from `public/` folder
- ✅ Flask handles routing
- ✅ API routes take precedence

## 🔧 Railway Settings

### Environment Variables (Optional)
Railway automatically sets:
- `PORT` - Server port (don't change)

You can add custom variables in Railway dashboard:
- Settings → Variables
- Add any custom config you need

### Build Settings
Railway auto-detects:
- ✅ Python runtime
- ✅ Build command: `pip install -r requirements.txt`
- ✅ Start command: `python app.py` (from Procfile)

## 📊 Features Optimized for Railway

1. **Persistent Database**: SQLite database persists between deployments
2. **Full Server**: Runs as a continuous server (not serverless)
3. **Auto-Scaling**: Railway handles scaling automatically
4. **Health Checks**: Railway monitors your app automatically
5. **Logs**: View real-time logs in Railway dashboard

## 🐛 Troubleshooting

### Build Fails
- Check Railway build logs
- Verify `requirements.txt` is correct
- Ensure Python version is compatible (3.9+)

### App Won't Start
- Check Railway logs
- Verify `Procfile` exists
- Ensure `app.py` is in root directory
- Check that `PORT` environment variable is set

### Database Errors
- Database is created automatically
- Check file permissions in logs
- Verify `HolidayData.csv` is included

### Static Files Not Loading
- Verify `public/` folder exists
- Check file paths in HTML
- Clear browser cache

## 📈 Monitoring

After deployment:
- **Logs**: View in Railway dashboard → Logs tab
- **Metrics**: CPU, Memory, Network in Metrics tab
- **Deployments**: View all deployments in Deployments tab

## 🔄 Updates

To update your app:
1. Push changes to GitHub
2. Railway automatically redeploys
3. Or manually trigger redeploy in Railway dashboard

## ✅ Deployment Checklist

- [x] `Procfile` created
- [x] `railway.json` configured
- [x] `requirements.txt` present
- [x] `app.py` in root directory
- [x] Database configured for Railway
- [x] Routes optimized (API first, static last)
- [x] Port binding configured (`0.0.0.0`)

## 🎯 What's Different from Vercel?

| Feature | Railway | Vercel |
|---------|---------|--------|
| Type | Full Server | Serverless |
| Database | Persistent (SQLite works!) | Ephemeral (/tmp) |
| Cold Starts | None (always running) | Yes (1-3 seconds) |
| Scaling | Automatic | Per request |
| Best For | Full apps, databases | API endpoints |

## 🎉 Ready to Deploy!

Your app is optimized for Railway. Just connect your GitHub repo and deploy! 🚀

