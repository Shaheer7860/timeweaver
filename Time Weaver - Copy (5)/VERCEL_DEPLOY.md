# Vercel Deployment Guide - Time Weaver

## ✅ Your App is Optimized for Vercel!

All necessary optimizations have been made:
- ✅ Routing fixed (API routes take precedence)
- ✅ Static file serving optimized
- ✅ Database configured for serverless environment
- ✅ Vercel configuration optimized

## 🚀 Quick Deployment Steps

### Step 1: Install Vercel CLI (if not already installed)
```bash
npm install -g vercel
```

### Step 2: Login to Vercel
```bash
vercel login
```

### Step 3: Deploy
From your project directory:
```bash
vercel
```

Follow the prompts:
- **Set up and deploy?** → Yes
- **Which scope?** → Your account
- **Link to existing project?** → No (first time) or Yes (if updating)
- **Project name?** → `time-weaver` (or your preferred name)
- **Directory?** → `./` (current directory)
- **Override settings?** → No

### Step 4: Production Deployment
After initial deployment, deploy to production:
```bash
vercel --prod
```

## 📋 What's Configured

### `vercel.json`
- ✅ Python build configuration
- ✅ API routes (`/api/*`) → Flask app
- ✅ Static assets (JS, CSS, images) → `public/` folder
- ✅ All other routes → Flask app (for SPA routing)

### Database
- ✅ Automatically uses `/tmp` directory in serverless environment
- ✅ Falls back to local directory for development
- ⚠️ **Note**: SQLite databases in `/tmp` are ephemeral on Vercel
  - Data persists during function execution
  - Data may be lost between cold starts
  - For production, consider using Vercel Postgres or external database

### Routing
- ✅ API routes (`/api/*`) are handled by Flask
- ✅ Static files are served efficiently
- ✅ SPA routing works (all routes fall back to `index.html`)

## 🔧 Environment Variables (Optional)

If you need to set environment variables:
```bash
vercel env add VARIABLE_NAME
```

Or set them in the Vercel dashboard:
1. Go to your project on [vercel.com](https://vercel.com)
2. Settings → Environment Variables
3. Add your variables

## 📊 Monitoring

After deployment:
- View logs: `vercel logs`
- View deployment: Go to your Vercel dashboard
- Real-time logs: Available in Vercel dashboard

## ⚠️ Important Notes

### Database Limitations
- **SQLite on Vercel is ephemeral** - data may be lost between cold starts
- For production use, consider:
  - **Vercel Postgres** (recommended)
  - **Supabase** (free tier available)
  - **Neon** (serverless Postgres)
  - **PlanetScale** (MySQL)

### Cold Starts
- First request after inactivity may take 1-3 seconds
- Subsequent requests are fast
- Consider using Vercel Pro for better performance

### File System
- Only `/tmp` is writable
- Database automatically uses `/tmp` in serverless environment
- Static files are read-only (served from `public/`)

## 🐛 Troubleshooting

### Build Fails
- Check `requirements.txt` is correct
- Verify Python version (Vercel uses Python 3.9 by default)
- Check Vercel logs: `vercel logs`

### API Routes Not Working
- Verify routes start with `/api/`
- Check `vercel.json` routing configuration
- Ensure Flask app is properly exported

### Static Files Not Loading
- Verify files are in `public/` directory
- Check file extensions in `vercel.json` routes
- Clear browser cache

### Database Errors
- Database is created automatically on first use
- Check `/tmp` directory permissions (should work automatically)
- For persistent data, use external database

## 🎯 Testing Locally

Test your Vercel deployment locally:
```bash
vercel dev
```

This starts a local server that mimics Vercel's environment.

## 📈 Performance Tips

1. **Use Vercel Edge Functions** for static content (already configured)
2. **Enable caching** for static assets (automatic)
3. **Consider database connection pooling** for external databases
4. **Use Vercel Analytics** to monitor performance

## ✅ Deployment Checklist

- [x] Code pushed to GitHub (optional but recommended)
- [x] `vercel.json` configured
- [x] `requirements.txt` present
- [x] Database path configured for serverless
- [x] Static files in `public/` directory
- [x] API routes properly defined
- [ ] Environment variables set (if needed)
- [ ] External database configured (for production)

## 🚀 You're Ready!

Your app is fully optimized for Vercel. Just run `vercel` and deploy! 🎉

