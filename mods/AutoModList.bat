@echo off
title �Զ�����mod�б����˹���
mode con: cols=50 lines=18
COLOR 0a
set a=%~dp0
set a="%a:~-5%"
if %a%=="mods\" goto choice
::��⵱ǰĿ¼�Ƿ�Ϊmods\�������������

::����ģ��
echo.
echo.��ĵ�ǰĿ¼����ȷ
echo.���Զ���������
echo.�ļ����������mods�ļ�����
echo.
echo.|choice /c 8 /d 8 /t 8 /n 2>nul

echo.���Եȡ���
echo.���ڲ��Ҽ��ķ����mods�ļ���
for %%d in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do if exist %%d: (
	for /f "delims=b" %%i in ('dir /b/s %%d:\dontstarve_dedicated_server_nullrenderer.exe') do (
		if not exist "%%imods\AutoModList.bat" (
			copy /y "AutoModList.bat" "%%imods\AutoModList.bat">nul
			echo.
			echo.���ļ��ѷ��룺%%imods\
			echo.
			pause
		)
	)
)2>nul
del AutoModList.bat

:choice::ѡ��ģ�飡
cls
echo.
echo.==================================================
echo.
echo.��ʹ���������ַ������������mod�б�
echo.
echo. 	1��modoverrides.lua�б����Ƽ�����
echo.
echo. 	2��modsettings.lua�б���
echo.
echo. 	3������������Ժ��ٴ�����
echo.
echo.==================================================
echo.
set "input=."
set /p input=��ѡ��
	if "%input%"=="1" goto modoverrides
	if "%input%"=="2" goto modsettings
	if "%input%"=="3" goto exit
echo;�������������ѡ��
echo.|choice /c 5 /d 5 /t 5 /n 2>nul
goto choice
	
:modoverrides::ģ��1
cls
echo --Ϊע�ͣ���Ӱ��ʹ�á�mod���������Լ��޸ġ�> %UserProfile%\Desktop\modoverrides.lua
echo --true ����>> %UserProfile%\Desktop\modoverrides.lua
echo --false ������>> %UserProfile%\Desktop\modoverrides.lua
echo --�彣������ ��������лʹ�ã�>>%UserProfile%\Desktop\modoverrides.lua
echo return>> %UserProfile%\Desktop\modoverrides.lua
echo {>>%UserProfile%\Desktop\modoverrides.lua

for /f "usebackq tokens=1,3 delims=\=" %%i in (`findstr /s "^name" modinfo.lua`) do (
	echo 	["%%i"] = { enabled = false },	--%%j
)>>%UserProfile%\Desktop\modoverrides.lua
rem ʹ��findstr�����ҳ���Ŀ¼������Ŀ¼�µ�modinfo.lua�ļ�����name��ͷ���У�1\modinfo.lua:name2
rem ʹ��for�����ȡ1��2���Թ̶�����ʽ����modoverrides.lua��1Ϊ��Ŀ¼����

echo }>>%UserProfile%\Desktop\modoverrides.lua
echo.
echo.==================================================
echo.
echo.modoverrides.lua�Ѿ�������,���������ûֱ�ӷ���ָ
echo.
echo.��λ��,�����:�ҵ��ĵ�\klei\DoNotStarveTogether\
echo.
echo.        Ĭ�ϲ������κ�mod���������޸ģ�
echo.
echo.                �彣������ ����
echo.
echo.==================================================
echo.
pause
goto exit

:modsettings::ģ��2
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
echo --����Ϊԭ�ļ����ݣ�mod�������������޸ġ�>>modsettings.lua
echo --Ϊע�ͣ���Ӱ��ʹ�á�>> modsettings.lua
echo --Ĭ�ϲ������κ�mod>> modsettings.lua
echo --ɾ����ǰע���ַ�--��Ϊ����>> modsettings.lua
echo --�彣������ ��������лʹ�ã�>>modsettings.lua
echo.>>modsettings.lua
for /f "usebackq tokens=1,3 delims=\=" %%i in (`findstr /s "^name" modinfo.lua`) do echo --ForceEnableMod("%%i"),	--%%j>>modsettings.lua
echo.
echo.==================================================
echo.
echo.            modsettings.lua�Ѿ�����
echo.
echo                 Ĭ�ϲ������κ�mod
echo.
echo.    ����ĳ��mod��ɾ����ǰע���ַ�--��Ϊ����
echo.
echo.                 �彣������ ����
echo.
echo.==================================================
echo.
pause
goto exit

:exit::����ģ��
cls
echo.
echo.==================================================
echo.
echo.               ��
echo.
echo                л            ��
echo.
echo.               ʹ            ��
echo.
echo.               ��             !
echo.
echo.==================================================
echo.
pause
exit