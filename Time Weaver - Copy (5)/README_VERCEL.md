# Time Weaver - Vercel Deployment Guide

## 🚀 Quick Start

This project is **fully optimized for Vercel serverless deployment**.

### Deploy in 3 Steps:

1. **Install Vercel CLI** (if not already installed):
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel**:
   ```bash
   vercel login
   ```

3. **Deploy**:
   ```bash
   vercel --prod
   ```

That's it! Your app will be live in seconds.

## 📁 Project Structure (Vercel-Optimized)

```
.
├── app.py                 # Main Flask application (serverless-ready)
├── database.py            # Database manager (uses /tmp for serverless)
├── dsa_structures.py     # Data structures (Trie, LRU Cache, etc.)
├── requirements.txt       # Python dependencies
├── vercel.json           # Vercel configuration
├── .vercelignore         # Files to exclude from deployment
├── HolidayData.csv       # Holiday data (included in deployment)
└── public/                # Static files (HTML, CSS, JS)
    ├── index.html
    ├── style.css
    ├── app.js
    └── app_academic_features.js
```

## ⚙️ Configuration

### `vercel.json`
- Routes all requests to Flask app
- API routes (`/api/*`) handled by Flask
- Static files served by Flask from `public/` folder
- Maximum function duration: 30 seconds

### Database
- **Automatically uses `/tmp` directory** in serverless environment
- Falls back to local directory for development
- **Note**: SQLite databases in `/tmp` are ephemeral
  - Data persists during function execution
  - Data may be lost between cold starts
  - For production: Use Vercel Postgres or external database

### Static Files
- Served from `public/` directory
- Flask handles all routing (including SPA routing)
- Static assets (CSS, JS) served efficiently

## 🔧 Features

### Optimizations for Vercel:
- ✅ Lazy database initialization (faster cold starts)
- ✅ Serverless-compatible database path (`/tmp`)
- ✅ Proper error handling for serverless environment
- ✅ Optimized routing for API and static files
- ✅ CORS enabled for frontend-backend communication
- ✅ UTF-8 JSON encoding configured

### Application Features:
- Personal and Academic calendar management
- User authentication and profiles
- Event creation, editing, and deletion
- Task management
- Holiday tracking (multiple religions)
- Teacher availability system
- Advanced search with Trie data structure
- Recurring events support

## 📊 API Endpoints

All API endpoints are prefixed with `/api/`:

- `POST /api/user/add` - Register new user
- `POST /api/user/validate` - Login
- `GET /api/events` - Get events for a date
- `POST /api/events` - Create event
- `PUT /api/events/<id>` - Update event
- `DELETE /api/events/<id>` - Delete event
- `GET /api/holidays` - Get holidays
- `GET /api/quote` - Get monthly quote
- And more...

## 🗄️ Database

### Current Setup (SQLite)
- Database file: `/tmp/calendar.db` (serverless) or `calendar.db` (local)
- Created automatically on first request
- Tables created automatically
- Holidays loaded from `HolidayData.csv`

### For Production (Recommended)
Replace SQLite with:
- **Vercel Postgres** (recommended - native integration)
- **Supabase** (free tier available)
- **Neon** (serverless Postgres)
- **PlanetScale** (MySQL)

## 🐛 Troubleshooting

### Build Fails
- Check `requirements.txt` is correct
- Verify Python version (Vercel uses 3.9 by default)
- Check Vercel build logs

### 404 Errors
- Ensure `vercel.json` is in root directory
- Verify `app.py` is in root directory
- Check that `public/` folder exists with files
- Hard refresh browser (Ctrl+Shift+R)

### Database Errors
- Database is created automatically on first use
- Check `/tmp` directory permissions (should work automatically)
- For persistent data, use external database

### Static Files Not Loading
- Verify files are in `public/` directory
- Check file paths in HTML (should be relative: `style.css`, not `/style.css`)
- Clear browser cache

## 📈 Performance

### Cold Starts
- First request after inactivity: ~1-3 seconds
- Subsequent requests: Fast (< 100ms)
- Database initialization: Lazy (only when needed)

### Optimization Tips
1. Use Vercel Pro for better performance
2. Consider external database for production
3. Enable Vercel Analytics to monitor performance
4. Use Edge Functions for static content (future optimization)

## 🔐 Security

- CORS enabled for API access
- Password hashing in database
- Input validation on all endpoints
- SQL injection protection (parameterized queries)

## 📝 Environment Variables

Currently none required. Optional variables you can add:

- `DATABASE_URL` - For external database (if migrating from SQLite)
- `PORT` - Server port (not needed on Vercel)

## 🧪 Testing Locally

Test your Vercel deployment locally:

```bash
vercel dev
```

This starts a local server that mimics Vercel's environment.

## 📚 Documentation

- See `VERCEL_DEPLOY.md` for detailed deployment steps
- See `VERCEL_OPTIMIZATIONS.md` for optimization details

## ✅ Deployment Checklist

- [x] `vercel.json` configured
- [x] `requirements.txt` present
- [x] `app.py` in root directory
- [x] `public/` folder with static files
- [x] Database configured for serverless
- [x] `.vercelignore` excludes unnecessary files
- [x] All dependencies listed in `requirements.txt`
- [x] `HolidayData.csv` included

## 🎯 Next Steps After Deployment

1. **Test the deployment**:
   - Visit your Vercel URL
   - Test login (admin/admin123)
   - Create a test event
   - Verify static files load

2. **Set up external database** (for production):
   - Create Vercel Postgres database
   - Update `database.py` to use PostgreSQL
   - Migrate data if needed

3. **Monitor performance**:
   - Enable Vercel Analytics
   - Check function logs
   - Monitor cold start times

## 🆘 Support

If you encounter issues:
1. Check Vercel build logs
2. Check Vercel function logs
3. Verify all files are in correct locations
4. Ensure `requirements.txt` is correct

## 🎉 Success!

Your Time Weaver app is now optimized and ready for Vercel! Just run `vercel --prod` and you're live!

