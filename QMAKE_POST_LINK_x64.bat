@echo off
echo Setting up environment for Qt usage...
set PATH=C:\Qt\5.15.2\msvc2019_64\bin;%PATH%
cd /D C:\Qt\5.15.2\msvc2019_64
echo Remember to call vcvarsall.bat to complete environment setup!
windeployqt %~dp0\build\x64_release\BIN
