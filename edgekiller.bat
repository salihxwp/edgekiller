@echo off
title Edge Killer - Windows Edge Remover
setlocal EnableDelayedExpansion

:: ============================================================
:: Project: Edge Killer
:: Description: Removes Microsoft Edge from the system.
:: Requirements: Must be executed with Administrator privileges.
:: Note: Re-run after Windows Updates if Edge is reinstalled.
:: ============================================================

:: Check for Administrative Privileges
echo Checking for administrator privileges...
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Administrator privileges confirmed.
) else (
    echo [ERROR] Please right-click and "Run as administrator".
    pause
    exit /b
)

echo.
echo Terminating Microsoft Edge processes...
taskkill /f /im msedge.exe >nul 2>&1

echo.
echo Removing Microsoft Edge system files...
:: Typical paths for Microsoft Edge
set "edgePath=C:\Program Files (x86)\Microsoft\Edge"

if exist "!edgePath!" (
    rd /s /q "!edgePath!"
    echo [OK] Microsoft Edge has been successfully removed.
) else (
    echo [INFO] Microsoft Edge directory not found or already removed.
)

echo.
echo ----------------------------------------------------------
echo NOTE: Major Windows Updates may reinstall Microsoft Edge.
echo If Edge returns, please run this script again.
echo ----------------------------------------------------------
echo.
pause