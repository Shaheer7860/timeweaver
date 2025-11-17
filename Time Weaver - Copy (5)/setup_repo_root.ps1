# PowerShell script to ensure files are at repository root
# Run this from your repository root (not from inside "Time Weaver - Copy (5)")

Write-Host "Setting up repository root structure..." -ForegroundColor Green

# Check if we're in a git repository
if (Test-Path .git) {
    Write-Host "Git repository detected" -ForegroundColor Green
    
    # Check if files are in subdirectory
    if (Test-Path "Time Weaver - Copy (5)") {
        Write-Host "Found subdirectory 'Time Weaver - Copy (5)'" -ForegroundColor Yellow
        Write-Host "Moving files to root..." -ForegroundColor Yellow
        
        # Move all files from subdirectory to current directory
        Get-ChildItem -Path "Time Weaver - Copy (5)" -Force | ForEach-Object {
            $destination = Join-Path $PWD $_.Name
            if (-not (Test-Path $destination)) {
                Move-Item $_.FullName $destination -Force
                Write-Host "Moved: $($_.Name)" -ForegroundColor Cyan
            } else {
                Write-Host "Skipped (exists): $($_.Name)" -ForegroundColor Gray
            }
        }
        
        # Remove empty subdirectory
        if ((Get-ChildItem "Time Weaver - Copy (5)" -Force -ErrorAction SilentlyContinue).Count -eq 0) {
            Remove-Item "Time Weaver - Copy (5)" -Force
            Write-Host "Removed empty subdirectory" -ForegroundColor Green
        }
    } else {
        Write-Host "Files are already at root level" -ForegroundColor Green
    }
} else {
    Write-Host "Not a git repository. Initializing..." -ForegroundColor Yellow
    git init
    Write-Host "Git repository initialized" -ForegroundColor Green
}

# Verify essential files
Write-Host "`nVerifying essential files..." -ForegroundColor Green
$essentialFiles = @("app.py", "requirements.txt", "Procfile", "railway.json", "nixpacks.toml")
$allPresent = $true

foreach ($file in $essentialFiles) {
    if (Test-Path $file) {
        Write-Host "  ✓ $file" -ForegroundColor Green
    } else {
        Write-Host "  ✗ $file (MISSING)" -ForegroundColor Red
        $allPresent = $false
    }
}

if ($allPresent) {
    Write-Host "`nAll essential files present! Ready for Railway deployment." -ForegroundColor Green
} else {
    Write-Host "`nSome files are missing. Please check." -ForegroundColor Red
}

Write-Host "`nNext steps:" -ForegroundColor Cyan
Write-Host "1. Review changes: git status" -ForegroundColor White
Write-Host "2. Add files: git add ." -ForegroundColor White
Write-Host "3. Commit: git commit -m 'Organize files for Railway'" -ForegroundColor White
Write-Host "4. Push to GitHub and connect to Railway" -ForegroundColor White

