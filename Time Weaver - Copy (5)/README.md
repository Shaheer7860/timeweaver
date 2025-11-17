# Time Weaver - Calendar Application

A comprehensive calendar management application with personal and academic features.

## 🚀 Quick Deploy to Railway

1. **Push to GitHub** (if not already done)
2. Go to [railway.app](https://railway.app)
3. Click **"New Project"** → **"Deploy from GitHub repo"**
4. Select your repository
5. Railway will auto-detect Python and deploy!

## 📁 Project Structure

```
.
├── app.py                      # Main Flask application
├── database.py                 # Database manager
├── dsa_structures.py          # Data structures (Trie, LRU Cache)
├── requirements.txt            # Python dependencies
├── Procfile                    # Railway start command
├── railway.json               # Railway configuration
├── nixpacks.toml              # Python detection config
├── HolidayData.csv             # Holiday data
├── index.html                  # Frontend HTML
├── style.css                   # Styles
├── app.js                      # Main JavaScript
└── app_academic_features.js   # Academic features JS
```

## ⚙️ Configuration

### Railway Auto-Detection
- ✅ Python 3.11 (via `nixpacks.toml`)
- ✅ Dependencies from `requirements.txt`
- ✅ Start command from `Procfile`: `python app.py`

### Database
- SQLite database (`calendar.db`) created automatically
- Data persists on Railway (persistent storage)
- Holidays loaded from `HolidayData.csv`

### Port
- Automatically uses `PORT` environment variable (Railway sets this)

## 🔧 Local Development

```bash
# Install dependencies
pip install -r requirements.txt

# Run the app
python app.py

# Access at http://localhost:8080
```

## 📊 Features

- Personal and Academic calendar management
- User authentication and profiles
- Event creation, editing, and deletion
- Task management
- Holiday tracking (multiple religions)
- Teacher availability system
- Advanced search with Trie data structure
- Recurring events support

## 🔐 Default Login

- **Admin**: `admin` / `admin123`

## 📝 API Endpoints

All API endpoints are prefixed with `/api/`:
- `POST /api/user/add` - Register user
- `POST /api/user/validate` - Login
- `GET /api/events` - Get events
- `POST /api/events` - Create event
- And more...

## 🐛 Troubleshooting

### Build Fails
- Check Railway build logs
- Verify `requirements.txt` is correct
- Ensure Python version is compatible (3.11)

### App Won't Start
- Check Railway logs
- Verify `Procfile` exists
- Ensure `app.py` is in root directory

### Database Errors
- Database is created automatically on first run
- Check file permissions in logs

## 📚 Dependencies

- Flask 3.0.0
- flask-cors 4.0.0

## ✅ Ready for Railway!

Your project is optimized and ready to deploy on Railway! 🚀
