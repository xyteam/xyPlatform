@echo off
PowerShell -NoProfile -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File C:\vagrant\installChoco.ps1' -Verb RunAs}";
SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
rem EXIT

