rem .\Engine\Binaries\DotNET\AutomationTool.exe BuildGraph -target="Make Installed Build Win64" -script=Engine/Build/InstalledEngineBuild.xml -clean    -TargetPlatforms=Win32+Win64  
REM -List -NoCompile -Help
.\Engine\Build\BatchFiles\RunUAT.bat BuildGraph -target="Make Installed Build Win64" -script=Engine/Build/InstalledEngineBuild.xml -set:WithWin32=false -set:WithMac=false -set:WithIOS=false -set:WithTVOS=false -set:WithLumin=false -set:WithFullDebugInfo=true -set:WithHoloLens=false

pause

