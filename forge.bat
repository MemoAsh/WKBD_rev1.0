@echo off
chcp 65001 >nul 2>&1
cd /d "%~dp0"
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Python not found in PATH. Install Python 3.8+ from python.org
    pause
    exit /b 1
)
python forge.py %*
if %errorlevel% neq 0 pause
