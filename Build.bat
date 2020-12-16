@echo off

REM Visual Studio 2019 デベロッパー設定
CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat"

msbuild VBTest.sln /t:Clean;Rebuild /p:Configuration=Debug -m

vstest.console UnitTestProject1\bin\Debug\UnitTestProject1.dll /Logger:trx

msbuild VBTest.sln /t:Clean;Rebuild /p:Configuration=Release -m
