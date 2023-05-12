@echo off
echo Setting up environment for Qt usage...
set PATH=C:\Qt\5.15.2\msvc2019\bin;%PATH%
cd /D C:\Qt\5.15.2\msvc2019
echo Remember to call vcvarsall.bat to complete environment setup!
windeployqt %~dp0\build\x86_release\BIN
