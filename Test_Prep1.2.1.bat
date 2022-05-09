REM Batch File to close all programs that may interfear with Secure Browser Test Programs
REM Author Chris Collins
REM 5/6/2022

taskkill /F /FI "IMAGENAME eq Calculator.exe"
taskkill /F /FI "IMAGENAME eq msedge.exe"
taskkill /F /FI "IMAGENAME eq Teams.exe"
taskkill /F /FI "IMAGENAME eq chrome.exe"
taskkill /F /FI "IMAGENAME eq OUTLOOK.EXE"
taskkill /F /FI "IMAGENAME eq POWERPNT.EXE"
taskkill /F /FI "IMAGENAME eq WINWORD.EXE"
taskkill /F /FI "IMAGENAME eq notepad.exe"
taskkill /F /FI "IMAGENAME eq EXCEL.EXE"
taskkill /F /FI "IMAGENAME eq ONENOTE.EXE"
taskkill /F /FI "IMAGENAME eq Microsoft.Photos.exe"
taskkill /F /FI "IMAGENAME eq Capture.exe"
taskkill /F /FI "IMAGENAME eq msedge.exe"
taskkill /F /FI "IMAGENAME eq grammerly.exe"

@echo off
(Your backup commands)
echo msgbox "Please plug in Headphones before you start Test Software and unmute Volume!" > "%temp%\popup.vbs"
wscript.exe "%temp%\popup.vbs"
