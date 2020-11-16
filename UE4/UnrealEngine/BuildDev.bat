@echo off

if not exist "%~dp0Engine\Build\BatchFiles\RunUAT.bat" goto Error_BatchFileInWrongLocation
call "%~dp0Engine\Build\BatchFiles\RunUAT.bat" -ScriptsForProject="%~dp0Projects\TestBuild\TestBuild.uproject" BuildCookRun -nocompileeditor -nop4 -project="%~dp0Projects\TestBuild\TestBuild.uproject" -cook -stage -archive -package -clientconfig=Development -ue4exe=UE4Editor-Cmd.exe -compressed -pak -prereqs -nodebuginfo -targetplatform=Android -cookflavor=ETC2 -build -utf8output -compile -MultiplePackageMode=3 -SkipSmokeTests -GenerateCookedAssetTypeFile
pause
exit /B %ERRORLEVEL%

:Error_BatchFileInWrongLocation
echo Build ERROR: The batch file RunUAT.bat does not appear to be located in the root UE4 directory.  This script must be run from within that directory.
pause
exit /B 1

