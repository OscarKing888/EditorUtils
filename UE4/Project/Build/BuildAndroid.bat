rem set UE4Root=c:\UE4
set UE4Root=C:\Program Files\Epic Games\UE_4.25
set UE4BuildOutputPath=C:\UE4Build
set ProjectName=ShootAct

set CurrentPath=%~dp0

set ProjectDir=%CurrentPath%..
set UATPath="%UE4Root%\Engine\Build\BatchFiles\RunUAT.bat"
set ProjectFile=%CurrentPath%..\%ProjectName%.uproject


call %UATPath% -ScriptsForProject=%ProjectFile% BuildCookRun -nocompileeditor -installed -nop4 -project=%ProjectFile% -cook -stage -archive -archivedirectory=%UE4BuildOutputPath% -package -ue4exe="%UE4Root%\Engine\Binaries\Win64\UE4Editor-Cmd.exe" -pak -prereqs -nodebuginfo -targetplatform=Android -cookflavor=Multi -build -target=ShootAct -clientconfig=Development -utf8output

pause
rem -ScriptsForProject=D:/UE4Projs/ShootAct/ShootAct.uproject BuildCookRun -nocompileeditor -installed -nop4 -project=D:/UE4Projs/ShootAct/ShootAct.uproject -cook -stage -archive -archivedirectory=C:/UE4Build -package -ue4exe="C:\Program Files\Epic Games\UE_4.25\Engine\Binaries\Win64\UE4Editor-Cmd.exe" -pak -prereqs -nodebuginfo -targetplatform=Android -cookflavor=Multi -build -target=ShootAct -clientconfig=Development -utf8output