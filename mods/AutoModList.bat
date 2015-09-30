@echo off
title 自动生成mod列表服务端工具
mode con: cols=50 lines=18
COLOR 0a
set a=%~dp0
set a="%a:~-5%"
if %a%=="mods\" goto choice
::检测当前目录是否为mods\，否则进入搜索

::搜索模块
echo.
echo.你的当前目录不正确
echo.将自动进行搜索
echo.文件会放入服务端mods文件夹中
echo.
echo.|choice /c 8 /d 8 /t 8 /n 2>nul

echo.请稍等……
echo.正在查找饥荒服务端mods文件夹
for %%d in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do if exist %%d: (
	for /f "delims=b" %%i in ('dir /b/s %%d:\dontstarve_dedicated_server_nullrenderer.exe') do (
		if not exist "%%imods\AutoModList.bat" (
			copy /y "AutoModList.bat" "%%imods\AutoModList.bat">nul
			echo.
			echo.本文件已放入：%%imods\
			echo.
			pause
		)
	)
)2>nul
del AutoModList.bat

:choice::选择模块！
cls
echo.
echo.==================================================
echo.
echo.●使用以下哪种方法创建服务端mod列表：
echo.
echo. 	1、modoverrides.lua列表法（推荐）；
echo.
echo. 	2、modsettings.lua列表法；
echo.
echo. 	3、还不清楚，以后再创建。
echo.
echo.==================================================
echo.
set "input=."
set /p input=请选择：
	if "%input%"=="1" goto modoverrides
	if "%input%"=="2" goto modsettings
	if "%input%"=="3" goto exit
echo;输入错误，请重新选择。
echo.|choice /c 5 /d 5 /t 5 /n 2>nul
goto choice
	
:modoverrides::模块1
cls
echo --为注释，不影响使用。mod的启用请自己修改。> %UserProfile%\Desktop\modoverrides.lua
echo --true 启用>> %UserProfile%\Desktop\modoverrides.lua
echo --false 不启用>> %UserProfile%\Desktop\modoverrides.lua
echo --佩剑的兔子 制作。感谢使用！>>%UserProfile%\Desktop\modoverrides.lua
echo return>> %UserProfile%\Desktop\modoverrides.lua
echo {>>%UserProfile%\Desktop\modoverrides.lua

for /f "usebackq tokens=1,3 delims=\=" %%i in (`findstr /s "^name" modinfo.lua`) do (
	echo 	["%%i"] = { enabled = false },	--%%j
)>>%UserProfile%\Desktop\modoverrides.lua
rem 使用findstr命令找出本目录包括子目录下的modinfo.lua文件中以name开头的行，1\modinfo.lua:name2
rem 使用for语句提取1和2，以固定的形式导入modoverrides.lua（1为子目录名）

echo }>>%UserProfile%\Desktop\modoverrides.lua
echo.
echo.==================================================
echo.
echo.modoverrides.lua已经在桌面,避免误操作没直接放入指
echo.
echo.定位置,请放入:我的文档\klei\DoNotStarveTogether\
echo.
echo.        默认不启用任何mod，请自行修改！
echo.
echo.                佩剑的兔子 制作
echo.
echo.==================================================
echo.
pause
goto exit

:modsettings::模块2
cls
echo --Use the "ForceEnableMod" function when developing a mod. This will cause the>modsettings.lua
echo --game to load the mod every time no matter what, saving you the trouble of>>modsettings.lua
echo --re-enabling it from the main menu.>> modsettings.lua
echo.>>modsettings.lua
echo --Note! You shout NOT do this for normal mod loading. Please use the Mods menu>>modsettings.lua
echo --from the main screen instead.>>modsettings.lua
echo.>>modsettings.lua
echo --ForceEnableMod("kioskmode_dst")>>modsettings.lua
echo.>>modsettings.lua
echo --Use "EnableModDebugPrint()" to show extra information during startup.>>modsettings.lua
echo.>>modsettings.lua
echo --EnableModDebugPrint()>>modsettings.lua
echo.>>modsettings.lua
echo --以上为原文件内容，mod启用请在下面修改。>>modsettings.lua
echo --为注释，不影响使用。>> modsettings.lua
echo --默认不启用任何mod>> modsettings.lua
echo --删除行前注释字符--即为启用>> modsettings.lua
echo --佩剑的兔子 制作。感谢使用！>>modsettings.lua
echo.>>modsettings.lua
for /f "usebackq tokens=1,3 delims=\=" %%i in (`findstr /s "^name" modinfo.lua`) do echo --ForceEnableMod("%%i"),	--%%j>>modsettings.lua
echo.
echo.==================================================
echo.
echo.            modsettings.lua已经生成
echo.
echo                 默认不启用任何mod
echo.
echo.    启用某个mod，删除行前注释字符--即为启用
echo.
echo.                 佩剑的兔子 制作
echo.
echo.==================================================
echo.
pause
goto exit

:exit::结束模块
cls
echo.
echo.==================================================
echo.
echo.               感
echo.
echo                谢            再
echo.
echo.               使            见
echo.
echo.               用             !
echo.
echo.==================================================
echo.
pause
exit