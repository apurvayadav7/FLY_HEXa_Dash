@echo off
title Stop Bhoomi Drishti GCS
echo ===================================================
echo   Stopping Bhoomi Drishti GCS Gateway...
echo ===================================================
echo.

set KILLED=0
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :8000 ^| findstr LISTENING') do (
    echo Stopping server process (PID %%a) on port 8000...
    taskkill /F /PID %%a >nul 2>&1
    set KILLED=1
)

if "%KILLED%"=="1" (
    echo [OK] Bhoomi Drishti GCS server stopped successfully.
) else (
    echo [INFO] No server was running on port 8000.
)

echo.
timeout /t 3
