@echo off
REM Navigate to the agent directory
cd /d "%~dp0\..\api" || exit /b 1

REM Install dependencies and create virtual environment using uv
uv sync 