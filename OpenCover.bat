@echo off

SET OPEN_COVER="packages\OpenCover.4.7.922\tools"
SET REPORT_GEN="packages\ReportGenerator.4.8.2\tools\net47"

REM Visual Studio 2019 �f�x���b�p�[�ݒ�
CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat"

REM �^�[�Q�b�g�A�Z���u���̊i�[��
SET TARGET_TEST_DIR="UnitTestProject1\bin\Debug"

REM �^�[�Q�b�g�A�Z���u��
SET TARGET_TEST="UnitTestProject1.dll"

REM �Ώۃt�B���^
SET FILTER="+[VBTest*]* -[UnitTest*]* -[*]*.My.*"

REM ���|�[�g�o�̓t�H���_
SET REPORT_FOLDER="OpenCover"

REM �ꎞ���ʃt�@�C��
SET RESULT_FILE="result.xml"

DEL %REPORT_FOLDER% /S /Q
MKDIR %REPORT_FOLDER%

REM �p�X�̐ݒ�
SET PATH=%PATH%;%OPEN_COVER%;%MS_TEST%;%REPORT_GEN%

REM OpenCover�����s
OpenCover.Console.exe -register:user -target:"vstest.console.exe" -targetargs:%TARGET_TEST% -targetdir:%TARGET_TEST_DIR% -filter:%FILTER% -output:"%REPORT_FOLDER%\\%RESULT_FILE%"

ReportGenerator.exe --reports:"%REPORT_FOLDER%\\%RESULT_FILE%" -targetdir:"%REPORT_FOLDER%"
