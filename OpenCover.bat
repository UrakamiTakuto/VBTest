@echo off

SET OPEN_COVER="packages\OpenCover.4.7.922\tools"
SET REPORT_GEN="packages\ReportGenerator.4.8.2\tools\net47"

REM Visual Studio 2019 デベロッパー設定
CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat"

REM ターゲットアセンブリの格納先
SET TARGET_TEST_DIR="UnitTestProject1\bin\Debug"

REM ターゲットアセンブリ
SET TARGET_TEST="UnitTestProject1.dll"

REM 対象フィルタ
SET FILTER="+[VBTest*]* -[UnitTest*]* -[*]*.My.*"

REM レポート出力フォルダ
SET REPORT_FOLDER="OpenCover"

REM 一時結果ファイル
SET RESULT_FILE="result.xml"

DEL %REPORT_FOLDER% /S /Q
MKDIR %REPORT_FOLDER%

REM パスの設定
SET PATH=%PATH%;%OPEN_COVER%;%MS_TEST%;%REPORT_GEN%

REM OpenCoverを実行
OpenCover.Console.exe -register:user -target:"vstest.console.exe" -targetargs:%TARGET_TEST% -targetdir:%TARGET_TEST_DIR% -filter:%FILTER% -output:"%REPORT_FOLDER%\\%RESULT_FILE%"

ReportGenerator.exe --reports:"%REPORT_FOLDER%\\%RESULT_FILE%" -targetdir:"%REPORT_FOLDER%"
