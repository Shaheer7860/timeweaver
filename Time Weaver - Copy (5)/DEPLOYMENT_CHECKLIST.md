# Vercel Deployment Checklist

## ✅ Pre-Deployment Checks

### 1. File Structure
- [x] `app.py` exists in root directory
- [x] `app = Flask(...)` is defined at module level (line 14)
- [x] `requirements.txt` exists with Flask dependencies
- [x] `vercel.json` correctly configured
- [x] `public/` folder exists with static files

### 2. Flask App Definition
- [x] `app` variable is at module level (not inside function)
- [x] `app = Flask(__name__, ...)` is defined
- [x] Routes are defined using `@app.route()`
- [x] `handler = app` and `application = app` exports added

### 3. Dependencies
- [x] `requirements.txt` contains:
  - Flask==3.0.0
  - flask-cors==4.0.0

### 4. Configuration
- [x] `vercel.json` has correct build configuration
- [x] Routes are properly defined
- [x] Function timeout is set (30 seconds)

## 🔧 If "No flask entrypoint found" Error Persists

### Step 1: Verify app.py Structure
Ensure `app.py` has this structure:
```python
from flask import Flask

app = Flask(__name__)  # Must be at module level

@app.route('/')
def index():
    return "Hello"

# At the end:
handler = app
application = app
```

### Step 2: Check File Encoding
- Ensure `app.py` is UTF-8 encoded
- No BOM (Byte Order Mark)
- Unix line endings (LF) preferred

### Step 3: Verify Requirements
```bash
# Check requirements.txt exists and has:
Flask==3.0.0
flask-cors==4.0.0
```

### Step 4: Check Vercel Build Logs
Look for:
- Python version (should be 3.9+)
- Flask installation success
- Any import errors
- File structure issues

### Step 5: Try Alternative Approach
If still failing, try creating `api/app.py`:
1. Create `api/` directory
2. Copy `app.py` to `api/app.py`
3. Update `vercel.json`:
   ```json
   {
     "builds": [{
       "src": "api/app.py",
       "use": "@vercel/python"
     }]
   }
   ```

## 📝 Current Configuration

**app.py:**
- Line 14: `app = Flask(__name__, static_folder='public', static_url_path='')`
- Line 802: `handler = app`
- Line 803: `application = app`

**vercel.json:**
- Builds: `app.py` with `@vercel/python`
- Routes: All routes → `/app.py`

## 🚀 Deployment Command

```bash
vercel --prod
```

## 🐛 Debugging

If deployment fails:
1. Check Vercel dashboard → Build Logs
2. Look for Python/Flask errors
3. Verify all files are committed
4. Try deploying from clean state

